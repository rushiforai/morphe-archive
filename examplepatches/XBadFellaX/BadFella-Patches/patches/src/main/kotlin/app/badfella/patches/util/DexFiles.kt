package app.badfella.patches.util

import app.morphe.patcher.patch.ResourcePatchContext
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.DexFile
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File

/** One DEX file discovered in the APK workspace. */
internal class DexHandle(
    val name: String,
    private val file: File,
    val dex: DexFile,
) {
    var classes: List<ClassDef> = dex.classes.toList()
    var changed: Boolean = false

    fun replaceClass(original: ClassDef, replacement: ClassDef) {
        val index = classes.indexOfFirst { it.type == original.type }
        check(index >= 0) { "DEX class disappeared: ${original.type}" }
        classes = classes.toMutableList().also { it[index] = replacement }
        changed = true
    }

    fun pending(): PendingFile? = if (!changed) null else PendingFile(file) { temp ->
        DexPool.writeTo(temp.absolutePath, ImmutableDexFile(dex.opcodes, classes))
    }
}

private fun dexIndex(name: String): Long =
    name.removePrefix("classes").removeSuffix(".dex").ifEmpty { "1" }.toLongOrNull()
        ?: error("Invalid DEX filename: $name")

/** Enumerates every classesN.dex entry; the filename inventory is never hardcoded. */
internal fun loadDexHandles(context: ResourcePatchContext): List<DexHandle> =
    context.listApkEntries()
        .filter { Regex("classes\\d*\\.dex").matches(it) }
        .sortedBy(::dexIndex)
        .map { name ->
            val file = context.get(name)
            DexHandle(name, file, DexFileFactory.loadDexFile(file, null))
        }

/** Resolves a descriptor across all DEX files and fails closed on missing or duplicate classes. */
internal fun List<DexHandle>.resolveUniqueClass(descriptor: String): Pair<DexHandle, ClassDef> {
    val found = flatMap { handle -> handle.classes.filter { it.type == descriptor }.map { handle to it } }
    check(found.size == 1) {
        "Expected exactly one $descriptor across DEX files, found ${found.size}; this app needs review"
    }
    return found.single()
}

internal fun List<DexHandle>.commitAll(extra: List<PendingFile> = emptyList()) =
    commitFiles(mapNotNull { it.pending() } + extra)
