package app.ahmedyarub.patches.harness

import java.io.File
import kotlin.system.exitProcess

/**
 * Entry point of the JVM [ApkPatching.patch] starts for each run.
 *
 * Arguments: the APK, a label for the output files, the result file, then the names of the
 * patches to apply.
 */
internal object PatchRunner {
    @JvmStatic
    fun main(args: Array<String>) {
        val (apk, label, resultFile) = args
        val names = args.drop(3).toSet()

        val patches = Bundle.patches.filter { it.name in names }.toSet()
        val missing = names - patches.mapNotNull { it.name }.toSet()
        require(missing.isEmpty()) { "Not in the bundle: $missing" }

        ApkPatching.patchHere(File(apk), patches, label, File(resultFile))
        // Coroutine and patcher threads would otherwise keep the JVM alive.
        exitProcess(0)
    }
}
