package app.hushmessenger.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.view.View;
import android.widget.EditText;
import android.widget.Switch;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Keep the Profile button (#51): the chat details Profile button can stay while the other Facebook shortcuts go. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class FacebookProfileTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        CrashGuard.resetForTests();
    }

    @Test public void theProfileButtonFollowsHideFacebookUnlessKept() {
        assertFalse(Settings.hideFacebookProfile());
        Settings.preferences.edit().putBoolean(Settings.KEEP_FACEBOOK_PROFILE, true).commit();
        assertFalse("Keeping it does nothing while Hide Facebook shortcuts is off", Settings.hideFacebookProfile());

        Settings.preferences.edit().clear().putBoolean("facebook", true).commit();
        assertTrue("Off by default, so the button hides as it always has", Settings.hideFacebookProfile());
        assertTrue(Settings.lastActive("facebook") > 0);

        Settings.preferences.edit().putBoolean(Settings.KEEP_FACEBOOK_PROFILE, true).commit();
        assertFalse(Settings.hideFacebookProfile());
        assertTrue("The rest stay hidden", Settings.hideFacebook());
    }

    private enum HeaderAction { THREAD_DETAILS, VIEW_PROFILE, AUDIO_CALL }

    @Test public void theEmptyChatHeaderLosesOnlyViewProfileWhileTheButtonHides() {
        List<Object> actions = List.of(HeaderAction.THREAD_DETAILS, HeaderAction.VIEW_PROFILE, "VIEW_PROFILE", HeaderAction.AUDIO_CALL);
        assertSame("Hide Facebook shortcuts off", actions, Settings.withoutViewProfile(actions));

        Settings.preferences.edit().putBoolean("facebook", true).commit();
        assertEquals("Only the enum constant goes, in order", List.of(HeaderAction.THREAD_DETAILS, "VIEW_PROFILE", HeaderAction.AUDIO_CALL),
            Settings.withoutViewProfile(actions));
        List<HeaderAction> without = List.of(HeaderAction.THREAD_DETAILS, HeaderAction.AUDIO_CALL);
        assertSame("Nothing to drop hands the list back", without, Settings.withoutViewProfile(without));
        assertNull(Settings.withoutViewProfile(null));

        Settings.preferences.edit().putBoolean(Settings.KEEP_FACEBOOK_PROFILE, true).commit();
        assertSame("Keep the Profile button keeps it here too", actions, Settings.withoutViewProfile(actions));
    }

    @Test public void pauseSafeModeAndAMissingControlShowTheButton() {
        for (String state : new String[] {"paused", "safe", "missing"}) {
            Settings.initialize(RuntimeEnvironment.getApplication());
            Settings.preferences.edit().clear().putBoolean("facebook", true)
                .putBoolean("paused", state.equals("paused")).putBoolean("safe_mode", state.equals("safe")).commit();
            CrashGuard.resetForTests();
            CrashGuard.onProcessStart(RuntimeEnvironment.getApplication());
            if (state.equals("missing")) Settings.installed = Collections.emptySet();
            assertFalse(state, Settings.hideFacebookProfile());
        }
    }

    @Test public void theSwitchSitsUnderHideFacebookShortcutsAndSearchFindsIt() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Switch keep = root.findViewWithTag(Settings.KEEP_FACEBOOK_PROFILE);
            assertNotNull(keep);
            assertFalse(keep.isChecked());
            View facebook = root.findViewWithTag("facebook");
            View wrapper = (View) ((View) facebook.getParent()).getParent();
            assertSame("Inside the Hide Facebook shortcuts block", wrapper, ((View) keep.getParent()).getParent());
            assertFalse(SettingsActivity.EXPERIMENTAL.contains(Settings.KEEP_FACEBOOK_PROFILE));

            keep.performClick();
            assertTrue(Settings.preferences.getBoolean(Settings.KEEP_FACEBOOK_PROFILE, false));
            assertFalse("Turning it on leaves Hide Facebook shortcuts alone", Settings.preferences.getBoolean("facebook", false));

            // "keep" is only in the sub-switch's own words.
            ((EditText) root.findViewWithTag("find_control")).setText("keep profile");
            assertEquals(View.VISIBLE, wrapper.getVisibility());
            assertTrue(keep.isShown());
        }
    }

    @Test public void aBackupCarriesTheChoiceOnlyWithHideFacebookShortcuts() {
        Settings.preferences.edit().putBoolean("facebook", true).putBoolean(Settings.KEEP_FACEBOOK_PROFILE, true).commit();
        String backup = ChoiceCodec.encode(Settings.preferences, Set.of("facebook"));
        assertEquals(Map.of("paused", false, "facebook", true, Settings.KEEP_FACEBOOK_PROFILE, true), ChoiceCodec.parse(backup));
        assertFalse(ChoiceCodec.encode(Settings.preferences, Set.of("stories")).contains(Settings.KEEP_FACEBOOK_PROFILE));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            Settings.preferences.edit().putBoolean("facebook", false).putBoolean(Settings.KEEP_FACEBOOK_PROFILE, false).commit();
            importChoices(root, backup);
            assertTrue(Settings.preferences.getBoolean(Settings.KEEP_FACEBOOK_PROFILE, false));
            assertTrue(((Switch) root.findViewWithTag(Settings.KEEP_FACEBOOK_PROFILE)).isChecked());

            Settings.installed = Set.of("stories");
            importChoices(root, ChoiceCodec.HEADER + "\n" + Settings.KEEP_FACEBOOK_PROFILE + "=false\n");
            assertTrue("Without the patch the backup leaves it as it was", Settings.preferences.getBoolean(Settings.KEEP_FACEBOOK_PROFILE, false));
        }
    }

    private static void importChoices(View root, String raw) {
        RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).setPrimaryClip(ClipData.newPlainText("choices", raw));
        root.findViewWithTag("import_choices").performClick();
    }
}
