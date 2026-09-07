import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.util.jar.JarFile

fun main(args: Array<String>) {
    require(args.size == 2)
    JarFile(args[0]).use { jar ->
        val manifest = jar.manifest.mainAttributes
        check(manifest.getValue("Name") == "Gemini microG patches")
        check(manifest.getValue("Version") == args[1])
        check(manifest.getValue("Patcher-Version") == "1.12.0")
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
        println("MPP verified: manifest and all ${jvmTypes.size} JVM classes present in Android DEX")
    }
}
