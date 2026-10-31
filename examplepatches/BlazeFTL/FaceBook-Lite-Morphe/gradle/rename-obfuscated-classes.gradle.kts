// Applied by extensions that ship classes with Facebook Lite's obfuscated names (see extensions/feedfont).
import com.android.build.api.artifact.ScopedArtifact
import com.android.build.api.variant.ApplicationAndroidComponentsExtension
import com.android.build.api.variant.ScopedArtifacts
import org.objectweb.asm.ClassReader
import org.objectweb.asm.ClassWriter
import org.objectweb.asm.commons.ClassRemapper
import org.objectweb.asm.commons.Remapper
import java.util.jar.JarEntry
import java.util.jar.JarFile
import java.util.jar.JarOutputStream

/**
 * Facebook Lite's obfuscated classes start with a digit (X.0eF), which Java cannot name.
 * Sources and stubs use X.$0eF instead, and this strips the "$" after compiling.
 */
abstract class RenameObfuscatedClassesTask : DefaultTask() {
    @get:InputFiles
    abstract val jars: ListProperty<RegularFile>

    @get:InputFiles
    abstract val dirs: ListProperty<Directory>

    @get:OutputFile
    abstract val output: RegularFileProperty

    @TaskAction
    fun rename() {
        val remapper = object : Remapper() {
            override fun map(internalName: String): String =
                if (internalName.startsWith("X/\$")) "X/" + internalName.substring(3) else internalName
        }
        val written = HashSet<String>()

        JarOutputStream(output.get().asFile.outputStream().buffered()).use { out ->
            fun add(name: String, bytes: ByteArray) {
                var entryName = name
                var entryBytes = bytes
                if (name.endsWith(".class")) {
                    val writer = ClassWriter(0)
                    ClassReader(bytes).accept(ClassRemapper(writer, remapper), 0)
                    entryName = remapper.map(name.removeSuffix(".class")) + ".class"
                    entryBytes = writer.toByteArray()
                }
                if (!written.add(entryName)) return
                out.putNextEntry(JarEntry(entryName))
                out.write(entryBytes)
                out.closeEntry()
            }

            dirs.get().forEach { directory ->
                val root = directory.asFile
                root.walk().filter { it.isFile }.forEach { add(it.relativeTo(root).invariantSeparatorsPath, it.readBytes()) }
            }
            jars.get().forEach { jar ->
                JarFile(jar.asFile).use { file ->
                    file.entries().asSequence().filter { !it.isDirectory }.forEach { entry ->
                        add(entry.name, file.getInputStream(entry).readBytes())
                    }
                }
            }
        }
    }
}

extensions.getByType<ApplicationAndroidComponentsExtension>().onVariants { variant ->
    val task = tasks.register<RenameObfuscatedClassesTask>("${variant.name}RenameObfuscatedClasses")
    variant.artifacts.forScope(ScopedArtifacts.Scope.PROJECT)
        .use(task)
        .toTransform(
            ScopedArtifact.CLASSES,
            RenameObfuscatedClassesTask::jars,
            RenameObfuscatedClassesTask::dirs,
            RenameObfuscatedClassesTask::output,
        )
}
