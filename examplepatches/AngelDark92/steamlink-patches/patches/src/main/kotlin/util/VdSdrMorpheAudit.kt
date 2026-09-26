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
object VdSdrMorpheAudit {
    private const val SCENE = "lib/arm64-v8a/libvrlink_scene.so"

    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size in 3..4) {
            "Usage: VdSdrMorpheAudit <fixture.apk> <new-output-directory> <off|8-bit|10-bit> [foveal-gamma]"
        }
        val fixture = File(args[0]).canonicalFile
        val directory = File(args[1]).canonicalFile
        val inputDepth = args[2]
        val fovealGamma = args.getOrNull(3)?.toFloat() ?: 1f
        require(fixture.isFile) { "Missing fixture: $fixture" }
        require(inputDepth in setOf("off", "8-bit", "10-bit")) { "Invalid input depth: $inputDepth" }
        require(fovealGamma.isFinite() && fovealGamma in 1f..1.30f)
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
            val sourceHash = sourceScene.sha256()
            data class Base(val version: String, val code: String, val size: Int, val hash: String)
            val layout = listOf(
                Base("2.0.20", "5001712", 2221072, "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495"),
                Base("2.0.22", "5002244", 2251920, "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12"),
                Base("2.0.23", "5002363", 2292008, "628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0"),
            ).single { it.size == sourceScene.size && it.hash == sourceHash }
            record("Fixture: ${fixture.path}; SHA-256=$fixtureHash")
            record("Case: ${layout.version}/${layout.code}, declared $inputDepth, foveal gamma $fovealGamma")
            record("Evidence boundary: analysis/decoded-fixture APK; actual Morphe DSL finalize and unsigned packaging only. Not pristine APK, Android linking, GPU execution, install, headset or panel proof.")

            val mode = when (inputDepth) {
                "8-bit" -> FoveaMode.INPUT_8BIT
                "10-bit" -> FoveaMode.INPUT_10BIT
                else -> FoveaMode.OFF
            }
            val calibrated = sourceScene.copyOf().apply {
                paddedVideoShader(1.20f, 1.45f, VideoOutputPrecision.SRGB8_HIGHP)
                    .copyInto(this, findVideoShader(this))
            }
            val expected = applyVdSdrFovea(setProjectionSwapchainFormat(calibrated,
                VideoOutputPrecision.SRGB8_HIGHP, layout.version, layout.code),
                layout.version, layout.code, mode, fovealGamma)
            oledCalibrationPatch.options["profile"] = "final-balanced"
            oledCalibrationPatch.options["foveaVdLike10Bit"] = inputDepth == "10-bit"
            oledCalibrationPatch.options["foveaVdLike8Bit"] = inputDepth == "8-bit"
            oledCalibrationPatch.options["fovealGamma"] = fovealGamma
            // Read the actual APK metadata through the same Morphe resource context as the
            // production patch. Native identity alone is not an exact version-pair check.
            val metadataGuard = rawResourcePatch(name = "VD SDR fixture metadata audit") {
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
            selection += oledCalibrationPatch

            val isolated = File(directory, "isolated-input.apk")
            val output = File(directory, "steamlink-${layout.code}-$inputDepth-vd-sdr-unsigned.apk")
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
                check(patchedNames == originalNames) { "APK entries added/removed" }
                check(patched.entryBytes(SCENE).contentEquals(expected)) {
                    "Actual OLED option output differs from production helper expectation"
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
            record("PASS: exact scene output; no added entries; $untouched existing entries byte-identical, including manifest and $dexFiles DEX files; all sRGB8 sites; original fixture unchanged.")
            record("Output: ${output.path}; SHA-256=${output.sha256()}")
            record("Final scene SHA-256=${expected.sha256()}")
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

    private fun ByteArray.sha256(): String = MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }

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
