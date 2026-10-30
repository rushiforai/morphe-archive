package app.hushmessenger.extension;

import android.app.Dialog;
import android.graphics.Insets;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.ArrayList;
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

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36}, qualifiers = "en-rUS-w390dp-h844dp-mdpi")
public class SettingsDialogTest {
    private MessageLog.Vault originalVault;

    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        originalVault = MessageLog.vault;
        MessageLog.vault = new MessageLogTest.SoftwareVault();
        MessageLog.clear();
    }

    @After public void closeDialog() {
        Dialog dialog = ShadowDialog.getLatestDialog();
        if (dialog != null && dialog.isShowing()) dialog.dismiss();
        MessageLog.clear();
        MessageLog.vault = originalVault;
    }

    private Dialog open(SettingsActivity activity) {
        activity.getWindow().getDecorView().findViewWithTag("auto_reply_edit").performClick();
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertTrue(dialog.isShowing());
        return dialog;
    }

    @Test public void anIncompleteRuleStaysOpenUntilItsReplyIsWritten() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Dialog dialog = open(screen.get());
            View root = dialog.getWindow().getDecorView();
            EditText words = root.findViewWithTag("auto_reply_when"), reply = root.findViewWithTag("auto_reply_reply");
            words.setText("hello");
            root.findViewWithTag("auto_reply_save").performClick();
            assertTrue(dialog.isShowing());
            assertTrue(AutoReply.rules(Settings.preferences).isEmpty());
            assertEquals(View.VISIBLE, root.findViewWithTag("auto_reply_error").getVisibility());
            assertTrue(reply.hasFocus());
            reply.setText("Hi there");
            assertEquals(View.GONE, root.findViewWithTag("auto_reply_error").getVisibility());
            root.findViewWithTag("auto_reply_save").performClick();
            assertFalse(dialog.isShowing());
            assertEquals("Hi there", AutoReply.rules(Settings.preferences).get(0).reply);
        }
    }

    @Test public void unfinishedRepliesAndSelectionSurviveRecreationWithoutSaving() {
        Bundle state = new Bundle();
        Dialog old;
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            old = open(screen.get());
            View root = old.getWindow().getDecorView();
            ((EditText) root.findViewWithTag("auto_reply_when")).setText(" hello, hours ");
            EditText reply = root.findViewWithTag("auto_reply_reply");
            reply.setText("Draft with trailing space ");
            reply.requestFocus();
            reply.setSelection(3, 8);
            ((CheckBox) root.findViewWithTag("auto_reply_groups")).setChecked(true);
            screen.get().onSaveInstanceState(state);
        }
        assertFalse(old.isShowing());
        assertTrue(AutoReply.rules(Settings.preferences).isEmpty());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).create(state).start().resume().visible()) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Dialog restored = ShadowDialog.getLatestDialog();
            assertTrue(restored.isShowing());
            View root = restored.getWindow().getDecorView();
            EditText words = root.findViewWithTag("auto_reply_when"), reply = root.findViewWithTag("auto_reply_reply");
            assertEquals(" hello, hours ", words.getText().toString());
            assertEquals("Draft with trailing space ", reply.getText().toString());
            assertEquals(3, reply.getSelectionStart());
            assertEquals(8, reply.getSelectionEnd());
            assertTrue(reply.hasFocus());
            assertTrue(((CheckBox) root.findViewWithTag("auto_reply_groups")).isChecked());
            assertTrue(AutoReply.rules(Settings.preferences).isEmpty());
        }
    }

    @Test public void cancelLeavesPreviouslySavedRepliesAlone() {
        AutoReply.save(Settings.preferences, List.of(new AutoReply.Rule("hello", "Saved reply")), false);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Dialog dialog = open(screen.get());
            View root = dialog.getWindow().getDecorView();
            ((EditText) root.findViewWithTag("auto_reply_reply")).setText("Discard this");
            root.findViewWithTag("auto_reply_cancel").performClick();
            assertFalse(dialog.isShowing());
            assertEquals("Saved reply", AutoReply.rules(Settings.preferences).get(0).reply);
        }
    }

    @Test public void theRuleLimitDisablesAddingAndRemovalRestoresIt() {
        List<AutoReply.Rule> rules = new ArrayList<>();
        for (int i = 0; i < AutoReply.MAX_RULES; i++) rules.add(new AutoReply.Rule("word" + i, "Reply " + i));
        AutoReply.save(Settings.preferences, rules, false);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = open(screen.get()).getWindow().getDecorView();
            Button add = root.findViewWithTag("auto_reply_add");
            assertFalse(add.isEnabled());
            root.findViewWithTag("auto_reply_remove").performClick();
            assertTrue(add.isEnabled());
            add.performClick();
            assertFalse(add.isEnabled());
        }
    }

    @Test public void shortLargeTextSheetsScrollTheirActionsIntoReach() {
        RuntimeEnvironment.setFontScale(2f);
        RuntimeEnvironment.setQualifiers("en-rUS-w320dp-h300dp-mdpi");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = open(screen.get()).getWindow().getDecorView();
            View sheet = root.findViewWithTag("settings_dialog");
            sheet.measure(View.MeasureSpec.makeMeasureSpec(320, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(300, View.MeasureSpec.EXACTLY));
            sheet.layout(0, 0, 320, 300);
            ScrollView scroll = root.findViewWithTag("dialog_scroll");
            View actions = root.findViewWithTag("dialog_actions");
            assertSame(scroll.getChildAt(0), actions.getParent());
            assertEquals(LinearLayout.VERTICAL, ((LinearLayout) actions).getOrientation());
            scroll.fullScroll(View.FOCUS_DOWN);
            assertTrue(scroll.getScrollY() > 0);
            assertTrue(root.findViewWithTag("auto_reply_save").getWidth() <= 280);
            if (Build.VERSION.SDK_INT >= 30) {
                WindowInsets insets = new WindowInsets.Builder().setInsets(WindowInsets.Type.systemBars(), Insets.of(0, 24, 0, 16))
                    .setInsets(WindowInsets.Type.ime(), Insets.of(0, 0, 0, 180)).build();
                sheet.dispatchApplyWindowInsets(insets);
                assertEquals(196, sheet.getPaddingBottom());
                assertEquals(44, sheet.getPaddingTop());
            }
        }
    }

    @Test public void rtlSheetsSetBothLayoutAndTextDirection() {
        RuntimeEnvironment.setQualifiers("ar-rXB-w390dp-h844dp-mdpi");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View sheet = open(screen.get()).getWindow().getDecorView().findViewWithTag("settings_dialog");
            assertEquals(View.LAYOUT_DIRECTION_RTL, sheet.getLayoutDirection());
            assertEquals(View.TEXT_DIRECTION_RTL, sheet.getTextDirection());
        }
    }

    @Test public void userContentKeepsItsOwnParagraphDirectionInRtlSheets() throws Exception {
        RuntimeEnvironment.setQualifiers("ar-rXB-w390dp-h844dp-mdpi");
        String latin = "Meet at 5 p.m.!", arabic = "مرحبا بالعالم!";
        MessageLog.write(Settings.appContext, List.of(new MessageLog.Entry(System.currentTimeMillis(), "t", latin)));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Dialog dialog = open(screen.get());
            View root = dialog.getWindow().getDecorView();
            EditText field = root.findViewWithTag("auto_reply_reply");
            field.setText(latin);
            layout(root);
            assertEquals(1, field.getLayout().getParagraphDirection(0));
            field.setText(arabic);
            layout(root);
            assertEquals(-1, field.getLayout().getParagraphDirection(0));
            dialog.dismiss();
            screen.get().getWindow().getDecorView().findViewWithTag("message_log_view").performClick();
            root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            TextView body = awaitText(root, latin);
            layout(root);
            assertEquals(1, body.getLayout().getParagraphDirection(0));
            assertTrue(body.isTextSelectable());
        }
    }

    @Test public void aLongLogBuildsItsCardsAPageAtATimeAsItScrolls() throws Exception {
        int page = MessageLogSheet.MESSAGE_LOG_PAGE, count = 3 * page + 5;
        long now = System.currentTimeMillis();
        List<MessageLog.Entry> entries = new ArrayList<>();
        for (int i = 0; i < count; i++) entries.add(new MessageLog.Entry(now - (count - i) * 1000L, "t", "Message " + i));
        MessageLog.write(Settings.appContext, entries);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("message_log_view").performClick();
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            awaitText(root, "Message " + (count - 1));
            layout(root);
            ScrollView scroll = root.findViewWithTag("dialog_scroll");
            LinearLayout list = (LinearLayout) ((ViewGroup) scroll.getChildAt(0)).getChildAt(0);
            // The retention line, then one page.
            assertEquals(1 + page, list.getChildCount());
            for (int built = page; built < count; built = Math.min(count, built + page)) {
                scroll.scrollTo(0, scroll.getChildAt(0).getHeight());
                // Scrolled twice before the page it asked for is built, it still gets one page.
                scroll.scrollTo(0, scroll.getScrollY() - 1);
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                assertEquals(1 + Math.min(count, built + page), list.getChildCount());
                // Scrolled again before that page is laid out, it doesn't take it for the end and pull in the next.
                scroll.scrollTo(0, scroll.getScrollY() - 1);
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                assertEquals(1 + Math.min(count, built + page), list.getChildCount());
                layout(root);
            }
            // Every entry is reachable, newest first.
            for (int i = 0; i < count; i++) assertNotNull(findText(list.getChildAt(1 + i), "Message " + (count - 1 - i)));
        }
    }

    @Test public void aClearedLogNeverBuildsThePageItHadWaiting() throws Exception {
        int page = MessageLogSheet.MESSAGE_LOG_PAGE, count = 2 * page + 3;
        long now = System.currentTimeMillis();
        List<MessageLog.Entry> entries = new ArrayList<>();
        for (int i = 0; i < count; i++) entries.add(new MessageLog.Entry(now - (count - i) * 1000L, "t", "Message " + i));
        MessageLog.write(Settings.appContext, entries);
        // Clear is held while its key goes, which keeps the log on its loading line.
        MessageLog.Vault working = MessageLog.vault;
        CountDownLatch release = new CountDownLatch(1), finished = new CountDownLatch(1);
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { return working.seal(plain); }
            @Override public byte[] open(byte[] blob) throws Exception { return working.open(blob); }
            @Override public void forget() throws Exception {
                try {
                    if (!release.await(5, TimeUnit.SECONDS)) throw new AssertionError("Clear wasn't released");
                    working.forget();
                } finally { finished.countDown(); }
            }
        };
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("message_log_view").performClick();
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            awaitText(root, "Message " + (count - 1));
            layout(root);
            // The second page waits to be asked for when Clear starts.
            root.findViewWithTag("message_log_dialog_clear").performClick();
            awaitText(root, new SettingsText(screen.get()).get("message_log_loading"));
            // The short loading line leaves the end in view, which is what asks for a waiting page.
            layout(root);
            root.getViewTreeObserver().dispatchOnGlobalLayout();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            for (int i = 0; i < count; i++) assertNull(findText(root, "Message " + i));
            release.countDown();
            assertTrue(finished.await(5, TimeUnit.SECONDS));
            awaitText(root, new SettingsText(screen.get()).get("message_log_empty"));
        } finally {
            release.countDown();
            finished.await(5, TimeUnit.SECONDS);
            MessageLog.vault = working;
        }
    }

    @Test public void aWindowTallerThanAPageFillsWithoutAScroll() throws Exception {
        int page = MessageLogSheet.MESSAGE_LOG_PAGE, count = 10 * page;
        long now = System.currentTimeMillis();
        List<MessageLog.Entry> entries = new ArrayList<>();
        for (int i = 0; i < count; i++) entries.add(new MessageLog.Entry(now - (count - i) * 1000L, "t", "Message " + i));
        MessageLog.write(Settings.appContext, entries);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("message_log_view").performClick();
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            awaitText(root, "Message " + (count - 1));
            layout(root);
            ScrollView scroll = root.findViewWithTag("dialog_scroll");
            View content = scroll.getChildAt(0);
            LinearLayout list = (LinearLayout) ((ViewGroup) content).getChildAt(0);
            assertEquals(1 + page, list.getChildCount());
            // A window three first pages taller than the phone's, like a tablet's, shows the first page whole.
            int tall = 844 + 3 * content.getHeight();
            for (int pass = 0, before = -1; pass < 30 && list.getChildCount() != before; pass++) {
                before = list.getChildCount();
                layout(root, tall);
                root.getViewTreeObserver().dispatchOnGlobalLayout();
                Shadows.shadowOf(Looper.getMainLooper()).idle();
            }
            layout(root, tall);
            int built = list.getChildCount() - 1;
            assertTrue("Only " + built + " built", built > page);
            // It stops once the end is a screen away, well short of the whole log.
            assertTrue("Built " + built + " of " + count, built < count);
            assertTrue(content.getBottom() - (scroll.getScrollY() + scroll.getHeight()) >= scroll.getHeight());
        }
    }

    @Test public void aPageAskedForJustBeforeTheLogClosesIsNotBuilt() throws Exception {
        int page = MessageLogSheet.MESSAGE_LOG_PAGE, count = 2 * page + 3;
        long now = System.currentTimeMillis();
        List<MessageLog.Entry> entries = new ArrayList<>();
        for (int i = 0; i < count; i++) entries.add(new MessageLog.Entry(now - (count - i) * 1000L, "t", "Message " + i));
        MessageLog.write(Settings.appContext, entries);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View settings = screen.get().getWindow().getDecorView();
            settings.findViewWithTag("message_log_view").performClick();
            Dialog first = ShadowDialog.getLatestDialog();
            View root = first.getWindow().getDecorView();
            awaitText(root, "Message " + (count - 1));
            layout(root);
            ScrollView scroll = root.findViewWithTag("dialog_scroll");
            // The next page is asked for, then the log closes before it's built.
            scroll.scrollTo(0, scroll.getChildAt(0).getHeight());
            first.dismiss();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            LinearLayout closed = (LinearLayout) ((ViewGroup) scroll.getChildAt(0)).getChildAt(0);
            assertEquals(1 + page, closed.getChildCount());
            settings.findViewWithTag("message_log_view").performClick();
            Dialog second = ShadowDialog.getLatestDialog();
            assertNotSame(first, second);
            View reopened = second.getWindow().getDecorView();
            awaitText(reopened, "Message " + (count - 1));
            layout(reopened);
            ScrollView again = reopened.findViewWithTag("dialog_scroll");
            assertEquals(1 + page, ((ViewGroup) ((ViewGroup) again.getChildAt(0)).getChildAt(0)).getChildCount());
        }
    }

    @Test public void longRepliesGrowAndTheSheetCanReachTheirLastLine() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = open(screen.get()).getWindow().getDecorView();
            EditText reply = root.findViewWithTag("auto_reply_reply");
            reply.setText("First line\nSecond line");
            layout(root);
            int shortHeight = reply.getHeight();
            reply.setText("A reply line\n".repeat(12) + "Last line");
            layout(root);
            assertEquals(13, reply.getLineCount());
            assertTrue(reply.getHeight() > shortHeight * 3);
            assertEquals(0, reply.getScrollY());
            ScrollView scroll = root.findViewWithTag("dialog_scroll");
            scroll.setSmoothScrollingEnabled(false);
            scroll.fullScroll(View.FOCUS_DOWN);
            assertTrue(scroll.getScrollY() > 0);
            android.graphics.Rect lastLine = new android.graphics.Rect(0, reply.getTotalPaddingTop() + reply.getLayout().getLineTop(12),
                reply.getWidth(), reply.getTotalPaddingTop() + reply.getLayout().getLineBottom(12));
            // View translates the supplied rectangle into ancestor coordinates while scrolling.
            reply.requestRectangleOnScreen(new android.graphics.Rect(lastLine), true);
            android.graphics.Rect visible = new android.graphics.Rect();
            assertTrue("The last reply line is visible", reply.getGlobalVisibleRect(visible));
            int[] position = new int[2];
            reply.getLocationOnScreen(position);
            assertTrue(position[1] + lastLine.bottom <= visible.bottom);
        }
    }

    @Test public void aClearFailureAfterRotationStaysVisibleAndCanBeRetried() throws Exception {
        CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1), finished = new CountDownLatch(1);
        MessageLog.Vault working = MessageLog.vault;
        MessageLog.write(Settings.appContext, List.of(new MessageLog.Entry(System.currentTimeMillis(), "t", "A saved message")));
        MessageLog.vault = new MessageLog.Vault() {
            @Override public byte[] seal(byte[] plain) throws Exception { return working.seal(plain); }
            @Override public byte[] open(byte[] blob) throws Exception { return working.open(blob); }
            @Override public void forget() throws Exception {
                started.countDown();
                try {
                    if (!release.await(5, TimeUnit.SECONDS)) throw new AssertionError("Clear wasn't released");
                    throw new java.io.IOException("test key deletion failure");
                } finally { finished.countDown(); }
            }
        };
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("message_log_view").performClick();
            Dialog old = ShadowDialog.getLatestDialog();
            awaitText(old.getWindow().getDecorView(), "A saved message");
            old.getWindow().getDecorView().findViewWithTag("message_log_dialog_clear").performClick();
            assertTrue(started.await(5, TimeUnit.SECONDS));
            screen.recreate();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertFalse(old.isShowing());
            Dialog restored = ShadowDialog.getLatestDialog();
            assertTrue(restored.isShowing());
            assertFalse(restored.getWindow().getDecorView().findViewWithTag("message_log_dialog_clear").isEnabled());
            release.countDown();
            assertTrue(finished.await(5, TimeUnit.SECONDS));
            View root = restored.getWindow().getDecorView();
            awaitText(root, new SettingsText(screen.get()).get("message_log_clear_failed"));
            assertTrue(root.findViewWithTag("message_log_dialog_clear").isEnabled());
            MessageLog.vault = working;
            root.findViewWithTag("message_log_retry").performClick();
            awaitText(root, new SettingsText(screen.get()).get("message_log_empty"));
            assertFalse(root.findViewWithTag("message_log_dialog_clear").isEnabled());
        } finally {
            release.countDown();
            assertTrue(finished.await(5, TimeUnit.SECONDS));
            MessageLog.vault = working;
        }
    }

    /**
     * Before Android 13 the log stays out of Recents through FLAG_SECURE on the screen's window and its own, both set
     * before it loads and kept through a rotation. Closing it leaves a flag the screen already had. Android 13 and newer
     * hide it from Recents without the flag, so screenshots still work there.
     */
    @Test public void theLogStaysOutOfRecentsAndLeavesExistingSecureFlagsAlone() {
        int secure = android.view.WindowManager.LayoutParams.FLAG_SECURE;
        boolean legacy = Build.VERSION.SDK_INT < 33;
        for (boolean alreadySecure : new boolean[] {false, true}) {
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                android.view.Window window = screen.get().getWindow();
                if (alreadySecure) window.addFlags(secure);
                window.getDecorView().findViewWithTag("message_log_view").performClick();
                Dialog dialog = ShadowDialog.getLatestDialog();
                assertEquals(legacy || alreadySecure, (window.getAttributes().flags & secure) != 0);
                assertEquals(legacy, (dialog.getWindow().getAttributes().flags & secure) != 0);
                dialog.getWindow().getDecorView().findViewWithTag("message_log_dialog_close").performClick();
                // Dialog delivers its dismiss listener as a message, so the looper runs it before the flag is checked.
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                assertFalse(dialog.isShowing());
                assertEquals(alreadySecure, (window.getAttributes().flags & secure) != 0);
            }
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("message_log_view").performClick();
            screen.recreate();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Dialog restored = ShadowDialog.getLatestDialog();
            assertTrue(restored.isShowing());
            android.view.Window window = screen.get().getWindow();
            assertEquals(legacy, (window.getAttributes().flags & secure) != 0);
            assertEquals(legacy, (restored.getWindow().getAttributes().flags & secure) != 0);
            restored.dismiss();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(0, window.getAttributes().flags & secure);
        }
    }

    @Test public void aSetAsideLogShowsANoticeAboveTheNewMessagesInsteadOfAFailure() throws Exception {
        java.io.File aside = new java.io.File(Settings.appContext.getFilesDir(), MessageLog.DAMAGED);
        java.nio.file.Files.write(new java.io.File(Settings.appContext.getFilesDir(), MessageLog.FILE).toPath(), new byte[] {1, 2, 3});
        assertTrue(MessageLog.loadResult().setAside);
        MessageLog.write(Settings.appContext, List.of(new MessageLog.Entry(System.currentTimeMillis(), "t", "A newer message")));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("message_log_view").performClick();
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            SettingsText text = new SettingsText(screen.get());
            awaitText(root, text.get("message_log_set_aside"));
            awaitText(root, "A newer message");
            assertNull(findText(root, text.get("message_log_load_failed")));
            assertTrue(root.findViewWithTag("message_log_dialog_clear").isEnabled());
            assertTrue("the retention line keeps a gap under the notice", topMargin(findText(root, text.get("message_log_retention"))) > 0);
            root.findViewWithTag("message_log_set_aside_remove").performClick();
            awaitGone(root, "message_log_set_aside_remove");
            awaitText(root, "A newer message");
            assertNull(root.findViewWithTag("message_log_set_aside_remove"));
            assertEquals(0, topMargin(findText(root, text.get("message_log_retention"))));
            assertFalse(aside.exists());
        }
    }

    /** Clear empties the file at once and keeps a copy in memory, which Undo writes back under anything logged since. */
    @Test public void undoPutsBackWhatClearTookUnderAnythingLoggedSince() throws Exception {
        long now = System.currentTimeMillis();
        MessageLog.write(Settings.appContext, List.of(new MessageLog.Entry(now - 2000, "t", "Older message"),
            new MessageLog.Entry(now - 1000, "t", "Newer message")));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View settings = screen.get().getWindow().getDecorView();
            SettingsText text = new SettingsText(screen.get());
            settings.findViewWithTag("message_log_view").performClick();
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            awaitText(root, "Newer message");
            root.findViewWithTag("message_log_dialog_clear").performClick();
            awaitText(root, text.get("message_log_empty"));
            assertTrue(MessageLog.entries().isEmpty());
            Button offer = settings.findViewWithTag("undo");
            assertEquals(View.VISIBLE, offer.getVisibility());
            assertEquals("Undo Clear log", offer.getText().toString());
            MessageLog.write(Settings.appContext, List.of(new MessageLog.Entry(now, "t", "After the clear")));
            root.findViewWithTag("message_log_undo").performClick();
            assertEquals(View.GONE, offer.getVisibility());
            awaitText(root, "Older message");
            List<String> back = new ArrayList<>();
            for (MessageLog.Entry entry : MessageLog.entries()) back.add(entry.text);
            assertEquals(List.of("After the clear", "Newer message", "Older message"), back);
            assertEquals(text.get("message_log_restored"), org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
            assertNull(root.findViewWithTag("message_log_undo"));
        }
    }

    @Test public void aClearIsFinalOnceUndoRunsOutOrSettingsClose() throws Exception {
        for (boolean close : new boolean[] {false, true}) {
            MessageLog.write(Settings.appContext, List.of(new MessageLog.Entry(System.currentTimeMillis(), "t", "A saved message")));
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View settings = screen.get().getWindow().getDecorView();
                settings.findViewWithTag("message_log_view").performClick();
                Dialog log = ShadowDialog.getLatestDialog();
                View root = log.getWindow().getDecorView();
                awaitText(root, "A saved message");
                root.findViewWithTag("message_log_dialog_clear").performClick();
                awaitText(root, new SettingsText(screen.get()).get("message_log_empty"));
                assertNotNull(root.findViewWithTag("message_log_undo"));
                if (close) {
                    log.dismiss();
                    screen.pause().stop();
                    screen.start().resume();
                } else {
                    // With the sheet up, a frame moves Robolectric's clock about 16 ms past an idleFor, so this stays a second inside.
                    Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(SettingsActivity.UNDO_MILLIS - 1000));
                    assertNotNull(root.findViewWithTag("message_log_undo"));
                    assertEquals(View.VISIBLE, settings.findViewWithTag("undo").getVisibility());
                    Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(1000));
                    awaitGone(root, "message_log_undo");
                }
                assertEquals(View.GONE, settings.findViewWithTag("undo").getVisibility());
                // A hidden button still takes performClick, so this shows the copy is gone, not just the button.
                settings.findViewWithTag("undo").performClick();
                for (int wait = 0; wait < 30; wait++) {
                    Shadows.shadowOf(Looper.getMainLooper()).idle();
                    Thread.sleep(10);
                }
                assertTrue(MessageLog.entries().isEmpty());
            }
        }
    }

    /** Settings that stop while a Clear runs make it final, even when they're back before it ends. */
    @Test public void aClearStillRunningWhenSettingsStopOffersNoUndo() throws Exception {
        MessageLog.Vault working = MessageLog.vault;
        MessageLog.write(Settings.appContext, List.of(new MessageLog.Entry(System.currentTimeMillis(), "t", "A saved message")));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View settings = screen.get().getWindow().getDecorView();
            settings.findViewWithTag("message_log_view").performClick();
            View root = ShadowDialog.getLatestDialog().getWindow().getDecorView();
            awaitText(root, "A saved message");
            CountDownLatch release = new CountDownLatch(1);
            // Holds the log's worker, so the clear is still running across the stop and start.
            MessageLog.vault = new MessageLog.Vault() {
                @Override public byte[] seal(byte[] plain) throws Exception { return working.seal(plain); }
                @Override public byte[] open(byte[] blob) throws Exception {
                    release.await(5, TimeUnit.SECONDS);
                    return working.open(blob);
                }
                @Override public void forget() throws Exception { working.forget(); }
            };
            try {
                root.findViewWithTag("message_log_dialog_clear").performClick();
                screen.pause().stop();
                screen.start().resume();
                release.countDown();
                awaitText(root, new SettingsText(screen.get()).get("message_log_empty"));
            } finally {
                release.countDown();
                MessageLog.vault = working;
            }
            assertTrue(MessageLog.entries().isEmpty());
            assertEquals(View.GONE, settings.findViewWithTag("undo").getVisibility());
            assertNull(root.findViewWithTag("message_log_undo"));
        }
    }

    private static void awaitGone(View root, String tag) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        do {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            if (root.findViewWithTag(tag) == null) return;
            Thread.sleep(10);
        } while (System.nanoTime() < deadline);
        throw new AssertionError("View didn't go away: " + tag);
    }

    private static void layout(View root) { layout(root, 844); }

    private static void layout(View root, int height) {
        for (int pass = 0; pass < 2; pass++) {
            root.measure(View.MeasureSpec.makeMeasureSpec(390, View.MeasureSpec.EXACTLY), View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
            root.layout(0, 0, 390, height);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private static TextView awaitText(View root, String value) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        do {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            TextView match = findText(root, value);
            if (match != null) return match;
            Thread.sleep(10);
        } while (System.nanoTime() < deadline);
        throw new AssertionError("Text didn't appear: " + value);
    }

    private static int topMargin(View view) {
        return ((ViewGroup.MarginLayoutParams) view.getLayoutParams()).topMargin;
    }

    private static TextView findText(View root, String value) {
        if (root instanceof TextView && value.contentEquals(((TextView) root).getText())) return (TextView) root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView match = findText(group.getChildAt(i), value);
                if (match != null) return match;
            }
        }
        return null;
    }
}
