import app.morphe.patches.google.common.HookId
import app.morphe.patches.google.common.VersionHookRegistry
import com.reandroid.apk.ApkModule
import java.io.File
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import java.util.zip.ZipFile

/** Verify branch relocation in the activity modified by the permission patch. */
fun main(args: Array<String>) {
    val apk = ApkModule.loadApkFile(File(args.single()))
    val profile = try {
        VersionHookRegistry.requireProfile(apk.androidManifest.packageName.removeSuffix(".morphe"), apk.androidManifest.versionName)
    } finally { apk.close() }
    val spec = profile.hooks.getValue(HookId.MICROG_RUNTIME_PERMISSIONS)
    var checked = 0
    ZipFile(args.single()).use { zip ->
        zip.entries().asSequence().filter { it.name.matches(Regex("classes[0-9]*\\.dex")) }.forEach { entry ->
            val dex = zip.getInputStream(entry).buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it) }
            dex.classes.filter { it.type == spec.className }.forEach { clazz ->
                clazz.methods.filter { spec.matches(it) }.forEach { method ->
                    val instructions = method.implementation!!.instructions.toList()
                    var address = 0
                    val addresses = instructions.map { instruction -> address.also { address += instruction.codeUnits } }.toSet()
                    address = 0
                    for (instruction in instructions) {
                        if (instruction is OffsetInstruction) {
                            val target = address + instruction.codeOffset
                            check(target in addresses) { "${clazz.type}->${method.name}: invalid branch $address -> $target" }
                        }
                        address += instruction.codeUnits
                    }
                    checked++
                }
            }
        }
    }
    check(checked == spec.expectedMatches) { "Expected one MainActivity.onCreate, found $checked" }
    println("MainActivity.onCreate branch targets verified")
}
