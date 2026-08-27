import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.PatcherResult
import app.morphe.patcher.dex.BytecodeMode
import app.morphe.patcher.dex.NoOpDexVerifier
import app.morphe.patches.discord.bunny.bunnyPatch
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import java.io.File

fun main() = runBlocking<Unit> {
    val apk = File(requireNotNull(System.getProperty("localDiscordApk")))
    val output = File(requireNotNull(System.getProperty("localDiscordOutput")))
    val version = System.getProperty("localDiscordVersion") ?: "341.13 - Stable"

    check(apk.isFile) { "APK not found: $apk" }
    check(output.mkdirs() || output.isDirectory) { "Cannot create output: $output" }

    val patcher = Patcher(
        PatcherConfig(
            apk,
            File(output, "patching"),
            "com.discord",
            version,
            false,
            emptySet(),
            BytecodeMode.FULL,
            NoOpDexVerifier,
        ),
    )

    try {
        patcher += setOf(bunnyPatch)
        var patchFailure: Throwable? = null
        patcher().collect { result ->
            val exception = result.javaClass
                .getMethod("getException")
                .invoke(result) as? Throwable

            println("${result.patch.name}: ${exception?.stackTraceToString() ?: "success"}")
            if (exception != null) patchFailure = exception
        }
        patchFailure?.let { throw it }

        val result = patcher.get()
        val patchedApk = File(output, "discord-$version-bunny-unsigned.apk")
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
