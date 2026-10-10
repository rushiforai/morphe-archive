/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.BooleanSetting;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class UiHooksTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    private enum Tab { HOME, SEARCH, CREATE, NOTIFICATIONS, PROFILE, UNKNOWN }

    private static final BooleanSetting[] SWITCHES = {
            Settings.HIDE_SCREENSHOT_SHARE, Settings.HIDE_SEARCH_HISTORY,
            Settings.HIDE_NAV_CREATE, Settings.HIDE_NAV_NOTIFICATIONS, Settings.HIDE_NAV_SEARCH, Settings.HIDE_HEADER_BUTTONS,
            Settings.HIDE_PIN_MENU_COLLAGE, Settings.HIDE_PIN_MENU_VISUAL_SEARCH, Settings.HIDE_PIN_MENU_PIN_BOOST,
            Settings.HIDE_COMMENTS, Settings.HIDE_TOPIC_SUGGESTIONS, Settings.QUIET_EMAIL_REMINDER, Settings.HIDE_SURVEY_PROMPTS,
            Settings.HIDE_SAVE_TOASTS, Settings.ORIGINAL_IMAGES, Settings.DISABLE_UPDATE_NAG
    };

    @After public void restore() {
        PauseForTests.resume();
        for (BooleanSetting setting : SWITCHES) setting.resetToDefault();
        HookStatus.clear();
    }

    @Test public void everyOptionalControlStartsOffAndLeavesHostValuesAlone() {
        for (BooleanSetting setting : SWITCHES) assertFalse(setting.key, setting.defaultValue);
        assertFalse(UiHooks.hideScreenshotShare());
        assertFalse(UiHooks.quietEmailReminder());
        assertFalse(UiHooks.hideSurveyPrompts());
        assertFalse(UiHooks.hideSponsoredPolls());
        assertFalse(UiHooks.disableUpdateNag());
        assertFalse(UiHooks.originalImages());
        assertFalse(UiHooks.hideTopicSuggestions());
        View topics = new LinearLayout(RuntimeEnvironment.getApplication());
        UiHooks.topicSuggestions(topics);
        assertEquals(View.VISIBLE, topics.getVisibility());
        assertEquals(312, UiHooks.topicSuggestionsMeasureSpec(topics, 312));
        assertEquals(View.INVISIBLE, UiHooks.searchHistoryVisibility(View.INVISIBLE));
        assertEquals(312, UiHooks.searchHistoryMeasureSpec(312));
        assertEquals(View.VISIBLE, UiHooks.commentsVisibility(View.VISIBLE));
        assertTrue(UiHooks.commentsVisible(true));
    }

    @Test public void screenshotAndOptionalRemindersRestoreWhenPaused() {
        Settings.HIDE_SCREENSHOT_SHARE.save(true);
        Settings.QUIET_EMAIL_REMINDER.save(true);
        Settings.DISABLE_UPDATE_NAG.save(true);
        Settings.ORIGINAL_IMAGES.save(true);
        assertTrue(UiHooks.hideScreenshotShare());
        assertTrue(UiHooks.quietEmailReminder());
        assertTrue(UiHooks.disableUpdateNag());
        assertTrue(UiHooks.originalImages());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(UiHooks.hideScreenshotShare());
        assertFalse(UiHooks.quietEmailReminder());
        assertFalse(UiHooks.disableUpdateNag());
        assertFalse(UiHooks.originalImages());
        assertTrue(Settings.HIDE_SCREENSHOT_SHARE.savedValue());
    }

    @Test public void surveyInvitesAndSponsoredPollsAreSkippedOnlyWhileTheSwitchIsOnAndCounted() {
        assertFalse("off by default, Pinterest shows its invite", UiHooks.hideSurveyPrompts());
        assertFalse("off by default, Pinterest opens its poll", UiHooks.hideSponsoredPolls());
        Settings.HIDE_SURVEY_PROMPTS.save(true);
        assertTrue(UiHooks.hideSurveyPrompts());
        assertTrue(UiHooks.hideSponsoredPolls());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("survey invite declined"));
        assertTrue(report, report.contains("sponsored poll skipped"));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse("paused, Pinterest shows its invite", UiHooks.hideSurveyPrompts());
        assertFalse("paused, Pinterest opens its poll", UiHooks.hideSponsoredPolls());
        assertTrue(Settings.HIDE_SURVEY_PROMPTS.savedValue());
        PauseForTests.resume();
        Settings.HIDE_SURVEY_PROMPTS.save(false);
        assertFalse(UiHooks.hideSurveyPrompts());
        assertFalse(UiHooks.hideSponsoredPolls());
    }

    @Test public void saveToastsDropOnlyTheNamedModelsWhileTheSwitchIsOn() {
        StringBuilder saved = new StringBuilder();
        UiHooks.saveToastForTests = StringBuilder.class;
        try {
            assertFalse(UiHooks.hideSaveToast(saved));
            Settings.HIDE_SAVE_TOASTS.save(true);
            assertTrue(UiHooks.hideSaveToast(saved));
            assertFalse(UiHooks.hideSaveToast("another toast"));
            assertFalse(UiHooks.hideSaveToast(null));
            PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
            assertFalse(UiHooks.hideSaveToast(saved));
            PauseForTests.resume();
        } finally {
            UiHooks.saveToastForTests = null;
        }
        assertFalse("the unpatched stub names no toast", UiHooks.hideSaveToast(saved));
    }

    @Test public void topicRowsFoldToZeroAndComeBackWhenBoundWithTheSwitchOff() {
        int spec = View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.AT_MOST);
        View row = new LinearLayout(RuntimeEnvironment.getApplication());
        View other = new LinearLayout(RuntimeEnvironment.getApplication());
        Settings.HIDE_TOPIC_SUGGESTIONS.save(true);
        UiHooks.topicSuggestions(row);
        assertEquals(View.GONE, row.getVisibility());
        int folded = UiHooks.topicSuggestionsMeasureSpec(row, spec);
        assertEquals(0, View.MeasureSpec.getSize(folded));
        assertEquals(View.MeasureSpec.EXACTLY, View.MeasureSpec.getMode(folded));
        assertEquals("a row the hook never hid measures as asked", spec, UiHooks.topicSuggestionsMeasureSpec(other, spec));
        assertEquals(spec, UiHooks.topicSuggestionsMeasureSpec(null, spec));
        UiHooks.topicSuggestions(row);
        assertEquals("binding a hidden row again keeps it hidden", 0, View.MeasureSpec.getSize(UiHooks.topicSuggestionsMeasureSpec(row, spec)));
        Settings.HIDE_TOPIC_SUGGESTIONS.save(false);
        UiHooks.topicSuggestions(row);
        assertEquals(View.VISIBLE, row.getVisibility());
        assertEquals(spec, UiHooks.topicSuggestionsMeasureSpec(row, spec));
        UiHooks.topicSuggestions("not a view");
        UiHooks.topicSuggestions(null);
    }

    @Test public void aTopicRowPinterestHidItselfIsLeftAlone() {
        int spec = View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.AT_MOST);
        View row = new LinearLayout(RuntimeEnvironment.getApplication());
        row.setVisibility(View.GONE);
        Settings.HIDE_TOPIC_SUGGESTIONS.save(true);
        UiHooks.topicSuggestions(row);
        assertEquals(spec, UiHooks.topicSuggestionsMeasureSpec(row, spec));
        Settings.HIDE_TOPIC_SUGGESTIONS.save(false);
        UiHooks.topicSuggestions(row);
        assertEquals("only rows the hook hid come back", View.GONE, row.getVisibility());
    }

    @Test public void aHiddenTopicRowComesBackAfterItsNextMeasureWhilePaused() {
        int width = View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.EXACTLY);
        int height = View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED);
        View row = new LinearLayout(RuntimeEnvironment.getApplication());
        Settings.HIDE_TOPIC_SUGGESTIONS.save(true);
        UiHooks.topicSuggestions(row);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(width, UiHooks.topicSuggestionsMeasureSpec(row, width));
        assertEquals(height, UiHooks.topicSuggestionsMeasureSpec(row, height));
        assertEquals("shown after the layout pass, not during it", View.GONE, row.getVisibility());
        ShadowLooper.idleMainLooper();
        assertEquals(View.VISIBLE, row.getVisibility());
        PauseForTests.resume();
        assertEquals("a row given back measures as asked until it's bound again", width, UiHooks.topicSuggestionsMeasureSpec(row, width));
        UiHooks.topicSuggestions(row);
        assertEquals(View.GONE, row.getVisibility());
    }

    @Test public void aTopicRowStaysHiddenWhenTheSwitchIsBackOnBeforeTheLayoutPassEnds() {
        int spec = View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.AT_MOST);
        View row = new LinearLayout(RuntimeEnvironment.getApplication());
        Settings.HIDE_TOPIC_SUGGESTIONS.save(true);
        UiHooks.topicSuggestions(row);
        Settings.HIDE_TOPIC_SUGGESTIONS.save(false);
        assertEquals(spec, UiHooks.topicSuggestionsMeasureSpec(row, spec));
        Settings.HIDE_TOPIC_SUGGESTIONS.save(true);
        ShadowLooper.idleMainLooper();
        assertEquals(View.GONE, row.getVisibility());
        assertEquals(0, View.MeasureSpec.getSize(UiHooks.topicSuggestionsMeasureSpec(row, spec)));
    }

    @Test public void searchHistoryAndCommentsFoldToZeroAndRestoreTheirRequestedSize() {
        int spec = View.MeasureSpec.makeMeasureSpec(200, View.MeasureSpec.AT_MOST);
        Settings.HIDE_SEARCH_HISTORY.save(true);
        Settings.HIDE_COMMENTS.save(true);
        assertEquals(View.GONE, UiHooks.searchHistoryVisibility(View.VISIBLE));
        assertEquals(0, View.MeasureSpec.getSize(UiHooks.searchHistoryMeasureSpec(spec)));
        assertEquals(View.MeasureSpec.EXACTLY, View.MeasureSpec.getMode(UiHooks.searchHistoryMeasureSpec(spec)));
        assertEquals(View.GONE, UiHooks.commentsVisibility(View.VISIBLE));
        assertEquals(0, View.MeasureSpec.getSize(UiHooks.commentsMeasureSpec(spec)));
        assertFalse(UiHooks.commentsVisible(true));
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertEquals(View.INVISIBLE, UiHooks.searchHistoryVisibility(View.INVISIBLE));
        assertEquals(spec, UiHooks.searchHistoryMeasureSpec(spec));
        assertEquals(spec, UiHooks.commentsMeasureSpec(spec));
        assertTrue(UiHooks.commentsVisible(true));
    }

    @Test public void navigationSwitchesHideOnlyTheirNamedTabsAndRestoreTheHostVisibility() {
        Settings.HIDE_NAV_CREATE.save(true);
        Settings.HIDE_NAV_NOTIFICATIONS.save(false);
        assertTrue(InterfaceControls.hideNavigation("CREATE"));
        assertFalse(InterfaceControls.hideNavigation("NOTIFICATIONS"));
        assertFalse(InterfaceControls.hideNavigation("HOME"));
        assertFalse(InterfaceControls.hideNavigation("PROFILE"));
        assertFalse(InterfaceControls.hideNavigation("SEARCH"));
        assertFalse(InterfaceControls.hideNavigation("UNKNOWN"));
        Settings.HIDE_NAV_SEARCH.save(true);
        assertTrue(InterfaceControls.hideNavigation("SEARCH"));
        assertFalse(InterfaceControls.hideNavigation("HOME"));
        assertFalse(InterfaceControls.hideNavigation("PROFILE"));
        Settings.HIDE_NAV_SEARCH.save(false);
        LinearLayout root = new LinearLayout(RuntimeEnvironment.getApplication());
        LinearLayout nested = new LinearLayout(RuntimeEnvironment.getApplication());
        View create = new View(RuntimeEnvironment.getApplication());
        View profile = new View(RuntimeEnvironment.getApplication());
        create.setVisibility(View.INVISIBLE);
        nested.addView(create);
        nested.addView(profile);
        root.addView(nested);
        InterfaceControls.bindNavigation(create, Tab.CREATE);
        InterfaceControls.bindNavigation(profile, Tab.PROFILE);
        assertEquals(View.GONE, create.getVisibility());
        assertEquals(View.VISIBLE, profile.getVisibility());
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        InterfaceControls.refreshNavigation(root);
        assertEquals(View.INVISIBLE, create.getVisibility());
        assertEquals(View.VISIBLE, profile.getVisibility());
        assertEquals(2, nested.getChildCount());
    }

    @Test public void unknownNavigationModelsLeaveTheViewAlone() {
        Settings.HIDE_NAV_CREATE.save(true);
        View view = new View(RuntimeEnvironment.getApplication());
        view.setVisibility(View.INVISIBLE);
        InterfaceControls.bindNavigation(view, new Object());
        assertEquals(View.INVISIBLE, view.getVisibility());
    }

    @Test public void headerControlNamesExcludeLeadingActionsTextAndAvatar() {
        assertTrue(InterfaceControls.headerAction("end_container_icon_bt"));
        assertTrue(InterfaceControls.headerAction("end_container_icon_buttons"));
        assertFalse(InterfaceControls.headerAction("start_container_icon_bt"));
        assertFalse(InterfaceControls.headerAction("start_container_icon_buttons"));
        assertFalse(InterfaceControls.headerAction("end_container_text_button"));
        assertFalse(InterfaceControls.headerAction("end_container_avatar"));
        assertFalse(InterfaceControls.headerAction("header_static_search_bar"));
    }

    @Test public void menuChoicesAreIndependentAndKeepDownloadShareCopyReportAndSave() {
        Settings.HIDE_PIN_MENU_COLLAGE.save(true);
        assertTrue(InterfaceControls.hidePinMenuItem("overflow_menu_add_to_collage"));
        assertTrue(InterfaceControls.hidePinMenuItem("overflow_menu_remix_collage"));
        assertFalse(InterfaceControls.hidePinMenuItem("contextmenu_visual_search_image"));
        assertFalse(InterfaceControls.hidePinMenuItem("overflow_menu_pin_boost"));
        Settings.HIDE_PIN_MENU_VISUAL_SEARCH.save(true);
        Settings.HIDE_PIN_MENU_PIN_BOOST.save(true);
        assertTrue(InterfaceControls.hidePinMenuItem("contextmenu_visual_search_image"));
        assertTrue(InterfaceControls.hidePinMenuItem("overflow_menu_pin_boost"));
        for (String key : new String[] {"save_to_device", "overflow_menu_share", "copy_link",
                "grid_actions_report_pin", "save_pin", "overflow_menu_edit", "unknown"}) {
            assertFalse(key, InterfaceControls.hidePinMenuItem(key));
        }
        View row = new View(RuntimeEnvironment.getApplication());
        InterfaceControls.pinMenuItem(row, "overflow_menu_add_to_collage");
        assertEquals(View.GONE, row.getVisibility());
        Settings.HIDE_PIN_MENU_COLLAGE.save(false);
        InterfaceControls.pinMenuItem(row, "overflow_menu_add_to_collage");
        assertEquals(View.VISIBLE, row.getVisibility());
    }

    @Test public void menuCensusRecordsFixedRowsAndPauseWithoutReadingTheirText() {
        String[] keys = {"overflow_menu_add_to_collage", "overflow_menu_remix_collage",
                "contextmenu_visual_search_image", "overflow_menu_pin_boost"};
        for (String key : keys) {
            TextView row = new TextView(RuntimeEnvironment.getApplication());
            row.setText("private-person pin_id=987654321 https://private.example/token");
            InterfaceControls.pinMenuItem(row, key);
            assertEquals(View.VISIBLE, row.getVisibility());
        }
        Settings.HIDE_PIN_MENU_COLLAGE.save(true);
        Settings.HIDE_PIN_MENU_VISUAL_SEARCH.save(true);
        Settings.HIDE_PIN_MENU_PIN_BOOST.save(true);
        for (String key : keys) {
            View row = new View(RuntimeEnvironment.getApplication());
            InterfaceControls.pinMenuItem(row, key);
            assertEquals(View.GONE, row.getVisibility());
            PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
            InterfaceControls.pinMenuItem(row, key);
            assertEquals(View.VISIBLE, row.getVisibility());
            PauseForTests.resume();
        }
        String report = LogBufferManager.buildExportText();
        for (String key : keys) {
            assertTrue(report, report.contains(key + " visible 2"));
            assertTrue(report, report.contains(key + " hidden by fixed switch 1"));
        }
        assertFalse(report, report.contains("private-person"));
        assertFalse(report, report.contains("987654321"));
        assertFalse(report, report.contains("private.example"));
    }

    @Test public void menuCensusIgnoresEssentialAndUnknownRowsEvenWhenAllFiltersAreOn() {
        Settings.HIDE_PIN_MENU_COLLAGE.save(true);
        Settings.HIDE_PIN_MENU_VISUAL_SEARCH.save(true);
        Settings.HIDE_PIN_MENU_PIN_BOOST.save(true);
        String[] essential = {"save_to_device", "overflow_menu_share", "copy_link",
                "grid_actions_report_pin", "save_pin"};
        View row = new View(RuntimeEnvironment.getApplication());
        for (String key : essential) {
            InterfaceControls.pinMenuItem(row, key);
            assertEquals(View.VISIBLE, row.getVisibility());
        }
        for (int i = 0; i < 1000; i++) InterfaceControls.pinMenuItem(row, "private_unknown_" + i);
        InterfaceControls.pinMenuItem(row, null);
        InterfaceControls.pinMenuItem(null, "overflow_menu_add_to_collage");
        String report = LogBufferManager.buildExportText();
        for (String key : essential) assertFalse(report, report.contains(key));
        assertFalse(report, report.contains("private_unknown"));
        assertFalse(report, report.contains("Counted:"));
        assertEquals(View.VISIBLE, row.getVisibility());
    }

    @Retention(RetentionPolicy.RUNTIME) @Target(ElementType.FIELD)
    public @interface Json { String value(); }

    public static final class Pin {
        @Json("images") Map<String, Object> images = new HashMap<>();
    }

    public static final class Image {
        @Json("url") String url;
        @Json("width") Double width;
        @Json("height") Double height;

        Image(String url, Double width, Double height) {
            this.url = url; this.width = width; this.height = height;
        }
    }

    public static final class OtherImage {
        @Json("url") String url = "https://i.pinimg.com/originals/aa/bb/cc/other.jpg";
        @Json("width") Double width = 3000d;
        @Json("height") Double height = 4000d;
    }

    @Test public void theOriginalJoinsRequestedSizesAndShowsInTheCloseupOnlyWhileOn() {
        Pin pin = new Pin();
        Image large = new Image("https://i.pinimg.com/736x/aa/bb/cc/large.jpg", 736d, 1104d);
        Image original = new Image("https://i.pinimg.com/originals/aa/bb/cc/large.png", 2400d, 3600d);
        pin.images.put("736x", large);
        pin.images.put("orig", original);
        Set<String> sizes = new HashSet<>(Arrays.asList("236x", "736x"));
        UiHooks.imageSizes(sizes);
        assertEquals(new HashSet<>(Arrays.asList("236x", "736x")), sizes);
        assertSame(large, UiHooks.closeupImage(pin, large));

        Settings.ORIGINAL_IMAGES.save(true);
        UiHooks.imageSizes(sizes);
        // Pinterest's API fails a pin request that names originals, and the home feed doesn't load.
        assertEquals(new HashSet<>(Arrays.asList("236x", "736x", "orig")), sizes);
        UiHooks.imageSizes(null);
        assertSame(original, UiHooks.closeupImage(pin, large));
        assertNull(UiHooks.closeupImage(pin, null));
        assertSame(large, UiHooks.closeupImage(null, large));
        assertSame("a pin without images", large, UiHooks.closeupImage(new Object(), large));

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        Set<String> paused = new HashSet<>(Collections.singletonList("736x"));
        UiHooks.imageSizes(paused);
        assertEquals(Collections.singleton("736x"), paused);
        assertSame(large, UiHooks.closeupImage(pin, large));
    }

    @Test public void theCloseupKeepsItsLargeImageUnlessTheOriginalIsOneItCanShow() {
        Settings.ORIGINAL_IMAGES.save(true);
        Image large = new Image("https://i.pinimg.com/736x/aa/bb/cc/large.jpg", 736d, 1104d);
        Map<String, Object> unusable = new LinkedHashMap<>();
        unusable.put("no original", null);
        unusable.put("another image model", new OtherImage());
        unusable.put("no height", new Image("https://i.pinimg.com/originals/aa/bb/cc/a.jpg", 2400d, null));
        unusable.put("zero width", new Image("https://i.pinimg.com/originals/aa/bb/cc/a.jpg", 0d, 3600d));
        unusable.put("past the texture limit", new Image("https://i.pinimg.com/originals/aa/bb/cc/a.jpg", 6000d, 9000d));
        unusable.put("no address", new Image(null, 2400d, 3600d));
        unusable.put("plain http", new Image("http://i.pinimg.com/originals/aa/bb/cc/a.jpg", 2400d, 3600d));
        unusable.put("another host", new Image("https://pinimg.com.example.net/originals/a.jpg", 2400d, 3600d));
        unusable.put("a user in the address", new Image("https://someone@i.pinimg.com/originals/a.jpg", 2400d, 3600d));
        unusable.put("malformed address", new Image("https://i.pinimg.com/originals/a b.jpg", 2400d, 3600d));
        for (Map.Entry<String, Object> entry : unusable.entrySet()) {
            Pin pin = new Pin();
            pin.images.put("736x", large);
            pin.images.put("orig", entry.getValue());
            assertSame(entry.getKey(), large, UiHooks.closeupImage(pin, large));
        }
        Pin bare = new Pin();
        bare.images = null;
        assertSame("no images at all", large, UiHooks.closeupImage(bare, large));
        Pin apex = new Pin();
        Image onApex = new Image("https://pinimg.com/originals/aa/bb/cc/a.webp", 8192d, 900d);
        apex.images.put("originals", onApex);
        assertSame("an originals entry still counts", onApex, UiHooks.closeupImage(apex, large));
        Image orig = new Image("https://i.pinimg.com/originals/aa/bb/cc/b.jpg", 1600d, 1200d);
        apex.images.put("orig", orig);
        assertSame("orig comes first", orig, UiHooks.closeupImage(apex, large));
    }

    @Test public void menuCensusDistinguishesNativeHiddenRowsFromFilterDecisions() {
        View row = new View(RuntimeEnvironment.getApplication());
        row.setVisibility(View.INVISIBLE);
        InterfaceControls.pinMenuItem(row, "overflow_menu_add_to_collage");
        String report = LogBufferManager.buildExportText();
        assertTrue(report, report.contains("overflow_menu_add_to_collage not visible in native layout 1"));
        assertFalse(report, report.contains("overflow_menu_add_to_collage visible"));
        assertFalse(report, report.contains("hidden by fixed switch"));
        assertEquals(View.INVISIBLE, row.getVisibility());
    }
}
