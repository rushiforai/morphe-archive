import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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
            if (clazz.type == "Lflhx;") {
                for (method in clazz.methods) {
                    if (method.name == "apply") {
                        val impl = method.implementation ?: continue
                        val insList = impl.instructions.toList()
                        println("flhx.apply total instructions: ${insList.size}")
                        for (i in (insList.size - 10) until insList.size) {
                            val ins = insList[i]
                            val ref = if (ins is ReferenceInstruction) " -> ${ins.reference}" else ""
                            println("  [$i] ${ins.opcode}$ref")
                        }
                    }
                }
            }
        }
    }
}
