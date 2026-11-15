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
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.patchLog
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal val COMMENT_MODULE_RESOURCES = listOf(
    setOf("pin_closeup_unified_comments_module", "unified_comments_module_container"),
    setOf("pin_closeup_new_comments_module", "new_comments_module_container"),
)
internal const val PIN_CLOSEUP_BASE_MODULE = "Lcom/pinterest/activity/pin/view/modules/PinCloseupBaseModule;"

/** The row of suggested replies next to the comment box. Obfuscation leaves its name alone. */
internal const val COMMENTS_QUICK_REPLIES = "Lcom/pinterest/activity/pin/view/unifiedcomments/CommentsQuickReplies;"

/**
 * The row of photos people added to their comments, at the top of the unified comments module
 * under a pin. Only that module holds one, and only its content layout inflates it.
 */
internal const val COMMENTS_IMAGES = "Lcom/pinterest/activity/pin/view/unifiedcomments/CommentsImagesView;"

/** The chip Pinterest builds each suggested reply as. */
internal const val SMALL_PRIMARY_BUTTON = "Lcom/pinterest/gestalt/button/view/GestaltButton\$SmallPrimaryButton;"
private const val LINEAR_LAYOUT = "Landroid/widget/LinearLayout;"

internal fun ClassDef.commentResourceNames() = methods.flatMap { it.fields() }.map { it.name }.toSet()

internal fun ClassDef.isCommentsModule(): Boolean {
    if (methods.none { it.name == "getComponentType" && it.parameterTypes.isEmpty() &&
        it.fields().any { field -> field.name == "PIN_CLOSEUP_COMMENTS" } }) return false
    val resources = commentResourceNames()
    return COMMENT_MODULE_RESOURCES.any { resources.containsAll(it) }
}

/** The first ancestor of [type] that isn't in the APK, which for a view is the Android class it builds on. */
private fun BytecodePatchContext.firstOutsideAncestor(type: ClassDef): String? {
    val visited = mutableSetOf<String>()
    var ancestor = type.superclass
    while (ancestor != null && visited.add(ancestor)) {
        val owner = classDefByOrNull(ancestor) ?: return ancestor
        ancestor = owner.superclass
    }
    return null
}

/**
 * The row of suggested replies by the comment box, checked by type and shape rather than by any
 * text it shows: a LinearLayout with one method that builds its GestaltButton chips, reading the
 * comment_templates_ strings. Both layouts that hold it in 14.41.0 put it in a HorizontalScrollView
 * sized to it, and nothing sets the row's visibility, so its zero measure is what folds the scroller too.
 */
internal fun BytecodePatchContext.suggestedReplies(): MutableClass {
    val row = classDefByOrNull(COMMENTS_QUICK_REPLIES) ?: throw PatchException("no suggested replies row $COMMENTS_QUICK_REPLIES")
    val base = firstOutsideAncestor(row)
    if (base != LINEAR_LAYOUT) throw PatchException("the suggested replies row builds on $base, not $LINEAR_LAYOUT")
    row.methods.filter { method ->
        method.instructions().any {
            it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == SMALL_PRIMARY_BUTTON
        }
    }.one("the suggested replies chip builder")
    if (row.methods.none { method -> method.fields().any { it.name.startsWith("comment_templates_") && it.type == "I" } }) {
        throw PatchException("the suggested replies row reads no comment_templates_ strings")
    }
    val view = mutableClassDefBy(COMMENTS_QUICK_REPLIES)
    requireOverride(view, "setVisibility", listOf("I"))
    requireOverride(view, "onMeasure", listOf("I", "I"))
    return view
}

@Suppress("unused")
val hideCommentsPatch = bytecodePatch(
    name = "Hide comments",
    description = "Collapses the comments and comment previews under pins. It doesn't change who can comment on " +
        "your pins. Good for a quieter pin page. Hide comment previews, a separate switch, hides only the " +
        "previews and comment photos, so the comment box and the way into all comments stay. Another switch " +
        "hides the suggested replies next to the comment box. All three start off. Turn them on in " +
        "HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideComments")
        requireStatusMethod("comments")
        requireStatusMethod("suggestedReplies")
        requireStatusMethod("commentPreviews")
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
        val views = selected.map { mutableClassDefBy(it.type) }
        // The previews collapse under either switch: Hide comments hides them with the module, and
        // Hide comment previews hides only them, leaving the module's title, comment box and button.
        // The photo row is part of them where the module holds one.
        val previewTypes = listOf(COMMENT_PREVIEW) + if (selected.first().fields.any { it.type == COMMENTS_IMAGES }) {
            listOf(COMMENTS_IMAGES)
        } else {
            patchLog.warning("Hide comments: the comments module holds no $COMMENTS_IMAGES, so Hide comment previews leaves comment photos.")
            emptyList()
        }
        val previews = previewTypes.map { mutableClassDefBy(it) }
        (views + previews).forEach { view ->
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
        // The suggested replies have their own switch, so a build where the row can't be pinned down
        // still gets Hide comments, just without that second switch.
        val replies = try {
            suggestedReplies()
        } catch (missing: PatchException) {
            patchLog.warning("Hide comments: ${missing.message}. Hide suggested replies isn't in this build.")
            null
        }
        // The second module shows nothing but one quoted comment, the community insight line, and
        // taps into the comments like the action bar's comment button does, so it is a preview too.
        collapseView(views.first(), "comments")
        (views.drop(1) + previews).forEach { collapseView(it, "commentPreviews") }
        replies?.let { collapseView(it, "suggestedReplies") }
        zone?.let {
            val visible = it.parameterRegister(0)
            it.addInstructions(0, """
                invoke-static/range { $visible .. $visible }, $UI_HOOKS->commentsVisible(Z)Z
                move-result $visible
            """)
        }
        enableCapability("comments")
        enableCapability("commentPreviews")
        if (replies != null) enableCapability("suggestedReplies")
        enableStatus("hideComments")
    }
}
