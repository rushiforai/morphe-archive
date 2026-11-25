/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.PatchFamilyForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BottomFolderTabsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int SCREEN = 2000;
    private static final int NAVIGATION = 48;
    private static final int BAR = 72;
    private static final int STRIP = 50;
    private static final int LAID_OUT_AT = 200;
    private static final float STOCK = 13f;

    private static class Fake implements BottomFolderTabs.Telegram {
        View strip;
        int barRoom = BAR;
        int places;
        int composes;
        boolean broken;

        @Override public Object strip(Object list) {
            if (broken) throw new IllegalStateException("Telegram changed");
            return strip;
        }

        @Override public int navHeight(Object list) { return NAVIGATION; }

        @Override public int barRoom(Object list) {
            if (broken) throw new IllegalStateException("Telegram changed");
            return barRoom;
        }

        @Override public void updatePlace(Object list) { places++; }

        @Override public void updateCompose(Object list) { composes++; }
    }

    /** A view that counts the layouts asked of it. */
    private static class Counting extends FrameLayout {
        int layouts;

        Counting(Context context) { super(context); }

        @Override public void requestLayout() {
            layouts++;
            super.requestLayout();
        }
    }

    private final Object list = new Object();
    private BottomFolderTabs.Telegram stockTelegram;
    private Fake fake;
    private Counting parent;
    private Counting page;
    private Counting listView;
    private View strip;

    @Before public void setUp() {
        stockTelegram = BottomFolderTabs.telegram;
        Context context = RuntimeEnvironment.getApplication();
        // One dp is one pixel here, so the numbers read as dp.
        assertEquals(1f, context.getResources().getDisplayMetrics().density, 0f);
        parent = new Counting(context);
        page = new Counting(context);
        listView = new Counting(context);
        page.addView(listView);
        parent.addView(page);
        strip = new View(context);
        parent.addView(strip, new FrameLayout.LayoutParams(1000, STRIP));
        parent.layout(0, 0, 1000, SCREEN);
        strip.measure(View.MeasureSpec.makeMeasureSpec(1000, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(STRIP, View.MeasureSpec.EXACTLY));
        strip.layout(0, LAID_OUT_AT, 1000, LAID_OUT_AT + STRIP);
        fake = new Fake();
        fake.strip = strip;
        BottomFolderTabs.telegram = fake;
        PatchFamilyForTests.inBuild(PatchFamily.HIDE_FOLDER_COUNTERS);
        PatchFamilyForTests.installed(PatchFamily.Capability.BOTTOM_TABS);
        Settings.FOLDER_TABS_BOTTOM.save(true);
        HookStatus.clear();
    }

    @After public void tearDown() {
        BottomFolderTabs.telegram = stockTelegram;
        PatchFamilyForTests.reset();
        PatchFamilyForTests.resetCapabilities();
        Settings.FOLDER_TABS_BOTTOM.resetToDefault();
        Settings.COMPACT_TAB_BAR.resetToDefault();
        HookStatus.clear();
    }

    private float aboveBar() {
        return SCREEN - NAVIGATION - BAR + BottomFolderTabs.OVERLAP_DP - STRIP - LAID_OUT_AT;
    }

    private void assertAllStock() {
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(STOCK, strip.getTranslationY(), 0f);
        assertEquals(0.75f, BottomFolderTabs.headerShare(list, 0.75f), 0f);
        assertEquals(0.75f, BottomFolderTabs.topShare(list, 0.75f), 0f);
        assertEquals(120, BottomFolderTabs.bottomPadding(list, 120));
        assertEquals(4f, BottomFolderTabs.composeLift(list, 4f), 0f);
        assertEquals(900, BottomFolderTabs.captureTop(list, 900));
    }

    @Test public void theSwitchStartsOff() {
        Settings.FOLDER_TABS_BOTTOM.resetToDefault();
        assertFalse(Settings.FOLDER_TABS_BOTTOM.get());
        assertFalse(Settings.FOLDER_TABS_BOTTOM.rebootApp);
        assertAllStock();
    }

    @Test public void aBuildWithoutTheMoveKeepsTelegramsPlaces() {
        PatchFamilyForTests.installed();
        assertFalse(BottomFolderTabs.available());
        assertAllStock();
    }

    @Test public void aListWithoutTheBottomBarKeepsItsTabsOnTop() {
        fake.barRoom = 0;
        assertAllStock();
    }

    @Test public void theStripSitsRightAboveTheBar() {
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(aboveBar(), strip.getTranslationY(), 0f);
        // Its bottom edge tucks under the bar's top edge by the overlap, wherever Telegram laid it out.
        assertEquals(SCREEN - NAVIGATION - BAR + BottomFolderTabs.OVERLAP_DP, strip.getTop() + strip.getTranslationY() + STRIP, 0f);
        assertTrue(String.join(" ", HookStatus.report()).contains(BottomFolderTabs.MOVED));
    }

    @Test public void theCompactBarLetsTheStripSitLower() {
        PatchFamilyForTests.installed(PatchFamily.Capability.BOTTOM_TABS, PatchFamily.Capability.COMPACT_TAB_BAR);
        Settings.COMPACT_TAB_BAR.save(true);
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(aboveBar() + BottomFolderTabs.COMPACT_DP, strip.getTranslationY(), 0f);
        assertEquals(8, BottomFolderTabs.COMPACT_DP);
    }

    @Test public void theCompactSettingAloneChangesNothingInABuildWithoutIt() {
        Settings.COMPACT_TAB_BAR.save(true);
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(aboveBar(), strip.getTranslationY(), 0f);
    }

    @Test public void beforeTheFirstLayoutTheStripStaysPut() {
        parent.layout(0, 0, 0, 0);
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(STOCK, strip.getTranslationY(), 0f);
    }

    @Test public void theTopGapAndTheHeaderShareGo() {
        assertEquals(0f, BottomFolderTabs.topShare(list, 1f), 0f);
        assertEquals(0f, BottomFolderTabs.headerShare(list, 1f), 0f);
    }

    @Test public void theListAndTheComposeButtonMakeRoom() {
        int room = STRIP - BottomFolderTabs.OVERLAP_DP;
        assertEquals(120 + room, BottomFolderTabs.bottomPadding(list, 120));
        assertEquals(room, BottomFolderTabs.composeLift(list, 0f), 0f);
        // A bulletin that already lifts the button further wins.
        assertEquals(room + 30f, BottomFolderTabs.composeLift(list, room + 30f), 0f);
        assertEquals(900 - STRIP - BottomFolderTabs.CAPTURE_DP, BottomFolderTabs.captureTop(list, 900));
    }

    @Test public void theRoomFollowsTheStripsFade() {
        int room = STRIP - BottomFolderTabs.OVERLAP_DP;
        strip.setAlpha(0.5f);
        assertEquals(120 + Math.round(room * 0.5f), BottomFolderTabs.bottomPadding(list, 120));
        assertEquals(room * 0.5f, BottomFolderTabs.composeLift(list, 0f), 0f);
    }

    @Test public void aHiddenStripTakesNoRoom() {
        // No folders, or search open: Telegram fades the strip out and sets it GONE.
        strip.setVisibility(View.GONE);
        assertEquals(120, BottomFolderTabs.bottomPadding(list, 120));
        assertEquals(0f, BottomFolderTabs.composeLift(list, 0f), 0f);
        assertEquals(900, BottomFolderTabs.captureTop(list, 900));
    }

    @Test public void aListWithoutAStripTakesNoRoom() {
        fake.strip = null;
        assertEquals(120, BottomFolderTabs.bottomPadding(list, 120));
        assertEquals(0f, BottomFolderTabs.composeLift(list, 0f), 0f);
        assertEquals(900, BottomFolderTabs.captureTop(list, 900));
    }

    @Test public void theComposeButtonMovesOnlyWhenItsLiftChanges() {
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(1, fake.composes);
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(1, fake.composes);
        strip.setAlpha(0.5f);
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(2, fake.composes);
    }

    @Test public void flippingTheSwitchPutsEverythingBack() {
        BottomFolderTabs.place(list, strip, STOCK);
        Settings.FOLDER_TABS_BOTTOM.save(false);
        fake.composes = 0;
        parent.layouts = 0;
        page.layouts = 0;
        listView.layouts = 0;
        BottomFolderTabs.refreshAll();
        assertTrue(fake.places >= 1);
        assertTrue(fake.composes >= 1);
        // The list has to measure again for its padding, and it sits two levels under the strip's parent.
        assertTrue(parent.layouts >= 1);
        assertTrue(page.layouts >= 1);
        assertTrue(listView.layouts >= 1);
        assertAllStock();
    }

    @Test public void aChangedTelegramLeavesItsOwnAnswers() {
        fake.broken = true;
        BottomFolderTabs.place(list, strip, STOCK);
        assertEquals(STOCK, strip.getTranslationY(), 0f);
        assertEquals(0.75f, BottomFolderTabs.headerShare(list, 0.75f), 0f);
        assertEquals(0.75f, BottomFolderTabs.topShare(list, 0.75f), 0f);
        assertEquals(120, BottomFolderTabs.bottomPadding(list, 120));
        assertEquals(4f, BottomFolderTabs.composeLift(list, 4f), 0f);
        assertEquals(900, BottomFolderTabs.captureTop(list, 900));
    }

    @Test public void theStubsAnswerNothingBeforeThePatchFillsThemIn() {
        assertEquals(null, BottomFolderTabs.tabStrip(list));
        assertEquals(0, BottomFolderTabs.navHeightOf(list));
        assertEquals(0, BottomFolderTabs.barRoomOf(list));
    }
}
