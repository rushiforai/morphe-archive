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
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.SwitchPreference;
import android.util.TypedValue;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Switch;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;

/**
 * What a screen reader and a finger get from the settings screen: headings to jump between,
 * switches that say they're switches and whether they're on, a double tap that does what a tap
 * does, text that wraps in full at any size, and nothing to tap smaller than 48 dp.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@SuppressWarnings("deprecation")
public class SettingsAccessibilityTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();

    @Before
    public void everyPatchIn() {
        PatchFamily.inBuildForTests = EnumSet.allOf(PatchFamily.class);
    }

    @After
    public void restore() {
        PatchFamily.inBuildForTests = null;
        HushTelegramPreferenceFragment.failNextInitialization = null;
        PauseForTests.resume();
        Settings.HIDE_ADS.resetToDefault();
        app.hushtelegram.extension.shared.settings.BaseSettings.PAUSED.resetToDefault();
        controller.close();
    }

    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void everySectionTitleIsAHeadingAndNothingElseIs() {
        int headings = 0;
        for (View row : rows(SettingsL10nTest.show(controller.get()))) {
            boolean section = item(row) instanceof PreferenceCategory;
            assertEquals(item(row) + " heading", section, node(row).isHeading());
            if (section) headings++;
        }
        assertTrue("no section on the screen", headings >= 5);
    }

    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void aSwitchRowSaysItIsASwitchAndWhetherItIsOn() {
        View row = rowFor(SettingsL10nTest.show(controller.get()), Settings.HIDE_ADS.key);
        AccessibilityNodeInfo info = node(row);
        assertEquals(Switch.class.getName(), String.valueOf(info.getClassName()));
        assertTrue(info.isCheckable());
        assertTrue("the switch is on by default", info.isChecked());
        assertTrue("a double tap would do nothing", info.getActionList().contains(
                AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
        assertTrue(info.isClickable());
        // The row's own delegate replaces the list's, so it has to keep what the list says of a
        // row: which item of the list it is.
        assertNotNull("the list's item info is gone", info.getCollectionItemInfo());
    }

    /**
     * The click event is what a screen reader answers a double tap with, so it has to carry the
     * role and the state the tap left, both ways.
     */
    @Test
    public void theClickEventCarriesTheStateTheTapLeft() {
        View row = rowFor(SettingsL10nTest.show(controller.get()), Settings.HIDE_ADS.key);
        SwitchPreference toggle = (SwitchPreference) item(row);
        for (boolean on : new boolean[]{true, false, true}) {
            toggle.setChecked(on);
            android.view.accessibility.AccessibilityEvent event = android.view.accessibility.AccessibilityEvent.obtain(
                    android.view.accessibility.AccessibilityEvent.TYPE_VIEW_CLICKED);
            row.onInitializeAccessibilityEvent(event);
            assertEquals(Switch.class.getName(), String.valueOf(event.getClassName()));
            assertEquals("the event says " + event.isChecked() + " for a switch that's " + on, on, event.isChecked());
        }
    }

    /** The recovery page's rows wrap too: its title is the longest line on it in most languages. */
    @Test
    public void theRecoveryPageWrapsItsWholeTitle() {
        HushTelegramPreferenceFragment.failNextInitialization = new IllegalStateException("injected");
        List<View> rows = rows(SettingsL10nTest.show(controller.get()));
        assertEquals("the recovery page has a message and two actions", 3, rows.size());
        for (View row : rows) {
            TextView title = row.findViewById(android.R.id.title);
            assertEquals(item(row).getKey() + " title lines", Integer.MAX_VALUE, title.getMaxLines());
        }
    }

    /** A double tap goes through the list as a tap does, and the row then reads the new state. */
    @Test
    public void aDoubleTapTurnsTheSwitchAndTheRowSaysSo() {
        SettingsDialog dialog = SettingsL10nTest.show(controller.get());
        View row = rowFor(dialog, Settings.HIDE_ADS.key);
        assertTrue(Settings.HIDE_ADS.get());

        assertTrue("the list took no click", row.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        ShadowLooper.idleMainLooper();
        assertFalse("the double tap didn't turn the switch off", Settings.HIDE_ADS.get());
        assertFalse(node(rowFor(dialog, Settings.HIDE_ADS.key)).isChecked());
    }

    @Test
    public void aRowATapActsOnIsAButtonAndARowOfTextIsNot() {
        SettingsDialog dialog = SettingsL10nTest.show(controller.get());
        for (View row : rows(dialog)) {
            Preference preference = item(row);
            AccessibilityNodeInfo info = node(row);
            if (preference instanceof PreferenceCategory || preference instanceof SwitchPreference) continue;
            if (preference.isSelectable()) {
                assertEquals(preference.getTitle() + " role", Button.class.getName(), String.valueOf(info.getClassName()));
                assertEquals(preference.getTitle() + " click availability", preference.isEnabled(),
                        info.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
                assertEquals(preference.getTitle() + " enabled state", preference.isEnabled(), info.isEnabled());
            } else {
                assertNotEquals(preference.getTitle() + " is only text", Button.class.getName(),
                        String.valueOf(info.getClassName()));
            }
        }
    }

    @Test
    public void thePausedCardIsAButtonThatTurnsHushTelegramBackOn() {
        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        SettingsDialog dialog = SettingsL10nTest.show(controller.get());
        View card = rows(dialog).get(0);
        assertEquals(Button.class.getName(), String.valueOf(node(card).getClassName()));
        assertTrue(card.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        ShadowLooper.idleMainLooper();
        assertTrue(String.valueOf(item(card).getSummary()), String.valueOf(item(card).getSummary())
                .contains("turns back on"));
    }

    /**
     * Android draws a row's title on one line and cuts its summary at ten lines, which at 200%
     * text cut the ends off the longest summaries on this screen.
     */
    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void everyRowWrapsItsWholeText() {
        for (View row : rows(SettingsL10nTest.show(controller.get()))) {
            TextView title = row.findViewById(android.R.id.title);
            assertNotNull(item(row) + " has no title view", title);
            assertEquals(item(row) + " title lines", Integer.MAX_VALUE, title.getMaxLines());
            TextView summary = row.findViewById(android.R.id.summary);
            if (summary != null && summary.getVisibility() == View.VISIBLE) {
                assertEquals(item(row) + " summary lines", Integer.MAX_VALUE, summary.getMaxLines());
            }
        }
    }

    @Test
    @Config(sdk = {28, 30, 33, 36})
    public void nothingToTapIsSmallerThan48dp() {
        SettingsDialog dialog = SettingsL10nTest.show(controller.get());
        int floor = dp(48);
        for (View row : rows(dialog)) {
            if (!node(row).isClickable()) continue;
            assertTrue(item(row).getTitle() + " is " + row.getMinimumHeight() + " px tall at least",
                    row.getMinimumHeight() >= floor);
        }
        android.widget.ImageButton back = SettingsL10nTest.backOf(dialog);
        assertTrue("the back arrow's width floor is " + back.getMinimumWidth(), back.getMinimumWidth() >= floor);
        assertTrue("the back arrow's height floor is " + back.getMinimumHeight(), back.getMinimumHeight() >= floor);
        back.measure(View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED),
                View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
        assertTrue("the back arrow measures " + back.getMeasuredWidth() + " by " + back.getMeasuredHeight(),
                back.getMeasuredWidth() >= floor && back.getMeasuredHeight() >= floor);
    }

    @Test
    public void theTitleIsAHeadingAndBackIsANamedButton() {
        SettingsDialog dialog = SettingsL10nTest.show(controller.get());
        android.widget.ImageButton back = SettingsL10nTest.backOf(dialog);
        AccessibilityNodeInfo info = node(back);
        assertEquals(Button.class.getName(), String.valueOf(info.getClassName()));
        assertEquals("Back", String.valueOf(info.getContentDescription()));
        assertTrue(info.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
        assertNotNull("the back icon is missing", back.getDrawable());

        View title = dialog.getView().findViewWithTag(SettingsDialog.PAGE_TITLE);
        assertEquals("HushTelegram", String.valueOf(((TextView) title).getText()));
        assertTrue("the screen's title isn't a heading", node(title).isHeading());
    }

    /**
     * Seen on the S22 with D-pad keys: DOWN went Ads, Chat list and on, stepping over the status
     * card and its Pause, and no row showed which one the keyboard was on. Focus inside a row
     * isn't the answer: moving on from a row's button, the list hands focus to the window's first
     * view. So the list keeps the keyboard, the card is a stop with a ring, and Enter presses Pause.
     */
    @Test
    public void aDpadStopsOnThePausedStatusCardWhereEnterPressesResume() throws Exception {
        app.hushtelegram.extension.shared.settings.BaseSettings.PAUSED.save(true);
        SettingsDialog dialog = SettingsL10nTest.show(controller.get());
        ListView list = dialog.getView().findViewById(android.R.id.list);
        leaveTouchMode(list);
        list.requestFocus();
        ShadowLooper.idleMainLooper();
        View root = list.getRootView();
        assertEquals("a view inside a row took the keyboard", list, root.findFocus());
        if (list.getSelectedItemPosition() != 0) press(root, android.view.KeyEvent.KEYCODE_DPAD_DOWN);
        assertEquals("the keyboard's first stop isn't the status card", 0, list.getSelectedItemPosition());
        View card = list.getSelectedView();
        assertTrue("the status card shows no ring", ringShows(card.getBackground()));

        press(root, android.view.KeyEvent.KEYCODE_DPAD_DOWN);
        assertEquals("DOWN left the list", list, root.findFocus());
        View row = list.getSelectedView();
        CharSequence title = ((Preference) list.getSelectedItem()).getTitle();
        assertTrue(title + " is selected, not a row under the card", list.getSelectedItemPosition() > 0);
        assertTrue(title + " shows no ring", ringShows(row.getBackground()));
        assertFalse("the card kept its ring", ringShows(card.getBackground()));

        press(root, android.view.KeyEvent.KEYCODE_DPAD_UP);
        assertEquals(0, list.getSelectedItemPosition());
        assertTrue(app.hushtelegram.extension.shared.settings.BaseSettings.PAUSED.savedValue());
        press(root, android.view.KeyEvent.KEYCODE_ENTER);
        assertFalse("Enter on the card didn't press Resume",
                app.hushtelegram.extension.shared.settings.BaseSettings.PAUSED.savedValue());
        assertEquals("Enter moved the keyboard out of the list", list, root.findFocus());
    }

    /**
     * Not paused, no card is drawn, so the keyboard's first stop is the first section heading with
     * its ring, Enter opens it in place, and the toolbar's Pause is a real focusable button.
     */
    @Test
    public void aDpadStopsOnTheFirstHeadingWhereEnterOpensItAndPauseSitsInTheToolbar() throws Exception {
        SettingsDialog dialog = SettingsL10nTest.show(controller.get());
        ListView list = dialog.getView().findViewById(android.R.id.list);
        leaveTouchMode(list);
        list.requestFocus();
        ShadowLooper.idleMainLooper();
        View root = list.getRootView();
        if (list.getSelectedItemPosition() != 0) press(root, android.view.KeyEvent.KEYCODE_DPAD_DOWN);
        assertEquals(0, list.getSelectedItemPosition());
        Preference first = (Preference) list.getSelectedItem();
        assertTrue(first.getKey(), first.getKey().startsWith("section_"));
        assertTrue("the heading shows no ring", ringShows(list.getSelectedView().getBackground()));
        HushTelegramPreferenceFragment page = (HushTelegramPreferenceFragment) dialog.getChildFragmentManager().findFragmentById(SettingsDialog.CONTAINER_ID);
        String id = first.getKey().substring("section_".length());
        assertFalse(page.navigation.isExpanded(id));
        press(root, android.view.KeyEvent.KEYCODE_ENTER);
        assertTrue("Enter didn't open the heading", page.navigation.isExpanded(id));
        assertEquals("Enter moved the keyboard out of the list", list, root.findFocus());
        assertEquals(View.VISIBLE, dialog.pauseAction.getVisibility());
        assertTrue(dialog.pauseAction.isFocusable());
    }

    /**
     * The opened screen holds focus itself so the search box doesn't raise the keyboard, and keeps
     * it when a keyboard takes over. On the S22 every DOWN from there went nowhere, since nothing
     * lies below a view as tall as the screen. The first DOWN now lands on the status card.
     */
    @Test
    public void theFirstDownFromTheOpenedScreenStopsOnTheStatusCard() throws Exception {
        SettingsDialog dialog = SettingsL10nTest.show(controller.get());
        View screen = dialog.getView();
        ListView list = screen.findViewById(android.R.id.list);
        screen.requestFocus();
        leaveTouchMode(list);
        ShadowLooper.idleMainLooper();
        View root = list.getRootView();
        assertEquals("leaving touch mode moved focus off the screen", screen, root.findFocus());

        assertTrue("the screen didn't take DOWN", press(root, android.view.KeyEvent.KEYCODE_DPAD_DOWN));
        assertEquals("DOWN didn't reach the list", list, root.findFocus());
        assertEquals("the keyboard's first stop isn't the status card", 0, list.getSelectedItemPosition());
        assertTrue("the status card shows no ring", ringShows(list.getSelectedView().getBackground()));
        assertFalse("a key that doesn't move focus was taken", SettingsDialog.movesFocus(android.view.KeyEvent.KEYCODE_ENTER));
    }

    /** A row a finger is on looks as it always did, and the keyboard's row has the accent ring. */
    @Test
    public void onlyTheKeyboardsRowWearsTheRing() {
        View row = new View(controller.get());
        SwitchPreference preference = new SwitchPreference(controller.get());
        ScreenColors.DEFAULT.paintSurface(row, preference, true, true);
        android.graphics.drawable.Drawable background = row.getBackground();
        background.setState(new int[]{android.R.attr.state_pressed, android.R.attr.state_enabled});
        assertFalse("a finger's press shows the ring", ringShows(background));
        background.setState(new int[]{android.R.attr.state_enabled});
        assertFalse(ringShows(background));
        background.setState(new int[]{android.R.attr.state_selected, android.R.attr.state_enabled});
        assertTrue(ringShows(background));
    }

    /** Whether the accent-stroked ring layer in a row's background is the one showing. */
    private static boolean ringShows(android.graphics.drawable.Drawable background) {
        if (background instanceof android.graphics.drawable.LayerDrawable) {
            android.graphics.drawable.LayerDrawable layers = (android.graphics.drawable.LayerDrawable) background;
            for (int i = 0; i < layers.getNumberOfLayers(); i++) {
                if (ringShows(layers.getDrawable(i))) return true;
            }
            return false;
        }
        if (background instanceof android.graphics.drawable.StateListDrawable) {
            android.graphics.drawable.Drawable current = background.getCurrent();
            return current instanceof android.graphics.drawable.InsetDrawable
                    && ((android.graphics.drawable.InsetDrawable) current).getDrawable()
                            instanceof android.graphics.drawable.GradientDrawable;
        }
        return false;
    }

    /** A key press as the window delivers it, with its focus move when no view takes the key. */
    private static boolean press(View root, int key) {
        android.view.KeyEvent down = new android.view.KeyEvent(android.view.KeyEvent.ACTION_DOWN, key);
        boolean handled = root.dispatchKeyEvent(down);
        root.dispatchKeyEvent(new android.view.KeyEvent(android.view.KeyEvent.ACTION_UP, key));
        if (!handled) {
            int direction = key == android.view.KeyEvent.KEYCODE_DPAD_UP ? View.FOCUS_UP : View.FOCUS_DOWN;
            View focused = root.findFocus();
            View next = focused == null ? null : focused.focusSearch(direction);
            if (next != null) next.requestFocus(direction);
        }
        ShadowLooper.idleMainLooper();
        return handled;
    }

    /** What a key press does first in a real window: leaves touch mode. */
    private static void leaveTouchMode(View view) throws Exception {
        Object viewRoot = View.class.getMethod("getViewRootImpl").invoke(view);
        java.lang.reflect.Method local = viewRoot.getClass().getDeclaredMethod("ensureTouchModeLocally", boolean.class);
        local.setAccessible(true);
        local.invoke(viewRoot, false);
        assertFalse(view.isInTouchMode());
    }

    @Test
    public void aReportChoiceIsAButtonThatADoubleTapPicks() {
        Activity activity = controller.get();
        ListView list = new ListView(activity);
        list.setAdapter(new ChoiceCards(ScreenColors.DEFAULT, new CharSequence[]{"Copy quick report", "Save full report"},
                new CharSequence[]{"Copy a short report.", "Save the full report."}));
        int[] picked = {-1};
        list.setOnItemClickListener((parent, view, position, id) -> picked[0] = position);
        activity.setContentView(list);
        list.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(4000, View.MeasureSpec.EXACTLY));
        list.layout(0, 0, 1080, 4000);

        View save = list.getChildAt(1);
        AccessibilityNodeInfo info = node(save);
        assertEquals(Button.class.getName(), String.valueOf(info.getClassName()));
        assertTrue(info.getActionList().contains(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK));
        assertTrue(save.performAccessibilityAction(AccessibilityNodeInfo.ACTION_CLICK, null));
        assertEquals(1, picked[0]);
    }

    @Test
    public void aKeyboardOnAReportChoiceSeesARingAndAFingerDoesNot() {
        android.graphics.drawable.Drawable selector = ChoiceCards.Card.focusRing(controller.get(), ScreenColors.DEFAULT);
        selector.setState(new int[]{android.R.attr.state_focused});
        assertTrue(selector.getCurrent() instanceof android.graphics.drawable.InsetDrawable);
        selector.setState(new int[]{android.R.attr.state_pressed});
        assertTrue(selector.getCurrent() instanceof android.graphics.drawable.ColorDrawable);
        assertEquals(android.graphics.Color.TRANSPARENT,
                ((android.graphics.drawable.ColorDrawable) selector.getCurrent()).getColor());
        // A dialog's list keeps focus in touch mode, so a finger's tap reads pressed and focused.
        selector.setState(new int[]{android.R.attr.state_focused, android.R.attr.state_pressed});
        assertTrue(selector.getCurrent() instanceof android.graphics.drawable.ColorDrawable);
    }

    @Test
    @Config(qualifiers = "ar-rXB-ldrtl")
    public void inARightToLeftLanguageTheWayBackPointsRight() {
        android.widget.ImageButton back = SettingsL10nTest.backOf(SettingsL10nTest.show(controller.get()));
        android.graphics.drawable.Drawable arrow = back.getDrawable();
        assertNotNull(arrow);
        assertTrue("the original Material arrow must mirror", arrow.isAutoMirrored());
        assertEquals(View.LAYOUT_DIRECTION_RTL, arrow.getLayoutDirection());
    }

    /** Every row the list draws, laid out tall enough that none is left off. */
    private static List<View> rows(SettingsDialog dialog) {
        ListView list = dialog.getView().findViewById(android.R.id.list);
        assertNotNull("no list in the dialog", list);
        HushTelegramPreferenceFragment page = (HushTelegramPreferenceFragment) dialog.getChildFragmentManager()
                .findFragmentById(SettingsDialog.CONTAINER_ID);
        // Verify every preference row independently of the category shell.
        list.setAdapter(page.getPreferenceScreen().getRootAdapter());
        list.setOnItemClickListener(page.getPreferenceScreen());
        list.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(40000, View.MeasureSpec.EXACTLY));
        list.layout(0, 0, 1080, 40000);
        List<View> rows = new ArrayList<>();
        for (int index = 0; index < list.getChildCount(); index++) {
            View row = list.getChildAt(index);
            row.setTag(list.getItemAtPosition(index));
            rows.add(row);
        }
        assertEquals("the list left rows off", list.getAdapter().getCount(), rows.size());
        return rows;
    }

    private static View rowFor(SettingsDialog dialog, String key) {
        for (View row : rows(dialog)) {
            if (key.equals(item(row).getKey())) return row;
        }
        throw new AssertionError("no row keyed " + key);
    }

    private static Preference item(View row) {
        return (Preference) row.getTag();
    }

    private static AccessibilityNodeInfo node(View view) {
        return view.createAccessibilityNodeInfo();
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                controller.get().getResources().getDisplayMetrics()));
    }
}
