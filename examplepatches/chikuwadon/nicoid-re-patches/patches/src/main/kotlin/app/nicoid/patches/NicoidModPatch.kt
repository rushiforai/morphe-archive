package app.nicoid.patches

import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.util.FieldUtil
import com.android.tools.smali.dexlib2.util.MethodUtil
import java.io.BufferedInputStream
import java.security.MessageDigest
import java.util.zip.ZipInputStream

private object Payload {
    fun open(name: String) = checkNotNull(javaClass.getResourceAsStream("/nicoid/$name")) {
        "Missing nicoid patch payload: $name"
    }
}

private val nicoid649 = Compatibility(
    name = "nicoid",
    packageName = "com.sauzask.nicoid",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "6.49"))
)

// Raw compiled resource differences preserve the exact IDs referenced by the original smali.
// Input DEX, manifest and resource table must match the supplied original before any write.
private val nicoidResources = rawResourcePatch {
    compatibleWith(nicoid649)
    execute {
        // RAW_ONLY stages compiled resources differently from decoded resource patches.
        val root = get("classes.dex").parentFile
        val workspace = root.parentFile
        fun original(path: String) = when (path) {
            "AndroidManifest.xml" -> workspace.resolve("AndroidManifest.xml.bin")
            "resources.arsc" -> workspace.resolve(path)
            else -> root.resolve(path)
        }
        Payload.open("input-hashes.txt").bufferedReader().useLines { lines ->
            lines.filter { it.isNotBlank() }.forEach { line ->
                val (expected, path) = line.split(" ", limit = 2)
                val digest = MessageDigest.getInstance("SHA-256")
                original(path).inputStream().use { input ->
                    val buffer = ByteArray(8192)
                    while (true) {
                        val size = input.read(buffer)
                        if (size < 0) break
                        digest.update(buffer, 0, size)
                    }
                }
                val actual = digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) }
                check(actual == expected) { "Unsupported input APK: $path differs from the tested nicoid 6.49." }
            }
        }
        ZipInputStream(Payload.open("resources.zip")).use { zip ->
            while (true) {
                val entry = zip.nextEntry ?: break
                val path = entry.name
                check(!path.contains("..") && !path.startsWith("/") &&
                    (path == "AndroidManifest.xml" || path == "resources.arsc" || path.startsWith("res/")))
                // Root entries are the files Morphe carries into the rebuilt APK.
                // The raw decoder's .bin manifest is a read-only input for verification.
                val output = root.resolve(path)
                output.parentFile.mkdirs()
                val bytes = zip.readBytes()
                output.writeBytes(bytes)
                zip.closeEntry()
            }
        }
    }
}


@Suppress("unused")
val nicoidModPatch = bytecodePatch(
    name = "nicoid Re",
    description = "nicoid向けのMorpheパッチ。現在のニコニコ動画の仕様に対応。ダークモードとAndroid 16にサポート。その他、各種機能の改善・追加。",
    default = true
) {
    compatibleWith(nicoid649)
    dependsOn(nicoidResources)
    extendWith("nicoid/helpers.mpe")
    execute {
        BufferedInputStream(Payload.open("method-delta.dex")).use { stream ->
            val delta = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), stream)
            for (source in delta.classes) {
                val target = mutableClassDefBy(source.type)
                check(target.superclass == source.superclass) { "Unexpected class hierarchy: ${source.type}" }
                // Materialize all views before editing so lazy direct/virtual views stay in sync.
                val methods = target.methods
                val direct = target.directMethods
                val virtual = target.virtualMethods
                for (method in source.methods) {
                    val prior = methods.filter { it.name == method.name &&
                        it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
                    methods.removeAll(prior.toSet())
                    direct.removeAll(prior.toSet())
                    virtual.removeAll(prior.toSet())
                    val replacement = method.toMutable()
                    methods.add(replacement)
                    if (MethodUtil.isDirect(method)) direct.add(replacement) else virtual.add(replacement)
                }
                val fields = target.fields
                val static = target.staticFields
                val instance = target.instanceFields
                fields.clear(); static.clear(); instance.clear()
                for (field in source.fields) {
                    val replacement = field.toMutable()
                    fields.add(replacement)
                    if (FieldUtil.isStatic(field)) static.add(replacement) else instance.add(replacement)
                }
                target.setAccessFlags(source.accessFlags)
            }
        }
    }
}

