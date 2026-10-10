package app.hushmessenger.patches

import java.io.File
import kotlinx.serialization.json.Json
import kotlinx.serialization.json.JsonObject
import kotlinx.serialization.json.boolean
import kotlinx.serialization.json.jsonArray
import kotlinx.serialization.json.jsonObject
import kotlinx.serialization.json.jsonPrimitive
import kotlinx.serialization.json.contentOrNull
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue

/**
 * Every patch is in Morphe Manager's default selection unless it's named here with the reason it
 * stays out, so nobody has to turn on Expert mode to find a feature. A control that joins the
 * selection changes nothing until its switch on the Controls page is turned on, since every
 * switch reads off until it's saved.
 */
class DefaultSelectionPolicyTest {
    /** The patches left out of the default selection, and why each one is. */
    private val keptOptIn = mapOf(
        "Clone install under another package name" to "It installs Messenger under a second package name and " +
            "app name, so it's a different app on the phone, with no switch to turn it back.",
        "Spoof package version" to "It raises the version code in the manifest, so going back to Meta's number " +
            "means uninstalling, and every later build has to carry it too or it won't install over this one.",
        "Custom new-message sound" to "It replaces Messenger's sound file when you patch, with no switch, and it " +
            "needs a file picked in its option, which Manager only shows in Expert mode.",
    )

    private fun namedPatches(): List<JsonObject> {
        val catalog = File("../patches-list.json").takeIf { it.isFile } ?: File("patches-list.json")
        assertTrue(catalog.isFile, "could not find the patch list from ${File(".").absolutePath}")
        return Json.parseToJsonElement(catalog.readText()).jsonObject.getValue("patches").jsonArray
            .map { it.jsonObject }
            .filter { it["name"]?.jsonPrimitive?.contentOrNull != null }
    }

    private fun JsonObject.name() = getValue("name").jsonPrimitive.content

    @Test fun everyPatchIsInTheDefaultSelectionUnlessItIsKeptOutWithAReason() {
        val patches = namedPatches()
        assertTrue(patches.size > 5, "the catalog holds no patches")
        val optIn = patches.filter { !it.getValue("default").jsonPrimitive.boolean }.map { it.name() }.toSortedSet()
        assertEquals(keptOptIn.keys.toSortedSet(), optIn,
            "a patch left out of the default selection needs an entry here with its reason")
        for ((name, reason) in keptOptIn) assertTrue(reason.length > 20, "$name has no reason")
    }

    /** The catalog is generated, so the declarations are held too: a stale catalog can't hide a change. */
    @Test fun theDeclarationsLeaveOutExactlyTheKeptPatches() {
        val sources = File("src/main/kotlin").takeIf { it.isDirectory } ?: File("patches/src/main/kotlin")
        assertTrue(sources.isDirectory, "could not find the patch sources from ${File(".").absolutePath}")
        val leftOut = sources.walkTopDown().filter { it.extension == "kt" }.flatMap { file ->
            val text = file.readText()
            Regex("""\bdefault\s*=\s*false""").findAll(text).map { match ->
                // A name is a string or a constant declared in the same file, the way all three kept patches name themselves.
                val declared = Regex("""\bname\s*=\s*(?:"([^"]+)"|([A-Z][A-Z0-9_]*))""")
                    .findAll(text.substring(0, match.range.first)).lastOrNull()?.groupValues
                val constant = declared?.get(2)?.takeIf { it.isNotEmpty() }?.let { const ->
                    Regex("""\bconst\s+val\s+$const\s*=\s*"([^"]+)"""").find(text)?.groupValues?.get(1)
                }
                declared?.get(1)?.takeIf { it.isNotEmpty() } ?: constant ?: "an unnamed patch in ${file.name}"
            }
        }.toSortedSet()
        assertEquals(keptOptIn.keys.toSortedSet(), leftOut)
    }

    /** A patch in the default selection never sends the reader to Expert mode to find it. */
    @Test fun aDefaultPatchsDescriptionDoesNotSayItIsOptIn() {
        val stale = listOf("Expert mode", "Opt-in", "opt-in", "Starts unselected", "isn't selected by default")
        for (patch in namedPatches()) {
            val name = patch.name()
            val description = patch.getValue("description").jsonPrimitive.content
            if (name in keptOptIn) {
                assertTrue("Expert mode" in description, "$name should say where to pick it")
                continue
            }
            for (phrase in stale) assertFalse(phrase in description, "$name still says \"$phrase\"")
        }
    }

    /**
     * With every control in the default selection, Expert mode is where a reader goes to look one up,
     * so no group runs past what fits on a phone screen. Hushfacebook's Interface once held 42.
     */
    @Test fun noGroupIsTooLongToScan() {
        val patches = namedPatches()
        val missing = patches.filter { it["category"]?.jsonPrimitive?.contentOrNull.isNullOrBlank() }.map { it.name() }
        assertEquals(emptyList(), missing, "patches shipped with no category")
        val sizes = patches.groupingBy { it.getValue("category").jsonPrimitive.content }.eachCount()
        assertEquals(emptyMap(), sizes.filterValues { it > 15 }, "split a group people have to scroll through")
    }
}
