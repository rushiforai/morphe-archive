package app.morphe.extension.sabp;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Build;
import android.provider.Settings;

import java.util.HashMap;

/**
 * Material 3 colour roles, typography and user preferences for the Eppy UI.
 *
 * <p>Colours come from the wallpaper (Material You system palettes, Android 12+), from the playing
 * book's cover, or from a fixed seed colour. Roles are always checked for readable contrast, so
 * artwork never makes text unreadable.
 */
public final class EppyTheme {
    public static final String PREFS = "eppy_ui";
    public static final String MODE_SYSTEM = "system";
    public static final String MODE_LIGHT = "light";
    public static final String MODE_DARK = "dark";
    public static final String MODE_BLACK = "black";
    public static final String ACCENT_WALLPAPER = "wallpaper";
    public static final String ACCENT_COVER = "cover";
    public static final String ACCENT_CUSTOM = "custom";

    // Colour roles (ARGB).
    public int primary, onPrimary, primaryContainer, onPrimaryContainer;
    public int secondaryContainer, onSecondaryContainer;
    public int tertiary;
    public int surface, surfaceDim, surfaceContainerLow, surfaceContainer, surfaceContainerHigh, surfaceContainerHighest;
    public int onSurface, onSurfaceVariant, outline, outlineVariant, scrim;
    public boolean dark;

    // Skin (reference-design look). "material" = Material You.
    public static final String SKIN_MATERIAL = "material", SKIN_EMBER = "ember", SKIN_MIDNIGHT = "midnight",
            SKIN_LAVENDER = "lavender", SKIN_PAPER = "paper", SKIN_MONO = "mono";
    public static final String[] SKINS = {SKIN_MATERIAL, SKIN_EMBER, SKIN_MIDNIGHT, SKIN_LAVENDER, SKIN_PAPER, SKIN_MONO};
    public static final String[] SKIN_NAMES = {"Material You", "Ember", "Midnight", "Lavender", "Paper", "Mono"};
    public static final int NAV_BAR = 0, NAV_FLOATING = 1, NAV_PILL_DARK = 2;
    public static final int PLAYER_GLOW = 0, PLAYER_RING = 1, PLAYER_CARD = 2, PLAYER_TRANSCRIPT = 3;
    public static final int HOME_GREETING = 0, HOME_HEADLINE = 1, HOME_EXPLORE = 2;
    public String skin = SKIN_MATERIAL;
    public int playShape = 0; // PlayButton.SHAPE_*
    public int navStyle = NAV_BAR;
    public int playerStyle = PLAYER_GLOW;
    public int homeStyle = HOME_GREETING;
    public boolean cardShadow;
    public int progressColor;   // seek bar / progress fill
    public int gradientTop, gradientBottom; // 0 = flat surface
    public int navSelectedBg, navSelectedFg, navBg;
    public String fontAsset = "fonts/eppy_outfit.ttf";
    public String userName = "";
    private EppyTheme playerTheme;

    // Preferences.
    public String mode;
    public String accentSource;
    public int customSeed;
    public boolean reduceMotion;
    public boolean haptics;
    public boolean highContrast;
    public boolean waveformSeekBar;

    private static Typeface baseFont;
    private static final HashMap<String, Typeface> fontCache = new HashMap<>();
    private static String currentFont = "fonts/eppy_outfit.ttf";

    /** Selects the font file used by {@link #font}; called when a theme is applied. */
    public void activateFont() {
        currentFont = fontAsset;
    }

    private EppyTheme() {
    }

    public static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** Builds the theme for the current preferences; seed is the cover accent or 0. */
    public static EppyTheme resolve(Context c, int coverSeed) {
        EppyTheme t = new EppyTheme();
        SharedPreferences p = prefs(c);
        t.mode = p.getString("mode", configString(c, "eppy_default_theme", MODE_SYSTEM));
        t.accentSource = p.getString("accent", configString(c, "eppy_default_accent", ACCENT_WALLPAPER));
        t.customSeed = p.getInt("seed", parseColor(configString(c, "eppy_custom_accent", ""), 0xFFE8735A));
        t.reduceMotion = p.getBoolean("reduceMotion", systemReducedMotion(c));
        t.haptics = p.getBoolean("haptics", true);
        t.highContrast = p.getBoolean("highContrast", false);
        t.skin = p.getString("skin", configString(c, "eppy_default_skin", SKIN_MATERIAL));
        t.userName = p.getString("name", "");

        boolean systemDark = (c.getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        t.dark = MODE_DARK.equals(t.mode) || MODE_BLACK.equals(t.mode) || (MODE_SYSTEM.equals(t.mode) && systemDark);
        boolean black = MODE_BLACK.equals(t.mode);

        boolean dynamic = Build.VERSION.SDK_INT >= 31;
        int seed;
        if (ACCENT_COVER.equals(t.accentSource) && coverSeed != 0) {
            seed = coverSeed;
            dynamic = false;
        } else if (ACCENT_CUSTOM.equals(t.accentSource) || !dynamic) {
            seed = t.customSeed;
            dynamic = false;
        } else {
            seed = 0;
        }

        if (!SKIN_MATERIAL.equals(t.skin) && t.applySkin(c, coverSeed)) {
            t.waveformSeekBar = p.getBoolean("waveform", t.waveformSeekBar);
            t.enforceContrast();
            t.derivePlayerTheme();
            return t;
        }
        t.skin = SKIN_MATERIAL;
        t.waveformSeekBar = p.getBoolean("waveform", false);
        if (dynamic) t.fromSystem(c, black);
        else t.fromSeed(seed, black);
        t.progressColor = t.primary;
        t.navBg = t.surfaceContainer;
        t.navSelectedBg = t.secondaryContainer;
        t.navSelectedFg = t.onSecondaryContainer;
        t.enforceContrast();
        t.derivePlayerTheme();
        return t;
    }

    /** Fixed palettes and layout choices that recreate the reference designs. */
    private boolean applySkin(Context c, int coverSeed) {
        scrim = 0x99000000;
        switch (skin) {
            case SKIN_EMBER:
                dark = true;
                set(0xFF0E0E10, 0xFF0A0A0B, 0xFF141416, 0xFF1A1A1D, 0xFF222226, 0xFF2B2B30);
                onSurface = 0xFFF5F5F5; onSurfaceVariant = 0xFFA3A3AB; outline = 0xFF5A5A62; outlineVariant = 0xFF2E2E33;
                primary = 0xFFEE6A50; onPrimary = 0xFFFFFFFF; primaryContainer = 0xFF3A1E18; onPrimaryContainer = 0xFFFFD9D0;
                secondaryContainer = 0xFF2A2A2F; onSecondaryContainer = 0xFFFFFFFF; tertiary = 0xFFFFB199;
                playShape = 0; navStyle = NAV_PILL_DARK; playerStyle = PLAYER_RING; homeStyle = HOME_GREETING;
                waveformSeekBar = true; progressColor = primary;
                navBg = 0xFF1C1C20; navSelectedBg = 0xFFFFFFFF; navSelectedFg = 0xFF111111;
                gradientTop = 0xFF1B1412; gradientBottom = 0xFF0E0E10;
                fontAsset = "fonts/eppy_outfit.ttf";
                return true;
            case SKIN_MIDNIGHT:
                dark = true;
                set(0xFF17132A, 0xFF120F20, 0xFF1E1936, 0xFF241F40, 0xFF2D2750, 0xFF383060);
                onSurface = 0xFFF3F0FF; onSurfaceVariant = 0xFFB4ACD6; outline = 0xFF6F6699; outlineVariant = 0xFF3A3360;
                primary = 0xFFCDBDFF; onPrimary = 0xFF241A4A; primaryContainer = 0xFFD5C8FA; onPrimaryContainer = 0xFF1E1838;
                secondaryContainer = 0xFF3A3166; onSecondaryContainer = 0xFFE9E2FF; tertiary = 0xFFFFB4D0;
                playShape = 1; navStyle = NAV_BAR; playerStyle = PLAYER_TRANSCRIPT; homeStyle = HOME_HEADLINE;
                waveformSeekBar = true; progressColor = primary;
                navBg = 0xFF1B1731; navSelectedBg = 0xFF3A3166; navSelectedFg = 0xFFE9E2FF;
                gradientTop = 0xFF2C2350; gradientBottom = 0xFF120F20;
                fontAsset = "fonts/eppy_jakarta.ttf";
                return true;
            case SKIN_LAVENDER:
                dark = false;
                set(0xFFF5F1FB, 0xFFEDE7F6, 0xFFFFFFFF, 0xFFFBF9FE, 0xFFEFE9F8, 0xFFE6DEF3);
                onSurface = 0xFF1C1A22; onSurfaceVariant = 0xFF6C6680; outline = 0xFFB9B1CC; outlineVariant = 0xFFE3DCEF;
                primary = 0xFF8B2BE2; onPrimary = 0xFFFFFFFF; primaryContainer = 0xFFEBDDFB; onPrimaryContainer = 0xFF3A0A6B;
                secondaryContainer = 0xFF1C1A22; onSecondaryContainer = 0xFFFFFFFF; tertiary = 0xFFB15DF0;
                playShape = 2; navStyle = NAV_FLOATING; playerStyle = PLAYER_CARD; homeStyle = HOME_HEADLINE;
                waveformSeekBar = true; progressColor = primary; cardShadow = true;
                navBg = 0xFFFFFFFF; navSelectedBg = 0xFF8B2BE2; navSelectedFg = 0xFFFFFFFF;
                gradientTop = 0xFFF8F4FE; gradientBottom = 0xFFECE3F8;
                fontAsset = "fonts/eppy_outfit.ttf";
                return true;
            case SKIN_PAPER:
                dark = false;
                set(0xFFF2ECE3, 0xFFE9E1D5, 0xFFFBF8F3, 0xFFF7F2EA, 0xFFEDE5D9, 0xFFE5DCCD);
                onSurface = 0xFF2A2622; onSurfaceVariant = 0xFF7E756B; outline = 0xFFC9BFB1; outlineVariant = 0xFFE3D9CB;
                primary = 0xFF2A2622; onPrimary = 0xFFFBF8F3; primaryContainer = 0xFFFFFFFF; onPrimaryContainer = 0xFF2A2622;
                secondaryContainer = 0xFFFFFFFF; onSecondaryContainer = 0xFF2A2622; tertiary = 0xFFD9493E;
                playShape = 0; navStyle = NAV_BAR; playerStyle = PLAYER_CARD; homeStyle = HOME_GREETING;
                waveformSeekBar = false; progressColor = 0xFFD9493E; cardShadow = true;
                navBg = 0xFFF7F2EA; navSelectedBg = 0xFFFFFFFF; navSelectedFg = 0xFF2A2622;
                fontAsset = "fonts/eppy_jakarta.ttf";
                return true;
            case SKIN_MONO:
                dark = false;
                set(0xFFF3F3F3, 0xFFEAEAEA, 0xFFFFFFFF, 0xFFFAFAFA, 0xFFEDEDED, 0xFFE4E4E4);
                onSurface = 0xFF151515; onSurfaceVariant = 0xFF8C8C8C; outline = 0xFFCFCFCF; outlineVariant = 0xFFE6E6E6;
                primary = 0xFF151515; onPrimary = 0xFFFFFFFF; primaryContainer = 0xFFF4C430; onPrimaryContainer = 0xFF151515;
                secondaryContainer = 0xFFE6E6E6; onSecondaryContainer = 0xFF151515; tertiary = 0xFFF4C430;
                playShape = 1; navStyle = NAV_FLOATING; playerStyle = PLAYER_CARD; homeStyle = HOME_EXPLORE;
                waveformSeekBar = true; progressColor = 0xFFE9B30F; cardShadow = true;
                navBg = 0xFFFFFFFF; navSelectedBg = 0xFF2A2A2A; navSelectedFg = 0xFFFFFFFF;
                fontAsset = "fonts/eppy_jakarta.ttf";
                return true;
            default:
                return false;
        }
    }

    private void set(int surface, int dim, int low, int container, int high, int highest) {
        this.surface = surface;
        this.surfaceDim = dim;
        this.surfaceContainerLow = low;
        this.surfaceContainer = container;
        this.surfaceContainerHigh = high;
        this.surfaceContainerHighest = highest;
    }

    /** Colours for the Now Playing screen; the Midnight skin uses a lilac player like its reference. */
    private void derivePlayerTheme() {
        if (playerStyle != PLAYER_TRANSCRIPT) {
            playerTheme = this;
            return;
        }
        EppyTheme p = copy();
        p.dark = false;
        p.surface = 0xFFCDBDF7;
        p.surfaceContainerLow = 0xFFD8CBFA;
        p.surfaceContainer = 0xFFDDD2FB;
        p.surfaceContainerHigh = 0xFFE4DBFC;
        p.surfaceContainerHighest = 0xFFBCAAF0;
        p.onSurface = 0xFF1E1838;
        p.onSurfaceVariant = 0xFF4E4570;
        p.outline = 0xFF7E73A8;
        p.outlineVariant = 0xFFB3A5E4;
        p.primary = 0xFF2A2150;
        p.onPrimary = 0xFFE9E2FF;
        p.progressColor = 0xFF2A2150;
        p.secondaryContainer = 0xFFDCD0FB;
        p.onSecondaryContainer = 0xFF1E1838;
        p.gradientTop = 0;
        p.gradientBottom = 0;
        p.playerTheme = p;
        playerTheme = p;
    }

    public EppyTheme playerTheme() {
        return playerTheme != null ? playerTheme : this;
    }

    private EppyTheme copy() {
        EppyTheme t = new EppyTheme();
        t.primary = primary; t.onPrimary = onPrimary; t.primaryContainer = primaryContainer; t.onPrimaryContainer = onPrimaryContainer;
        t.secondaryContainer = secondaryContainer; t.onSecondaryContainer = onSecondaryContainer; t.tertiary = tertiary;
        t.surface = surface; t.surfaceDim = surfaceDim; t.surfaceContainerLow = surfaceContainerLow; t.surfaceContainer = surfaceContainer;
        t.surfaceContainerHigh = surfaceContainerHigh; t.surfaceContainerHighest = surfaceContainerHighest;
        t.onSurface = onSurface; t.onSurfaceVariant = onSurfaceVariant; t.outline = outline; t.outlineVariant = outlineVariant;
        t.scrim = scrim; t.dark = dark; t.mode = mode; t.accentSource = accentSource; t.customSeed = customSeed;
        t.reduceMotion = reduceMotion; t.haptics = haptics; t.highContrast = highContrast; t.waveformSeekBar = waveformSeekBar;
        t.skin = skin; t.playShape = playShape; t.navStyle = navStyle; t.playerStyle = playerStyle; t.homeStyle = homeStyle;
        t.cardShadow = cardShadow; t.progressColor = progressColor; t.gradientTop = gradientTop; t.gradientBottom = gradientBottom;
        t.navSelectedBg = navSelectedBg; t.navSelectedFg = navSelectedFg; t.navBg = navBg; t.fontAsset = fontAsset; t.userName = userName;
        return t;
    }

    /** Background for full screens: the skin's gradient or the flat surface. */
    public android.graphics.drawable.Drawable background() {
        if (gradientTop == 0) return new android.graphics.drawable.ColorDrawable(surface);
        return new android.graphics.drawable.GradientDrawable(android.graphics.drawable.GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{gradientTop, gradientBottom});
    }

    private static boolean systemReducedMotion(Context c) {
        try {
            return Settings.Global.getFloat(c.getContentResolver(), Settings.Global.ANIMATOR_DURATION_SCALE, 1f) == 0f;
        } catch (Throwable t) {
            return false;
        }
    }

    /** Reads a string the patch writes into the app's resources (patch options). */
    public static String configString(Context c, String name, String fallback) {
        try {
            int id = c.getResources().getIdentifier(name, "string", c.getPackageName());
            if (id != 0) {
                String v = c.getString(id);
                if (v != null && !v.trim().isEmpty()) return v.trim();
            }
        } catch (Throwable ignored) {
        }
        return fallback;
    }

    static int parseColor(String s, int fallback) {
        try {
            if (s == null) return fallback;
            s = s.replace("\\", "").replace("\"", "").trim();
            if (s.isEmpty()) return fallback;
            if (!s.startsWith("#")) s = "#" + s;
            return Color.parseColor(s) | 0xFF000000;
        } catch (Throwable t) {
            return fallback;
        }
    }

    // ---- palettes -----------------------------------------------------------------------------

    private void fromSystem(Context c, boolean black) {
        if (dark) {
            primary = sys(c, android.R.color.system_accent1_200);
            onPrimary = sys(c, android.R.color.system_accent1_800);
            primaryContainer = sys(c, android.R.color.system_accent1_700);
            onPrimaryContainer = sys(c, android.R.color.system_accent1_100);
            secondaryContainer = sys(c, android.R.color.system_accent2_700);
            onSecondaryContainer = sys(c, android.R.color.system_accent2_100);
            tertiary = sys(c, android.R.color.system_accent3_200);
            surface = black ? Color.BLACK : sys(c, android.R.color.system_neutral1_900);
            surfaceDim = black ? Color.BLACK : blend(sys(c, android.R.color.system_neutral1_900), Color.BLACK, 0.25f);
            surfaceContainerLow = black ? 0xFF0B0B0C : blend(surface, sys(c, android.R.color.system_neutral1_800), 0.35f);
            surfaceContainer = black ? 0xFF141416 : blend(surface, sys(c, android.R.color.system_neutral1_800), 0.6f);
            surfaceContainerHigh = black ? 0xFF1C1C1F : sys(c, android.R.color.system_neutral1_800);
            surfaceContainerHighest = black ? 0xFF26262A : blend(sys(c, android.R.color.system_neutral1_800), sys(c, android.R.color.system_neutral1_700), 0.4f);
            onSurface = sys(c, android.R.color.system_neutral1_100);
            onSurfaceVariant = sys(c, android.R.color.system_neutral2_200);
            outline = sys(c, android.R.color.system_neutral2_400);
            outlineVariant = sys(c, android.R.color.system_neutral2_700);
        } else {
            primary = sys(c, android.R.color.system_accent1_600);
            onPrimary = sys(c, android.R.color.system_accent1_0);
            primaryContainer = sys(c, android.R.color.system_accent1_100);
            onPrimaryContainer = sys(c, android.R.color.system_accent1_900);
            secondaryContainer = sys(c, android.R.color.system_accent2_100);
            onSecondaryContainer = sys(c, android.R.color.system_accent2_900);
            tertiary = sys(c, android.R.color.system_accent3_600);
            surface = sys(c, android.R.color.system_neutral1_10);
            surfaceDim = sys(c, android.R.color.system_neutral1_100);
            surfaceContainerLow = blend(sys(c, android.R.color.system_neutral1_10), sys(c, android.R.color.system_neutral1_50), 0.5f);
            surfaceContainer = sys(c, android.R.color.system_neutral1_50);
            surfaceContainerHigh = blend(sys(c, android.R.color.system_neutral1_50), sys(c, android.R.color.system_neutral1_100), 0.5f);
            surfaceContainerHighest = sys(c, android.R.color.system_neutral1_100);
            onSurface = sys(c, android.R.color.system_neutral1_900);
            onSurfaceVariant = sys(c, android.R.color.system_neutral2_700);
            outline = sys(c, android.R.color.system_neutral2_500);
            outlineVariant = sys(c, android.R.color.system_neutral2_200);
        }
        scrim = 0x99000000;
    }

    private static int sys(Context c, int id) {
        return c.getColor(id);
    }

    /** Approximates the Material 3 tonal palettes from a seed colour using HSL tones. */
    private void fromSeed(int seed, boolean black) {
        float[] hsl = toHsl(seed);
        float h = hsl[0];
        float s = Math.max(0.35f, Math.min(0.85f, hsl[1]));
        float sN = Math.min(0.10f, s * 0.12f); // neutral: barely tinted
        float sN2 = Math.min(0.18f, s * 0.22f);
        float h2 = h;
        float h3 = (h + 60f) % 360f;
        if (dark) {
            primary = tone(h, s, 80);
            onPrimary = tone(h, s, 20);
            primaryContainer = tone(h, s * 0.9f, 30);
            onPrimaryContainer = tone(h, s, 90);
            secondaryContainer = tone(h2, s * 0.35f, 30);
            onSecondaryContainer = tone(h2, s * 0.35f, 90);
            tertiary = tone(h3, s * 0.6f, 80);
            surface = black ? Color.BLACK : tone(h, sN, 6);
            surfaceDim = black ? Color.BLACK : tone(h, sN, 4);
            surfaceContainerLow = black ? 0xFF0B0B0C : tone(h, sN, 10);
            surfaceContainer = black ? 0xFF141416 : tone(h, sN, 12);
            surfaceContainerHigh = black ? 0xFF1C1C1F : tone(h, sN, 17);
            surfaceContainerHighest = black ? 0xFF26262A : tone(h, sN, 22);
            onSurface = tone(h, sN, 90);
            onSurfaceVariant = tone(h, sN2, 80);
            outline = tone(h, sN2, 60);
            outlineVariant = tone(h, sN2, 30);
        } else {
            primary = tone(h, s, 40);
            onPrimary = Color.WHITE;
            primaryContainer = tone(h, s, 90);
            onPrimaryContainer = tone(h, s, 10);
            secondaryContainer = tone(h2, s * 0.35f, 90);
            onSecondaryContainer = tone(h2, s * 0.35f, 10);
            tertiary = tone(h3, s * 0.6f, 40);
            surface = tone(h, sN, 98);
            surfaceDim = tone(h, sN, 87);
            surfaceContainerLow = tone(h, sN, 96);
            surfaceContainer = tone(h, sN, 94);
            surfaceContainerHigh = tone(h, sN, 92);
            surfaceContainerHighest = tone(h, sN, 90);
            onSurface = tone(h, sN, 10);
            onSurfaceVariant = tone(h, sN2, 30);
            outline = tone(h, sN2, 50);
            outlineVariant = tone(h, sN2, 80);
        }
        scrim = 0x99000000;
    }

    private void enforceContrast() {
        // Text on primary must be readable (4.5:1); primary on surfaces must be visible (3:1).
        if (contrast(onPrimary, primary) < (SKIN_MATERIAL.equals(skin) ? 4.5 : 3.0)) {
            onPrimary = contrast(Color.BLACK, primary) > contrast(Color.WHITE, primary) ? Color.BLACK : Color.WHITE;
        }
        int guard = 0;
        while (SKIN_MATERIAL.equals(skin) && contrast(primary, surface) < 3.0 && guard++ < 12) {
            primary = dark ? blend(primary, Color.WHITE, 0.12f) : blend(primary, Color.BLACK, 0.12f);
        }
        if (contrast(onPrimaryContainer, primaryContainer) < 4.5) {
            onPrimaryContainer = dark ? Color.WHITE : Color.BLACK;
        }
        if (highContrast) {
            onSurfaceVariant = onSurface;
            outline = blend(outline, onSurface, 0.6f);
            outlineVariant = blend(outlineVariant, onSurface, 0.4f);
        }
        if (contrast(onSurfaceVariant, surface) < 4.5) onSurfaceVariant = blend(onSurfaceVariant, onSurface, 0.5f);
    }

    // ---- cover accent ---------------------------------------------------------------------------

    /**
     * Picks a vivid, representative colour from a cover: hues are binned and weighted by
     * saturation and mid-lightness, so a big black or white area does not win. Returns 0 if the
     * cover has no usable colour (grey-scale art), in which case the default accent stays.
     */
    public static int seedFromCover(Bitmap cover) {
        if (cover == null) return 0;
        try {
            Bitmap small = Bitmap.createScaledBitmap(cover, 40, 40, true);
            float[] weight = new float[36];
            float[] sumS = new float[36];
            float[] sumL = new float[36];
            float[] hsl = new float[3];
            for (int y = 0; y < small.getHeight(); y++) {
                for (int x = 0; x < small.getWidth(); x++) {
                    int px = small.getPixel(x, y);
                    if (Color.alpha(px) < 200) continue;
                    hsl = toHsl(px);
                    float sat = hsl[1];
                    float light = hsl[2];
                    if (sat < 0.25f || light < 0.15f || light > 0.88f) continue;
                    float w = sat * (1f - Math.abs(light - 0.5f) * 1.6f);
                    int bin = Math.min(35, (int) (hsl[0] / 10f));
                    weight[bin] += w;
                    sumS[bin] += sat * w;
                    sumL[bin] += light * w;
                }
            }
            if (small != cover) small.recycle();
            int best = -1;
            float bestW = 0;
            for (int i = 0; i < 36; i++) {
                float w = weight[i] + (i > 0 ? weight[i - 1] : weight[35]) * 0.5f + (i < 35 ? weight[i + 1] : weight[0]) * 0.5f;
                if (w > bestW) {
                    bestW = w;
                    best = i;
                }
            }
            if (best < 0 || bestW < 4f) return 0;
            float s = sumS[best] / weight[best];
            float l = sumL[best] / weight[best];
            return fromHsl(best * 10f + 5f, s, l);
        } catch (Throwable t) {
            return 0;
        }
    }

    // ---- typography ---------------------------------------------------------------------------

    /** Outfit (bundled by the patch) at a given weight, falling back to the system sans-serif. */
    public static Typeface font(Context c, int weight) {
        String key = currentFont + "@" + weight;
        Typeface cached = fontCache.get(key);
        if (cached != null) return cached;
        Typeface t = null;
        try {
            t = new Typeface.Builder(c.getAssets(), currentFont)
                    .setFontVariationSettings("'wght' " + weight)
                    .setWeight(weight)
                    .build();
        } catch (Throwable ignored) {
        }
        if (t == null) {
            if (baseFont == null) baseFont = Typeface.create("sans-serif", Typeface.NORMAL);
            t = Typeface.create(baseFont, weight, false);
        }
        fontCache.put(key, t);
        return t;
    }

    // ---- colour maths -------------------------------------------------------------------------

    public static int blend(int a, int b, float t) {
        t = Math.max(0f, Math.min(1f, t));
        int r = (int) (Color.red(a) + (Color.red(b) - Color.red(a)) * t);
        int g = (int) (Color.green(a) + (Color.green(b) - Color.green(a)) * t);
        int bl = (int) (Color.blue(a) + (Color.blue(b) - Color.blue(a)) * t);
        int al = (int) (Color.alpha(a) + (Color.alpha(b) - Color.alpha(a)) * t);
        return Color.argb(al, r, g, bl);
    }

    public static int withAlpha(int color, float alpha) {
        return (color & 0x00FFFFFF) | (Math.round(Math.max(0f, Math.min(1f, alpha)) * 255) << 24);
    }

    static double luminance(int c) {
        double r = channel(Color.red(c) / 255.0);
        double g = channel(Color.green(c) / 255.0);
        double b = channel(Color.blue(c) / 255.0);
        return 0.2126 * r + 0.7152 * g + 0.0722 * b;
    }

    private static double channel(double v) {
        return v <= 0.03928 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4);
    }

    public static double contrast(int a, int b) {
        double la = luminance(a) + 0.05;
        double lb = luminance(b) + 0.05;
        return la > lb ? la / lb : lb / la;
    }

    private static int tone(float h, float s, int lightness) {
        return fromHsl(h, s, lightness / 100f);
    }

    static float[] toHsl(int color) {
        float r = Color.red(color) / 255f, g = Color.green(color) / 255f, b = Color.blue(color) / 255f;
        float max = Math.max(r, Math.max(g, b)), min = Math.min(r, Math.min(g, b));
        float l = (max + min) / 2f;
        float h = 0f, s = 0f;
        if (max != min) {
            float d = max - min;
            s = l > 0.5f ? d / (2f - max - min) : d / (max + min);
            if (max == r) h = ((g - b) / d + (g < b ? 6f : 0f));
            else if (max == g) h = ((b - r) / d + 2f);
            else h = ((r - g) / d + 4f);
            h *= 60f;
        }
        return new float[]{h, s, l};
    }

    static int fromHsl(float h, float s, float l) {
        float c = (1f - Math.abs(2f * l - 1f)) * s;
        float x = c * (1f - Math.abs((h / 60f) % 2f - 1f));
        float m = l - c / 2f;
        float r, g, b;
        if (h < 60) { r = c; g = x; b = 0; }
        else if (h < 120) { r = x; g = c; b = 0; }
        else if (h < 180) { r = 0; g = c; b = x; }
        else if (h < 240) { r = 0; g = x; b = c; }
        else if (h < 300) { r = x; g = 0; b = c; }
        else { r = c; g = 0; b = x; }
        return Color.rgb(Math.round((r + m) * 255), Math.round((g + m) * 255), Math.round((b + m) * 255));
    }
}
