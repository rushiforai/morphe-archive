package util

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import java.io.File

/** Private integration validation against an unmodified APK and optional community bundle. */
fun main(args: Array<String>) = runBlocking {
    require(args.size in 3..4) { "Urro bundle, input APK, empty work directory, optional community bundle" }
    val root = File(args[2])
    check(!root.exists()) { "Refusing to overwrite existing output" }
    root.mkdirs()
    val patches = loadPatchesFromJar(setOf(File(args[0])))
    val desired = setOf("ClipCascade sync", "Better translate UX")
    val selected = patches.filter { it.name in desired }.toMutableSet()
    check(selected.size == desired.size)
    val clip = selected.single { it.name == "ClipCascade sync" }
    // Disposable local fixture values, supplied by the caller and never used for a real account.
    clip.options["clipCascadeServer"] = System.getenv("GBOARD_TEST_SERVER") ?: error("Missing test server")
    clip.options["clipCascadeUsername"] = System.getenv("GBOARD_TEST_USER") ?: error("Missing test user")
    clip.options["clipCascadePassword"] = System.getenv("GBOARD_TEST_PASSWORD") ?: error("Missing test password")
    if (args.size == 4) {
        val community = loadPatchesFromJar(setOf(File(args[3])))
        val names = setOf("Clipboard Enhancements", "Clipboard Custom Character Limit", "Settings Homepage Override", "Package Rename")
        val clone = System.getenv("GBOARD_TEST_CLONE_BUNDLE")
        selected += community.filter { it.name in names && (clone == null || it.name != "Package Rename") }
        check(selected.any { it.name == "Clipboard Enhancements" }) { "No community Clipboard Enhancements patch found" }
    }
    // An isolated runtime test must not replace the user's active keyboard.
    System.getenv("GBOARD_TEST_CLONE_BUNDLE")?.let { bundle ->
        val clone = loadPatchesFromJar(setOf(File(bundle))).single { it.name == "Clone app" }
        clone.options["packageName"] = "com.google.android.inputmethod.latin.urrotest"
        selected += clone
    }
    Patcher(PatcherConfig(File(args[1]), root)).use { patcher ->
        patcher += selected
        patcher().collect { result ->
            check(result.exception == null) { "Patch ${result.patch.name} failed: ${result.exception}" }
            println("Applied ${result.patch.name ?: "dependency"}")
        }
        val result = patcher.get()
        val out = File(root, "dex").apply { mkdirs() }
        for (dex in result.dexFiles) File(out, dex.name).outputStream().use { output -> dex.stream.use { it.copyTo(output) } }
        val resources = result.resources?.resourcesApk ?: error("No rebuilt resources")
        check(resources.isFile) { "No resource APK" }
        val other = result.resources.otherResources
        check(File(other, "assets/urro_clipcascade.js").isFile) { "Missing protocol script" }
        check(File(other, "assets/urro_clipcascade.json").isFile) { "Missing test configuration" }
        println("PASS: native patches applied; ${result.dexFiles.size} DEX files and rebuilt resources")
    }
}
