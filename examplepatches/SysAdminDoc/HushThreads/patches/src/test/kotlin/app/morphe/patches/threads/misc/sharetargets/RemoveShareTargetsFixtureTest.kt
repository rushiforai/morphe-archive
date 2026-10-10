/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.sharetargets

import app.morphe.FixtureResources
import app.morphe.Fixtures
import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import javax.xml.parsers.DocumentBuilderFactory
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Remove share targets on every declared build: the decoded manifest loses Threads' share intent
 * filters and nothing else, the `<queries>` entry Threads shares out through stays, and a manifest
 * with nothing left to take is refused.
 */
class RemoveShareTargetsFixtureTest {
    private val handler = "com.instagram.barcelona.handleractivity.BarcelonaShareHandlerActivity"

    @Test
    fun everyDeclaredBuildLosesItsShareFiltersAndNothingElse() {
        val builds = Fixtures.declaredBuilds()
        for (build in builds) FixtureResources.of(build).use { resources ->
            val manifest = resources.document("AndroidManifest.xml")
            val stock = FixtureResources.elements(manifest)
            val (components, shortcuts) = removeShareFilters(manifest)
            val patched = FixtureResources.elements(manifest)

            assertEquals("${build.name}: the components that took a share", listOf(handler), components)
            assertEquals("${build.name}: Threads names no shortcuts file", emptyList<String>(), shortcuts)
            assertEquals("${build.name}: nothing is added", emptyList<String>(), patched - stock.toSet())
            val removed = stock.toMutableList().apply { patched.forEach { remove(it) } }
            val owner = "/activity[android:name=$handler]/"
            assertTrue("${build.name}: only the share handler's filters go: $removed", removed.all { "${owner}intent-filter" in it })
            assertEquals("${build.name}: only the share filters go", listOf(
                "intent-filter/action[android:name=android.intent.action.SEND]",
                "intent-filter/action[android:name=android.intent.action.SEND]",
                "intent-filter/action[android:name=android.intent.action.SEND_MULTIPLE]",
                "intent-filter/category[android:name=android.intent.category.DEFAULT]",
                "intent-filter/category[android:name=android.intent.category.DEFAULT]",
                "intent-filter/data[android:mimeType=image/*]",
                "intent-filter/data[android:mimeType=text/plain]",
                "intent-filter/data[android:mimeType=video/*]",
                "intent-filter[]",
                "intent-filter[]",
            ), removed.map { it.substringAfter(owner) }.sorted())
            assertTrue("${build.name}: the queries entry Threads shares out through stays", patched.any {
                it == "manifest/queries/intent/action[android:name=android.intent.action.SEND]"
            })

            val again = runCatching { removeShareFilters(manifest) }.exceptionOrNull()
            assertTrue("${build.name}: ${again?.message}", again is PatchException && again.message!!.contains("takes a share"))
        }
        val declaredVersions = AppCompatibilities.threads().single().targets.mapNotNull { it.version }.distinct().size
        assertEquals("one build of each declared version", declaredVersions, builds.size)

        val shortcuts = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(("<shortcuts>" +
            "<shortcut android:shortcutId=\"compose\"/><share-target android:targetClass=\"$handler\"/></shortcuts>").byteInputStream())
        assertEquals("a share target a later build names goes too", 1, removeShareTargets(shortcuts))
        assertEquals(listOf("shortcuts[]", "shortcuts/shortcut[android:shortcutId=compose]"),
            FixtureResources.elements(shortcuts))
    }
}
