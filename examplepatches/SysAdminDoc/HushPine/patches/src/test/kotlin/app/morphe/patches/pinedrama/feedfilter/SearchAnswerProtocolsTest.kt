package app.morphe.patches.pinedrama.feedfilter

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.Opcodes
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The extension knows the AI answer card in search by its protocol's class name. Those classes are
 * in a plugin PineDrama downloads, but the base app's service list loads them by name, so each name
 * the extension keeps is in the base app on every declared build.
 */
class SearchAnswerProtocolsTest {
    @Test
    fun `every declared build names each AI answer protocol the extension hides`() {
        val repo = if (File("src/main/kotlin").isDirectory) File("..") else File(".")
        val source = File(repo, "extensions/pinedrama/src/main/java/app/morphe/extension/pinedrama/feedfilter/TakoAiFilter.java").readText()
        val set = Regex("""SEARCH_ANSWER_PROTOCOLS = Set\.of\(([^)]*)\)""").find(source)?.groupValues?.get(1)
            ?: error("TakoAiFilter no longer keeps SEARCH_ANSWER_PROTOCOLS")
        val names = Regex("\"([^\"]+)\"").findAll(set).map { it.groupValues[1] }.toList()
        assertTrue("no protocol names in SEARCH_ANSWER_PROTOCOLS", names.isNotEmpty())
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val strings = container.dexEntryNames.flatMapTo(HashSet()) { container.getEntry(it)!!.dexFile.stringSection }
            names.forEach { name ->
                assertTrue(
                    "${apk.name}: the base app no longer names $name",
                    name in strings || "L${name.replace('.', '/')};" in strings,
                )
            }
        }
    }
}
