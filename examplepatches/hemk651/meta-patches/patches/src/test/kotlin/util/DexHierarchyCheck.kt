/*
 * Meta Patches — cross-DEX class hierarchy check utility.
 *
 * Runs the cross-DEX class hierarchy verification of SdkDexVerifier on a
 * directory of DEX files. The check is pure dexlib2, so the SDK tools are not
 * needed; a stub build-tools directory is created so the SdkDexVerifier
 * constructor (which resolves the tools eagerly) succeeds. Debug utility for
 * comparing the verification results of stock and patched DEX files.
 *
 * Usage:
 *   ./gradlew :patches:dexHierarchyCheck --args="<dex-directory>"
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package util

import app.morphe.patcher.dex.SdkDexVerifier
import java.io.File
import java.lang.reflect.InvocationTargetException
import kotlin.io.path.createTempDirectory

fun main(arguments: Array<String>) {
    require(arguments.size == 1) { "Usage: DexHierarchyCheckKt <dex-directory>" }
    val dexDir = File(arguments[0]).canonicalFile
    require(dexDir.isDirectory) { "Not a directory: $dexDir" }

    val stubSdk = createTempDirectory("dex-check-sdk-").toFile().apply {
        resolve("build-tools/stub").mkdirs()
        for (tool in listOf("dexdump", "d8", "aapt2", "apksigner", "zipalign")) {
            resolve("build-tools/stub/$tool").createNewFile()
        }
    }
    try {
        val method = SdkDexVerifier::class.java.getDeclaredMethod(
            "verifyClassHierarchy",
            File::class.java
        ).apply { isAccessible = true }

        try {
            method.invoke(SdkDexVerifier(stubSdk), dexDir)
        } catch (exception: InvocationTargetException) {
            throw exception.targetException
        }
        println("Cross-DEX class hierarchy verification passed: $dexDir")
    } finally {
        stubSdk.deleteRecursively()
    }
}
