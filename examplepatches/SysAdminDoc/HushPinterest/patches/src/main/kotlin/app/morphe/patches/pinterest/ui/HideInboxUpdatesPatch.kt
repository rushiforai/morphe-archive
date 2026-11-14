/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.freeLocalsAt
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Hide Inbox updates"

/** The endpoint the Updates feed asks for its page, named once, in the feed's constructor. */
internal const val INBOX_UPDATES_FEED = "news_hub/feed/"

/** The method the Inbox's presenter hands each of its sections to the page in. */
internal const val INBOX_ADD_SECTIONS = "addDataSources"

internal const val INBOX_UPDATES_HOOK = "$UI_HOOKS->hideInboxUpdates()Z"

/** The presenter's method, the call that adds Updates to the page, and a local nothing reads there. */
internal class InboxUpdates(val presenter: Method, val addAt: Int, val scratch: Int)

/**
 * The Inbox's presenter keeps the Updates feed in a field, and its [INBOX_ADD_SECTIONS] reads that
 * field and hands it to the page in one call that takes the feed alone. Skipping that call leaves
 * the section, header and all, out of the page, and since the feed is never added it never loads.
 * Messages and the rest of the Inbox are other sections, added by calls of their own.
 */
internal fun BytecodePatchContext.inboxUpdates(): InboxUpdates {
    val feed = methodsWithString(INBOX_UPDATES_FEED).filter { it.name == "<init>" }.one("$PATCH: the Updates feed").definingClass
    val presenters = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.fields.none { it.type == feed && !AccessFlags.STATIC.isSet(it.accessFlags) }) return@classDefForEach
        owner.methods.filterTo(presenters) {
            it.name == INBOX_ADD_SECTIONS && it.returnType == "V" && it.parameterTypes.size == 1 && it.implementation != null
        }
    }
    val presenter = presenters.one("$PATCH: the Inbox presenter's $INBOX_ADD_SECTIONS")
    val body = presenter.instructions()
    val addAt = body.indices.filter { at ->
        val read = body[at].takeIf { it.opcode == Opcode.IGET_OBJECT } ?: return@filter false
        if (((read as ReferenceInstruction).reference as FieldReference).type != feed) return@filter false
        val add = body.getOrNull(at + 1) ?: return@filter false
        val called = (add as? ReferenceInstruction)?.reference as? MethodReference ?: return@filter false
        add.opcode == Opcode.INVOKE_VIRTUAL && called.returnType == "V" && called.parameterTypes.size == 1 &&
            (add as FiveRegisterInstruction).registerCount == 2 && add.registerD == (read as TwoRegisterInstruction).registerA
    }.one("$PATCH: the call that adds Updates").let { it + 1 }
    if (addAt + 1 >= body.size) throw PatchException("$PATCH: nothing follows the call that adds Updates")
    val scratch = presenter.freeLocalsAt("$PATCH: the call that adds Updates", addAt, 1, listOf(addAt + 1), highest = 255).single()
    return InboxUpdates(presenter, addAt, scratch)
}

@Suppress("unused")
val hideInboxUpdatesPatch = bytecodePatch(
    name = PATCH,
    description = "Leaves the Updates section out of your Inbox, so it doesn't load. The pin ideas Pinterest puts there go, " +
        "and so do the activity updates in that section. Your messages stay. Starts off. Turn it on in HushPinterest settings > Notifications.",
) {
    category("Notifications")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("hideInboxUpdates")
        requireStatusMethod("inboxUpdates")
        val updates = inboxUpdates()
        val method = mutable(updates.presenter)
        val after = method.getInstruction(updates.addAt + 1)
        method.addInstructionsWithLabels(
            updates.addAt,
            """
                invoke-static {}, $INBOX_UPDATES_HOOK
                move-result v${updates.scratch}
                if-nez v${updates.scratch}, :hush_skip
            """,
            ExternalLabel("hush_skip", after),
        )
        enableCapability("inboxUpdates")
        enableStatus("hideInboxUpdates")
    }
}
