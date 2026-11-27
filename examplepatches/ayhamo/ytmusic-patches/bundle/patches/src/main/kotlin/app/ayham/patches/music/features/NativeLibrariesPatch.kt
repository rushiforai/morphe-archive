package app.ayham.patches.music.features

import app.ayham.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import java.util.logging.Logger

private val NATIVE_LIBS = listOf(
    "libbitchord_analysis.so",
    "libbitchord_loopmix.so",
    "libonnxruntime.so",
    "libonnxruntime4j_jni.so",
)

/**
 * The native libraries automix needs, added to the APK:
 * Copies BitChord's analyser and ONNX Runtime (arm64-v8a, the only ABI YT Music ships) into lib/.
 */
val nativeLibrariesPatch = patch(
    name = "Automix libraries",
    description = "Adds BitChord's audio analyser, its loop-mix renderer and ONNX Runtime (arm64), and automix's two models. Needed by automix in \"BitChord player and automix\".",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    val log = Logger.getLogger("AutomixLibraries")

    execute {
        val libDir = resourceFile("lib/arm64-v8a")
        log.info("AutomixLibraries: lib/arm64-v8a exists=${libDir.isDirectory} files=${libDir.list()?.size}")
        NATIVE_LIBS.forEach { name ->
            val stream = object {}.javaClass.getResourceAsStream("/natives/lib/arm64-v8a/$name")
            if (stream == null) {
                log.warning("AutomixLibraries: $name not bundled")
                return@forEach
            }
            val out = resourceFile("lib/arm64-v8a/$name")
            out.parentFile.mkdirs()
            stream.use { input -> out.outputStream().use { input.copyTo(it) } }
            log.info("AutomixLibraries: added ${out.path} (${out.length()} bytes)")
        }

        // Automix's models (Beat This!, the vocal mask), copied to the app's files on first use.
        listOf("beat_this_final0_q8.onnx", "vocals_umxhq_int8.onnx").forEach { name ->
            val stream = object {}.javaClass.getResourceAsStream("/automix/$name")
            if (stream == null) {
                log.warning("AutomixLibraries: model $name not bundled")
                return@forEach
            }
            val out = resourceFile("assets/automix/$name")
            out.parentFile.mkdirs()
            stream.use { input -> out.outputStream().use { input.copyTo(it) } }
            log.info("AutomixLibraries: added ${out.path} (${out.length()} bytes)")
        }

        // New files are written compressed, and YT ships extractNativeLibs=false, which only
        // accepts uncompressed, page-aligned libraries. Let the installer extract them instead.
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()
            log.info("AutomixLibraries: extractNativeLibs was ${application.attribute("android:extractNativeLibs")}")
            application.setAttribute("android:extractNativeLibs", "true")
        }
    }
}
