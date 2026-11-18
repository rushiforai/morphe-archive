/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import static org.junit.Assert.assertEquals;

import android.content.Context;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

import app.hushpinterest.extension.pinterest.settings.Settings;
import app.hushpinterest.extension.shared.SettingsContextRule;

/** The picture header of a board tab on Home: only the name can be left, and the name can move (#42). */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BoardTabsTest {
    private static final float DELTA = 0.01f;

    @Rule public final SettingsContextRule settings = new SettingsContextRule();

    private FrameLayout tab;
    private FrameLayout header;
    private Button button;
    private TextView name;
    private TextView subtitle;

    private TextView text(Context context, String words, float size) {
        TextView view = new TextView(context);
        view.setText(words);
        view.setTextSize(size);
        header.addView(view);
        return view;
    }

    @Before public void header() {
        Context context = RuntimeEnvironment.getApplication();
        tab = new FrameLayout(context);
        header = new FrameLayout(context);
        tab.addView(header);
        subtitle = text(context, "More ideas for", 12);
        name = text(context, "Calm", 30);
        button = new Button(context);
        header.addView(button);
        header.layout(0, 0, 1000, 800);
        name.layout(40, 700, 540, 760);
    }

    @After public void restore() {
        Settings.HIDE_BOARD_TAB_BUTTON.resetToDefault();
        Settings.HIDE_BOARD_TAB_SUBTITLE.resetToDefault();
        BoardTabs.POSITION.resetToDefault();
    }

    private void bind() {
        BoardTabs.bind(tab, null);
    }

    @Test public void withEverythingOffNothingChanges() {
        bind();
        assertEquals(View.VISIBLE, button.getVisibility());
        assertEquals(View.VISIBLE, subtitle.getVisibility());
        assertEquals(View.VISIBLE, name.getVisibility());
        assertEquals(0, name.getTranslationX(), DELTA);
        assertEquals(0, name.getTranslationY(), DELTA);
    }

    @Test public void theButtonGoesAlone() {
        Settings.HIDE_BOARD_TAB_BUTTON.save(true);
        bind();
        assertEquals(View.GONE, button.getVisibility());
        assertEquals(View.VISIBLE, subtitle.getVisibility());
    }

    @Test public void theLargestTextStaysWhateverItsPlaceAmongTheChildren() {
        Settings.HIDE_BOARD_TAB_SUBTITLE.save(true);
        bind();
        assertEquals(View.GONE, subtitle.getVisibility());
        assertEquals(View.VISIBLE, name.getVisibility());
        assertEquals("the button isn't text to fold", View.VISIBLE, button.getVisibility());
    }

    @Test public void textArrivingAfterTheBindFoldsAtTheNextLayout() {
        Settings.HIDE_BOARD_TAB_SUBTITLE.save(true);
        name.setText("");
        subtitle.setText("");
        bind();
        name.setText("Calm");
        subtitle.setText("More ideas for");
        header.layout(0, 0, 1000, 801);
        assertEquals(View.GONE, subtitle.getVisibility());
        assertEquals(View.VISIBLE, name.getVisibility());
    }

    @Test public void turningOffGivesBackOnlyWhatItHid() {
        Settings.HIDE_BOARD_TAB_BUTTON.save(true);
        Settings.HIDE_BOARD_TAB_SUBTITLE.save(true);
        bind();
        Settings.HIDE_BOARD_TAB_BUTTON.save(false);
        Settings.HIDE_BOARD_TAB_SUBTITLE.save(false);
        bind();
        assertEquals(View.VISIBLE, button.getVisibility());
        assertEquals(View.VISIBLE, subtitle.getVisibility());
    }

    @Test public void aViewPinterestHidStaysHidden() {
        button.setVisibility(View.GONE);
        subtitle.setVisibility(View.GONE);
        Settings.HIDE_BOARD_TAB_BUTTON.save(true);
        Settings.HIDE_BOARD_TAB_SUBTITLE.save(true);
        bind();
        Settings.HIDE_BOARD_TAB_BUTTON.save(false);
        Settings.HIDE_BOARD_TAB_SUBTITLE.save(false);
        bind();
        assertEquals(View.GONE, button.getVisibility());
        assertEquals(View.GONE, subtitle.getVisibility());
    }

    @Test public void repeatedLayoutsChangeNothing() {
        int[] changes = {0};
        Context context = RuntimeEnvironment.getApplication();
        Button counted = new Button(context) {
            @Override public void setVisibility(int visibility) {
                changes[0]++;
                super.setVisibility(visibility);
            }
        };
        header.addView(counted);
        Settings.HIDE_BOARD_TAB_BUTTON.save(true);
        bind();
        int first = changes[0];
        BoardTabs.apply(header);
        BoardTabs.apply(header);
        assertEquals("each change would ask for another layout", first, changes[0]);
    }

    private void assertMoved(String position, float x, float y) {
        BoardTabs.POSITION.save(position);
        bind();
        assertEquals(position, x, name.getTranslationX(), DELTA);
        assertEquals(position, y, name.getTranslationY(), DELTA);
    }

    @Test public void theNameMovesToEachPlace() {
        // A 500 wide, 60 high name at 40, 700 in a 1000 by 800 header, with nothing above it.
        assertMoved(BoardTabs.TOP_LEFT, 0, 8 - 700);
        assertMoved(BoardTabs.TOP_CENTER, 250 - 40, 8 - 700);
        assertMoved(BoardTabs.MIDDLE, 250 - 40, 370 - 700);
        assertMoved(BoardTabs.BOTTOM_CENTER, 250 - 40, 0);
        assertMoved(BoardTabs.BOTTOM_RIGHT, 1000 - 40 - 540, 0);
    }

    @Test public void goingBackToPinterestsPlacePutsTheNameBack() {
        assertMoved(BoardTabs.MIDDLE, 210, -330);
        assertMoved("", 0, 0);
    }

    @Test public void onlyTheNameMoves() {
        BoardTabs.POSITION.save(BoardTabs.MIDDLE);
        bind();
        assertEquals(0, subtitle.getTranslationX(), DELTA);
        assertEquals(0, subtitle.getTranslationY(), DELTA);
    }

    @Test public void aTabWithNothingInsideIsLeftAlone() {
        Settings.HIDE_BOARD_TAB_BUTTON.save(true);
        BoardTabs.bind(new FrameLayout(RuntimeEnvironment.getApplication()), null);
        BoardTabs.bind(new View(RuntimeEnvironment.getApplication()), null);
    }
}
