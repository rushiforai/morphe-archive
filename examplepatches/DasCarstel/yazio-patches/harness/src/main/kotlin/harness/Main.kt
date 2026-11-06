package harness

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import kotlinx.coroutines.runBlocking
import java.io.File

/**
 * Wendet ein Patch-Bundle auf eine APK an und legt das Ergebnis in ein
 * Ausgabeverzeichnis. Dient ausschliesslich dem Testen der Patches: die
 * eigentliche Installation erledigt Morphe auf dem Geraet.
 *
 * Aufruf: harness <apk> <patch-bundle.mpp> <ausgabeverzeichnis>
 */
fun main(args: Array<String>) {
    require(args.size == 3) { "Aufruf: harness <apk> <patch-bundle.mpp> <ausgabeverzeichnis>" }

    val apk = File(args[0]).also { require(it.isFile) { "APK nicht gefunden: $it" } }
    val bundle = File(args[1]).also { require(it.isFile) { "Bundle nicht gefunden: $it" } }
    val outputDirectory = File(args[2]).apply { mkdirs() }

    val patches = loadPatchesFromJar(setOf(bundle))
    println("Geladene Patches: ${patches.map { it.name }}")

    var failed = 0
    Patcher(
        PatcherConfig(
            apkFile = apk,
            temporaryFilesPath = File(outputDirectory, "tmp"),
        ),
    ).use { patcher ->
        patcher += patches

        runBlocking {
            patcher().collect { result ->
                val exception = result.exception
                if (exception != null) {
                    failed++
                    println("FEHLER  ${result.patch.name}: $exception")
                } else {
                    println("OK      ${result.patch.name}")
                }
            }
        }

        val patched = patcher.get()
        patched.resources.resourcesApk?.copyTo(
            File(outputDirectory, "resources-patched.apk"),
            overwrite = true,
        )
        println("Dex-Dateien: ${patched.dexFiles.size}")
        println("resources.apk: ${patched.resources.resourcesApk}")
        patched.resources.otherResources?.let { println("andere Ressourcen: $it") }
    }

    if (failed > 0) {
        println("$failed Patch(es) fehlgeschlagen")
        kotlin.system.exitProcess(1)
    }
    println("Fertig.")
}
