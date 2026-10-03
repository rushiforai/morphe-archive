/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.profile;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.util.function.BooleanSupplier;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.SettingsContextRule;
import app.hushgram.extension.shared.diagnostics.FeedFilterCounters;
import app.hushgram.extension.shared.diagnostics.HookStatus;
import app.hushgram.extension.shared.settings.BaseSettings;
import app.hushgram.extension.shared.settings.HushgramPause;
import app.hushgram.extension.shared.settings.PauseForTests;

/** What the profile suggestion hooks answer, and that each one leaves Instagram's answer when it can't decide. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class ProfileSuggestionsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();
    private Context context;

    private static final BooleanSupplier THROWS = () -> {
        throw new IllegalStateException("settings went away");
    };

    @Before
    public void enable() {
        context = RuntimeEnvironment.getApplication();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        Settings.HIDE_PROFILE_SUGGESTIONS.save(true);
        HookStatus.clear();
        FeedFilterCounters.clear();
    }

    @After
    public void restore() {
        Settings.HIDE_PROFILE_SUGGESTIONS.resetToDefault();
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();
        HookStatus.clear();
        FeedFilterCounters.clear();
    }

    /** On, the inline row reads as having nothing to show, the standalone row is left out and the button goes. */
    @Test
    public void withTheSwitchOnEverySuggestionIsHidden() {
        View button = new View(context);

        assertEquals(0, ProfileSuggestions.inlineRow(1));
        assertEquals(0, ProfileSuggestions.keepStandaloneRow());
        ProfileSuggestions.chainingButton(button);

        assertEquals(View.GONE, button.getVisibility());
        String report = FeedFilterCounters.report().toString();
        assertTrue(report, report.contains(ProfileSuggestions.ROUTE));
        assertTrue(report, report.contains("3 removed"));
        assertTrue(report, report.contains(ProfileSuggestions.INLINE_ROW));
        assertTrue(report, report.contains(ProfileSuggestions.STANDALONE_ROW));
        assertTrue(report, report.contains(ProfileSuggestions.CHAINING_BUTTON));
    }

    /** Off, every hook hands back what Instagram had, and the hooks still count that they ran. */
    @Test
    public void withTheSwitchOffInstagramsAnswersStand() {
        Settings.HIDE_PROFILE_SUGGESTIONS.save(false);
        View button = new View(context);

        assertEquals(1, ProfileSuggestions.inlineRow(1));
        assertEquals(1, ProfileSuggestions.keepStandaloneRow());
        ProfileSuggestions.chainingButton(button);

        assertEquals(View.VISIBLE, button.getVisibility());
        String report = FeedFilterCounters.report().toString();
        assertTrue(report, report.contains("0 removed"));
        assertTrue(String.join("\n", HookStatus.report()), HookStatus.report().toString().contains(FamilyNames.PROFILE_SUGGESTIONS));
    }

    /** A row Instagram already had nothing for stays that way, whatever the switch says, and no button is no work. */
    @Test
    public void nothingToHideIsLeftAsItIs() {
        assertEquals(0, ProfileSuggestions.inlineRow(0));
        Settings.HIDE_PROFILE_SUGGESTIONS.save(false);
        assertEquals(0, ProfileSuggestions.inlineRow(0));
        ProfileSuggestions.chainingButton(null);
        assertTrue(FeedFilterCounters.report().toString(), FeedFilterCounters.report().isEmpty());
    }

    /**
     * Instagram reuses the button and never sets its visibility, so one this hid gets its own
     * visibility back once the switch is off, and one it never touched keeps whatever it has.
     */
    @Test
    public void aButtonHiddenEarlierComesBackWhenTheSwitchGoesOff() {
        View shown = new View(context);
        View invisible = new View(context);
        invisible.setVisibility(View.INVISIBLE);
        View untouched = new View(context);
        untouched.setVisibility(View.GONE);

        ProfileSuggestions.chainingButton(shown);
        ProfileSuggestions.chainingButton(invisible);
        ProfileSuggestions.chainingButton(shown);
        assertEquals(View.GONE, shown.getVisibility());
        assertEquals(View.GONE, invisible.getVisibility());

        Settings.HIDE_PROFILE_SUGGESTIONS.save(false);
        ProfileSuggestions.chainingButton(shown);
        ProfileSuggestions.chainingButton(invisible);
        ProfileSuggestions.chainingButton(untouched);

        assertEquals("a second bind while hidden wrote GONE over the button's own visibility", View.VISIBLE, shown.getVisibility());
        assertEquals(View.INVISIBLE, invisible.getVisibility());
        assertEquals(View.GONE, untouched.getVisibility());
    }

    /** Paused, or called before the settings are read, every hook hands back what Instagram had. */
    @Test
    public void offPausedAndUnreadyLeaveInstagramsAnswers() {
        BaseSettings.PAUSED.save(true);
        PauseForTests.pause(HushgramPause.Reason.SWITCH);
        View paused = new View(context);
        assertEquals(1, ProfileSuggestions.inlineRow(1));
        assertEquals(1, ProfileSuggestions.keepStandaloneRow());
        ProfileSuggestions.chainingButton(paused);
        assertEquals(View.VISIBLE, paused.getVisibility());
        BaseSettings.PAUSED.save(false);
        PauseForTests.resume();

        View unready = new View(context);
        SettingsContextRule.withoutContext(() -> {
            assertEquals(1, ProfileSuggestions.inlineRow(1));
            assertEquals(1, ProfileSuggestions.keepStandaloneRow());
            ProfileSuggestions.chainingButton(unready);
        });
        assertEquals(View.VISIBLE, unready.getVisibility());
    }

    /** A switch that throws leaves every answer as Instagram's and says which hook threw. */
    @Test
    public void aThrowingSwitchFailsOpenAndIsReported() {
        View button = new View(context);

        assertEquals(1, ProfileSuggestions.inlineRow(1, THROWS));
        assertEquals(1, ProfileSuggestions.keepStandaloneRow(THROWS));
        ProfileSuggestions.chainingButton(button, THROWS);

        assertEquals(View.VISIBLE, button.getVisibility());
        String missing = HookStatus.missing(FamilyNames.PROFILE_SUGGESTIONS).toString();
        assertTrue(missing, missing.contains("'" + ProfileSuggestions.INLINE_ROW + "'"));
        assertTrue(missing, missing.contains("'" + ProfileSuggestions.STANDALONE_ROW + "'"));
        assertTrue(missing, missing.contains("'" + ProfileSuggestions.CHAINING_BUTTON + "'"));
        assertTrue(missing, missing.contains(IllegalStateException.class.getName()));
    }

    /** A button that throws when hidden is left to Instagram, and the failure is reported, not thrown. */
    @Test
    public void aButtonThatThrowsIsLeftAndReported() {
        View button = new View(context) {
            @Override
            public void setVisibility(int visibility) {
                throw new UnsupportedOperationException("detached");
            }
        };

        ProfileSuggestions.chainingButton(button, () -> true);

        assertEquals(View.VISIBLE, button.getVisibility());
        String missing = HookStatus.missing(FamilyNames.PROFILE_SUGGESTIONS).toString();
        assertTrue(missing, missing.contains("'" + ProfileSuggestions.CHAINING_BUTTON + "'"));
        assertTrue(missing, missing.contains(UnsupportedOperationException.class.getName()));
    }
}
