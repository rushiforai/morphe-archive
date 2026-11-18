package app.hushmessenger.extension;

import android.app.Application;
import android.app.Dialog;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.util.List;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;

/** The auto reply sheet's own lines: the switch being off, how many replies there are, and each one's number. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class AutoReplySheetTest {
    private SettingsText text;

    @Before public void reset() {
        Application app = RuntimeEnvironment.getApplication();
        // The settings screen reads the installed controls out of the app's own manifest when it opens.
        PackageInfo info = Shadows.shadowOf(app.getPackageManager()).getInternalMutablePackageInfo(app.getPackageName());
        info.applicationInfo.metaData = new Bundle();
        info.applicationInfo.metaData.putBoolean("hush.feature." + AutoReply.KEY, true);
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
        text = new SettingsText(app);
    }

    @After public void closeDialog() {
        Dialog dialog = ShadowDialog.getLatestDialog();
        if (dialog != null && dialog.isShowing()) dialog.dismiss();
    }

    private static View open(SettingsActivity activity) {
        activity.getWindow().getDecorView().findViewWithTag("auto_reply_edit").performClick();
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertTrue(dialog.isShowing());
        return dialog.getWindow().getDecorView();
    }

    private static String words(View root, String tag) {
        return ((TextView) root.findViewWithTag(tag)).getText().toString();
    }

    /** The cards in the order they're listed. A card's number sits right in it. */
    private static ViewGroup cards(View root) {
        return (ViewGroup) root.findViewWithTag("auto_reply_number").getParent().getParent();
    }

    private String count(int replies) {
        return text.get("auto_reply_count", text.number(replies), text.number(AutoReply.MAX_RULES));
    }

    @Test public void withTheSwitchOffTheSheetSaysSoAndStartsWithOneEmptyReply() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = open(screen.get());
            assertEquals(text.get("auto_reply_off"), words(root, "auto_reply_off"));
            assertEquals(count(1), words(root, "auto_reply_count"));
            assertEquals(text.get("auto_reply_number", text.number(1)), words(root, "auto_reply_number"));
            // The picture row is only there where Messenger can send a picture as a reply.
            if (AutoReplyPicture.supported()) {
                assertEquals("A new reply has no picture yet", text.get("auto_reply_picture_none"), words(root, "auto_reply_picture_status"));
            } else {
                assertNull(root.findViewWithTag("auto_reply_picture_status"));
            }
        }
    }

    @Test public void withTheSwitchOnTheSheetListsTheSavedRepliesWithoutTheNotice() {
        Settings.preferences.edit().putBoolean(AutoReply.KEY, true).commit();
        AutoReply.save(Settings.preferences, List.of(new AutoReply.Rule("hi", "Hey!"), new AutoReply.Rule("", "Busy now")), false);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = open(screen.get());
            assertNull(root.findViewWithTag("auto_reply_off"));
            assertEquals(count(2), words(root, "auto_reply_count"));
            ViewGroup cards = cards(root);
            assertEquals(2, cards.getChildCount());
            for (int i = 0; i < 2; i++) {
                assertEquals(text.get("auto_reply_number", text.number(i + 1)), words(cards.getChildAt(i), "auto_reply_number"));
            }
        }
    }

    @Test public void addingStopsAtTheLimitAndRemovingNumbersTheRestAgain() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = open(screen.get());
            View add = root.findViewWithTag("auto_reply_add");
            for (int i = 1; i < AutoReply.MAX_RULES; i++) add.performClick();
            ViewGroup cards = cards(root);
            assertEquals(AutoReply.MAX_RULES, cards.getChildCount());
            assertEquals(count(AutoReply.MAX_RULES), words(root, "auto_reply_count"));
            assertFalse("Full: no more to add", add.isEnabled());
            add.performClick();
            assertEquals(AutoReply.MAX_RULES, cards.getChildCount());

            View second = cards.getChildAt(1);
            View removeFirst = cards.getChildAt(0).findViewWithTag("auto_reply_remove");
            assertEquals(text.get("auto_reply_remove_number", text.number(1)), removeFirst.getContentDescription().toString());
            removeFirst.performClick();
            assertEquals(AutoReply.MAX_RULES - 1, cards.getChildCount());
            assertSame(second, cards.getChildAt(0));
            assertEquals("The second is the first now", text.get("auto_reply_number", text.number(1)), words(second, "auto_reply_number"));
            assertEquals(text.get("auto_reply_remove_number", text.number(1)),
                second.findViewWithTag("auto_reply_remove").getContentDescription().toString());
            assertEquals(count(AutoReply.MAX_RULES - 1), words(root, "auto_reply_count"));
            assertTrue(add.isEnabled());
            assertTrue("Focus moves to the card that took its place", second.findViewWithTag("auto_reply_when").isFocused());

            while (cards.getChildCount() > 0) cards.getChildAt(0).findViewWithTag("auto_reply_remove").performClick();
            assertEquals(count(0), words(root, "auto_reply_count"));
            // A button takes focus only from a keyboard or D-pad. After a tap the screen is in touch mode and nothing does.
            if (!add.isInTouchMode()) assertTrue("With none left, focus goes to Add", add.isFocused());
        }
    }
}
