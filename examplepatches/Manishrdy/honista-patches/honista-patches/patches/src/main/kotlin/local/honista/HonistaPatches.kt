package local.honista

import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import java.io.InputStream
import java.security.MessageDigest

private object Payload {
    fun open(name: String): InputStream = javaClass.classLoader.getResourceAsStream("honista/$name")
        ?: throw PatchException("Missing Honista payload: $name")
}
private fun InputStream.sha256(): String = use { input ->
    val digest = MessageDigest.getInstance("SHA-256")
    val bytes = ByteArray(65536)
    while (true) {
        val count = input.read(bytes)
        if (count == -1) break
        digest.update(bytes, 0, count)
    }
    digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) }
}
private val target = Compatibility(
    name = "Honista", packageName = "cc.honista.app", apkFileType = ApkFileType.APK,
    appIconColor = 0x862DDE,
    targets = listOf(AppTarget(version = "426.0.0.37.70"))
)
// DEX serialization is not a portable fingerprint format across dexlib/runtime
// versions. Serialize both the trusted reference and input with the same writer.
internal fun classDigest(def: ClassDef): String {
    val store = MemoryDataStore()
    val pool = DexPool(Opcodes.getDefault())
    pool.internClass(def)
    pool.writeTo(store)
    return store.data.copyOf(store.size).inputStream().sha256()
}
internal fun validateOriginalClasses(findClass: (String) -> ClassDef?) {
    if (findClass("LX/LocalSponsoredFilter;") != null || findClass("LX/LocalModuleOverride;") != null)
        throw PatchException("Unsupported input: already patched. Select the original APK.")
    val baseline = Payload.open("baseline.dex").use {
        DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it.buffered())
    }
    baseline.classes.forEach { reference ->
        val actual = findClass(reference.type)
            ?: throw PatchException("Unsupported input: required class ${reference.type} is missing. Select the original Honista v13 ARM64 APK.")
        if (classDigest(actual) != classDigest(reference))
            throw PatchException("Unsupported input: ${reference.type} differs from the tested original APK. Select the original Honista v13 ARM64 APK; modified APKs are not supported.")
    }
}
private val validatedInput = bytecodePatch {
    execute {
        if (packageMetadata.packageName != "cc.honista.app" ||
            packageMetadata.versionName != "426.0.0.37.70" ||
            packageMetadata.versionCode != "383207254")
            throw PatchException("Unsupported input: select the original Honista v13 ARM64 APK.")
        validateOriginalClasses { classDefByOrNull(it) }
    }
}
// Raw-resource dependency copies only the patched dynamic module asset.
private val validatedModule = rawResourcePatch {
    dependsOn(validatedInput)
    execute {
        val destination = this["assets/local-startup-module.dex", false]
        destination.parentFile.mkdirs()
        Payload.open("startup-module.dex").use { input -> destination.outputStream().use { input.copyTo(it) } }
    }
}
private fun Method.signature() = name + "(" + parameterTypes.joinToString("") + ")" + returnType

/** All interdependent, validated changes from the working local build. */
val completeHonistaPatch = bytecodePatch(
    name = "Honista v13 complete local fixes",
    description = "Enable local premium-gated features, block Honista ad commands and Instagram sponsored/suggested entries, and apply the tested startup, quality and profile fixes.",
    default = true
) {
    compatibleWith(target)
    dependsOn(validatedModule)
    extendWith("honista/helpers.dex")
    execute {
        val replacements = Payload.open("methods.dex").use {
            DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it.buffered())
        }
        // First check every signature before altering any method.
        val missing = mutableListOf<String>()
        replacements.classes.forEach { replacement ->
            val original = classDefByOrNull(replacement.type)
            if (original == null) {
                missing += "Required class missing: ${replacement.type}"
            } else replacement.methods.forEach { method ->
                val previous = original.methods.find { it.signature() == method.signature() }
                if (previous == null)
                    missing += "Required method missing: ${replacement.type}->${method.signature()}"
                else if (previous.accessFlags and 0x100 != 0)
                    missing += "Refusing to replace native method: ${replacement.type}->${method.signature()}"
            }
        }
        missing += referenceProblems(replacements.classes) { classDefByOrNull(it) }
        if (missing.isNotEmpty()) throw PatchException(missing.joinToString("\n"))
        replacements.classes.forEach { replacement ->
            val original = mutableClassDefBy(replacement.type)
            replacement.methods.forEach { method ->
                val previous = original.methods.single { it.signature() == method.signature() }
                original.methods.remove(previous)
                original.methods.add(method.toMutable())
            }
        }
    }
}
