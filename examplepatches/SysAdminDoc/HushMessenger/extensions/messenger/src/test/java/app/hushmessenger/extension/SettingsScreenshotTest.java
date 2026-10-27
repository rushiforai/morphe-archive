package app.hushmessenger.extension;

import android.app.Dialog;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.EditText;
import android.widget.ScrollView;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.concurrent.TimeUnit;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowDialog;
import static org.junit.Assert.*;
import static org.junit.Assume.assumeTrue;

/** Optional native renders of production settings. Set HUSH_SCREENSHOTS to the PNG output directory. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36, qualifiers = "en-rUS-w390dp-h844dp-mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SettingsScreenshotTest {
    private static final int WIDTH = 390, HEIGHT = 844;
    private Path output;
    private PackageInfo installedPackage;
    private Bundle originalMetadata;
    private boolean originalStarted, originalFailed;
    private MessageLog.Vault originalVault;

    @Before public void prepareProductionFixture() throws Exception {
        String directory = System.getenv("HUSH_SCREENSHOTS");
        assumeTrue("Set HUSH_SCREENSHOTS to export native settings renders", directory != null && !directory.trim().isEmpty());
        output = Paths.get(directory).toAbsolutePath();
        Files.createDirectories(output);
        originalStarted = HostScreens.started;
        originalFailed = HostScreens.failed;
        var app = RuntimeEnvironment.getApplication();
        installedPackage = app.getPackageManager().getPackageInfo(app.getPackageName(),
            PackageManager.GET_META_DATA | PackageManager.GET_PROVIDERS | PackageManager.GET_ACTIVITIES);
        originalMetadata = installedPackage.applicationInfo.metaData;
        Bundle metadata = originalMetadata == null ? new Bundle() : new Bundle(originalMetadata);
        metadata.remove("hush.preview");
        metadata.putBoolean("hush.native_bubble_routes", true);
        metadata.putBoolean("hush.feature.menu_row", true);
        for (String[] spec : SettingsActivity.CONTROLS) metadata.putBoolean("hush.feature." + spec[0], true);
        installedPackage.applicationInfo.metaData = metadata;
        Shadows.shadowOf(app.getPackageManager()).installPackage(installedPackage);
        Shadows.shadowOf(app.getPackageManager()).addActivityIfNotPresent(
            new android.content.ComponentName(app.getPackageName(), SettingsActivity.DRAWER_ALIAS));
        Settings.initialize(app);
        Settings.preferences.edit().clear().commit();
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        originalVault = MessageLog.vault;
        MessageLog.vault = new MessageLogTest.SoftwareVault();
        MessageLog.clear();
        CrashGuard.resetForTests();
        HostScreens.started = true;
        HostScreens.failed = false;
        // The state renders reach rows in every section; the README pair opens only its own.
        OpenSections.all();
    }

    @After public void restoreFixtureMetadata() {
        if (installedPackage == null) return;
        Dialog dialog = ShadowDialog.getLatestDialog();
        if (dialog != null && dialog.isShowing()) dialog.dismiss();
        MessageLog.clear();
        MessageLog.vault = originalVault;
        installedPackage.applicationInfo.metaData = originalMetadata;
        var app = RuntimeEnvironment.getApplication();
        Shadows.shadowOf(app.getPackageManager()).installPackage(installedPackage);
        Settings.preferences.edit().clear().commit();
        Settings.initialize(app);
        // The failing vaults above record message_log failures, which a later test in this sandbox would read as its own.
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        OpenSections.only();
        HostScreens.started = originalStarted;
        HostScreens.failed = originalFailed;
    }

    @Test public void capturePopulatedValidationAndStorageFailureStates() throws Exception {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            String theme = light ? "light" : "dark";
            AutoReply.save(Settings.preferences, java.util.List.of(new AutoReply.Rule("hello, hours", "We're open until 5 p.m.")), false);
            MessageLog.write(Settings.appContext, java.util.List.of(
                new MessageLog.Entry(System.currentTimeMillis() - 240_000, "ONE_TO_ONE:1:2", "See you Saturday!", "Jamie", ""),
                new MessageLog.Entry(System.currentTimeMillis() - 60_000, "GROUP:1", "I'll bring lunch. Does noon work for everyone?", "Alex", "Weekend plans")));
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View page = screen.get().getWindow().getDecorView();
                layout(page);
                Dialog reply = openDialog(page, "auto_reply_edit");
                View root = reply.getWindow().getDecorView();
                layoutDialog(reply);
                write(root, "settings-auto-reply-filled-" + theme);
                ((EditText) required(root, "auto_reply_reply")).setText("");
                required(root, "auto_reply_save").performClick();
                layoutDialog(reply);
                assertTrue(reply.isShowing());
                assertEquals(View.VISIBLE, required(root, "auto_reply_error").getVisibility());
                write(root, "settings-auto-reply-validation-" + theme);
                reply.dismiss();

                Dialog log = openDialog(page, "message_log_view");
                root = log.getWindow().getDecorView();
                awaitText(root, "See you Saturday!");
                layoutDialog(log);
                write(root, "settings-message-log-filled-" + theme);
                log.dismiss();
                MessageLog.Vault working = MessageLog.vault;
                MessageLog.vault = new MessageLog.Vault() {
                    @Override public byte[] seal(byte[] plain) throws Exception { return working.seal(plain); }
                    @Override public byte[] open(byte[] blob) throws Exception { throw new java.io.IOException("test read failure"); }
                    @Override public void forget() throws Exception { working.forget(); }
                };
                log = openDialog(page, "message_log_view");
                root = log.getWindow().getDecorView();
                awaitText(root, new SettingsText(screen.get()).get("message_log_load_failed"));
                layoutDialog(log);
                write(root, "settings-message-log-error-" + theme);
                MessageLog.vault = working;
                required(root, "message_log_retry").performClick();
                awaitText(root, "See you Saturday!");
                log.dismiss();
                MessageLog.vault = new MessageLog.Vault() {
                    @Override public byte[] seal(byte[] plain) throws Exception { return working.seal(plain); }
                    @Override public byte[] open(byte[] blob) throws Exception { return working.open(blob); }
                    @Override public void forget() throws Exception { throw new java.io.IOException("test key failure"); }
                };
                log = openDialog(page, "message_log_view");
                root = log.getWindow().getDecorView();
                awaitText(root, "See you Saturday!");
                required(root, "message_log_dialog_clear").performClick();
                awaitText(root, new SettingsText(screen.get()).get("message_log_clear_help"));
                assertTrue(required(root, "message_log_dialog_clear").isEnabled());
                layoutDialog(log);
                write(root, "settings-message-log-clear-error-" + theme);
                MessageLog.vault = working;
                required(root, "message_log_retry").performClick();
                awaitText(root, new SettingsText(screen.get()).get("message_log_empty"));
                assertFalse(required(root, "message_log_dialog_clear").isEnabled());
                log.dismiss();
                // An older file the log can't read is set aside, and newer messages show under the notice.
                java.nio.file.Files.write(new java.io.File(Settings.appContext.getFilesDir(), MessageLog.FILE).toPath(), new byte[] {1, 2, 3});
                assertTrue(MessageLog.loadResult().setAside);
                MessageLog.write(Settings.appContext, java.util.List.of(
                    new MessageLog.Entry(System.currentTimeMillis() - 60_000, "ONE_TO_ONE:1:2", "See you Saturday!", "Jamie", "")));
                log = openDialog(page, "message_log_view");
                root = log.getWindow().getDecorView();
                awaitText(root, new SettingsText(screen.get()).get("message_log_set_aside"));
                awaitText(root, "See you Saturday!");
                layoutDialog(log);
                write(root, "settings-message-log-set-aside-" + theme);
                log.dismiss();
                MessageLog.clear();
            }
        }
    }

    @Test public void captureFocusHoverAndLongReplyStates() throws Exception {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            String theme = light ? "light" : "dark";
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View page = screen.get().getWindow().getDecorView();
                EditText search = (EditText) required(page, "find_control");
                search.setText("story");
                search.requestFocus();
                View clear = required(page, "clear_query");
                clear.setHovered(true);
                layout(page);
                assertTrue(search.hasFocus());
                assertTrue(clear.isHovered());
                write(page, "settings-controls-focus-hover-" + theme);
                clear.performClick();
                layout(page);
                required(page, "auto_reply_edit").requestFocus();
                Dialog dialog = openDialog(page, "auto_reply_edit");
                View root = dialog.getWindow().getDecorView();
                EditText reply = (EditText) required(root, "auto_reply_reply");
                reply.setText("A reply line\n".repeat(12) + "Last line");
                layoutDialog(dialog);
                assertEquals(13, reply.getLineCount());
                assertTrue(reply.getHeight() >= reply.getLayout().getHeight() + reply.getCompoundPaddingTop() + reply.getCompoundPaddingBottom());
                ScrollView scroll = (ScrollView) required(root, "dialog_scroll");
                scroll.setSmoothScrollingEnabled(false);
                scroll.fullScroll(View.FOCUS_DOWN);
                layoutDialog(dialog);
                visibleTarget(required(root, "auto_reply_save"));
                write(root, "settings-auto-reply-long-" + theme);
                dialog.dismiss();
            }
        }
    }

    @Test public void captureNarrowLargeTextAndRtlSheetsWithKeyboardInsets() throws Exception {
        RuntimeEnvironment.setFontScale(2f);
        for (String locale : new String[] {"en-rUS", "ar-rXB"}) {
            RuntimeEnvironment.setQualifiers(locale + "-w320dp-h640dp-mdpi");
            for (boolean light : new boolean[] {false, true}) {
                Settings.preferences.edit().clear().putBoolean("light", light).commit();
                String variant = (light ? "light" : "dark") + (locale.startsWith("ar") ? "-rtl" : "-large");
                try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                    View page = screen.get().getWindow().getDecorView();
                    layout(page, 320, 640);
                    write(page, "settings-controls-" + variant);
                    required(page, "tab_app").performClick();
                    layout(page, 320, 640);
                    for (String key : new String[] {"hide_drawer_icon", "light", "material_you_black", "check_updates"}) {
                        View choice = required(page, key);
                        ViewGroup row = (ViewGroup) choice.getParent();
                        View labels = row.getChildAt(0);
                        assertTrue("Large App text leaves room for " + key,
                            locale.startsWith("ar") ? labels.getLeft() >= choice.getRight() + 12 : choice.getLeft() >= labels.getRight() + 12);
                    }
                    write(page, "settings-app-" + variant);
                    required(page, "tab_controls").performClick();
                    layout(page, 320, 640);
                    Dialog dialog = openDialog(page, "auto_reply_edit");
                    View root = dialog.getWindow().getDecorView();
                    View sheet = required(root, "settings_dialog");
                    layout(root, 320, 640);
                    android.view.WindowInsets simulated = new android.view.WindowInsets.Builder()
                        .setInsets(android.view.WindowInsets.Type.systemBars(), android.graphics.Insets.of(0, 24, 0, 16))
                        .setInsets(android.view.WindowInsets.Type.displayCutout(), android.graphics.Insets.of(8, 24, 8, 0))
                        .setInsets(android.view.WindowInsets.Type.ime(), android.graphics.Insets.of(0, 0, 0, 220)).build();
                    // Draw the production sheet after applying explicit insets. The host test window otherwise
                    // redispatches its own zero IME insets while draining the looper. No software keyboard is drawn.
                    sheet.dispatchApplyWindowInsets(simulated);
                    layoutNow(sheet, 320, 640);
                    assertEquals(236, sheet.getPaddingBottom());
                    write(sheet, "settings-auto-reply-keyboard-" + variant);
                    ScrollView scroll = (ScrollView) required(root, "dialog_scroll");
                    scroll.setSmoothScrollingEnabled(false);
                    scroll.fullScroll(View.FOCUS_DOWN);
                    layoutNow(sheet, 320, 640);
                    visibleTarget(required(root, "auto_reply_save"));
                    Rect visible = new Rect();
                    required(root, "auto_reply_save").getGlobalVisibleRect(visible);
                    assertTrue("Save stays above the simulated keyboard", visible.bottom <= 420);
                    write(sheet, "settings-auto-reply-actions-" + variant);
                    dialog.dismiss();
                    View restart = RestartActivity.content(new SettingsUi(screen.get(), light));
                    screen.get().setContentView(restart);
                    layout(restart, 320, 640);
                    write(restart, "settings-restart-" + variant);
                }
            }
        }
    }

    @Test public void captureFontBackupUpdatesAndMaximumReplies() throws Exception {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            String theme = light ? "light" : "dark";
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                layout(root);
                ((EditText) required(root, "find_control")).setText("Use your own font");
                layout(root);
                View font = required(root, "font_file");
                font.requestRectangleOnScreen(new Rect(0, 0, font.getWidth(), font.getHeight()), true);
                layout(root);
                write(root, "settings-font-" + theme);
                required(root, "tab_app").performClick();
                layout(root);
                View choices = required(root, "copy_setup");
                alignSection((View) choices.getParent());
                layout(root);
                write(root, "settings-backup-" + theme);
                View updates = required(root, "check_updates");
                alignSection((View) updates.getParent().getParent());
                layout(root);
                write(root, "settings-updates-" + theme);
                ((EditText) required(root, "find_control")).setText("");
                required(root, "tab_controls").performClick();
                layout(root);
                java.util.List<AutoReply.Rule> rules = new java.util.ArrayList<>();
                for (int i = 1; i <= AutoReply.MAX_RULES; i++) rules.add(new AutoReply.Rule("word " + i, "Reply " + i));
                AutoReply.save(Settings.preferences, rules, false);
                Dialog dialog = openDialog(root, "auto_reply_edit");
                View sheet = dialog.getWindow().getDecorView();
                layoutDialog(dialog);
                assertFalse(required(sheet, "auto_reply_add").isEnabled());
                write(sheet, "settings-auto-reply-limit-" + theme);
                ScrollView scroll = (ScrollView) required(sheet, "dialog_scroll");
                scroll.setSmoothScrollingEnabled(false);
                scroll.fullScroll(View.FOCUS_DOWN);
                layoutDialog(dialog);
                visibleTarget(required(sheet, "auto_reply_save"));
                write(sheet, "settings-auto-reply-limit-end-" + theme);
                dialog.dismiss();
            }
        }
    }

    /** The README pair (scripts/readme_captures.py copies settings-controls-* and settings-app-* into assets/). */
    @Test public void captureProductionPagesAndDialogsInBothThemes() throws Exception {
        for (boolean light : new boolean[] {false, true}) {
            Settings.preferences.edit().clear().putBoolean("light", light).commit();
            String theme = light ? "light" : "dark";
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                layout(root);
                for (String[] spec : SettingsActivity.CONTROLS) {
                    Switch choice = root.findViewWithTag(spec[0]);
                    assertNotNull("Installed control: " + spec[0], choice);
                    assertTrue(spec[0] + " height", choice.getHeight() >= 48);
                    assertTrue(spec[0] + " width", choice.getWidth() >= 48);
                    View row = (View) choice.getParent();
                    assertTrue(spec[0] + " fits its row", choice.getLeft() >= 0 && choice.getRight() <= row.getWidth());
                }
            }
            // As a person first sees it, with the first section open and the App tab's ways in.
            OpenSections.only(SettingsActivity.CONTROLS[0][3], "quick_access");
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                layout(root);
                assertFalse(Settings.preview);
                assertNull(root.findViewWithTag("preview_notice"));
                assertTrue(required(root, "controls_page").isShown());
                visibleTarget(required(root, "open_messenger"));
                visibleTarget(required(root, "find_control"));
                visibleTarget(required(root, SettingsActivity.CONTROLS[0][0]));
                write(root, "settings-controls-" + theme);

                required(root, "tab_app").performClick();
                layout(root);
                assertTrue(required(root, "app_page").isShown());
                assertFalse(required(root, "controls_page").isShown());
                visibleTarget(required(root, "tab_app"));
                visibleTarget(required(root, "hide_drawer_icon"));
                write(root, "settings-app-" + theme);
            }
            OpenSections.all();
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                View root = screen.get().getWindow().getDecorView();
                layout(root);
                layout(root);
                captureDialog(root, "message_log_view", "message_log_empty", "settings-message-log-" + theme);
                captureDialog(root, "auto_reply_edit", null, "settings-auto-reply-" + theme);

                View restart = RestartActivity.content(new SettingsUi(screen.get(), light));
                screen.get().setContentView(restart);
                screen.visible();
                Shadows.shadowOf(Looper.getMainLooper()).idleFor(200, TimeUnit.MILLISECONDS);
                layout(restart);
                TextView status = (TextView) required(restart, "restart_status");
                assertEquals(new SettingsText(screen.get()).get("restarting"), status.getText().toString());
                assertTrue("Restart message laid out", status.getWidth() > 0 && status.getHeight() > 0);
                write(restart, "settings-restart-" + theme);
            }
        }
    }

    /** A Quick setup's Undo at the top of settings, and Clear log's on the emptied log and behind it. */
    @Test public void captureUndoOffers() throws Exception {
        MessageLog.write(Settings.appContext, java.util.List.of(new MessageLog.Entry(System.currentTimeMillis(), "t", "A saved message")));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            SettingsText text = new SettingsText(screen.get());
            layout(root);
            required(root, "quick_privacy").performClick();
            layout(root);
            visibleTarget(required(root, "undo"));
            write(root, "settings-undo-quick-setup");

            Dialog dialog = openDialog(root, "message_log_view");
            View sheet = dialog.getWindow().getDecorView();
            awaitText(sheet, "A saved message");
            required(sheet, "message_log_dialog_clear").performClick();
            awaitText(sheet, text.get("undo"));
            layoutDialog(dialog);
            visibleTarget(required(sheet, "message_log_undo"));
            write(sheet, "settings-message-log-undo");
            dialog.dismiss();
            layout(root);
            assertEquals(text.get("undo_action", text.format("message_log_clear")), ((TextView) required(root, "undo")).getText().toString());
            visibleTarget(required(root, "undo"));
            write(root, "settings-undo-clear-log");
        }
    }

    private void captureDialog(View page, String action, String loadedText, String name) throws Exception {
        Dialog dialog = openDialog(page, action);
        try {
            View root = dialog.getWindow().getDecorView();
            if (loadedText != null) awaitText(root, new SettingsText(dialog.getContext()).get(loadedText));
            layoutDialog(dialog);
            if ("auto_reply_edit".equals(action)) {
                visibleTarget(required(root, "auto_reply_save"));
                visibleTarget(required(root, "auto_reply_groups"));
                assertTrue(required(root, "auto_reply_reply").getHeight() >= 48);
            }
            write(root, name);
        } finally {
            dialog.dismiss();
            layout(page);
        }
    }

    private Dialog openDialog(View page, String action) {
        View button = required(page, action);
        button.requestRectangleOnScreen(new Rect(0, 0, button.getWidth(), button.getHeight()), true);
        layout(page, page.getWidth(), page.getHeight());
        visibleTarget(button);
        assertTrue(button.performClick());
        Dialog dialog = ShadowDialog.getLatestDialog();
        assertNotNull("Dialog opened by " + action, dialog);
        assertTrue(dialog.isShowing());
        return dialog;
    }

    private static void awaitText(View root, String expected) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(3);
        while (!containsText(root, expected) && System.nanoTime() < deadline) {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            Thread.sleep(10);
        }
        assertTrue("Loaded: " + expected, containsText(root, expected));
    }

    private static void layout(View root) {
        layout(root, WIDTH, HEIGHT);
    }

    private static void layout(View root, int width, int height) {
        for (int pass = 0; pass < 2; pass++) {
            layoutNow(root, width, height);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private static void layoutNow(View root, int width, int height) {
        root.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
            View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        root.layout(0, 0, width, height);
    }

    private static void alignSection(View section) {
        View ancestor = section;
        while (!(ancestor instanceof ScrollView)) ancestor = (View) ancestor.getParent();
        ScrollView scroll = (ScrollView) ancestor;
        Rect rect = new Rect(0, 0, section.getWidth(), section.getHeight());
        ((ViewGroup) scroll.getChildAt(0)).offsetDescendantRectToMyCoords(section, rect);
        scroll.scrollTo(0, Math.max(0, rect.top - 16));
    }

    private static void layoutDialog(Dialog dialog) {
        View root = dialog.getWindow().getDecorView();
        var attributes = dialog.getWindow().getAttributes();
        for (int pass = 0; pass < 2; pass++) {
            root.measure(windowSpec(attributes.width, WIDTH), windowSpec(attributes.height, HEIGHT));
            root.layout(0, 0, root.getMeasuredWidth(), root.getMeasuredHeight());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
        }
    }

    private static int windowSpec(int requested, int available) {
        return View.MeasureSpec.makeMeasureSpec(requested > 0 ? Math.min(requested, available) : available,
            requested == WindowManager.LayoutParams.WRAP_CONTENT ? View.MeasureSpec.AT_MOST : View.MeasureSpec.EXACTLY);
    }

    private static View required(View root, String tag) {
        View view = root.findViewWithTag(tag);
        assertNotNull("View: " + tag, view);
        return view;
    }

    private static void visibleTarget(View view) {
        Rect visible = new Rect();
        assertTrue("Visible: " + view.getTag(), view.isShown() && view.getGlobalVisibleRect(visible));
        assertTrue("Usable visible height: " + view.getTag(), visible.height() >= 48);
        assertTrue("Usable visible width: " + view.getTag(), visible.width() >= 48);
    }

    private static boolean containsText(View view, String expected) {
        if (view instanceof TextView && expected.contentEquals(((TextView) view).getText())) return true;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++)
            if (containsText(((ViewGroup) view).getChildAt(i), expected)) return true;
        return false;
    }

    private void write(View root, String name) throws Exception {
        assertTrue("Rendered area", root.getWidth() > 0 && root.getHeight() > 0);
        Bitmap bitmap = Bitmap.createBitmap(root.getWidth(), root.getHeight(), Bitmap.Config.ARGB_8888);
        try (OutputStream stream = Files.newOutputStream(output.resolve(name + ".png"))) {
            root.draw(new Canvas(bitmap));
            assertTrue("PNG export", bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream));
        } finally {
            bitmap.recycle();
        }
    }
}
