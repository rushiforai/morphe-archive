/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.savedownloads

import app.morphe.util.names.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val GALLERY_FOLDER = "$EXTENSION_PACKAGE/misc/GalleryFolder;"
internal const val GALLERY_MEDIA_CONTROLLER = "Lorg/telegram/messenger/MediaController;"
internal const val GALLERY_VALUES = "Landroid/content/ContentValues;"
internal const val GALLERY_VALUES_PUT = "$GALLERY_VALUES->put(Ljava/lang/String;Ljava/lang/String;)V"
internal const val GALLERY_PUT = "$GALLERY_FOLDER->put(${GALLERY_VALUES}Ljava/lang/String;Ljava/lang/String;)V"
internal const val GALLERY_PICTURES = "Landroid/os/Environment;->DIRECTORY_PICTURES:Ljava/lang/String;"
internal const val GALLERY_MOVIES = "Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;"
internal const val GALLERY_RELATIVE_PATH = "relative_path"
internal const val GALLERY_PUBLIC_DIRECTORY =
    "Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;"
internal const val GALLERY_FILE_IN = "Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V"
internal const val GALLERY_OLDER = "$GALLERY_FOLDER->older(Ljava/io/File;)Ljava/io/File;"

/**
 * Each gallery save and the ContentValues string puts in it, or [missing], why this build keeps Telegram's folders.
 * [older] are the folders Android 9 and older save into, each the index of the File made for it, or [olderMissing],
 * why those saves keep Telegram's folders while the Android 10 ones move.
 */
internal class GalleryFolderPlan(
    val saves: List<Pair<MutableMethod, List<Int>>>,
    val missing: String?,
    val older: List<Pair<MutableMethod, List<Int>>> = emptyList(),
    val olderMissing: String? = null,
) {
    /** Every put goes through the extension, on the methods themselves or on what [into] makes of each. */
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        for ((method, puts) in saves) {
            val target = into(method)
            for (at in puts) {
                val registers = target.getInstruction(at).namedRegisters().joinToString { "v$it" }
                target.replaceInstruction(at, "invoke-static {$registers}, $GALLERY_PUT")
            }
        }
        if (olderMissing != null) return
        // Puts are swapped in place, so the indices still hold. Last first, so each insert leaves the earlier ones.
        for ((method, folders) in older) {
            val target = into(method)
            for (at in folders.sortedDescending()) {
                val folder = target.getInstruction(at).namedRegisters().first()
                target.addInstructions(at + 1, """
                    invoke-static/range {v$folder .. v$folder}, $GALLERY_OLDER
                    move-result-object v$folder
                """)
            }
        }
    }

    /** The same swaps on copies, so a smali problem refuses before the app is touched. */
    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }

    companion object {
        fun missing(why: String) = GalleryFolderPlan(emptyList(), why)
    }
}

/** The runtime the swaps call. It's the extension's own, so a change there refuses the whole patch. */
internal fun BytecodePatchContext.requireGalleryFolderRuntime() {
    requireStatusMethod("galleryFolder")
    controlHook(GALLERY_FOLDER, "put", listOf(GALLERY_VALUES, "Ljava/lang/String;", "Ljava/lang/String;"), "V")
    controlHook(GALLERY_FOLDER, "older", listOf("Ljava/io/File;"), "Ljava/io/File;")
}

/**
 * On Android 10 and later MediaController writes a photo or video Save to Gallery makes through
 * MediaStore, with its folder in the ContentValues' relative_path: Pictures/Telegram/ or
 * Movies/Telegram/. saveFileInternal is the ordinary save and the other method with relative_path
 * and DIRECTORY_PICTURES is the live photo's. Every ContentValues string put in both goes through
 * the extension, which changes only that folder, so the collection, the name and the type stay
 * Telegram's. Anything else about them, or a third such method, keeps Telegram's folders.
 */
internal fun BytecodePatchContext.resolveGalleryFolder(): GalleryFolderPlan {
    val owner = tgMutableClassDefByOrNull(GALLERY_MEDIA_CONTROLLER) ?: return GalleryFolderPlan.missing("MediaController is missing")
    val methods = galleryMethods(owner)
    val saves = methods.filter { method ->
        val body = method.controlBody()
        body.any { it.controlString() == GALLERY_RELATIVE_PATH } &&
            body.any { it.opcode == Opcode.SGET_OBJECT && it.controlRef() == GALLERY_PICTURES }
    }
    if (saves.size != 2 || saves.count { it.origName == "saveFileInternal" } != 1) {
        return GalleryFolderPlan.missing("Telegram's gallery saves changed (${saves.map { it.origName }.sorted().joinToString()})")
    }
    val plan = saves.map { method ->
        val body = method.controlBody()
        val puts = body.indices.filter { body[it].controlRef() == GALLERY_VALUES_PUT }
        if (puts.isEmpty() || puts.any { body[it].opcode != Opcode.INVOKE_VIRTUAL || body[it].namedRegisters().size != 3 }) {
            return GalleryFolderPlan.missing("${method.where()} no longer puts its folder the way the swap expects")
        }
        method to puts
    }
    val older = resolveOlderGalleryFolders(methods)
    return GalleryFolderPlan(plan, null, older.getOrDefault(emptyList()), older.exceptionOrNull()?.message)
}

/** The source types [this] class creates, itself and the extension's left out. */
internal fun ClassDef.createdTypes(): List<String> = methods.flatMap { method ->
    method.controlBody().filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.controlRef() }
}.distinct().filter { it != origType && !it.startsWith("Lapp/hushtelegram/") }

/**
 * MediaController's own methods and those of the classes it creates that save into a public folder. The
 * build moves Save to Gallery's lambdas out of MediaController into lambda classes other code shares.
 */
internal fun BytecodePatchContext.galleryMethods(owner: MutableClass): List<MutableMethod> =
    owner.methods.toList() + owner.createdTypes().mapNotNull { type ->
        tgClassDefByOrNull(type)?.takeIf { created ->
            created.methods.any { method ->
                method.controlBody().any { it.controlString() == GALLERY_RELATIVE_PATH || it.controlRef() == GALLERY_PUBLIC_DIRECTORY }
            }
        }
    }.flatMap { tgMutableClassDefBy(it).methods }

/** MediaController.saveFileInternal, or the lambda class and method for a save moved out of it. */
private fun MutableMethod.where() = "${origDefiningClass.substringAfterLast('/').removeSuffix(";")}.$origName"

/**
 * Before Android 10 the same saves copy into `new File(getExternalStoragePublicDirectory(Pictures or Movies),
 * "Telegram")`: twice in the ordinary save's thread (photo and video) and once in the live photo's. Each such
 * File goes past the extension right after it's made, ahead of Telegram's mkdirs, so the copy lands in the
 * folder picked. A different count, or a jump onto the instruction after one, keeps Telegram's folders there.
 */
private fun resolveOlderGalleryFolders(methods: Iterable<MutableMethod>): Result<List<Pair<MutableMethod, List<Int>>>> {
    val sites = methods.filter { it.implementation != null }.mapNotNull { method ->
        val body = method.controlBody()
        val folders = (3 until body.size).filter { at ->
            body[at].opcode == Opcode.INVOKE_DIRECT && body[at].controlRef() == GALLERY_FILE_IN &&
                body[at - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                body[at - 1].namedRegisters().single() == body[at].namedRegisters()[1] &&
                body[at - 2].controlRef() == GALLERY_PUBLIC_DIRECTORY &&
                body[at - 3].opcode == Opcode.SGET_OBJECT && body[at - 3].controlRef() in setOf(GALLERY_PICTURES, GALLERY_MOVIES)
        }
        if (folders.isEmpty()) null else method to folders
    }
    if (sites.sumOf { it.second.size } != 3 || sites.size != 2) {
        return Result.failure(IllegalStateException(
            "Telegram's Android 9 gallery saves changed (${sites.map { it.first.origName }.sorted().joinToString()})"))
    }
    for ((method, folders) in sites) {
        val flow = ControlFlow.of(method)
        for (at in folders) {
            val landsAfter = flow.normal.indices.any { from -> from != at && at + 1 in flow.normal[from] } ||
                flow.exceptional.any { at + 1 in it }
            if (at + 1 >= flow.instructions.size || landsAfter) {
                return Result.failure(IllegalStateException("${method.where()} makes its Android 9 gallery folder differently"))
            }
        }
    }
    return Result.success(sites)
}
