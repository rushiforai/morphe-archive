package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.steamlink.androidxr.*
import app.template.patches.steamlink.galaxyXrRecommended5001812Patch
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile

/** Run each case in a fresh JVM using the final MPP's classes/resources.
 * Actual Morphe execution and unsigned packaging of the original Valve APK;
 * no Android linking, GLES execution, installation or headset proof.
 */
object FovealCanvasMorpheAudit {
    private const val SCENE = "lib/arm64-v8a/libvrlink_scene.so"
    private const val LAYER_DIRECTORY = "assets/openxr/1/api_layers/implicit.d/"
    private const val ORIGINAL_APK_SIZE = 40_427_387L
    private const val ORIGINAL_APK_SHA256 =
        "c696be092956854c4f5ca42ec088449a8b3e62ede72c47d4448a2d5329be6048"
    private const val ORIGINAL_SCENE_SHA256 =
        "eebf7eabfb299ab7b9e5bba1612d4a32b27c51f451efc2bd206ba6fc6ac5205a"

    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size == 3) {
            "Usage: FovealCanvasMorpheAudit <original.apk> <new-output-directory> " +
                "<alone|trigger-first|canvas-first|recommended|legacy-without-trigger>"
        }
        val originalApk = File(args[0]).canonicalFile
        val directory = File(args[1]).canonicalFile
        val case = args[2]
        require(case in setOf("alone", "trigger-first", "canvas-first", "recommended", "legacy-without-trigger"))
        require(originalApk.isFile && originalApk.length() == ORIGINAL_APK_SIZE) {
            "Expected the original exact 2.0.20/5001812 Valve APK"
        }
        require(originalApk.sha256() == ORIGINAL_APK_SHA256) { "Original APK SHA-256 mismatch" }
        require(!directory.exists() || directory.listFiles().isNullOrEmpty()) {
            "Use an absent or empty output directory: $directory"
        }
        check(directory.isDirectory || directory.mkdirs()) { "Could not create audit output directory" }
        val lines = mutableListOf<String>()
        fun record(line: String) { lines += line; println(line) }
        try {
            val expectedHelper = projectionModeResource(FOVEAL_CANVAS_LIBRARY)
            val expectedManifest = projectionModeResource(FOVEAL_CANVAS_MANIFEST)
            validateFovealCanvasPayload(expectedHelper, expectedManifest)
            val stockScene = ZipFile(originalApk).use { it.entryBytes(SCENE) }
            check(stockScene.sha256() == ORIGINAL_SCENE_SHA256)
            validateFovealCanvasScene(stockScene)
            record("Input: ${originalApk.path}; bytes=$ORIGINAL_APK_SIZE; SHA-256=$ORIGINAL_APK_SHA256")
            record("Case: exact 2.0.20/5001812; $case")
            record("Evidence: actual Morphe execution/finalize and unsigned APK packaging from original Valve input; no installation, Android linker, GLES, runtime resolution or headset proof.")

            val metadataGuard = rawResourcePatch(name = "Foveal canvas original APK metadata audit") {
                execute {
                    check(packageMetadata.packageName == "com.valvesoftware.steamlinkvr")
                    check(packageMetadata.versionName == "2.0.20" && packageMetadata.versionCode == "5001812") {
                        "Exact metadata mismatch: ${packageMetadata.versionName}/${packageMetadata.versionCode}"
                    }
                }
            }
            val selection = linkedSetOf<Patch<*>>(metadataGuard)
            when (case) {
                "alone" -> selection += xrFovealCanvasPatch
                "trigger-first" -> { selection += xrGalaxyXrHighResolutionPatch; selection += xrFovealCanvasPatch }
                "canvas-first" -> { selection += xrFovealCanvasPatch; selection += xrGalaxyXrHighResolutionPatch }
                "recommended" -> { selection += galaxyXrRecommended5001812Patch; selection += xrFovealCanvasPatch }
                "legacy-without-trigger" -> {
                    selection += galaxyXrRecommended5001812Patch.dependencies.filterNot { it === xrGalaxyXrHighResolutionPatch }
                    selection += xrFovealCanvasPatch
                }
            }
            val closure = linkedSetOf<Patch<*>>()
            fun collect(patch: Patch<*>) {
                if (closure.add(patch)) patch.dependencies.forEach(::collect)
            }
            selection.forEach(::collect)
            val expectTrigger = case in setOf("trigger-first", "canvas-first", "recommended")
            check((xrGalaxyXrHighResolutionPatch in closure) == expectTrigger) {
                "Unexpected Surface-trigger transitive dependency in $case"
            }
            record("Selection: ${selection.joinToString { it.name.orEmpty() }}")
            record("Dependency closure: ${closure.joinToString { it.name.orEmpty() }}")

            val isolatedInput = File(directory, "isolated-original-input.apk")
            val output = File(directory, "steamlink-2.0.20-5001812-foveal-canvas-$case-unsigned.apk")
            originalApk.copyTo(isolatedInput)
            originalApk.copyTo(output)
            runBlocking {
                Patcher(PatcherConfig(isolatedInput, File(directory, "temporary"))).use { patcher ->
                    patcher += selection
                    val results = patcher().toList()
                    results.forEach { result ->
                        record("Morphe ${if (result.exception == null) "PASS" else "FAIL"}: ${result.patch.name}")
                        result.exception?.let { record(it.stackTraceToString()) }
                    }
                    check(results.none { it.exception != null }) { "Morphe execution/finalize failed" }
                    patcher.get().applyTo(output)
                }
            }
            check(output.isFile && output.length() > 0)
            ZipFile(originalApk).use { original -> ZipFile(output).use { patched ->
                val before = original.fileNames()
                val after = patched.fileNames()
                val helperPath = "lib/arm64-v8a/$FOVEAL_CANVAS_LIBRARY"
                val manifestPath = LAYER_DIRECTORY + FOVEAL_CANVAS_MANIFEST
                check(helperPath !in before && manifestPath !in before)
                check(patched.entryBytes(helperPath).contentEquals(expectedHelper)) { "Packaged canvas helper mismatch" }
                check(patched.entryBytes(manifestPath).contentEquals(expectedManifest)) { "Packaged canvas manifest mismatch" }
                val actualScene = patched.entryBytes(SCENE)
                validateFovealCanvasScene(actualScene)
                val triggerPath = "lib/arm64-v8a/$ANDROID_SURFACE_TRIGGER_LIBRARY"
                val triggerManifestPath = LAYER_DIRECTORY + ANDROID_SURFACE_TRIGGER_MANIFEST
                check((triggerPath in after) == expectTrigger && (triggerManifestPath in after) == expectTrigger) {
                    "Unexpected installed Surface-trigger presence for $case"
                }
                if (expectTrigger) {
                    val triggerResource = androidSurfaceTriggerResourceLibraryForBuild("2.0.20", "5001812")
                    check(patched.entryBytes(triggerPath).contentEquals(projectionModeResource(triggerResource)))
                    check(patched.entryBytes(triggerManifestPath).contentEquals(projectionModeResource(ANDROID_SURFACE_TRIGGER_MANIFEST)))
                }
                if (case == "alone") {
                    val added = after - before
                    check(added.filterNot { it.startsWith("META-INF/") }.toSet() == setOf(helperPath, manifestPath)) {
                        "Unexpected canvas-only additions: $added"
                    }
                    check((before - after).all { it.startsWith("META-INF/") }) { "Unexpected non-signature entries removed" }
                    var untouched = 0
                    before.filterNot { it.startsWith("META-INF/") }.forEach { name ->
                        check(original.entryBytes(name).contentEquals(patched.entryBytes(name))) { "Canvas-only changed existing entry: $name" }
                        untouched++
                    }
                    val dex = before.filter { Regex("classes\\d*\\.dex").matches(it) }
                    check(dex.isNotEmpty() && "AndroidManifest.xml" in before)
                    record("PASS canvas-only boundary: $untouched existing non-signature entries byte-identical; scene, AndroidManifest.xml and ${dex.size} DEX files preserved.")
                } else if (case in setOf("trigger-first", "canvas-first")) {
                    check(stockScene.contentEquals(actualScene)) { "Combined resolution API layers changed the scene library" }
                    val beforeDex = before.filter { Regex("classes\\d*\\.dex").matches(it) }.toSet()
                    val afterDex = after.filter { Regex("classes\\d*\\.dex").matches(it) }.toSet()
                    check(beforeDex.isNotEmpty() && beforeDex == afterDex)
                    beforeDex.forEach { name -> check(original.entryBytes(name).contentEquals(patched.entryBytes(name))) }
                    record("PASS combined-resolution boundary: scene and DEX unchanged; both exact pinned helpers installed.")
                }
                record("PASS immutable renderer functions; canvas helper SHA-256=${expectedHelper.sha256()}; canvas manifest SHA-256=${expectedManifest.sha256()}; scene SHA-256=${actualScene.sha256()}; Surface trigger present=$expectTrigger")
            } }
            check(originalApk.sha256() == ORIGINAL_APK_SHA256) { "Original signed Valve input was modified" }
            record("PASS original input unchanged; output=${output.path}; bytes=${output.length()}; SHA-256=${output.sha256()}; unsigned=true")
        } catch (failure: Throwable) {
            record("FAIL: ${failure.stackTraceToString()}")
            throw failure
        } finally {
            File(directory, "report.txt").writeText(lines.joinToString("\n", postfix = "\n"))
        }
    }

    private fun ZipFile.entryBytes(name: String): ByteArray =
        getInputStream(getEntry(name) ?: error("Missing APK entry: $name")).use { it.readBytes() }

    private fun ZipFile.fileNames(): Set<String> {
        val names = entries().asSequence().filterNot { it.isDirectory }.map { it.name }.toList()
        check(names.distinct().size == names.size) { "Duplicate APK entries" }
        return names.toSet()
    }

    private fun ByteArray.sha256(): String = MessageDigest.getInstance("SHA-256")
        .digest(this).joinToString("") { "%02x".format(it) }

    private fun File.sha256(): String {
        val digest = MessageDigest.getInstance("SHA-256")
        inputStream().use { stream ->
            val buffer = ByteArray(128 * 1024)
            while (true) {
                val count = stream.read(buffer)
                if (count < 0) break
                digest.update(buffer, 0, count)
            }
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }
}
