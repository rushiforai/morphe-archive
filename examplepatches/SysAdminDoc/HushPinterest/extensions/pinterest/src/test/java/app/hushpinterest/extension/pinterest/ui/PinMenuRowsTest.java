/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;

/** Any row of a pin's menu can be taken out, and everything else stays as it was (#43). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PinMenuRowsTest {
    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private Context context;
    private LinearLayout menu;
    private int clicks;

    /** Pinterest's strings, under the names its menu reads them by. */
    private static Context withStrings(Context base) {
        Map<String, String> strings = new HashMap<>();
        strings.put("save_pin", "Save");
        strings.put("overflow_menu_share", "Share");
        strings.put("overflow_menu_see_more", "See more");
        strings.put("overflow_menu_see_more_ai", "See more AI");
        strings.put("overflow_menu_see_less", "See less");
        strings.put("contextmenu_unfollow_board", "Unfollow %1$s");
        List<String> names = new ArrayList<>(strings.keySet());
        Resources original = base.getResources();
        Resources resources = new Resources(base.getAssets(), original.getDisplayMetrics(), original.getConfiguration()) {
            @Override public int getIdentifier(String name, String type, String owner) {
                return "string".equals(type) ? names.indexOf(name) + 1 : 0;
            }
            @Override public String getString(int id) { return strings.get(names.get(id - 1)); }
        };
        return new ContextWrapper(base) {
            @Override public Resources getResources() { return resources; }
        };
    }

    @Before public void menu() {
        context = withStrings(RuntimeEnvironment.getApplication());
        menu = new LinearLayout(context);
        menu.setOrientation(LinearLayout.VERTICAL);
        Settings.HIDE_PIN_MENU_ROWS.save(true);
    }

    @After public void restore() {
        Settings.HIDE_PIN_MENU_ROWS.resetToDefault();
        Settings.HIDE_PIN_MENU_COLLAGE.resetToDefault();
        PinMenuRows.PICKED.resetToDefault();
        HookStatus.clear();
    }

    private RelativeLayout row(ViewGroupHolder holder, String title) {
        RelativeLayout row = new RelativeLayout(context);
        row.setContentDescription(title);
        row.setOnClickListener(view -> clicks++);
        holder.group.addView(row);
        return row;
    }

    private static final class ViewGroupHolder {
        final android.view.ViewGroup group;
        ViewGroupHolder(android.view.ViewGroup group) { this.group = group; }
    }

    private RelativeLayout row(String title) {
        return row(new ViewGroupHolder(menu), title);
    }

    private void pick(String... keys) {
        PinMenuRows.PICKED.save(String.join(",", keys));
    }

    private void measure() {
        InterfaceControls.pinMenuRows(menu);
    }

    @Test public void aPickedRowFoldsAndTheOthersKeepWorking() {
        View save = row("Save");
        View share = row("Share");
        pick("save");
        measure();
        assertEquals(View.GONE, save.getVisibility());
        assertEquals(View.VISIBLE, share.getVisibility());
        assertTrue(share.performClick());
        assertEquals(1, clicks);
    }

    @Test public void everyTitleARowCanHaveCounts() {
        View plain = row("See more");
        View ai = row("See more AI");
        pick("see_more");
        measure();
        assertEquals(View.GONE, plain.getVisibility());
        assertEquals(View.GONE, ai.getVisibility());
    }

    @Test public void aTitleWithANameInItMatchesAnyName() {
        View board = row("Unfollow Kitchen ideas");
        View other = row("Unfollowing");
        pick("unfollow");
        measure();
        assertEquals(View.GONE, board.getVisibility());
        assertEquals("the title's own words aren't enough", View.VISIBLE, other.getVisibility());
    }

    @Test public void hushRowsFoldByTheTitlesTheyAreBuiltWith() {
        View download = row(L10n.t("Download pin"));
        View unavailable = row(L10n.t("Download unavailable"));
        View copy = row(L10n.t("Copy image"));
        pick("download_pin");
        measure();
        assertEquals(View.GONE, download.getVisibility());
        assertEquals(View.GONE, unavailable.getVisibility());
        assertEquals(View.VISIBLE, copy.getVisibility());
    }

    @Test public void theReasonBlockGoesByItsIdInAnyWording() {
        FrameLayout reason = UiHooksForTests.namedFrame("reason_text");
        menu.addView(reason);
        measure();
        assertEquals("not picked", View.VISIBLE, reason.getVisibility());
        pick(PinMenuRows.REASON);
        measure();
        assertEquals(View.GONE, reason.getVisibility());
    }

    private LinearLayout pills;
    private View left;
    private View gap;
    private View right;

    private void addPills() {
        pills = new LinearLayout(context);
        pills.setOrientation(LinearLayout.HORIZONTAL);
        menu.addView(pills);
        ViewGroupHolder holder = new ViewGroupHolder(pills);
        left = row(holder, "See more");
        gap = new View(context);
        pills.addView(gap);
        right = row(holder, "See less");
    }

    @Test public void onePillGoingTakesTheGapWithItAndLeavesTheOther() {
        addPills();
        pick("see_more");
        measure();
        assertEquals(View.GONE, left.getVisibility());
        assertEquals(View.GONE, gap.getVisibility());
        assertEquals(View.VISIBLE, right.getVisibility());
        assertEquals(View.VISIBLE, pills.getVisibility());
    }

    @Test public void bothPillsGoingLeaveNoEmptyLine() {
        addPills();
        pick("see_more", "see_less");
        measure();
        assertEquals(View.GONE, pills.getVisibility());
        pick("see_less");
        measure();
        assertEquals(View.VISIBLE, pills.getVisibility());
        assertEquals(View.VISIBLE, left.getVisibility());
        assertEquals(View.GONE, gap.getVisibility());
        assertEquals(View.GONE, right.getVisibility());
    }

    @Test public void aDividerBetweenRowsIsLeftAlone() {
        row("Save");
        View divider = new View(context);
        menu.addView(divider);
        row("Share");
        pick("save");
        measure();
        assertEquals(View.VISIBLE, divider.getVisibility());
    }

    @Test public void offGivesBackWhatItFolded() {
        View save = row("Save");
        save.setVisibility(View.INVISIBLE);
        pick("save");
        measure();
        assertEquals(View.GONE, save.getVisibility());
        Settings.HIDE_PIN_MENU_ROWS.save(false);
        measure();
        assertEquals(View.INVISIBLE, save.getVisibility());
    }

    @Test public void aRowFoldedByAnotherSwitchStaysFolded() {
        Settings.HIDE_PIN_MENU_COLLAGE.save(true);
        View collage = row("Add to collage");
        InterfaceControls.pinMenuItem(collage, "overflow_menu_add_to_collage");
        assertEquals(View.GONE, collage.getVisibility());
        pick("save");
        measure();
        assertEquals(View.GONE, collage.getVisibility());
        Settings.HIDE_PIN_MENU_ROWS.save(false);
        measure();
        assertEquals("only this feature's own folds are given back", View.GONE, collage.getVisibility());
    }

    @Test public void aRowPinterestHidItselfStaysHidden() {
        View save = row("Save");
        save.setVisibility(View.GONE);
        pick("save");
        measure();
        PinMenuRows.PICKED.save("");
        measure();
        assertEquals(View.GONE, save.getVisibility());
    }

    @Test public void measuringAgainChangesNothing() {
        int[] changes = {0};
        RelativeLayout save = new RelativeLayout(context) {
            @Override public void setVisibility(int visibility) {
                changes[0]++;
                super.setVisibility(visibility);
            }
        };
        save.setContentDescription("See more");
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.addView(save);
        row.addView(new View(context));
        row(new ViewGroupHolder(row), "See less");
        menu.addView(row);
        pick("see_more");
        measure();
        int first = changes[0];
        measure();
        measure();
        assertEquals("each extra pass would ask for another layout", first, changes[0]);
    }

    @Test public void theSheetFoldsRowsAddedAfterItsViewWasMade() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            pick("save");
            FrameLayout sheet = new FrameLayout(context);
            InterfaceControls.pinMenuSheet(sheet);
            controller.get().setContentView(sheet);
            RelativeLayout save = row(new ViewGroupHolder(sheet), "Save");
            assertEquals("rows come after the hook", View.VISIBLE, save.getVisibility());
            sheet.getViewTreeObserver().dispatchOnGlobalLayout();
            assertEquals(View.GONE, save.getVisibility());
        }
    }

    @Test public void withTheSwitchOffTheSheetIsNotWatched() {
        try (ActivityController<Activity> controller = Robolectric.buildActivity(Activity.class).setup()) {
            Settings.HIDE_PIN_MENU_ROWS.save(false);
            pick("save");
            FrameLayout sheet = new FrameLayout(context);
            InterfaceControls.pinMenuSheet(sheet);
            controller.get().setContentView(sheet);
            Settings.HIDE_PIN_MENU_ROWS.save(true);
            RelativeLayout save = row(new ViewGroupHolder(sheet), "Save");
            sheet.getViewTreeObserver().dispatchOnGlobalLayout();
            assertEquals(View.VISIBLE, save.getVisibility());
        }
    }

    @Test public void theListNamesRowsTheWayTheMenuDoes() {
        List<String> labels = new ArrayList<>();
        List<String> keys = new ArrayList<>();
        for (PinMenuRows.Choice choice : PinMenuRows.choices(context)) {
            labels.add(choice.label);
            keys.add(choice.key);
        }
        assertTrue(labels.toString(), labels.containsAll(Arrays.asList("Save", "Share", "See more", "See less", "Unfollow")));
        assertTrue(labels.contains(L10n.t("Why you're seeing this pin")));
        assertFalse("this build has no such string", keys.contains("report"));
        assertFalse("the Download pins patch isn't in this build", keys.contains("download_pin"));
    }

    @Test public void pickingAndUnpickingKeepsTheOtherRows() {
        PinMenuRows.pick("save", true);
        PinMenuRows.pick("share", true);
        PinMenuRows.pick("save", false);
        assertEquals("share", PinMenuRows.PICKED.get());
    }
}
