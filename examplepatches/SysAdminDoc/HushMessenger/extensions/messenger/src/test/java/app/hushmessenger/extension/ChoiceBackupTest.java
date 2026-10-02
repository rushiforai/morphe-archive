package app.hushmessenger.extension;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class ChoiceBackupTest {
    @Before public void reset() {
        Settings.initialize(RuntimeEnvironment.getApplication());
        Settings.preferences.edit().clear().commit();
        CrashGuard.resetForTests();
    }

    @Test public void bothVersionsRoundTripOnlyInstalledChoices() {
        Settings.preferences.edit().putBoolean("stories", true).putBoolean("paused", true)
            .putBoolean("safe_mode", true).putString("account", "private").putString("hook_error_stories", "private")
            .putBoolean("check_updates", true).commit();
        String backup = ChoiceCodec.encode(Settings.preferences, new HashSet<>(Set.of("stories")));
        assertEquals(ChoiceCodec.HEADER + "\npaused=true\nstories=true\n", backup);
        assertEquals(Map.of("paused", true, "stories", true), ChoiceCodec.parse(backup));
        assertEquals(ChoiceCodec.parse(backup), ChoiceCodec.parse(backup.replace(ChoiceCodec.HEADER, ChoiceCodec.LEGACY_HEADER)));
        assertEquals(ChoiceCodec.parse(backup), ChoiceCodec.parse(backup.replace("\n", "\r\n")));
    }

    @Test public void everyMalformedBackupLeavesAllPreferencesUntouched() {
        String[] invalid = {"", "hushmessenger:choices-extra\nstories=true", "hushmessenger:choices:v2\nstories=true",
            "hushmessenger:choices\nstories=true\nstories=false", "hushmessenger:choices\nstories=true\npeople=maybe",
            "hushmessenger:choices\nstories=true\nbroken", "hushmessenger:choices\nstories=TRUE",
            "hushmessenger:choices\nstories=true\n\npeople=false", "hushmessenger:choices\nstories=true\nunknown=bad",
            "hushmessenger:choices\nstories=true\n" + "x".repeat(ChoiceCodec.MAX_BYTES)};
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Settings.preferences.edit().putBoolean("stories", false).putBoolean("people", true).commit();
            Map<String, ?> before = Settings.preferences.getAll();
            for (String raw : invalid) {
                clipboard(raw);
                screen.get().getWindow().getDecorView().findViewWithTag("import_choices").performClick();
                assertEquals(raw.substring(0, Math.min(60, raw.length())), before, Settings.preferences.getAll());
                assertTrue(ShadowToast.getTextOfLatestToast().startsWith("Not a valid"));
            }
        }
    }

    @Test public void omittedAbsentAndUnknownChoicesAreNotOverwritten() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Settings.installed = new HashSet<>(Set.of("stories"));
            Settings.preferences.edit().putBoolean("people", true).putBoolean("typing", true).commit();
            clipboard(ChoiceCodec.HEADER + "\nstories=true\npeople=false\nnew_control=true\n");
            screen.get().getWindow().getDecorView().findViewWithTag("import_choices").performClick();
            assertTrue(Settings.preferences.getBoolean("stories", false));
            assertTrue(Settings.preferences.getBoolean("people", false));
            assertTrue(Settings.preferences.getBoolean("typing", false));
            assertFalse(Settings.preferences.contains("new_control"));
            assertEquals("Restored 1 choice Skipped 1 unknown choice. Skipped 1 choice absent from this bundle.", ShadowToast.getTextOfLatestToast());
            Map<String, ?> before = Settings.preferences.getAll();
            clipboard(ChoiceCodec.HEADER + "\nnew_control=false\n");
            screen.get().getWindow().getDecorView().findViewWithTag("import_choices").performClick();
            assertEquals(before, Settings.preferences.getAll());
            assertTrue(ShadowToast.getTextOfLatestToast().startsWith("No installed"));
        }
    }

    @Test public void streamLimitCountsBytesAndAllowsTheExactBoundary() throws Exception {
        assertEquals(ChoiceCodec.MAX_BYTES, ChoiceCodec.read(new ByteArrayInputStream(new byte[ChoiceCodec.MAX_BYTES])).length());
        assertThrows(java.io.IOException.class, () -> ChoiceCodec.read(new ByteArrayInputStream(new byte[ChoiceCodec.MAX_BYTES + 1])));
        assertThrows(IllegalArgumentException.class, () -> ChoiceCodec.parse("\u20ac".repeat(ChoiceCodec.MAX_BYTES / 2)));
        assertThrows(java.io.IOException.class, () -> ChoiceCodec.read(null));
    }

    @Test public void malformedUtf8CannotTurnIntoAnAcceptedUnknownKey() throws Exception {
        ByteArrayOutputStream raw = new ByteArrayOutputStream();
        raw.write((ChoiceCodec.HEADER + "\nstories=true\nnew_").getBytes(StandardCharsets.UTF_8));
        raw.write(0xc3);
        raw.write("=true\n".getBytes(StandardCharsets.UTF_8));
        String decoded = ChoiceCodec.read(new ByteArrayInputStream(raw.toByteArray()));
        assertThrows(IllegalArgumentException.class, () -> ChoiceCodec.parse(decoded));
    }

    @Test public void onlyOnePickerCanBePendingAndCancelAllowsRetry() {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            root.findViewWithTag("read_choices_file").performClick();
            root.findViewWithTag("read_choices_file").performClick();
            root.findViewWithTag("save_choices_file").performClick();
            var first = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, first.intent.getAction());
            assertNull(Shadows.shadowOf(activity).getNextStartedActivityForResult());
            activity.onActivityResult(first.requestCode, Activity.RESULT_CANCELED, null);
            root.findViewWithTag("save_choices_file").performClick();
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, Shadows.shadowOf(activity).getNextStartedActivityForResult().intent.getAction());
        }
    }

    @Test public void filePickerExportUsesTheSameSettingsOnlyFormat() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            Settings.preferences.edit().putBoolean("stories", true).commit();
            SettingsActivity activity = screen.get();
            activity.getWindow().getDecorView().findViewWithTag("save_choices_file").performClick();
            var request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals(Intent.ACTION_CREATE_DOCUMENT, request.intent.getAction());
            assertTrue(request.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            assertEquals("text/plain", request.intent.getType());
            Uri uri = Uri.parse("content://choices/export");
            ByteArrayOutputStream output = new ByteArrayOutputStream();
            Shadows.shadowOf(activity.getContentResolver()).registerOutputStream(uri, output);
            activity.onActivityResult(request.requestCode, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Choices file saved");
            assertEquals(ChoiceCodec.encode(Settings.preferences, Settings.installed), output.toString(StandardCharsets.UTF_8));
        }
    }

    @Test public void legacyFileImportAndCancelPreserveOmittedChoices() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            Settings.preferences.edit().putBoolean("people", true).commit();
            View button = activity.getWindow().getDecorView().findViewWithTag("read_choices_file");
            button.performClick();
            var request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, request.intent.getAction());
            assertTrue(request.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            Map<String, ?> before = Settings.preferences.getAll();
            activity.onActivityResult(request.requestCode, Activity.RESULT_CANCELED, null);
            assertEquals(before, Settings.preferences.getAll());
            button.performClick();
            Uri uri = Uri.parse("content://choices/import");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                new ByteArrayInputStream((ChoiceCodec.LEGACY_HEADER + "\nstories=true\n").getBytes(StandardCharsets.UTF_8)));
            activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
            awaitToast("Restored 1 choice");
            assertTrue(Settings.preferences.getBoolean("stories", false));
            assertTrue(Settings.preferences.getBoolean("people", false));
        }
    }

    @Test public void unreadableCorruptAndRecreatedFileResultsChangeNothing() throws Exception {
        for (String data : new String[] {"corrupt", "oversized", "unreadable"}) {
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                SettingsActivity activity = screen.get();
                Map<String, ?> before = Settings.preferences.getAll();
                activity.getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
                Uri uri = Uri.parse("content://choices/" + data);
                if (!"unreadable".equals(data)) Shadows.shadowOf(activity.getContentResolver()).registerInputStream(uri,
                    new ByteArrayInputStream(("oversized".equals(data) ? "x".repeat(ChoiceCodec.MAX_BYTES + 1) :
                        ChoiceCodec.HEADER + "\nstories=true\npeople=bad").getBytes(StandardCharsets.UTF_8)));
                else Shadows.shadowOf(activity.getContentResolver()).registerInputStreamSupplier(uri,
                    () -> { throw new SecurityException("Refused"); });
                ShadowToast.reset();
                activity.onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(uri));
                awaitToast("Not a valid");
                assertEquals(before, Settings.preferences.getAll());
            }
        }
        Bundle saved = new Bundle();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            screen.get().getWindow().getDecorView().findViewWithTag("read_choices_file").performClick();
            screen.get().onSaveInstanceState(saved);
        }
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).create(saved).start().resume()) {
            Map<String, ?> before = Settings.preferences.getAll();
            screen.get().onActivityResult(SettingsActivity.READ_CHOICES, Activity.RESULT_OK, new Intent().setData(Uri.parse("content://choices/import")));
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(before, Settings.preferences.getAll());
        }
    }

    private static void clipboard(String text) {
        RuntimeEnvironment.getApplication().getSystemService(ClipboardManager.class).setPrimaryClip(ClipData.newPlainText("choices", text));
    }

    private static void awaitToast(String prefix) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 5000;
        do {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            String toast = ShadowToast.getTextOfLatestToast();
            if (toast != null && toast.startsWith(prefix)) return;
            Thread.sleep(20);
        } while (System.currentTimeMillis() < deadline);
        fail("Missing document result: " + prefix);
    }
}
