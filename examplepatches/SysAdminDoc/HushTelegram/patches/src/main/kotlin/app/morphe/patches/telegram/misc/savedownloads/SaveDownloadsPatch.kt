/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.downloadspeed.LOAD_OPERATION
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val SAVE_DOWNLOADS = "$EXTENSION_PACKAGE/misc/SaveDownloads;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val FILE = "Ljava/io/File;"
internal const val FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
internal const val LOADER_DELEGATE = "Lorg/telegram/messenger/FileLoader\$FileLoaderDelegate;"
internal const val SET_DELEGATE = "$FILE_LOADER->setDelegate($LOADER_DELEGATE)V"
internal const val FILE_LOADED = "fileDidLoaded($STRING$FILE${OBJECT}I)V"
internal const val IMAGE_LOADER = "Lorg/telegram/messenger/ImageLoader;"
internal const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
internal const val DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
internal const val TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
internal const val DIALOG_OBJECT = "Lorg/telegram/messenger/DialogObject;"
internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val GET_DOCUMENT = "$MESSAGE_OBJECT->getDocument()$DOCUMENT"
internal const val IS_SECRET_MEDIA = "$MESSAGE_OBJECT->isSecretMedia()Z"
internal const val IS_MUSIC = "$MESSAGE_OBJECT->isMusic()Z"
internal const val IS_DOCUMENT = "$MESSAGE_OBJECT->isDocument()Z"
internal const val IS_GIF = "$MESSAGE_OBJECT->isGif()Z"
internal const val IS_ROUND_VIDEO = "$MESSAGE_OBJECT->isRoundVideo()Z"
internal const val IS_VOICE = "$MESSAGE_OBJECT->isVoice()Z"
internal const val MESSAGE_OWNER = "$MESSAGE_OBJECT->messageOwner:$TL_MESSAGE"
internal const val NO_FORWARDS = "$TL_MESSAGE->noforwards:Z"
internal const val GET_DIALOG_ID = "$MESSAGE_OBJECT->getDialogId()J"
internal const val CURRENT_ACCOUNT = "$MESSAGE_OBJECT->currentAccount:I"
internal const val IS_ENCRYPTED = "$DIALOG_OBJECT->isEncryptedDialog(J)Z"
internal const val CONTROLLER_INSTANCE = "$MESSAGES_CONTROLLER->getInstance(I)$MESSAGES_CONTROLLER"
internal const val PEER_NO_FORWARDS = "$MESSAGES_CONTROLLER->isPeerNoForwards(J)Z"
internal const val ATTACH_NAME = "$FILE_LOADER->getAttachFileName(Lorg/telegram/tgnet/TLObject;)$STRING"
internal const val DOCUMENT_NAME = "$FILE_LOADER->getDocumentFileName($DOCUMENT)$STRING"
internal const val MESSAGES_STORAGE = "Lorg/telegram/messenger/MessagesStorage;"
internal const val STORAGE_INSTANCE = "$MESSAGES_STORAGE->getInstance(I)$MESSAGES_STORAGE"
internal const val STORED_MESSAGE = "$MESSAGES_STORAGE->getMessage(JJ)$TL_MESSAGE"
internal const val NEW_MESSAGE_OBJECT = "$MESSAGE_OBJECT-><init>(I${TL_MESSAGE}ZZ)V"
internal const val TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"
internal const val IS_PHOTO = "$MESSAGE_OBJECT->isPhoto()Z"
internal const val IS_VIDEO = "$MESSAGE_OBJECT->isVideo()Z"
internal const val PHOTO_THUMBS = "$MESSAGE_OBJECT->photoThumbs:Ljava/util/ArrayList;"
internal const val ANDROID_UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
internal const val PHOTO_SIZE = "$ANDROID_UTILITIES->getPhotoSize()I"
internal const val CLOSEST_PHOTO_SIZE = "$FILE_LOADER->getClosestPhotoSizeWithSize(Ljava/util/ArrayList;I)Lorg/telegram/tgnet/TLRPC\$PhotoSize;"
internal const val PATH_SAVE_DATA = "$LOAD_OPERATION->pathSaveData:Lorg/telegram/messenger/FilePathDatabase\$PathData;"
internal const val CACHE_FILE_TEMP = "$LOAD_OPERATION->cacheFileTemp:$FILE"
internal const val FINISH_LOADING = "onFinishLoadingFile(ZIZ)V"
/** FileLoader's parser for the key the background download queue hands over instead of the message. */
internal const val SENT_KEY = "sent_.*_([0-9]+)_([0-9]+)_([0-9]+)_([0-9]+)"

@Suppress("unused")
val saveDownloadsPatch = bytecodePatch(
    name = "Save downloaded files",
    description = "Copies each file and song you download to Download/Telegram on your phone, where file managers and " +
        "other apps can open it, the way Save to Downloads does one at a time. Files from secret chats and from chats " +
        "that don't allow saving stay in Telegram. Starts off. Turn it on in HushTelegram settings > Playback.",
    default = true,
) {
    category("Playback")
    dependsOn(settingsPatch, telegramExtensionPatch, storageFolderManifestPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val callback = resolveSaveDownloads()
        val finishing = resolveFoundFiles()
        val account = delegateAccount(callback)
        requireGalleryFolderRuntime()
        val gallery = resolveGalleryFolder()
        requireStorageFolderRuntime()
        val storage = resolveStorageFolder()
        val older = resolveOlderFiles()
        val olderLoads = resolveOlderLoads()
        // Assembled on copies first, so a refusal leaves the app untouched.
        insertSaveDownloadsHook(MutableMethod(ImmutableMethod.of(callback)), account)
        insertFoundFileHook(MutableMethod(ImmutableMethod.of(finishing)))
        if (gallery.missing == null) gallery.rehearse()
        if (storage.missing == null) storage.rehearse()
        if (storage.missing == null && older.missing == null) older.rehearse()
        if (storage.missing == null && olderLoads.missing == null) olderLoads.rehearse()
        insertSaveDownloadsHook(callback, account)
        insertFoundFileHook(finishing)
        if (storage.missing == null) {
            storage.apply()
            if (older.missing == null) {
                older.apply()
            } else {
                patchLog.warning("Save downloaded files: ${older.missing}. Files from before the storage folder moved download again.")
            }
            if (olderLoads.missing == null) {
                olderLoads.apply()
            } else {
                patchLog.warning("Save downloaded files: ${olderLoads.missing}. Photos and videos from before the storage folder moved download again.")
            }
            enableCapability("storageFolder")
        } else {
            patchLog.warning("Save downloaded files: ${storage.missing}. The patch goes on without the storage folder.")
        }
        writeSaveDownloadsStubs()
        if (gallery.missing == null) {
            gallery.apply()
            enableCapability("galleryFolder")
            if (gallery.olderMissing != null) {
                patchLog.warning("Save downloaded files: ${gallery.olderMissing}. Saves on Android 9 and older keep Telegram's folders.")
            }
        } else {
            patchLog.warning("Save downloaded files: ${gallery.missing}. The patch goes on without the gallery folder choice.")
        }
        enableStatus("saveDownloads")
    }
}

/**
 * Ahead of anything in the callback, the extension sees the delegate's account, the downloader's
 * name for the file, the file and its parent. v0 is a local the callback writes before it reads.
 */
internal fun insertSaveDownloadsHook(method: MutableMethod, account: String) {
    method.addInstructions(0, """
        iget v0, p0, $account
        invoke-static {v0, p1, p2, p3}, $SAVE_DOWNLOADS->fileLoaded(I$STRING$FILE$OBJECT)V
    """)
}

/**
 * Ahead of anything in onFinishLoadingFile, the extension sees whether Telegram stores the document
 * under its own name with no path saved, the file a download went into, and the finished file.
 * v0 to v2 are locals the method writes before it reads, below p0.
 */
internal fun insertFoundFileHook(method: MutableMethod) {
    method.addInstructions(0, """
        move-object/from16 v2, p0
        iget-object v0, v2, $PATH_SAVE_DATA
        iget-object v1, v2, $CACHE_FILE_TEMP
        iget-object v2, v2, $STORAGE_CACHE_FINAL
        invoke-static {v0, v1, v2}, $SAVE_DOWNLOADS->finishing($OBJECT$FILE$FILE)V
    """)
}

/**
 * FileLoadOperation.start counts a file as downloaded when one is already at its path at the size
 * Telegram expects, and for a document with no path saved that path is its own name in Telegram
 * Files, which another document of that name and size can have. It then calls
 * onFinishLoadingFile(increment, code, preload) with nothing in cacheFileTemp, which only start
 * sets, to the file a download goes into. The extension keeps such a file out of Downloads when
 * fileDidLoaded comes for it, since it may be another document's.
 */
internal fun BytecodePatchContext.resolveFoundFiles(): MutableMethod {
    controlHook(SAVE_DOWNLOADS, "finishing", listOf(OBJECT, FILE, FILE), "V")
    val owner = mutableClassDefByOrNull(LOAD_OPERATION)
    controlShape(owner != null, "FileLoadOperation is missing")
    val fields = owner!!.instanceFields.map { "${it.definingClass}->${it.name}:${it.type}" }.toSet()
    controlShape(PATH_SAVE_DATA in fields && CACHE_FILE_TEMP in fields && STORAGE_CACHE_FINAL in fields,
        "FileLoadOperation's file fields changed")
    val finishing = owner.methods.filter { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == FINISH_LOADING }
        .controlSingle("FileLoadOperation.onFinishLoadingFile")
    controlShape(!AccessFlags.STATIC.isSet(finishing.accessFlags) && finishing.controlBody().isNotEmpty(),
        "FileLoadOperation.onFinishLoadingFile has no body of its own")
    controlShape(finishing.implementation!!.registerCount - 4 >= 3, "FileLoadOperation.onFinishLoadingFile's registers changed")
    val writers = owner.methods.filter { method ->
        method.controlBody().any { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == CACHE_FILE_TEMP }
    }
    controlShape(writers.map { it.name } == listOf("start"), "FileLoadOperation's download file isn't set in start alone")
    return finishing
}

/** ImageLoader makes one delegate per account and keeps that account in its one int field. */
internal fun BytecodePatchContext.delegateAccount(callback: MutableMethod): String {
    val delegate = mutableClassDefBy(callback.definingClass)
    val field = delegate.instanceFields.filter { it.type == "I" }.controlSingle("the download callback's account")
    return "${field.definingClass}->${field.name}:I"
}

private fun BytecodePatchContext.writeSaveDownloadsStubs() {
    writeStub(SAVE_DOWNLOADS, "messageDocument", 2, """
        instance-of v0, p0, $MESSAGE_OBJECT
        if-eqz v0, :hush_none
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $GET_DOCUMENT
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
    // MessageObject's own isDocument already leaves out stickers, videos, songs and voice messages.
    writeStub(SAVE_DOWNLOADS, "fileOrSong", 2, """
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $IS_SECRET_MEDIA
        move-result v0
        if-nez v0, :hush_no
        invoke-virtual {p0}, $IS_MUSIC
        move-result v0
        if-nez v0, :hush_yes
        invoke-virtual {p0}, $IS_DOCUMENT
        move-result v0
        if-eqz v0, :hush_no
        invoke-virtual {p0}, $IS_GIF
        move-result v0
        if-nez v0, :hush_no
        invoke-virtual {p0}, $IS_ROUND_VIDEO
        move-result v0
        if-nez v0, :hush_no
        invoke-virtual {p0}, $IS_VOICE
        move-result v0
        if-nez v0, :hush_no
        :hush_yes
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    // FileLoader.canSaveToPublicStorage's rules: the message, a secret chat, then the chat's own setting.
    writeStub(SAVE_DOWNLOADS, "savingForbidden", 4, """
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $MESSAGE_OWNER
        if-eqz v0, :hush_forbidden
        iget-boolean v0, v0, $NO_FORWARDS
        if-nez v0, :hush_forbidden
        invoke-virtual {p0}, $GET_DIALOG_ID
        move-result-wide v1
        invoke-static {v1, v2}, $IS_ENCRYPTED
        move-result v0
        if-nez v0, :hush_forbidden
        iget v0, p0, $CURRENT_ACCOUNT
        invoke-static {v0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-virtual {v0, v1, v2}, $PEER_NO_FORWARDS
        move-result v0
        return v0
        :hush_forbidden
        const/4 v0, 0x1
        return v0
    """)
    // A secret chat keeps its files in Telegram even with the switch for chats that don't allow saving on.
    // A message that can't say which chat it's in counts as one.
    writeStub(SAVE_DOWNLOADS, "secretChat", 3, """
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $MESSAGE_OWNER
        if-eqz v0, :hush_secret
        invoke-virtual {p0}, $GET_DIALOG_ID
        move-result-wide v0
        invoke-static {v0, v1}, $IS_ENCRYPTED
        move-result v0
        return v0
        :hush_secret
        const/4 v0, 0x1
        return v0
    """)
    // A photo or a video, never self-destructing media, a GIF or a round video (#29).
    writeStub(SAVE_DOWNLOADS, "photoOrVideo", 2, """
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $IS_SECRET_MEDIA
        move-result v0
        if-nez v0, :hush_no
        invoke-virtual {p0}, $IS_GIF
        move-result v0
        if-nez v0, :hush_no
        invoke-virtual {p0}, $IS_ROUND_VIDEO
        move-result v0
        if-nez v0, :hush_no
        invoke-virtual {p0}, $IS_PHOTO
        move-result v0
        if-nez v0, :hush_yes
        invoke-virtual {p0}, $IS_VIDEO
        move-result v0
        return v0
        :hush_yes
        const/4 v0, 0x1
        return v0
        :hush_no
        const/4 v0, 0x0
        return v0
    """)
    // View-once and timed media, in any chat; the extension keeps secret chats out itself (#9).
    writeStub(SAVE_DOWNLOADS, "timedMedia", 2, """
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $IS_SECRET_MEDIA
        move-result v0
        return v0
    """)
    // The size a chat shows and Save to Gallery saves, the way ChatMessageCell picks it.
    writeStub(SAVE_DOWNLOADS, "photo", 3, """
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $PHOTO_THUMBS
        invoke-static {}, $PHOTO_SIZE
        move-result v1
        invoke-static {v0, v1}, $CLOSEST_PHOTO_SIZE
        move-result-object v0
        return-object v0
    """)
    // A document, or a photo's size: FileLoader names both the same way.
    writeStub(SAVE_DOWNLOADS, "attachName", 1, """
        check-cast p0, $TL_OBJECT
        invoke-static {p0}, $ATTACH_NAME
        move-result-object p0
        return-object p0
    """)
    writeStub(SAVE_DOWNLOADS, "documentName", 1, """
        check-cast p0, $DOCUMENT
        invoke-static {p0}, $DOCUMENT_NAME
        move-result-object p0
        return-object p0
    """)
    // The way MessagesStorage wraps a stored message itself: no layout, no media check.
    writeStub(SAVE_DOWNLOADS, "storedMessage", 8, """
        invoke-static {p0}, $STORAGE_INSTANCE
        move-result-object v0
        int-to-long v2, p3
        invoke-virtual {v0, p1, p2, v2, v3}, $STORED_MESSAGE
        move-result-object v1
        if-eqz v1, :hush_none
        new-instance v0, $MESSAGE_OBJECT
        const/4 v2, 0x0
        invoke-direct {v0, p0, v1, v2, v2}, $NEW_MESSAGE_OBJECT
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
}

/** The types ImageLoader creates in the method that hands FileLoader its delegate. */
internal fun ClassDef.delegateCandidates(): List<String> =
    methods.filter { method -> method.controlBody().any { it.controlRef() == SET_DELEGATE } }
        .flatMap { method -> method.controlBody().filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.controlRef() } }
        .distinct()

/**
 * ImageLoader gives each account's FileLoader a delegate, and FileLoader calls its fileDidLoaded
 * with the downloader's name for the file, the finished file, what it was downloaded for and its
 * type, on FileLoader's own queue, once a download is done and before Telegram's UI hears of it.
 * A file Telegram auto-downloads while its chat is closed comes from the background queue, whose
 * parent is only a "sent_" key naming the chat, the message and its type, so the extension reads
 * that message back from MessagesStorage. The stubs call Telegram's own checks from the
 * extension's package, so each one has to be public.
 */
internal fun BytecodePatchContext.resolveSaveDownloads(): MutableMethod {
    requireStatusMethod("saveDownloads")
    controlHook(SAVE_DOWNLOADS, "fileLoaded", listOf("I", STRING, FILE, OBJECT), "V")
    controlHook(SAVE_DOWNLOADS, "storedMessage", listOf("I", "J", "I"), OBJECT)
    controlHook(SAVE_DOWNLOADS, "messageDocument", listOf(OBJECT), OBJECT)
    controlHook(SAVE_DOWNLOADS, "fileOrSong", listOf(OBJECT), "Z")
    controlHook(SAVE_DOWNLOADS, "savingForbidden", listOf(OBJECT), "Z")
    controlHook(SAVE_DOWNLOADS, "secretChat", listOf(OBJECT), "Z")
    controlHook(SAVE_DOWNLOADS, "photoOrVideo", listOf(OBJECT), "Z")
    controlHook(SAVE_DOWNLOADS, "photo", listOf(OBJECT), OBJECT)
    controlHook(SAVE_DOWNLOADS, "timedMedia", listOf(OBJECT), "Z")
    controlHook(SAVE_DOWNLOADS, "attachName", listOf(OBJECT), STRING)
    controlHook(SAVE_DOWNLOADS, "documentName", listOf(OBJECT), STRING)

    val images = mutableClassDefByOrNull(IMAGE_LOADER)
    controlShape(images != null, "ImageLoader is missing")
    val delegate = images!!.delegateCandidates()
        .mapNotNull { mutableClassDefByOrNull(it) }
        .filter { LOADER_DELEGATE in it.interfaces }
        .controlSingle("ImageLoader's download callback")
    val callback = delegate.methods.filter { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == FILE_LOADED }
        .controlSingle("the finished-download callback")
    controlShape(!AccessFlags.STATIC.isSet(callback.accessFlags) && callback.controlBody().isNotEmpty(),
        "the finished-download callback has no body of its own")
    // The hook borrows v0 ahead of the callback's own code and passes four registers by number.
    val locals = callback.implementation!!.registerCount - 5
    controlShape(locals >= 1 && locals + 4 <= 16, "the finished-download callback's registers changed")

    // Telegram's own Save to Downloads rules read the same three facts the stubs do.
    val loader = mutableClassDefByOrNull(FILE_LOADER)
    controlShape(loader != null && loader.methods.any { method ->
        val refs = method.controlBody().mapNotNull { it.controlRef() }
        PEER_NO_FORWARDS in refs && IS_ENCRYPTED in refs && NO_FORWARDS in refs
    }, "Telegram's rules for saving a file outside the app changed")
    // The extension reads the background queue's key the way FileLoader does, and knows a file and a song by type.
    controlShape(loader!!.methods.any { method -> method.controlBody().any { it.controlString() == SENT_KEY } },
        "the background download key changed")
    val types = mutableClassDefByOrNull(MESSAGE_OBJECT)?.staticFields
        ?.associate { it.name to (it.initialValue as? IntEncodedValue)?.value }.orEmpty()
    controlShape(types["TYPE_FILE"] == 9 && types["TYPE_MUSIC"] == 14 && types["TYPE_PHOTO"] == 1 && types["TYPE_VIDEO"] == 3
            && types["TYPE_VOICE"] == 2 && types["TYPE_ROUND_VIDEO"] == 5,
        "Telegram's message types changed")

    for ((reference, static) in listOf(GET_DOCUMENT to false, IS_SECRET_MEDIA to false, IS_MUSIC to false,
        IS_DOCUMENT to false, IS_GIF to false, IS_ROUND_VIDEO to false, IS_VOICE to false, MESSAGE_OWNER to false,
        NO_FORWARDS to false, GET_DIALOG_ID to false, CURRENT_ACCOUNT to false, IS_ENCRYPTED to true,
        CONTROLLER_INSTANCE to true, PEER_NO_FORWARDS to false, ATTACH_NAME to true, DOCUMENT_NAME to true,
        STORAGE_INSTANCE to true, STORED_MESSAGE to false, NEW_MESSAGE_OBJECT to false, IS_PHOTO to false,
        IS_VIDEO to false, PHOTO_THUMBS to false, PHOTO_SIZE to true, CLOSEST_PHOTO_SIZE to true)) {
        requireReachable(reference, static)
    }
    return callback
}
