/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags

internal const val SPECIAL_CONTACTS = "$EXTENSION_PACKAGE/misc/SpecialContacts;"
internal const val SC_CONTROLLER = DC_PEERS
internal const val SC_BASE = "Lorg/telegram/messenger/BaseController;"
internal const val SC_PUT_USER_PARAMETERS = "${DC_USER}ZZ"
internal const val SC_UPDATES_PARAMETERS = "Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;ZI"
internal const val SC_USER_HOOK = "$SPECIAL_CONTACTS->user(Ljava/lang/Object;Ljava/lang/Object;I)V"
internal const val SC_UPDATES_HOOK = "$SPECIAL_CONTACTS->updates(Ljava/lang/Object;Ljava/lang/Object;)V"

/** The two MessagesController methods Special contacts reads from, each with a hook at its first instruction. */
internal class SpecialContactsHook(val putUser: MutableMethod, val updates: MutableMethod) {
    fun applyTo() {
        // putUser(user, fromCache, force): the controller, the user, and whether it came from Telegram's database.
        putUser.addInstructions(0, "invoke-static/range {p0 .. p2}, $SC_USER_HOOK")
        // processUpdateArray(updates, users, chats, fromGetDifference, date): the controller and the updates.
        updates.addInstructions(0, "invoke-static/range {p0 .. p1}, $SC_UPDATES_HOOK")
    }
}

private class NoSpecialContacts(why: String) : Exception(why)

private fun specialNeeded(ok: Boolean, why: String) {
    if (!ok) throw NoSpecialContacts(why)
}

/**
 * Special contacts reads what Telegram already receives: every user MessagesController.putUser
 * stores, and every update processUpdateArray applies. A hook goes first thing in each, where
 * nothing branches back, and reads only its parameters. A build where either method, the account
 * field the extension reads or the hooks themselves can't be found keeps the rest of the patch.
 *
 * @return the hook, and null; or null and why there's none
 */
internal fun BytecodePatchContext.resolveSpecialContacts(): Pair<SpecialContactsHook?, String?> = try {
    Pair(specialContactsHook(), null)
} catch (missing: NoSpecialContacts) {
    Pair(null, missing.message)
} catch (missing: PatchException) {
    Pair(null, missing.message)
}

private fun BytecodePatchContext.specialContactsHook(): SpecialContactsHook {
    requireStatusMethod("specialContacts")
    controlHook(SPECIAL_CONTACTS, "user", listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "I"), "V")
    controlHook(SPECIAL_CONTACTS, "updates", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")
    val base = tgClassDefByOrNull(SC_BASE)
    specialNeeded(base != null && base.fields.any { it.origName == "currentAccount" && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) },
        "$SC_BASE->currentAccount is no longer the account a controller serves")
    val controller = tgMutableClassDefByOrNull(SC_CONTROLLER)
    specialNeeded(controller != null, "MessagesController is missing")
    fun one(name: String, parameters: String) = controller!!.methods.filter {
        it.origName == name && it.origParameterTypes.joinToString("") == parameters && it.origReturnType == "Z" &&
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    }.let { found ->
        specialNeeded(found.size == 1, "MessagesController.$name is missing or ambiguous")
        found.single()
    }
    val putUser = one("putUser", SC_PUT_USER_PARAMETERS)
    val updates = one("processUpdateArray", SC_UPDATES_PARAMETERS)
    for (method in listOf(putUser, updates)) {
        val flow = ControlFlow.of(method)
        specialNeeded(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it },
            "something jumps back to the start of MessagesController.${method.origName}")
        method.requireThisIntact("Special contacts", listOf(0))
    }
    return SpecialContactsHook(putUser, updates)
}
