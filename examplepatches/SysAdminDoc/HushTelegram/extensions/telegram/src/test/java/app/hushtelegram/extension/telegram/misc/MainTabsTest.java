/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import android.app.Activity;
import android.view.View;
import android.widget.FrameLayout;
import java.util.ArrayList;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.android.controller.ActivityController;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class MainTabsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_CONTACTS_TAB);
        Settings.HIDE_CONTACTS_TAB.resetToDefault();
        SettingReadsForTests.mend(Settings.COMPACT_TAB_BAR);
        Settings.COMPACT_TAB_BAR.resetToDefault();
        SettingReadsForTests.mend(Settings.HIDE_NEW_MESSAGE);
        Settings.HIDE_NEW_MESSAGE.resetToDefault();
        MainTabs.clearNewMessageButtonsForTests();
        HookStatus.clear();
    }

    private static String report() { return String.join("\n", HookStatus.report()); }

    @Test public void offByDefaultEverySwipeGoesAsTelegramDecides() {
        assertFalse(Settings.HIDE_CONTACTS_TAB.get());
        assertFalse(MainTabs.blocksSwipe(0, true));
        assertFalse(MainTabs.blocksSwipe(2, false));
        MainTabs.tabsShown(new Object(), false);
        assertTrue(report().contains(FamilyNames.HIDE_CONTACTS_TAB));
        assertFalse(report().contains("Contacts tab hidden"));
    }

    @Test public void onOnlyASwipeThatLandsOnContactsIsStopped() {
        Settings.HIDE_CONTACTS_TAB.save(true);
        // From Chats on, and from the page after Contacts back.
        assertTrue(MainTabs.blocksSwipe(0, true));
        assertTrue(MainTabs.blocksSwipe(2, false));
        assertTrue(report().contains("swipe to Contacts stopped"));
        // Every other swipe, including off the Contacts page itself, goes on.
        assertFalse(MainTabs.blocksSwipe(1, true));
        assertFalse(MainTabs.blocksSwipe(1, false));
        assertFalse(MainTabs.blocksSwipe(0, false));
        assertFalse(MainTabs.blocksSwipe(2, true));
        assertFalse(MainTabs.blocksSwipe(3, false));
    }

    @Test public void theScreenLeavesContactsOnlyWhenItShowsThatPage() {
        assertEquals(1, MainTabs.CONTACTS);
        assertTrue(MainTabs.landsOnContacts(0, true));
        assertTrue(MainTabs.landsOnContacts(2, false));
        assertFalse(MainTabs.landsOnContacts(1, true));
        assertTrue(MainTabs.leavesContacts(1));
        assertTrue(report().contains("moved from Contacts to Chats"));
        assertFalse(MainTabs.leavesContacts(0));
        assertFalse(MainTabs.leavesContacts(-1));
        assertFalse(MainTabs.leavesContacts(2));
    }

    @Test public void anUnbuiltBarOrANullScreenIsLeftAlone() {
        Settings.HIDE_CONTACTS_TAB.save(true);
        // The unpatched stub finds no bar, the way the first call before the bar is built does.
        MainTabs.tabsShown(new Object(), false);
        MainTabs.tabsShown(new Object(), true);
        MainTabs.tabsShown(null, true);
        assertFalse(report().contains("Contacts tab hidden"));
        assertFalse(report().contains("moved from Contacts to Chats"));
        assertEquals(-1, MainTabs.page(new Object()));
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheTab() {
        Settings.HIDE_CONTACTS_TAB.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), MainTabs.on());
            assertFalse(reason.name(), MainTabs.blocksSwipe(0, true));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(MainTabs.blocksSwipe(0, true)));
        SettingReadsForTests.breakReads(Settings.HIDE_CONTACTS_TAB);
        assertFalse(MainTabs.on());
        assertFalse(MainTabs.blocksSwipe(0, true));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_CONTACTS_TAB).isEmpty());
    }

    /** Telegram's own sizes, the ones the patched code hands in. */
    private static void assertStockBar(String why) {
        assertEquals(why, 12f, MainTabs.barPadding(12f), 0f);
        assertEquals(why, 28f, MainTabs.barCorner(28f), 0f);
        assertEquals(why, 72, MainTabs.barHeight(72));
        assertEquals(why, 320f, MainTabs.barMinWidth(320f), 0f);
    }

    @Test public void offByDefaultTheBarKeepsTelegramsSizes() {
        assertFalse(Settings.COMPACT_TAB_BAR.get());
        assertStockBar("off");
        assertTrue(report().contains(FamilyNames.HIDE_CONTACTS_TAB));
        assertFalse(report().contains("bar built compact"));
    }

    @Test public void compactTrimsTheBarButNotItsTabs() {
        Settings.COMPACT_TAB_BAR.save(true);
        assertEquals(8f, MainTabs.barPadding(12f), 0f);
        assertEquals(24f, MainTabs.barCorner(28f), 0f);
        assertEquals(64, MainTabs.barHeight(72));
        assertEquals(192f, MainTabs.barMinWidth(320f), 0f);
        assertTrue(report().contains("bar built compact"));
        // The tabs get the bar's height less its padding: 48 dp either way, Android's touch target.
        assertEquals(72 - 2 * 12, MainTabs.barHeight(72) - 2 * (int) MainTabs.barPadding(12f));
        assertEquals(48, MainTabs.COMPACT_HEIGHT - 2 * (int) MainTabs.COMPACT_PADDING);
        // Four tabs stretched to the least width get 48 dp each, and the padding stays outside the
        // glass background's 7.67 dp inset, so the tabs sit inside it.
        assertEquals(4 * 48f, MainTabs.COMPACT_MIN_WIDTH, 0f);
        assertTrue(MainTabs.COMPACT_PADDING > 8f - 0.334f);
        // The corner is half the glass's height, the way Telegram's 28 dp is.
        assertEquals((MainTabs.COMPACT_HEIGHT - 2 * (8f - 0.334f)) / 2f, MainTabs.COMPACT_CORNER, 0.5f);
        assertEquals((72 - 2 * (8f - 0.334f)) / 2f, 28f, 0.5f);
    }

    @Test public void theTwoSwitchesWorkApart() {
        Settings.COMPACT_TAB_BAR.save(true);
        assertFalse(MainTabs.on());
        assertFalse(MainTabs.blocksSwipe(0, true));
        assertEquals(64, MainTabs.barHeight(72));

        Settings.COMPACT_TAB_BAR.save(false);
        Settings.HIDE_CONTACTS_TAB.save(true);
        assertTrue(MainTabs.blocksSwipe(0, true));
        assertStockBar("Contacts hidden, bar not compact");
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTelegramsSizes() {
        Settings.COMPACT_TAB_BAR.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertStockBar(reason.name());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertStockBar("before the settings are ready"));
        assertEquals(64, MainTabs.barHeight(72));
        SettingReadsForTests.breakReads(Settings.COMPACT_TAB_BAR);
        assertStockBar("unreadable");
        assertFalse(HookStatus.missing(FamilyNames.HIDE_CONTACTS_TAB).isEmpty());
    }

    private static boolean hidden(View button) {
        MainTabs.newMessageButton(button);
        return button.getVisibility() == View.GONE;
    }

    @Test public void theNewMessageButtonStaysUnlessTheSwitchIsOn() {
        View button = new View(RuntimeEnvironment.getApplication());
        assertFalse(Settings.HIDE_NEW_MESSAGE.get());
        assertFalse(hidden(button));
        assertEquals(View.VISIBLE, button.getVisibility());
        assertFalse(report().contains("new message button hidden"));

        Settings.HIDE_NEW_MESSAGE.save(true);
        assertTrue(hidden(button));
        assertTrue(report().contains("new message button hidden"));
        // Hiding it takes no part in the Contacts tab or the bar.
        assertFalse(MainTabs.on());
        assertEquals(72, MainTabs.barHeight(72));
    }

    @Test public void anythingButAViewIsLeftAlone() {
        Settings.HIDE_NEW_MESSAGE.save(true);
        MainTabs.newMessageButton(null);
        MainTabs.newMessageButton("not a view");
        MainTabs.newMessageDone(null);
        MainTabs.newMessageVisibility("not a view", View.VISIBLE);
        assertTrue(HookStatus.missing(FamilyNames.HIDE_CONTACTS_TAB).isEmpty());
    }

    @Test public void animationFramesCannotReshowComposeOrHideOtherFloatingViews() {
        Settings.HIDE_NEW_MESSAGE.save(true);
        View compose = new View(RuntimeEnvironment.getApplication());
        View story = new View(RuntimeEnvironment.getApplication());
        View done = new View(RuntimeEnvironment.getApplication());
        View progress = new View(RuntimeEnvironment.getApplication());
        View contacts = new View(RuntimeEnvironment.getApplication());
        MainTabs.newMessageButton(compose);
        MainTabs.newMessageDone(done);
        for (int visibility : new int[] {View.GONE, View.VISIBLE, View.VISIBLE, View.GONE, View.VISIBLE}) {
            // The native animator decides visibility again after the compose icon was assigned.
            MainTabs.newMessageVisibility(compose, visibility);
            assertEquals(View.GONE, compose.getVisibility());
            for (View other : new View[] {story, done, progress, contacts}) {
                MainTabs.newMessageVisibility(other, visibility);
                assertEquals(visibility, other.getVisibility());
            }
        }
    }

    @Test public void doneRoleRestoresTheLatestNativeVisibilityAndStopsFilteringThatInstance() {
        Settings.HIDE_NEW_MESSAGE.save(true);
        View button = new View(RuntimeEnvironment.getApplication());
        MainTabs.newMessageButton(button);
        MainTabs.newMessageVisibility(button, View.VISIBLE);
        // Reassigning the compose icon must not mistake our GONE for Telegram's requested state.
        MainTabs.newMessageButton(button);
        MainTabs.newMessageDone(button);
        assertEquals(View.VISIBLE, button.getVisibility());
        MainTabs.newMessageVisibility(button, View.VISIBLE);
        assertEquals(View.VISIBLE, button.getVisibility());

        MainTabs.newMessageButton(button);
        MainTabs.newMessageVisibility(button, View.GONE);
        MainTabs.newMessageDone(button);
        assertEquals("a natively hidden Done button stays hidden", View.GONE, button.getVisibility());
    }

    @Test public void hiddenComposeIsExcludedFromNativeTouchAndAccessibilityChildren() {
        ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup();
        try {
            Activity activity = controller.get();
            FrameLayout parent = new FrameLayout(activity);
            View compose = new View(activity);
            compose.setClickable(true);
            compose.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
            parent.addView(compose, new FrameLayout.LayoutParams(64, 64));
            activity.setContentView(parent);
            controller.visible();
            parent.measure(View.MeasureSpec.makeMeasureSpec(320, View.MeasureSpec.EXACTLY),
                    View.MeasureSpec.makeMeasureSpec(480, View.MeasureSpec.EXACTLY));
            parent.layout(0, 0, 320, 480);
            assertTrue(compose.isAttachedToWindow());
            Settings.HIDE_NEW_MESSAGE.save(true);
            MainTabs.newMessageButton(compose);
            MainTabs.newMessageVisibility(compose, View.VISIBLE);
            assertFalse(parent.getTouchables().contains(compose));
            ArrayList<View> accessible = new ArrayList<>();
            parent.addChildrenForAccessibility(accessible);
            assertFalse(accessible.contains(compose));

            Settings.HIDE_NEW_MESSAGE.save(false);
            MainTabs.newMessageVisibility(compose, View.VISIBLE);
            assertTrue(parent.getTouchables().contains(compose));
            parent.addChildrenForAccessibility(accessible);
            assertTrue(accessible.contains(compose));
        } finally {
            controller.pause().stop().destroy();
        }
    }

    @Test public void offPauseEarlyContextAndReadFailurePassThroughNativeVisibility() {
        View button = new View(RuntimeEnvironment.getApplication());
        Settings.HIDE_NEW_MESSAGE.save(true);
        MainTabs.newMessageButton(button);
        assertEquals(View.GONE, button.getVisibility());
        Settings.HIDE_NEW_MESSAGE.save(false);
        MainTabs.newMessageVisibility(button, View.VISIBLE);
        assertEquals(View.VISIBLE, button.getVisibility());
        MainTabs.newMessageVisibility(button, View.INVISIBLE);
        assertEquals(View.INVISIBLE, button.getVisibility());
        Settings.HIDE_NEW_MESSAGE.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            MainTabs.newMessageVisibility(button, View.VISIBLE);
            assertEquals(reason.name(), View.VISIBLE, button.getVisibility());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            MainTabs.newMessageVisibility(button, View.VISIBLE);
            assertEquals(View.VISIBLE, button.getVisibility());
        });
        SettingReadsForTests.breakReads(Settings.HIDE_NEW_MESSAGE);
        MainTabs.newMessageVisibility(button, View.VISIBLE);
        assertEquals(View.VISIBLE, button.getVisibility());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_CONTACTS_TAB).isEmpty());
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSwitchKeepsTheButton() {
        Settings.HIDE_NEW_MESSAGE.save(true);
        View button = new View(RuntimeEnvironment.getApplication());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), hidden(button));
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertFalse(hidden(button)));
        SettingReadsForTests.breakReads(Settings.HIDE_NEW_MESSAGE);
        assertFalse(hidden(button));
        assertFalse(HookStatus.missing(FamilyNames.HIDE_CONTACTS_TAB).isEmpty());
    }
}
