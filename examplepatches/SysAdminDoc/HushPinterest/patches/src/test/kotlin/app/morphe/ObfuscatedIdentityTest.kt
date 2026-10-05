/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Modified for Hushfacebook (Facebook), 2026.
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe

import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Every name Pinterest's R8 build made up for one release, written into this repository as though
 * it were the name of something.
 *
 * <p>R8 moves most of Pinterest's code into short top-level packages of a letter or two and a few
 * digits (`Lk12/e;`, `Lmr1/g0;`, `Ldp/b;`) and renames most model classes down to one, two or
 * three letters (`Lcom/pinterest/api/model/ue;` is the pin). Views a layout names, activities,
 * services and a few deserializers keep their names. A patch that writes one of these short,
 * renamed-per-build class names down applies on the build it was written against and fails, or
 * does the wrong thing, on the next one. The patches here resolve such classes while patching
 * instead, from anchors R8 keeps: kept class and method names, string literals and method shapes
 * (see the fingerprints beside each patch).
 *
 * <p>R8's renamed classes are one to three characters, and so are countless real identifiers in
 * this codebase (`id`, `it`, a loop index), so this test guards only the class-descriptor shapes
 * above. Those are distinctive (the `L...;` form appears in bytecode-reference strings, not prose)
 * and the only ones a patch here would ever need to hardcode.
 *
 * <p>What is here today is recorded in `obfuscated-identities.txt`, one `path|descriptor` per line,
 * so that the list can only shrink: a descriptor that turns up and is not in it fails this test,
 * and so does a line in it that no longer matches anything, so the record stays the truth.
 * Comments are not read, so a note naming what a build called something is fine.
 */
class ObfuscatedIdentityTest {
    @Test
    fun `a short renamed com-pinterest class is inventoried`() {
        assertEquals(setOf("Lcom/pinterest/api/model/ue;"), identitiesIn("""definingClass = "Lcom/pinterest/api/model/ue;""""))
        assertEquals(setOf("Lcom/pinterest/api/model/z;"), identitiesIn("""returnType("Lcom/pinterest/api/model/z;")"""))
    }

    @Test
    fun `a short top-level package is inventoried`() {
        assertEquals(setOf("Lxg/A;"), identitiesIn("""val type = "Lxg/A;""""))
        assertEquals(setOf("Lk12/e;"), identitiesIn("""val feed = "Lk12/e;""""))
        assertEquals(setOf("Lmr1/g0;"), identitiesIn("""val page = "Lmr1/g0;""""))
    }

    @Test
    fun `a kept, descriptive class name of any length is not`() {
        assertTrue(identitiesIn("""MAIN_ACTIVITY = "Lcom/pinterest/activity/PinterestActivity;"""").isEmpty())
        assertTrue(identitiesIn(""""Lcom/pinterest/ReleaseHiltApplication;"""").isEmpty())
        assertTrue(identitiesIn(""""Lcom/pinterest/featurelibrary/textads/TextAdView;"""").isEmpty())
        assertTrue(identitiesIn(""""Lio/reactivex/Single;"""").isEmpty())
    }

    @Test
    fun `no name one build made up is written down that the record does not already hold`() {
        val found = scan()
        val recorded = recorded()
        val added = found - recorded
        val gone = recorded - found
        assertTrue(
            "New class names one build's R8 run made up, written as identities. Anchor on what the " +
                "class is instead (a kept name, a string it carries, a call it makes), or record the " +
                "line with a reason:\n" + added.joinToString("\n"),
            added.isEmpty(),
        )
        assertTrue(
            "Recorded names that are no longer in the code. Delete these lines so the record keeps " +
                "saying what is left:\n" + gone.joinToString("\n"),
            gone.isEmpty(),
        )
    }

    private fun recorded(): Set<String> {
        val text = javaClass.getResourceAsStream("/obfuscated-identities.txt")
            ?.bufferedReader()?.readText().orEmpty()
        return text.lineSequence()
            .map { it.trim() }
            .filter { it.isNotEmpty() && !it.startsWith("#") }
            .toSet()
    }

    private fun scan(): Set<String> {
        val repo = if (File("src/main/kotlin").isDirectory) File("..") else File(".")
        val patches = File(repo, "patches/src/main/kotlin")
        val extension = File(repo, "extensions/pinterest/src/main/java")
        assertTrue("could not find the sources from ${File(".").absolutePath}", patches.isDirectory && extension.isDirectory)

        val found = sortedSetOf<String>()
        for (root in listOf(patches, extension)) {
            root.walkTopDown().filter { it.extension == "kt" || it.extension == "java" }.forEach { file ->
                val path = file.relativeTo(repo).invariantSeparatorsPath
                file.readLines().forEach { raw ->
                    val line = raw.trim()
                    if (line.startsWith("*") || line.startsWith("//") || line.startsWith("/*")) return@forEach
                    identitiesIn(line).forEach { found.add("$path|$it") }
                }
            }
        }
        return found
    }

    private fun identitiesIn(line: String): Set<String> {
        val names = mutableSetOf<String>()
        UI_SHORT_CLASS.findAll(line).forEach { names.add(it.value) }
        TOP_LEVEL_SHORT_PACKAGE.findAll(line).forEach { names.add(it.value) }
        return names - REAL_NAMES
    }

    private companion object {
        /** A class under com.pinterest that R8 renamed to one, two or three characters. */
        val UI_SHORT_CLASS = Regex("""Lcom/pinterest/(?:[A-Za-z0-9_]+/)*[A-Za-z][0-9A-Za-z_$]{0,2};""")

        /** A class in a short top-level package R8 made up, such as `Lxg/A;` or `Lk12/e;`. */
        val TOP_LEVEL_SHORT_PACKAGE = Regex("""L[a-z]{1,3}[0-9]{0,3}/[0-9A-Za-z_$]+;""")

        /** Kept class names that happen to be short, so they are nobody's per-build invention. */
        val REAL_NAMES = emptySet<String>()
    }
}
