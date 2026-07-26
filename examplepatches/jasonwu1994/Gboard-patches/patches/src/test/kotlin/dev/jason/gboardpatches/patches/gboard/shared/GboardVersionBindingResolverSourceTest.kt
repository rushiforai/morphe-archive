package dev.jason.gboardpatches.patches.gboard.shared

import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardVersionBindingResolverSourceTest {
    private val utilityPath = Path.of(
        "src/main/kotlin/dev/jason/gboardpatches/patches/gboard/shared/GboardBytecodeUtils.kt"
    )

    @Test
    fun sharedUtilityResolvesGeneratedMethodAndFieldBindings() {
        val source = readSource(utilityPath).withoutComments()

        assertTrue(
            "GboardMethodBinding import is missing",
            source.contains(
                "import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardMethodBinding"
            )
        )
        assertTrue(
            "GboardFieldBinding import is missing",
            source.contains(
                "import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardFieldBinding"
            )
        )
        assertTrue(
            "MutableField import is missing",
            MUTABLE_FIELD_IMPORT.containsMatchIn(source)
        )
        assertTrue(
            "Method binding resolver must delegate every method coordinate",
            METHOD_BINDING_RESOLVER.containsMatchIn(source)
        )
        assertTrue(
            "Field binding resolver must match both the field name and type",
            FIELD_BINDING_RESOLVER.containsMatchIn(source)
        )
    }

    @Test
    fun typedBindingResolversAreDefinedOnlyInSharedUtility() {
        val unexpectedFiles = mutableListOf<Path>()
        Files.walk(Path.of("src/main/kotlin")).use { paths ->
            paths.filter { path ->
                Files.isRegularFile(path) && path.toString().endsWith(".kt") && path != utilityPath
            }.forEach { path ->
                val source = readSource(path).withoutComments()
                if (
                    TYPED_RESOLVER_DECLARATION.containsMatchIn(source) ||
                    METHOD_BINDING_LOOKUP.containsMatchIn(source) ||
                    FIELD_BINDING_LOOKUP.containsMatchIn(source)
                ) {
                    unexpectedFiles.add(path)
                }
            }
        }

        assertTrue(
            "Typed binding resolvers must remain centralized in $utilityPath: $unexpectedFiles",
            unexpectedFiles.isEmpty()
        )
    }

    private fun readSource(path: Path): String =
        String(Files.readAllBytes(path), StandardCharsets.UTF_8)

    private fun String.withoutComments(): String =
        replace(Regex("/\\*.*?\\*/", RegexOption.DOT_MATCHES_ALL), "")
            .replace(Regex("//.*"), "")

    private companion object {
        val MUTABLE_FIELD_IMPORT = Regex(
            """^\s*import\s+app\.morphe\.patcher\.util\.proxy\.mutableTypes\.MutableField\s*$""",
            RegexOption.MULTILINE
        )
        val METHOD_BINDING_RESOLVER = Regex(
            """internal\s+fun\s+BytecodePatchContext\.findMutableMethodOrThrow\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*:\s*GboardMethodBinding\s*,?\s*\)\s*:\s*MutableMethod\s*=\s*findMutableMethodOrThrow\s*\(\s*classType\s*=\s*\1\.classType\s*,\s*name\s*=\s*\1\.name\s*,\s*returnType\s*=\s*\1\.returnType\s*,\s*parameterTypes\s*=\s*\1\.parameterTypes\s*,?\s*\)""",
            RegexOption.DOT_MATCHES_ALL
        )
        val FIELD_BINDING_RESOLVER = Regex(
            """internal\s+fun\s+BytecodePatchContext\.mutableFieldOrThrow\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\s*:\s*GboardFieldBinding\s*,?\s*\)\s*:\s*MutableField\s*=\s*mutableClass\s*\(\s*\1\.classType\s*\)\.fields\.firstOrNull\s*\{\s*it\.name\s*==\s*\1\.name\s*&&\s*it\.type\s*==\s*\1\.type\s*\}\s*\?:\s*error\s*\(\s*"Could not find \$\{\1\.classType}->\$\{\1\.name}:\$\{\1\.type}"\s*\)""",
            RegexOption.DOT_MATCHES_ALL
        )
        val TYPED_RESOLVER_DECLARATION = Regex(
            """fun\s+BytecodePatchContext\.(?:findMutableMethodOrThrow|mutableFieldOrThrow)\s*\(\s*[A-Za-z_][A-Za-z0-9_]*\s*:\s*Gboard(?:Method|Field)Binding"""
        )
        val METHOD_BINDING_LOOKUP = Regex(
            """findMutableMethodOrThrow\s*\(\s*classType\s*=\s*([A-Za-z_][A-Za-z0-9_]*)\.classType\s*,\s*name\s*=\s*\1\.name\s*,\s*returnType\s*=\s*\1\.returnType\s*,\s*parameterTypes\s*=\s*\1\.parameterTypes""",
            RegexOption.DOT_MATCHES_ALL
        )
        val FIELD_BINDING_LOOKUP = Regex(
            """mutableClass\s*\(\s*([A-Za-z_][A-Za-z0-9_]*)\.classType\s*\)\.fields\.firstOrNull\s*\{\s*it\.name\s*==\s*\1\.name\s*&&\s*it\.type\s*==\s*\1\.type""",
            RegexOption.DOT_MATCHES_ALL
        )
    }
}
