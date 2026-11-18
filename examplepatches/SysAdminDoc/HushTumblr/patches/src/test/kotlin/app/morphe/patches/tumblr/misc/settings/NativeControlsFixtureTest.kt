/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.misc.settings

import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.RepoFiles
import com.reandroid.arsc.chunk.TableBlock
import com.reandroid.arsc.value.DataType
import java.io.File
import java.util.zip.ZipFile
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * The paths on the "Tumblr's own settings" page against each declared build's strings. Every step
 * the extension lists has to name a string that build carries, and HushTumblr's English copy of the
 * label has to be what the build says in English. A mistyped name would otherwise fall back to the
 * copy without a sound, and the path would stop following Tumblr's language.
 */
class NativeControlsFixtureTest {
    @Test
    @Category(FixtureTests::class)
    fun `every listed step names a string the declared build has, with the same English label`() {
        val steps = listedSteps()
        assertTrue("the scan found too few steps to mean anything: $steps", steps.size >= 8)
        for (build in Fixtures.declaredBuilds()) {
            val strings = englishStrings(build)
            for ((name, copy) in steps) {
                assertEquals("${build.name}: string/$name", copy, strings[name])
            }
        }
    }

    /** Each `new Step("name", "English")` in the extension's list, by name. */
    private fun listedSteps(): Map<String, String> {
        val source = File(
            RepoFiles.root,
            "extensions/tumblr/src/main/java/app/hushtumblr/extension/tumblr/settings/NativeControls.java",
        ).readText()
        return Regex("new Step\\(\"([a-z0-9_]+)\",\\s*\"([^\"]+)\"\\)").findAll(source)
            .associate { it.groupValues[1] to it.groupValues[2] }
    }

    /** [apk]'s strings in its default configuration, by name. */
    private fun englishStrings(apk: File): Map<String, String> {
        val table = ZipFile(apk).use { zip -> zip.getInputStream(zip.getEntry("resources.arsc")).use { TableBlock.load(it) } }
        val strings = mutableMapOf<String, String>()
        for (pack in table.listPackages()) {
            for (pair in pack.listSpecTypePairs()) {
                for (resource in pair.resources) {
                    if (resource.type != "string") continue
                    for (entry in resource) {
                        if (entry == null || entry.isNull || entry.isComplex) continue
                        if (entry.resConfig.qualifiers.isNotEmpty()) continue
                        val value = entry.resValue ?: continue
                        if (value.dataType == DataType.STRING) strings[resource.name] = value.dataAsString
                    }
                }
            }
        }
        return strings
    }
}
