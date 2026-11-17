/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;
import static org.robolectric.Shadows.shadowOf;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.net.Uri;
import android.provider.OpenableColumns;
import android.text.TextPaint;
import android.widget.TextView;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
// Loading a real font file and measuring text with it needs Robolectric's native graphics.
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CustomFontTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private Context context;

    @Before public void reset() {
        context = RuntimeEnvironment.getApplication();
        restore();
    }

    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.USE_SYSTEM_FONT);
        SettingReadsForTests.mend(Settings.CUSTOM_FONT);
        Settings.USE_SYSTEM_FONT.resetToDefault();
        Settings.CUSTOM_FONT.resetToDefault();
        CustomFont.remove(RuntimeEnvironment.getApplication());
        CustomFont.resetForTests();
        HookStatus.clear();
        Named.next = "Inter Display.ttf";
    }

    /** Arvo, a slab serif whose letters are wider than Roboto's, from the test classpath. */
    private static byte[] arvo() throws IOException {
        try (InputStream in = CustomFontTest.class.getClassLoader().getResourceAsStream("fonts/Arvo-Regular.ttf")) {
            assertNotNull("Arvo is on the test classpath", in);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            for (int read; (read = in.read(buffer)) != -1; ) out.write(buffer, 0, read);
            return out.toByteArray();
        }
    }

    private Uri offered(String id, InputStream stream) {
        Uri uri = Uri.parse("content://fonts.test/document/" + id);
        shadowOf(context.getContentResolver()).registerInputStream(uri, stream);
        return uri;
    }

    /** Arvo saved and both settings on, as the Font file row leaves them, then a fresh start. */
    private Typeface arvoSaved() throws IOException {
        assertEquals(CustomFont.Saved.SAVED, CustomFont.save(context, offered("arvo", new ByteArrayInputStream(arvo()))));
        Settings.CUSTOM_FONT.save("Arvo-Regular.ttf");
        Settings.USE_SYSTEM_FONT.save(true);
        CustomFont.resetForTests();
        Typeface face = CustomFont.face();
        assertNotNull("the saved file loads as a font", face);
        return face;
    }

    private static float width(Typeface face) {
        TextPaint paint = new TextPaint();
        paint.setTextSize(40);
        paint.setTypeface(face);
        return paint.measureText("Hello Telegram");
    }

    @Test public void aFontIsCopiedInAndLoadsAsAFont() throws IOException {
        assertFalse(CustomFont.present(context));
        assertEquals(CustomFont.Saved.SAVED, CustomFont.save(context, offered("1", new ByteArrayInputStream(arvo()))));
        File file = CustomFont.file(context);
        assertNotNull(file);
        assertTrue(CustomFont.present(context));
        assertEquals(arvo().length, file.length());
        assertTrue("kept where Android's app backup doesn't reach",
                file.getAbsolutePath().startsWith(context.getNoBackupFilesDir().getAbsolutePath()));
        assertEquals("the font and the note naming it, nothing half written", 2, file.getParentFile().list().length);
        assertTrue(CustomFont.readable(file));

        // A second pick goes in beside the first, which Telegram may still be drawing with.
        assertEquals(CustomFont.Saved.SAVED, CustomFont.save(context, offered("again", new ByteArrayInputStream(arvo()))));
        File second = CustomFont.file(context);
        assertNotNull(second);
        assertNotEquals(file, second);
        assertEquals(arvo().length, second.length());
        assertTrue(CustomFont.present(context));
    }

    @Test public void aFileThatIsntAFontIsRefusedAndTheOldFontStays() throws IOException {
        assertEquals(CustomFont.Saved.SAVED, CustomFont.save(context, offered("1", new ByteArrayInputStream(arvo()))));
        File before = CustomFont.file(context);
        byte[] notAFont = "<html><body>not a font</body></html>".getBytes(java.nio.charset.StandardCharsets.UTF_8);
        assertEquals(CustomFont.Saved.NOT_A_FONT, CustomFont.save(context, offered("2", new ByteArrayInputStream(notAFont))));
        assertEquals(CustomFont.Saved.NOT_A_FONT, CustomFont.save(context, offered("3", new ByteArrayInputStream(new byte[0]))));
        assertEquals("the font picked before is still the one in use", before, CustomFont.file(context));
        assertEquals(arvo().length, before.length());
        assertEquals("nothing of the refused files is left", 2, before.getParentFile().list().length);
    }

    @Test public void aFileTooLargeIsRefusedWithoutReadingItAllOrReplacingTheFont() throws IOException {
        assertEquals(CustomFont.Saved.SAVED, CustomFont.save(context, offered("1", new ByteArrayInputStream(arvo()))));
        InputStream endless = new InputStream() {
            private long left = CustomFont.MAX_BYTES + 1;
            @Override public int read() { return left-- > 0 ? 0 : -1; }
            @Override public int read(byte[] buffer, int offset, int length) {
                if (left <= 0) return -1;
                int n = (int) Math.min(length, left);
                left -= n;
                return n;
            }
        };
        File before = CustomFont.file(context);
        assertEquals(CustomFont.Saved.TOO_LARGE, CustomFont.save(context, offered("big", endless)));
        assertEquals(before, CustomFont.file(context));
        assertEquals(arvo().length, before.length());
        assertEquals("the cut-off copy is gone", 2, before.getParentFile().list().length);
    }

    @Test public void aPickerWithNothingBehindTheLinkFailsWithoutAFile() {
        Uri gone = Uri.parse("content://fonts.test/document/gone");
        assertEquals(CustomFont.Saved.FAILED, CustomFont.save(context, gone));
        assertFalse(CustomFont.present(context));
        assertNull(CustomFont.file(context));
    }

    @Test public void theFontIsUsedOnlyWhileUseSystemFontIsOnAndANameIsSaved() throws IOException {
        Typeface face = arvoSaved();
        assertNotEquals("Arvo measures differently from the phone's face", width(Typeface.DEFAULT), width(face), 0.5f);

        Settings.USE_SYSTEM_FONT.save(false);
        assertNull(CustomFont.face());
        assertSame(Typeface.DEFAULT, CustomFont.regular(Typeface.DEFAULT));
        Settings.USE_SYSTEM_FONT.save(true);
        assertSame(face, CustomFont.face());

        PauseForTests.pause(HushTelegramPause.Reason.SWITCH);
        assertNull("a pause hands Telegram its own faces back", CustomFont.face());
        PauseForTests.resume();
        assertSame(face, CustomFont.face());

        Settings.CUSTOM_FONT.save("");
        CustomFont.resetForTests();
        assertNull("no name saved means no font, even with the file there", CustomFont.face());
    }

    @Test public void theFontIsDecidedOncePerStartSoAChangeWaitsForTheRestart() throws IOException {
        Typeface face = arvoSaved();
        CustomFont.remove(context);
        Settings.CUSTOM_FONT.save("");
        assertSame("removed mid-run, the text keeps the font until the restart", face, CustomFont.face());
        CustomFont.resetForTests();
        assertNull(CustomFont.face());

        assertEquals(CustomFont.Saved.SAVED, CustomFont.save(context, offered("again", new ByteArrayInputStream(arvo()))));
        Settings.CUSTOM_FONT.save("Arvo-Regular.ttf");
        assertNull("picked mid-run, the font waits for the restart too", CustomFont.face());
        CustomFont.resetForTests();
        assertNotNull(CustomFont.face());
    }

    @Test public void aRemovedFontLoadsNothingEvenWithItsNameSaved() throws IOException {
        arvoSaved();
        assertTrue(CustomFont.remove(context));
        assertFalse(CustomFont.present(context));
        assertNull(CustomFont.file(context));
        CustomFont.resetForTests();
        assertNull(CustomFont.face());
        assertSame(Typeface.DEFAULT_BOLD, CustomFont.bold(Typeface.DEFAULT_BOLD));
    }

    @Test public void newPaintsWithNoFaceTakeTheFontAndOthersKeepTheirs() throws IOException {
        Typeface face = arvoSaved();
        TextPaint fresh = new TextPaint(Paint.ANTI_ALIAS_FLAG);
        CustomFont.paint(fresh);
        assertSame(face, fresh.getTypeface());

        TextPaint mono = new TextPaint();
        mono.setTypeface(Typeface.MONOSPACE);
        CustomFont.paint(mono);
        assertSame(Typeface.MONOSPACE, mono.getTypeface());

        CustomFont.paint(null);
        assertTrue(String.join("\n", HookStatus.report()).contains("font file used 1"));
    }

    @Test public void newTextViewsTakeTheFontAtTheirWeightAndMonospaceStays() throws IOException {
        Typeface face = arvoSaved();
        TextView plain = new TextView(context);
        CustomFont.view(plain);
        assertSame(face, plain.getTypeface());

        TextView bold = new TextView(context);
        bold.setTypeface(Typeface.DEFAULT_BOLD);
        CustomFont.view(bold);
        assertEquals(700, bold.getTypeface().getWeight());
        assertNotEquals(width(Typeface.DEFAULT_BOLD), width(bold.getTypeface()), 0.5f);

        TextView italic = new TextView(context);
        italic.setTypeface(Typeface.create(Typeface.DEFAULT, 400, true));
        CustomFont.view(italic);
        assertTrue(italic.getTypeface().isItalic());
        assertEquals(400, italic.getTypeface().getWeight());

        TextView code = new TextView(context);
        code.setTypeface(Typeface.MONOSPACE);
        CustomFont.view(code);
        assertSame(Typeface.MONOSPACE, code.getTypeface());

        CustomFont.view(null);
    }

    @Test public void plainFacesReadByNameBecomeTheFont() throws IOException {
        Typeface face = arvoSaved();
        assertSame(face, CustomFont.regular(Typeface.DEFAULT));
        assertSame(face, CustomFont.regular(Typeface.SANS_SERIF));
        Typeface bold = CustomFont.bold(Typeface.DEFAULT_BOLD);
        assertEquals(700, bold.getWeight());
        assertFalse(bold.isItalic());
        assertNotEquals(width(Typeface.DEFAULT_BOLD), width(bold), 0.5f);
    }

    @Test public void withoutAFontEveryHookLeavesTelegramAlone() {
        Settings.USE_SYSTEM_FONT.save(true);
        TextPaint paint = new TextPaint();
        CustomFont.paint(paint);
        assertNull(paint.getTypeface());
        TextView view = new TextView(context);
        Typeface before = view.getTypeface();
        CustomFont.view(view);
        assertSame(before, view.getTypeface());
        assertSame(Typeface.DEFAULT, CustomFont.regular(Typeface.DEFAULT));
        assertSame(Typeface.DEFAULT_BOLD, CustomFont.bold(Typeface.DEFAULT_BOLD));
        assertFalse(String.join("\n", HookStatus.report()).contains("font file used"));
    }

    @Test public void telegramsMediumItalicAndBoldFilesAskTheFontFirst() throws IOException {
        Typeface face = arvoSaved();
        assertEquals(700, CustomFont.forAsset("fonts/rmedium.ttf").getWeight());
        assertEquals(700, CustomFont.forAsset("fonts/rcondensedbold.ttf").getWeight());
        Typeface mediumItalic = CustomFont.forAsset("fonts/rmediumitalic.ttf");
        assertEquals(700, mediumItalic.getWeight());
        assertTrue(mediumItalic.isItalic());
        Typeface italic = CustomFont.forAsset("fonts/ritalic.ttf");
        assertEquals(400, italic.getWeight());
        assertTrue(italic.isItalic());
        assertEquals(800, CustomFont.forAsset("fonts/rextrabold.ttf").getWeight());
        assertNull("code blocks keep a monospace face", CustomFont.forAsset("fonts/rmono.ttf"));
        assertNull(CustomFont.forAsset("fonts/num.otf"));
        assertNull(CustomFont.forAsset(null));

        Typeface medium = SystemFont.typeface("fonts/rmedium.ttf");
        assertEquals(700, medium.getWeight());
        assertNotEquals("Telegram's bold text is drawn in the font", width(SystemFont.forAsset("fonts/rmedium.ttf")),
                width(medium), 0.5f);
        assertSame(Typeface.MONOSPACE, SystemFont.typeface("fonts/rmono.ttf"));
        assertNotSame(face, medium);
        assertTrue(String.join("\n", HookStatus.report()).contains("font file used 1"));
    }

    @Test public void theNameIsThePickersNameOrTheLinksLastPartCappedForTheRow() {
        Robolectric.buildContentProvider(Named.class).create("fonts.named");
        assertEquals("Inter Display.ttf", CustomFont.name(context, Uri.parse("content://fonts.named/x/42")));

        assertEquals("Inter.otf", CustomFont.name(context,
                Uri.parse("content://com.android.externalstorage.documents/document/primary%3ADownload%2FInter.otf")));
        assertEquals("Font file", CustomFont.name(context, Uri.parse("content://fonts.test/")));

        // A letter outside the BMP first, two chars long, so a cap by chars would cut one short.
        String letters = new String(Character.toChars(0x1F524));
        StringBuilder longName = new StringBuilder(letters);
        for (int i = 0; i < 80; i++) longName.append('a');
        Named.next = longName.append(".ttf").toString();
        String capped = CustomFont.name(context, Uri.parse("content://fonts.named/x/43"));
        assertEquals(CustomFont.NAME_LENGTH, capped.codePointCount(0, capped.length()));
        assertEquals("a cap never splits a character in half", CustomFont.NAME_LENGTH + 1, capped.length());
        assertTrue(capped.startsWith(letters + "a"));
        Named.next = "  ";
        assertEquals("44", CustomFont.name(context, Uri.parse("content://fonts.named/x/44")));
    }

    /** A picker's provider that names every document [next]. */
    public static final class Named extends ContentProvider {
        static String next = "Inter Display.ttf";

        @Override public boolean onCreate() { return true; }
        @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
            MatrixCursor row = new MatrixCursor(new String[] {OpenableColumns.DISPLAY_NAME});
            row.addRow(new Object[] {next});
            return row;
        }
        @Override public String getType(Uri uri) { return "font/ttf"; }
        @Override public Uri insert(Uri uri, ContentValues values) { return null; }
        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }
        @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { return 0; }
    }
}
