package app.spicetify.extension.spotify.theme;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.widget.FrameLayout;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.annotation.Implementation;
import org.robolectric.annotation.Implements;
import org.robolectric.shadows.ShadowBitmapFactory;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30, manifest = Config.NONE)
public class ThemeRuntimeTest {
    /** The role table the theme patch injects, cut down to the page background. */
    @Implements(value = ThemeRoleMap.class, isInAndroidSdk = false)
    public static class Patched {
        @Implementation protected static String encoded() { return "main:base"; }
    }

    /** A resource table that can't be written, as when storage is full. */
    @Implements(className = "app.spicetify.extension.spotify.theme.ThemeTable", isInAndroidSdk = false)
    public static class FullStorage {
        @Implementation protected static void load(Context context, Map<String, Integer> values) throws IOException {
            throw new IOException("No space left on device");
        }
    }

    /** A decoder out of memory, as with an image too large for the heap; Android's own drawables still decode. */
    @Implements(BitmapFactory.class)
    public static class NoMemory extends ShadowBitmapFactory {
        @Implementation protected static Bitmap decodeFile(String path, BitmapFactory.Options options) {
            throw new OutOfMemoryError("Failed to allocate");
        }
    }

    /** Spotify's main activity, whose onCreate puts main_content in place. */
    public static class SpotifyMain extends Activity {
        @Override protected void onCreate(Bundle state) {
            super.onCreate(state);
            FrameLayout main = new FrameLayout(this);
            main.setId(ThemeBackgroundTest.MAIN_CONTENT);
            setContentView(main);
        }
    }

    private static final int COLOR = 0x7f0604bc;
    private final ComposeThemeTest.Palette stock = new ComposeThemeTest.Palette(
            new ComposeThemeTest.Colors(0xFF121212L << 32, 0), new ComposeThemeTest.Colors(0, 0));

    private final Application context = RuntimeEnvironment.getApplication();

    private final File image = new File(context.getFilesDir(), "spicetify_background");

    @Before
    public void clearTheSavedTheme() throws IOException {
        context.deleteSharedPreferences("spicetify_theme");
        ThemeBackground.replace(context, null);
    }

    @After
    public void restoreSpotifyColors() {
        ComposeTheme.tables = ComposeTheme.parse("");
        ComposeTheme.update(Collections.<String, Integer>emptyMap(), false);
    }

    @Test
    @Config(sdk = 29, shadows = Patched.class)
    public void onAndroid10NothingApplies() {
        assertFalse(ThemeRuntime.supported());
        ThemeRuntime.install(context);
        assertFalse(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.OLED, "OLED")));
        assertEquals(ThemePresets.STOCK, ThemeState.load(context).kind);
        assertEquals(0xFF121212, ThemeRuntime.color("main", 0xFF121212));
    }

    @Test
    @Config(shadows = Patched.class)
    public void onAndroid11AThemeAppliesThroughTheResourceTable() {
        ComposeTheme.tables = ComposeTheme.parse("a.a=base@FF121212");
        ThemeRuntime.install(context);

        // Android 11 has none of the overlay's classes: touching it throws an Error, which nothing here catches.
        assertTrue(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.OLED, "OLED")));

        assertEquals(ThemePresets.OLED, ThemeState.load(context).kind);
        assertEquals(0xFF000000L << 32, ((ComposeThemeTest.Palette) ComposeTheme.palette(stock)).a.a);
        // Spicetify's own screens read the role colors; roles the theme leaves alone keep Spotify's.
        assertEquals(0xFF000000, ThemeRuntime.color("main", 0xFF121212));
        assertEquals(0xFF282828, ThemeRuntime.color("card", 0xFF282828));

        assertTrue(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.STOCK, "Spotify")));
        assertEquals(0xFF121212, ThemeRuntime.color("main", 0xFF121212));
    }

    @Test
    public void onAndroid11TheTableLaysOverTheApplicationsResources() throws IOException {
        ThemeRuntime.install(context);
        try {
            ThemeTable.loadIds(context, Collections.singletonMap(COLOR, 0xFF3B1F5E));
            assertEquals(0xFF3B1F5E, context.getResources().getColor(COLOR, null));
        } finally {
            ThemeTable.loadIds(context, Collections.<Integer, Integer>emptyMap());
        }
    }

    @Test
    @Config(shadows = {Patched.class, FullStorage.class})
    public void aChoiceTheResourcesCannotTakeChangesNothing() {
        ComposeTheme.tables = ComposeTheme.parse("a.a=base@FF121212");
        ThemeRuntime.install(context);
        assertFalse(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.OLED, "OLED")));
        // Compose and Spicetify's screens keep Spotify's colors, and the choice isn't saved.
        assertSame(stock, ComposeTheme.palette(stock));
        assertEquals(0xFF121212, ThemeRuntime.color("main", 0xFF121212));
        assertEquals(ThemePresets.STOCK, ThemeState.load(context).kind);
    }

    @Test
    @Config(shadows = {Patched.class, FullStorage.class})
    public void atStartupComposeFollowsTheSavedThemeEvenWhenTheResourcesCannot() {
        ThemeState.save(context, ThemeState.Selection.preset(ThemePresets.OLED, "OLED"));
        ComposeTheme.tables = ComposeTheme.parse("a.a=base@FF121212");
        ThemeRuntime.install(context);
        assertEquals(0xFF000000L << 32, ((ComposeThemeTest.Palette) ComposeTheme.palette(stock)).a.a);
    }

    @Test
    @Config(shadows = Patched.class)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aThemeWithAnImageShowsItThroughThePageAndAThemeWithoutOneClearsIt() {
        ComposeTheme.tables = ComposeTheme.parse("a.a=base@FF121212");
        ThemeRuntime.install(context);

        assertTrue(ThemeRuntime.select(context, galaxy(), ThemeBackgroundTest.png(8, 4)));

        assertTrue(ThemeBackground.hasImage(context));
        // The page background turns see-through and keeps its color, as Galaxy's CSS does; the header scrim clears.
        assertEquals(0x01102040L << 32, ((ComposeThemeTest.Palette) ComposeTheme.palette(stock)).a.a);
        assertEquals(0f, ComposeTheme.scrimAlpha(0.75f), 0f);
        // Spicetify's own screens and the saved scheme keep the opaque color.
        assertEquals(0xFF102040, ThemeRuntime.color("main", 0xFF121212));
        assertEquals(Integer.valueOf(0xFF102040), ThemeState.load(context).colors.get("main"));

        assertTrue(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.OLED, "OLED")));

        assertFalse(ThemeBackground.hasImage(context));
        assertEquals(0xFF000000L << 32, ((ComposeThemeTest.Palette) ComposeTheme.palette(stock)).a.a);
        assertEquals(0.75f, ComposeTheme.scrimAlpha(0.75f), 0f);
    }

    @Test
    @Config(shadows = Patched.class)
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void atStartupASavedImageMakesThePageSeeThrough() throws IOException {
        ThemeState.save(context, galaxy());
        ThemeBackground.replace(context, ThemeBackground.stage(context, ThemeBackgroundTest.png(8, 4)));
        ComposeTheme.tables = ComposeTheme.parse("a.a=base@FF121212");

        ThemeRuntime.install(context);

        assertEquals(0x01102040L << 32, ((ComposeThemeTest.Palette) ComposeTheme.palette(stock)).a.a);
        assertEquals(0f, ComposeTheme.scrimAlpha(0.75f), 0f);
        assertEquals(0xFF102040, ThemeRuntime.color("main", 0xFF121212));
    }

    @Test
    @Config(shadows = {ThemeBackgroundTest.SpotifyIds.class, NoMemory.class})
    public void anImageTooLargeForMemoryLeavesSpotifysStartAlone() throws IOException {
        Files.write(image.toPath(), new byte[] {1});
        ThemeRuntime.install(context);

        Activity activity = Robolectric.buildActivity(SpotifyMain.class).setup().get();

        assertNull(activity.findViewById(ThemeBackgroundTest.MAIN_CONTENT).getBackground());
        assertNull(ThemeBackground.cached);
    }

    @Test
    @Config(shadows = Patched.class)
    @GraphicsMode(GraphicsMode.Mode.NATIVE) // Android's own decoder, which refuses what isn't an image
    public void bytesThatArentAnImageChangeNothing() throws IOException {
        byte[] saved = ThemeBackgroundTest.png(8, 4);
        ThemeBackground.replace(context, ThemeBackground.stage(context, saved));
        ComposeTheme.tables = ComposeTheme.parse("a.a=base@FF121212");
        ThemeRuntime.install(context);

        assertFalse(ThemeRuntime.select(context, galaxy(), "<html>Not Found</html>".getBytes(StandardCharsets.UTF_8)));

        assertArrayEquals(saved, Files.readAllBytes(image.toPath()));
        assertEquals(ThemePresets.STOCK, ThemeState.load(context).kind);
        assertSame(stock, ComposeTheme.palette(stock));
        assertEquals(0xFF121212, ThemeRuntime.color("main", 0xFF121212));
    }

    @Test
    @Config(shadows = {Patched.class, FullStorage.class})
    @GraphicsMode(GraphicsMode.Mode.NATIVE)
    public void aChoiceTheResourcesCannotTakeKeepsTheSavedImage() throws IOException {
        byte[] saved = ThemeBackgroundTest.png(8, 4);
        ThemeBackground.replace(context, ThemeBackground.stage(context, saved));

        assertFalse(ThemeRuntime.select(context, galaxy(), ThemeBackgroundTest.png(4, 8)));
        assertFalse(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.OLED, "OLED")));

        assertArrayEquals(saved, Files.readAllBytes(image.toPath()));
        assertFalse(new File(image.getPath() + ".tmp").exists());
        assertEquals(ThemePresets.STOCK, ThemeState.load(context).kind);
    }

    /** A scheme like the ones the Marketplace applies with an image. */
    private static ThemeState.Selection galaxy() {
        return new ThemeState.Selection(ThemeState.SCHEME, "Galaxy V2 (base)", Collections.singletonMap("main", 0xFF102040));
    }

    @Test
    @Config(sdk = 35)
    public void aFailedSelectionIsNotSaved() {
        ThemeRuntime.install(context);
        // Unpatched, the extension has no role table, so no theme can take effect.
        assertFalse(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.OLED, "OLED")));
        assertEquals(ThemePresets.STOCK, ThemeState.load(context).kind);
    }

    @Test
    public void selectionsResolveToRoleColors() {
        assertEquals(Integer.valueOf(0xFF000000), ThemeRuntime.roleColors(context,
                ThemeState.Selection.preset(ThemePresets.OLED, "OLED")).get("main"));
        assertEquals(0, ThemeRuntime.roleColors(context,
                ThemeState.Selection.preset(ThemePresets.STOCK, "Spotify")).size());
        Map<String, Integer> picked = new LinkedHashMap<>();
        picked.put("main", 0xFF0B1026);
        picked.put("button", 0xFFFF6437);
        Map<String, Integer> custom = ThemeRuntime.roleColors(context, new ThemeState.Selection(ThemeState.CUSTOM, "Custom", picked));
        assertEquals(Integer.valueOf(0xFF0B1026), custom.get("main"));
        assertEquals(Integer.valueOf(ArgbColors.mix(0xFFFF6437, 0xFF000000, 0.125)), custom.get("button-active"));
        assertFalse(custom.containsKey("card"));
        // A pasted scheme was resolved when it was pasted, so its saved roles apply as they are.
        Map<String, Integer> pasted = new LinkedHashMap<>(picked);
        pasted.put("button-active", 0xFF123456);
        assertEquals(pasted, ThemeRuntime.roleColors(context,
                new ThemeState.Selection(ThemeState.SCHEME, "Pasted theme (mocha)", pasted)));
    }

    @Test
    @Config(shadows = Patched.class)
    public void theThemeSavedByVersion10AppliesAtTheNextStart() {
        context.getSharedPreferences("spicetify_patch_settings", 0).edit().putString("theme_preset", "nord")
                .putInt("theme_background", 0xFF2E3440).putInt("theme_surface", 0xFF3B4252)
                .putInt("theme_accent", 0xFF88C0D0).commit();
        ThemeRuntime.install(context);
        assertEquals("nord", ThemeState.load(context).kind);
        assertEquals(0xFF2E3440, ThemeRuntime.color("main", 0xFF121212));
        assertEquals(0xFF3B4252, ThemeRuntime.color("card", 0xFF282828));
        assertEquals(0xFF88C0D0, ThemeRuntime.color("button", 0xFF1ED760));
        assertTrue(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.STOCK, "Spotify")));
    }

    @Test
    @Config(shadows = Patched.class)
    public void anUnreadableOldThemeDoesNotStopTheSavedOne() {
        ThemeState.save(context, ThemeState.Selection.preset("midnight", "Midnight"));
        context.getSharedPreferences("spicetify_patch_settings", 0).edit().putString("theme_background", "black").commit();
        ThemeRuntime.install(context);
        assertEquals(0xFF0B1026, ThemeRuntime.color("main", 0xFF121212));
        assertTrue(ThemeRuntime.select(context, ThemeState.Selection.preset(ThemePresets.STOCK, "Spotify")));
    }

    @Test
    @Config(sdk = 35)
    public void onAndroid14TheOverlayReplacesATableFromBeforeTheUpdate() throws IOException {
        File table = new File(context.getNoBackupFilesDir(), "spicetify_theme.arsc");
        assertTrue(table.createNewFile());
        ThemeRuntime.install(context);
        assertFalse(table.exists());
    }
}
