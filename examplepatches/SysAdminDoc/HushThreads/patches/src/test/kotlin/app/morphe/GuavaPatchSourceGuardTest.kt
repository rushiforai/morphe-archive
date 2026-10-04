package app.morphe

import com.sun.source.util.JavacTask
import java.io.File
import java.net.URI
import javax.tools.Diagnostic
import javax.tools.DiagnosticCollector
import javax.tools.JavaFileObject
import javax.tools.SimpleJavaFileObject
import javax.tools.ToolProvider
import org.jetbrains.kotlin.CoreEnvironmentDeprecation
import org.jetbrains.kotlin.cli.create
import org.jetbrains.kotlin.cli.jvm.compiler.EnvironmentConfigFiles
import org.jetbrains.kotlin.cli.jvm.compiler.KotlinCoreEnvironment
import org.jetbrains.kotlin.com.intellij.openapi.util.Disposer
import org.jetbrains.kotlin.com.intellij.openapi.util.text.StringUtil
import org.jetbrains.kotlin.com.intellij.psi.PsiErrorElement
import org.jetbrains.kotlin.com.intellij.psi.util.PsiTreeUtil
import org.jetbrains.kotlin.config.CompilerConfiguration
import org.jetbrains.kotlin.psi.KtPsiFactory
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.BeforeClass
import org.junit.Test

/**
 * The bundle runs on Manager's Guava, which can be older than the build's compile classpath.
 * Calling a newer method would compile here, then crash on Manager's copy.
 */
class GuavaPatchSourceGuardTest {
    @Test
    fun patchSourcesDoNotImportGuavaDirectly() {
        val root = File(RepoFiles.root, "patches/src/main")
        assertTrue("Patch source directory is missing: $root", root.isDirectory)
        val sources = root.walk()
            .filter { it.isFile && (it.extension == "kt" || it.extension == "java") }
            .toList()
        assertTrue("Patch source directory contains no Java or Kotlin sources: $root", sources.isNotEmpty())
        val violations = sources.flatMap { file ->
            guavaImports(file.name, file.readText()).map { "${file.relativeTo(root)}: $it" }
        }
        assertTrue(
            "Patch sources import Guava directly. The bundle runs on Manager's Guava, " +
                "which may be an older version than the compile classpath. Use the standard " +
                "library or the patcher's own API instead.\n${violations.joinToString("\n")}",
            violations.isEmpty()
        )
    }

    @Test
    fun kotlinImportsRejectLegalWhitespaceCommentsAliasesAndWildcards() {
        val imports = listOf(
            "import com.google.common.collect.ImmutableList",
            "import\tcom.google.common.collect.ImmutableList",
            "import    com.google.common.collect.ImmutableList",
            "import/**/com.google.common.collect.ImmutableList",
            "import /* outer /* nested */ comment */ com.google.common.collect.ImmutableList",
            "import com /* gap */ . google . common . collect . ImmutableList",
            "import `com`.`google`.`common`.`collect`.`ImmutableList`",
            "import com.google.common.collect.ImmutableList as Lists",
            "import com.google.common.collect.*",
            "import com.google.common",
            "package guard;import com.google.common.collect.ImmutableList",
            "import java.util.Date;import com.google.common.collect.ImmutableList",
            "package guard\r\nimport\tcom.google.common.collect.ImmutableList\r\nclass Guard",
        )
        for (source in imports) {
            assertEquals(source, 1, guavaImports("Guard.kt", source).size)
        }
    }

    @Test
    fun javaImportsRejectLegalWhitespaceCommentsStaticImportsAndUnicodeEscapes() {
        val imports = listOf(
            "import com.google.common.collect.ImmutableList;",
            "import\tcom.google.common.collect.ImmutableList;",
            "import    com.google.common.collect.ImmutableList;",
            "import/**/com.google.common.collect.ImmutableList;",
            "import com /* gap */ . google . common . collect . ImmutableList;",
            "import\ncom.google.common.collect.ImmutableList;",
            "import com.\ngoogle.common.collect.ImmutableList;",
            "import static\tcom.google.common.collect.ImmutableList.of;",
            "import\tstatic/**/com.google.common.collect.ImmutableList.*;",
            "import com.google.common.collect.*;",
            "package guard;import com.google.common.collect.ImmutableList;",
            "import java.util.Date;import com.google.common.collect.ImmutableList;",
            """\u0069mport c\u006fm.\u0067oogle.common.collect.ImmutableList;""",
        )
        for (source in imports) {
            assertEquals(source, 1, guavaImports("Guard.java", "$source class Guard {}").size)
        }
    }

    @Test
    fun kotlinCommentsStringsAndInfixCallsAreNotImportDirectives() {
        val quotes = "\"\"\""
        val source = """
            // import com.google.common.collect.ImmutableList
            /*
            import com.google.common.collect.ImmutableList
            /* import com.google.common.collect.ImmutableList */
            */
            val quoted = "import com.google.common.collect.ImmutableList"
            val multiline = $quotes
            import com.google.common.collect.ImmutableList
            $quotes
            object com { object google { val common = 2 } }
            infix fun Int.import(other: Int) = this + other
            val result = 1 import com.google.common
            fun use() {
                1 import com.google.common
                val local = 1 import com.google.common
            }
        """.trimIndent()
        assertTrue(guavaImports("Guard.kt", source).isEmpty())
    }

    @Test
    fun javaCommentsStringsAndTextBlocksAreNotImportDirectives() {
        val quotes = "\"\"\""
        val source = """
            // import com.google.common.collect.ImmutableList;
            /*
            import static com.google.common.collect.ImmutableList.of;
            */
            class Guard {
                String quoted = "import com.google.common.collect.ImmutableList;";
                String multiline = $quotes
                import com.google.common.collect.ImmutableList;
                $quotes;
            }
        """.trimIndent()
        assertTrue(guavaImports("Guard.java", source).isEmpty())
    }

    @Test
    fun similarPackageNamesAreNotGuavaImports() {
        for (name in listOf("com.google.commonly.Type", "com.google.commons.Type", "other.com.google.common.Type")) {
            assertTrue(name, guavaImports("Guard.kt", "import $name").isEmpty())
            assertTrue(name, guavaImports("Guard.java", "import $name; class Guard {}").isEmpty())
        }
    }

    private fun guavaImports(name: String, source: String): List<String> {
        // Only import nodes count. Kotlin's `import` is also a legal infix function name.
        val imports = if (name.endsWith(".kt")) {
            // PSI expects the line endings normalized by IntelliJ's normal file loader.
            val file = kotlinParser.createFile(name, StringUtil.convertLineSeparators(source))
            val errors = PsiTreeUtil.collectElementsOfType(file, PsiErrorElement::class.java)
            assertTrue("Could not parse $name: ${errors.map { it.errorDescription }}", errors.isEmpty())
            file.importDirectives.mapNotNull { it.importedFqName?.asString() }
        } else {
            val compiler = checkNotNull(ToolProvider.getSystemJavaCompiler()) { "The source guard needs a JDK." }
            val diagnostics = DiagnosticCollector<JavaFileObject>()
            val input = object : SimpleJavaFileObject(URI.create("string:///$name"), JavaFileObject.Kind.SOURCE) {
                override fun getCharContent(ignoreEncodingErrors: Boolean): CharSequence = source
            }
            compiler.getStandardFileManager(diagnostics, null, null).use { manager ->
                val task = compiler.getTask(null, manager, diagnostics, listOf("-proc:none"), null, listOf(input)) as JavacTask
                val names = task.parse().flatMap { file -> file.imports.map { it.qualifiedIdentifier.toString() } }
                val errors = diagnostics.diagnostics.filter { it.kind == Diagnostic.Kind.ERROR }
                assertTrue("Could not parse $name: $errors", errors.isEmpty())
                names
            }
        }
        return imports.filter { it == "com.google.common" || it.startsWith("com.google.common.") }
    }

    companion object {
        private val disposable = Disposer.newDisposable()
        private lateinit var kotlinParser: KtPsiFactory

        @BeforeClass
        @JvmStatic
        @OptIn(CoreEnvironmentDeprecation::class)
        fun startKotlinParser() {
            val environment = KotlinCoreEnvironment.createForProduction(
                disposable, CompilerConfiguration.create(), EnvironmentConfigFiles.JVM_CONFIG_FILES
            )
            kotlinParser = KtPsiFactory(environment.project, false)
        }

        @AfterClass
        @JvmStatic
        fun stopKotlinParser() = Disposer.dispose(disposable)
    }
}
