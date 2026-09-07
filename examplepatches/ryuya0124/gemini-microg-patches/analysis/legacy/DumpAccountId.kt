import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
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
            if (clazz.type.contains("AccountId")) {
                println("Class: ${clazz.type} super: ${clazz.superclass}")
                for (method in clazz.methods) {
                    if (method.name in listOf("<init>", "b", "a", "fromInt", "create")) {
                        println("  Method: ${method.name} ${method.parameterTypes} -> ${method.returnType}")
                    }
                }
            }
        }
    }
}
