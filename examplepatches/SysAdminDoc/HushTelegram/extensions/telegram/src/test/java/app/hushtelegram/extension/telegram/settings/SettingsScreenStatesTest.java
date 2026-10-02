/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.SwitchPreference;
import android.widget.ListView;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.BaseSettings;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.EnumSet;

/** The settings screen's own states: the status card, the error page and a link no app opens. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsScreenStatesTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        HushTelegramPreferenceFragment.failNextInitialization = null;
        PauseForTests.resume();
        BaseSettings.PAUSED.resetToDefault();
        BaseSettings.SAFE_MODE.resetToDefault();
    }

    private static HushTelegramPreferenceFragment open(Activity activity) {
        HushTelegramPreferenceFragment page = new HushTelegramPreferenceFragment();
        activity.getFragmentManager().beginTransaction().add(android.R.id.content, page).commitNow();
        return page;
    }

    private static Preference titled(PreferenceGroup group, CharSequence title) {
        for (int i = 0; i < group.getPreferenceCount(); i++) {
            Preference row = group.getPreference(i);
            if (title.toString().contentEquals(String.valueOf(row.getTitle()))) return row;
            if (row instanceof PreferenceGroup) {
                Preference found = titled((PreferenceGroup) row, title);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static String summary(Preference row) {
        return String.valueOf(row.getSummary());
    }

    /** A phone whose only browser is off: Android throws where the page asks for one. */
    public static final class NoBrowserAround extends Activity {
        @Override
        public void startActivityFromFragment(Fragment fragment, Intent intent, int requestCode, Bundle options) {
            throw new ActivityNotFoundException("No Activity found to handle Intent { act=android.intent.action.VIEW }");
        }
    }

    /** Uncaught, the exception from a tap on the source row would close Telegram. */
    @Test
    public void aSourceLinkNoAppOpensLeavesATipAndThreadsRunning() {
        try (ActivityController<NoBrowserAround> controller = Robolectric.buildActivity(NoBrowserAround.class).setup()) {
            Preference source = titled(open(controller.get()).getPreferenceScreen(), L10n.t("Source code and issues"));
            assertNotNull(source);

            source.getOnPreferenceClickListener().onPreferenceClick(source);
            ShadowLooper.idleMainLooper();

            String tip = String.valueOf(ShadowToast.getTextOfLatestToast());
            assertTrue(tip, tip.contains("github.com/SysAdminDoc/HushTelegram"));
        }
    }

    /** Pause switched on changes the next start, and the card said "HushTelegram is on" and no more. */
    @Test
    public void theCardSaysPauseTakesHoldAtTheNextStart() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = open(controller.get());
            Preference card = titled(page.getPreferenceScreen(), L10n.t("HushTelegram is on"));
            SwitchPreference pause = (SwitchPreference) page.findPreference(BaseSettings.PAUSED.key);
            assertNotNull(card);
            assertNotNull(pause);

            pause.setChecked(true);
            ShadowLooper.idleMainLooper();
            assertTrue(summary(card), summary(card).endsWith(L10n.t("HushTelegram pauses when Telegram restarts.")));

            pause.setChecked(false);
            ShadowLooper.idleMainLooper();
            assertFalse(summary(card), summary(card).contains(L10n.t("HushTelegram pauses when Telegram restarts.")));
        }
    }

    /** A tap on the paused card, then Pause back on: the card kept saying it turns back on. */
    @Test
    public void pauseBackOnAfterATapOnTheCardSaysItStaysPaused() {
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        BaseSettings.PAUSED.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = open(controller.get());
            Preference card = titled(page.getPreferenceScreen(), L10n.t("HushTelegram is paused"));
            assertNotNull(card);
            assertTrue(summary(card), summary(card).endsWith(L10n.t("Tap to turn it back on.")));

            card.getOnPreferenceClickListener().onPreferenceClick(card);
            ShadowLooper.idleMainLooper();
            assertEquals(L10n.t("HushTelegram turns back on when Telegram restarts."), summary(card));

            ((SwitchPreference) page.findPreference(BaseSettings.PAUSED.key)).setChecked(true);
            ShadowLooper.idleMainLooper();
            assertTrue(summary(card), summary(card).endsWith(L10n.t("Tap to turn it back on.")));
        }
    }

    /** A row that ignores taps, such as Import while an export runs, looked like one that takes them. */
    @Test
    public void aDisabledRowIsDimmedAndAnEnabledOneIsNot() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment.Row row = new HushTelegramPreferenceFragment.Row(controller.get());
            row.setTitle("Import settings");
            row.setSummary("Waiting for the export.");
            ListView list = new ListView(controller.get());

            row.setEnabled(false);
            android.view.View off = row.getView(null, list);
            assertTrue(alphaOf(off, android.R.id.title) < 0xFF);
            assertTrue(alphaOf(off, android.R.id.summary) < 0xFF);

            row.setEnabled(true);
            android.view.View on = row.getView(null, list);
            assertEquals(0xFF, alphaOf(on, android.R.id.title));
            assertEquals(0xFF, alphaOf(on, android.R.id.summary));
        }
    }

    private static int alphaOf(android.view.View row, int id) {
        android.widget.TextView text = row.findViewById(id);
        assertNotNull(text);
        return android.graphics.Color.alpha(text.getCurrentTextColor());
    }

    /**
     * A page that failed to build is still drawn on the screen's black, whatever the phone's own
     * theme, so its light text stays readable on a phone set to light mode.
     */
    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void aFailedPageIsDrawnOnTheScreensBlackOnALightPhone() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
        RuntimeEnvironment.setQualifiers("+notnight");
        HushTelegramPreferenceFragment.failNextInitialization = new IllegalStateException("settings failed to load");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushTelegramPreferenceFragment page = open(controller.get());
            ListView list = page.getView().findViewById(android.R.id.list);
            assertEquals("the recovery page has a message and two actions", 3,
                    page.getPreferenceScreen().getPreferenceCount());
            assertEquals("ff000000", Integer.toHexString(ScreenColors.DEFAULT.background));
            assertEquals(Integer.toHexString(ScreenColors.DEFAULT.background),
                    Integer.toHexString(((ColorDrawable) list.getBackground()).getColor()));
        }
    }
}
