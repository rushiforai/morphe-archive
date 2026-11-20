/*
 * Meta Patches — full patch run verification harness.
 *
 * Mirrors the PlaylistQueueApkBuild harness of the official Morphe patches:
 * applies every patch of this bundle to a stock Instagram APK and verifies
 * the resulting DEX files, so fingerprint failures and invalid bytecode are
 * caught before the bundle is released.
 *
 * The d8 pass of SdkDexVerifier cannot process this Instagram build (it fails
 * with an internal NPE on the *unpatched* DEX files as well, on every
 * build-tools version), so this harness runs the dexdump pass and the
 * cross-DEX class hierarchy verification of SdkDexVerifier directly and
 * skips d8.
 *
 * Usage (with ANDROID_HOME set):
 *   ./gradlew :patches:instagramApkBuild --args="<stock-apk> [unsigned-output-apk] [hierarchy-report]"
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package util

import app.hemk651.patches.instants.instantsModPatch
import app.hemk651.patches.instantsupload.uploadInstantsFromGalleryPatch
import app.hemk651.patches.meta.addModsMenuPatch
import app.hemk651.patches.meta.amoledThemePatch
import app.hemk651.patches.meta.changeChannelNamePatch
import app.hemk651.patches.meta.removeAdsPatch
import app.hemk651.patches.meta.removeSnoozeWarningPatch
import app.hemk651.patches.meta.unlockDeveloperOptionsPatch
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.dex.DexVerificationException
import app.morphe.patcher.dex.DexVerifier
import app.morphe.patcher.dex.SdkDexVerifier
import kotlinx.coroutines.runBlocking
import java.io.File
import java.lang.reflect.InvocationTargetException
import kotlin.io.path.createTempDirectory

/**
 * Verifies the patched DEX files with the dexdump pass of [SdkDexVerifier],
 * skipping its d8 pass, which crashes on this Instagram build.
 *
 * The memory-hungry cross-DEX class hierarchy check is not run from the
 * patcher hook: it is run separately by [verifyHierarchy] after the patcher
 * has closed and released its state, so it has the full heap available.
 */
private class InstagramDexVerifier(androidSdk: File) : DexVerifier {
    private val sdkVerifier = SdkDexVerifier(androidSdk)

    private val dexdump = androidSdk.resolve("build-tools")
        .listFiles { file -> file.isDirectory }
        ?.maxByOrNull { it.name }
        ?.resolve("dexdump")
        ?.takeIf { it.exists() }
        ?: error("dexdump not found in the Android SDK build-tools: $androidSdk")

    override fun verifyDexFile(dexFile: File) {
        require(dexFile.isFile) { "DEX file does not exist: $dexFile" }
        verifyWithDexdump(dexFile)
    }

    override fun verifyDexDirectory(dexDir: File) {
        require(dexDir.isDirectory) { "Not a directory: $dexDir" }
        val dexFiles = dexDir.listFiles { file -> file.isFile && file.extension == "dex" }
            ?.sorted()
            ?: emptyList()
        require(dexFiles.isNotEmpty()) { "No .dex files found in $dexDir" }
        println("Verifying ${dexFiles.size} DEX files with dexdump (d8 skipped)")
        for (dex in dexFiles) {
            verifyWithDexdump(dex)
        }
    }

    /**
     * The APK checks of SdkDexVerifier include apksigner, which requires a
     * signature; the harness output is unsigned, so the APK is not verified.
     */
    override fun verifyApkFile(apkFile: File) {
        // Not verified: the output APK is unsigned.
    }

    /**
     * Runs the cross-DEX class hierarchy verification on all DEX files of
     * [dexDir]. The check is private on SdkDexVerifier; it is reached by
     * reflection so the d8 pass can be skipped.
     */
    fun verifyHierarchy(dexDir: File) {
        require(dexDir.isDirectory) { "Not a directory: $dexDir" }
        val method = SdkDexVerifier::class.java.getDeclaredMethod(
            "verifyClassHierarchy",
            File::class.java
        ).apply { isAccessible = true }

        try {
            method.invoke(sdkVerifier, dexDir)
        } catch (exception: InvocationTargetException) {
            throw exception.targetException
        }
    }

    /**
     * `dexdump -d <file>` — full disassembly validates header, checksum,
     * class_defs, and instruction encoding. Mirrors the check of SdkDexVerifier.
     *
     * The disassembly of the large Instagram DEX files is far too big to
     * buffer; only the tail of the output is kept for the error message.
     */
    private fun verifyWithDexdump(dexFile: File) {
        val process = ProcessBuilder(dexdump.absolutePath, "-d", dexFile.absolutePath)
            .redirectErrorStream(true)
            .start()
        val tail = ArrayDeque<String>(TAIL_LINES)
        process.inputStream.bufferedReader().forEachLine { line ->
            if (tail.size >= TAIL_LINES) {
                tail.removeFirst()
            }
            tail.addLast(line)
        }
        val exitCode = process.waitFor()
        if (exitCode != 0) {
            throw DexVerificationException(
                "dexdump failed on ${dexFile.name} (exit code $exitCode):\n${tail.joinToString("\n")}"
            )
        }
    }

    private companion object {
        const val TAIL_LINES = 40
    }
}

fun main(arguments: Array<String>) {
    require(arguments.size in 1..3) {
        "Usage: InstagramApkBuildKt <stock-apk> [unsigned-output] [hierarchy-report]"
    }
    val input = File(arguments[0]).canonicalFile
    require(input.isFile) { "Stock APK does not exist: $input" }
    val sdk = System.getenv("ANDROID_HOME") ?: error("ANDROID_HOME is required for DEX verification")

    // The bundle covers two apps. The Instants APK (com.instagram.moonshot)
    // is detected from its manifest: the binary XML stores its strings as
    // UTF-8 or UTF-16LE, so the NUL bytes are stripped before the substring
    // search. The Instagram APK keeps the fixed patch set below.
    val manifestBytes = java.util.zip.ZipFile(input).use { zip ->
        zip.getInputStream(zip.getEntry("AndroidManifest.xml")).use { it.readBytes() }
    }
    val manifestText = String(manifestBytes.filter { it != 0.toByte() }.toByteArray(), Charsets.ISO_8859_1)
    // The exact package name: the Instagram manifest mentions "moonshot" too,
    // as a share target ("com.instagram.share.add_to_reel_moonshot").
    val selected = if (manifestText.contains("com.instagram.moonshot")) {
        println("Detected the Instagram Instants APK (com.instagram.moonshot)")
        setOf(instantsModPatch)
    } else {
        setOf(
            removeAdsPatch,
            removeSnoozeWarningPatch,
            unlockDeveloperOptionsPatch,
            amoledThemePatch,
            changeChannelNamePatch,
            addModsMenuPatch,
            uploadInstantsFromGalleryPatch
        )
    }

    val workspace = createTempDirectory("meta-patches-build").toFile()
    val verifier = InstagramDexVerifier(File(sdk))
    Patcher(PatcherConfig(input, workspace, verifier = verifier)).use { patcher ->
        patcher += selected
        runBlocking {
            patcher().collect { result ->
                result.exception?.let { throw it }
                println("Applied: ${result.patch.name}")
            }
        }
        val result = patcher.get()
        arguments.getOrNull(1)?.let { result.applyTo(File(it)) }
        println("APK patched and dexdump verification completed")
    }

    // The patcher has closed and released its state; the cross-DEX class
    // hierarchy verification of the rebuilt DEX files now has the full heap.
    val dexDir = File(workspace, "patched/dex")
    println("Running cross-DEX class hierarchy verification")
    try {
        verifier.verifyHierarchy(dexDir)
    } catch (exception: DexVerificationException) {
        arguments.getOrNull(2)?.let { reportPath ->
            File(reportPath).writeText(exception.message ?: "")
            println("Hierarchy report saved to $reportPath")
        }
        throw exception
    }
    println("APK patched and DEX verification completed: $workspace")
}
