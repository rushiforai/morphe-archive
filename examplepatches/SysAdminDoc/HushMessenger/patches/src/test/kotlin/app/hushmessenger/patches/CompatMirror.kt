package app.hushmessenger.patches

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import java.io.File
import java.net.URLClassLoader
import java.nio.file.Files
import java.nio.file.Path
import javax.tools.ToolProvider

/**
 * scripts/CompatReport.java compiled once into this test JVM, so its finders run on the same fixture classes the
 * patch's own finders get. CompatReport otherwise only meets the six real APKs, which shows it accepts their shapes
 * but not that it refuses the ones the patch refuses.
 */
object CompatMirror {
    private val report: Class<*> by lazy {
        val javac = ToolProvider.getSystemJavaCompiler() ?: error("The test JVM has no javac to compile CompatReport.java")
        val classpath = listOf(Opcode::class.java, Class.forName("com.google.common.collect.ImmutableList"))
            .joinToString(File.pathSeparator) { File(it.protectionDomain.codeSource.location.toURI()).path }
        val out = Files.createTempDirectory("compat-report")
        Runtime.getRuntime().addShutdownHook(Thread { out.toFile().deleteRecursively() })
        val errors = java.io.ByteArrayOutputStream()
        val exit = javac.run(null, null, errors, "-nowarn", "-proc:none", "-encoding", "UTF-8", "-d", out.toString(),
            "-cp", classpath, Path.of("../scripts/CompatReport.java").toString())
        check(exit == 0) { "CompatReport.java doesn't compile:\n$errors" }
        // The test's own dexlib2 loads the fixtures, so CompatReport has to see the same classes.
        URLClassLoader(arrayOf(out.toUri().toURL()), CompatMirror::class.java.classLoader).loadClass("CompatReport")
    }

    private fun static(name: String, vararg types: Class<*>) = report.getDeclaredMethod(name, *types).apply { isAccessible = true }

    /** CompatReport.findControls on [classes], as control key to sorted method ids, leaving out keys it found nothing for. */
    fun controls(classes: Iterable<ClassDef>): Map<String, List<String>> {
        @Suppress("UNCHECKED_CAST")
        val found = static("findControls", List::class.java).invoke(null, classes.toList()) as Map<String, List<Method>>
        return ids(found)
    }

    @Suppress("UNCHECKED_CAST")
    fun wifiIdentityReads(classes: Iterable<ClassDef>): List<Method> =
        static("wifiIdentityReads", List::class.java).invoke(null, classes.toList()) as List<Method>

    /** The same shape for the patch's own finder results. */
    fun ids(found: Map<String, List<Method>>): Map<String, List<String>> =
        found.filterValues { it.isNotEmpty() }.mapValues { (_, methods) -> methods.map(::id).sorted() }.toSortedMap()

    /** CompatReport.nativeBubbleRoutes on [classes] for [gate]: the route string it records, or null when nothing connects. */
    fun nativeBubbleRoutes(classes: Iterable<ClassDef>, gate: String): String? =
        static("nativeBubbleRoutes", List::class.java, String::class.java).invoke(null, classes.toList(), gate) as String?

    /** CompatReport.subtabsSupplier on one inbox tabs run(): the supplier field it records, or null when it refuses the body. */
    fun subtabsSupplier(method: Method): String? = static("subtabsSupplier", List::class.java).invoke(null, listOf(method)) as String?

    /** CompatReport.pluginGateShape: whether it takes [method] as a plugin gate. The sentinel itself is the profile's to pin. */
    fun pluginGate(method: Method): Boolean = static("pluginGateShape", Method::class.java).invoke(null, method) as Boolean

    private fun id(method: Method) = method.definingClass + "->" + method.name + "(" + method.parameterTypes.joinToString("") +
        ")" + method.returnType
}
