/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.downloadspeed.LOAD_OPERATION
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

internal const val STORAGE_FOLDER = "$EXTENSION_PACKAGE/misc/StorageFolder;"
internal const val STORAGE_TELEGRAM_FOLDER = "$STORAGE_FOLDER->telegramFolder(Ljava/io/File;)Ljava/io/File;"
internal const val STORAGE_OLDER_FILE = "$STORAGE_FOLDER->olderFile(Ljava/io/File;)Ljava/io/File;"
internal const val STORAGE_ATTACH_NAME = "$FILE_LOADER->getAttachFileName(${TL_OBJECT}Ljava/lang/String;)Ljava/lang/String;"
internal const val STORAGE_FILES_DIR = "Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;"
internal const val STORAGE_TELEGRAM_PATH = "$IMAGE_LOADER->telegramPath:Ljava/io/File;"
internal const val STORAGE_CACHE_FINAL = "$LOAD_OPERATION->cacheFileFinal:Ljava/io/File;"
internal const val STORAGE_STORE_PATH = "$LOAD_OPERATION->storePath:Ljava/io/File;"
internal const val STORAGE_STORE_NAME = "$LOAD_OPERATION->storeFileName:Ljava/lang/String;"
internal const val STORAGE_MANAGE_PERMISSION = "android.permission.MANAGE_EXTERNAL_STORAGE"

/**
 * Asks for All files access, which Android grants only from its own settings page, so the storage
 * folder switch can reach Internal storage/Telegram. Telegram declares the older storage permissions
 * already, and a manifest that has this one too is left as it is.
 */
internal val storageFolderManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val declared = document.getElementsByTagName("uses-permission")
            if ((0 until declared.length).any { (declared.item(it) as Element).getAttribute("android:name") == STORAGE_MANAGE_PERMISSION }) {
                return@use
            }
            if (document.getElementsByTagName("application").length != 1) {
                throw PatchException("AndroidManifest.xml has no single application element")
            }
            val permission = document.createElement("uses-permission").apply { setAttribute("android:name", STORAGE_MANAGE_PERMISSION) }
            root.insertBefore(permission, document.getElementsByTagName("application").item(0))
        }
    }
}

/** The one place Telegram keeps its Android 11 folder, or [missing], why this build keeps Android/data. */
internal class StorageFolderPlan(val method: MutableMethod?, val at: Int, val missing: String?) {
    /** The folder goes past the extension right before Telegram keeps it, on the method or on what [into] makes of it. */
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val target = into(method!!)
        val folder = target.getInstruction(at).namedRegisters().first()
        target.addInstructions(at, """
            invoke-static/range {v$folder .. v$folder}, $STORAGE_TELEGRAM_FOLDER
            move-result-object v$folder
        """)
    }

    /** The same insert on a copy, so a smali problem refuses before the app is touched. */
    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }

    companion object {
        fun missing(why: String) = StorageFolderPlan(null, -1, why)
    }
}

/** The runtime the insert calls. It's the extension's own, so a change there refuses the whole patch. */
internal fun BytecodePatchContext.requireStorageFolderRuntime() {
    requireStatusMethod("storageFolder")
    controlHook(STORAGE_FOLDER, "telegramFolder", listOf("Ljava/io/File;"), "Ljava/io/File;")
    controlHook(STORAGE_FOLDER, "olderFile", listOf("Ljava/io/File;"), "Ljava/io/File;")
}

/** One place Telegram makes the path of a downloaded file, or [missing], why files from before the move download again there. */
internal class OlderFilePlan(val method: MutableMethod?, val at: Int, val missing: String?) {
    /** The path goes past the extension right before Telegram returns or keeps it, on every way into that instruction. */
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        val target = into(method!!)
        val file = target.getInstruction(at).namedRegisters().first()
        target.addInstructionsAtControlFlowLabel(at, """
            invoke-static/range {v$file .. v$file}, $STORAGE_OLDER_FILE
            move-result-object v$file
        """)
    }

    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }

    companion object {
        fun missing(why: String) = OlderFilePlan(null, -1, why)
    }
}

/**
 * Every FileLoader.getPathToAttach and getPathToMessage ends in getPathToAttach(TLObject, String,
 * String, boolean, boolean), and its last return is `new File(getDirectory(type), getAttachFileName(
 * object, ext))`, the path in Telegram's own folders that it checks before it opens a voice
 * message or a document, or offers to download one. That File goes past the extension right before
 * the return, so a file downloaded before the folder moved opens from where it is. The earlier
 * returns (a sent file's own path, a path Telegram saved for the file, the cache) are left alone.
 * None or more than one such return downloads older files again. Photos and videos never ask
 * here, see [resolveOlderLoads].
 */
internal fun BytecodePatchContext.resolveOlderFiles(): OlderFilePlan {
    val owner = mutableClassDefByOrNull(FILE_LOADER) ?: return OlderFilePlan.missing("FileLoader is missing")
    val wanted = listOf(TL_OBJECT, "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z")
    val methods = owner.methods.filter {
        it.name == "getPathToAttach" && it.returnType == "Ljava/io/File;" && it.parameterTypes.map(CharSequence::toString) == wanted
    }
    val method = methods.singleOrNull() ?: return OlderFilePlan.missing("FileLoader.getPathToAttach changed")
    val body = method.controlBody()
    val sites = (4 until body.size).filter { at ->
        val made = body[at - 1].namedRegisters()
        body[at].opcode == Opcode.RETURN_OBJECT &&
            body[at - 1].opcode == Opcode.INVOKE_DIRECT && body[at - 1].controlRef() == GALLERY_FILE_IN && made.size == 3 &&
            body[at].namedRegisters().single() == made[0] &&
            body[at - 2].opcode == Opcode.MOVE_RESULT_OBJECT && body[at - 2].namedRegisters().single() == made[2] &&
            body[at - 3].controlRef() == STORAGE_ATTACH_NAME &&
            body[at - 4].opcode == Opcode.NEW_INSTANCE && body[at - 4].namedRegisters().single() == made[0]
    }
    val at = sites.singleOrNull() ?: return OlderFilePlan.missing("Telegram's download path changed (${sites.size} places)")
    return OlderFilePlan(method, at, null)
}

/**
 * ImageLoader builds a photo's or video's path from getDirectory itself and hands a missing one
 * straight to FileLoader.loadFile, so getPathToAttach never sees it. Every load ends in
 * FileLoadOperation.start(stream, offset, priority), which keeps `new File(storePath,
 * storeFileName)` in cacheFileFinal and finishes at once, with no download, when that file exists
 * at the size Telegram expects. That File goes past the extension right before the iput-object, so
 * an older photo shows from Android/data. The encrypted branch (a secret chat's file named
 * differently) and the theme branch are left alone. If an older file's size doesn't match,
 * Telegram deletes it and downloads it again where it was, under Android/data, as stock does.
 * None or more than one such write downloads older photos and videos again.
 */
internal fun BytecodePatchContext.resolveOlderLoads(): OlderFilePlan {
    val owner = mutableClassDefByOrNull(LOAD_OPERATION) ?: return OlderFilePlan.missing("FileLoadOperation is missing")
    val wanted = listOf("Lorg/telegram/messenger/FileLoadOperationStream;", "J", "Z")
    val methods = owner.methods.filter {
        it.name == "start" && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == wanted
    }
    val method = methods.singleOrNull() ?: return OlderFilePlan.missing("FileLoadOperation.start changed")
    val body = method.controlBody()
    val sites = (4 until body.size).filter { at ->
        val made = body[at - 1].namedRegisters()
        body[at].opcode == Opcode.IPUT_OBJECT && body[at].controlRef() == STORAGE_CACHE_FINAL &&
            body[at - 1].opcode == Opcode.INVOKE_DIRECT && body[at - 1].controlRef() == GALLERY_FILE_IN && made.size == 3 &&
            body[at].namedRegisters().first() == made[0] &&
            body[at - 2].opcode == Opcode.IGET_OBJECT && body[at - 2].controlRef() == STORAGE_STORE_NAME &&
            body[at - 2].namedRegisters().first() == made[2] &&
            body[at - 3].opcode == Opcode.IGET_OBJECT && body[at - 3].controlRef() == STORAGE_STORE_PATH &&
            body[at - 3].namedRegisters().first() == made[1] &&
            body[at - 4].opcode == Opcode.NEW_INSTANCE && body[at - 4].namedRegisters().single() == made[0]
    }
    val at = sites.singleOrNull() ?: return OlderFilePlan.missing("Telegram's file loader changed (${sites.size} places)")
    return OlderFilePlan(method, at, null)
}

/**
 * From Android 11 ImageLoader.createMediaPaths makes `new File(getExternalFilesDir(null), "Telegram")`
 * and keeps it in telegramPath, the folder its Telegram Images, Video, Documents and the rest go in.
 * That File goes past the extension just before the iput-object, so Telegram makes its folders
 * wherever the extension says. The older Android path and the SD card fallback write telegramPath
 * too. The SD card fallback never starts from getExternalFilesDir, and the older Android path does
 * only in the Play build, after the Android 11 branch. So the first site in code order is the
 * Android 11 one. No site, more than two, or a jump onto any of its last three instructions keeps
 * Android/data.
 */
internal fun BytecodePatchContext.resolveStorageFolder(): StorageFolderPlan {
    val owner = mutableClassDefByOrNull(IMAGE_LOADER) ?: return StorageFolderPlan.missing("ImageLoader is missing")
    val methods = owner.methods.filter {
        it.name == "createMediaPaths" && it.parameterTypes.isEmpty() && it.returnType == "Landroid/util/SparseArray;"
    }
    val method = methods.singleOrNull() ?: return StorageFolderPlan.missing("ImageLoader.createMediaPaths changed")
    val body = method.controlBody()
    val sites = (4 until body.size).filter { at ->
        val made = body[at - 1].namedRegisters()
        body[at].opcode == Opcode.IPUT_OBJECT && body[at].controlRef() == STORAGE_TELEGRAM_PATH &&
            body[at - 1].opcode == Opcode.INVOKE_DIRECT && body[at - 1].controlRef() == GALLERY_FILE_IN && made.size == 3 &&
            body[at].namedRegisters().first() == made[0] &&
            body[at - 2].opcode == Opcode.NEW_INSTANCE && body[at - 2].namedRegisters().single() == made[0] &&
            body[at - 3].opcode == Opcode.MOVE_RESULT_OBJECT && body[at - 3].namedRegisters().single() == made[1] &&
            body[at - 4].controlRef() == STORAGE_FILES_DIR
    }
    // The Play build repeats the older Android path's files dir fallback in the same shape, after the
    // Android 11 branch, and its new-instance is where the other older Android paths jump in.
    val at = sites.firstOrNull()?.takeIf { sites.size <= 2 }
        ?: return StorageFolderPlan.missing("Telegram's Android 11 folder changed (${sites.size} places)")
    val flow = ControlFlow.of(method)
    val landsInside = (at - 2..at).any { into ->
        flow.normal.indices.any { from -> from != into - 1 && into in flow.normal[from] } || flow.exceptional.any { into in it }
    }
    if (at >= flow.instructions.size || landsInside) {
        return StorageFolderPlan.missing("ImageLoader.createMediaPaths makes its Android 11 folder differently")
    }
    return StorageFolderPlan(method, at, null)
}
