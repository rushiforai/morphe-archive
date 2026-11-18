package app.hushmessenger.extension;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import static org.junit.Assert.*;

/** The Material icons embedded in the payload, and which one leads each settings row. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SettingsIconsTest {
    private static List<String> embedded() throws IllegalAccessException {
        List<String> icons = new ArrayList<>();
        for (Field field : SettingsIcons.class.getDeclaredFields()) {
            int modifiers = field.getModifiers();
            if (field.getType() != String.class || !Modifier.isStatic(modifiers) || !Modifier.isFinal(modifiers)) continue;
            field.setAccessible(true);
            icons.add((String) field.get(null));
        }
        return icons;
    }

    @Test public void everyIconDecodesToA96PixelSquareShownAt24Dp() throws IllegalAccessException {
        List<String> icons = embedded();
        assertTrue("found " + icons.size(), icons.size() >= 40);
        for (String icon : icons) {
            Bitmap bitmap = SettingsIcons.bitmap(icon);
            assertNotNull(bitmap);
            assertEquals(96, bitmap.getWidth());
            assertEquals(96, bitmap.getHeight());
            assertEquals("96 px at 4x is 24 dp", 640, bitmap.getDensity());
            assertTrue("Drawn on a clear ground, so the tint shows only the shape", bitmap.hasAlpha());
            assertSame("Each decoded once", bitmap, SettingsIcons.bitmap(icon));
        }
    }

    @Test public void aRowTakesTheFirstRuleWithAWholeWordOfItsKey() {
        String category = SettingsIcons.ABOUT;
        assertSame(SettingsIcons.HIDDEN, SettingsIcons.forKey("hide_typing", category));
        assertSame(SettingsIcons.DOWNLOADS, SettingsIcons.forKey("save_voice", category));
        assertSame(SettingsIcons.PHONE, SettingsIcons.forKey("call_recording", category));
        assertSame(SettingsIcons.BLOCK, SettingsIcons.forKey("hide_ads", category));
        assertSame("Search's rule comes before the inbox's", SettingsIcons.SEARCH, SettingsIcons.forKey("inbox_search_bar", category));
        assertSame("Paused comes before everything", SettingsIcons.PAUSE, SettingsIcons.forKey("paused_chat_notifications", category));
        assertSame("Upper case reads the same", SettingsIcons.HIDDEN, SettingsIcons.forKey("Hide_Typing", category));
        assertSame("Part of a word isn't the word: loads isn't ads", category, SettingsIcons.forKey("fast_loads", category));
        assertSame("thread isn't read", category, SettingsIcons.forKey("thread_colors", category));
    }

    @Test public void aRowWithoutAKeyOrAMatchingWordWearsItsCategorysIcon() {
        assertSame(SettingsIcons.TOOLS, SettingsIcons.forKey(null, SettingsIcons.TOOLS));
        assertSame(SettingsIcons.TOOLS, SettingsIcons.forKey("", SettingsIcons.TOOLS));
        assertSame(SettingsIcons.LICENSE, SettingsIcons.forKey("open_source", SettingsIcons.LICENSE));
    }

    @Test public void onlyTheBackArrowTurnsAroundForRightToLeftLanguages() {
        int color = 0xff89b4fa;
        Drawable back = SettingsIcons.icon(RuntimeEnvironment.getApplication(), SettingsIcons.BACK, color);
        assertTrue(back.isAutoMirrored());
        Drawable search = SettingsIcons.icon(RuntimeEnvironment.getApplication(), SettingsIcons.SEARCH, color);
        assertFalse("A magnifier reads the same either way", search.isAutoMirrored());
        assertEquals(24, Math.round(search.getIntrinsicWidth() / RuntimeEnvironment.getApplication().getResources().getDisplayMetrics().density));
    }
}
