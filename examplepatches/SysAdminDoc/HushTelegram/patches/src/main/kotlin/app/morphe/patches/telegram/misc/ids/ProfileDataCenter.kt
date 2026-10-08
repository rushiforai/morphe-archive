/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import com.android.tools.smali.dexlib2.AccessFlags

internal const val PROFILE_DC = "$EXTENSION_PACKAGE/misc/ProfileDc;"
internal const val DC_ACCOUNTS = "Lorg/telegram/messenger/UserConfig;"
internal const val DC_PEERS = "Lorg/telegram/messenger/MessagesController;"
internal const val DC_USER = "Lorg/telegram/tgnet/TLRPC\$User;"
internal const val DC_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
internal const val DC_USER_PHOTO = "Lorg/telegram/tgnet/TLRPC\$UserProfilePhoto;"
internal const val DC_CHAT_PHOTO = "Lorg/telegram/tgnet/TLRPC\$ChatPhoto;"

/** The Telegram classes the data center bridges read. Fixture tests load these alongside the profile. */
internal val PROFILE_DC_TYPES = setOf(DC_ACCOUNTS, DC_PEERS, DC_USER, DC_CHAT, DC_USER_PHOTO, DC_CHAT_PHOTO)

/**
 * The data center row reads the photo Telegram already caches for the inspected user or chat and
 * that photo's dc_id. Every class, method and field it touches keeps its name in Telegram's build,
 * so a missing one refuses the patch instead of failing on the phone.
 */
internal fun BytecodePatchContext.resolveProfileDc() {
    controlHook(PROFILE_DC, "userPhotoDc", listOf("J"), "I")
    controlHook(PROFILE_DC, "chatPhotoDc", listOf("J"), "I")
    controlShape(PROFILE_DC_TYPES.all { type -> classDefByOrNull(type)?.let { AccessFlags.PUBLIC.isSet(it.accessFlags) } == true },
        "a class the data center row reads is missing or inaccessible")
    fun field(owner: String, name: String, type: String, static: Boolean) = classDefByOrNull(owner)!!.fields.any {
        it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static
    }
    fun lookup(name: String, parameter: String, result: String, static: Boolean) = classDefByOrNull(DC_PEERS)!!.methods.any {
        it.name == name && it.parameterTypes.joinToString("") == parameter && it.returnType == result &&
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static
    }
    controlShape(field(DC_ACCOUNTS, "selectedAccount", "I", true), "Telegram's selected account changed")
    controlShape(lookup("getInstance", "I", DC_PEERS, true) && lookup("getUser", "Ljava/lang/Long;", DC_USER, false) &&
        lookup("getChat", "Ljava/lang/Long;", DC_CHAT, false), "Telegram's cached users and chats changed")
    controlShape(field(DC_USER, "photo", DC_USER_PHOTO, false) && field(DC_CHAT, "photo", DC_CHAT_PHOTO, false) &&
        field(DC_USER_PHOTO, "dc_id", "I", false) && field(DC_CHAT_PHOTO, "dc_id", "I", false),
        "profile photos no longer name their data center")
}

/** Both bridges read the selected account's cache only, and answer 0 when the peer or its photo is missing. */
internal fun BytecodePatchContext.writeProfileDc() {
    writeStub(PROFILE_DC, "userPhotoDc", 4, photoDc("getUser", DC_USER, DC_USER_PHOTO))
    writeStub(PROFILE_DC, "chatPhotoDc", 4, photoDc("getChat", DC_CHAT, DC_CHAT_PHOTO))
}

private fun photoDc(lookup: String, peer: String, photo: String) = """
    sget v0, $DC_ACCOUNTS->selectedAccount:I
    invoke-static {v0}, $DC_PEERS->getInstance(I)$DC_PEERS
    move-result-object v0
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
    move-result-object v1
    invoke-virtual {v0, v1}, $DC_PEERS->$lookup(Ljava/lang/Long;)$peer
    move-result-object v0
    if-eqz v0, :hush_none
    iget-object v0, v0, $peer->photo:$photo
    if-eqz v0, :hush_none
    iget v0, v0, $photo->dc_id:I
    return v0
    :hush_none
    const/4 v0, 0x0
    return v0
"""
