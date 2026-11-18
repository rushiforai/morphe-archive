/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.robolectric.Shadows.shadowOf;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.os.Looper;
import android.view.View;
import android.widget.LinearLayout;

import java.util.EnumSet;
import java.util.HashMap;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.PatchFamily;
import app.hushpinterest.extension.pinterest.settings.PatchFamilyForTests;
import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class RelatedPinsFoldTest {
    private static final int COLUMN_ID = 0x7f0b7001;

    /** Presenters are remembered by pin, so every test gets pins of its own. */
    private static long nextPin = 7_100_000_000L;

    @Rule public final SettingsContextRule context = new SettingsContextRule();

    /** The related pins list as far as the arrow can tell. */
    public static final class Grid {
        int loads, clears;

        public void loadData() {
            loads++;
        }

        public void clear() {
            clears++;
        }
    }

    public static final class Presenter {
        @SuppressWarnings("unused") private final String pinUid;
        final Grid grid = new Grid();

        Presenter(String pinUid) {
            this.pinUid = pinUid;
        }

        public Grid getRelatedPinsPagedList() {
            return grid;
        }
    }

    public static final class Module extends LinearLayout {
        private final Object pin;

        Module(Context context, Object pin) {
            super(context);
            this.pin = pin;
        }

        public Object getPin() {
            return pin;
        }
    }

    private LinearLayout column;

    @Before public void page() {
        PatchFamilyForTests.inBuild(EnumSet.of(PatchFamily.FOLD_RELATED_PINS));
        RelatedPinsFold.choice().resetToDefault();
        column = newColumn();
    }

    @After public void restore() {
        PauseForTests.resume();
        PatchFamilyForTests.inBuild(null);
        Settings.FOLD_RELATED_PINS.resetToDefault();
        Settings.HIDE_RELATED_PINS.resetToDefault();
        RelatedPinsFold.choice().resetToDefault();
        HookStatus.clear();
    }

    private static LinearLayout newColumn() {
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        Resources base = activity.getResources();
        Resources named = new Resources(base.getAssets(), base.getDisplayMetrics(), base.getConfiguration()) {
            @Override public int getIdentifier(String name, String type, String owner) {
                return "pin_closeup_view".equals(name) && "id".equals(type) ? COLUMN_ID : 0;
            }
        };
        Context pinterest = new ContextWrapper(activity) {
            @Override public Resources getResources() { return named; }
        };
        LinearLayout column = new LinearLayout(pinterest);
        column.setOrientation(LinearLayout.VERTICAL);
        column.setId(COLUMN_ID);
        activity.setContentView(column);
        return column;
    }

    private static String newPinId() {
        return Long.toString(nextPin++);
    }

    private static Map<String, Object> pin(String id) {
        Map<String, Object> pin = new HashMap<>();
        pin.put("id", id);
        pin.put("images", new HashMap<String, Object>());
        pin.put("videos", null);
        return pin;
    }

    /** A section taking its pin the way the patched updatePin hands it over. */
    private static Module section(LinearLayout column, String id) {
        Module module = new Module(column.getContext(), pin(id));
        column.addView(module);
        assertEquals("the section's own answer passes through", 1, RelatedPinsFold.module(module, 1));
        idle();
        return module;
    }

    private static void idle() {
        shadowOf(Looper.getMainLooper()).idle();
    }

    private static View arrow(LinearLayout column) {
        return column.findViewWithTag(RelatedPinsFold.ARROW_TAG);
    }

    private Presenter open(String id) {
        Presenter presenter = new Presenter(id);
        RelatedPinsFold.bind(presenter);
        section(column, id);
        return presenter;
    }

    @Test public void offNothingIsAddedAndTheListLoads() {
        Presenter presenter = open(newPinId());
        assertNull(arrow(column));
        assertFalse(RelatedPinsFold.folded());
        assertFalse(UiHooks.relatedPinsLoading());
        assertEquals(0, presenter.grid.loads + presenter.grid.clears);
    }

    @Test public void onTheListStaysFoldedUntilTheArrowOpensItAndAgainFoldsIt() {
        Settings.FOLD_RELATED_PINS.save(true);
        Presenter presenter = open(newPinId());
        View arrow = arrow(column);
        assertNotNull(arrow);
        assertSame("under the last section", arrow, column.getChildAt(column.getChildCount() - 1));
        assertTrue(RelatedPinsFold.folded());
        assertTrue("the page doesn't wait for a grid that isn't coming", UiHooks.relatedPinsLoading());
        assertEquals("nothing loaded while folded", 0, presenter.grid.loads);

        arrow.performClick();
        assertFalse(RelatedPinsFold.folded());
        assertFalse(UiHooks.relatedPinsLoading());
        assertEquals(1, presenter.grid.loads);
        assertEquals(0, presenter.grid.clears);

        arrow.performClick();
        assertTrue(RelatedPinsFold.folded());
        assertEquals(1, presenter.grid.loads);
        assertEquals(1, presenter.grid.clears);
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("related pins opened"));
        assertTrue(report, report.contains("related pins folded"));
    }

    @Test public void theNextPinStartsTheWayTheLastChoiceWasLeft() {
        Settings.FOLD_RELATED_PINS.save(true);
        open(newPinId());
        arrow(column).performClick();
        assertTrue("saved", RelatedPinsFold.choice().get());

        column = newColumn();
        Presenter next = open(newPinId());
        assertNotNull(arrow(column));
        assertFalse(RelatedPinsFold.folded());
        assertEquals("Pinterest loads an open list itself", 0, next.grid.loads);
        assertEquals(180f, arrow(column).getRotation(), 0f);
    }

    @Test public void aPageLeftBehindFollowsTheChoiceWhenItComesBack() {
        Settings.FOLD_RELATED_PINS.save(true);
        String first = newPinId();
        Presenter behind = open(first);
        View arrow = arrow(column);
        arrow.performClick();
        assertEquals(1, behind.grid.loads);

        LinearLayout firstColumn = column;
        column = newColumn();
        open(newPinId());
        arrow(column).performClick();
        assertFalse("folded on the newer pin", RelatedPinsFold.choice().get());

        section(firstColumn, first);
        assertEquals("the older page folds too", 1, behind.grid.clears);
    }

    @Test public void hideRelatedPinsWins() {
        Settings.FOLD_RELATED_PINS.save(true);
        Settings.HIDE_RELATED_PINS.save(true);
        open(newPinId());
        assertNull(arrow(column));
        assertFalse(RelatedPinsFold.folded());
        assertTrue("Hide related pins still ends the wait", UiHooks.relatedPinsLoading());
    }

    @Test public void aPinWithoutAKnownPageGetsNoArrow() {
        Settings.FOLD_RELATED_PINS.save(true);
        RelatedPinsFold.bind(new Presenter(newPinId()));
        section(column, newPinId());
        assertNull(arrow(column));
    }

    @Test public void turningTheSwitchOffTakesTheArrowAway() {
        Settings.FOLD_RELATED_PINS.save(true);
        String id = newPinId();
        open(id);
        assertNotNull(arrow(column));
        Settings.FOLD_RELATED_PINS.save(false);
        section(column, id);
        assertNull(arrow(column));
    }

    @Test public void pausedNothingIsHeldBack() {
        Settings.FOLD_RELATED_PINS.save(true);
        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        assertFalse(RelatedPinsFold.folded());
        assertFalse(UiHooks.relatedPinsLoading());
    }

    @Test public void aBuildWithoutThePatchIgnoresAStaleSwitch() {
        Settings.FOLD_RELATED_PINS.save(true);
        PatchFamilyForTests.inBuild(EnumSet.noneOf(PatchFamily.class));
        assertFalse(RelatedPinsFold.folded());
        assertFalse(UiHooks.relatedPinsLoading());
    }

    @Test public void aSectionArrivingLaterLeavesTheArrowLast() {
        Settings.FOLD_RELATED_PINS.save(true);
        String id = newPinId();
        open(id);
        View arrow = arrow(column);
        section(column, id);
        assertSame(arrow, arrow(column));
        assertSame(arrow, column.getChildAt(column.getChildCount() - 1));
    }
}
