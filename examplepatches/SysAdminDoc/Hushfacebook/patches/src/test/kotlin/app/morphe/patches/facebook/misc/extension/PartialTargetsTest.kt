/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.extension

import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * What a patch working down a list of separate targets does with a build that has some of them,
 * all of them, or none: the rule [handleTargets] holds four patches to.
 */
class PartialTargetsTest {
    private val targets = listOf("first", "second", "third")

    @Test
    fun `a build with some of the targets goes on and names each missing one in the patch log`() {
        var handled = -1
        val warnings = PatchLogCapture.warnings {
            handled = handleTargets("Fixture patch", "widgets", targets) { target ->
                if (target == "second") null else "$target isn't in this build"
            }
        }
        assertEquals("targets dealt with", 1, handled)
        assertEquals(
            listOf(
                "Fixture patch: first isn't in this build. The patch goes on with the 1 of 3 widgets it found.",
                "Fixture patch: third isn't in this build. The patch goes on with the 1 of 3 widgets it found.",
            ),
            warnings,
        )
    }

    /** The positive control: a build with the whole list writes nothing to the log. */
    @Test
    fun `a build with every target logs nothing`() {
        var handled = -1
        val warnings = PatchLogCapture.warnings {
            handled = handleTargets("Fixture patch", "widgets", targets) { null }
        }
        assertEquals(3, handled)
        assertEquals(emptyList<String>(), warnings)
    }

    @Test
    fun `a build with none of the targets stops the patch, naming every one`() {
        val warnings = PatchLogCapture.warnings {
            val refused = assertThrows(PatchException::class.java) {
                handleTargets("Fixture patch", "widgets", targets) { "$it isn't in this build" }
            }
            val message = refused.message.orEmpty()
            assertTrue(message, message.startsWith("Fixture patch: this Facebook build has none of the 3 widgets"))
            targets.forEach { assertTrue(message, message.contains("$it isn't in this build")) }
        }
        assertEquals("a refused patch logs no partial warnings", emptyList<String>(), warnings)
    }

    /** The patches do their work in [handleTargets]' callback, so each target is asked about once, in order. */
    @Test
    fun `each target is handled once, in the list's order`() {
        val asked = mutableListOf<String>()
        PatchLogCapture.warnings {
            handleTargets("Fixture patch", "widgets", targets) { target -> asked += target; null }
        }
        assertEquals(targets, asked)
    }

    @Test
    fun `a descriptor is named the way Java writes the class`() {
        assertEquals("com.facebook.ads.AdsScreenshotDetector", javaName("Lcom/facebook/ads/AdsScreenshotDetector;"))
    }
}
