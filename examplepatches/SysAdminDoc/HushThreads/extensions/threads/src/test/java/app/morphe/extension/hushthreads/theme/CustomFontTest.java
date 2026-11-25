/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.extension.hushthreads.theme;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.graphics.Typeface;
import android.os.CancellationSignal;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.Collections;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.SettingsContextRule;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.shared.settings.HushThreadsPause;
import app.morphe.extension.shared.settings.PauseForTests;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class CustomFontTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private final Typeface threads = Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL);
    private CustomFontForTests.Loader loader;
    private Context context;

    /** The patch is in Manager's default selection with its switch off; these tests turn it on. */
    @Before public void turnTheSwitchOn() {
        restore();
        context = Utils.getContext();
        Settings.CUSTOM_FONT.save(true);
        loader = CustomFontForTests.install();
    }

    @After public void restore() {
        PauseForTests.resume();
        Settings.CUSTOM_FONT.resetToDefault();
        CustomFontForTests.reset();
        HookStatus.clear();
    }

    private static String report() {
        return String.join("\n", HookStatus.report());
    }

    private static InputStream bytes(String text) {
        return new ByteArrayInputStream(text.getBytes(StandardCharsets.US_ASCII));
    }

    /** On with a font kept, Threads' text fonts come back as it, one typeface per weight. */
    @Test public void onTextFontsBecomeThePickedFont() throws IOException {
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        Typeface asset = CustomFont.assetFont(null, "Optimistic_VF_App_Lite.ttf");
        assertNotNull(asset);
        assertSame(asset, CustomFont.systemFont(null, "sans-serif-medium"));
        assertEquals("made once and kept", Collections.singletonList("400"), loader.asked);
        assertTrue(report(), report().contains(FamilyNames.CUSTOM_FONT + ": invoked 2"));
        assertTrue(report(), report().contains(CustomFont.SWAPPED + " 2"));
    }

    /**
     * Most of Threads' text asks Android for sans-serif by name or draws in Android's default, never
     * through the repository (on the S25, 2026-11-24, no repository load came before the profile
     * showed). At Threads' start those become the picked font, and serif and monospace stay.
     */
    @Test public void atStartAndroidsTextFontsBecomeThePickedFont() throws IOException {
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        CustomFontForTests.AndroidFonts android = CustomFontForTests.installAndroidFonts();
        android.families.put("sans-serif", Typeface.SANS_SERIF);
        android.families.put("sans-serif-medium", Typeface.DEFAULT_BOLD);
        android.families.put("serif", threads);
        android.families.put("monospace", Typeface.MONOSPACE);

        CustomFont.onThreadsStart(context);

        assertNotSame(Typeface.SANS_SERIF, android.families.get("sans-serif"));
        assertNotSame(Typeface.DEFAULT_BOLD, android.families.get("sans-serif-medium"));
        assertTrue(loader.made(android.families.get("sans-serif")));
        assertTrue(loader.made(android.families.get("sans-serif-medium")));
        assertSame(threads, android.families.get("serif"));
        assertSame(Typeface.MONOSPACE, android.families.get("monospace"));
        assertFalse("a stock font looks made", loader.made(threads) || loader.made(Typeface.MONOSPACE));
        assertEquals(4, android.defaults.size());
        for (Typeface typeface : android.defaults) assertTrue(loader.made(typeface));
        assertTrue(loader.asked.toString(), loader.asked.containsAll(Arrays.asList("400", "700", "400 italic", "700 italic")));
        assertTrue(report(), report().contains(CustomFont.ANDROID_SWAPPED + " 2"));
        assertTrue(report(), report().contains(CustomFont.DEFAULTS_SWAPPED + " 1"));
        assertTrue(HookStatus.missing(FamilyNames.CUSTOM_FONT).isEmpty());
    }

    /** With no file, off, or paused, Android's fonts stay as they are and nothing is loaded. */
    @Test public void atStartAndroidsFontsStayWhenTheSwitchDoesNotApply() throws IOException {
        CustomFontForTests.AndroidFonts android = CustomFontForTests.installAndroidFonts();
        android.families.put("sans-serif", Typeface.SANS_SERIF);

        CustomFont.onThreadsStart(context);
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        Settings.CUSTOM_FONT.save(false);
        CustomFont.onThreadsStart(context);
        Settings.CUSTOM_FONT.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        CustomFont.onThreadsStart(context);

        assertSame(Typeface.SANS_SERIF, android.families.get("sans-serif"));
        assertTrue(android.defaults.isEmpty());
        assertTrue(loader.asked.isEmpty());
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "no font file picked 1"));
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "switch off 1"));
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "HushThreads paused 1"));
    }

    /** A kept file Android won't load leaves Android's fonts as they were. */
    @Test public void atStartAFileThatWontLoadLeavesAndroidsFonts() throws IOException {
        CustomFontForTests.keep(context, "JUNK");
        CustomFontForTests.AndroidFonts android = CustomFontForTests.installAndroidFonts();
        android.families.put("sans-serif", Typeface.SANS_SERIF);

        CustomFont.onThreadsStart(context);

        assertSame(Typeface.SANS_SERIF, android.families.get("sans-serif"));
        assertTrue(android.defaults.isEmpty());
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "the font file won't load 1"));
    }

    /** A font table Android keeps out of reach is reported, and the defaults still go in. */
    @Test public void atStartAnUnreachableTableIsReported() throws IOException {
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        CustomFontForTests.AndroidFonts android = CustomFontForTests.installAndroidFonts();
        android.unreachable = new NoSuchFieldException("sSystemFontMap");

        CustomFont.onThreadsStart(context);

        assertEquals(4, android.defaults.size());
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + CustomFont.NO_TABLE + " 1"));
        assertTrue(report(), report().contains(CustomFont.DEFAULTS_SWAPPED + " 1"));
        assertTrue(HookStatus.missing(FamilyNames.CUSTOM_FONT).isEmpty());
    }

    /**
     * Android won't let Typeface.DEFAULT, SANS_SERIF or DEFAULT_BOLD change (S25, 2026-11-24), and
     * Compose draws text with no font family of its own in Typeface.DEFAULT. Each of Threads' reads
     * of them comes back as the picked font once Threads' start put it in, bold for the bold one.
     */
    @Test public void androidsDefaultReadsGetThePickedFontFromThreadsStart() throws IOException {
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        CustomFontForTests.AndroidFonts android = CustomFontForTests.installAndroidFonts();
        assertAndroidsOwn("before Threads' start");

        CustomFont.onThreadsStart(context);

        Typeface regular = android.defaults.get(0);
        Typeface bold = android.defaults.get(1);
        assertTrue(loader.made(regular));
        assertNotSame(regular, bold);
        assertSame(regular, CustomFont.androidDefault);
        assertSame(regular, CustomFont.androidSansSerif);
        assertSame(bold, CustomFont.androidDefaultBold);
        assertTrue(report(), report().contains(CustomFont.DEFAULT_READS + " 1"));
    }

    /** Off, paused, or with no file or one that won't load, every read keeps Android's default. */
    @Test public void androidsDefaultReadsStayWhenTheSwitchDoesNotApply() throws IOException {
        CustomFontForTests.installAndroidFonts();
        CustomFont.onThreadsStart(context);
        assertAndroidsOwn("no file");

        CustomFontForTests.keep(context, "JUNK");
        CustomFont.onThreadsStart(context);
        assertAndroidsOwn("won't load");

        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        Settings.CUSTOM_FONT.save(false);
        CustomFont.onThreadsStart(context);
        assertAndroidsOwn("off");

        Settings.CUSTOM_FONT.save(true);
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        CustomFont.onThreadsStart(context);
        assertAndroidsOwn("paused");
        assertFalse(report(), report().contains(CustomFont.DEFAULT_READS));
    }

    private static void assertAndroidsOwn(String when) {
        assertSame(when, Typeface.DEFAULT, CustomFont.androidDefault);
        assertSame(when, Typeface.SANS_SERIF, CustomFont.androidSansSerif);
        assertSame(when, Typeface.DEFAULT_BOLD, CustomFont.androidDefaultBold);
    }

    /** Icon, logo and other fonts stay Threads' own, and so does a resource Threads doesn't have. */
    @Test public void otherFontsStayThreads() throws IOException {
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        assertSame(threads, CustomFont.assetFont(threads, "bcn_icon_font.ttf"));
        assertSame(threads, CustomFont.systemFont(threads, "serif"));
        assertSame(threads, CustomFont.systemFont(threads, null));
        assertSame(threads, CustomFont.resourceFont(threads, 0));
        assertTrue(loader.asked.isEmpty());
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "not a text font 4"));
        assertTrue(HookStatus.missing(FamilyNames.CUSTOM_FONT).isEmpty());
    }

    @Test public void textFontsAreThreadsOwnAndAndroidsSansSerif() {
        for (String text : Arrays.asList("Optimistic_VF_App_Lite.ttf", "Optimistic Text App Medium", "sans-serif",
                "sans-serif-medium", "IGUIBetav9_SemiBold", "prism_sans", "Optimistic_Display_A_Bd")) {
            assertTrue(text, CustomFont.isTextFont(text));
        }
        for (String other : Arrays.asList("bcn_icon_font", "ig_logo_font", "FBWordmarkRegularSlim", "instagram_signature",
                "roboto_medium_numbers", "serif", "monospace", "")) {
            assertFalse(other, CustomFont.isTextFont(other));
        }
        assertFalse(CustomFont.isTextFont(null));
    }

    /** The switch starts off, and off Threads keeps its own font. */
    @Test public void offThreadsKeepsItsOwn() throws IOException {
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        Settings.CUSTOM_FONT.resetToDefault();
        assertFalse("the switch starts on", Settings.CUSTOM_FONT.defaultValue);
        assertSame(threads, CustomFont.assetFont(threads, "Optimistic_VF_App_Lite.ttf"));
        assertTrue(loader.asked.isEmpty());
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "switch off 1"));
    }

    @Test public void pausedThreadsKeepsItsOwn() throws IOException {
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        PauseForTests.pause(HushThreadsPause.Reason.SWITCH);
        assertSame(threads, CustomFont.assetFont(threads, "Optimistic_VF_App_Lite.ttf"));
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "HushThreads paused 1"));
    }

    @Test public void withNoFilePickedThreadsKeepsItsOwn() {
        assertSame(threads, CustomFont.assetFont(threads, "Optimistic_VF_App_Lite.ttf"));
        assertNull(CustomFont.keptName(context));
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "no font file picked 1"));
    }

    /** A kept file Android won't load is tried once, then left alone, and Threads keeps its font. */
    @Test public void aFileThatWontLoadIsTriedOnce() throws IOException {
        CustomFontForTests.keep(context, "JUNK");
        assertSame(threads, CustomFont.assetFont(threads, "Optimistic_VF_App_Lite.ttf"));
        assertSame(threads, CustomFont.systemFont(threads, "sans-serif"));
        assertEquals(loader.asked.toString(), 1, loader.asked.size());
        assertTrue(report(), report().contains(CustomFont.LEFT_TO_THREADS + "the font file won't load 2"));
    }

    /** A failure in the loader leaves the font to Threads and is reported, never thrown. */
    @Test public void aFailureIsReported() throws IOException {
        CustomFontForTests.keep(context, CustomFontForTests.FONT + " picked");
        CustomFont.loader = (file, weight, italic) -> {
            throw new IllegalStateException("broken font");
        };
        assertSame(threads, CustomFont.assetFont(threads, "Optimistic_VF_App_Lite.ttf"));
        assertEquals(Collections.singletonList("a working 'custom font' hook (it threw "
                + IllegalStateException.class.getName() + ")"), HookStatus.missing(FamilyNames.CUSTOM_FONT));
    }

    /** A picked font is copied in under its name, and the next load uses it. */
    @Test public void aPickedFontIsKept() throws IOException {
        assertEquals(CustomFont.Outcome.KEPT, CustomFont.keep(context, bytes(CustomFontForTests.FONT + " one"),
                "Inter.ttf", new CancellationSignal()));
        assertEquals("Inter.ttf", CustomFont.keptName(context));
        File kept = new File(context.getFilesDir(), CustomFont.KEPT);
        assertEquals(CustomFontForTests.FONT + " one", new String(Files.readAllBytes(kept.toPath()), StandardCharsets.US_ASCII));
        assertFalse(new File(context.getFilesDir(), CustomFont.PART).exists());
        assertNotNull(CustomFont.assetFont(null, "Optimistic_VF_App_Lite.ttf"));

        // A second pick replaces it, and one with no name keeps no stale one.
        assertEquals(CustomFont.Outcome.KEPT, CustomFont.keep(context, bytes(CustomFontForTests.FONT + " two"), null,
                new CancellationSignal()));
        assertEquals("", CustomFont.keptName(context));
        assertEquals(CustomFontForTests.FONT + " two", new String(Files.readAllBytes(kept.toPath()), StandardCharsets.US_ASCII));
    }

    /** Too large, not a font, unreadable or given up on: the font kept before stays, and nothing's left over. */
    @Test public void aRefusedPickChangesNothing() throws IOException {
        CustomFont.keep(context, bytes(CustomFontForTests.FONT + " kept"), "Kept.ttf", new CancellationSignal());
        CustomFont.maxBytes = 8;
        assertEquals(CustomFont.Outcome.TOO_LARGE, CustomFont.keep(context, bytes(CustomFontForTests.FONT + " too long"),
                "Big.ttf", new CancellationSignal()));
        CustomFont.maxBytes = CustomFont.MAX_BYTES;
        assertEquals(CustomFont.Outcome.NOT_A_FONT, CustomFont.keep(context, bytes("PK zip file"), "Notes.zip",
                new CancellationSignal()));
        InputStream broken = new InputStream() {
            @Override public int read() throws IOException {
                throw new IOException("gone");
            }
        };
        assertEquals(CustomFont.Outcome.UNREADABLE, CustomFont.keep(context, broken, "Gone.ttf", new CancellationSignal()));
        CancellationSignal cancelled = new CancellationSignal();
        cancelled.cancel();
        assertEquals(CustomFont.Outcome.UNREADABLE, CustomFont.keep(context, bytes(CustomFontForTests.FONT + " late"),
                "Late.ttf", cancelled));

        assertEquals("Kept.ttf", CustomFont.keptName(context));
        File kept = new File(context.getFilesDir(), CustomFont.KEPT);
        assertEquals(CustomFontForTests.FONT + " kept", new String(Files.readAllBytes(kept.toPath()), StandardCharsets.US_ASCII));
        assertFalse(new File(context.getFilesDir(), CustomFont.PART).exists());
    }

    /** A font with an "fvar" table is variable, in a collection too; one without isn't. */
    @Test public void variableFontsAreToldByTheirWeightAxis() throws IOException {
        File folder = context.getCacheDir();
        File fixed = write(new File(folder, "fixed.ttf"), sfnt("cmap", "glyf", "head"));
        File variable = write(new File(folder, "variable.ttf"), sfnt("cmap", "fvar", "gvar"));
        File collection = write(new File(folder, "both.ttc"), collection(sfnt("fvar", "glyf")));
        File empty = write(new File(folder, "empty.ttf"), new byte[0]);
        assertFalse(CustomFont.variable(fixed));
        assertTrue(CustomFont.variable(variable));
        assertTrue(CustomFont.variable(collection));
        assertFalse(CustomFont.variable(empty));
        assertFalse(CustomFont.variable(new File(folder, "missing.ttf")));
    }

    @Test public void aChangeWaitsForARestart() {
        assertTrue(Settings.CUSTOM_FONT.rebootApp);
    }

    private static File write(File file, byte[] bytes) throws IOException {
        try (FileOutputStream out = new FileOutputStream(file)) {
            out.write(bytes);
        }
        return file;
    }

    /** An sfnt header and table list naming [tags], with no tables behind it. */
    private static byte[] sfnt(String... tags) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(bytes);
        out.writeInt(0x00010000);
        out.writeShort(tags.length);
        out.writeShort(0);
        out.writeShort(0);
        out.writeShort(0);
        for (String tag : tags) {
            out.write(tag.getBytes(StandardCharsets.US_ASCII));
            out.writeInt(0);
            out.writeInt(0);
            out.writeInt(0);
        }
        return bytes.toByteArray();
    }

    /** A collection header pointing at one font, [font], right after it. */
    private static byte[] collection(byte[] font) throws IOException {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        DataOutputStream out = new DataOutputStream(bytes);
        out.write("ttcf".getBytes(StandardCharsets.US_ASCII));
        out.writeInt(0x00010000);
        out.writeInt(1);
        out.writeInt(16);
        out.write(font);
        return bytes.toByteArray();
    }
}
