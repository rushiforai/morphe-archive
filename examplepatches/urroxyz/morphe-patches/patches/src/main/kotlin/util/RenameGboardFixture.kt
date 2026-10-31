package util

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.rewriter.DexRewriter
import com.android.tools.smali.dexlib2.rewriter.RewriterModule
import com.android.tools.smali.dexlib2.rewriter.Rewriter
import com.android.tools.smali.dexlib2.rewriter.Rewriters
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import java.util.zip.ZipEntry
import java.util.zip.ZipFile
import java.util.zip.ZipOutputStream

/** Patch-only regression fixture: deliberately change every default-package R8 class name.
 * This invalidates the APK signature and is never an installable test build.
 */
fun main(args: Array<String>) {
    require(args.size == 2) { "Input APK and new output fixture" }
    val output = File(args[1])
    check(!output.exists())
    var classes = 0
    val rewriter = DexRewriter(object : RewriterModule() {
        override fun getTypeRewriter(rewriters: Rewriters): Rewriter<String> = Rewriter { type ->
            val rank = type.takeWhile { it == '[' }
            val element = type.substring(rank.length)
            if (element.startsWith("L") && '/' !in element) rank + "Lreobfuscated/" + element.substring(1) else type
        }
    })
    ZipFile(args[0]).use { source ->
        ZipOutputStream(output.outputStream()).use { target ->
            source.entries().asSequence().forEach { entry ->
                if (entry.name.startsWith("META-INF/")) return@forEach
                var bytes = source.getInputStream(entry).use { it.readBytes() }
                if (entry.name.matches(Regex("classes[0-9]*\\.dex"))) {
                    val dex = DexBackedDexFile(Opcodes.getDefault(), java.nio.ByteBuffer.wrap(bytes))
                    classes += dex.classes.count { '/' !in it.type }
                    val temp = File.createTempFile("reobfuscated-", ".dex", output.parentFile)
                    try {
                        DexPool.writeTo(temp.absolutePath, rewriter.dexFileRewriter.rewrite(dex))
                        bytes = temp.readBytes()
                    } finally { temp.delete() }
                }
                target.putNextEntry(ZipEntry(entry.name))
                target.write(bytes)
                target.closeEntry()
            }
        }
    }
    println("PASS: renamed $classes obfuscated class definitions; patch-only fixture, DO NOT INSTALL")
}
