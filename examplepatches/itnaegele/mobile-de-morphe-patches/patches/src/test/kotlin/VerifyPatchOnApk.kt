import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File

fun main(args: Array<String>) {
    val apkPath = args.getOrNull(0) ?: "/Users/kornelius/mobile-de-morphe/apks/mobile-de-10.29.apk"
    val mppPath = args.getOrNull(1) ?: "build/libs/patches-1.0.0.mpp"
    val outApkPath = args.getOrNull(2) ?: "/tmp/morphe-verify/mobile-de-10.29-patched.apk"

    val apkFile = File(apkPath).canonicalFile
    val mppFile = File(mppPath).canonicalFile
    val tempDir = File("/tmp/morphe-verify/work")
    val outApk = File(outApkPath)
    outApk.parentFile.mkdirs()

    println("Loading patches from: $mppFile")
    val patches = loadPatchesFromJar(setOf(mppFile))
    println("Loaded ${patches.size} patch(es): ${patches.map { it.name }}")
    require(patches.isNotEmpty()) { "No patches loaded from $mppFile" }

    val config = PatcherConfig(
        apkFile = apkFile,
        temporaryFilesPath = tempDir,
        validate = true,
    )

    var failed = false
    Patcher(config).use { patcher ->
        patcher += patches
        runBlocking {
            patcher().collect { result ->
                if (result.exception != null) {
                    failed = true
                    System.err.println("PATCH FAILED: ${result.patch.name}")
                    result.exception?.printStackTrace()
                } else {
                    println("PATCH SUCCEEDED: ${result.patch.name}")
                }
            }
        }
        if (failed) {
            error("One or more patches failed!")
        }
        println("Compiling DEX & writing patched APK to: $outApk")
        patcher.writeApk(outApk)
        println("SUCCESS! Patched APK size: ${outApk.length()} bytes")
    }
}
