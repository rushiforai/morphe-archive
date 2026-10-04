/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.settings.preference;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.view.ViewGroup;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.shared.Utils;

import java.net.URL;
import java.net.URLClassLoader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.atomic.AtomicBoolean;

import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.rules.TemporaryFolder;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowAlertDialog;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28, qualifiers = "en")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class ReleaseNotesTest {
    public static class HostActivity extends Activity {}
    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test
    public void generatedNotesLargerThanOneConstantStillRenderEveryReleaseInOrder() throws Exception {
        Path cursor = Path.of(System.getProperty("user.dir"));
        while (!Files.isRegularFile(cursor.resolve("CHANGELOG.md"))) cursor = cursor.getParent();
        Path root = temporary.getRoot().toPath();
        String notes = "## 0.67.0 (date)\nNewest starts.\n" + "content 🚀 \000 ".repeat(7_000)
                + "\nNewest ends.\n\n## 0.60.0 (date)\nOldest kept.\n";
        assertTrue(notes.getBytes(StandardCharsets.UTF_8).length > 65_535);
        Path changelog = root.resolve("CHANGELOG.md");
        Files.write(changelog, ("## Unreleased\nDraft stays out.\n\n" + notes).getBytes(StandardCharsets.UTF_8));
        Path source = root.resolve("ReleaseNotesData.java");
        String generate = "import importlib.util,sys; from pathlib import Path; "
                + "s=importlib.util.spec_from_file_location('notes',sys.argv[1]); "
                + "m=importlib.util.module_from_spec(s); s.loader.exec_module(m); "
                + "m.CHANGELOG=Path(sys.argv[2]); m.OUTPUT=Path(sys.argv[3]); m.main()";
        Process generator = new ProcessBuilder("python", "-c", generate,
                cursor.resolve("tools/gen-release-notes.py").toString(), changelog.toString(), source.toString())
                .redirectErrorStream(true).start();
        String generated = new String(generator.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        assertEquals(generated, 0, generator.waitFor());
        Process compiler = new ProcessBuilder(Path.of(System.getProperty("java.home"), "bin", "javac").toString(),
                "-encoding", "UTF-8", "-d", root.toString(), source.toString()).redirectErrorStream(true).start();
        String diagnostics = new String(compiler.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
        assertEquals(diagnostics, 0, compiler.waitFor());

        String name = ReleaseNotes.class.getName();
        Path consumer = root.resolve(name.replace('.', '/') + ".class");
        Files.createDirectories(consumer.getParent());
        try (var input = ReleaseNotes.class.getResourceAsStream("ReleaseNotes.class")) {
            Files.copy(input, consumer);
        }
        try (var loader = new URLClassLoader(new URL[]{root.toUri().toURL()}, getClass().getClassLoader()) {
            @Override protected Class<?> loadClass(String target, boolean resolve) throws ClassNotFoundException {
                if (!target.equals(name) && !target.equals(name + "Data")) return super.loadClass(target, resolve);
                synchronized (this) {
                    Class<?> loaded = findLoadedClass(target);
                    if (loaded == null) loaded = findClass(target);
                    if (resolve) resolveClass(loaded);
                    return loaded;
                }
            }
        }; var owner = Robolectric.buildActivity(HostActivity.class).setup()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            Utils.setActivity(activity);
            activity.getSharedPreferences(ReleaseNotes.PREFS_NAME, Context.MODE_PRIVATE).edit()
                    .putString("dismissed_version", "0.59.0").commit();
            var show = loader.loadClass(name).getDeclaredMethod("show", Context.class, String.class, Runnable.class);
            show.setAccessible(true);
            show.invoke(null, activity, "0.67.0", (Runnable) () -> {});
            AlertDialog dialog = ShadowAlertDialog.getLatestAlertDialog();
            ViewGroup custom = dialog.findViewById(android.R.id.custom);
            ScrollView scroller = (ScrollView) custom.getChildAt(0);
            TextView body = (TextView) scroller.getChildAt(0);
            assertEquals(ReleaseNotes.text(notes, "0.67.0", "0.59.0"), body.getText().toString());
            assertTrue(body.getText().toString().endsWith("Oldest kept."));
            assertFalse(body.getText().toString().contains("Draft stays out."));
            dialog.dismiss();
        }
    }

    @Test
    public void bundledTextMatchesPublishedChangelogAndLeavesDraftsOut() throws Exception {
        Path cursor = Path.of(System.getProperty("user.dir")).toAbsolutePath();
        while (cursor != null && !Files.exists(cursor.resolve("CHANGELOG.md"))) {
            cursor = cursor.getParent();
        }
        assertTrue("repository changelog missing", cursor != null);
        String changelog = new String(Files.readAllBytes(cursor.resolve("CHANGELOG.md")),
                StandardCharsets.UTF_8)
                .replace("\r\n", "\n");
        int first = changelog.indexOf("\n## ", changelog.indexOf("## Unreleased") + 2) + 1;
        int end = changelog.indexOf("\n## 0.59.0 ", first);
        assertTrue("release headings missing", first > 0 && end > first);
        assertEquals("run tools/gen-release-notes.py after CHANGELOG edits",
                changelog.substring(first, end).trim() + "\n", ReleaseNotesData.TEXT);
        assertFalse(ReleaseNotesData.TEXT.contains("## Unreleased"));
    }

    @Test
    public void aBuildAheadOfAReleaseSortsBelowIt() {
        // Read as the release, Got it on 0.61.0-dev.2 dismissed 0.61.0's own notes before
        // they were published.
        String releases = "## 0.61.0 (date)\nNewer.\n\n## 0.60.0 (date)\nOld.\n";
        assertTrue(ReleaseNotes.text(releases, "0.61.0", "0.61.0-dev.2").contains("Newer."));
        assertEquals("", ReleaseNotes.text(releases, "0.61.0-dev.2", "0.61.0"));
    }

    @Test
    public void theRowNamesTheNewestVersionItShows() {
        // A build with no section of its own shows the releases before it, and the row said
        // "Changes in Hushfeed" with a version the notes never mention.
        String releases = "## 0.60.0 (date)\nOld.\n\n## 0.59.0 (date)\nOlder.\n";
        String shown = ReleaseNotes.text(releases, "0.60.1", "0.59.0");
        assertTrue(shown, shown.contains("Old."));
        assertEquals("0.60.0", ReleaseNotes.newestShown(shown));
        assertEquals(null, ReleaseNotes.newestShown(""));
    }

    @Test
    public void skippedVersionsAppearAndDismissedVersionsStayGone() {
        String releases = "## 0.1000.1000001 (date)\nNewest.\n\n"
                + "## 0.1000.1000000 (date)\nMiddle.\n\n"
                + "## 0.60.0 (date)\nOld.\n";
        String shown = ReleaseNotes.text(releases, "0.1000.1000001", "0.60.0");
        assertTrue(shown.contains("Newest."));
        assertTrue(shown.contains("Middle."));
        assertFalse(shown.contains("Old."));
        assertEquals("", ReleaseNotes.text(releases, "0.1000.1000001", "0.1000.1000001"));
        assertEquals("", ReleaseNotes.text(releases, "0.60.0", "0.1000.1000001"));
        assertTrue(ReleaseNotes.text(releases, "0.1000.1000001", null).contains("Newest."));
        assertFalse(ReleaseNotes.text(releases, "0.1000.1000001", null).contains("Middle."));
    }

    /** What's new draws a sparkle of its own; it used to borrow the Feature Gate Lab's flask. */
    @Test
    public void theWhatsNewRowHasAnIconOfItsOwn() throws Exception {
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup()) {
            Activity activity = owner.get();
            int size = SettingsUi.dp(activity, 96);
            int[] news = pixels(SettingsMenuPreference.iconDrawable(activity, SettingsMenuPreference.Icon.NEWS), size);
            int[] lab = pixels(SettingsMenuPreference.iconDrawable(activity, SettingsMenuPreference.Icon.LAB), size);
            assertFalse("the What's new icon draws the Lab's flask", java.util.Arrays.equals(news, lab));
            assertTrue("the What's new icon draws nothing",
                    java.util.Arrays.stream(news).anyMatch(pixel -> android.graphics.Color.alpha(pixel) != 0));

            android.widget.ImageView icon = new android.widget.ImageView(activity);
            icon.setImageDrawable(SettingsMenuPreference.iconDrawable(activity, SettingsMenuPreference.Icon.NEWS));
            icon.setBackgroundColor(SettingsUi.background());
            app.morphe.extension.tiktok.UiCapture.save(icon, "whats-new-icon.png", size, size);
        }
    }

    private static int[] pixels(android.graphics.drawable.Drawable drawable, int size) {
        android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(
                size, size, android.graphics.Bitmap.Config.ARGB_8888);
        drawable.setBounds(0, 0, size, size);
        drawable.draw(new android.graphics.Canvas(bitmap));
        int[] out = new int[size * size];
        bitmap.getPixels(out, 0, size, 0, 0, size, size);
        return out;
    }

    /** The changelog's scope label is for Morphe Manager; the dialog shows a plain bullet. */
    @Test
    public void bulletsDropTheChangelogScopeLabel() {
        String shown = ReleaseNotes.text("## 0.60.0 (date)\n\n* **TikTok:** Comments send again.\n", "0.60.0", null);
        assertEquals("Hushfeed 0.60.0 (date)\n\n• Comments send again.", shown);
    }

    @Test
    public void laterKeepsTheRowPendingAndGotItRemembersTheVersion() {
        try (var owner = Robolectric.buildActivity(HostActivity.class).setup()) {
            Activity activity = owner.get();
            Utils.setContext(activity);
            Utils.setActivity(activity);
            assertTrue(ReleaseNotes.pending(activity, "0.60.0"));

            ReleaseNotes.show(activity, "0.60.0", () -> {});
            AlertDialog first = ShadowAlertDialog.getLatestAlertDialog();
            assertEquals("Later", first.getButton(AlertDialog.BUTTON_NEGATIVE).getText().toString());
            first.getButton(AlertDialog.BUTTON_NEGATIVE).performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertTrue(ReleaseNotes.pending(activity, "0.60.0"));

            AtomicBoolean rowRemoved = new AtomicBoolean();
            ReleaseNotes.show(activity, "0.60.0", () -> rowRemoved.set(true));
            AlertDialog second = ShadowAlertDialog.getLatestAlertDialog();
            assertEquals("Got it", second.getButton(AlertDialog.BUTTON_POSITIVE).getText().toString());
            second.getButton(AlertDialog.BUTTON_POSITIVE).performClick();
            org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
            assertTrue(rowRemoved.get());
            assertFalse(ReleaseNotes.pending(activity, "0.60.0"));
            assertFalse(ReleaseNotes.pending(activity, "0.59.0"));
        }
    }
}
