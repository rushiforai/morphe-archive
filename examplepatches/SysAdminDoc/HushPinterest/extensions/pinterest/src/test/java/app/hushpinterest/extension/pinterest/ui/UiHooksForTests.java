/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.ui;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.util.Locale;

import org.robolectric.RuntimeEnvironment;
import org.robolectric.shadows.ShadowToast;

/**
 * Lets tests in other packages name the class the save toast hook treats as a save toast, and hand
 * over closeup rows wearing ids Pinterest's resources would give them.
 */
public final class UiHooksForTests {
    private UiHooksForTests() {}

    /** Like, comment, share and more, in the order the row under a pin's picture shows them. */
    public static final int LIKE = 0, COMMENTS = 1, SHARE = 2, MORE = 3;

    public static void saveToast(Class<?> type) {
        UiHooks.saveToastForTests = type;
    }

    /**
     * An English "Saved!" from a screen that saves pins, made through the stand-in for
     * Toast.makeText and shown the way Pinterest shows it: true when it never showed.
     */
    public static boolean quietsSavedToast() {
        int shown = ShadowToast.shownToastCount();
        UiHooks.androidToast(SaveStrings.context(Locale.ENGLISH, SaveStrings.english()), "Saved!", Toast.LENGTH_SHORT).show();
        return ShadowToast.shownToastCount() == shown;
    }

    /**
     * The row under a pin's picture handed over with each button wearing its id: true when the
     * button at [which] was hidden, or with [held], when Pinterest showing it again was kept GONE.
     */
    public static boolean hidesActionButton(int which, boolean held) {
        Context context = RuntimeEnvironment.getApplication();
        FrameLayout bar = new FrameLayout(context);
        LinearLayout row = new LinearLayout(context);
        bar.addView(row);
        View[] buttons = new View[4];
        for (int i = 0; i < buttons.length; i++) {
            buttons[i] = new View(context);
            buttons[i].setId(View.generateViewId());
            row.addView(buttons[i]);
        }
        CloseupButtons.likeId = buttons[LIKE].getId();
        CloseupButtons.commentsId = buttons[COMMENTS].getId();
        CloseupButtons.shareId = buttons[SHARE].getId();
        CloseupButtons.moreId = buttons[MORE].getId();
        try {
            CloseupButtons.actionBar(bar);
            return hidden(buttons[which], held);
        } finally {
            CloseupButtons.likeId = CloseupButtons.commentsId = CloseupButtons.shareId = CloseupButtons.moreId = -1;
        }
    }

    /** A row holding the Visit site button, handed over: true when it was hidden, or with [held], kept GONE. */
    public static boolean hidesVisitSite(boolean held) {
        Context context = RuntimeEnvironment.getApplication();
        FrameLayout bar = new FrameLayout(context);
        View visit = new View(context);
        visit.setId(View.generateViewId());
        bar.addView(visit);
        CloseupButtons.visitSiteId = visit.getId();
        try {
            CloseupButtons.visitSite(bar);
            return hidden(bar, held);
        } finally {
            CloseupButtons.visitSiteId = -1;
        }
    }

    /** A Save button wearing its id, handed over after Pinterest styles it: true when it was made smaller. */
    public static boolean shrinksSaveButton() {
        View save = new View(RuntimeEnvironment.getApplication());
        save.setId(View.generateViewId());
        CloseupButtons.saveId = save.getId();
        try {
            CloseupButtons.saveButton(save);
            return save.getScaleX() != 1f;
        } finally {
            CloseupButtons.saveId = -1;
        }
    }

    private static boolean hidden(View view, boolean held) {
        return held ? CloseupButtons.visibility(view, View.VISIBLE) != View.VISIBLE : view.getVisibility() == View.GONE;
    }
}
