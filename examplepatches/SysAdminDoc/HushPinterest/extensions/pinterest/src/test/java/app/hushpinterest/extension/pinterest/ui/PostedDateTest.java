/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.graphics.Color;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Date;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class PostedDateTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    /** 2026-10-12 12:00 UTC: the same day in every time zone a phone is likely to use. */
    private static final long OCT_12_2026 = 1_791_806_400_000L;

    /** Gson's annotation in Pinterest is renamed every build; ModelFields knows it by its shape. */
    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.FIELD)
    public @interface Json { String value(); }

    /** Stands in for Pinterest's pin model, whose created_at is a Date. */
    static final class Pin {
        @Json("created_at") Object createdAt;

        Pin(Object createdAt) {
            this.createdAt = createdAt;
        }
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.SHOW_POSTED_DATE.resetToDefault();
        HookStatus.clear();
    }

    /** The id Pinterest's resources give the title chevron, which the test app doesn't have. */
    private static final int CHEVRON_ID = 0x7f0b1234;

    /** Pinterest's context as far as the line goes: its resources know the chevron by name. */
    private static Context pinterest() {
        Context app = RuntimeEnvironment.getApplication();
        Resources base = app.getResources();
        @SuppressWarnings("deprecation")
        Resources resources = new Resources(base.getAssets(), base.getDisplayMetrics(), base.getConfiguration()) {
            @Override public int getIdentifier(String name, String type, String owner) {
                return PostedDate.TITLE_CHEVRON.equals(name) && "id".equals(type) ? CHEVRON_ID : super.getIdentifier(name, type, owner);
            }
        };
        return new ContextWrapper(app) {
            @Override public Resources getResources() {
                return resources;
            }
        };
    }

    /** Pinterest's title module: a side-by-side layout holding the title row alone, chevron and all. */
    private static LinearLayout module() {
        Context pinterest = pinterest();
        LinearLayout module = new LinearLayout(pinterest);
        LinearLayout row = new LinearLayout(pinterest);
        row.setPaddingRelative(24, 0, 32, 0);
        TextView title = new TextView(pinterest);
        title.setText("Mountain lake at dawn");
        title.setTextColor(Color.RED);
        row.addView(title);
        View chevron = new View(pinterest);
        chevron.setId(CHEVRON_ID);
        row.addView(chevron);
        module.addView(row);
        return module;
    }

    private static Pin postedOn(long at) {
        return new Pin(new Date(at));
    }

    /** The line's text without the direction marks that keep the date reading the right way. */
    private static String shown(LinearLayout module) {
        TextView line = (TextView) module.findViewWithTag(PostedDate.LINE_TAG);
        return line.getText().toString().replace("⁨", "").replace("⁩", "");
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    @Test public void offByDefaultTheModuleStaysAsPinterestBuiltIt() {
        LinearLayout module = module();
        PostedDate.show(module, postedOn(OCT_12_2026));
        assertEquals(1, module.getChildCount());
        assertEquals(LinearLayout.HORIZONTAL, module.getOrientation());
        assertNull(module.findViewWithTag(PostedDate.LINE_TAG));
    }

    @Test public void onTheDateGoesUnderTheTitleRowInItsColorAndPadding() {
        Settings.SHOW_POSTED_DATE.save(true);
        LinearLayout module = module();
        PostedDate.show(module, postedOn(OCT_12_2026));

        assertEquals(2, module.getChildCount());
        assertEquals("the row and the line stack", LinearLayout.VERTICAL, module.getOrientation());
        TextView line = (TextView) module.getChildAt(1);
        assertEquals(PostedDate.LINE_TAG, line.getTag());
        assertEquals(View.VISIBLE, line.getVisibility());
        assertEquals("Posted Oct 12, 2026", shown(module));
        assertEquals(Color.RED, line.getCurrentTextColor());
        assertEquals(24, line.getPaddingStart());
        assertEquals(32, line.getPaddingEnd());
        assertTrue(report(), report().contains("posted date shown"));
    }

    @Test
    @Config(qualifiers = "de")
    public void theDayReadsTheWayThePhonesLanguageWritesIt() {
        Settings.SHOW_POSTED_DATE.save(true);
        LinearLayout module = module();
        PostedDate.show(module, postedOn(OCT_12_2026));
        assertEquals("Gepostet am 12.10.2026", shown(module));
    }

    @Test public void aPinWithNoUsableDateGetsNoLine() {
        Settings.SHOW_POSTED_DATE.save(true);
        long now = System.currentTimeMillis();
        Object[] pins = {
                null,
                new Object(),
                new Pin(null),
                new Pin("2026-10-12T12:00:00"),
                postedOn(0L),
                postedOn(PostedDate.EARLIEST - 1),
                postedOn(now + 3L * 24 * 60 * 60 * 1000),
        };
        for (Object pin : pins) {
            LinearLayout module = module();
            PostedDate.show(module, pin);
            assertEquals(String.valueOf(pin), 1, module.getChildCount());
            assertEquals(LinearLayout.HORIZONTAL, module.getOrientation());
        }
        LinearLayout earliest = module();
        PostedDate.show(earliest, postedOn(PostedDate.EARLIEST));
        assertEquals("Pinterest's first day still counts", 2, earliest.getChildCount());
    }

    @Test public void aReusedModuleKeepsOneLineAndHidesItForAPinWithoutADate() {
        Settings.SHOW_POSTED_DATE.save(true);
        LinearLayout module = module();
        PostedDate.show(module, postedOn(OCT_12_2026));
        PostedDate.show(module, postedOn(OCT_12_2026 - 365L * 24 * 60 * 60 * 1000));
        assertEquals(2, module.getChildCount());
        assertEquals("Posted Oct 12, 2025", shown(module));

        PostedDate.show(module, new Pin(null));
        assertEquals(2, module.getChildCount());
        assertEquals(View.GONE, module.getChildAt(1).getVisibility());

        PostedDate.show(module, postedOn(OCT_12_2026));
        assertEquals(View.VISIBLE, module.getChildAt(1).getVisibility());
        assertEquals("Posted Oct 12, 2026", shown(module));
    }

    @Test public void turningItOffHidesTheLineOnTheNextPin() {
        Settings.SHOW_POSTED_DATE.save(true);
        LinearLayout module = module();
        PostedDate.show(module, postedOn(OCT_12_2026));
        Settings.SHOW_POSTED_DATE.save(false);
        PostedDate.show(module, postedOn(OCT_12_2026));
        assertEquals(View.GONE, module.getChildAt(1).getVisibility());
    }

    @Test public void pausedTheLineHidesAndComesBackOnResume() {
        Settings.SHOW_POSTED_DATE.save(true);
        LinearLayout module = module();
        PostedDate.show(module, postedOn(OCT_12_2026));

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        PostedDate.show(module, postedOn(OCT_12_2026));
        assertEquals(View.GONE, module.getChildAt(1).getVisibility());

        PauseForTests.resume();
        PostedDate.show(module, postedOn(OCT_12_2026));
        assertEquals(View.VISIBLE, module.getChildAt(1).getVisibility());

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        LinearLayout fresh = module();
        PostedDate.show(fresh, postedOn(OCT_12_2026));
        assertEquals(1, fresh.getChildCount());
    }

    @Test public void aModuleLaidOutAnyOtherWayIsLeftAlone() {
        Settings.SHOW_POSTED_DATE.save(true);
        LinearLayout crowded = module();
        crowded.addView(new View(RuntimeEnvironment.getApplication()));
        PostedDate.show(crowded, postedOn(OCT_12_2026));
        assertEquals(2, crowded.getChildCount());
        assertEquals(LinearLayout.HORIZONTAL, crowded.getOrientation());
        assertNull(crowded.findViewWithTag(PostedDate.LINE_TAG));
        assertTrue(report(), report().contains("posted date skipped: title module holds more than its row"));

        FrameLayout frame = new FrameLayout(RuntimeEnvironment.getApplication());
        frame.addView(new TextView(RuntimeEnvironment.getApplication()));
        PostedDate.show(frame, postedOn(OCT_12_2026));
        assertEquals(1, frame.getChildCount());

        PostedDate.show(null, postedOn(OCT_12_2026));
    }

    // 14.43.0 runs the title module's update for the translation toggle's module too. That one is
    // also a layout with one row and a text in it, but no chevron.
    @Test public void theTranslationToggleSharingTheTitleModulesUpdateGetsNoLine() {
        Settings.SHOW_POSTED_DATE.save(true);
        Context pinterest = pinterest();
        LinearLayout translation = new LinearLayout(pinterest);
        translation.setOrientation(LinearLayout.VERTICAL);
        LinearLayout toggle = new LinearLayout(pinterest);
        TextView label = new TextView(pinterest);
        label.setText("See translation");
        toggle.addView(label);
        translation.addView(toggle);

        PostedDate.show(translation, postedOn(OCT_12_2026));
        assertEquals(1, translation.getChildCount());
        assertNull(translation.findViewWithTag(PostedDate.LINE_TAG));
        assertTrue(report(), report().contains("posted date skipped: module holds no title row"));

        LinearLayout title = module();
        PostedDate.show(title, postedOn(OCT_12_2026));
        assertEquals("the title module next to it still gets its line", 2, title.getChildCount());
    }
}
