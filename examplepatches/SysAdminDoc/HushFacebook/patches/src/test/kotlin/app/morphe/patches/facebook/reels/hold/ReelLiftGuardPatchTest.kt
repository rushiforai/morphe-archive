/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels.hold

import app.morphe.patches.facebook.media.reelspeed.keepReelSpeedPatch
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Both reel speed patches bring the release guard, so a tap can't undo a picked speed whichever is
 * selected (issue #25). A dependency declared later in the same file than its patch would read as
 * null here, which Morphe would only trip over while patching.
 */
class ReelLiftGuardPatchTest {
    @Test
    fun `both reel speed patches bring the release guard`() {
        assertTrue("Hold a reel for 2x doesn't bring the release guard", reelLiftGuardPatch in holdReelFor2xPatch.dependencies)
        assertTrue("Keep the reel speed doesn't bring the release guard", reelLiftGuardPatch in keepReelSpeedPatch.dependencies)
    }

    /**
     * Keep the reel speed brings the guard as often as Hold a reel for 2x does, so the guard's
     * refusals name the guard. They used to start with Hold's name, even in a run where only Keep
     * the reel speed was picked.
     */
    @Test
    fun `the guard refuses under its own name, not Hold's`() {
        val source = patchSource()
        val guard = Regex("""private const val GUARD = "([^"]+)"""").find(source)?.groupValues?.get(1)
        assertNotNull("no GUARD name in HoldReelFor2xPatch.kt", guard)
        assertFalse("the guard's name reads as Hold's: $guard", guard!!.startsWith(PATCH))
        for (name in listOf("findReelHoldAnchors", "applyReelLiftGuard")) {
            val body = topLevel(source, name)
            assertFalse("$name refuses under Hold's name", Regex("""\brefuse\(""").containsMatchIn(body))
            assertTrue("$name has no refusal under the guard's name", body.contains("refuseGuard("))
        }
    }

    private fun patchSource(): String {
        val root = File("src/main/kotlin").takeIf { it.isDirectory } ?: File("patches/src/main/kotlin")
        return File(root, "app/morphe/patches/facebook/reels/hold/HoldReelFor2xPatch.kt").readText()
    }

    /** The top-level function [name] in [source], up to the next top-level declaration. */
    private fun topLevel(source: String, name: String): String {
        val start = Regex("""(?m)^\S.*\bfun BytecodePatchContext\.$name\(""").find(source)?.range?.first
            ?: throw AssertionError("no $name in HoldReelFor2xPatch.kt")
        val next = Regex("""(?m)^(?:internal |private )?(?:fun|val|class|const) """).find(source, start + 1)?.range?.first
            ?: source.length
        return source.substring(start, next)
    }
}
