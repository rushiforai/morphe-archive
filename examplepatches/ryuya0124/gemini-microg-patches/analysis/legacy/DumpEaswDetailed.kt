import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import java.io.File
import java.util.zip.ZipFile

fun main() {
    val apkFile = File("agsa_base.apk")
    val zip = ZipFile(apkFile)
    val entries = zip.entries().toList().filter { it.name.startsWith("classes") && it.name.endsWith(".dex") }

    for (entry in entries) {
        val tempFile = File.createTempFile("dex_", ".dex")
        tempFile.deleteOnExit()
        zip.getInputStream(entry).use { input ->
            tempFile.outputStream().use { output ->
                input.copyTo(output)
            }
        }
        val dexFile = DexFileFactory.loadDexFile(tempFile, Opcodes.getDefault())
        for (clazz in dexFile.classes) {
            if (clazz.type == "Leasw;") {
                for (method in clazz.methods) {
                    if (method.name == "a") {
                        println("Method: ${method.name} regCount: ${method.implementation?.registerCount}")
                        val impl = method.implementation ?: continue
                        var idx = 0
                        for (inst in impl.instructions) {
                            val refStr = if (inst is ReferenceInstruction) " -> ${inst.reference}" else ""
                            println("  [$idx] ${inst.opcode}$refStr")
                            idx++
                        }
                    }
                }
            }
        }
    }
}
