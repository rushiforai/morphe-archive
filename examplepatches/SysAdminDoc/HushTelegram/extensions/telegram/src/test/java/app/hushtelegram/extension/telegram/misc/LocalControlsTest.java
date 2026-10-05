/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Typeface;
import android.net.Uri;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.style.StyleSpan;
import android.view.View;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, shadows = LocalControlsTest.NativeMenu.class,
        instrumentedPackages = "app.hushtelegram.extension.telegram.misc")
public class LocalControlsTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Fixture tests verify these two bridges against each build's native overflow menu. */
    @Implements(value = LocalIds.class, isInAndroidSdk = false)
    public static class NativeMenu {
        static int adds, dismisses;
        @Implementation protected static View nativeAddRow(Object menu, String text) {
            adds++;
            TextView row = new TextView(((View) menu).getContext());
            row.setText(text);
            ((FrameLayout) menu).addView(row);
            return row;
        }
        @Implementation protected static void nativeDismiss(Object menu) { dismisses++; }
    }

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.NORMAL_PASTE);
        SettingReadsForTests.mend(Settings.SHOW_LOCAL_IDS);
        SettingReadsForTests.mend(Settings.DISABLE_DOUBLE_TAP_REACTIONS);
        Settings.NORMAL_PASTE.resetToDefault();
        Settings.SHOW_LOCAL_IDS.resetToDefault();
        Settings.DISABLE_DOUBLE_TAP_REACTIONS.resetToDefault();
        NativeMenu.adds = NativeMenu.dismisses = 0;
        HookStatus.clear();
    }

    @Test public void plainPasteRetainsWhitespaceUrlsAndSelectionWithoutRichSpans() {
        Settings.NORMAL_PASTE.save(true);
        String text = "  first\tsecond\n\nhttps://example.com/a?q=one%20two\n  ";
        SpannableString styled = new SpannableString(text);
        styled.setSpan(new StyleSpan(Typeface.BOLD), 2, 7, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        ClipData original = ClipData.newHtmlText("table", styled, "<table><tr><td><code>first</code></td></tr></table>");
        clipboard().setPrimaryClip(original);
        EditText editor = new EditText(context());
        editor.setText("before after");
        assertTrue(editor.requestFocus());
        editor.setSelection(7, 12);
        int action = NormalPaste.contextMenuAction(editor, android.R.id.paste);
        assertEquals(android.R.id.pasteAsPlainText, action);
        assertTrue(editor.onTextContextMenuItem(action));
        assertEquals("before " + text, editor.getText().toString());
        assertEquals(0, editor.getText().getSpans(0, editor.length(), StyleSpan.class).length);
        assertSame("the clipboard is not rewritten", original, clipboard().getPrimaryClip());
        assertEquals("<table><tr><td><code>first</code></td></tr></table>", original.getItemAt(0).getHtmlText());
    }

    @Test public void copyCutSelectionAndImagePasteKeepTheirOriginalActions() {
        Settings.NORMAL_PASTE.save(true);
        EditText editor = new EditText(context());
        editor.setText("keep copy cut");
        assertTrue(editor.requestFocus());
        editor.setSelection(5, 9);
        for (int action : new int[]{android.R.id.copy, android.R.id.cut, android.R.id.selectAll, android.R.id.pasteAsPlainText})
            assertEquals(action, NormalPaste.contextMenuAction(editor, action));
        assertTrue(editor.onTextContextMenuItem(NormalPaste.contextMenuAction(editor, android.R.id.copy)));
        assertEquals("copy", clipboard().getPrimaryClip().getItemAt(0).getText().toString());
        assertTrue(editor.onTextContextMenuItem(NormalPaste.contextMenuAction(editor, android.R.id.cut)));
        assertEquals("keep  cut", editor.getText().toString());
        ClipData image = new ClipData("image", new String[]{"image/png", "text/plain"},
                new ClipData.Item(Uri.parse("content://clipboard/image")));
        clipboard().setPrimaryClip(image);
        assertEquals(android.R.id.paste, NormalPaste.contextMenuAction(editor, android.R.id.paste));
        assertSame(image, clipboard().getPrimaryClip());
        assertEquals(android.R.id.paste, NormalPaste.contextMenuAction(null, android.R.id.paste));
    }

    @Test public void idsAreAnExplicitLocalRowAndCopyOnlyTheInspectedLongId() {
        Settings.SHOW_LOCAL_IDS.save(true);
        for (boolean user : new boolean[]{true, false}) {
            FrameLayout menu = new FrameLayout(context());
            long id = user ? 4123456789L : Long.MAX_VALUE;
            LocalIds.addToProfile(menu, user ? id : 0, user ? 0 : id);
            assertEquals(1, menu.getChildCount());
            TextView row = (TextView) menu.getChildAt(0);
            assertEquals((user ? "User ID " : "Chat ID ") + id, row.getText().toString());
            assertEquals((user ? "Copy user ID " : "Copy chat ID ") + id, row.getContentDescription());
            assertTrue(row.performClick());
            assertEquals(Long.toString(id), clipboard().getPrimaryClip().getItemAt(0).getText().toString());
            assertEquals(ClipDescription.MIMETYPE_TEXT_PLAIN, clipboard().getPrimaryClip().getDescription().getMimeType(0));
            assertEquals("ID copied", ShadowToast.getTextOfLatestToast());
        }
        assertEquals(2, NativeMenu.adds);
        assertEquals(2, NativeMenu.dismisses);
        String report = HookStatus.report().toString();
        assertFalse(report.contains("4123456789"));
        assertFalse(report.contains(Long.toString(Long.MAX_VALUE)));
        for (long[] invalid : new long[][]{{0, 0}, {1, 2}, {-1, 0}, {0, -1}, {1, -1}}) {
            FrameLayout menu = new FrameLayout(context());
            LocalIds.addToProfile(menu, invalid[0], invalid[1]);
            assertEquals(0, menu.getChildCount());
        }
        assertEquals(2, NativeMenu.adds);
    }

    @Test public void allEightSwitchCombinationsStayIndependent() {
        clipboard().setPrimaryClip(ClipData.newPlainText("text", "plain"));
        EditText editor = new EditText(context());
        for (boolean paste : new boolean[]{false, true}) for (boolean ids : new boolean[]{false, true})
            for (boolean reaction : new boolean[]{false, true}) {
                Settings.NORMAL_PASTE.save(paste);
                Settings.SHOW_LOCAL_IDS.save(ids);
                Settings.DISABLE_DOUBLE_TAP_REACTIONS.save(reaction);
                assertEquals(paste ? android.R.id.pasteAsPlainText : android.R.id.paste,
                        NormalPaste.contextMenuAction(editor, android.R.id.paste));
                FrameLayout menu = new FrameLayout(context());
                LocalIds.addToProfile(menu, 42, 0);
                assertEquals(ids ? 1 : 0, menu.getChildCount());
                assertEquals(reaction, DoubleTapReactions.stopReaction());
                assertEquals(paste, Settings.NORMAL_PASTE.savedValue());
                assertEquals(ids, Settings.SHOW_LOCAL_IDS.savedValue());
                assertEquals(reaction, Settings.DISABLE_DOUBLE_TAP_REACTIONS.savedValue());
            }
    }

    @Test public void pauseAndUnavailableSettingsRestoreStockAndDisableExistingIdCopy() {
        allOn();
        FrameLayout menu = new FrameLayout(context());
        LocalIds.addToProfile(menu, 42, 0);
        View row = menu.getChildAt(0);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            stock();
            row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(View.GONE, row.getVisibility());
            clipboard().setPrimaryClip(ClipData.newPlainText("sentinel", "unchanged"));
            row.performClick();
            assertEquals("unchanged", clipboard().getPrimaryClip().getItemAt(0).getText().toString());
            assertTrue(Settings.NORMAL_PASTE.savedValue());
            assertTrue(Settings.SHOW_LOCAL_IDS.savedValue());
            assertTrue(Settings.DISABLE_DOUBLE_TAP_REACTIONS.savedValue());
            PauseForTests.resume();
            row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(View.VISIBLE, row.getVisibility());
        }
        SettingsContextRule.withoutContext(() -> { stock(); row.getViewTreeObserver().dispatchOnPreDraw();
            assertEquals(View.GONE, row.getVisibility()); });
        Settings.SHOW_LOCAL_IDS.save(false);
        row.getViewTreeObserver().dispatchOnPreDraw();
        assertEquals(View.GONE, row.getVisibility());
    }

    @Test public void unreadableSwitchesAndNextGestureDoNotRetainAnEnabledDecision() {
        allOn();
        SettingReadsForTests.breakReads(Settings.NORMAL_PASTE);
        assertEquals(android.R.id.paste, NormalPaste.contextMenuAction(new EditText(context()), android.R.id.paste));
        assertFalse(HookStatus.missing(FamilyNames.NORMAL_PASTE).isEmpty());
        SettingReadsForTests.breakReads(Settings.SHOW_LOCAL_IDS);
        FrameLayout menu = new FrameLayout(context());
        LocalIds.addToProfile(menu, 42, 0);
        assertEquals(0, menu.getChildCount());
        assertFalse(HookStatus.missing(FamilyNames.SHOW_LOCAL_IDS).isEmpty());
        SettingReadsForTests.breakReads(Settings.DISABLE_DOUBLE_TAP_REACTIONS);
        assertFalse(DoubleTapReactions.stopReaction());
        assertFalse(HookStatus.missing(FamilyNames.DISABLE_DOUBLE_TAP_REACTIONS).isEmpty());
        SettingReadsForTests.mend(Settings.DISABLE_DOUBLE_TAP_REACTIONS);
        assertTrue(DoubleTapReactions.stopReaction());
        Settings.DISABLE_DOUBLE_TAP_REACTIONS.save(false);
        assertFalse(DoubleTapReactions.stopReaction());
        assertFalse(DoubleTapReactions.stopReaction());
    }

    private static Context context() { return RuntimeEnvironment.getApplication(); }
    private static ClipboardManager clipboard() { return (ClipboardManager) context().getSystemService(Context.CLIPBOARD_SERVICE); }
    private static void allOn() {
        Settings.NORMAL_PASTE.save(true);
        Settings.SHOW_LOCAL_IDS.save(true);
        Settings.DISABLE_DOUBLE_TAP_REACTIONS.save(true);
        clipboard().setPrimaryClip(ClipData.newPlainText("text", "plain"));
    }
    private static void stock() {
        assertEquals(android.R.id.paste, NormalPaste.contextMenuAction(new EditText(context()), android.R.id.paste));
        assertFalse(DoubleTapReactions.stopReaction());
        FrameLayout menu = new FrameLayout(context());
        LocalIds.addToProfile(menu, 42, 0);
        assertEquals(0, menu.getChildCount());
    }
}
