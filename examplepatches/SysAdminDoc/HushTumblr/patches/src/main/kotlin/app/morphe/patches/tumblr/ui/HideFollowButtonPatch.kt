/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.sameAs
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.parameterRegister
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.requireLocals
import app.morphe.patches.tumblr.misc.extension.requireParameterIntact
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.returnEarlyWhen
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val PATCH = "Hide the Follow button"
internal const val HIDE_FOLLOW_HOOK = "$POST_PARTS->hideFollowButton()Z"
internal const val TRAIL_FOLLOW_HOOK = "$POST_PARTS->trailFollow(Ljava/lang/Object;)Ljava/lang/Object;"

/** A post card's header. A view named in Tumblr's layouts, so R8 keeps its name. */
internal const val POST_CARD_HEADER = "Lcom/tumblr/ui/widget/PostCardHeader;"

/** The Follow action a server-sent header button can carry. An enum constant, read by name from JSON. */
internal const val FOLLOW_ACTION = "Lcom/tumblr/rumblr/model/post/PostHeaderAction\$ActionType;"

/** The header of one entry in a reblog trail. R8 keeps its name in the builds read so far. */
internal const val REBLOG_HEADER = "Lcom/tumblr/ui/widget/graywater/viewholder/ReblogHeaderViewHolder;"

/** The id of the Follow button in a reblog trail entry's header layout. */
private const val HEADER_CTA_IDS = "Lcom/tumblr/R\$id;"
private const val HEADER_CTA = "header_cta"

private const val SET_VISIBILITY = "Landroid/view/View;->setVisibility(I)V"

/**
 * Puts `PostParts.hideFollowButton` first in the header's check for whether its Follow button
 * stays hidden, and answers yes at once while the switch is on. Tumblr asks it when it binds the
 * header, where yes hides the Follow button (and its twin on blazed posts with a follow goal), and
 * for a server-sent Follow action in the header, where yes leaves the action out. Tumblr answers yes
 * itself for your own posts and blogs you already follow, so this is the path those take. The
 * switch is read each time a header is bound, so it works without a restart.
 *
 * The check is the one method of [POST_CARD_HEADER] that the header's Follow action test calls:
 * that test is the one instance method of the header returning a boolean that reads the FOLLOW
 * constant of [FOLLOW_ACTION], and the check is its one direct call to a header method taking two
 * parameters and returning a boolean. Found by reading Tumblr 46.5.0.109 (2026-10-11).
 *
 * Each entry of a reblog trail has a header of its own ([REBLOG_HEADER]) with its own Follow button,
 * which that check never sees. [resolveTrailFollow] finds the method that shows it, and
 * `PostParts.trailFollow` hands that method no trail entry while the switch is on, so Tumblr hides
 * the button the way it does when there's nobody to follow.
 */
@Suppress("unused")
val hideFollowButtonPatch = bytecodePatch(
    name = PATCH,
    description = "Takes the Follow button out of the header of posts from blogs you don't follow yet." +
        " Starts off. Turn it on in Tumblr settings > HushTumblr > Posts.",
    default = true,
) {
    category("Posts")
    dependsOn(settingsPatch, tumblrExtensionPatch)
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("hideFollowButton")
        requireStatusMethod("followButton")
        // Found and checked before any edit, so a refusal leaves the APK as it was.
        val check = resolveFollowButtonCheck()
        val trail = resolveTrailFollow()
        check.returnEarlyWhen(PATCH, HIDE_FOLLOW_HOOK, "const/4 v0, 0x1\nreturn v0")
        val entry = trail.method.parameterRegister(trail.parameter)
        trail.method.addInstructions(
            0,
            """
                invoke-static {$entry}, $TRAIL_FOLLOW_HOOK
                move-result-object $entry
                check-cast $entry, ${trail.type}
            """,
        )
        enableCapability("followButton")
        enableStatus("hideFollowButton")
    }
}

/** The header's Follow button check, throwing when this build has none, several, or one with no local. */
internal fun BytecodePatchContext.resolveFollowButtonCheck(): MutableMethod {
    requireExtensionHook(PATCH, HIDE_FOLLOW_HOOK)
    val header = classDefByOrNull(POST_CARD_HEADER)
        ?: throw PatchException("$PATCH: Tumblr's $POST_CARD_HEADER wasn't found")
    val actionTest = header.methods
        .filter { method ->
            !method.isStatic() && method.returnType == "Z" &&
                method.instructionList().any {
                    it.opcode == Opcode.SGET_OBJECT && it.fieldRef()?.let { field ->
                        field.definingClass == FOLLOW_ACTION && field.name == "FOLLOW"
                    } == true
                }
        }
        .only(PATCH, "the header's Follow action test")
    val check = actionTest.instructionList()
        .filter { it.opcode == Opcode.INVOKE_DIRECT }
        .mapNotNull { it.methodRef() }
        .filter { it.definingClass == POST_CARD_HEADER && it.returnType == "Z" && it.parameterTypes.size == 2 }
        .distinctBy { "${it.name}(${it.parameterTypes.joinToString("")})" }
        .only(PATCH, "the header's Follow button check")
    return mutableOf(check).also { it.requireLocals(PATCH, 1) }
}

/** The method that shows a reblog trail entry's Follow button, and which of its declared parameters is the entry. */
internal class TrailFollowSite(val method: MutableMethod, val parameter: Int) {
    val type: String get() = method.parameterTypes[parameter].toString()
}

/**
 * The method that shows a reblog trail entry's Follow button, throwing when this build has none,
 * several, or one the hook can't go in front of.
 *
 * [REBLOG_HEADER]'s constructor keeps the view it finds by [HEADER_CTA] in a field, and one method of
 * the header hands that field out. The method wanted takes the header, asks it for the button, sets
 * the button's visibility more than once (shown and hidden), and tests one object parameter, the
 * trail entry: the button shows when there is one and goes when there isn't. Tumblr calls it only
 * when the header should offer Follow. In 46.9.1.100 that's `wyg.u`, called from `wyg.P`; the
 * header's other user of the button, `wyg.O`, only ever hides it. Found by reading Tumblr
 * 46.9.1.100 (2026-11-02).
 */
internal fun BytecodePatchContext.resolveTrailFollow(): TrailFollowSite {
    requireExtensionHook(PATCH, TRAIL_FOLLOW_HOOK)
    val header = classDefByOrNull(REBLOG_HEADER) ?: throw PatchException("$PATCH: Tumblr's $REBLOG_HEADER wasn't found")
    val button = header.methods
        .filter { it.name == "<init>" }
        .mapNotNull { constructor -> constructor.instructionList().headerCtaField() }
        .distinct()
        .only(PATCH, "the reblog header's Follow button field")
    val getter = header.methods
        .filter { method ->
            val body = method.instructionList()
            !method.isStatic() && method.parameterTypes.isEmpty() && body.size == 2 &&
                body[0].opcode == Opcode.IGET_OBJECT && body[0].fieldRef()?.let { "${it.name}:${it.type}" } == button &&
                body[1].opcode == Opcode.RETURN_OBJECT
        }
        .only(PATCH, "the reblog header's Follow button getter")
    val shows = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(shows) { method ->
            method.parameterTypes.any { it.toString() == REBLOG_HEADER } && method.showsButton(getter)
        }
    }
    val shower = shows.only(PATCH, "the method that shows a reblog trail entry's Follow button")
    val body = shower.instructionList()
    val tests = body.indices.filter { body[it].opcode == Opcode.IF_EQZ || body[it].opcode == Opcode.IF_NEZ }
    val (entry, readAt) = shower.parameterTypes.indices
        .filter { index -> shower.parameterTypes[index].let { it.startsWith("L") && it.toString() != REBLOG_HEADER } }
        .mapNotNull { index ->
            val register = shower.parameterRegisterNumber(index)
            tests.filter { (body[it] as OneRegisterInstruction).registerA == register }
                .takeIf { it.isNotEmpty() }?.let { index to it }
        }
        .only(PATCH, "the trail entry the Follow button is shown for")
    shower.requireParameterIntact(PATCH, entry, readAt)
    requireShape(
        PATCH,
        shower.parameterRegisterNumber(entry) <= 15,
        "the trail entry is in v${shower.parameterRegisterNumber(entry)}, past what the added call can name",
    )
    return TrailFollowSite(mutableOf(shower), entry)
}

/** `name:type` of the field the instruction after loading [HEADER_CTA] puts the found view in, or null. */
private fun List<Instruction>.headerCtaField(): String? {
    val id = indexOfFirst { instruction ->
        instruction.opcode == Opcode.SGET && instruction.fieldRef()?.let {
            it.definingClass == HEADER_CTA_IDS && it.name == HEADER_CTA
        } == true
    }
    if (id < 0) return null
    val kept = drop(id).firstOrNull { it.opcode == Opcode.IPUT_OBJECT } ?: return null
    return kept.fieldRef()?.takeIf { it.definingClass == REBLOG_HEADER }?.let { "${it.name}:${it.type}" }
}

/** Whether the method asks [getter] for the button and sets a view's visibility more than once. */
private fun Method.showsButton(getter: Method): Boolean {
    val body = instructionList()
    return body.any { it.methodRef()?.sameAs(getter) == true } &&
        body.count { it.methodRef()?.let { ref -> "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}" } == SET_VISIBILITY } > 1
}
