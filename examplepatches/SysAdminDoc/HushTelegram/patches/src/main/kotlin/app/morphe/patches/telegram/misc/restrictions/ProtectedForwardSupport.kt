/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.restrictions

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireLocals
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.forward.MESSAGE_TYPE
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.messagemenu.CopySend
import app.morphe.patches.telegram.misc.messagemenu.FORWARD_SEND
import app.morphe.patches.telegram.misc.messagemenu.copyCall
import app.morphe.patches.telegram.misc.messagemenu.requireShownDocumentFile
import app.morphe.patches.telegram.misc.messagemenu.resolveCopySends
import app.morphe.patches.telegram.misc.messagemenu.shownDocumentFile
import app.morphe.patches.telegram.misc.savedownloads.CONTROLLER_INSTANCE
import app.morphe.patches.telegram.misc.savedownloads.IS_ENCRYPTED
import app.morphe.patches.telegram.misc.savedownloads.NO_FORWARDS
import app.morphe.patches.telegram.misc.savedownloads.PEER_NO_FORWARDS
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origRef
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method

internal const val PROTECTED_FORWARD = "$EXTENSION_PACKAGE/misc/ProtectedForward;"
internal const val HELD = "$PROTECTED_FORWARD->held(Ljava/util/ArrayList;J)Ljava/util/ArrayList;"

private const val SEND_HELPER = "Lorg/telegram/messenger/SendMessagesHelper;"
private const val MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
private const val FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
private const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
private const val DIALOG_OBJECT = "Lorg/telegram/messenger/DialogObject;"
private const val ACCOUNT = "Lorg/telegram/messenger/AccountInstance;"
private const val STRING = "Ljava/lang/String;"
private const val FILE = "Ljava/io/File;"
private const val PHOTO = "Lorg/telegram/tgnet/TLRPC\$Photo;"
private const val PHOTO_SIZE = "Lorg/telegram/tgnet/TLRPC\$PhotoSize;"
private const val TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"
private const val IMAGE_LOCATION = "Lorg/telegram/messenger/ImageLocation;"
private const val ANDROID_UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
private const val LIST = "Ljava/util/ArrayList;"
private const val LOAD_DOCUMENT = "loadFile(${DOCUMENT}Ljava/lang/Object;II)V"
private const val LOAD_PHOTO = "loadFile(${IMAGE_LOCATION}Ljava/lang/Object;${STRING}II)V"
private const val PATH_TO_MESSAGE = "getPathToMessage($TL_MESSAGE)$FILE"
private const val MESSAGE_PHOTO = "getPhoto($TL_MESSAGE)$PHOTO"
private const val PHOTO_SIDE = "getPhotoSize(Z)I"
private const val CLOSEST_SIZE = "getClosestPhotoSizeWithSize(${LIST}IZ${PHOTO_SIZE}Z)$PHOTO_SIZE"
private const val FOR_PHOTO = "getForPhoto($PHOTO_SIZE$PHOTO)$IMAGE_LOCATION"
private const val ATTACH_NAME = "getAttachFileName($TL_OBJECT)$STRING"
private const val IS_LOADING = "isLoadingFile($STRING)Z"

/**
 * The size of the message's photo that getPathToMessage looks for, by the same call, so what's
 * downloaded is what's then found: the size in v1 and the photo in v2, using v1 to v5, and on to
 * :hush_none when there isn't one. getFileName picks by other arguments, so it can name another size.
 */
private const val PHOTO_FILE_SIZE = """
    iget-object v1, p0, $MESSAGE->messageOwner:$TL_MESSAGE
    if-eqz v1, :hush_none
    invoke-static {v1}, $MESSAGE->$MESSAGE_PHOTO
    move-result-object v2
    if-eqz v2, :hush_none
    iget-object v1, v2, $PHOTO->sizes:$LIST
    const/4 v3, 0x1
    invoke-static {v3}, $ANDROID_UTILITIES->$PHOTO_SIDE
    move-result v4
    const/4 v5, 0x0
    invoke-static {v1, v4, v5, v5, v3}, $FILE_LOADER->$CLOSEST_SIZE
    move-result-object v1
    if-eqz v1, :hush_none
"""

/**
 * prepareSendingVideo, which R8 left unnamed in 13.2, by the types at the positions the stub fills
 * and the order R8 sorted its parameters in: three ints (ttl, schedule date, repeat), four longs
 * (the chat first), the caption, the video's path and the cover's, entities, the account, three
 * messages (reply, topic, editing), suggestion, chat arguments, edit info, cover photo, story,
 * quote, then three booleans (send with sound first). Its body checks the path before anything.
 */
private val VIDEO_TYPES = mapOf(
    0 to "I", 1 to "I", 2 to "I", 3 to "J", 4 to "J", 5 to "J", 6 to "J", 7 to "Ljava/lang/CharSequence;",
    8 to STRING, 9 to STRING, 10 to "Ljava/util/ArrayList;", 11 to ACCOUNT, 12 to MESSAGE, 13 to MESSAGE, 14 to MESSAGE,
    15 to "Lorg/telegram/messenger/MessageSuggestionParams;", 16 to "Lorg/telegram/messenger/SendMessageChatArguments;",
    17 to "Lorg/telegram/messenger/VideoEditedInfo;", 18 to "Lorg/telegram/tgnet/TLRPC\$Photo;",
    19 to "Lorg/telegram/tgnet/tl/TL_stories\$StoryItem;", 21 to "Z", 22 to "Z", 23 to "Z",
)
private const val VIDEO_PATH = 8
internal const val VIDEO_ACCOUNT = 11

/**
 * What the protected forward needs from this Telegram: its forward, every member the stubs reach,
 * and the four sends. Throws a [PatchException] naming what's missing, before anything is changed.
 */
internal class ProtectedForwardSite(val forward: MutableMethod, val text: CopySend, val photo: CopySend, val video: CopySend, val document: CopySend, val pathIsStatic: Boolean)

internal fun BytecodePatchContext.resolveProtectedForward(): ProtectedForwardSite {
    val helper = tgMutableClassDefBy(SEND_HELPER)
    val forwardName = FORWARD_SEND.substringAfter("->")
    val forward = helper.methods.filter {
        "${it.origName}${it.origDescriptor}" == forwardName && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null
    }.controlSingle("Telegram's forward")
    forward.requireLocals("Bypass channel restrictions", 3)

    val (text, photo, document) = resolveCopySends() ?: throw PatchException("Local controls: the text, photo and file sends are missing (before editing)")
    val video = helper.methods.filter { it.isVideoSend() }.controlSingle("the video send")

    val pathIsStatic = tgClassDefByOrNull(FILE_LOADER)?.methods?.any {
        "${it.origName}${it.origDescriptor}" == PATH_TO_MESSAGE && AccessFlags.STATIC.isSet(it.accessFlags)
    } == true
    controlMembers(MESSAGE, "messageOwner:$TL_MESSAGE", "type:I", "currentAccount:I", "getDialogId()J",
        "getDocument()$DOCUMENT", "getDocumentName()$STRING", "static $MESSAGE_PHOTO")
    controlMembers(TL_MESSAGE, "message:$STRING", "noforwards:Z", "attachPath:$STRING")
    controlMembers(FILE_LOADER, "static getInstance(I)$FILE_LOADER", "${if (pathIsStatic) "static " else ""}$PATH_TO_MESSAGE", LOAD_DOCUMENT,
        LOAD_PHOTO, "static $CLOSEST_SIZE", "static $ATTACH_NAME", IS_LOADING)
    controlMembers(PHOTO, "sizes:$LIST")
    controlMembers(ANDROID_UTILITIES, "static $PHOTO_SIDE")
    controlMembers(IMAGE_LOCATION, "static $FOR_PHOTO")
    requireShownDocumentFile()
    controlMembers(CONTROLLER, "isPeerNoForwards(J)Z", "static getInstance(I)$CONTROLLER")
    controlMembers(DIALOG_OBJECT, "static isEncryptedDialog(J)Z")
    controlMembers(ACCOUNT, "static getInstance(I)$ACCOUNT")
    // Chat in the first long, the path in the first string, the caption, and send with sound.
    val videoSend = CopySend(video, mapOf(3 to "p1", 7 to "p4", VIDEO_PATH to "p3"), mapOf(21 to 1))
    return ProtectedForwardSite(forward, text, photo, videoSend, document, pathIsStatic)
}

private fun Method.isVideoSend(): Boolean {
    if (!AccessFlags.STATIC.isSet(accessFlags) || !AccessFlags.PUBLIC.isSet(accessFlags) || origReturnType != "V") return false
    val types = origParameterTypes
    if (types.size != 24 || VIDEO_TYPES.any { (i, t) -> types[i] != t }) return false
    val code = implementation?.instructions?.toList() ?: return false
    val path = parameterRegisterNumber(VIDEO_PATH)
    return code.size > 2 && code[0].opcode == Opcode.IF_EQZ && code[0].namedRegisters() == listOf(path) &&
        code[1].origRef() == "Ljava/lang/String;->length()I" && code[1].namedRegisters() == listOf(path) &&
        code.any { it.origRef() == "Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V" }
}

/** Writes ProtectedForward's stubs, then sends every forward through it first. */
internal fun BytecodePatchContext.applyProtectedForward(site: ProtectedForwardSite) {
    writeStub(PROTECTED_FORWARD, "secret", 3, """
        invoke-static {p0, p1}, $IS_ENCRYPTED
        move-result v0
        return v0
    """)
    // The same check as the message menu's: the message's own flag, then its chat's, never a secret chat's.
    writeStub(PROTECTED_FORWARD, "restricted", 4, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDialogId()J
        move-result-wide v1
        invoke-static {v1, v2}, $IS_ENCRYPTED
        move-result v0
        if-nez v0, :hush_no
        iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v0, :hush_no
        iget-boolean v0, v0, $NO_FORWARDS
        if-nez v0, :hush_yes
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-virtual {v0, v1, v2}, $PEER_NO_FORWARDS
        move-result v0
        return v0
        :hush_yes
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    writeStub(PROTECTED_FORWARD, "type", 2, "check-cast p0, $MESSAGE\niget v0, p0, $MESSAGE_TYPE\nreturn v0")
    writeStub(PROTECTED_FORWARD, "account", 2, "check-cast p0, $MESSAGE\niget v0, p0, $MESSAGE->currentAccount:I\nreturn v0")
    for ((name, field) in listOf("text" to "message", "attachPath" to "attachPath")) {
        writeStub(PROTECTED_FORWARD, name, 2, """
            check-cast p0, $MESSAGE
            iget-object v0, p0, $MESSAGE->messageOwner:$TL_MESSAGE
            if-eqz v0, :hush_none
            iget-object v0, v0, $TL_MESSAGE->$field:$STRING
            return-object v0
            :hush_none
            const/4 v0, 0x0
            return-object v0
        """)
    }
    writeStub(PROTECTED_FORWARD, "documentName", 2, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDocumentName()$STRING
        move-result-object v0
        return-object v0
    """)
    val path = if (site.pathIsStatic) "invoke-static {v1}" else """
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $FILE_LOADER->getInstance(I)$FILE_LOADER
        move-result-object v0
        invoke-virtual {v0, v1}
    """.trimIndent()
    writeStub(PROTECTED_FORWARD, "messageFile", 4, """
        check-cast p0, $MESSAGE
        ${shownDocumentFile()}
        iget-object v1, p0, $MESSAGE->messageOwner:$TL_MESSAGE
        if-eqz v1, :hush_none
        $path, $FILE_LOADER->$PATH_TO_MESSAGE
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    // The download a tap on the file starts, at the same priority, kept where Telegram looks for it.
    writeStub(PROTECTED_FORWARD, "load", 7, """
        check-cast p0, $MESSAGE
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $FILE_LOADER->getInstance(I)$FILE_LOADER
        move-result-object v0
        invoke-virtual {p0}, $MESSAGE->getDocument()$DOCUMENT
        move-result-object v1
        if-eqz v1, :hush_photo
        const/4 v2, 0x2
        const/4 v3, 0x0
        invoke-virtual {v0, v1, p0, v2, v3}, $FILE_LOADER->$LOAD_DOCUMENT
        const/4 v0, 0x1
        return v0
        :hush_photo
        $PHOTO_FILE_SIZE
        invoke-static {v1, v2}, $IMAGE_LOCATION->$FOR_PHOTO
        move-result-object v1
        if-eqz v1, :hush_none
        move-object v2, p0
        const/4 v3, 0x0
        const/4 v4, 0x2
        const/4 v5, 0x0
        invoke-virtual/range {v0 .. v5}, $FILE_LOADER->$LOAD_PHOTO
        const/4 v0, 0x1
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    // By the name of what load fetches. Telegram's own name for a photo can be another size's.
    writeStub(PROTECTED_FORWARD, "loading", 7, """
        check-cast p0, $MESSAGE
        invoke-virtual {p0}, $MESSAGE->getDocument()$DOCUMENT
        move-result-object v1
        if-nez v1, :hush_name
        $PHOTO_FILE_SIZE
        :hush_name
        check-cast v1, $TL_OBJECT
        invoke-static {v1}, $FILE_LOADER->$ATTACH_NAME
        move-result-object v1
        iget v0, p0, $MESSAGE->currentAccount:I
        invoke-static {v0}, $FILE_LOADER->getInstance(I)$FILE_LOADER
        move-result-object v0
        invoke-virtual {v0, v1}, $FILE_LOADER->$IS_LOADING
        move-result v0
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    // Stub parameter registers: text (I, J, String) takes 4, photo and video 5, document 6.
    copyCall(site.text, 4).let { (smali, regs) -> writeStub(PROTECTED_FORWARD, "sendText", regs, smali) }
    copyCall(site.photo, 5).let { (smali, regs) -> writeStub(PROTECTED_FORWARD, "sendPhoto", regs, smali) }
    copyCall(site.video, 5, VIDEO_ACCOUNT).let { (smali, regs) -> writeStub(PROTECTED_FORWARD, "sendVideo", regs, smali) }
    copyCall(site.document, 6).let { (smali, regs) -> writeStub(PROTECTED_FORWARD, "sendFile", regs, smali) }

    // The extension answers the messages left for Telegram to forward, or null when it sent them all.
    site.forward.addInstructions(0, """
        move-object/from16 v0, p1
        move-wide/from16 v1, p2
        invoke-static {v0, v1, v2}, $HELD
        move-result-object v0
        if-nez v0, :hush_keep
        const/4 v1, 0x0
        return v1
        :hush_keep
        move-object/16 p1, v0
    """)
}
