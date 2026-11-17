/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.os.Looper;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.diagnostics.HookStatus;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/**
 * #38: in Romanian, a pin with a lot of likes and comments leaves the Save button too little room,
 * and "Salvează" breaks over two lines. The label stays on one line.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CloseupSaveLabelTest {
    @Rule public final SettingsContextRule context = new SettingsContextRule();

    private static final String LABEL = "Salvează";
    private static final int PAD = 24;
    private static final float SIZE = 16f;

    @Before public void ids() {
        CloseupButtons.saveId = View.generateViewId();
    }

    @After public void restore() {
        PauseForTests.resume();
        CloseupButtons.saveId = -1;
        HookStatus.clear();
    }

    /** The row under a pin: the counts take what they need, the Save button gets the rest. */
    private static final class Row {
        final LinearLayout row = new LinearLayout(RuntimeEnvironment.getApplication());
        final View counts = new View(RuntimeEnvironment.getApplication());
        final Button save = new Button(RuntimeEnvironment.getApplication());
        final float label;

        Row(int id) {
            save.setId(id);
            save.setAllCaps(false);
            save.setMinWidth(0);
            save.setMinimumWidth(0);
            save.setTextSize(TypedValue.COMPLEX_UNIT_PX, SIZE);
            save.setPadding(PAD, 10, PAD, 10);
            save.setText(LABEL);
            label = save.getPaint().measureText(LABEL);
            row.addView(counts, new LinearLayout.LayoutParams(0, 10));
            row.addView(save, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }

        /** Leaves the Save button this much room, then lays the row out the way a frame does, twice. */
        void room(int room) {
            int countsWidth = 300;
            counts.getLayoutParams().width = countsWidth;
            counts.requestLayout();
            for (int pass = 0; pass < 2; pass++) {
                row.measure(View.MeasureSpec.makeMeasureSpec(countsWidth + room, View.MeasureSpec.EXACTLY),
                        View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED));
                row.layout(0, 0, row.getMeasuredWidth(), row.getMeasuredHeight());
            }
        }

        /** Pinterest applying a new look to the button: its padding and text size, then the hook. */
        void look() {
            save.setTextSize(TypedValue.COMPLEX_UNIT_PX, SIZE);
            save.setPadding(PAD, 10, PAD, 10);
            CloseupButtons.saveButton(save);
        }

        int lines() {
            return save.getLayout().getLineCount();
        }
    }

    @Test public void withRoomForItTheLabelIsPinterestsOwn() {
        Row row = new Row(CloseupButtons.saveId);
        row.look();
        row.room((int) Math.ceil(row.label) + 2 * PAD + 20);
        assertEquals(1, row.lines());
        assertEquals(PAD, row.save.getPaddingLeft());
        assertEquals(PAD, row.save.getPaddingRight());
        assertEquals(SIZE, row.save.getTextSize(), 0f);
    }

    @Test public void aLittleShortTheButtonGivesUpSomePaddingAndKeepsItsTextSize() {
        Row row = new Row(CloseupButtons.saveId);
        row.look();
        row.room((int) row.label + 2 * PAD - 12);
        assertEquals("one line", 1, row.lines());
        assertEquals("Pinterest's text size", SIZE, row.save.getTextSize(), 0f);
        assertTrue("less padding: " + row.save.getPaddingLeft(), row.save.getPaddingLeft() < PAD);
        assertTrue(String.join("\n", HookStatus.report()).contains("save label on one line"));
    }

    /**
     * The label is pulled onto one line in the middle of a layout, where the row can't measure the
     * button again. By the next frame the button is one line tall too, not a two-line box around it.
     */
    @Test public void theFrameAfterTheButtonIsOneLineTall() {
        Row roomy = new Row(View.generateViewId());
        roomy.look();
        roomy.room((int) Math.ceil(roomy.label) + 2 * PAD + 20);
        int oneLine = roomy.save.getHeight();

        Row row = new Row(CloseupButtons.saveId);
        row.look();
        int room = (int) row.label + 2 * PAD - 12;
        row.room(room);
        assertTrue("Pinterest measured two lines first", row.save.getHeight() > oneLine);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        row.room(room);
        assertEquals("one line", 1, row.lines());
        assertEquals("one line tall", oneLine, row.save.getHeight());
    }

    @Test public void farTooShortTheTextGetsSmallerButNoSmallerThanItsFloor() {
        Row row = new Row(CloseupButtons.saveId);
        row.look();
        row.room((int) (row.label * 0.85f) + 2 * 8);
        assertEquals("one line", 1, row.lines());
        assertTrue("smaller text: " + row.save.getTextSize(), row.save.getTextSize() < SIZE);
        assertTrue("not below the floor: " + row.save.getTextSize(),
                row.save.getTextSize() >= SIZE * CloseupButtons.SMALLEST_LABEL - 0.01f);
    }

    @Test public void theNextPinWithRoomGetsPinterestsButtonBack() {
        Row row = new Row(CloseupButtons.saveId);
        row.look();
        row.room((int) (row.label * 0.85f) + 2 * 8);
        assertTrue(row.save.getTextSize() < SIZE);

        // The same button bound to a pin with fewer likes: Pinterest's new look leaves its size alone.
        CloseupButtons.saveButton(row.save);
        row.room((int) Math.ceil(row.label) + 2 * PAD + 20);
        assertEquals(1, row.lines());
        assertEquals(PAD, row.save.getPaddingLeft());
        assertEquals(PAD, row.save.getPaddingRight());
        assertEquals(SIZE, row.save.getTextSize(), 0f);
    }

    @Test public void pausedTheLabelWrapsTheWayPinterestLaysItOut() {
        Row row = new Row(CloseupButtons.saveId);
        row.look();
        row.room((int) row.label + 2 * PAD - 12);
        assertEquals(1, row.lines());

        PauseForTests.pause(HushPinterestPause.Reason.SWITCH);
        row.look();
        row.room((int) row.label + 2 * PAD - 12);
        assertEquals(PAD, row.save.getPaddingLeft());
        assertEquals("Pinterest's own two lines", 2, row.lines());
    }

    @Test public void anotherButtonThatWrapsIsLeftAlone() {
        Row row = new Row(View.generateViewId());
        row.look();
        row.room((int) row.label + 2 * PAD - 12);
        assertEquals(2, row.lines());
        assertEquals(PAD, row.save.getPaddingLeft());
    }
}
