package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Looper;
import android.view.View;
import android.widget.TextView;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowToast;
import static org.junit.Assert.*;

/** #212: a font file for Your own home header's words alone, with bold sans whenever there's none that loads. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class HomeHeaderFontTest {
    private static final String LATIN = "HushMessenger draws the chats";

    @Rule public final TemporaryFolder folder = new TemporaryFolder();
    private Context context;

    @Before public void reset() throws Exception {
        FontFile.testFolder = folder.newFolder();
        OwnFont.fileCheck = OwnFontTest::loadsCopy;
        context = RuntimeEnvironment.getApplication();
        context.getSharedPreferences("hushmessenger", Context.MODE_PRIVATE).edit().clear().commit();
        Settings.initialize(context);
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        ShadowToast.reset();
        ChoiceFilesTest.clearFiles(context);
        OwnFont.forget();
    }

    @After public void restore() throws Exception {
        CustomFontSettingsTest.settle();
        ChoiceFilesTest.clearFiles(context);
        Settings.preferences.edit().clear().commit();
        OwnFont.forget();
        FontFile.testFolder = null;
        OwnFont.fileCheck = OwnFont::loads;
    }

    private static Drawable wordmark() {
        GradientDrawable mark = new GradientDrawable();
        mark.setColor(Color.BLUE);
        mark.setSize(300, 60);
        return mark;
    }

    private static void words(String typed) {
        Settings.preferences.edit().putBoolean(HomeHeader.KEY, true).putString(HomeHeader.TEXT, typed).commit();
    }

    /** Picks [bytes] the way the row does: a checked copy into the words' own file, then its name. */
    private File pick(byte[] bytes, String name) throws Exception {
        File copy = HomeHeader.fontFile(context);
        FontFile.copy(new ByteArrayInputStream(bytes), copy, OwnFontTest::loadsCopy);
        Settings.preferences.edit().putString(HomeHeader.FONT_NAME, name).commit();
        HomeHeader.forget();
        return copy;
    }

    /** A face built from a copy of [bytes] of its own, so the words' file is never the one it maps. */
    private Typeface built(byte[] bytes) throws Exception {
        File other = folder.newFile();
        Files.write(other.toPath(), bytes);
        Typeface face = new Typeface.Builder(other).build();
        assertNotNull(face);
        return face;
    }

    private static float width(Typeface face) {
        return OwnFontTest.width(face, LATIN);
    }

    private static float boldSans() {
        return width(Typeface.create(Typeface.SANS_SERIF, Typeface.BOLD));
    }

    private static Typeface face(Drawable shown) {
        assertTrue(shown instanceof HomeHeader.TextMark);
        return ((HomeHeader.TextMark) shown).typeface();
    }

    /** Nothing outside the header picks up the words' font: Use your own font has no file and keeps the phone's. */
    private void restOfMessengerUnchanged() {
        assertEquals("", Settings.preferences.getString(OwnFont.NAME_KEY, ""));
        assertFalse(FontFile.file(context).exists());
        OwnFont.forget();
        assertNull(OwnFont.picked());
        assertSame(Typeface.DEFAULT, OwnFont.replacePhoneFont(Typeface.DEFAULT));
        Typeface sans = Typeface.create(Typeface.SANS_SERIF, Typeface.NORMAL);
        assertSame(sans, OwnFont.replacePhoneFont(sans));
    }

    @Test public void theWordsDrawInThePickedFontAndNothingElseDoes() throws Exception {
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        words(LATIN);
        Typeface before = face(HomeHeader.dress(wordmark()));
        assertEquals("bold sans until a font is picked", boldSans(), width(before), 0.01f);
        assertEquals("text\n" + LATIN, HomeHeader.inUse(context));

        File copy = pick(rubik, "Rubik-Regular.ttf");
        // Use your own font's switch is on too, with no file of its own, so it stays on the phone's font.
        Settings.preferences.edit().putBoolean(OwnFont.KEY, true).commit();
        assertEquals("the restart row and the mark cache see the font",
            "text\n" + LATIN + "\nfont\n" + copy.lastModified() + "\n" + copy.length(), HomeHeader.inUse(context));
        Drawable shown = HomeHeader.dress(wordmark());
        assertEquals(LATIN, ((HomeHeader.TextMark) shown).text);
        Typeface face = face(shown);
        assertSame(HomeHeader.typeface(context), face);
        assertEquals("drawn in Rubik", width(built(rubik)), width(face), 0.01f);
        assertNotEquals("not bold sans", boldSans(), width(face), 0.5f);
        restOfMessengerUnchanged();

        // A picture that won't decode leaves the words, still in their font.
        Files.write(HomeHeader.file(context).toPath(), "not a picture".getBytes(java.nio.charset.StandardCharsets.UTF_8));
        HomeHeader.forget();
        assertSame(HomeHeader.typeface(context), face(HomeHeader.dress(wordmark())));
    }

    @Test public void aFileThatWontLoadLeavesBoldSans() throws Exception {
        words("Chats");
        // Starts like a TrueType font, so only loading it shows it isn't one.
        byte[] broken = new byte[4096];
        broken[1] = 1;
        Files.write(HomeHeader.fontFile(context).toPath(), broken);
        Settings.preferences.edit().putString(HomeHeader.FONT_NAME, "Broken.ttf").commit();
        assertNull(HomeHeader.typeface(context));
        assertEquals(boldSans(), width(face(HomeHeader.dress(wordmark()))), 0.01f);
        restOfMessengerUnchanged();
    }

    @Test public void aMissingFileOrAnUnnamedOneLeavesBoldSans() throws Exception {
        words("Chats");
        Settings.preferences.edit().putString(HomeHeader.FONT_NAME, "Gone.ttf").commit();
        assertNull(HomeHeader.picked(context));
        assertNull(HomeHeader.typeface(context));
        assertEquals("nothing for a restart to pick up", "text\nChats", HomeHeader.inUse(context));
        assertEquals(boldSans(), width(face(HomeHeader.dress(wordmark()))), 0.01f);

        // A copy no name points at isn't a choice either.
        pick(FontFileTest.font(FontFileTest.STATIC_FONT), "");
        assertNull(HomeHeader.picked(context));
        assertEquals("text\nChats", HomeHeader.inUse(context));
        assertEquals(boldSans(), width(face(HomeHeader.dress(wordmark()))), 0.01f);
    }

    @Test public void theRowsPickShowAndRemoveTheWordsFont() throws Exception {
        Settings.preferences.edit().putBoolean(HomeHeader.KEY, true).commit();
        OpenSections.all();
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            TextView status = root.findViewWithTag("home_header_font_status");
            View remove = root.findViewWithTag("home_header_font_remove");
            assertEquals("The words use a bold sans font. Choose a .ttf or .otf file of up to 20 MB to use your own.",
                status.getText().toString());
            assertEquals(View.GONE, remove.getVisibility());

            root.findViewWithTag("home_header_font_choose").performClick();
            var request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals(SettingsActivity.PICK_HOME_HEADER_FONT, request.requestCode);
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, request.intent.getAction());
            assertTrue(request.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            assertEquals("*/*", request.intent.getType());
            assertArrayEquals(FontFileRow.FONT_TYPES, request.intent.getStringArrayExtra(Intent.EXTRA_MIME_TYPES));

            activity.onActivityResult(SettingsActivity.PICK_HOME_HEADER_FONT, Activity.RESULT_CANCELED, null);
            assertNull(ShadowToast.getTextOfLatestToast());
            activity.onActivityResult(SettingsActivity.PICK_HOME_HEADER_FONT, Activity.RESULT_OK,
                new Intent().setData(Uri.parse("file:///sdcard/Rubik.ttf")));
            assertEquals("A file path isn't a picker's grant", "Couldn't open that file. Your font didn't change.",
                ShadowToast.getTextOfLatestToast());

            Uri photo = Uri.parse("content://fonts/picked/photo.png");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(photo,
                new ByteArrayInputStream(new byte[] {(byte) 0x89, 'P', 'N', 'G', 0, 0, 0, 0}));
            activity.onActivityResult(SettingsActivity.PICK_HOME_HEADER_FONT, Activity.RESULT_OK, new Intent().setData(photo));
            awaitToast("Not a .ttf or .otf font. Your font didn't change.");
            assertEquals("", Settings.preferences.getString(HomeHeader.FONT_NAME, ""));
            assertFalse(HomeHeader.fontFile(activity).exists());

            Uri picked = Uri.parse("content://fonts/picked/Rubik-Regular.ttf");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(picked, new ByteArrayInputStream(rubik));
            activity.onActivityResult(SettingsActivity.PICK_HOME_HEADER_FONT, Activity.RESULT_OK, new Intent().setData(picked));
            awaitToast("Font saved.");
            assertEquals("Rubik-Regular.ttf", Settings.preferences.getString(HomeHeader.FONT_NAME, ""));
            assertArrayEquals(rubik, Files.readAllBytes(HomeHeader.fontFile(activity).toPath()));
            assertEquals("The words use Rubik-Regular.ttf.", status.getText().toString());
            assertEquals(View.VISIBLE, remove.getVisibility());
            assertTrue(root.findViewWithTag("home_header_font_choose").isEnabled());
            // The picture's own line and buttons never took part.
            assertEquals(activity.text.get("home_header_none"),
                ((TextView) root.findViewWithTag("home_header_status")).getText().toString());
            assertTrue(root.findViewWithTag("home_header_choose").isEnabled());
            restOfMessengerUnchanged();

            remove.performClick();
            assertFalse("no second remove while one runs", remove.isEnabled());
            CustomFontSettingsTest.settle();
            assertEquals("Font removed.", ShadowToast.getTextOfLatestToast());
            assertEquals("", Settings.preferences.getString(HomeHeader.FONT_NAME, null));
            assertFalse(HomeHeader.fontFile(activity).exists());
            assertTrue(status.getText().toString().startsWith("The words use a bold sans font."));
            assertEquals(View.GONE, remove.getVisibility());
            assertTrue(root.findViewWithTag("home_header_font_choose").isEnabled());

            // With the file gone from under it, the line says so and Remove still clears the name.
            Settings.preferences.edit().putString(HomeHeader.FONT_NAME, "Rubik-Regular.ttf").commit();
            ((HomeHeaderRow) org.robolectric.util.ReflectionHelpers.getField(activity, "homeHeader")).refresh();
            assertEquals("HushMessenger's copy of Rubik-Regular.ttf is gone, so the words use bold sans. Choose the file again.",
                status.getText().toString());
            assertEquals(View.VISIBLE, remove.getVisibility());
            remove.performClick();
            CustomFontSettingsTest.settle();
            assertEquals("", Settings.preferences.getString(HomeHeader.FONT_NAME, null));
            assertEquals(View.GONE, remove.getVisibility());
        }
    }

    @Test public void aSavedChoicesFileCarriesTheWordsFont() throws Exception {
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        words("Chats");
        File copy = pick(rubik, "Rubik-Regular.ttf");
        Set<String> installed = Settings.installed;
        assertTrue("the font alone makes a zip", ChoiceFiles.any(context, Settings.preferences, installed));
        String text = ChoiceCodec.encode(Settings.preferences, installed);
        ChoiceFiles.Backup backup = ChoiceFiles.unzip(new ByteArrayInputStream(
            ChoiceFiles.zip(context, text, Settings.preferences, installed)));
        assertEquals(new HashSet<>(Arrays.asList(ChoiceFiles.HEADER_FONT, ChoiceFiles.HEADER_FONT_NAME)), backup.files.keySet());
        assertFalse("the name travels with the file, never in the text", text.contains("Rubik"));

        assertTrue(copy.delete());
        Settings.preferences.edit().remove(HomeHeader.FONT_NAME).commit();
        Set<String> withoutHeader = new HashSet<>(installed);
        withoutHeader.remove(HomeHeader.KEY);
        ChoiceFiles.Result skipped = ChoiceFiles.restore(context, Settings.preferences, backup.files, withoutHeader);
        assertEquals(1, skipped.unavailable);
        assertFalse(copy.exists());

        ChoiceFiles.Result result = ChoiceFiles.restore(context, Settings.preferences, backup.files, installed);
        assertEquals(1, result.total);
        assertEquals(1, result.changed);
        assertEquals(0, result.damaged);
        assertArrayEquals(rubik, Files.readAllBytes(copy.toPath()));
        assertEquals("Rubik-Regular.ttf", Settings.preferences.getString(HomeHeader.FONT_NAME, ""));
        restOfMessengerUnchanged();
        ChoiceFiles.Result again = ChoiceFiles.restore(context, Settings.preferences, backup.files, installed);
        assertEquals(1, again.total);
        assertEquals(0, again.changed);
    }

    private static void awaitToast(String prefix) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 10_000;
        do {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            String toast = ShadowToast.getTextOfLatestToast();
            if (toast != null && toast.startsWith(prefix)) return;
            Thread.sleep(20);
        } while (System.currentTimeMillis() < deadline);
        fail("Missing header font result: " + prefix + "; latest toast: " + ShadowToast.getTextOfLatestToast());
    }
}
