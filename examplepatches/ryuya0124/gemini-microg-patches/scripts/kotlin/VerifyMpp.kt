import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.util.jar.JarFile

fun main(args: Array<String>) {
    require(args.size == 2)
    JarFile(args[0]).use { jar ->
        val manifest = jar.manifest.mainAttributes
        check(manifest.getValue("Name") == "Gemini microG patches")
        check(manifest.getValue("Version") == args[1])
        check(manifest.getValue("Patcher-Version") == "2.5.0")
        val entries = jar.entries().asSequence().toList()
        val jvmTypes = entries.filter { it.name.endsWith(".class") }
            .map { "L${it.name.removeSuffix(".class")};" }.toSet()
        val dexTypes = entries.filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }
            .flatMap { entry ->
                jar.getInputStream(entry).buffered().use {
                    DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it).classes.map { clazz -> clazz.type }
                }
            }.toSet()
        check(jvmTypes.isNotEmpty())
        check(dexTypes.containsAll(jvmTypes)) { "Missing Android classes: ${jvmTypes - dexTypes}" }
        check("Lapp/morphe/patches/google/workprofile/WorkProfileEligibilityPatchKt;" in dexTypes)
        val extension = checkNotNull(jar.getJarEntry("extensions/microg-permissions.bin")) { "Missing permission runtime extension" }
        val runtimeTypes = jar.getInputStream(extension).buffered().use {
            DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it).classes.map { clazz -> clazz.type }.toSet()
        }
        check("Lapp/geminipatch/extension/MicrogPermissions;" in runtimeTypes)
        check("Lapp/geminipatch/extension/MicrogPermissions\$PermissionDialog;" in runtimeTypes)
        val update = checkNotNull(jar.getJarEntry("extensions/conversation-update.bin")) { "Missing conversation update runtime extension" }
        val updateTypes = jar.getInputStream(update).buffered().use {
            DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it).classes.map { clazz -> clazz.type }.toSet()
        }
        check(updateTypes == setOf("Lapp/geminipatch/extension/ConversationUpdateCompatibility;")) { "Unexpected conversation runtime: $updateTypes" }
        val haptics = checkNotNull(jar.getJarEntry("extensions/gemini-haptics.bin")) { "Missing haptic feedback runtime" }
        jar.getInputStream(haptics).buffered().use {
            val runtime = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it).classes
                .single { cls -> cls.type == "Lapp/geminipatch/extension/GeminiHaptics;" }
            check(runtime.methods.map { method -> method.name }
                .containsAll(listOf("addPreference", "addComposePreference", "addListPreference", "performFeedback")))
        }
        check(dexTypes.none { it.startsWith("Lapp/geminipatch/diagnostics/") || it.startsWith("Lapp/morphe/patches/google/diagnostics/") }) { "Diagnostics code must not be released" }
        println("MPP verified: manifest and all ${jvmTypes.size} JVM classes present in Android DEX")
    }
}
