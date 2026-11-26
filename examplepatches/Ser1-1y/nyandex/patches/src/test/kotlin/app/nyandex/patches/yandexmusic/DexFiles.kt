/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.DexFile
import java.io.File
import java.nio.file.Files
import java.util.zip.ZipFile

/** Every `classes*.dex` of [apk], unpacked into a temporary directory and loaded. */
internal fun loadDexFiles(apk: File): List<DexFile> {
    val directory = Files.createTempDirectory("ym-patched-dex").toFile()
    ZipFile(apk).use { zip ->
        zip.entries().asSequence()
            .filter { it.name.matches(Regex("classes\\d*\\.dex")) }
            .forEach { entry ->
                val dexFile = File(directory, entry.name)
                zip.getInputStream(entry).use { input ->
                    dexFile.outputStream().use { output -> input.copyTo(output) }
                }
            }
    }
    return directory.listFiles { file -> file.extension == "dex" }
        .orEmpty()
        .sortedBy { it.name }
        .map { DexFileFactory.loadDexFile(it, Opcodes.getDefault()) }
}
