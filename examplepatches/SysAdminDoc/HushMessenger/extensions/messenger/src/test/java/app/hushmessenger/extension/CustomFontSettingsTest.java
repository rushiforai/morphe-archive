package app.hushmessenger.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Looper;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.lang.reflect.Proxy;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
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
import static org.junit.Assume.assumeTrue;

/**
 * The five entry points the custom_font hooks call, and the font file rows under its switch. Off, paused or before the
 * settings load, every typeface is Messenger's own. Emoji are never touched.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class CustomFontSettingsTest {
    private static final OwnFontTest.Family BOLD = OwnFontTest.Family.OPTIMISTIC_TEXT_APP_BOLD;
    private static final String GRINNING = "😀";

    @Rule public final TemporaryFolder folder = new TemporaryFolder();

    @Before public void reset() throws Exception {
        FontFile.testFolder = folder.newFolder();
        OwnFont.fileCheck = OwnFontTest::loadsCopy;
        Context app = RuntimeEnvironment.getApplication();
        app.getSharedPreferences("hushmessenger", Context.MODE_PRIVATE).edit().clear().commit();
        Settings.initialize(app);
        Settings.activeAt.clear();
        Settings.hookErrors.clear();
        CrashGuard.resetForTests();
        Settings.customFont = null;
        OwnFont.forget();
    }

    @After public void restore() throws Exception {
        settle();
        FontFileRow.fontTimeoutMillis = 60_000;
        Settings.preferences.edit().clear().commit();
        Settings.customFont = null;
        OwnFont.forget();
        FontFile.testFolder = null;
        OwnFont.fileCheck = OwnFont::loads;
    }

    private static void switchOn() {
        Settings.preferences.edit().putBoolean(OwnFont.KEY, true).commit();
    }

    private static Typeface emoji() throws Exception {
        File file = new File(RuntimeEnvironment.getApplication().getCacheDir(), "NotoColorEmoji.ttf");
        Files.write(file.toPath(), FontFileTest.font("fonts/NotoColorEmoji.ttf"));
        return new Typeface.Builder(file).build();
    }

    @Test public void offEveryTypefaceStaysMessengers() throws Exception {
        // A picked file changes nothing while the switch is off.
        OwnFontTest.pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Context app = RuntimeEnvironment.getApplication();
        Typeface meta = Typeface.create(Typeface.SERIF, 700, false);
        Typeface regular = Typeface.create("sans-serif", Typeface.NORMAL);
        assertSame(meta, Settings.customFontRepository(meta, BOLD, 700));
        assertSame(regular, Settings.customFontLayout(regular));
        assertNull(Settings.customFontLayout(null));
        assertSame(regular, Settings.customFontRoboto(regular));
        assertSame(regular, Settings.customFontByName(regular, "sans-serif"));
        TextView view = new TextView(app);
        Settings.customFontInput(view, regular, Typeface.NORMAL);
        assertSame(regular, view.getTypeface());
        assertEquals(Boolean.FALSE, Settings.customFont);
        assertEquals(0, Settings.lastActive(OwnFont.KEY));
    }

    @Test public void pausedOrNotInstalledAtTheFirstAskMeansOff() {
        Typeface meta = Typeface.create(Typeface.SERIF, 700, false);
        Settings.preferences.edit().putBoolean(OwnFont.KEY, true).putBoolean("paused", true).commit();
        assertSame(meta, Settings.customFontRepository(meta, BOLD, 700));
        Settings.customFont = null;
        Settings.preferences.edit().putBoolean("paused", false).commit();
        Settings.installed = java.util.Collections.emptySet();
        assertSame(meta, Settings.customFontRepository(meta, BOLD, 700));
        assertEquals(Boolean.FALSE, Settings.customFont);
    }

    @Test public void nothingIsHeldBeforeTheSettingsLoad() {
        switchOn();
        Typeface meta = Typeface.create(Typeface.SERIF, 700, false);
        android.content.SharedPreferences loaded = Settings.preferences;
        boolean started = HostScreens.started;
        // Started, so the hook can't load the settings itself and has to answer without them.
        HostScreens.started = true;
        Settings.preferences = null;
        try {
            assertSame(meta, Settings.customFontRepository(meta, BOLD, 700));
            assertNull(Settings.customFont);
            Settings.preferences = loaded;
            assertNotSame(meta, Settings.customFontRepository(meta, BOLD, 700));
            assertEquals(Boolean.TRUE, Settings.customFont);
        } finally {
            Settings.preferences = loaded;
            HostScreens.started = started;
        }
    }

    @Test public void onOptimisticBecomesThePhonesFontAndRobotoMonoStays() {
        switchOn();
        Typeface meta = Typeface.create(Typeface.SERIF, 400, false);
        assertSame(Typeface.create(Typeface.DEFAULT, 700, false), Settings.customFontRepository(meta, BOLD, 700));
        assertTrue(Settings.lastActive(OwnFont.KEY) > 0);
        Settings.activeAt.clear();

        Typeface mono = Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL);
        assertSame(mono, Settings.customFontRepository(mono, OwnFontTest.Family.ROBOTO_MONO_REGULAR, 400));
        assertSame("only the enum's constant names a family", mono, Settings.customFontRepository(mono, BOLD.name(), 400));
        assertSame(mono, Settings.customFontRepository(mono, null, 400));
        // With no file picked, the phone's font is the phone's font already.
        Typeface regular = Typeface.create("sans-serif", Typeface.NORMAL);
        assertSame(regular, Settings.customFontLayout(regular));
        assertNull(Settings.customFontLayout(null));
        assertSame(regular, Settings.customFontRoboto(regular));
        assertSame(regular, Settings.customFontByName(regular, "sans-serif"));
        assertEquals("nothing changed, so nothing counts as a use", 0, Settings.lastActive(OwnFont.KEY));
    }

    @Test public void aPickedFileReplacesThePhonesFontWhereverMessengerAsks() throws Exception {
        switchOn();
        OwnFontTest.pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Typeface regular = Typeface.create("sans-serif", Typeface.NORMAL);
        Typeface medium = Typeface.create("sans-serif-medium", Typeface.NORMAL);
        assertSame(OwnFont.typeface(400, false), Settings.customFontLayout(regular));
        assertSame("none means Android's default", OwnFont.typeface(400, false), Settings.customFontLayout(null));
        assertSame(OwnFont.typeface(medium.getWeight(), false), Settings.customFontRoboto(medium));
        assertSame(OwnFont.typeface(medium.getWeight(), false), Settings.customFontByName(medium, "sans-serif-medium"));
        assertSame(OwnFont.typeface(700, false), Settings.customFontRepository(Typeface.create(Typeface.SERIF, 400, false), BOLD, 700));
        assertTrue(Settings.lastActive(OwnFont.KEY) > 0);

        Typeface serif = Typeface.create("serif", Typeface.NORMAL);
        assertSame("another family by name stays", serif, Settings.customFontByName(serif, "serif"));
        assertNull(Settings.customFontByName(null, "sans-serif"));
        assertNull(Settings.customFontRoboto(null));
        Typeface mono = Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL);
        assertSame(mono, Settings.customFontRepository(mono, OwnFontTest.Family.ROBOTO_MONO_REGULAR, 400));

        TextView view = new TextView(RuntimeEnvironment.getApplication());
        Settings.customFontInput(view, null, Typeface.BOLD);
        assertSame("the input's style still applies", Typeface.create(OwnFont.typeface(400, false), Typeface.BOLD), view.getTypeface());
        Settings.customFontInput(view, mono, Typeface.NORMAL);
        assertSame(mono, view.getTypeface());
    }

    @Test public void emojiStayTheirOwnWithBothSwitchesOn() throws Exception {
        Settings.preferences.edit().putBoolean(OwnFont.KEY, true).putBoolean("use_system_emoji", true).commit();
        OwnFontTest.pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        Typeface emoji = emoji();
        assertSame(emoji, Settings.customFontLayout(emoji));
        assertSame(emoji, Settings.customFontRoboto(emoji));
        assertSame(emoji, Settings.customFontByName(emoji, "Noto Color Emoji"));
        TextView view = new TextView(RuntimeEnvironment.getApplication());
        Settings.customFontInput(view, emoji, Typeface.NORMAL);
        assertSame(emoji, view.getTypeface());

        // A picked file keeps Android's fallback, so an emoji in text drawn with it still has its glyph.
        Paint phone = new Paint();
        assumeTrue("this runtime draws no emoji at all", phone.hasGlyph(GRINNING));
        Paint picked = new Paint();
        picked.setTypeface(Settings.customFontLayout(Typeface.DEFAULT));
        assertNotSame(Typeface.DEFAULT, picked.getTypeface());
        assertTrue(picked.hasGlyph(GRINNING));
    }

    @Test public void theSwitchHoldsItsFirstAnswerUntilARestart() {
        switchOn();
        assertNull("nothing is held before Messenger asks", Settings.heldUntilRestart(OwnFont.KEY));
        Typeface meta = Typeface.create(Typeface.SERIF, 400, false);
        Typeface swapped = Settings.customFontRepository(meta, OwnFontTest.Family.OPTIMISTIC_TEXT_APP_REGULAR, 400);
        assertNotSame(meta, swapped);
        assertNull(Settings.heldUntilRestart(OwnFont.KEY));

        Settings.preferences.edit().putBoolean(OwnFont.KEY, false).commit();
        assertSame(swapped, Settings.customFontRepository(meta, OwnFontTest.Family.OPTIMISTIC_TEXT_APP_REGULAR, 400));
        assertEquals(Boolean.TRUE, Settings.heldUntilRestart(OwnFont.KEY));

        Settings.customFont = null;
        assertSame("a restart asks again", meta, Settings.customFontRepository(meta, OwnFontTest.Family.OPTIMISTIC_TEXT_APP_REGULAR, 400));
        switchOn();
        assertEquals(Boolean.FALSE, Settings.heldUntilRestart(OwnFont.KEY));
    }

    @Test public void theControlSitsUnderThemeAndSaysEmojiDontChange() {
        String[] row = java.util.Arrays.stream(SettingsActivity.CONTROLS).filter(c -> c[0].equals(OwnFont.KEY)).findFirst().orElseThrow();
        assertEquals("Use your own font", row[1]);
        assertEquals("theme", row[3]);
        assertTrue(row[2].contains("Emoji don't change."));
        assertTrue(row[2].contains("Restart Messenger"));
        assertTrue(Settings.installed.contains(OwnFont.KEY));
    }

    @Test public void theFontRowsFollowThePickedFile() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            TextView status = root.findViewWithTag("font_file_status");
            // With the switch off nothing is in use yet, so the line says what turning it on would do.
            assertEquals("None chosen. Turn the switch on to use your phone's font, or choose a .ttf or .otf font file of up to 20 MB.", status.getText().toString());
            assertEquals(View.GONE, root.findViewWithTag("font_phone").getVisibility());

            root.findViewWithTag("font_file").performClick();
            var request = Shadows.shadowOf(activity).getNextStartedActivityForResult();
            assertEquals(SettingsActivity.PICK_FONT, request.requestCode);
            assertEquals(Intent.ACTION_OPEN_DOCUMENT, request.intent.getAction());
            assertTrue(request.intent.hasCategory(Intent.CATEGORY_OPENABLE));
            assertEquals("*/*", request.intent.getType());
            assertArrayEquals(FontFileRow.FONT_TYPES, request.intent.getStringArrayExtra(Intent.EXTRA_MIME_TYPES));

            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_CANCELED, null);
            assertEquals("", Settings.preferences.getString(OwnFont.NAME_KEY, ""));
            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(Uri.parse("file:///sdcard/Rubik.ttf")));
            assertEquals("A file path isn't a picker's grant", "Couldn't open that file. Your font didn't change.", ShadowToast.getTextOfLatestToast());

            Uri photo = Uri.parse("content://fonts/picked/photo.png");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(photo,
                new ByteArrayInputStream(new byte[] {(byte) 0x89, 'P', 'N', 'G', 0, 0, 0, 0}));
            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(photo));
            awaitToast("Not a .ttf or .otf font. Your font didn't change.");
            assertEquals("", Settings.preferences.getString(OwnFont.NAME_KEY, ""));

            Uri rubik = Uri.parse("content://fonts/picked/Rubik-Regular.ttf");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(rubik,
                new ByteArrayInputStream(FontFileTest.font(FontFileTest.STATIC_FONT)));
            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(rubik));
            // With the switch off a restart wouldn't use it, so the toast names the switch. The file's name stays on
            // the status line, where a long one can't push the rest of the toast past its two lines.
            awaitToast("Font picked. Turn the switch on to use it.");
            assertEquals("Rubik-Regular.ttf", Settings.preferences.getString(OwnFont.NAME_KEY, ""));
            assertArrayEquals(FontFileTest.font(FontFileTest.STATIC_FONT), Files.readAllBytes(FontFile.file(activity).toPath()));
            assertEquals("Rubik-Regular.ttf is picked. Turn the switch on to use it.", status.getText().toString());
            assertEquals(View.VISIBLE, root.findViewWithTag("font_phone").getVisibility());
            assertTrue(root.findViewWithTag("font_file").isEnabled());
            ((android.widget.CompoundButton) root.findViewWithTag(OwnFont.KEY)).setChecked(true);
            assertEquals("Using Rubik-Regular.ttf. Choose another file to replace it.", status.getText().toString());
            // With the switch on, the restart is what's left.
            Uri bold = Uri.parse("content://fonts/picked/Rubik-Bold.ttf");
            Shadows.shadowOf(activity.getContentResolver()).registerInputStream(bold,
                new ByteArrayInputStream(FontFileTest.font(FontFileTest.STATIC_FONT)));
            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(bold));
            awaitToast("Font picked. Restart Messenger to use it.");
            assertEquals("Using Rubik-Bold.ttf. Choose another file to replace it.", status.getText().toString());
            ((android.widget.CompoundButton) root.findViewWithTag(OwnFont.KEY)).setChecked(false);

            root.findViewWithTag("font_phone").performClick();
            settle();
            assertEquals("", Settings.preferences.getString(OwnFont.NAME_KEY, null));
            assertEquals("Back to your phone's font. Restart Messenger to see it.", ShadowToast.getTextOfLatestToast());
            assertTrue(status.getText().toString().startsWith("None chosen"));
        }
    }

    /** #48: a picked file can be sized and moved in steps, held to what the font file takes. */
    @Test public void aPickedFileIsSizedAndMovedInSteps() throws Exception {
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("nothing picked, nothing to size", View.GONE, root.findViewWithTag("font_adjust").getVisibility());
        }
        OwnFontTest.pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            assertEquals(View.VISIBLE, root.findViewWithTag("font_adjust").getVisibility());
            TextView size = root.findViewWithTag("font_size_value"), place = root.findViewWithTag("font_shift_value");
            View smaller = root.findViewWithTag("font_size_smaller"), larger = root.findViewWithTag("font_size_larger");
            View up = root.findViewWithTag("font_shift_up"), down = root.findViewWithTag("font_shift_down");
            assertEquals("Text size 100%", size.getText().toString());
            assertEquals("Text sits where the font puts it", place.getText().toString());

            larger.performClick();
            settle();
            assertEquals(105, Settings.preferences.getInt(OwnFont.SCALE_KEY, 0));
            assertEquals("Text size 105%", size.getText().toString());
            assertEquals("Text size 105%. Restart Messenger to see it.", ShadowToast.getTextOfLatestToast());
            for (int step = 0; step < 20; step++) larger.performClick();
            settle();
            assertEquals(FontFile.SCALE_MOST, Settings.preferences.getInt(OwnFont.SCALE_KEY, 0));
            assertFalse(larger.isEnabled());
            for (int step = 0; step < 20; step++) smaller.performClick();
            settle();
            assertEquals(FontFile.SCALE_LEAST, Settings.preferences.getInt(OwnFont.SCALE_KEY, 0));
            assertEquals("Text size 70%", size.getText().toString());
            assertFalse(smaller.isEnabled());
            assertTrue(larger.isEnabled());

            up.performClick();
            settle();
            assertEquals(-2, Settings.preferences.getInt(OwnFont.SHIFT_KEY, 0));
            assertEquals("Text moved up 2%", place.getText().toString());
            down.performClick();
            down.performClick();
            settle();
            assertEquals("Text moved down 2%", place.getText().toString());
            assertEquals("Text moved down 2%. Restart Messenger to see it.", ShadowToast.getTextOfLatestToast());
            for (int step = 0; step < 20; step++) down.performClick();
            settle();
            assertEquals(FontFile.SHIFT_MOST, Settings.preferences.getInt(OwnFont.SHIFT_KEY, 0));
            assertFalse(down.isEnabled());
            assertTrue(up.isEnabled());

            // Going back to the phone's font takes the sized copies with the picked one, and the rows go.
            File sized = FontFile.adjusted(FontFile.file(activity), 120, 0);
            assertNotNull(sized);
            root.findViewWithTag("font_phone").performClick();
            settle();
            assertFalse(sized.exists());
            assertEquals(View.GONE, root.findViewWithTag("font_adjust").getVisibility());
        }
    }

    @Test @Config(sdk = 36) public void fontAdjustmentValuesAndButtonsFitLargeTextInBothDirections() throws Exception {
        OwnFontTest.pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        for (String locale : new String[] {"en-rUS", "ar-rXB"}) {
            RuntimeEnvironment.setQualifiers(locale + "-w320dp-h640dp-mdpi");
            RuntimeEnvironment.setFontScale(2f);
            for (boolean light : new boolean[] {false, true}) {
                Settings.preferences.edit().putBoolean("light", light).commit();
                try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                    View root = screen.get().getWindow().getDecorView();
                    ((EditText) root.findViewWithTag("find_control")).setText("Use your own font");
                    for (int pass = 0; pass < 2; pass++) {
                        root.measure(View.MeasureSpec.makeMeasureSpec(320, View.MeasureSpec.EXACTLY),
                            View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.EXACTLY));
                        root.layout(0, 0, 320, 640);
                        Shadows.shadowOf(Looper.getMainLooper()).idle();
                    }
                    for (String tag : new String[] {"font_size_value", "font_shift_value"}) {
                        TextView value = root.findViewWithTag(tag);
                        assertTrue(locale + " " + tag + " has room for its text", value.getWidth() > 0);
                        assertTrue(locale + " " + tag + " stays readable", value.getLineCount() >= 1 && value.getLineCount() <= 3);
                        assertEquals(0, value.getLayout().getEllipsisCount(value.getLineCount() - 1));
                        assertTrue(value.getLayout().getHeight() <= value.getHeight() - value.getTotalPaddingTop() - value.getTotalPaddingBottom());
                    }
                    for (String[] pair : new String[][] {{"font_size_smaller", "font_size_larger"}, {"font_shift_up", "font_shift_down"}}) {
                        View first = root.findViewWithTag(pair[0]), second = root.findViewWithTag(pair[1]);
                        View row = (View) first.getParent();
                        for (View button : new View[] {first, second}) {
                            assertTrue(locale + " " + button.getTag() + " has a usable width", button.getWidth() > 0);
                            assertTrue(button.getLeft() >= 0 && button.getRight() <= row.getWidth());
                        }
                        assertTrue("Step buttons share the available width", Math.abs(first.getWidth() - second.getWidth()) <= 1);
                    }
                    String screenshots = System.getenv("HUSH_SCREENSHOTS");
                    if (screenshots != null && !screenshots.isBlank()) {
                        Files.createDirectories(new File(screenshots).toPath());
                        for (String tag : new String[] {"font_size_value", "font_shift_value"}) {
                            View value = root.findViewWithTag(tag);
                            android.view.ViewGroup adjustment = (android.view.ViewGroup) value.getParent();
                            View actions = adjustment.getChildAt(adjustment.indexOfChild(value) + 1);
                            adjustment.requestRectangleOnScreen(new android.graphics.Rect(Math.min(value.getLeft(), actions.getLeft()),
                                value.getTop(), Math.max(value.getRight(), actions.getRight()), actions.getBottom()), true);
                            root.measure(View.MeasureSpec.makeMeasureSpec(320, View.MeasureSpec.EXACTLY),
                                View.MeasureSpec.makeMeasureSpec(640, View.MeasureSpec.EXACTLY));
                            root.layout(0, 0, 320, 640);
                            android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(320, 640, android.graphics.Bitmap.Config.ARGB_8888);
                            try (var stream = new java.io.ByteArrayOutputStream()) {
                                root.draw(new android.graphics.Canvas(bitmap));
                                assertTrue(bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream));
                                Files.write(new File(screenshots, "settings-" + tag + "-" + (light ? "light" : "dark") + "-" +
                                    (locale.equals("ar-rXB") ? "rtl" : "large") + ".png").toPath(), stream.toByteArray());
                            } finally { bitmap.recycle(); }
                        }
                    }
                }
            }
        }
    }

    @Test public void aNameWhoseCopyIsGoneSaysSoAndKeepsTheWayBack() {
        Settings.preferences.edit().putString(OwnFont.NAME_KEY, "Gone.ttf").commit();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("HushMessenger's copy of Gone.ttf is gone, so your phone's font is used. Choose the file again.",
                ((TextView) root.findViewWithTag("font_file_status")).getText().toString());
            assertEquals(View.VISIBLE, root.findViewWithTag("font_phone").getVisibility());
        }
    }

    /**
     * Android takes a commit into memory before the disk answers. A size, a move, the phone's font or a new file whose save
     * fails or throws leaves the picked name, its copy and the size as they were and says so, and a later save of anything
     * else doesn't keep the change.
     */
    @Test public void aSaveTheDiskRefusesLeavesTheFontAsItWas() throws Exception {
        OwnFontTest.pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT);
        SharedPreferences prefs = Settings.preferences;
        AtomicReference<String> refusal = new AtomicReference<>();
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            // After setup: the screen's own Settings.initialize would put the real preferences back.
            Settings.preferences = refusing(prefs, refusal);
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            TextView size = root.findViewWithTag("font_size_value"), status = root.findViewWithTag("font_file_status");
            for (String way : new String[] {"false", "throw"}) {
                refusal.set(way);
                root.findViewWithTag("font_size_larger").performClick();
                settle();
                assertFalse(way, prefs.contains(OwnFont.SCALE_KEY));
                assertEquals("Text size 100%", size.getText().toString());
                assertEquals("Couldn't save that. Your font didn't change.", ShadowToast.getTextOfLatestToast());
                root.findViewWithTag("font_shift_down").performClick();
                settle();
                assertFalse(way, prefs.contains(OwnFont.SHIFT_KEY));

                root.findViewWithTag("font_phone").performClick();
                settle();
                assertEquals(way, "Rubik-Regular.ttf", prefs.getString(OwnFont.NAME_KEY, null));
                assertArrayEquals(rubik, Files.readAllBytes(FontFile.file(activity).toPath()));
                assertEquals("Couldn't go back to your phone's font. Try again.", ShadowToast.getTextOfLatestToast());
                assertEquals("Rubik-Regular.ttf is picked. Turn the switch on to use it.", status.getText().toString());

                Uri other = Uri.parse("content://fonts/picked/NotoSansKhmer-VF.ttf");
                Shadows.shadowOf(activity.getContentResolver()).registerInputStream(other,
                    new ByteArrayInputStream(FontFileTest.font(FontFileTest.VARIABLE_FONT)));
                activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(other));
                awaitToast("Couldn't save the font. Check free space and retry.");
                assertEquals(way, "Rubik-Regular.ttf", prefs.getString(OwnFont.NAME_KEY, null));
                assertArrayEquals(rubik, Files.readAllBytes(FontFile.file(activity).toPath()));
                assertEquals("Rubik-Regular.ttf is picked. Turn the switch on to use it.", status.getText().toString());
            }
        } finally {
            Settings.preferences = prefs;
        }
        assertTrue(prefs.edit().putBoolean("check_updates", false).commit());
        assertEquals("Rubik-Regular.ttf", prefs.getString(OwnFont.NAME_KEY, null));
        assertFalse(prefs.contains(OwnFont.SCALE_KEY));
        assertFalse(prefs.contains(OwnFont.SHIFT_KEY));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            View root = screen.get().getWindow().getDecorView();
            assertEquals("Rubik-Regular.ttf is picked. Turn the switch on to use it.",
                ((TextView) root.findViewWithTag("font_file_status")).getText().toString());
            assertEquals("Text size 100%", ((TextView) root.findViewWithTag("font_size_value")).getText().toString());
        }
    }

    /** [prefs] whose commits, while [refusal] names a way, change memory as Android's do and then return false or throw. */
    private static SharedPreferences refusing(SharedPreferences prefs, AtomicReference<String> refusal) {
        ClassLoader loader = CustomFontSettingsTest.class.getClassLoader();
        return (SharedPreferences) Proxy.newProxyInstance(loader, new Class<?>[] {SharedPreferences.class}, (proxy, method, args) -> {
            Object result = method.invoke(prefs, args);
            if (!method.getName().equals("edit")) return result;
            SharedPreferences.Editor editor = (SharedPreferences.Editor) result;
            return Proxy.newProxyInstance(loader, new Class<?>[] {SharedPreferences.Editor.class}, (editProxy, editMethod, editArgs) -> {
                Object edited = editMethod.invoke(editor, editArgs);
                String way = refusal.get();
                if (editMethod.getName().equals("commit") && way != null) {
                    if (way.equals("throw")) throw new IllegalStateException("injected commit failure");
                    return false;
                }
                return edited == editor ? editProxy : edited;
            });
        });
    }

    @Test public void aPickedNameIsOneShortLineWithNothingHidden() {
        assertEquals("your font file", FontFileRow.cleanFontName(null));
        assertEquals("your font file", FontFileRow.cleanFontName(" ‎\u0007 "));
        assertEquals("My Font.ttf", FontFileRow.cleanFontName("My‮  Font\u0000.ttf"));
        assertEquals("a line break goes, it doesn't split the row", "MyFont.ttf", FontFileRow.cleanFontName("My\nFont.ttf"));
        assertEquals(FontFileRow.MAX_FONT_NAME, FontFileRow.cleanFontName("x".repeat(500)).length());
        Uri uri = Uri.parse("content://fonts/document/Inter-Regular.otf");
        assertEquals("Inter-Regular.otf", FontFileRow.fontName(RuntimeEnvironment.getApplication(), uri));
        // A storage document ID carries its folders, which never show.
        Uri document = Uri.parse("content://com.android.externalstorage.documents/document/primary%3ADownload%2FFonts%2FInter-Regular.otf");
        assertEquals("primary:Download/Fonts/Inter-Regular.otf", document.getLastPathSegment());
        assertEquals("Inter-Regular.otf", FontFileRow.fontName(RuntimeEnvironment.getApplication(), document));
        assertEquals("Inter-Regular.otf", FontFileRow.lastPart("primary:Inter-Regular.otf"));
        assertEquals("your font file", FontFileRow.cleanFontName(FontFileRow.lastPart("primary:Download/")));
        assertNull(FontFileRow.lastPart(null));
    }

    /** A slow save never holds up a tap. Quick taps add up, run on the font save thread and say only the last result. */
    @Test public void aSlowSaveWaitsOffTheMainThreadAndQuickTapsAddUp() throws Exception {
        OwnFontTest.pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        SharedPreferences prefs = Settings.preferences;
        CountDownLatch disk = new CountDownLatch(1);
        List<String> savedOn = Collections.synchronizedList(new ArrayList<>());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            // After setup: the screen's own Settings.initialize would put the real preferences back.
            Settings.preferences = slow(prefs, disk, savedOn);
            View root = screen.get().getWindow().getDecorView();
            View larger = root.findViewWithTag("font_size_larger");
            int toasts = ShadowToast.shownToastCount();
            for (int tap = 0; tap < 3; tap++) larger.performClick();
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals("the taps came back while the disk still held the first save", 1, disk.getCount());
            assertFalse("no new file while a save waits", root.findViewWithTag("font_file").isEnabled());
            disk.countDown();
            settle();
            assertEquals(115, prefs.getInt(OwnFont.SCALE_KEY, 0));
            assertEquals("Text size 115%", ((TextView) root.findViewWithTag("font_size_value")).getText().toString());
            assertEquals("Text size 115%. Restart Messenger to see it.", ShadowToast.getTextOfLatestToast());
            assertEquals(toasts + 1, ShadowToast.shownToastCount());
            assertTrue(root.findViewWithTag("font_file").isEnabled());
            root.findViewWithTag("font_phone").performClick();
            settle();
            assertEquals("", prefs.getString(OwnFont.NAME_KEY, null));
        } finally {
            disk.countDown();
            Settings.preferences = prefs;
        }
        assertEquals(4, savedOn.size());
        for (String thread : savedOn) assertEquals("HushMessengerFontSave", thread);
    }

    /** [prefs] whose font commits off the main thread wait for [disk], noting the thread each one ran on. */
    private static SharedPreferences slow(SharedPreferences prefs, CountDownLatch disk, List<String> savedOn) {
        ClassLoader loader = CustomFontSettingsTest.class.getClassLoader();
        return (SharedPreferences) Proxy.newProxyInstance(loader, new Class<?>[] {SharedPreferences.class}, (proxy, method, args) -> {
            Object result = method.invoke(prefs, args);
            if (!method.getName().equals("edit")) return result;
            SharedPreferences.Editor editor = (SharedPreferences.Editor) result;
            boolean[] font = {false};
            return Proxy.newProxyInstance(loader, new Class<?>[] {SharedPreferences.Editor.class}, (editProxy, editMethod, editArgs) -> {
                if (editArgs != null && editArgs.length > 0 && editArgs[0] instanceof String && ((String) editArgs[0]).startsWith("custom_font"))
                    font[0] = true;
                if (editMethod.getName().equals("commit") && font[0]) {
                    savedOn.add(Thread.currentThread().getName());
                    if (Looper.myLooper() != Looper.getMainLooper()) assertTrue(disk.await(10, TimeUnit.SECONDS));
                }
                Object edited = editMethod.invoke(editor, editArgs);
                return edited == editor ? editProxy : edited;
            });
        });
    }

    /**
     * A provider can stall answering the name, opening the file, after the font header or closing. Stop and the deadline
     * each give the font rows back at once, a newer pick goes through, and the stalled copy that wakes up later never
     * replaces it or says anything.
     */
    @Test public void aStalledCopyCanBeStoppedAndNeverReplacesALaterPick() throws Exception {
        FontFileRow.fontTimeoutMillis = 5_000;
        byte[] rubik = FontFileTest.font(FontFileTest.STATIC_FONT), other = FontFileTest.font(FontFileTest.VARIABLE_FONT);
        String[] stalls = {"query", "open", "read", "close"};
        for (int index = 0; index < stalls.length; index++) {
            String stall = stalls[index];
            boolean byDeadline = index % 2 == 1;
            CountDownLatch reached = new CountDownLatch(1), release = new CountDownLatch(1);
            AtomicReference<Thread> stalled = new AtomicReference<>();
            Runnable wait = () -> {
                stalled.compareAndSet(null, Thread.currentThread());
                reached.countDown();
                // A provider that ignores both the interrupt and the close.
                while (true) {
                    try {
                        if (release.await(10, TimeUnit.SECONDS)) return;
                    } catch (InterruptedException ignored) {
                        // Keeps waiting.
                    }
                }
            };
            Uri uri = Uri.parse("content://" + (stall.equals("query") ? "stalled.fonts" : "fonts") + "/picked/Stalled-" + stall + ".ttf");
            var resolver = Shadows.shadowOf(RuntimeEnvironment.getApplication().getContentResolver());
            if (stall.equals("query")) {
                org.robolectric.shadows.ShadowContentResolver.registerProviderInternal("stalled.fonts", new StalledProvider(wait));
            } else if (stall.equals("open")) {
                resolver.registerInputStreamSupplier(uri, () -> {
                    wait.run();
                    return new ByteArrayInputStream(other);
                });
            } else {
                resolver.registerInputStream(uri, new java.io.FilterInputStream(new ByteArrayInputStream(other)) {
                    private boolean waited;

                    @Override public int read(byte[] buffer, int offset, int length) throws java.io.IOException {
                        if (stall.equals("read") && !waited && ((java.io.ByteArrayInputStream) in).available() < other.length) {
                            waited = true;
                            wait.run();
                        }
                        return super.read(buffer, offset, length);
                    }

                    @Override public void close() throws java.io.IOException {
                        if (stall.equals("close")) wait.run();
                        super.close();
                    }
                });
            }
            try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
                SettingsActivity activity = screen.get();
                View root = activity.getWindow().getDecorView();
                TextView status = root.findViewWithTag("font_file_status");
                View stop = root.findViewWithTag("font_file_stop"), choose = root.findViewWithTag("font_file");
                assertEquals(View.GONE, stop.getVisibility());
                activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(uri));
                assertTrue(stall, reached.await(10, TimeUnit.SECONDS));
                assertEquals(stall, "Copying the font file...", status.getText().toString());
                assertEquals(View.VISIBLE, stop.getVisibility());
                assertFalse(choose.isEnabled());

                if (byDeadline) {
                    Shadows.shadowOf(Looper.getMainLooper()).idleFor(java.time.Duration.ofMillis(FontFileRow.fontTimeoutMillis));
                    assertEquals(stall, "Copying took too long. Your font didn't change.",
                        ShadowToast.getTextOfLatestToast());
                } else {
                    stop.performClick();
                    assertEquals(stall, "Stopped copying. Your font didn't change.", ShadowToast.getTextOfLatestToast());
                }
                assertEquals(View.GONE, stop.getVisibility());
                assertTrue(stall, choose.isEnabled());

                String name = "Rubik-" + stall + ".ttf";
                Uri later = Uri.parse("content://fonts/picked/" + name);
                resolver.registerInputStream(later, new ByteArrayInputStream(rubik));
                activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(later));
                awaitToast("Font picked. Turn the switch on to use it.");
                int toasts = ShadowToast.shownToastCount();

                release.countDown();
                stalled.get().join(10_000);
                assertFalse(stall + " is still stuck", stalled.get().isAlive());
                Shadows.shadowOf(Looper.getMainLooper()).idle();
                assertEquals(stall, name, Settings.preferences.getString(OwnFont.NAME_KEY, null));
                assertArrayEquals(stall, rubik, Files.readAllBytes(FontFile.file(activity).toPath()));
                // The stopped copy ends without a word, so the later pick's toast is still the last one.
                assertEquals(stall, toasts, ShadowToast.shownToastCount());
                assertEquals(stall, "Font picked. Turn the switch on to use it.", ShadowToast.getTextOfLatestToast());
                assertEquals(name + " is picked. Turn the switch on to use it.", status.getText().toString());
            } finally {
                release.countDown();
            }
        }
    }

    /** Two copies stuck past stopping are the most. A third pick waits until one of them gives up. */
    @Test public void twoStuckCopiesAreTheMost() throws Exception {
        CountDownLatch release = new CountDownLatch(1);
        List<Thread> stuck = Collections.synchronizedList(new ArrayList<>());
        var resolver = Shadows.shadowOf(RuntimeEnvironment.getApplication().getContentResolver());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            for (int copy = 0; copy < 3; copy++) {
                Uri uri = Uri.parse("content://fonts/picked/Stuck-" + copy + ".ttf");
                CountDownLatch reached = new CountDownLatch(1);
                resolver.registerInputStreamSupplier(uri, () -> {
                    stuck.add(Thread.currentThread());
                    reached.countDown();
                    // Stopping can't end a provider's open: it waits through the interrupt.
                    while (true) {
                        try {
                            if (release.await(20, TimeUnit.SECONDS)) break;
                        } catch (InterruptedException ignored) {
                            // Keeps waiting.
                        }
                    }
                    return new ByteArrayInputStream(new byte[0]);
                });
                activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(uri));
                if (copy == 2) {
                    assertEquals("Couldn't start that. Try again in a moment.", ShadowToast.getTextOfLatestToast());
                    assertEquals(View.GONE, root.findViewWithTag("font_file_stop").getVisibility());
                    break;
                }
                assertTrue(reached.await(10, TimeUnit.SECONDS));
                root.findViewWithTag("font_file_stop").performClick();
            }
            // Choose waits too, and the row says why, instead of opening the picker only to turn the file down.
            assertFalse(root.findViewWithTag("font_file").isEnabled());
            String waiting = new SettingsText(java.util.Locale.US).get("font_file_stuck");
            TextView status = root.findViewWithTag("font_file_status");
            // Which font is in use still comes first.
            assertTrue(status.getText().toString(), status.getText().toString().startsWith("None chosen"));
            assertTrue(status.getText().toString(), status.getText().toString().endsWith(" " + waiting));
            release.countDown();
            for (Thread thread : stuck) thread.join(10_000);
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertTrue("a stopped copy that gives up frees Choose", root.findViewWithTag("font_file").isEnabled());
            assertFalse(status.getText().toString().contains(waiting));
            Uri rubik = Uri.parse("content://fonts/picked/Rubik-Regular.ttf");
            resolver.registerInputStream(rubik, new ByteArrayInputStream(FontFileTest.font(FontFileTest.STATIC_FONT)));
            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(rubik));
            awaitToast("Font picked. Turn the switch on to use it.");
        } finally {
            release.countDown();
        }
    }

    /** Stop while the copy saves can't take it back, so the tap hears it's finishing and the result follows. */
    @Test public void stopWhileSavingSaysItsFinishing() throws Exception {
        SharedPreferences prefs = Settings.preferences;
        CountDownLatch disk = new CountDownLatch(1);
        List<String> savedOn = Collections.synchronizedList(new ArrayList<>());
        Uri uri = Uri.parse("content://fonts/picked/Rubik-Regular.ttf");
        Shadows.shadowOf(RuntimeEnvironment.getApplication().getContentResolver())
            .registerInputStream(uri, new ByteArrayInputStream(FontFileTest.font(FontFileTest.STATIC_FONT)));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            // After setup: the screen's own Settings.initialize would put the real preferences back.
            Settings.preferences = slow(prefs, disk, savedOn);
            SettingsActivity activity = screen.get();
            View root = activity.getWindow().getDecorView();
            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(uri));
            long deadline = System.currentTimeMillis() + 10_000;
            while (savedOn.isEmpty() && System.currentTimeMillis() < deadline) Thread.sleep(10);
            assertFalse("the copy reached its save", savedOn.isEmpty());
            root.findViewWithTag("font_file_stop").performClick();
            assertEquals("Already saving the font. It'll finish in a moment.", ShadowToast.getTextOfLatestToast());
            disk.countDown();
            awaitToast("Font picked. Turn the switch on to use it.");
            assertEquals("Rubik-Regular.ttf", prefs.getString(OwnFont.NAME_KEY, null));
        } finally {
            disk.countDown();
            Settings.preferences = prefs;
        }
    }

    /** The deadline can come while the copy saves. Nobody tapped anything, so the save finishes without a "finishing" toast. */
    @Test public void theDeadlineLetsASavingCopyFinishQuietly() throws Exception {
        SharedPreferences prefs = Settings.preferences;
        CountDownLatch disk = new CountDownLatch(1);
        List<String> savedOn = Collections.synchronizedList(new ArrayList<>());
        Uri uri = Uri.parse("content://fonts/picked/Rubik-Regular.ttf");
        Shadows.shadowOf(RuntimeEnvironment.getApplication().getContentResolver())
            .registerInputStream(uri, new ByteArrayInputStream(FontFileTest.font(FontFileTest.STATIC_FONT)));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            // After setup: the screen's own Settings.initialize would put the real preferences back.
            Settings.preferences = slow(prefs, disk, savedOn);
            SettingsActivity activity = screen.get();
            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(uri));
            java.lang.reflect.Field current = FontFileRow.class.getDeclaredField("fontJob");
            current.setAccessible(true);
            Object job = current.get(null);
            assertNotNull(job);
            long wait = System.currentTimeMillis() + 10_000;
            while (savedOn.isEmpty() && System.currentTimeMillis() < wait) Thread.sleep(10);
            assertFalse("the copy reached its save", savedOn.isEmpty());
            int toasts = ShadowToast.shownToastCount();
            java.lang.reflect.Field deadline = job.getClass().getDeclaredField("deadline");
            deadline.setAccessible(true);
            ((Runnable) deadline.get(job)).run();
            assertEquals(toasts, ShadowToast.shownToastCount());
            disk.countDown();
            awaitToast("Font picked. Turn the switch on to use it.");
            assertEquals("Rubik-Regular.ttf", prefs.getString(OwnFont.NAME_KEY, null));
        } finally {
            disk.countDown();
            Settings.preferences = prefs;
        }
    }

    /**
     * A copy can finish, turned down here, just as the deadline fires. The deadline then has nothing to stop, so the copy's
     * own answer is what shows, not "took too long".
     */
    @Test public void aCopyThatEndsAsTheDeadlineFiresStillSaysWhy() throws Exception {
        Uri uri = Uri.parse("content://fonts/picked/notes.ttf");
        Shadows.shadowOf(RuntimeEnvironment.getApplication().getContentResolver())
            .registerInputStream(uri, new ByteArrayInputStream("these are notes, not a font".getBytes(java.nio.charset.StandardCharsets.UTF_8)));
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            SettingsActivity activity = screen.get();
            activity.onActivityResult(SettingsActivity.PICK_FONT, Activity.RESULT_OK, new Intent().setData(uri));
            java.lang.reflect.Field current = FontFileRow.class.getDeclaredField("fontJob");
            current.setAccessible(true);
            Object job = current.get(null);
            assertNotNull(job);
            java.lang.reflect.Field worker = job.getClass().getDeclaredField("worker");
            worker.setAccessible(true);
            Thread thread = (Thread) worker.get(job);
            thread.join(10_000);
            assertFalse(thread.isAlive());
            int toasts = ShadowToast.shownToastCount();
            // The copy is done but its answer hasn't reached the main thread yet when the deadline runs.
            java.lang.reflect.Field deadline = job.getClass().getDeclaredField("deadline");
            deadline.setAccessible(true);
            ((Runnable) deadline.get(job)).run();
            assertEquals(toasts, ShadowToast.shownToastCount());
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            assertEquals(new SettingsText(java.util.Locale.US).get("font_file_not_font"), ShadowToast.getTextOfLatestToast());
            assertEquals(toasts + 1, ShadowToast.shownToastCount());
        }
    }

    /**
     * Putting the phone's font back removes the picked file, so the size and move buttons wait for it, and a step that
     * slips in behind it saves nothing and doesn't talk over its result.
     */
    @Test public void theSizeButtonsWaitForThePhoneFont() throws Exception {
        OwnFontTest.pick(FontFileTest.STATIC_FONT, "Rubik-Regular.ttf");
        SharedPreferences prefs = Settings.preferences;
        CountDownLatch disk = new CountDownLatch(1);
        List<String> savedOn = Collections.synchronizedList(new ArrayList<>());
        try (var screen = Robolectric.buildActivity(SettingsActivity.class).setup()) {
            // After setup: the screen's own Settings.initialize would put the real preferences back.
            Settings.preferences = slow(prefs, disk, savedOn);
            View root = screen.get().getWindow().getDecorView();
            String[] steps = {"font_size_smaller", "font_size_larger", "font_shift_up", "font_shift_down"};
            assertTrue(root.findViewWithTag("font_size_larger").isEnabled());
            int toasts = ShadowToast.shownToastCount();
            root.findViewWithTag("font_phone").performClick();
            for (String step : steps) assertFalse(step, root.findViewWithTag(step).isEnabled());
            // performClick runs the listener even on a disabled button, like a tap that lands as it greys out.
            root.findViewWithTag("font_size_larger").performClick();
            disk.countDown();
            settle();
            assertEquals("", prefs.getString(OwnFont.NAME_KEY, null));
            assertFalse("the step after it saved nothing", prefs.contains(OwnFont.SCALE_KEY));
            assertEquals("Back to your phone's font. Restart Messenger to see it.", ShadowToast.getTextOfLatestToast());
            assertEquals(toasts + 1, ShadowToast.shownToastCount());
            assertEquals(View.GONE, root.findViewWithTag("font_adjust").getVisibility());
        } finally {
            disk.countDown();
            Settings.preferences = prefs;
        }
    }

    /** A provider whose name lookup waits on [stall]. */
    private static final class StalledProvider extends android.content.ContentProvider {
        private final Runnable stall;

        StalledProvider(Runnable stall) {
            this.stall = stall;
        }

        @Override public boolean onCreate() { return true; }

        @Override public android.database.Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) {
            stall.run();
            return null;
        }

        @Override public String getType(Uri uri) { return null; }

        @Override public Uri insert(Uri uri, android.content.ContentValues values) { return null; }

        @Override public int delete(Uri uri, String selection, String[] args) { return 0; }

        @Override public int update(Uri uri, android.content.ContentValues values, String selection, String[] args) { return 0; }
    }

    /** Waits for the queued font saves, then runs what they posted back to the main thread. */
    static void settle() throws Exception {
        FontFileRow.FONT_WRITES.submit(() -> { }).get(10, TimeUnit.SECONDS);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
    }

    private static void awaitToast(String prefix) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 10_000;
        do {
            Shadows.shadowOf(Looper.getMainLooper()).idle();
            String toast = ShadowToast.getTextOfLatestToast();
            if (toast != null && toast.startsWith(prefix)) return;
            Thread.sleep(20);
        } while (System.currentTimeMillis() < deadline);
        fail("Missing font result: " + prefix + "; latest toast: " + ShadowToast.getTextOfLatestToast());
    }
}
