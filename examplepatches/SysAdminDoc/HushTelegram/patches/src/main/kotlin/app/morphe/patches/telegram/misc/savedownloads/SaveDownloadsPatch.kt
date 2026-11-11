/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.TelegramNames
import app.morphe.util.names.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.downloadspeed.LOAD_OPERATION
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origType
import app.morphe.util.names.origString
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val SAVE_DOWNLOADS = "$EXTENSION_PACKAGE/misc/SaveDownloads;"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val FILE = "Ljava/io/File;"
internal const val FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
internal const val IMAGE_LOADER = "Lorg/telegram/messenger/ImageLoader;"
internal const val RUN_ON_UI_THREAD = "Lorg/telegram/messenger/AndroidUtilities;->runOnUIThread(Ljava/lang/Runnable;)V"
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
/** What the two-argument form forwards to with (false, null, false); 13.2 inlines the short forms into their callers. */
internal const val CLOSEST_PHOTO_SIZE_FULL = "$FILE_LOADER->getClosestPhotoSizeWithSize(Ljava/util/ArrayList;IZLorg/telegram/tgnet/TLRPC\$PhotoSize;Z)Lorg/telegram/tgnet/TLRPC\$PhotoSize;"
internal const val PATH_SAVE_DATA = "$LOAD_OPERATION->pathSaveData:Lorg/telegram/messenger/FilePathDatabase\$PathData;"
internal const val CACHE_FILE_TEMP = "$LOAD_OPERATION->cacheFileTemp:$FILE"
private const val SET_TYPE = "setType"
private const val MESSAGE_TYPE = "$MESSAGE_OBJECT->type:I"
private const val IS_VOICE_MESSAGE = "$MESSAGE_OBJECT->isVoiceMessage(${TL_MESSAGE})Z"
private const val IS_VIDEO_MESSAGE = "$MESSAGE_OBJECT->isVideoMessage(${TL_MESSAGE})Z"
private const val MEDIA_DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaDocument;"
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
        requireGalleryFolderRuntime()
        val gallery = resolveGalleryFolder()
        requireStorageFolderRuntime()
        val storage = resolveStorageFolder()
        val older = resolveOlderFiles()
        val olderLoads = resolveOlderLoads()
        // Assembled on copies first, so a refusal leaves the app untouched.
        insertSaveDownloadsHook(MutableMethod(ImmutableMethod.of(callback.method)), callback)
        insertFoundFileHook(MutableMethod(ImmutableMethod.of(finishing)))
        if (gallery.missing == null) gallery.rehearse()
        if (storage.missing == null) storage.rehearse()
        if (storage.missing == null && older.missing == null) older.rehearse()
        if (storage.missing == null && olderLoads.missing == null) olderLoads.rehearse()
        insertSaveDownloadsHook(callback.method, callback)
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
 * FileLoader's finished-download callback, where the build inlines ImageLoader's fileDidLoaded:
 * [method] hands the delegate's UI work to runOnUIThread at [at], and [registers] hold the
 * delegate's account, the downloader's name for the file, the file and its parent there.
 */
internal class DownloadCallback(val method: MutableMethod, val at: Int, val registers: List<Int>)

/**
 * Just before Telegram's UI hears of the finished download, the extension sees the delegate's
 * account, the downloader's name for the file, the file and its parent, from the registers the
 * delegate's own runnable is built from.
 */
internal fun insertSaveDownloadsHook(method: MutableMethod, callback: DownloadCallback) {
    val (account, name, file, parent) = callback.registers
    method.addInstructions(callback.at,
        "invoke-static {v$account, v$name, v$file, v$parent}, $SAVE_DOWNLOADS->fileLoaded(I$STRING$FILE$OBJECT)V")
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
    val owner = tgMutableClassDefByOrNull(LOAD_OPERATION)
    controlShape(owner != null, "FileLoadOperation is missing")
    val fields = owner!!.instanceFields.map { "${it.origDefiningClass}->${it.origName}:${it.origType}" }.toSet()
    // The build merges FilePathDatabase.PathData into another class, so its field keeps only the
    // table's own name for it.
    val pathData = TelegramNames.of(this).field(LOAD_OPERATION, "pathSaveData", PATH_SAVE_DATA.substringAfter(':'))
    val pathSaved = PATH_SAVE_DATA in fields || owner.instanceFields.any { field ->
        field.name == pathData.name && field.type == pathData.descriptor &&
            field.origDefiningClass == LOAD_OPERATION && field.origName == "pathSaveData"
    }
    controlShape(pathSaved && CACHE_FILE_TEMP in fields && STORAGE_CACHE_FINAL in fields,
        "FileLoadOperation's file fields changed")
    // The build drops onFinishLoadingFile's unused result code: (increment, code, preload) or (increment, preload).
    val finishing = owner.methods.filter {
        it.origName == "onFinishLoadingFile" && it.origReturnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) in listOf(listOf("Z", "I", "Z"), listOf("Z", "Z"))
    }.controlSingle("FileLoadOperation.onFinishLoadingFile")
    controlShape(!AccessFlags.STATIC.isSet(finishing.accessFlags) && finishing.controlBody().isNotEmpty(),
        "FileLoadOperation.onFinishLoadingFile has no body of its own")
    controlShape(finishing.localRegisterCount() >= 3, "FileLoadOperation.onFinishLoadingFile's registers changed")
    val writers = owner.methods.filter { method ->
        method.controlBody().any { it.opcode == Opcode.IPUT_OBJECT && it.controlRef() == CACHE_FILE_TEMP }
    }
    controlShape(writers.map { it.origName } == listOf("start"), "FileLoadOperation's download file isn't set in start alone")
    return finishing
}

/** FileLoader's delegate field, read or written. */
private fun Instruction.loaderDelegate(): FieldReference? =
    controlField()?.takeIf { it.origDefiningClass == FILE_LOADER && it.origName == "delegate" }

/**
 * The types ImageLoader hands FileLoader as its delegate: each one it creates and writes straight
 * into FileLoader's delegate field.
 */
internal fun ClassDef.delegateCandidates(): List<String> = methods.flatMap { method ->
    val body = method.controlBody()
    body.indices.filter { body[it].opcode == Opcode.IPUT_OBJECT && body[it].loaderDelegate() != null }.mapNotNull { at ->
        val value = body[at].namedRegisters().first()
        val write = (at - 1 downTo 0).firstOrNull { body[it].opcode.setsRegister() && body[it].namedRegisters().firstOrNull() == value }
            ?: return@mapNotNull null
        val created = body[write].takeIf { it.opcode == Opcode.NEW_INSTANCE } ?: return@mapNotNull null
        val type = (created as ReferenceInstruction).reference.toString()
        created.controlRef().takeIf { type == body[at].loaderDelegate()!!.type }
    }
}.distinct()

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
    // These two are asked about every finished download, and a profile photo's or a sticker's
    // parent isn't a message, so like messageDocument they answer no for anything else (#27).
    writeStub(SAVE_DOWNLOADS, "timedMedia", 2, """
        instance-of v0, p0, $MESSAGE_OBJECT
        if-eqz v0, :hush_no
        check-cast p0, $MESSAGE_OBJECT
        invoke-virtual {p0}, $IS_SECRET_MEDIA
        move-result v0
        :hush_no
        return v0
    """)
    // The size a chat shows and Save to Gallery saves, the way ChatMessageCell picks it.
    val closest = closestPhotoSize()
    val closestCall = if (closest == CLOSEST_PHOTO_SIZE) "invoke-static {v0, v1}, $closest"
        else "const/4 p0, 0x0\n        invoke-static {v0, v1, p0, p0, p0}, $closest"
    writeStub(SAVE_DOWNLOADS, "photo", 3, """
        instance-of v0, p0, $MESSAGE_OBJECT
        if-eqz v0, :hush_none
        check-cast p0, $MESSAGE_OBJECT
        iget-object v0, p0, $PHOTO_THUMBS
        invoke-static {}, $PHOTO_SIZE
        move-result v1
        $closestCall
        move-result-object v0
        return-object v0
        :hush_none
        const/4 v0, 0x0
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

/**
 * ImageLoader gives each account's FileLoader a delegate, and FileLoader calls its fileDidLoaded
 * with the downloader's name for the file, the finished file, what it was downloaded for and its
 * type, on FileLoader's own queue, once a download is done and before Telegram's UI hears of it.
 * The build inlines that call into FileLoader's operation callback: past the null check on the
 * delegate, it builds the delegate's runnable from those values and the delegate's account and
 * hands it to runOnUIThread. A file Telegram auto-downloads while its chat is closed comes from
 * the background queue, whose parent is only a "sent_" key naming the chat, the message and its
 * type, so the extension reads that message back from MessagesStorage. The stubs call Telegram's
 * own checks from the extension's package, so each one has to be public.
 */
internal fun BytecodePatchContext.resolveSaveDownloads(): DownloadCallback {
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

    val images = tgMutableClassDefByOrNull(IMAGE_LOADER)
    controlShape(images != null, "ImageLoader is missing")
    val delegate = images!!.delegateCandidates()
        .filter { it.startsWith(IMAGE_LOADER.removeSuffix(";") + "\$") }
        .controlSingle("ImageLoader's download callback")
    val accounts = tgMutableClassDefByOrNull(delegate)?.instanceFields?.filter { it.origType == "I" }.orEmpty()
        .controlSingle("the download callback's account")
    val found = mutableListOf<DownloadCallback>()
    forEachClassMentioning(Mention.member(FILE_LOADER, "delegate")) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        for (method in cls.methods) {
            val body = method.controlBody()
            for (read in body.indices) {
                if (body[read].opcode != Opcode.IGET_OBJECT || body[read].loaderDelegate() == null) continue
                val site = delegateSite(body, read, delegate, "${accounts.definingClass}->${accounts.name}:I") ?: continue
                val owner = tgMutableClassDefBy(cls.type)
                val mutable = owner.methods.single { it.name == method.name && it.parameterTypes == method.parameterTypes &&
                    it.returnType == method.returnType }
                found += DownloadCallback(mutable, site.first, site.second)
            }
        }
    }
    val callback = found.controlSingle("the finished-download callback")
    controlShape(callback.method.origDefiningClass.startsWith(FILE_LOADER.removeSuffix(";") + "\$"),
        "the finished-download callback moved out of FileLoader")

    // Telegram's own Save to Downloads rules read the same three facts the stubs do.
    val loader = tgMutableClassDefByOrNull(FILE_LOADER)
    controlShape(loader != null && loader.methods.any { method ->
        val refs = method.controlBody().mapNotNull { it.controlRef() }
        PEER_NO_FORWARDS in refs && IS_ENCRYPTED in refs && NO_FORWARDS in refs
    }, "Telegram's rules for saving a file outside the app changed")
    // The extension reads the background queue's key the way FileLoader does, and knows a file and a song by type.
    controlShape(loader!!.methods.any { method -> method.controlBody().any { it.controlString() == SENT_KEY } },
        "the background download key changed")
    controlShape(messageTypesMatch(), "Telegram's message types changed")

    for ((reference, static) in listOf(GET_DOCUMENT to false, IS_SECRET_MEDIA to false, IS_MUSIC to false,
        IS_DOCUMENT to false, IS_GIF to false, IS_ROUND_VIDEO to false, IS_VOICE to false, MESSAGE_OWNER to false,
        NO_FORWARDS to false, GET_DIALOG_ID to false, CURRENT_ACCOUNT to false, IS_ENCRYPTED to true,
        CONTROLLER_INSTANCE to true, PEER_NO_FORWARDS to false, ATTACH_NAME to true, DOCUMENT_NAME to true,
        STORAGE_INSTANCE to true, STORED_MESSAGE to false, NEW_MESSAGE_OBJECT to false, IS_PHOTO to false,
        IS_VIDEO to false, PHOTO_THUMBS to false, PHOTO_SIZE to true, closestPhotoSize() to true)) {
        requireReachable(reference, static)
    }
    return callback
}

/** getClosestPhotoSizeWithSize(sizes, side), or the full form it forwards to where the build inlined it. */
internal fun BytecodePatchContext.closestPhotoSize(): String =
    if (tgClassDefByOrNull(FILE_LOADER)?.methods?.any { it.origString() == CLOSEST_PHOTO_SIZE } == true) CLOSEST_PHOTO_SIZE
    else CLOSEST_PHOTO_SIZE_FULL

/**
 * At the read of FileLoader's delegate at [read]: the index of the runOnUIThread call that posts
 * the delegate's runnable and the registers holding the account, the name, the file and the
 * parent there, or null when this isn't that inlined callback. Past the null check, straight-line
 * code builds a runnable from the delegate, the file, the name, the account (read from the
 * delegate's own [account] field), the parent and the type, then posts it.
 */
private fun delegateSite(body: List<Instruction>, read: Int, delegate: String, account: String): Pair<Int, List<Int>>? {
    val held = body[read].namedRegisters().first()
    val check = body.getOrNull(read + 1)
    if (check?.opcode != Opcode.IF_EQZ || check.namedRegisters() != listOf(held)) return null
    var index = read + 2
    while (index < body.size) {
        val instruction = body[index]
        if (!instruction.opcode.canContinue() || instruction is OffsetInstruction) return null
        if (instruction.opcode.setsRegister() && instruction.namedRegisters().firstOrNull().let {
                it == held || instruction.opcode.setsWideRegister() && it?.plus(1) == held }) return null
        val call = instruction.call()
        val args = instruction.namedRegisters()
        if ((instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            call?.name == "<init>" && call.origParameterTypes == listOf(delegate, FILE, STRING, "I", OBJECT, "I") &&
            args.getOrNull(1) == held) {
            val post = body.getOrNull(index + 1)
            if (post?.opcode != Opcode.INVOKE_STATIC || post.controlRef() != RUN_ON_UI_THREAD ||
                post.namedRegisters() != listOf(args[0])) return null
            val accountRead = (index - 1 downTo read + 2).firstOrNull { body[it].opcode.setsRegister() &&
                body[it].namedRegisters().first() == args[4] } ?: return null
            if (body[accountRead].opcode != Opcode.IGET || body[accountRead].namedRegisters() != listOf(args[4], held) ||
                (body[accountRead] as ReferenceInstruction).reference.toString() != account) return null
            val registers = listOf(args[4], args[3], args[2], args[5])
            return if (registers.all { it < 16 }) index + 1 to registers else null
        }
        index++
    }
    return null
}

/** Whether MessageObject.setType still gives each kind of message the type number the extension knows it by. */
private fun BytecodePatchContext.messageTypesMatch(): Boolean {
    val messages = tgMutableClassDefByOrNull(MESSAGE_OBJECT) ?: return false
    val setType = messages.methods.filter {
        it.origName == SET_TYPE && it.parameterTypes.isEmpty() && it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }.singleOrNull()?.takeIf { it.controlBody().isNotEmpty() } ?: return false
    val writes = TypeWrites(setType)
    fun checks(reference: String) = writes.body.indices.filter { writes.body[it].controlRef() == reference }
    // Each check's true side sets its own type at once; a video message's false side is a photo.
    fun sets(reference: String, type: Long): Boolean {
        val sides = checks(reference).map { writes.branches(it) ?: return false }
        return sides.isNotEmpty() && sides.all { (test, yes, _) -> writes.firstType(test, yes) == type }
    }
    val videos = checks(IS_VIDEO_MESSAGE).map { writes.branches(it) ?: return false }
    val photo = videos.any { (test, _, no) -> writes.firstType(test, no) == 1L }
    // A document's own branch ends at the file type after its sticker, GIF and song checks.
    val documents = writes.body.indices.filter { writes.body[it].opcode == Opcode.INSTANCE_OF && writes.body[it].controlRef() == MEDIA_DOCUMENT }
    val file = documents.any { at -> writes.branches(at)?.let { (_, yes, _) -> writes.reachesType(yes, 9L) } == true }
    return sets(IS_ROUND_VIDEO, 5L) && sets(IS_VOICE_MESSAGE, 2L) && sets(IS_MUSIC, 14L) && sets(IS_VIDEO_MESSAGE, 3L) &&
        photo && file
}

/** The literals setType writes into MessageObject.type, read off its control flow. */
private class TypeWrites(method: Method) {
    private val flow = ControlFlow.of(method)
    val body = flow.instructions
    private val predecessors = Array(body.size) { mutableListOf<Int>() }.also { into ->
        for (index in body.indices) for (next in flow.normal[index] + flow.exceptional[index]) into[next] += index
    }

    private fun isTypeWrite(index: Int) = body[index].opcode == Opcode.IPUT && body[index].controlRef() == MESSAGE_TYPE
    private fun written(index: Int): Int? = body[index].takeIf { it.opcode.setsRegister() }?.namedRegisters()?.firstOrNull()
    private fun literal(index: Int): Long? =
        body[index].takeIf { it.opcode in LITERALS }?.let { (it as WideLiteralInstruction).wideLiteral }

    /** The branch on the result of the check at [anchor], with where its true and false sides start. */
    fun branches(anchor: Int): Triple<Int, Int, Int>? {
        var index = anchor
        val result = if (body[anchor].opcode == Opcode.INSTANCE_OF) {
            body[anchor].namedRegisters().first()
        } else {
            index++
            body.getOrNull(index)?.takeIf { it.opcode == Opcode.MOVE_RESULT }?.namedRegisters()?.first() ?: return null
        }
        index++
        while (index < body.size && literal(index) != null && written(index) != result) index++
        val test = body.getOrNull(index) ?: return null
        if (test.opcode != Opcode.IF_EQZ && test.opcode != Opcode.IF_NEZ || test.namedRegisters() != listOf(result)) return null
        val jump = flow.normal[index].singleOrNull { it != index + 1 } ?: return null
        return if (test.opcode == Opcode.IF_EQZ) Triple(index, index + 1, jump) else Triple(index, jump, index + 1)
    }

    /** The one literal [register] holds on every path into [at], through moves, or null. */
    fun literalBefore(at: Int, register: Int): Long? {
        val pending = ArrayDeque(predecessors[at].map { it to register })
        if (pending.isEmpty()) return null
        val seen = mutableSetOf<Pair<Int, Int>>()
        var value: Long? = null
        while (pending.isNotEmpty()) {
            val (index, wanted) = pending.removeFirst()
            if (!seen.add(index to wanted)) continue
            val instruction = body[index]
            val destination = written(index)
            if (instruction.opcode.setsWideRegister() && destination?.plus(1) == wanted) return null
            if (destination != wanted) {
                if (predecessors[index].isEmpty()) return null
                predecessors[index].forEach { pending += it to wanted }
                continue
            }
            val constant = literal(index)
            when {
                constant != null -> {
                    if (value != null && value != constant) return null
                    value = constant
                }
                instruction.opcode in MOVES && predecessors[index].isNotEmpty() ->
                    predecessors[index].forEach { pending += it to instruction.namedRegisters()[1] }
                else -> return null
            }
        }
        return value
    }

    /** From [start], straight on past gotos, the literal of the first type write, or null at a branch first. */
    fun firstType(test: Int, start: Int): Long? {
        // A register written on the way holds its literal; one that isn't still holds what it did at [test].
        val literals = HashMap<Int, Long?>()
        val before = HashMap<Int, Int>()
        var index = start
        repeat(body.size) {
            val instruction = body[index]
            if (isTypeWrite(index)) {
                val value = instruction.namedRegisters().first()
                return if (value in literals) literals[value] else literalBefore(test, before[value] ?: value)
            }
            if (instruction.opcode in GOTOS) {
                index = flow.normal[index].single()
                return@repeat
            }
            if (flow.normal[index] != listOf(index + 1)) return null
            written(index)?.let { destination ->
                before.remove(destination)
                literals.remove(destination)
                val source = instruction.namedRegisters().getOrNull(1)
                when {
                    literal(index) != null -> literals[destination] = literal(index)
                    instruction.opcode in MOVES && source in literals -> literals[destination] = literals[source]
                    instruction.opcode in MOVES -> before[destination] = before[source] ?: source!!
                    else -> literals[destination] = null
                }
                if (instruction.opcode.setsWideRegister()) literals[destination + 1] = null
            }
            index++
        }
        return null
    }

    /** Whether some path from [start] meets a type write of [type] before any other type write. */
    fun reachesType(start: Int, type: Long): Boolean {
        val pending = ArrayDeque(listOf(start))
        val seen = mutableSetOf<Int>()
        while (pending.isNotEmpty()) {
            val index = pending.removeFirst()
            if (!seen.add(index)) continue
            if (isTypeWrite(index)) {
                if (literalBefore(index, body[index].namedRegisters().first()) == type) return true
                continue
            }
            pending += flow.normal[index]
        }
        return false
    }

    private companion object {
        val LITERALS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)
        val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)
        val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
    }
}
