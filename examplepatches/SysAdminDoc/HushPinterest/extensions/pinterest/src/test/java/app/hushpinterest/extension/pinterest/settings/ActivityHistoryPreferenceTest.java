/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Intent;
import android.os.Bundle;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.RadioButton;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowLooper;
import org.robolectric.shadows.ShadowToast;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import app.hushpinterest.extension.pinterest.privacy.ActivityHistory;
import app.hushpinterest.extension.pinterest.privacy.ActivityHistoryForTests;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.SettingsContextRule;
import app.hushpinterest.extension.shared.settings.PauseForTests;

/** #48: the Your likes and comments page, its filter, a tap on a row and Clear. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, qualifiers = "en-rUS")
@SuppressWarnings("deprecation")
public class ActivityHistoryPreferenceTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String ONE = "One entry. Tap it to open its pin.";
    private static final String OTHER = "%1$d entries, newest first. Tap one to open its pin.";

    private Application app;
    private ActivityController<LikesActivity> controller;
    private LikesPage page;

    @Before public void prepare() {
        app = RuntimeEnvironment.getApplication();
        PauseForTests.resume();
        ActivityHistory.clear(app);
        Settings.LIKE_COMMENT_HISTORY.save(true);
        controller = Robolectric.buildActivity(LikesActivity.class).setup();
        page = new LikesPage();
        controller.get().getFragmentManager().beginTransaction().add(android.R.id.content, page, "likes").commit();
        controller.get().getFragmentManager().executePendingTransactions();
        ShadowLooper.idleMainLooper();
    }

    @After public void restore() {
        if (controller != null) controller.close();
        ShadowLooper.idleMainLooper();
        ActivityHistory.clear(app);
        Settings.LIKE_COMMENT_HISTORY.resetToDefault();
        PauseForTests.resume();
    }

    /** A like on pin 123 titled Blue kitchen, a comment on it, then a reply on pin 456: newest first, the reply leads. */
    private static void likedCommentedAndReplied() {
        Map<String, Object> pin = new HashMap<>();
        pin.put("id", "123");
        pin.put("images", null);
        pin.put("videos", null);
        pin.put("title", "Blue kitchen");
        ActivityHistory.likeSent(pin, "123", 1);
        ActivityHistory.commentPosted("123", "Love the tiles");
        ActivityHistory.replyPosted("456", "Thank you");
        List<ActivityHistory.Entry> found = ActivityHistory.entries(RuntimeEnvironment.getApplication());
        assertNotNull(found);
        assertEquals(3, found.size());
    }

    @Test public void theRowIsAButtonThatOpensTheListNewestFirst() {
        ActivityHistoryPreference row = page.row;
        assertEquals("action_like_comment_history", row.getKey());
        assertFalse(row.isPersistent());
        assertEquals(text("Your likes and comments"), row.getTitle().toString());
        assertTrue("a tap opens something, so the row wears a chevron", ScreenColors.opensSomething(row));
        likedCommentedAndReplied();

        AlertDialog list = open();
        assertEquals(text("Your likes and comments"), row.getDialogTitle().toString());
        assertEquals(3, entries(list).getAdapter().getCount());
        assertEquals(L10n.quantity(row.getContext(), 3, ONE, OTHER), message(list));
        assertTrue(rowText(list, 0), rowText(list, 0).contains(text("Replied")));
        assertTrue(rowText(list, 0), rowText(list, 0).contains("Thank you"));
        assertTrue(rowText(list, 0), rowText(list, 0).contains(L10n.f(row.getContext(), "Pin %s", L10n.isolate("456"))));
        assertTrue(rowText(list, 1), rowText(list, 1).contains(text("Commented")));
        assertTrue("a comment shows its pin's title", rowText(list, 1).contains("Blue kitchen"));
        assertTrue(rowText(list, 2), rowText(list, 2).contains(text("Liked")));
        assertTrue(rowText(list, 2), rowText(list, 2).contains("Blue kitchen"));
        assertTrue(list.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        assertEquals(text("Clear"), list.getButton(AlertDialog.BUTTON_POSITIVE).getText().toString());
        assertEquals(text("Close"), list.getButton(AlertDialog.BUTTON_NEGATIVE).getText().toString());
    }

    @Test public void theFilterShowsOnlyLikesOrOnlyCommentsAndReplies() {
        likedCommentedAndReplied();
        AlertDialog list = open();
        filter(list, "Likes");
        assertEquals(1, entries(list).getAdapter().getCount());
        assertTrue(rowText(list, 0).contains(text("Liked")));
        assertEquals(L10n.quantity(page.row.getContext(), 1, ONE, OTHER), message(list));
        filter(list, "Comments");
        assertEquals(2, entries(list).getAdapter().getCount());
        assertTrue(rowText(list, 0).contains(text("Replied")));
        assertTrue(rowText(list, 1).contains(text("Commented")));
        filter(list, "All");
        assertEquals(3, entries(list).getAdapter().getCount());
    }

    @Test public void anEmptyListSaysWhatFillsIt() {
        Settings.LIKE_COMMENT_HISTORY.save(false);
        AlertDialog list = open();
        assertEquals(text("Nothing here yet. Turn on Like and comment history to start a list."), message(list));
        assertEquals(View.GONE, entries(list).getVisibility());
        assertFalse("nothing to clear", list.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        list.dismiss();
        ShadowLooper.idleMainLooper();

        Settings.LIKE_COMMENT_HISTORY.save(true);
        list = open();
        assertEquals(text("Nothing here yet. Pins you like and comments you post show up here."), message(list));
        list.dismiss();
        ShadowLooper.idleMainLooper();

        ActivityHistory.commentPosted("123", "Love the tiles");
        list = open();
        filter(list, "Likes");
        assertEquals(text("No likes in the list."), message(list));
        assertTrue("the comment can still be cleared", list.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        ActivityHistory.clear(app);
        ActivityHistory.likeSent(null, "123", 1);
        filter(list, "Comments");
        assertEquals(text("No comments in the list."), message(list));
    }

    @Test public void aTapOpensThePinInPinterestAndTheListStays() {
        likedCommentedAndReplied();
        AlertDialog list = open();
        click(entries(list), 2);
        ShadowLooper.idleMainLooper();
        Intent pin = Shadows.shadowOf(controller.get()).getNextStartedActivity();
        assertNotNull("a tap opened nothing", pin);
        assertEquals(Intent.ACTION_VIEW, pin.getAction());
        assertEquals("https://www.pinterest.com/pin/123/", pin.getDataString());
        assertEquals(controller.get().getPackageName(), pin.getPackage());
        assertTrue(pin.hasCategory(Intent.CATEGORY_BROWSABLE));
        assertNull(pin.getClipData());
        assertEquals(0, pin.getFlags() & (Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION));
        assertTrue(list.isShowing());
    }

    @Test public void clearEmptiesTheListAtOnceAndSaysSo() {
        likedCommentedAndReplied();
        AlertDialog list = open();
        list.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertTrue("the page stays open to show it empty", list.isShowing());
        List<ActivityHistory.Entry> left = ActivityHistory.entries(app);
        assertNotNull(left);
        assertTrue(left.isEmpty());
        assertEquals(text("Cleared your likes and comments."), ShadowToast.getTextOfLatestToast());
        assertEquals(text("Nothing here yet. Pins you like and comments you post show up here."), message(list));
        assertEquals(View.GONE, entries(list).getVisibility());
        assertFalse(list.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
    }

    @Test public void aDamagedListSaysSoAndClearStillWorks() {
        ActivityHistoryForTests.replaceFile("not a list");
        AlertDialog list = open();
        assertEquals(text("Couldn't open the list. Try again."), message(list));
        assertTrue(list.getButton(AlertDialog.BUTTON_POSITIVE).isEnabled());
        list.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
        ShadowLooper.idleMainLooper();
        assertEquals(text("Nothing here yet. Pins you like and comments you post show up here."), message(list));
    }

    private AlertDialog open() {
        click(pageList(), 0);
        AlertDialog dialog = (AlertDialog) page.row.getDialog();
        assertNotNull("the row's click didn't open the list", dialog);
        assertTrue(dialog.isShowing());
        return dialog;
    }

    private void filter(AlertDialog dialog, String english) {
        RadioButton option = radio(dialog.getWindow().getDecorView(), text(english));
        assertNotNull("no " + english + " filter", option);
        option.performClick();
        ShadowLooper.idleMainLooper();
        assertTrue(option.isChecked());
    }

    private static RadioButton radio(View view, String label) {
        if (view instanceof RadioButton && label.contentEquals(((RadioButton) view).getText())) return (RadioButton) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                RadioButton found = radio(group.getChildAt(i), label);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static void click(ListView list, int position) {
        ListAdapter adapter = list.getAdapter();
        assertNotNull(adapter);
        assertTrue(list.performItemClick(adapter.getView(position, null, list), position, adapter.getItemId(position)));
    }

    private static ListView entries(AlertDialog dialog) { return dialog.findViewById(android.R.id.list); }
    private ListView pageList() { return page.getView().findViewById(android.R.id.list); }

    /** Every text a row of the list draws, one per line. */
    private static String rowText(AlertDialog dialog, int position) {
        ListView list = entries(dialog);
        StringBuilder out = new StringBuilder();
        texts(list.getAdapter().getView(position, null, list), out);
        return out.toString();
    }

    private static void texts(View view, StringBuilder out) {
        if (view instanceof TextView) out.append(((TextView) view).getText()).append('\n');
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) texts(group.getChildAt(i), out);
        }
    }

    private static String message(AlertDialog dialog) {
        TextView text = visibleMessage(dialog.getWindow().getDecorView());
        assertNotNull("the page has no visible explanation", text);
        return text.getText().toString();
    }

    private static TextView visibleMessage(View view) {
        if (view.getVisibility() != View.VISIBLE) return null;
        if (view instanceof TextView && view.getId() == android.R.id.message) return (TextView) view;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = visibleMessage(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private String text(String english) { return L10n.t(page.row.getContext(), english); }

    public static class LikesPage extends PreferenceFragment {
        ActivityHistoryPreference row;
        @Override public void onCreate(Bundle state) {
            super.onCreate(state);
            PreferenceScreen screen = getPreferenceManager().createPreferenceScreen(getActivity());
            row = new ActivityHistoryPreference(getActivity());
            screen.addPreference(row);
            setPreferenceScreen(screen);
        }
    }

    public static class LikesActivity extends Activity {}
}
