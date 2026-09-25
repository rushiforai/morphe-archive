package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.steamlink.binary.*
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile

/** Actual Morphe DSL/finalize and unsigned ZIP packaging audit using decoded-fixture APKs.
 * Run each case in a fresh JVM: singleton patch execution state is not reusable across runs.
 * This is not a pristine-source APK, Android linker/GPU, install, or headset validation.
 */
object BlueNoiseMorpheAudit {
    private const val SCENE = "lib/arm64-v8a/libvrlink_scene.so"
    private const val HELPER = "lib/arm64-v8a/libgxd.so"

    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size in 4..6) {
            "Usage: BlueNoiseMorpheAudit <fixture.apk> <new-output-directory> <8-bit|10-bit> <withOled:true|false> [blue-first|oled-first] [fovea|background|both-fovea-first|both-background-first]"
        }
        val fixture = File(args[0]).canonicalFile
        val directory = File(args[1]).canonicalFile
        val inputDepth = args[2]
        val withOled = args[3].toBooleanStrict()
        val order = args.getOrElse(4) { "blue-first" }
        val layerSelection = args.getOrElse(5) { "fovea" }
        val layers = when (layerSelection) {
            "fovea" -> listOf(BlueNoiseLayer.FOVEA)
            "background" -> listOf(BlueNoiseLayer.BACKGROUND)
            "both-fovea-first" -> listOf(BlueNoiseLayer.FOVEA, BlueNoiseLayer.BACKGROUND)
            "both-background-first" -> listOf(BlueNoiseLayer.BACKGROUND, BlueNoiseLayer.FOVEA)
            else -> error("Invalid layer selection: $layerSelection")
        }
        require(fixture.isFile) { "Missing fixture: $fixture" }
        require(inputDepth in setOf("8-bit", "10-bit")) { "Invalid input depth: $inputDepth" }
        require(order in setOf("blue-first", "oled-first")) { "Invalid selection order: $order" }
        require(!directory.exists() || directory.listFiles().isNullOrEmpty()) {
            "Use an absent or empty output directory: $directory"
        }
        directory.mkdirs()
        val report = File(directory, "report.txt")
        val lines = mutableListOf<String>()
        fun record(line: String) { lines += line; println(line) }
        try {
            val fixtureHash = fixture.sha256()
            val sourceScene = ZipFile(fixture).use { it.entryBytes(SCENE) }
            val sourceHash = blueNoiseHash(sourceScene)
            val layout = BLUE_NOISE_LAYOUTS.singleOrNull {
                it.size == sourceScene.size && it.stockHash == sourceHash
            } ?: error("Fixture scene is not one of the 3 exact stock inputs: size=${sourceScene.size}, sha256=$sourceHash")
            record("Fixture: ${fixture.path}; SHA-256=$fixtureHash")
            record("Case: ${layout.version}/${layout.code}, declared $inputDepth, OLED=$withOled, selection order=$order, layers=$layerSelection")
            record("Evidence boundary: analysis/decoded-fixture APK; actual Morphe DSL finalize and unsigned packaging only. Not pristine APK, Android linking, GPU execution, install, headset or panel proof.")

            val mode = if (inputDepth == "8-bit") FoveaMode.INPUT_8BIT else FoveaMode.INPUT_10BIT
            val expectedBeforeHooks = sourceScene.copyOf()
            if (withOled) {
                paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP)
                    .copyInto(expectedBeforeHooks, findVideoShader(expectedBeforeHooks))
            }
            var expected = BlueNoiseResult(setProjectionSwapchainFormat(expectedBeforeHooks,
                VideoOutputPrecision.SRGB8_HIGHP, layout.version, layout.code), null)
            layers.forEach { layer -> expected = applyBlueNoiseLayer(expected.scene, layout.version,
                layout.code, mode, layer, existingHelper = expected.helper) }
            check(expected.helper != null) { "Expected production helper was not prepared" }

            fovealBlueNoisePatch.options["inputDepth"] = inputDepth
            backgroundBlueNoisePatch.options["inputDepth"] = inputDepth
            if (withOled) {
                oledCalibrationPatch.options["profile"] = "final-balanced"
                oledCalibrationPatch.options["foveaVdLike10Bit"] = false
                oledCalibrationPatch.options["foveaVdLike8Bit"] = false
            }
            // Read the actual APK metadata through the same Morphe resource context as the
            // production patch. Native identity alone is not an exact version-pair check.
            val metadataGuard = rawResourcePatch(name = "Blue-noise fixture metadata audit") {
                execute {
                    check(packageMetadata.packageName == "com.valvesoftware.steamlinkvr") {
                        "Fixture package mismatch: ${packageMetadata.packageName}"
                    }
                    check(packageMetadata.versionName == layout.version && packageMetadata.versionCode == layout.code) {
                        "Fixture metadata mismatch: ${packageMetadata.versionName}/${packageMetadata.versionCode}"
                    }
                }
            }
            val selection = linkedSetOf<Patch<*>>(metadataGuard)
            if (withOled && order == "oled-first") selection += oledCalibrationPatch
            layers.forEach { selection += if (it == BlueNoiseLayer.FOVEA) fovealBlueNoisePatch else backgroundBlueNoisePatch }
            if (withOled && order == "blue-first") selection += oledCalibrationPatch

            val isolated = File(directory, "isolated-input.apk")
            val output = File(directory, "steamlink-${layout.code}-$inputDepth-${if (withOled) "oled" else "stock"}-$order-unsigned.apk")
            fixture.copyTo(isolated)
            fixture.copyTo(output)
            runBlocking {
                Patcher(PatcherConfig(isolated, File(directory, "temporary"))).use { patcher ->
                    patcher += selection
                    val results = patcher().toList()
                    results.forEach { result ->
                        record("Morphe ${if (result.exception == null) "PASS" else "FAIL"}: ${result.patch.name}")
                        result.exception?.let { record(it.stackTraceToString()) }
                    }
                    check(results.none { it.exception != null }) { "Morphe patch execution/finalize failed" }
                    patcher.get().applyTo(output)
                }
            }
            check(output.isFile && output.length() > 0) { "Morphe emitted no APK" }
            var untouched = 0
            var dexFiles = 0
            ZipFile(fixture).use { original -> ZipFile(output).use { patched ->
                val originalNames = original.fileNames()
                val patchedNames = patched.fileNames()
                check(HELPER !in originalNames) { "Stock fixture unexpectedly contains the experiment helper" }
                check(patchedNames - originalNames == setOf(HELPER)) {
                    "Unexpected added APK entries: ${patchedNames - originalNames}"
                }
                check(originalNames - patchedNames == emptySet<String>()) {
                    "Unexpected removed APK entries: ${originalNames - patchedNames}"
                }
                check(patched.entryBytes(SCENE).contentEquals(expected.scene)) {
                    "Actual finalized scene differs from production helper expectation"
                }
                check(patched.entryBytes(HELPER).contentEquals(expected.helper)) {
                    "Actual packaged helper differs from final masked-shader hash/fovea-call configuration"
                }
                val formatOffsets = when (layout.code) {
                    "5001712" -> intArrayOf(0x10a9c4, 0x10aa34)
                    "5002244" -> intArrayOf(0x10826c, 0x1082dc, 0x10834c)
                    "5002363" -> intArrayOf(0x10c840, 0x10c8b0, 0x10c920)
                    else -> error("No independently verified sRGB8 sites")
                }
                val actualScene = patched.entryBytes(SCENE)
                formatOffsets.forEach { offset ->
                    check(actualScene.copyOfRange(offset, offset + 4).contentEquals(
                        byteArrayOf(0x69, 0x88.toByte(), 0x91.toByte(), 0x52))) { "Output is not sRGB8 at 0x${offset.toString(16)}" }
                }
                originalNames.filter { it != SCENE }.forEach { name ->
                    check(original.entryBytes(name).contentEquals(patched.entryBytes(name))) {
                        "Unrelated APK entry changed: $name"
                    }
                    untouched++
                    if (Regex("classes(?:[0-9]+)?\\.dex").matches(name)) dexFiles++
                }
                check("AndroidManifest.xml" in originalNames && dexFiles > 0) { "Fixture lacks manifest or DEX proof" }
            } }
            check(fixture.sha256() == fixtureHash) { "Original fixture was modified" }
            record("PASS: exact scene/helper output; 1 added helper; $untouched existing entries byte-identical, including manifest and $dexFiles DEX files; all sRGB8 sites; original fixture unchanged.")
            record("Output: ${output.path}; SHA-256=${output.sha256()}")
            record("Finalized helper SHA-256=${blueNoiseHash(checkNotNull(expected.helper))}; scene SHA-256=${blueNoiseHash(expected.scene)}")
        } catch (failure: Throwable) {
            record("FAIL: ${failure.stackTraceToString()}")
            throw failure
        } finally {
            report.writeText(lines.joinToString("\n", postfix = "\n"))
        }
    }

    private fun ZipFile.entryBytes(name: String): ByteArray =
        getInputStream(getEntry(name) ?: error("APK entry missing: $name")).use { it.readBytes() }

    private fun ZipFile.fileNames(): Set<String> {
        val names = entries().asSequence().filterNot { it.isDirectory }.map { it.name }.toList()
        check(names.distinct().size == names.size) { "Duplicate APK entry names" }
        return names.toSet()
    }

    private fun File.sha256(): String {
        val digest = MessageDigest.getInstance("SHA-256")
        inputStream().use { input ->
            val buffer = ByteArray(128 * 1024)
            while (true) {
                val count = input.read(buffer)
                if (count < 0) break
                digest.update(buffer, 0, count)
            }
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }
}
