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
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

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
import android.view.View;
import android.widget.Button;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.TextView;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.BaseSettings;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
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
        HushPinterestPreferenceFragment.failNextInitialization = null;
        SettingsDialog.failNextMount = null;
        PauseForTests.resume();
        BaseSettings.PAUSED.resetToDefault();
        BaseSettings.SAFE_MODE.resetToDefault();
    }

    private static HushPinterestPreferenceFragment open(Activity activity) {
        HushPinterestPreferenceFragment page = new HushPinterestPreferenceFragment();
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

    /** Uncaught, the exception from a tap on the source row would close Pinterest. */
    @Test
    public void aSourceLinkNoAppOpensLeavesATipAndThreadsRunning() {
        try (ActivityController<NoBrowserAround> controller = Robolectric.buildActivity(NoBrowserAround.class).setup()) {
            Preference source = titled(open(controller.get()).getPreferenceScreen(), L10n.t("Source code and issues"));
            assertNotNull(source);

            source.getOnPreferenceClickListener().onPreferenceClick(source);
            ShadowLooper.idleMainLooper();

            String tip = String.valueOf(ShadowToast.getTextOfLatestToast());
            assertTrue(tip, tip.contains("github.com/SysAdminDoc/HushPinterest"));
        }
    }

    /** Pause switched on changes the next start, and the card said "HushPinterest is on" and no more. */
    @Test
    public void theCardSaysPauseTakesHoldAtTheNextStart() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushPinterestPreferenceFragment page = open(controller.get());
            Preference card = titled(page.getPreferenceScreen(), L10n.t("HushPinterest is on"));
            SwitchPreference pause = (SwitchPreference) page.findPreference(BaseSettings.PAUSED.key);
            assertNotNull(card);
            assertNotNull(pause);

            pause.setChecked(true);
            ShadowLooper.idleMainLooper();
            assertTrue(summary(card), summary(card).endsWith(L10n.t("HushPinterest pauses when Pinterest restarts.")));

            pause.setChecked(false);
            ShadowLooper.idleMainLooper();
            assertFalse(summary(card), summary(card).contains(L10n.t("HushPinterest pauses when Pinterest restarts.")));
        }
    }

    /** A tap on the paused card, then Pause back on: the card kept saying it turns back on. */
    @Test
    public void pauseBackOnAfterATapOnTheCardSaysItStaysPaused() {
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        BaseSettings.PAUSED.save(true);
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushPinterestPreferenceFragment page = open(controller.get());
            Preference card = titled(page.getPreferenceScreen(), L10n.t("HushPinterest is paused"));
            assertNotNull(card);
            assertTrue(summary(card), summary(card).endsWith(L10n.t("Tap to turn it back on.")));

            card.getOnPreferenceClickListener().onPreferenceClick(card);
            ShadowLooper.idleMainLooper();
            assertEquals(L10n.t("HushPinterest turns back on when Pinterest restarts."), summary(card));

            ((SwitchPreference) page.findPreference(BaseSettings.PAUSED.key)).setChecked(true);
            ShadowLooper.idleMainLooper();
            assertTrue(summary(card), summary(card).endsWith(L10n.t("Tap to turn it back on.")));
        }
    }

    /** A row that ignores taps, such as Import while an export runs, looked like one that takes them. */
    @Test
    public void aDisabledRowIsDimmedAndAnEnabledOneIsNot() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushPinterestPreferenceFragment.Row row = new HushPinterestPreferenceFragment.Row(controller.get());
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
        HushPinterestPreferenceFragment.failNextInitialization = new IllegalStateException("settings failed to load");
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            HushPinterestPreferenceFragment page = open(controller.get());
            ListView list = page.getView().findViewById(android.R.id.list);
            assertEquals("the recovery page has a message and two actions", 3,
                    page.getPreferenceScreen().getPreferenceCount());
            assertEquals("ff000000", Integer.toHexString(ScreenColors.DEFAULT.background));
            assertEquals(Integer.toHexString(ScreenColors.DEFAULT.background),
                    Integer.toHexString(((ColorDrawable) list.getBackground()).getColor()));
        }
    }

    /** The mount error does not depend on preferences, the host's theme or its default button text. */
    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void theMountErrorAndItsActionsStayReadableAtDoubleTextSizeInEveryShippedLanguage() {
        RuntimeEnvironment.setFontScale(2f);
        try {
            // Arabic exercises right-to-left layout with the documented English fallback.
            for (String language : new String[]{"de-rDE", "es-rES", "in-rID", "pt-rBR", "tr-rTR", "ar"}) {
                RuntimeEnvironment.setQualifiers(language + "-w411dp-h891dp-notnight-xxhdpi");
                RuntimeEnvironment.setFontScale(2f);
                SettingsDialog.failNextMount = new IllegalStateException("mount failure");
                try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
                    if (language.equals("ar")) assertEquals(View.LAYOUT_DIRECTION_RTL,
                            controller.get().getResources().getConfiguration().getLayoutDirection());
                    SettingsDialog dialog = SettingsL10nTest.show(controller.get());
                    View root = dialog.getView();
                    root.measure(View.MeasureSpec.makeMeasureSpec(780, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(1200, View.MeasureSpec.EXACTLY));
                    root.layout(0, 0, 780, 1200);
                    ShadowLooper.idleMainLooper();
                    ScrollView recovery = root.findViewWithTag(SettingsDialog.MOUNT_ERROR);
                    assertNotNull(language, recovery);
                    assertEquals(ScreenColors.DEFAULT.background, ((ColorDrawable) recovery.getBackground()).getColor());
                    TextView title = recovery.findViewById(android.R.id.title);
                    TextView summary = recovery.findViewById(android.R.id.summary);
                    assertEquals(L10n.t(controller.get(), "HushPinterest settings couldn't open"), title.getText().toString());
                    if (!language.equals("ar")) assertFalse(language + " fell back to English",
                            "HushPinterest settings couldn't open".contentEquals(title.getText()));
                    assertEquals(L10n.t(controller.get(), "Try again, or go back to Pinterest."), summary.getText().toString());
                    assertTrue(title.isAccessibilityHeading());
                    for (TextView text : new TextView[]{title, summary,
                            recovery.findViewWithTag(SettingsDialog.MOUNT_RETRY), recovery.findViewWithTag(SettingsDialog.MOUNT_BACK)}) {
                        assertNotNull(language + " has no text layout", text.getLayout());
                        for (int line = 0; line < text.getLayout().getLineCount(); line++) {
                            assertEquals(language + " cuts off " + text.getText(), 0, text.getLayout().getEllipsisCount(line));
                        }
                        assertTrue(language + " clips " + text.getText(), text.getLayout().getHeight()
                                <= text.getHeight() - text.getCompoundPaddingTop() - text.getCompoundPaddingBottom());
                    }
                    Button retry = recovery.findViewWithTag(SettingsDialog.MOUNT_RETRY);
                    Button back = recovery.findViewWithTag(SettingsDialog.MOUNT_BACK);
                    assertEquals(L10n.t(controller.get(), "Retry"), retry.getText().toString());
                    assertEquals(L10n.t(controller.get(), "Back"), back.getText().toString());
                    assertTrue(retry.isEnabled());
                    assertTrue(back.isEnabled());
                    assertTrue("native recovery cannot scroll to its controls", recovery.isFillViewport());
                }
            }
        } finally {
            RuntimeEnvironment.setFontScale(1f);
            RuntimeEnvironment.setQualifiers("+en");
        }
    }
}
