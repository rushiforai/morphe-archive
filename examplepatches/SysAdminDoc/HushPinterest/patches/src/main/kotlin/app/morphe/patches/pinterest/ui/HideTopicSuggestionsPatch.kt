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
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireParameterIntact
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Hide topic suggestions"

/**
 * Pinterest's log line for a topic row whose presenter is the wrong kind. It sits in the topic arm
 * of the binder, so it names the binder in both declared builds.
 */
internal const val TOPIC_BINDER_ANCHOR = "Presenter bound to BubblesListView must be of type BubblesListPresenter"

/** Where the row hook goes: the first instruction a discriminator with no switch arm runs. */
internal const val TOPIC_FALL_THROUGH = 2

internal const val TOPIC_ROW_HOOK = "$UI_HOOKS->topicSuggestions(Ljava/lang/Object;)V"
internal const val TOPIC_MEASURE_HOOK = "$UI_HOOKS->topicSuggestionsMeasureSpec(Landroid/view/View;I)I"

private val ANDROID_VIEWS = listOf("Landroid/view/", "Landroid/widget/")

private fun CharSequence.width() = if (toString() == "J" || toString() == "D") 2 else 1

/**
 * The binder's shape: an instance method answering nothing that reads an int field of its own
 * class from `this` first, switches on it with a packed-switch second, and logs [TOPIC_BINDER_ANCHOR].
 * One binder class serves several closeup sections, told apart by that field. Its packed-switch has
 * an arm for every section but the topic row, which has none and falls through to the instruction
 * after the switch.
 */
internal fun Method.isTopicBinder(): Boolean {
    val implementation = implementation ?: return false
    if (AccessFlags.STATIC.isSet(accessFlags) || returnType != "V" || parameterTypes.isEmpty()) return false
    if (!parameterTypes[0].startsWith("L")) return false
    val body = instructions()
    if (body.size <= TOPIC_FALL_THROUGH) return false
    val read = body[0]
    val field = (read as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    if (read.opcode != Opcode.IGET || field.definingClass != definingClass || field.type != "I") return false
    val self = implementation.registerCount - parameterTypes.sumOf { it.width() } - 1
    if ((read as TwoRegisterInstruction).registerB != self) return false
    val switch = body[1]
    if (switch.opcode != Opcode.PACKED_SWITCH || (switch as OneRegisterInstruction).registerA != read.registerA) return false
    return TOPIC_BINDER_ANCHOR in strings()
}

internal class TopicSuggestions(val binder: MutableMethod, val view: String, val row: MutableClass)

/**
 * The binder, the row's view class and the place for its measure hook, all found and checked
 * before anything changes.
 *
 * The topic arm starts by casting the binder's view parameter to an interface. The row's view is
 * the one class implementing that interface, a framework view. Pinterest adds it straight to its
 * grid, a RecyclerView, which lays out a GONE child like any other, so hiding the row takes a zero
 * measure as well as GONE. Neither declared build gives that class an onMeasure of its own.
 */
internal fun BytecodePatchContext.topicSuggestions(): TopicSuggestions {
    val found = methodsWithString(TOPIC_BINDER_ANCHOR).filter { it.isTopicBinder() }
    val binder = mutable(found.one("$PATCH: topic row binder"))
    val start = binder.implementation!!.instructions[TOPIC_FALL_THROUGH]
    if ((start as BuilderInstruction).location.labels.isNotEmpty()) {
        throw PatchException("$PATCH: the topic arm's first instruction is also a branch target")
    }
    // The hook reads the view parameter there and borrows nothing else, so that parameter has to
    // still be what the binder was handed.
    val view = binder.parameterRegister(0)
    val viewRegister = binder.implementation!!.registerCount - binder.parameterTypes.sumOf { it.width() }
    binder.requireParameterIntact(PATCH, 0, listOf(TOPIC_FALL_THROUGH))
    if (start.opcode != Opcode.CHECK_CAST || (start as OneRegisterInstruction).registerA != viewRegister) {
        throw PatchException("$PATCH: the topic arm no longer starts by casting the view it was handed")
    }
    val face = ((start as ReferenceInstruction).reference as TypeReference).type
    if (classDefByOrNull(face)?.let { AccessFlags.INTERFACE.isSet(it.accessFlags) } != true) {
        throw PatchException("$PATCH: the topic arm casts its view to $face, which is not an interface")
    }
    val implementers = mutableListOf<ClassDef>()
    classDefForEach { owner ->
        if (!owner.type.startsWith(EXTENSION_ROOT) && face in owner.interfaces) implementers += owner
    }
    val row = mutableClassDefBy(implementers.one("$PATCH: topic row view").type)
    if (!isFrameworkView(row)) throw PatchException("$PATCH: the topic row ${row.type} is not an Android view")
    requireOverride(row, "onMeasure", listOf("I", "I"))
    if (row.methods.any { it.name == "onMeasure" && it.parameters() == listOf("I", "I") }) {
        throw PatchException("$PATCH: the topic row ${row.type} measures itself, so its own onMeasure would need a different hook")
    }
    return TopicSuggestions(binder, view, row)
}

/** True when the class's first ancestor outside the APK is one of Android's view classes. */
private fun BytecodePatchContext.isFrameworkView(type: ClassDef): Boolean {
    val visited = mutableSetOf<String>()
    var ancestor = type.superclass
    while (ancestor != null && visited.add(ancestor)) {
        val outside = ancestor
        val owner = classDefByOrNull(outside) ?: return ANDROID_VIEWS.any { outside.startsWith(it) }
        ancestor = owner.superclass
    }
    return false
}

@Suppress("unused")
val hideTopicSuggestionsPatch = bytecodePatch(
    name = PATCH,
    description = "Hides the \"Ideas you might love\" row of topic bubbles under pins without leaving a gap. " +
        "Comments and related pins stay. Its switch starts off, so turn it on in HushPinterest settings.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())

    execute {
        requireStatusMethod("hideTopicSuggestions")
        requireStatusMethod("topicSuggestions")
        val found = topicSuggestions()
        found.binder.addInstructions(TOPIC_FALL_THROUGH, "invoke-static/range { ${found.view} .. ${found.view} }, $TOPIC_ROW_HOOK")
        addOverride(found.row, "onMeasure", listOf("I", "I"), """
            invoke-static { p0, p1 }, $TOPIC_MEASURE_HOOK
            move-result p1
            invoke-static { p0, p2 }, $TOPIC_MEASURE_HOOK
            move-result p2
        """)
        enableCapability("topicSuggestions")
        enableStatus("hideTopicSuggestions")
    }
}
