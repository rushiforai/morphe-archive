package app.morphe.patches.tiktok.interaction.blockauthor

import app.morphe.Fixtures
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The daily hold's player members, resolved by the patch's own code ([resolveNativePlaybackMembers])
 * on every retained fixture and held to what each build calls them. No two builds agree: the pause
 * is LIZ on 46.2.3, 46.8.3 and 46.9.3, and on 47.0.3 LIZ is a getter returning a number, which the
 * hold called by name and took for a pause while the video played on under its panel (the S22,
 * 2026-09-23). The expected names were read off each fixture's pauseVideo and space-key toggle.
 */
class NativePlaybackFixturesTest {
    @Test
    fun `the hold's current video, pause and resume resolve on every fixture`() {
        val expected = mapOf(
            // version to (current-video getter, player manager, pause, resume)
            "46.2.3" to listOf("LIZIZ", "LX/0M31;", "LIZ", "LJIILL"),
            "46.7.3" to listOf("LJJJI", "LX/0MP3;", "LJJLIIIJILLIZJL", "LJIIZILJ"),
            "46.8.3" to listOf("LLJJIII", "LX/0MDj;", "LIZ", "LJIIZILJ"),
            "46.9.3" to listOf("LIZIZ", "LX/036B;", "LIZ", "LJIILL"),
            "47.0.3" to listOf("LLJJIJIIJIL", "LX/037l;", "LJJLIIIJJI", "LJIILL"),
        )
        val seen = mutableSetOf<String>()
        for (apk in Fixtures.apks()) {
            val version = Regex("""4\d\.\d+\.\d+""").find(apk.name)?.value
                ?: error("${apk.name}: no TikTok version in the file name")
            val want = expected[version] ?: error("${apk.name}: no expected members for $version")
            val container = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
                .associateBy { it.type }
            val pauseVideo = classes.getValue(PLAYER_CONTROLLER).methods
                .single { it.name == "pauseVideo" && it.parameterTypes.isEmpty() }
            val toggle = classes.getValue(FEED_RECOMMEND_FRAGMENT).methods
                .single { it.name == "onDispatchKeyEvent" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/KeyEvent;") }
            val members = resolveNativePlaybackMembers(pauseVideo, toggle) { classes[it]?.methods }
            assertEquals(
                "${apk.name}: getter, manager, pause, resume",
                want,
                listOf(members.awemeGetter.reference.name, members.manager, members.pause.reference.name, members.resume.reference.name),
            )
            assertEquals("${apk.name}: the getter is PlayerController's own", PLAYER_CONTROLLER, members.awemeGetter.reference.definingClass)
            assertFalse("${apk.name}: the getter is a virtual call", members.awemeGetter.throughInterface)
            assertTrue("${apk.name}: the pause goes through the manager interface", members.pause.throughInterface)
            assertTrue("${apk.name}: the resume goes through the manager interface", members.resume.throughInterface)
            seen += version
        }
        assertEquals("every retained fixture was read", expected.keys, seen)
    }
}
