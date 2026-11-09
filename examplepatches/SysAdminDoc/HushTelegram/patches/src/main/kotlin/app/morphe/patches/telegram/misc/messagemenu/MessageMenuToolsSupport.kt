/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.messagemenu

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.tgClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags

/** The extension class that holds the menu items with a choice or a job of their own. */
internal const val MESSAGE_MENU_TOOLS = "$EXTENSION_PACKAGE/misc/MessageMenuTools;"

private const val TOOLS_SEND_HELPER = "Lorg/telegram/messenger/SendMessagesHelper;"
private const val TOOLS_LIST = "Ljava/util/ArrayList;"
private const val TOOLS_OBJECT = "Ljava/lang/Object;"
private const val TOOLS_FILE = "Ljava/io/File;"
private const val TOOLS_MESSAGE = "Lorg/telegram/messenger/MessageObject;"
private const val TOOLS_MEDIA = "Lorg/telegram/tgnet/TLRPC\$MessageMedia;"
private const val TOOLS_PHOTO = "Lorg/telegram/tgnet/TLRPC\$Photo;"
private const val TOOLS_PHOTO_SIZE = "Lorg/telegram/tgnet/TLRPC\$PhotoSize;"
private const val TOOLS_DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
private const val TOOLS_TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"
private const val TOOLS_FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
private const val TOOLS_IMAGE_LOCATION = "Lorg/telegram/messenger/ImageLocation;"
private const val TOOLS_NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
private const val TOOLS_DRAWABLES = "Lorg/telegram/messenger/R\$drawable;"
private const val TOOLS_PATH_TO_ATTACH = "getPathToAttach(${TOOLS_TL_OBJECT}Z)$TOOLS_FILE"

/** FileLoader's public getPathToAttach(TLObject, boolean). The build makes it static, since it never reads its loader. */
private fun BytecodePatchContext.pathToAttach() = tgClassDefByOrNull(TOOLS_FILE_LOADER)?.methods?.filter {
    "${it.origName}${it.origDescriptor}" == TOOLS_PATH_TO_ATTACH && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
        !AccessFlags.ABSTRACT.isSet(it.accessFlags)
}?.singleOrNull()

/** Fails the patch cleanly when the extension's stubs or the Telegram members they reach are missing. */
internal fun BytecodePatchContext.resolveMessageMenuTools() {
    controlHook(MESSAGE_MENU_TOOLS, "forwardWith", listOf("I", TOOLS_LIST, "J", "Z", "Z"), "I")
    controlHook(MESSAGE_MENU_TOOLS, "video", listOf(TOOLS_OBJECT), "Z")
    controlHook(MESSAGE_MENU_TOOLS, "thumbs", listOf(TOOLS_OBJECT, "I"), TOOLS_LIST)
    controlHook(MESSAGE_MENU_TOOLS, "thumbFile", listOf(TOOLS_OBJECT, TOOLS_OBJECT, "I"), TOOLS_FILE)
    controlHook(MESSAGE_MENU_TOOLS, "thumbLoad", listOf(TOOLS_OBJECT, TOOLS_OBJECT, "I"), "V")
    controlHook(MESSAGE_MENU_TOOLS, "saveIcon", listOf(), "I")
    controlHook(MESSAGE_MENU_TOOLS, "deleteIcon", listOf(), "I")
    controlHook(MESSAGE_MENU_TOOLS, "music", listOf(TOOLS_OBJECT), "Z")
    controlHook(MESSAGE_MENU_TOOLS, "attachName", listOf(TOOLS_OBJECT), "Ljava/lang/String;")
    controlHook(MESSAGE_MENU_TOOLS, "cancelLoad", listOf(TOOLS_OBJECT), "V")
    controlHook(MESSAGE_MENU_TOOLS, "directory", listOf("I"), TOOLS_FILE)
    controlHook(MESSAGE_MENU_TOOLS, "refreshMedia", listOf(TOOLS_OBJECT, "Ljava/lang/String;"), "V")
    controlMembers(TOOLS_SEND_HELPER, "static getInstance(I)$TOOLS_SEND_HELPER", FORWARD_SEND.substringAfter("->"))
    controlMembers(TOOLS_MESSAGE, "isVideo()Z", "isMusic()Z", "checkMediaExistance()V")
    controlMembers(TOOLS_NOTIFICATIONS, "static getInstance(I)$TOOLS_NOTIFICATIONS", "postNotificationName(I[Ljava/lang/Object;)V", "static fileLoadFailed:I")
    controlMembers(TOOLS_MEDIA, "video_cover:$TOOLS_PHOTO")
    controlMembers(TOOLS_DOCUMENT, "thumbs:$TOOLS_LIST")
    controlMembers(
        TOOLS_FILE_LOADER, "static getAttachFileName($TOOLS_TL_OBJECT)Ljava/lang/String;", "static getDirectory(I)$TOOLS_FILE",
        "cancelLoadFile($TOOLS_DOCUMENT)V",
        "loadFile($TOOLS_IMAGE_LOCATION" + "${TOOLS_OBJECT}Ljava/lang/String;II)V",
    )
    controlShape(pathToAttach() != null, "$TOOLS_FILE_LOADER no longer has $TOOLS_PATH_TO_ATTACH")
    controlMembers(
        TOOLS_IMAGE_LOCATION, "static getForPhoto($TOOLS_PHOTO_SIZE$TOOLS_PHOTO)$TOOLS_IMAGE_LOCATION",
        "static getForDocument($TOOLS_PHOTO_SIZE$TOOLS_DOCUMENT)$TOOLS_IMAGE_LOCATION",
    )
    controlMembers(TOOLS_DRAWABLES, "static msg_download:I", "static msg_delete:I")
}

/**
 * Telegram's own forward with both flags the caller picks: the sender's name hidden (its "forward from
 * my name" argument) and captions dropped. Sound on, now, no stars agreed yet.
 */
internal fun BytecodePatchContext.writeMessageMenuToolsStubs() {
    // The full forward, as forwardTo calls it: 13.2 dropped the short overload.
    writeStub(MESSAGE_MENU_TOOLS, "forwardWith", 22, """
        invoke-static/range {p0 .. p0}, $TOOLS_SEND_HELPER->getInstance(I)$TOOLS_SEND_HELPER
        move-result-object v0
        move-object/from16 v1, p1
        move-wide/from16 v2, p2
        move/from16 v4, p4
        move/from16 v5, p5
        const/4 v6, 0x1
        const/4 v7, 0x0
        const/4 v8, 0x0
        const/4 v9, 0x0
        const/4 v10, -0x1
        const-wide/16 v11, 0x0
        const-wide/16 v13, 0x0
        const/4 v15, 0x0
        invoke-virtual/range {v0 .. v15}, $FORWARD_SEND
        move-result v0
        return v0
    """)
    writeStub(MESSAGE_MENU_TOOLS, "video", 2, """
        check-cast p0, $TOOLS_MESSAGE
        invoke-virtual {p0}, $TOOLS_MESSAGE->isVideo()Z
        move-result v0
        return v0
    """)
    // A video's cover (the chosen frame or picture Telegram shows first) when cover is 1, else the video's thumbnails.
    writeStub(MESSAGE_MENU_TOOLS, "thumbs", 4, """
        check-cast p0, $TOOLS_MESSAGE
        if-eqz p1, :hush_document
        invoke-static {p0}, $TOOLS_MESSAGE->getMedia($TOOLS_MESSAGE)$TOOLS_MEDIA
        move-result-object v0
        if-eqz v0, :hush_none
        iget-object v0, v0, $TOOLS_MEDIA->video_cover:$TOOLS_PHOTO
        if-eqz v0, :hush_none
        iget-object v0, v0, $TOOLS_PHOTO->sizes:$TOOLS_LIST
        return-object v0
        :hush_document
        invoke-virtual {p0}, $TOOLS_MESSAGE->getDocument()$TOOLS_DOCUMENT
        move-result-object v0
        if-eqz v0, :hush_none
        iget-object v0, v0, $TOOLS_DOCUMENT->thumbs:$TOOLS_LIST
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    // The picture's file by Telegram's own naming: force 0 is its media folder, force 1 its cache folder.
    val pathCall = if (AccessFlags.STATIC.isSet(pathToAttach()!!.accessFlags)) "invoke-static {p1, v1}" else "invoke-virtual {v0, p1, v1}"
    writeStub(MESSAGE_MENU_TOOLS, "thumbFile", 5, """
        check-cast p0, $TOOLS_MESSAGE
        check-cast p1, $TOOLS_PHOTO_SIZE
        iget v0, p0, $TOOLS_MESSAGE->currentAccount:I
        invoke-static {v0}, $TOOLS_FILE_LOADER->getInstance(I)$TOOLS_FILE_LOADER
        move-result-object v0
        const/4 v1, 0x0
        if-eqz p2, :hush_call
        const/4 v1, 0x1
        :hush_call
        $pathCall, $TOOLS_FILE_LOADER->$TOOLS_PATH_TO_ATTACH
        move-result-object v0
        return-object v0
    """)
    // Telegram's own download of the picture into its cache folder, at normal priority.
    writeStub(MESSAGE_MENU_TOOLS, "thumbLoad", 11, """
        check-cast p0, $TOOLS_MESSAGE
        check-cast p1, $TOOLS_PHOTO_SIZE
        move-object v2, p0
        iget v0, p0, $TOOLS_MESSAGE->currentAccount:I
        invoke-static {v0}, $TOOLS_FILE_LOADER->getInstance(I)$TOOLS_FILE_LOADER
        move-result-object v0
        if-eqz p2, :hush_document
        invoke-static {p0}, $TOOLS_MESSAGE->getMedia($TOOLS_MESSAGE)$TOOLS_MEDIA
        move-result-object v1
        if-eqz v1, :hush_end
        iget-object v1, v1, $TOOLS_MEDIA->video_cover:$TOOLS_PHOTO
        invoke-static {p1, v1}, $TOOLS_IMAGE_LOCATION->getForPhoto($TOOLS_PHOTO_SIZE$TOOLS_PHOTO)$TOOLS_IMAGE_LOCATION
        move-result-object v1
        goto :hush_load
        :hush_document
        invoke-virtual {p0}, $TOOLS_MESSAGE->getDocument()$TOOLS_DOCUMENT
        move-result-object v1
        invoke-static {p1, v1}, $TOOLS_IMAGE_LOCATION->getForDocument($TOOLS_PHOTO_SIZE$TOOLS_DOCUMENT)$TOOLS_IMAGE_LOCATION
        move-result-object v1
        :hush_load
        const/4 v3, 0x0
        const/4 v4, 0x1
        const/4 v5, 0x1
        invoke-virtual/range {v0 .. v5}, $TOOLS_FILE_LOADER->loadFile($TOOLS_IMAGE_LOCATION${TOOLS_OBJECT}Ljava/lang/String;II)V
        :hush_end
        return-void
    """)
    writeStub(MESSAGE_MENU_TOOLS, "saveIcon", 1, "sget v0, $TOOLS_DRAWABLES->msg_download:I\nreturn v0")
    writeStub(MESSAGE_MENU_TOOLS, "deleteIcon", 1, "sget v0, $TOOLS_DRAWABLES->msg_delete:I\nreturn v0")
    writeStub(MESSAGE_MENU_TOOLS, "music", 2, """
        check-cast p0, $TOOLS_MESSAGE
        invoke-virtual {p0}, $TOOLS_MESSAGE->isMusic()Z
        move-result v0
        return v0
    """)
    writeStub(MESSAGE_MENU_TOOLS, "attachName", 2, """
        check-cast p0, $TOOLS_MESSAGE
        invoke-virtual {p0}, $TOOLS_MESSAGE->getDocument()$TOOLS_DOCUMENT
        move-result-object v0
        if-eqz v0, :hush_none
        invoke-static {v0}, $TOOLS_FILE_LOADER->getAttachFileName($TOOLS_TL_OBJECT)Ljava/lang/String;
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    writeStub(MESSAGE_MENU_TOOLS, "cancelLoad", 3, """
        check-cast p0, $TOOLS_MESSAGE
        invoke-virtual {p0}, $TOOLS_MESSAGE->getDocument()$TOOLS_DOCUMENT
        move-result-object v0
        if-eqz v0, :hush_end
        iget v1, p0, $TOOLS_MESSAGE->currentAccount:I
        invoke-static {v1}, $TOOLS_FILE_LOADER->getInstance(I)$TOOLS_FILE_LOADER
        move-result-object v1
        invoke-virtual {v1, v0}, $TOOLS_FILE_LOADER->cancelLoadFile($TOOLS_DOCUMENT)V
        :hush_end
        return-void
    """)
    writeStub(MESSAGE_MENU_TOOLS, "directory", 2, """
        invoke-static {p0}, $TOOLS_FILE_LOADER->getDirectory(I)$TOOLS_FILE
        move-result-object v0
        return-object v0
    """)
    writeStub(MESSAGE_MENU_TOOLS, "refreshMedia", 6, """
        check-cast p0, $TOOLS_MESSAGE
        invoke-virtual {p0}, $TOOLS_MESSAGE->checkMediaExistance()V
        iget v0, p0, $TOOLS_MESSAGE->currentAccount:I
        invoke-static {v0}, $TOOLS_NOTIFICATIONS->getInstance(I)$TOOLS_NOTIFICATIONS
        move-result-object v0
        sget v1, $TOOLS_NOTIFICATIONS->fileLoadFailed:I
        const/4 v2, 0x2
        new-array v2, v2, [Ljava/lang/Object;
        const/4 v3, 0x0
        aput-object p1, v2, v3
        const/4 v3, 0x1
        invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v4
        aput-object v4, v2, v3
        invoke-virtual {v0, v1, v2}, $TOOLS_NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V
        return-void
    """)
}
