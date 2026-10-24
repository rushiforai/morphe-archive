package app.yydarlinker.deepseekcaptions;

import android.app.Activity;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static org.junit.Assert.*;

/**
 * The session intent is the one persistent record of "AI captions on + which target language". Only
 * a user act writes it; the revision is what lets the reconciler apply the same video again.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28, manifest = Config.NONE)
public class CaptionSessionIntentTest {
    private Activity a;

    @Before
    public void before() {
        a = Robolectric.buildActivity(Activity.class).setup().get();
        CaptionSessionIntent.resetForTests(a);
    }

    @After
    public void after() {
        CaptionSessionIntent.resetForTests(a);
        a.finish();
    }

    @Test
    public void anUntouchedInstallHasNoIntent() {
        CaptionSessionIntent intent = CaptionSessionIntent.load(a);
        assertFalse(intent.aiEnabled);
        assertFalse(intent.hasTarget());
        assertEquals(0L, intent.revision);
        assertEquals(CaptionSessionIntent.PROVENANCE_NONE, intent.provenance);
        assertEquals("", intent.target());
    }

    @Test
    public void theSwitchIsStoredWithItsRevisionAndKeepsTheTarget() {
        CaptionSessionIntent.userSelected(a, "zh-Hans", true);
        CaptionSessionIntent on = CaptionSessionIntent.userToggled(a, true);
        assertTrue(on.aiEnabled);
        assertEquals("zh-Hans", on.targetLanguage);
        assertEquals(2L, on.revision);
        assertEquals(CaptionSessionIntent.PROVENANCE_USER, on.provenance);
        assertTrue(on.translates());

        CaptionSessionIntent off = CaptionSessionIntent.userToggled(a, false);
        assertFalse(off.aiEnabled);
        assertEquals("turning AI off must not forget its target", "zh-Hans", off.targetLanguage);
        assertEquals("zh-Hans", off.target());
        assertEquals(3L, off.revision);
        assertFalse(off.translates());
    }

    @Test
    public void theChosenTargetIsNormalisedAndReadBackFromTheStore() {
        CaptionSessionIntent written = CaptionSessionIntent.userSelected(a, "zh-cn", true);
        assertEquals("zh-Hans", written.targetLanguage);
        assertTrue(written.translateTarget);
        CaptionSessionIntent reloaded = CaptionSessionIntent.load(a);
        assertEquals("zh-Hans", reloaded.targetLanguage);
        assertTrue(reloaded.translateTarget);
        assertEquals(written.revision, reloaded.revision);
        assertEquals(CaptionSessionIntent.PROVENANCE_USER, reloaded.provenance);
    }

    @Test
    public void everyUserActAdvancesTheRevisionOnce() {
        long toggle = CaptionSessionIntent.userToggled(a, true).revision;
        long selection = CaptionSessionIntent.userSelected(a, "ja", true).revision;
        long again = CaptionSessionIntent.userSelected(a, "ja", true).revision;
        assertEquals(toggle + 1, selection);
        assertEquals("the same choice is still a user act", selection + 1, again);
        assertEquals(again, CaptionSessionIntent.load(a).revision);
    }

    @Test
    public void aSourceTargetIsATargetButNotATranslation() {
        CaptionSessionIntent source = CaptionSessionIntent.userSelected(a, "en", false);
        assertTrue(source.hasTarget());
        assertFalse(source.translateTarget);
        assertFalse(source.translates());
        assertEquals("en", source.target());

        CaptionSessionIntent on = CaptionSessionIntent.userEnabledFor(a, "en", false);
        assertTrue(on.aiEnabled);
        assertEquals("en", on.target());
        assertFalse(on.translates());
    }

    @Test
    public void noLanguageIsNotATarget() {
        CaptionSessionIntent.userToggled(a, true);
        long revision = CaptionSessionIntent.load(a).revision;
        CaptionSessionIntent empty = CaptionSessionIntent.userSelected(a, "", true);
        assertFalse(empty.hasTarget());
        assertFalse(empty.translateTarget);
        CaptionSessionIntent option =
                CaptionSessionIntent.userSelected(a, "AUTO_TRANSLATE_CAPTIONS_OPTION", true);
        assertFalse("a menu option row is not a language", option.hasTarget());
        assertEquals("an unusable value is not a user act", revision, option.revision);
        assertTrue(option.aiEnabled);
    }
}
