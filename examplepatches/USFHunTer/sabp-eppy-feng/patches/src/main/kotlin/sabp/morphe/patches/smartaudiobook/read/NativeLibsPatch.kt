package sabp.morphe.patches.smartaudiobook.read

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import sabp.morphe.patches.smartaudiobook.smartAudioBookCompatibility

/**
 * Adds eppy's native speech engine (whisper.cpp, MIT, built for arm64 in CI) to the APK's
 * lib/arm64-v8a, next to SABP's own BASS libraries. The list of files is in libs.txt, written by
 * the build, so a build without the engine simply adds nothing.
 */
internal val nativeLibsPatch = resourcePatch(
    description = "Bundles eppy's on-device transcription engine. Applied with the eppy patch.",
) {
    compatibleWith(smartAudioBookCompatibility)

    execute {
        val list = object {}.javaClass.getResourceAsStream("/sabp/native/libs.txt") ?: return@execute
        val names = list.bufferedReader().readLines().map(String::trim).filter { it.endsWith(".so") }
        for (name in names) {
            val out = get("lib/arm64-v8a/$name")
            out.parentFile.mkdirs()
            val stream = object {}.javaClass.getResourceAsStream("/sabp/native/arm64-v8a/$name")
                ?: throw PatchException("Bundled native library $name is missing from the patches file.")
            stream.use { input -> out.outputStream().use { input.copyTo(it) } }
        }
        if (names.isEmpty()) return@execute
        // SABP ships with extractNativeLibs="false", which requires every library to be stored
        // uncompressed and page-aligned in the APK. The patcher compresses files it adds, so let
        // Android extract the libraries at install time instead (a few MB of extra storage).
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            app.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
