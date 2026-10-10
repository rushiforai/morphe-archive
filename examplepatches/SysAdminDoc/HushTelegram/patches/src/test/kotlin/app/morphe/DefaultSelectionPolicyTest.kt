/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at 2becc5a (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 */
package app.morphe

import com.google.gson.JsonParser
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Every patch is in Morphe Manager's default selection unless it's named here with the reason it
 * stays out, so nobody has to turn on Expert mode to find a feature. A new patch joins the
 * selection with a switch in HushTelegram settings that starts off, so a build patched with the
 * defaults only changes what it always changed.
 */
class DefaultSelectionPolicyTest {
    /** The patches left out of the default selection, and why each one is. */
    private val keptOptIn = mapOf(
        "Use registered Maps API key" to "It only does something with a key you type into its patch option, " +
            "and Morphe Manager shows patch options in Expert mode, so selecting it for everyone would add nothing.",
        "Use registered Telegram API credentials" to "It swaps the API ID and hash Telegram signs in with for ones " +
            "you type into its patch options, which only Expert mode shows, and a wrong pair stops sign-in.",
    )

    private fun shippedPatches() = run {
        val catalog = File(RepoFiles.root, "patches-list.json")
        assertTrue("could not find the patch list at $catalog", catalog.isFile)
        JsonParser.parseString(catalog.readText()).asJsonObject.getAsJsonArray("patches").map { it.asJsonObject }
    }

    @Test
    fun `every patch is in the default selection unless it's kept out with a reason`() {
        val patches = shippedPatches()
        assertTrue("the catalog holds no patches", patches.size > 5)
        val optIn = patches.filter { !it.get("use").asBoolean }.map { it.get("name").asString }.toSortedSet()
        assertEquals("a patch left out of the default selection needs an entry here with its reason",
            keptOptIn.keys.toSortedSet(), optIn)
        for ((name, reason) in keptOptIn) assertTrue("$name has no reason", reason.length > 20)
    }

    /** The catalog is generated, so the declarations are held too: a stale catalog can't hide a change. */
    @Test
    fun `the declarations leave out exactly the kept patches`() {
        val sources = File(RepoFiles.root, "patches/src/main/kotlin")
        assertTrue("could not find the patch sources at $sources", sources.isDirectory)
        val leftOut = sources.walkTopDown().filter { it.extension == "kt" }.flatMap { file ->
            val text = file.readText()
            Regex("""\bdefault\s*=\s*false""").findAll(text).map { match ->
                // A name is a string or a constant, the way both kept patches name themselves.
                val declared = Regex("""\bname\s*=\s*(?:"([^"]+)"|([A-Z][A-Z0-9_]*))""")
                    .findAll(text.substring(0, match.range.first)).lastOrNull()?.groupValues
                val constant = declared?.get(2)?.takeIf { it.isNotEmpty() }?.let { const ->
                    Regex("""\bconst\s+val\s+$const\s*=\s*"([^"]+)"""").find(text)?.groupValues?.get(1)
                }
                declared?.get(1)?.takeIf { it.isNotEmpty() } ?: constant
                    ?: "an unnamed patch in ${RepoFiles.relative(file)}"
            }
        }.toSortedSet()
        assertEquals(keptOptIn.keys.toSortedSet(), leftOut)
    }

    /** A patch in the default selection never sends the reader to Expert mode to find it. */
    @Test
    fun `a default patch's description doesn't say it's opt-in`() {
        val stale = listOf("Expert mode", "Opt-in", "opt-in", "Off by default", "isn't selected by default")
        for (patch in shippedPatches()) {
            val name = patch.get("name").asString
            val description = patch.get("description").asString
            if (name in keptOptIn) {
                assertTrue("$name should say it isn't selected by default", description.contains("isn't selected by default"))
                continue
            }
            for (phrase in stale) assertFalse("$name still says \"$phrase\"", description.contains(phrase))
        }
    }
}
