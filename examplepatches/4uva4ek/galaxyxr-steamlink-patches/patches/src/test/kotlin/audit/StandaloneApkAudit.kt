package audit

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.apk.ApkUtils.applyTo
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import app.morphe.patcher.patch.rawResourcePatch
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile
import com.google.gson.JsonParser
import kotlinx.coroutines.flow.toList
import kotlinx.coroutines.runBlocking
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore

/** Each case runs in its own JVM: Morphe patch instances carry execution state. */
object StandaloneApkAudit {
    private fun ByteArray.sha() = MessageDigest.getInstance("SHA-256").digest(this).joinToString("") { "%02x".format(it) }
    private fun ZipFile.bytes(name: String) = getInputStream(getEntry(name)).use { it.readBytes() }
    private fun ZipFile.classes(): List<ClassDef> = entries().asSequence()
        .filter { Regex("classes[0-9]*\\.dex").matches(it.name) }
        .flatMap { DexBackedDexFile(Opcodes.getDefault(), java.nio.ByteBuffer.wrap(bytes(it.name))).classes.asSequence() }.toList()
    private fun canonicalDex(classes: List<ClassDef>): ByteArray {
        val pool = DexPool(Opcodes.getDefault())
        classes.sortedBy { it.type }.forEach { pool.internClass(it) }
        val store = MemoryDataStore(); pool.writeTo(store)
        return store.data.copyOf(store.size)
    }
    @JvmStatic fun main(args: Array<String>) {
        val input = File(args[0]); val bundle = File(args[1]); val out = File(args[2]); val scenario = args[3]
        val expectedCode = args.getOrElse(4) { "5002527" }
        check(!out.exists()) { "Audit output already exists: $out" }; out.mkdirs()
        val originalHash = input.readBytes().sha()
        val all = loadPatchesFromJar(setOf(bundle))
        val expectedNames = setOf("Controller velocity frame", "Controller pose extrapolation",
            "Controller pose time (experimental)", "Controller throw angle (experimental)",
            "Controller tracking from the controller HAL through Shizuku", "Controller grip haptics through Shizuku",
            "Galaxy XR SteamVR driver (galaxyxr)", "OpenXR CPU and GPU BOOST (experimental)")
        check(all.map { it.name }.toSet() == expectedNames) { "Unexpected public patches: ${all.map { it.name }}" }
        val names = when (scenario) {
            "velocity" -> setOf("Controller velocity frame")
            "throw" -> setOf("Controller throw angle (experimental)", "Controller pose extrapolation")
            "time" -> setOf("Controller velocity frame", "Controller pose time (experimental)")
            "shizuku" -> setOf("Controller tracking from the controller HAL through Shizuku", "Controller grip haptics through Shizuku")
            "conflict" -> setOf("Controller pose time (experimental)", "Controller pose extrapolation")
            "driver" -> setOf("Galaxy XR SteamVR driver (galaxyxr)")
            "boost" -> setOf("OpenXR CPU and GPU BOOST (experimental)")
            "driverBoost" -> setOf("Galaxy XR SteamVR driver (galaxyxr)", "OpenXR CPU and GPU BOOST (experimental)", "Controller velocity frame")
            else -> error("Unknown scenario $scenario")
        }
        val guard = rawResourcePatch(name = "Exact original input guard", default = false) { execute {
            check(packageMetadata.packageName == "com.valvesoftware.steamlinkvr")
            val versions = mapOf("5001712" to "2.0.20", "5001812" to "2.0.20", "5001968" to "2.0.21",
                "5002244" to "2.0.22", "5002363" to "2.0.23", "5002395" to "2.0.24", "5002527" to "2.0.24")
            check(packageMetadata.versionName == versions[expectedCode] && packageMetadata.versionCode == expectedCode)
        } }
        val selected = linkedSetOf<Patch<*>>(guard).apply { addAll(all.filter { it.name in names }) }
        val output = File(out, "audit-only-unsigned.apk")
        val isolated = File(out, "input.apk"); input.copyTo(isolated); input.copyTo(output)
        runBlocking {
            Patcher(PatcherConfig(isolated, File(out, "temporary"))).use { patcher ->
                patcher += selected
                val results = patcher().toList()
                results.forEach { println("${it.patch.name}: ${it.exception?.stackTraceToString() ?: "PASS"}") }
                if (scenario == "conflict") {
                    check(results.any { it.exception?.message?.contains("cannot be combined") == true || it.exception?.message?.contains("Remove the") == true })
                    println("PASS: incompatible pose layers rejected")
                } else {
                    check(results.none { it.exception != null }) { "Patching failed" }
                    patcher.get().applyTo(output)
                }
            }
        }
        if (scenario != "conflict") ZipFile(input).use { stock -> ZipFile(output).use { patched ->
            val original = stock.entries().asSequence().filterNot { it.isDirectory }.map { it.name }.toSet()
            val final = patched.entries().asSequence().filterNot { it.isDirectory }.map { it.name }.toList()
            check(final.size == final.toSet().size) { "Duplicate entries" }
            val changed = original.filter { it !in final || !stock.bytes(it).contentEquals(patched.bytes(it)) }
            val driver = scenario == "driver" || scenario == "driverBoost"
            val allowedChanged: (String) -> Boolean = { (scenario == "shizuku" &&
                (it == "AndroidManifest.xml" || it == "resources.arsc" || it.startsWith("res/") || Regex("classes[0-9]*\\.dex").matches(it))) ||
                (driver && it in setOf("assets/config/hmd_config.json", "assets/config/controller_config.json")) }
            check(changed.all(allowedChanged)) { "Unrelated entries changed: ${changed.filterNot(allowedChanged)}" }
            if (driver) {
                val identityKeys = listOf("sTrackingSystem", "sSerialNumber", "sManufacturerName", "sModelNumber",
                    "sRenderModelName", "sResourceRoot", "sInputProfilePath", "sControllerType", "sDeviceType")
                for (config in listOf("hmd", "controller")) {
                    val path = "assets/config/${config}_config.json"
                    val before = JsonParser.parseString(stock.bytes(path).decodeToString()).asJsonObject
                    val after = JsonParser.parseString(patched.bytes(path).decodeToString()).asJsonObject
                    val beforeProps = before.getAsJsonObject("staticProps")
                    val afterProps = after.getAsJsonObject("staticProps")
                    val profile = "/interaction_profiles/oculus/touch_controller"
                    val keys = if (config == "hmd") listOf("xrvst2", "xrvst2ue", "unknown").filter { beforeProps.has(it) }
                        else listOf("left", "right")
                    for (key in keys) {
                        val b = (if (config == "hmd") beforeProps else beforeProps.getAsJsonObject(profile)).getAsJsonObject(key)
                        val a = (if (config == "hmd") afterProps else afterProps.getAsJsonObject(profile)).getAsJsonObject(key)
                        check(a["sResourceRoot"].asString == "galaxyxr")
                        check(a["sModelNumber"].asString == if (config == "hmd") "Galaxy XR" else "Galaxy XR (${key.replaceFirstChar { it.uppercase() }} Controller)")
                        check(a["sControllerType"].asString == if (config == "hmd") "galaxy_xr_hmd" else "oculus_touch")
                        check(a["sInputProfilePath"].asString.startsWith("{galaxyxr}/input/"))
                        identityKeys.forEach { b.remove(it); a.remove(it) }
                    }
                    if (config == "controller") {
                        val expected = JsonParser.parseString("""{"position":{"x":-0.007,"y":0.00279,"z":-0.05279},"rotation":{"x":1.4,"y":0.0,"z":0.0}}""")
                        val a = after.getAsJsonObject("poseAction").getAsJsonObject(profile)
                        check(a["offset"] == expected)
                        a.remove("offset"); before.getAsJsonObject("poseAction").getAsJsonObject(profile).remove("offset")
                    }
                    check(before == after) { "Unrelated config values changed in $path" }
                }
                println("PASS: vendor-driver identities/offsets verified; all unrelated config values preserved")
            }
            val added = final.toSet() - original
            if (scenario == "shizuku") {
                val originalClasses = stock.classes()
                val finalClasses = patched.classes()
                val originalTypes = originalClasses.map { it.type }.toSet()
                check(finalClasses.map { it.type }.toSet().size == finalClasses.size) { "Duplicate DEX class definitions" }
                check(canonicalDex(originalClasses).contentEquals(canonicalDex(finalClasses.filter { it.type in originalTypes }))) {
                    "An existing DEX class was modified or removed"
                }
                println("PASS: all ${originalTypes.size} existing DEX classes byte-identical after canonical serialization; no duplicate classes")
            }
            check(added.all { it.startsWith("lib/arm64-v8a/libgxr_") || it.startsWith("assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_") ||
                (scenario == "shizuku" && (it.startsWith("res/") || Regex("classes[0-9]*\\.dex").matches(it))) }) { "Unexpected entries: $added" }
            val expectedLayers = when(scenario) {
                "velocity" -> setOf("controller_velocity_frame")
                "throw" -> setOf("controller_velocity_frame", "controller_extrapolation")
                "time" -> setOf("controller_velocity_frame", "controller_pose_time")
                "driver" -> emptySet()
                "boost" -> setOf("performance_boost")
                "driverBoost" -> setOf("performance_boost", "controller_velocity_frame")
                else -> setOf("controller_hal_pose", "haptic_main")
            }
            expectedLayers.forEach {
                check("lib/arm64-v8a/libgxr_$it.so" in final)
                check("assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_$it.json" in final)
            }
            File(out,"result.txt").writeText("PASS $expectedCode $scenario\nInput SHA256: $originalHash\nOutput SHA256: ${output.readBytes().sha()}\nChanged: $changed\nAdded: $added\nOnly scenario-specific changes allowed.\nNo installation or runtime validation.\n")
            println("PASS: $expectedCode $scenario; changed=$changed; added=$added")
        } }
        check(input.readBytes().sha() == originalHash) { "Original APK changed" }
    }
}
