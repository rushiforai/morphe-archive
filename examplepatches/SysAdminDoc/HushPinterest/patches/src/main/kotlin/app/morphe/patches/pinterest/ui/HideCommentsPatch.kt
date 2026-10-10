/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.ClassDef

internal val COMMENT_MODULE_RESOURCES = listOf(
    setOf("pin_closeup_unified_comments_module", "unified_comments_module_container"),
    setOf("pin_closeup_new_comments_module", "new_comments_module_container"),
)
internal const val PIN_CLOSEUP_BASE_MODULE = "Lcom/pinterest/activity/pin/view/modules/PinCloseupBaseModule;"

internal fun ClassDef.commentResourceNames() = methods.flatMap { it.fields() }.map { it.name }.toSet()

internal fun ClassDef.isCommentsModule(): Boolean {
    if (methods.none { it.name == "getComponentType" && it.parameterTypes.isEmpty() &&
        it.fields().any { field -> field.name == "PIN_CLOSEUP_COMMENTS" } }) return false
    val resources = commentResourceNames()
    return COMMENT_MODULE_RESOURCES.any { resources.containsAll(it) }
}

@Suppress("unused")
val hideCommentsPatch = bytecodePatch(
    name = "Hide comments",
    description = "Collapses the comments and comment previews under pins. It doesn't change who can comment on " +
        "your pins. Good for a quieter pin page. Starts off. Turn it on in HushPinterest settings > " +
        "Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideComments")
        requireStatusMethod("comments")
        val modules = mutableListOf<ClassDef>()
        classDefForEach { if (it.isCommentsModule()) modules += it }
        val selected = COMMENT_MODULE_RESOURCES.map { resources ->
            modules.filter { it.commentResourceNames().containsAll(resources) }
                .one("Comments module with dedicated layout ${resources.first()}")
        }
        if (selected.first().fields.none { it.type == COMMENT_PREVIEW }) {
            throw PatchException("Comments module must own its dedicated layout, container, and preview")
        }
        selected.forEach { module ->
            var parent = module.superclass
            val visited = mutableSetOf<String>()
            while (parent != PIN_CLOSEUP_BASE_MODULE && parent != null && visited.add(parent)) {
                parent = classDefByOrNull(parent)?.superclass
            }
            if (parent != PIN_CLOSEUP_BASE_MODULE) throw PatchException("Comments module must inherit PinCloseupBaseModule")
        }
        val views = (selected.map { it.type } + COMMENT_PREVIEW).map { mutableClassDefBy(it) }
        views.forEach { view ->
            requireOverride(view, "setVisibility", listOf("I"))
            requireOverride(view, "onMeasure", listOf("I", "I"))
        }
        val zones = methodsWithString("CommentsZone(isVisible=").filter { it.name == "toString" }
        if (zones.size > 1) throw PatchException("Comments zone identity is ambiguous")
        val zone = zones.singleOrNull()?.let { description ->
            mutableClassDefBy(description.definingClass).methods.filter {
                it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == "Z" && it.implementation != null
            }.one("Comments zone constructor")
        }
        views.forEach { collapseView(it, "comments") }
        zone?.let {
            val visible = it.parameterRegister(0)
            it.addInstructions(0, """
                invoke-static/range { $visible .. $visible }, $UI_HOOKS->commentsVisible(Z)Z
                move-result $visible
            """)
        }
        enableCapability("comments")
        enableStatus("hideComments")
    }
}
