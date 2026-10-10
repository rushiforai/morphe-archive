/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
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
 * stays out, so nobody has to turn on Expert mode to find a feature. A patch that joins the
 * selection changes nothing until its switch in HushThreads settings is turned on, which the
 * extension's PatchFamilyTest holds.
 */
class DefaultSelectionPolicyTest {
    /** The patches left out of the default selection, and why each one is. */
    private val keptOptIn = mapOf(
        "Change version code" to "It raises the version code in the manifest, so going back to stock Threads " +
            "means uninstalling, and every later build has to carry it too or it won't install over this one.",
        "Remove share targets" to "It takes Threads' share entries out of the manifest when you patch, with no " +
            "switch, so getting them back means patching again.",
        "Trust user-added certificates" to "It lets certificates you installed yourself past Android's checks in " +
            "Threads, with no switch, which weakens what protects Threads' traffic.",
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
                Regex("""\bname\s*=\s*"([^"]+)"""").findAll(text.substring(0, match.range.first)).lastOrNull()
                    ?.groupValues?.get(1) ?: "an unnamed patch in ${RepoFiles.relative(file)}"
            }
        }.toSortedSet()
        assertEquals(keptOptIn.keys.toSortedSet(), leftOut)
    }

    /** A patch in the default selection never sends the reader to Expert mode to find it. */
    @Test
    fun `a default patch's description doesn't say it's opt-in`() {
        val stale = listOf("Expert mode", "Opt-in", "opt-in", "Out of the default selection", "isn't selected by default")
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
