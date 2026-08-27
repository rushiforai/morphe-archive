import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherResult
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.dex.NoOpDexVerifier
import app.morphe.patches.music.layout.pinplaylist.pinPlaylistPatch
import app.morphe.patches.music.misc.gms.gmsCoreSupportPatch
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import java.io.File

fun main() = runBlocking<Unit> {
    val apk = File(requireNotNull(System.getProperty("localTestApk")))
    val output = File(requireNotNull(System.getProperty("localTestOutput")))
    val version = System.getProperty("localTestVersion") ?: "9.24.51"

    check(apk.isFile) { "APK not found: $apk" }
    check(output.mkdirs() || output.isDirectory) { "Cannot create output: $output" }

    val patcher = Patcher(
        PatcherConfig(
            apk,
            File(output, "patching"),
            "com.google.android.apps.youtube.music",
            version,
            false,
            emptySet(),
            BytecodeMode.FULL,
            NoOpDexVerifier,
        ),
    )

    try {
        patcher += setOf(gmsCoreSupportPatch, pinPlaylistPatch)
        var patchFailure: Throwable? = null
        patcher().collect { result ->
            println(
                "${result.patch.name}: " +
                    (result.exception?.stackTraceToString() ?: "success"),
            )
            if (result.exception != null) {
                patchFailure = result.exception
            }
        }
        patchFailure?.let { throw it }

        val result = patcher.get()
        val patchedApk = File(output, "ytmusic-$version-test-unsigned.apk")
        apk.copyTo(patchedApk, overwrite = true)
        val apkUtils = Class
            .forName("app.morphe.patcher.apk.ApkUtils")
            .getField("INSTANCE")
            .get(null)
        apkUtils.javaClass
            .getMethod("applyTo", PatcherResult::class.java, File::class.java)
            .invoke(apkUtils, result, patchedApk)
    } finally {
        patcher.close()
    }
}
