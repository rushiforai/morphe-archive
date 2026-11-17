/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.Looper;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;

/** The Bookmarks page (#79): newest first, and a long press or Remove takes one off with a toast. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class BookmarksPageTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String OLDER = "5\t-200\t7\t0\t1700000000\t1000\tAnna\tFriends\thello";
    private static final String NEWER = "5\t100\t9\t0\t1700000100\t3000\t\tAnna\ta photo";

    @After public void restore() throws Exception {
        Utils.awaitBackgroundTasksForTests();
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        Settings.BOOKMARKS.resetToDefault();
        HookStatus.clear();
        ShadowToast.reset();
    }

    private static String text(LinearLayout parent, int index) {
        return ((TextView) parent.getChildAt(index)).getText().toString();
    }

    @Test public void thePageListsBookmarksNewestFirstAndTakesOneOffByLongPressOrRemove() {
        Settings.BOOKMARKS.save(NEWER + "\n" + OLDER);
        Activity activity = Robolectric.buildActivity(Activity.class).setup().get();
        AlertDialog shown = BookmarksPage.show(activity);
        assertNotNull(shown);
        assertTrue(shown.isShowing());
        shown.dismiss();

        LinearLayout list = new LinearLayout(activity);
        BookmarksPage.fill(activity, new AlertDialog.Builder(activity).create(), list);
        assertEquals(2, list.getChildCount());
        LinearLayout first = (LinearLayout) ((LinearLayout) list.getChildAt(0)).getChildAt(0);
        assertEquals("Anna", text(first, 0));
        assertEquals("a photo", text(first, 1));
        assertEquals("the message's date under it", 3, first.getChildCount());
        LinearLayout second = (LinearLayout) ((LinearLayout) list.getChildAt(1)).getChildAt(0);
        assertEquals("Friends", text(second, 0));
        assertEquals("Anna: hello", text(second, 1));

        assertTrue(first.performLongClick());
        assertEquals("Bookmark removed.", ShadowToast.getTextOfLatestToast());
        assertEquals(OLDER, Settings.BOOKMARKS.savedValue());
        assertEquals(1, list.getChildCount());

        TextView remove = (TextView) ((LinearLayout) list.getChildAt(0)).getChildAt(1);
        assertEquals("Remove", remove.getText().toString());
        assertTrue(remove.performClick());
        assertEquals("", Settings.BOOKMARKS.savedValue());
        assertEquals(1, list.getChildCount());
        assertEquals("No bookmarks yet. Long-press a message and tap Bookmark.",
                ((TextView) list.getChildAt(0)).getText().toString());
    }
}
