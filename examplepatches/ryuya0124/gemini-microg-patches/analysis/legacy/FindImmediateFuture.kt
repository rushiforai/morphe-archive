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
            for (method in clazz.methods) {
                if (method.name == "immediateFuture" || (method.returnType == "Lcom/google/common/util/concurrent/ListenableFuture;" && method.name == "m")) {
                    println("Found future creator: ${clazz.type}->${method.name} ${method.parameterTypes} -> ${method.returnType}")
                }
            }
        }
    }
}
