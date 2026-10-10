package santodan.patches

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import kotlinx.coroutines.runBlocking
import java.io.File

fun main(args: Array<String>) = runBlocking {
    val output = File(args[2]).apply { mkdirs() }
    val loaded = loadPatchesFromJar(setOf(File(args[1])))
    val weightName = "Pillo - Import weight history from JSON"
    val hasWeight = loaded.any { it.name == weightName }
    for (together in listOf(false, true)) {
        val selected = loaded.filter {
            it.name == PilloLocalBackupPatch.NAME || (together &&
                (it.name == weightName || it.name == PilloHybridNotificationPatch.NAME))
        }.toSet()
        check(selected.size == if (together) (if (hasWeight) 3 else 2) else 1)
        val run = File(output, if (together) "all-pillo" else "local-only").apply { mkdirs() }
        Patcher(PatcherConfig(apkFile = File(args[0]), temporaryFilesPath = File(run, "work"))).use { patcher ->
            patcher += selected
            patcher().collect { result -> result.exception?.let { throw it } }
            val result = patcher.get()
            val classes = mutableSetOf<String>()
            val hooks = mutableSetOf<String>()
            for (dex in result.dexFiles) {
                val file = File(run, dex.name)
                dex.stream.use { input -> file.outputStream().use { input.copyTo(it) } }
                file.inputStream().buffered().use { input ->
                    for (owner in DexBackedDexFile.fromInputStream(null, input).classes) {
                        classes.add(owner.type)
                        if (owner.type in setOf(PilloLocalBackupPatch.APP, PilloLocalBackupPatch.ACTIVITY, PilloLocalBackupPatch.SETTINGS,
                                PilloLocalBackupPatch.ONBOARDING, PilloLocalBackupPatch.RESTORE_MENU))
                            for (method in owner.methods) {
                                if (PilloHybridNotificationPatch.instructions(method).any {
                                    PilloHybridNotificationPatch.calls(it, PilloLocalBackupPatch.EXTENSION, "chooseTransport", "Z",
                                        "Ljava/lang/Object;", "Landroid/content/Context;", "Landroid/app/Activity;", "Ljava/lang/Object;")
                                }) hooks.add("chooseTransport")
                                if (PilloHybridNotificationPatch.instructions(method).any {
                                    PilloHybridNotificationPatch.calls(it, PilloLocalBackupPatch.EXTENSION, "onboardingChoice", "Ljava/lang/Object;",
                                        "Ljava/lang/Object;", "Ljava/lang/Object;")
                                }) hooks.add("onboardingChoice")
                                for (instruction in PilloHybridNotificationPatch.instructions(method))
                                    for (hook in listOf("beforeAttach", "afterCreate", "attach", "attachOnboarding"))
                                        if (PilloHybridNotificationPatch.calls(instruction, PilloLocalBackupPatch.EXTENSION, hook, "V",
                                                if (hook == "attach" || hook == "attachOnboarding") "Landroid/app/Activity;" else "Landroid/content/Context;")) hooks.add(hook)
                            }
                    }
                }
            }
            check(hooks == setOf("beforeAttach", "afterCreate", "attach", "chooseTransport", "attachOnboarding", "onboardingChoice")) { "Missing local backup hooks" }
            check(classes.contains(PilloLocalBackupPatch.EXTENSION))
            check(classes.contains("Lsoftware/santodan/extension/pillobackup/PilloLocalBackup\$LocalBackupFragment;"))
            check(classes.contains("Lsoftware/santodan/extension/pillobackup/LocalArchive;"))
            check(classes.contains("Lsoftware/santodan/extension/pilloweight/PilloWeightImport;") == (together && hasWeight)) { "Weight import should be independent" }
            println("PASS: packaged local backup patch ${if (together) "with the other available Pillo patches" else "alone"} applies to original APK; assembled DEX includes all lifecycle hooks and archive runtime")
        }
    }
}
