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
// Fingerprint every original class we modify, before any extension is merged.
internal fun classDigest(def: ClassDef): String {
    val store = MemoryDataStore()
    val pool = DexPool(Opcodes.getDefault())
    pool.internClass(def)
    pool.writeTo(store)
    return store.data.copyOf(store.size).inputStream().sha256()
}
private val validatedInput = bytecodePatch {
    execute {
        if (packageMetadata.packageName != "cc.honista.app" ||
            packageMetadata.versionName != "426.0.0.37.70" ||
            packageMetadata.versionCode != "383207254")
            throw PatchException("Unsupported input: select the original Honista v13 ARM64 APK.")
        if (classDefByOrNull("LX/LocalSponsoredFilter;") != null || classDefByOrNull("LX/LocalModuleOverride;") != null)
            throw PatchException("Unsupported input: already patched. Select the original APK.")
        Payload.open("baseline.tsv").bufferedReader().useLines { lines ->
            lines.filter { it.isNotBlank() }.forEach { line ->
                val (type, expected) = line.split('\t')
                val actual = classDefByOrNull(type)
                if (actual == null || classDigest(actual) != expected)
                    throw PatchException("Unsupported input: $type differs from the tested original APK.")
            }
        }
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
        replacements.classes.forEach { replacement ->
            val original = classDefByOrNull(replacement.type)
                ?: throw PatchException("Required class missing: ${replacement.type}")
            replacement.methods.forEach { method ->
                if (original.methods.none { it.signature() == method.signature() })
                    throw PatchException("Required method missing: ${replacement.type}->${method.signature()}")
            }
        }
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
