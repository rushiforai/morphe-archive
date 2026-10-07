/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val UI_HOOKS = "$EXTENSION_PACKAGE/ui/UiHooks;"
internal const val INTERFACE_CONTROLS = "$EXTENSION_PACKAGE/ui/InterfaceControls;"
internal const val HEADER_BAR = "Lcom/pinterest/gestalt/headerBar/GestaltHeaderBar;"
internal const val PIN_MENU = "Lcom/pinterest/feature/gridactions/modal/view/PinOverflowMenuModalImpl;"
internal val SEARCH_HISTORY_VIEWS = listOf(
    "Lcom/pinterest/feature/search/landing/view/SlpRecentSearchCell;",
    "Lcom/pinterest/feature/search/typeahead/view/SearchTypeaheadRecentSearchesCarouselView;",
    "Lcom/pinterest/feature/search/typeahead/view/SearchTypeaheadRecentSearchPillView;",
)
internal const val COMMENT_PREVIEW = "Lcom/pinterest/activity/pin/view/unifiedcomments/CommentPreviewView;"

internal fun Method.instructions() = implementation?.instructions?.toList().orEmpty()
internal fun Method.strings() = instructions().mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
}
internal fun Method.fields() = instructions().mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? FieldReference)
}
internal fun Method.calls() = instructions().mapNotNull {
    ((it as? ReferenceInstruction)?.reference as? MethodReference)
}
internal fun MethodReference.parameters() = parameterTypes.map(CharSequence::toString)

internal fun BytecodePatchContext.methodsWithString(text: String) = classDefByStrings(text).flatMap { owner ->
    owner.methods.filter { text in it.strings() }
}

internal fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).methods.single {
    it.name == method.name && it.returnType == method.returnType && it.parameters() == method.parameters()
}

internal fun <T> List<T>.one(what: String): T = singleOrNull()
    ?: throw PatchException("$what: expected one exact target, found $size")

/** Refuse a final or abstract method before adding an override. */
internal fun BytecodePatchContext.requireOverride(view: MutableClass, name: String, parameters: List<String>) {
    val own = view.methods.singleOrNull { it.name == name && it.parameters() == parameters }
    if (own != null) {
        if (own.implementation == null) throw PatchException("${view.type}->$name has no implementation")
        return
    }
    var ancestor = view.superclass
    while (ancestor != null) {
        val owner = classDefByOrNull(ancestor) ?: break
        val method = owner.methods.singleOrNull { it.name == name && it.parameters() == parameters }
        if (method != null && AccessFlags.FINAL.isSet(method.accessFlags)) {
            throw PatchException("${view.type} cannot override final $ancestor->$name")
        }
        ancestor = owner.superclass
    }
}

/** Specific views are always zero-sized while their family is enabled. */
internal fun BytecodePatchContext.collapseView(view: MutableClass, helper: String) {
    for ((name, parameters, suffix) in listOf(
        Triple("setVisibility", listOf("I"), "Visibility"),
        Triple("onMeasure", listOf("I", "I"), "MeasureSpec"),
    )) {
        requireOverride(view, name, parameters)
        val code = parameters.indices.joinToString("\n") { index ->
            val register = "p${index + 1}"
            "invoke-static/range { $register .. $register }, $UI_HOOKS->$helper$suffix(I)I\nmove-result $register"
        }
        val own = view.methods.singleOrNull { it.name == name && it.parameters() == parameters }
        if (own != null) own.addInstructions(0, code)
        else addOverride(view, name, parameters, code)
    }
}

internal fun BytecodePatchContext.refreshOnMeasure(view: MutableClass, helper: String) {
    val parameters = listOf("I", "I")
    requireOverride(view, "onMeasure", parameters)
    val code = "invoke-static/range { p0 .. p0 }, $INTERFACE_CONTROLS->$helper(Landroid/view/View;)V"
    val own = view.methods.singleOrNull { it.name == "onMeasure" && it.parameters() == parameters }
    if (own != null) own.addInstructions(0, code)
    else addOverride(view, "onMeasure", parameters, code)
}

/** Adds [name] to [view], running [prefix] and then the superclass's own [name] with the same arguments. */
internal fun addOverride(view: MutableClass, name: String, parameters: List<String>, prefix: String) {
    val method = ImmutableMethod(
        view.type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, "V",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(parameters.size + 1),
    ).toMutable()
    method.addInstructions(0, """
        $prefix
        invoke-super/range { p0 .. p${parameters.size} }, ${view.superclass}->$name(${parameters.joinToString("")})V
        return-void
    """)
    view.methods.add(method)
}
