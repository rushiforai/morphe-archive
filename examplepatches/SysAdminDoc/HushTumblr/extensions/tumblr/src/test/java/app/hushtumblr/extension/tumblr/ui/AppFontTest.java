/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.ui;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.graphics.Typeface;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.EnumSet;

import app.hushtumblr.extension.shared.SettingsContextRule;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.tumblr.settings.PatchFamily;
import app.hushtumblr.extension.tumblr.settings.PatchFamilyForTests;
import app.hushtumblr.extension.tumblr.settings.Settings;
import app.hushtumblr.extension.tumblr.settings.TextSettings;

/** #7: Tumblr's own font, or a chosen file, can stand in for Favorit and Roboto, and nothing else. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class AppFontTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final int REGULAR = 0x7f090005, MEDIUM = 0x7f090007, BOLD = 0x7f090006, AUTHORS = 0x7f090001;

    private Context context;
    private File chosen;

    @Before
    public void aBuildWithTheHooks() {
        PatchFamilyForTests.inBuild(EnumSet.allOf(PatchFamily.class));
        PatchFamilyForTests.capabilities(EnumSet.allOf(PatchFamily.Capability.class));
        HookStatus.clear();
        AppFont.clearForTests();
        AppFont.interfaceFontIds = new int[] {REGULAR, 0x7f090008, MEDIUM, BOLD};
        context = RuntimeEnvironment.getApplication();
        chosen = new File(new File(context.getFilesDir(), "hushtumblr_font"), "font");
    }

    @After
    public void restore() {
        AppFont.forget(context);
        AppFont.clearForTests();
        PatchFamilyForTests.inBuild(null);
        PatchFamilyForTests.capabilities(null);
        Settings.APP_FONT.resetToDefault();
        TextSettings.APP_FONT_FILE.resetToDefault();
        HookStatus.clear();
    }

    @Test
    public void theSwitchStartsOffAndWaitsForARestart() {
        assertFalse(Settings.APP_FONT.defaultValue);
        assertTrue("Tumblr keeps the fonts it loaded", Settings.APP_FONT.rebootApp);
        assertTrue("a change of file needs the restart too", TextSettings.APP_FONT_FILE.rebootApp);
    }

    @Test
    public void offTumblrLoadsItsOwnFont() {
        assertNull(AppFont.replacement(context, REGULAR));
        Typeface roboto = Typeface.create("sans-serif-medium", Typeface.NORMAL);
        assertSame(roboto, AppFont.provided(roboto));
    }

    @Test
    public void onEveryWeightOfTumblrsFontIsReplaced() {
        Settings.APP_FONT.save(true);
        for (int id : AppFont.interfaceFontIds) assertNotNull(Integer.toHexString(id), AppFont.replacement(context, id));
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains(AppFont.SWAPPED + " 4"));
    }

    @Test
    public void aWeightKeepsItsOwnFace() {
        Settings.APP_FONT.save(true);
        assertNotSame(AppFont.replacement(context, REGULAR), AppFont.replacement(context, BOLD));
        assertSame("made once", AppFont.replacement(context, MEDIUM), AppFont.replacement(context, MEDIUM));
    }

    /** A post's author picks these, and they're part of the post. */
    @Test
    public void anAuthorsFontStays() {
        Settings.APP_FONT.save(true);
        assertNull(AppFont.replacement(context, AUTHORS));
    }

    @Test
    public void aFontWhoseNameIsMissingFromThisBuildMatchesNothing() {
        Settings.APP_FONT.save(true);
        AppFont.interfaceFontIds = new int[] {0, 0, 0, 0};
        assertNull(AppFont.replacement(context, 0));
    }

    @Test
    public void aBuildWithoutTheHooksDoesNothing() throws Exception {
        Settings.APP_FONT.save(true);
        TextSettings.APP_FONT_FILE.save(AppFont.install(context, stream(font("OTTO")), "a.otf"));
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        assertNull(AppFont.replacement(context, REGULAR));
        Typeface roboto = Typeface.create("sans-serif", Typeface.NORMAL);
        assertSame(roboto, AppFont.provided(roboto));
    }

    /** Roboto is already the phone's font, so with no file there's nothing to change. */
    @Test
    public void robotoStaysWithNoChosenFile() {
        Settings.APP_FONT.save(true);
        Typeface roboto = Typeface.create("sans-serif-medium", Typeface.NORMAL);
        assertSame(roboto, AppFont.provided(roboto));
    }

    @Test
    public void aChosenFileTakesRobotosPlace() throws Exception {
        Settings.APP_FONT.save(true);
        TextSettings.APP_FONT_FILE.save(AppFont.install(context, stream(font("OTTO")), "a.otf"));
        Typeface roboto = Typeface.create("sans-serif-medium", Typeface.NORMAL);
        assertNotSame(roboto, AppFont.provided(roboto));
    }

    @Test
    public void aFileAloneChangesNothingUntilItsSaved() throws Exception {
        Settings.APP_FONT.save(true);
        AppFont.install(context, stream(font("OTTO")), "a.otf");
        Typeface roboto = Typeface.create("sans-serif", Typeface.NORMAL);
        assertSame(roboto, AppFont.provided(roboto));
    }

    @Test
    public void aSavedFileThatsGoneFallsBackToThePhonesFont() throws Exception {
        Settings.APP_FONT.save(true);
        TextSettings.APP_FONT_FILE.save(AppFont.install(context, stream(font("OTTO")), "a.otf"));
        AppFont.forget(context);
        Typeface roboto = Typeface.create("sans-serif", Typeface.NORMAL);
        assertSame(roboto, AppFont.provided(roboto));
        assertNotNull(AppFont.replacement(context, REGULAR));
    }

    @Test
    public void aMissingFaceIsLeftForTumblrToHandle() {
        Settings.APP_FONT.save(true);
        assertNull(AppFont.provided(null));
    }

    /** The dashboard's first rows come from an inflater without AppCompat, so Android loads their fonts and the loader never sees them. */
    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aRowInflatedAheadOfTimeTakesTheFontAtEachTextsWeight() {
        Settings.APP_FONT.save(true);
        Typeface tumblrsRegular = Typeface.create(Typeface.SERIF, 400, false), tumblrsMedium = Typeface.create(Typeface.SERIF, 500, false);
        Typeface[] tumblrs = {tumblrsRegular, null, tumblrsMedium, null};
        Typeface authors = Typeface.create(Typeface.MONOSPACE, 400, false);

        TextView name = text(tumblrsMedium), body = text(tumblrsRegular), author = text(authors), bolded = text(Typeface.create(tumblrsMedium, Typeface.BOLD));
        Button follow = new Button(context);
        follow.setTypeface(tumblrsMedium);
        LinearLayout header = new LinearLayout(context), row = new LinearLayout(context);
        header.addView(name);
        header.addView(follow);
        header.addView(new ImageView(context));
        row.addView(header);
        row.addView(body);
        row.addView(author);
        row.addView(bolded);

        AppFont.restyle(row, tumblrs, context);

        Typeface medium = AppFont.replacement(context, MEDIUM);
        assertSame("a name", medium, name.getTypeface());
        assertSame("a button", medium, follow.getTypeface());
        assertSame("another weight", AppFont.replacement(context, REGULAR), body.getTypeface());
        assertSame("a post's author picked this", authors, author.getTypeface());
        assertSame("still bold, in the new font", Typeface.create(medium, Typeface.BOLD), bolded.getTypeface());
    }

    @Test
    public void offARowInflatedAheadOfTimeKeepsItsFont() {
        Typeface tumblrs = Typeface.create("sans-serif", Typeface.NORMAL);
        TextView name = text(tumblrs);
        AppFont.preinflated(name);
        assertSame(tumblrs, name.getTypeface());
    }

    @Test
    public void aBuildWithoutTheHooksLeavesAnInflatedRowAlone() {
        Settings.APP_FONT.save(true);
        PatchFamilyForTests.capabilities(EnumSet.noneOf(PatchFamily.Capability.class));
        Typeface tumblrs = Typeface.create("sans-serif", Typeface.NORMAL);
        TextView name = text(tumblrs);
        AppFont.preinflated(name);
        assertSame(tumblrs, name.getTypeface());
    }

    @Test
    public void aFontAndroidWontLoadLeavesTheRowAlone() {
        Settings.APP_FONT.save(true);
        Typeface tumblrs = Typeface.create("sans-serif", Typeface.NORMAL);
        TextView name = text(tumblrs);
        AppFont.preinflated(name);
        assertSame(tumblrs, name.getTypeface());
        String report = String.join("\n", HookStatus.report());
        assertTrue(report, report.contains("inflated row"));
    }

    @Test
    public void noRowIsLeftAlone() {
        Settings.APP_FONT.save(true);
        AppFont.preinflated(null);
        String report = String.join("\n", HookStatus.report());
        assertFalse(report, report.contains("inflated row"));
    }

    @Test
    public void everyKindOfFontFileIsTaken() throws Exception {
        for (String tag : new String[] {"OTTO", "true", "ttcf", "\0\1\0\0"}) {
            assertTrue(tag, AppFont.install(context, stream(font(tag)), "a").endsWith(" a"));
            assertTrue(tag, chosen.isFile());
        }
    }

    @Test
    public void aFileIsCopiedInAndNamed() throws Exception {
        byte[] bytes = font("OTTO");
        String saved = AppFont.install(context, stream(bytes), "My Font.ttf");
        assertEquals("My Font.ttf", AppFont.shownName(saved));
        assertArrayEquals(bytes, Files.readAllBytes(chosen.toPath()));
        assertFalse("nothing left halfway", new File(chosen.getParentFile(), "font.incoming").exists());
    }

    /** The saved value is what shows a restart is needed, so a new file has to change it. */
    @Test
    public void anotherFileUnderTheSameNameCountsAsAChange() throws Exception {
        String first = AppFont.install(context, stream(font("OTTO")), "a.ttf");
        assertEquals(first, AppFont.install(context, stream(font("OTTO")), "a.ttf"));
        assertNotEquals(first, AppFont.install(context, stream(font("true")), "a.ttf"));
    }

    @Test
    public void noChosenFileShowsNoName() {
        assertEquals("", AppFont.shownName(""));
    }

    @Test
    public void aNameIsKeptToOneShortLine() throws Exception {
        assertEquals("font", AppFont.shownName(AppFont.install(context, stream(font("OTTO")), null)));
        assertEquals("font", AppFont.shownName(AppFont.install(context, stream(font("OTTO")), "  \n ")));
        assertEquals("a b.ttf", AppFont.shownName(AppFont.install(context, stream(font("OTTO")), " a\nb.ttf ")));
        StringBuilder longName = new StringBuilder();
        for (int at = 0; at < 200; at++) longName.append('x');
        assertEquals(80, AppFont.shownName(AppFont.install(context, stream(font("OTTO")), longName.toString())).length());
    }

    @Test
    public void somethingElseIsRefusedAndTheFontInUseStays() throws Exception {
        byte[] kept = font("OTTO");
        AppFont.install(context, stream(kept), "a.otf");
        AppFont.Refused refused = assertThrows(AppFont.Refused.class,
                () -> AppFont.install(context, stream("not a font at all".getBytes(StandardCharsets.UTF_8)), "photo.jpg"));
        assertFalse("the file's name stays out of it", refused.getMessage().contains("photo"));
        assertArrayEquals(kept, Files.readAllBytes(chosen.toPath()));
        assertFalse(new File(chosen.getParentFile(), "font.incoming").exists());
    }

    @Test
    public void aFileTooShortToHaveAHeaderIsRefused() {
        assertThrows(AppFont.Refused.class, () -> AppFont.install(context, stream(new byte[] {'O', 'T'}), "a"));
        assertFalse(chosen.exists());
    }

    @Test
    public void aHugeFileIsRefusedPartWay() throws Exception {
        byte[] kept = font("OTTO");
        AppFont.install(context, stream(kept), "a.otf");
        byte[] large = font("true");
        assertThrows(AppFont.Refused.class, () -> AppFont.install(context, stream(large), "b.ttf", large.length - 1L));
        assertArrayEquals(kept, Files.readAllBytes(chosen.toPath()));
        assertFalse(new File(chosen.getParentFile(), "font.incoming").exists());
    }

    @Test
    public void aFailedReadLeavesTheFontInUse() throws Exception {
        byte[] kept = font("OTTO");
        AppFont.install(context, stream(kept), "a.otf");
        InputStream failing = new InputStream() {
            @Override
            public int read() throws IOException {
                throw new IOException("gone");
            }
        };
        assertThrows(IOException.class, () -> AppFont.install(context, failing, "b.ttf"));
        assertArrayEquals(kept, Files.readAllBytes(chosen.toPath()));
        assertFalse(new File(chosen.getParentFile(), "font.incoming").exists());
    }

    @Test
    public void forgettingDeletesTheFile() throws Exception {
        AppFont.install(context, stream(font("OTTO")), "a.otf");
        AppFont.forget(context);
        assertFalse(chosen.exists());
    }

    /** The real font engine turns this one down, which is what the header check can't see. */
    @Test
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aFontHeaderWithNoFontBehindItIsRefused() {
        assertThrows(AppFont.Refused.class, () -> AppFont.install(context, stream(font("OTTO")), "a.otf"));
        assertFalse(chosen.exists());
    }

    private TextView text(Typeface face) {
        TextView view = new TextView(context);
        view.setTypeface(face);
        return view;
    }

    private static byte[] font(String tag) {
        byte[] start = tag.getBytes(StandardCharsets.ISO_8859_1);
        byte[] whole = new byte[64];
        System.arraycopy(start, 0, whole, 0, start.length);
        return whole;
    }

    private static InputStream stream(byte[] bytes) {
        return new ByteArrayInputStream(bytes);
    }
}
