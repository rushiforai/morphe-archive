package app.mightymorphing.extension.joey;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Modern UI for Joey for Reddit.
 * Recolors Joey's own layout. The side rail is held for a later release.
 */
public final class ModernUi {
    private static final String TAG = "ModernUi";
    private static final String PREFS = "mighty_morphing";

    // Preference Keys
    public static final String KEY_MODERN_ENABLED = "modern_ui_enabled";
    public static final String KEY_CLASSIC = "classic_ui";
    public static final String KEY_SIDEBAR_BIRD = "sidebar_bird";
    public static final String KEY_SYSTEM_FONT = "use_system_font";
    public static final String KEY_BANNER = "banner_scale";
    public static final String KEY_PIN_RAIL = "pin_nav_rail";
    public static final String KEY_HIDE_RAIL = "hide_nav_rail";
    public static final String KEY_RAIL_NARROW = "rail_on_narrow";
    public static final String KEY_RAIL_WIDE = "rail_on_wide";
    public static final String KEY_CHIP_SORT = "chip_sort";
    public static final String KEY_CHIP_JOIN = "chip_join";
    public static final String KEY_CHIP_INFO = "chip_info";
    public static final String KEY_CHIP_ORDER = "chip_order";
    public static final String KEY_ACCENT = "material_accent";
    public static final String KEY_AMOLED = "pure_amoled";
    public static final String KEY_ALBUM_SWIPE = "album_swipe_close";
    public static final String KEY_HIDE_ICON = "hide_subreddit_icon";

    // Preset Accents. Aqua is the default.
    public static final String ACCENT_BLUE = "blue";
    public static final String ACCENT_TEAL = "teal";
    public static final String ACCENT_PURPLE = "purple";
    public static final String ACCENT_CORAL = "coral";
    public static final String ACCENT_MINT = "mint";
    public static final String ACCENT_GOLD = "gold";
    public static final String ACCENT_AMBER = "amber";
    public static final String ACCENT_BLACK = "black";
    public static final String ACCENT_MONET = "monet";
    public static final String ACCENT_AMOLED = "amoled";

    public static final int COLOR_BLUE = 0xFF4D8BFF;
    public static final int COLOR_TEAL = 0xFF3DBFB2;
    public static final int COLOR_PURPLE = 0xFFB388FF;
    public static final int COLOR_CORAL = 0xFFE07A72;
    public static final int COLOR_MINT = 0xFF3CBF9A;
    public static final int COLOR_GOLD = 0xFFE2B15A;
    public static final int COLOR_AMBER = 0xFFE8943A;
    public static final int COLOR_BLACK = 0xFFD5D8DE;

    private static Boolean sModernEnabled;
    private static boolean sControlsEnabled = false;
    private static WeakReference<Context> sContextRef;
    private static final String RAIL_TAG = "morphe_nav_rail";
    private static final String TAB_MENU_TAG = "morphe_tab_menu";
    private static final WeakHashMap<View, Integer> RAIL_INSET = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> RAIL_PAD = new WeakHashMap<>();
    private static final WeakHashMap<View, String> RAIL_SIG = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> BANNER_WATCH = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> BANNER_SIG = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> TEXT_MIN_LINES = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> ICON_MARGIN = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> NAME_MARGIN = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> HEADER_HIDDEN = new WeakHashMap<>();
    private static final WeakHashMap<ImageView, android.graphics.drawable.Drawable> WASH_SOURCE = new WeakHashMap<>();
    private static final WeakHashMap<ImageView, Bitmap> WASH_BITMAP = new WeakHashMap<>();
    private static final WeakHashMap<ImageView, Float> WASH_BLUR = new WeakHashMap<>();
    private static final float BORDER_BLUR = 36f;
    private static final WeakHashMap<View, Boolean> HEADER_LIFTED = new WeakHashMap<>();
    private static final WeakHashMap<View, Boolean> TITLE_GUARD = new WeakHashMap<>();
    private static final WeakHashMap<View, Integer> COLLAPSE_PAD = new WeakHashMap<>();
    private static final int SCROLL_WITH_BANNER = 1 | 4 | 8;

    private ModernUi() {
    }

    public static void setContext(Context context) {
        if (context != null) {
            sContextRef = new WeakReference<>(context.getApplicationContext());
        }
    }

    public static Context getContext() {
        Context held = sContextRef != null ? sContextRef.get() : null;
        if (held != null) return held;
        try {
            Object app = Class.forName("o.o.joey.MyApplication").getMethod("p").invoke(null);
            if (app instanceof Context) {
                setContext((Context) app);
                return (Context) app;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /**
     * Color for one Joey theme slot. Null leaves Joey's own theme in place.
     * Slots match ec.j: h primary, k card, b canvas, a accent, n toolbar,
     * g unread, i read, e text, m tint, d link, j sticky, c highlight.
     */
    public static Integer themeColor(String slot) {
        Context context = getContext();
        if (context == null || slot == null || !isModernUiEnabled(context)) return null;
        Palette palette = getPalette(context);
        switch (slot) {
            case "primary": return palette.primary;
            case "card": return palette.container;
            case "canvas": return palette.canvas;
            case "accent":
            case "link":
            case "sticky":
            case "highlight": return palette.accent;
            case "toolbar":
            case "unread":
            case "text": return palette.onSurface;
            case "read":
            case "tint": return palette.onSurfaceVariant;
            default: return null;
        }
    }

    public static void enableControls() {
        sControlsEnabled = true;
    }

    public static boolean controlsEnabled() {
        return sControlsEnabled;
    }

    // =========================================================================
    // Material 3 Palette Definition
    // =========================================================================

    public static final class Palette {
        public final int accent;
        public final int primary;
        public final int canvas;
        public final int container;
        public final int containerHigh;
        public final int outline;
        public final int onSurface;
        public final int onSurfaceVariant;

        public Palette(int accent, int primary, int canvas, int container, int containerHigh,
                       int outline, int onSurface, int onSurfaceVariant) {
            this.accent = accent;
            this.primary = primary;
            this.canvas = canvas;
            this.container = container;
            this.containerHigh = containerHigh;
            this.outline = outline;
            this.onSurface = onSurface;
            this.onSurfaceVariant = onSurfaceVariant;
        }
    }

    public static Palette getPalette(Context context) {
        if (sPalette != null && sPaletteKey != null && !sPaletteKey.startsWith(ACCENT_MONET)) {
            return sPalette;
        }
        String accentKey = getMaterialAccent(context);
        boolean amoled = ACCENT_AMOLED.equalsIgnoreCase(accentKey) || cachedAmoled(context);
        String key = accentKey + ":" + amoled;
        if (key.equals(sPaletteKey) && sPalette != null) return sPalette;

        int accent = COLOR_BLUE;
        int primary = 0xFF111827;
        int canvas = 0xFF0B0F19;
        int container = 0xFF151E2E;
        int containerHigh = 0xFF1E293B;
        int outline = 0xFF334155;

        if (ACCENT_MONET.equalsIgnoreCase(accentKey) && Build.VERSION.SDK_INT >= 31) {
            try {
                accent = context.getColor(android.R.color.system_accent1_500);
                canvas = context.getColor(android.R.color.system_neutral1_900);
                primary = context.getColor(android.R.color.system_neutral1_800);
                container = context.getColor(android.R.color.system_neutral1_800);
                containerHigh = context.getColor(android.R.color.system_neutral1_700);
                outline = context.getColor(android.R.color.system_neutral2_700);
            } catch (Throwable ignored) {
            }
        } else if (ACCENT_TEAL.equalsIgnoreCase(accentKey)) {
            accent = COLOR_TEAL;
            primary = 0xFF111E20;
            canvas = 0xFF0A1213;
            container = 0xFF132022;
            containerHigh = 0xFF1B2B2D;
            outline = 0xFF253B3E;
        } else if (ACCENT_PURPLE.equalsIgnoreCase(accentKey)) {
            accent = COLOR_PURPLE;
            primary = 0xFF141318;
            canvas = 0xFF0E0D12;
            container = 0xFF18161D;
            containerHigh = 0xFF221F28;
            outline = 0xFF34303C;
        } else if (ACCENT_CORAL.equalsIgnoreCase(accentKey)) {
            accent = COLOR_CORAL;
            primary = 0xFF1F1512;
            canvas = 0xFF130D0B;
            container = 0xFF241915;
            containerHigh = 0xFF30221D;
            outline = 0xFF453029;
        } else if (ACCENT_MINT.equalsIgnoreCase(accentKey)) {
            accent = COLOR_MINT;
            primary = 0xFF0D1E14;
            canvas = 0xFF08130D;
            container = 0xFF102418;
            containerHigh = 0xFF183222;
            outline = 0xFF254631;
        } else if (ACCENT_GOLD.equalsIgnoreCase(accentKey)) {
            accent = COLOR_GOLD;
            primary = 0xFF1C160F;
            canvas = 0xFF120E09;
            container = 0xFF241C13;
            containerHigh = 0xFF302416;
            outline = 0xFF4A3824;
        } else if (ACCENT_AMBER.equalsIgnoreCase(accentKey)) {
            accent = COLOR_AMBER;
            primary = 0xFF1C140E;
            canvas = 0xFF120E0A;
            container = 0xFF261910;
            containerHigh = 0xFF332114;
            outline = 0xFF4E3422;
        } else if (ACCENT_BLACK.equalsIgnoreCase(accentKey)) {
            accent = COLOR_BLACK;
            primary = 0xFF141618;
            canvas = 0xFF0C0D10;
            container = 0xFF1A1C20;
            containerHigh = 0xFF24262B;
            outline = 0xFF3A3D44;
        }

        if (amoled) {
            canvas = 0xFF000000;
            primary = 0xFF000000;
            container = 0xFF0D1115;
            containerHigh = 0xFF161B22;
            outline = 0xFF26303B;
        }

        sPalette = new Palette(
                accent,
                primary,
                canvas,
                container,
                containerHigh,
                outline,
                0xFFF1F5F9,
                0xFF94A3B8
        );
        sPaletteKey = key;
        return sPalette;
    }

    private static boolean cachedAmoled(Context context) {
        if (sAmoledCache == null) sAmoledCache = isPureAmoled(context);
        return sAmoledCache;
    }

    private static void forgetTheme() {
        sAccentCache = null;
        sAmoledCache = null;
        sPaletteKey = null;
        sPalette = null;
    }

    // =========================================================================
    // Preference Helpers
    // =========================================================================

    private static SharedPreferences getPrefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    /** Modern stays on unless Classic was saved. The older key is left unread. */
    public static boolean isModernUiEnabled(Context context) {
        return !isClassic(context);
    }

    private static Boolean sClassicCache;

    public static boolean isClassic(Context context) {
        try {
            Context source = context != null ? context : getContext();
            if (source == null) return sClassicCache != null && sClassicCache;
            sClassicCache = getPrefs(source).getBoolean(KEY_CLASSIC, false);
            return sClassicCache;
        } catch (Throwable ignored) {
            return sClassicCache != null && sClassicCache;
        }
    }

    public static void setClassicUi(Context context, boolean classic) {
        sClassicCache = classic;
        getPrefs(context).edit().putBoolean(KEY_CLASSIC, classic).commit();
    }

    public static boolean sidebarBird(Context context) {
        try {
            return isModernUiEnabled(context) && getPrefs(context).getBoolean(KEY_SIDEBAR_BIRD, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void setSidebarBird(Context context, boolean shown) {
        getPrefs(context).edit().putBoolean(KEY_SIDEBAR_BIRD, shown).commit();
        for (Activity activity : runningActivities()) Sidebar.refresh(activity);
    }

    public static void setModernUiEnabled(Context context, boolean enabled) {
        sModernEnabled = enabled;
        getPrefs(context).edit().putBoolean(KEY_MODERN_ENABLED, enabled).apply();
    }

    public static boolean isSystemFontEnabled(Context context) {
        return getPrefs(context).getBoolean(KEY_SYSTEM_FONT, true);
    }

    public static void setSystemFontEnabled(Context context, boolean enabled) {
        getPrefs(context).edit().putBoolean(KEY_SYSTEM_FONT, enabled).commit();
        if (context instanceof Activity) refreshLive((Activity) context);
    }

    private static String sAccentCache;
    private static Boolean sAmoledCache;
    private static String sPaletteKey;
    private static Palette sPalette;

    public static String getMaterialAccent(Context context) {
        if (sAccentCache != null) return sAccentCache;
        sAccentCache = getPrefs(context).getString(KEY_ACCENT, ACCENT_TEAL);
        return sAccentCache;
    }

    public static void setMaterialAccent(Context context, String accent) {
        commitAccent(context, accent);
        if (context instanceof Activity) reloadNow((Activity) context);
    }

    /** Saves the theme and refreshes other screens without recreating the one that is open. */
    private static boolean sThemeDirty;

    public static void applyAccent(Activity activity, String accent) {
        commitAccent(activity, accent);
        sThemeDirty = true;
        notifyThemeChanged(activity);
        paintSystemBars(activity);
        refreshLive(activity);
    }

    static boolean consumeThemeReload() {
        boolean dirty = sThemeDirty;
        sThemeDirty = false;
        return dirty;
    }

    /** The status and gesture bars follow the theme without recreating this screen. */
    static void paintSystemBars(Activity activity) {
        if (activity == null || activity.getWindow() == null || !isModernUiEnabled(activity)) return;
        Palette palette = getPalette(activity);
        Window window = activity.getWindow();
        window.setStatusBarColor(palette.canvas);
        window.setNavigationBarColor(palette.canvas);
    }

    private static void commitAccent(Context context, String accent) {
        SharedPreferences.Editor editor = getPrefs(context).edit().putString(KEY_ACCENT, accent);
        if (!ACCENT_AMOLED.equalsIgnoreCase(accent)) editor.putBoolean(KEY_AMOLED, false);
        editor.commit();
        forgetTheme();
    }

    /** Other screens recreate immediately, including the one that is open. */
    private static void reloadNow(Activity activity) {
        refreshLive(activity);
        View decor = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
        if (decor != null) {
            decor.post(() -> {
                if (!activity.isFinishing()) activity.recreate();
            });
        } else if (!activity.isFinishing()) {
            activity.recreate();
        }
    }

    /** Replaces Joey's Default / Dark / Dark blue picker while Modern is on. */
    public static void showAccentPicker(Activity activity) {
        String[] labels = {
                "Blue",
                "Aqua",
                "Purple",
                "Coral",
                "Mint",
                "Gold",
                "Amber",
                "Black",
                "Sky",
                "AMOLED black"
        };
        String[] styles = {
                ACCENT_BLUE, ACCENT_TEAL, ACCENT_PURPLE, ACCENT_CORAL, ACCENT_MINT,
                ACCENT_GOLD, ACCENT_AMBER, ACCENT_BLACK, ACCENT_MONET, ACCENT_AMOLED
        };
        int[] colors = {
                COLOR_BLUE, COLOR_TEAL, COLOR_PURPLE, COLOR_CORAL, COLOR_MINT,
                COLOR_GOLD, COLOR_AMBER, 0xFF141618, 0xFF8AB4F8, 0xFF000000
        };
        String active = getMaterialAccent(activity);
        if (isPureAmoled(activity) && !ACCENT_AMOLED.equalsIgnoreCase(active)) active = ACCENT_AMOLED;
        activity.closeOptionsMenu();
        LinearLayout page = MorpheDialog.page(activity, "Select theme", null);
        float density = activity.getResources().getDisplayMetrics().density;
        int dot = Math.round(16 * density);
        int gap = Math.round(12 * density);
        Palette palette = getPalette(activity);
        android.app.AlertDialog[] shown = new android.app.AlertDialog[1];
        for (int i = 0; i < labels.length; i++) {
            boolean selected = styles[i].equalsIgnoreCase(active);
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            int pad = Math.round(10 * density);
            row.setPadding(pad, pad, pad, pad);
            if (selected) {
                GradientDrawable plate = new GradientDrawable();
                plate.setCornerRadius(12 * density);
                plate.setColor(Color.argb(28, Color.red(palette.accent), Color.green(palette.accent), Color.blue(palette.accent)));
                row.setBackground(plate);
            }
            View swatch = new View(activity);
            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(colors[i]);
            if (selected) circle.setStroke(Math.round(2 * density), palette.accent);
            else if (colors[i] == 0xFF000000 || colors[i] == 0xFF141618) {
                circle.setStroke(Math.round(density), MorpheDialog.SUB);
            }
            swatch.setBackground(circle);
            row.addView(swatch, new LinearLayout.LayoutParams(dot, dot));
            TextView label = new TextView(activity);
            label.setText(labels[i]);
            label.setTextSize(16);
            label.setTextColor(selected ? palette.accent : palette.onSurface);
            label.setPadding(gap, 0, 0, 0);
            row.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
            if (selected) {
                TextView mark = new TextView(activity);
                mark.setText("✓");
                mark.setTextSize(16);
                mark.setTextColor(palette.accent);
                row.addView(mark);
            }
            String style = styles[i];
            row.setOnClickListener(v -> {
                if (shown[0] != null) shown[0].dismiss();
                setMaterialAccent(activity, style);
            });
            page.addView(row);
        }
        TextView cancel = MorpheDialog.action(activity, "Cancel", MorpheDialog.SUB);
        cancel.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        page.addView(MorpheDialog.actions(activity, cancel));
        shown[0] = MorpheDialog.show(activity, page);
    }

    /** Settings theme picker. The sample post updates in place and the screen is not recreated. */
    public static void showSettingsThemePicker(Activity activity, Runnable changed) {
        float density = activity.getResources().getDisplayMetrics().density;
        String[] styles = {
                ACCENT_BLUE, ACCENT_TEAL, ACCENT_PURPLE, ACCENT_CORAL,
                ACCENT_MINT, ACCENT_GOLD, ACCENT_AMBER, ACCENT_BLACK
        };
        int[] colors = {
                COLOR_BLUE, COLOR_TEAL, COLOR_PURPLE, COLOR_CORAL,
                COLOR_MINT, COLOR_GOLD, COLOR_AMBER, 0xFF141618
        };
        final String[] chosen = { getMaterialAccent(activity) };
        LinearLayout page = MorpheDialog.page(activity, "Theme", null);
        TextView heading = (TextView) page.getChildAt(0);
        LinearLayout sample = new LinearLayout(activity);
        sample.setOrientation(LinearLayout.VERTICAL);

        FrameLayout banner = currentBannerSlot(activity, density);
        TextView name = sampleText(activity, "JoeyForReddit", 14, true);
        TextView about = sampleText(activity, "Enjoy Reddit with Joey for Reddit.", 11, false);
        LinearLayout caption = new LinearLayout(activity);
        caption.setOrientation(LinearLayout.VERTICAL);
        int cap = Math.round(8 * density);
        caption.setPadding(cap, Math.round(4 * density), cap, Math.round(4 * density));
        caption.addView(name);
        caption.addView(about);
        FrameLayout.LayoutParams captionParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.START);
        captionParams.leftMargin = Math.round(8 * density);
        captionParams.bottomMargin = Math.round(8 * density);
        banner.addView(caption, captionParams);
        sample.addView(banner, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, banner.getLayoutParams().height));

        LinearLayout chip = hotChip(activity, density);
        TextView tab = sampleText(activity, "Posts", 14, true);
        TextView other = sampleText(activity, "Popular", 14, false);
        LinearLayout tabs = new LinearLayout(activity);
        tabs.setOrientation(LinearLayout.HORIZONTAL);
        tabs.addView(tab);
        tabs.addView(other);
        LinearLayout post = new LinearLayout(activity);
        post.setOrientation(LinearLayout.HORIZONTAL);
        post.setGravity(Gravity.CENTER_VERTICAL);
        int postPad = Math.round(8 * density);
        post.setPadding(postPad, postPad, postPad, postPad);
        LinearLayout words = new LinearLayout(activity);
        words.setOrientation(LinearLayout.VERTICAL);
        TextView title = sampleText(activity, "An example post title", 14, true);
        TextView meta = sampleText(activity, "joeyforreddit  ·  1h", 11, false);
        words.addView(title);
        words.addView(meta);
        View thumb = new View(activity);
        post.addView(words, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        post.addView(thumb, new LinearLayout.LayoutParams(Math.round(46 * density), Math.round(36 * density)));

        LinearLayout.LayoutParams chipParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        chipParams.leftMargin = Math.round(8 * density);
        chipParams.topMargin = Math.round(10 * density);
        sample.addView(chip, chipParams);
        LinearLayout.LayoutParams tabParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        tabParams.leftMargin = Math.round(8 * density);
        tabParams.topMargin = Math.round(10 * density);
        sample.addView(tabs, tabParams);
        LinearLayout.LayoutParams postParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        postParams.topMargin = Math.round(8 * density);
        postParams.leftMargin = Math.round(4 * density);
        sample.addView(post, postParams);
        page.addView(sample);
        TextView mockNote = new TextView(activity);
        mockNote.setText("A mock-up. It may appear slightly differently.");
        mockNote.setTextSize(11);
        mockNote.setTypeface(Typeface.DEFAULT, Typeface.ITALIC);
        mockNote.setPadding(0, Math.round(8 * density), 0, 0);
        page.addView(mockNote);

        AlertDialog[] shown = new AlertDialog[1];
        View[] dots = new View[styles.length];
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        int dot = Math.round(28 * density);
        for (int i = 0; i < styles.length; i++) {
            View swatch = new View(activity);
            int index = i;
            swatch.setOnClickListener(v -> {
                chosen[0] = styles[index];
                applyAccent(activity, styles[index]);
                paintThemeSample(shown[0], heading, mockNote, caption, sample, name, about, chip, tab, other, post, title, meta, thumb, dots, styles, colors, chosen[0]);
                if (changed != null) changed.run();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dot, dot);
            params.leftMargin = i == 0 ? 0 : Math.round(8 * density);
            params.topMargin = Math.round(14 * density);
            row.addView(swatch, params);
            dots[i] = swatch;
        }
        page.addView(row);
        Runnable paint = () -> paintThemeSample(shown[0], heading, mockNote, caption, sample, name, about, chip, tab, other, post, title, meta, thumb, dots, styles, colors, chosen[0]);
        TextView close = MorpheDialog.action(activity, "Close", MorpheDialog.SUB);
        close.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        page.addView(MorpheDialog.actions(activity, close));
        shown[0] = MorpheDialog.show(activity, page, 640);
        paint.run();
    }

    /** r/JoeyForReddit's header photo, in the same wide slot, with the soft sides. */
    private static FrameLayout currentBannerSlot(Activity activity, float density) {
        Bitmap art = JoeyBanner.bitmap();
        FrameLayout slot = new FrameLayout(activity);
        int height = Math.round(132 * density);
        slot.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, height));
        ImageView wash = new ImageView(activity);
        ImageView sharp = new ImageView(activity);
        wash.setScaleType(ImageView.ScaleType.CENTER_CROP);
        sharp.setScaleType(ImageView.ScaleType.FIT_CENTER);
        if (art != null) {
            wash.setImageBitmap(art);
            sharp.setImageBitmap(art);
            if (Build.VERSION.SDK_INT >= 31) {
                wash.setRenderEffect(android.graphics.RenderEffect.createBlurEffect(
                        18f, 18f, android.graphics.Shader.TileMode.CLAMP));
            }
        }
        slot.addView(wash, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        slot.addView(sharp, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return slot;
    }

    /** Joey's sort control: a light outline, the list mark, and the word Hot. */
    private static LinearLayout hotChip(Activity activity, float density) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        int padH = Math.round(10 * density);
        int padV = Math.round(6 * density);
        row.setPadding(padH, padV, padH, padV);
        View icon = new View(activity) {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            @Override
            protected void onDraw(Canvas canvas) {
                paint.setColor(0xFFF1F5F9);
                paint.setStrokeWidth(Math.max(1f, density));
                float w = getWidth();
                float h = getHeight();
                float left = w * 0.12f;
                float right = w * 0.72f;
                canvas.drawLine(left, h * 0.28f, right, h * 0.28f, paint);
                canvas.drawLine(left, h * 0.5f, right, h * 0.5f, paint);
                canvas.drawLine(left, h * 0.72f, right * 0.7f, h * 0.72f, paint);
                float cx = w * 0.84f;
                canvas.drawLine(cx - w * 0.08f, h * 0.42f, cx, h * 0.62f, paint);
                canvas.drawLine(cx, h * 0.62f, cx + w * 0.08f, h * 0.42f, paint);
            }
        };
        row.addView(icon, new LinearLayout.LayoutParams(Math.round(18 * density), Math.round(16 * density)));
        TextView label = sampleText(activity, "Hot", 13, true);
        label.setPadding(Math.round(6 * density), 0, 0, 0);
        row.addView(label);
        return row;
    }

    private static TextView sampleText(Activity activity, String label, int size, boolean bold) {
        TextView view = new TextView(activity);
        view.setText(label);
        view.setTextSize(size);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    private static void paintThemeSample(AlertDialog dialog, TextView heading, TextView mockNote,
                                         View caption, LinearLayout sample,
                                         TextView name, TextView about, View chip, TextView tab,
                                         TextView other, LinearLayout post, TextView title, TextView meta,
                                         View thumb, View[] dots, String[] styles, int[] colors, String chosen) {
        if (sample == null) return;
        Activity activity = (Activity) sample.getContext();
        Palette palette = getPalette(activity);
        float density = activity.getResources().getDisplayMetrics().density;
        sample.setBackgroundColor(palette.canvas);
        if (heading != null) heading.setTextColor(palette.accent);
        if (mockNote != null) mockNote.setTextColor(palette.onSurfaceVariant);
        if (caption != null) {
            GradientDrawable plate = new GradientDrawable();
            plate.setCornerRadius(10 * density);
            plate.setColor(Color.argb(170, Color.red(palette.canvas), Color.green(palette.canvas), Color.blue(palette.canvas)));
            caption.setBackground(plate);
        }
        View pageView = (View) sample.getParent();
        if (pageView != null) pageView.setBackgroundColor(palette.container);
        name.setTextColor(palette.accent);
        about.setTextColor(palette.onSurface);
        GradientDrawable chipShape = new GradientDrawable();
        chipShape.setCornerRadius(8 * density);
        chipShape.setStroke(Math.max(1, Math.round(density)), palette.onSurface);
        chip.setBackground(chipShape);
        if (chip instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) chip;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child instanceof TextView) ((TextView) child).setTextColor(palette.onSurface);
                else child.invalidate();
            }
        }
        tab.setTextColor(palette.accent);
        other.setTextColor(palette.onSurfaceVariant);
        other.setPadding(Math.round(16 * density), 0, 0, 0);
        post.setBackgroundColor(palette.canvas);
        title.setTextColor(palette.onSurface);
        meta.setTextColor(palette.onSurfaceVariant);
        GradientDrawable picture = new GradientDrawable();
        picture.setCornerRadius(4 * density);
        picture.setColor(palette.containerHigh);
        thumb.setBackground(picture);
        for (int i = 0; i < dots.length; i++) {
            GradientDrawable circle = new GradientDrawable();
            circle.setShape(GradientDrawable.OVAL);
            circle.setColor(colors[i]);
            if (colors[i] == 0xFF141618) circle.setStroke(Math.max(1, Math.round(density)), 0xFF94A3B8);
            if (styles[i].equalsIgnoreCase(chosen)) circle.setStroke(Math.round(2 * density), 0xFFF8FAFC);
            dots[i].setBackground(circle);
        }
        if (dialog != null && dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(palette.container));
        }
        View parent = (View) sample.getParent();
        if (parent != null) parent.setBackgroundColor(palette.container);
    }

    public static boolean isPureAmoled(Context context) {
        return getPrefs(context).getBoolean(KEY_AMOLED, false);
    }

    public static void setPureAmoled(Context context, boolean amoled) {
        sAmoledCache = null;
        sPaletteKey = null;
        sPalette = null;
        getPrefs(context).edit().putBoolean(KEY_AMOLED, amoled).commit();
        if (context instanceof Activity) refreshLive((Activity) context);
    }

    public static int bannerScale(Context context) {
        return 100;
    }

    public static void setBannerScale(Context context, int scale) {
        getPrefs(context).edit().putInt(KEY_BANNER, scale).commit();
        if (!(context instanceof Activity)) return;
        for (Activity activity : runningActivities()) {
            View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
            applyBanner(decor);
        }
        MorpheSettings.repaint((Activity) context);
    }

    public static boolean hideSubredditIcon(Context context) {
        return getPrefs(context).getBoolean(KEY_HIDE_ICON, false);
    }

    public static void setHideSubredditIcon(Context context, boolean hide) {
        getPrefs(context).edit().putBoolean(KEY_HIDE_ICON, hide).commit();
        if (!(context instanceof Activity)) return;
        for (Activity activity : runningActivities()) {
            View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
            applyBanner(decor);
        }
        MorpheSettings.repaint((Activity) context);
    }

    public static boolean railOnNarrow(Context context) {
        migrateRail(context);
        return getPrefs(context).getBoolean(KEY_RAIL_NARROW, false);
    }

    public static boolean railOnWide(Context context) {
        migrateRail(context);
        return getPrefs(context).getBoolean(KEY_RAIL_WIDE, true);
    }

    public static void setRailOnNarrow(Context context, boolean on) {
        migrateRail(context);
        getPrefs(context).edit().putBoolean(KEY_RAIL_NARROW, on).commit();
        refreshRails(context);
    }

    public static void setRailOnWide(Context context, boolean on) {
        migrateRail(context);
        getPrefs(context).edit().putBoolean(KEY_RAIL_WIDE, on).commit();
        refreshRails(context);
    }

    public static boolean chipSort(Context context) {
        return getPrefs(context).getBoolean(KEY_CHIP_SORT, true);
    }

    public static boolean chipJoin(Context context) {
        return getPrefs(context).getBoolean(KEY_CHIP_JOIN, true);
    }

    public static boolean chipInfo(Context context) {
        return getPrefs(context).getBoolean(KEY_CHIP_INFO, true);
    }

    public static void setChipSort(Context context, boolean on) {
        getPrefs(context).edit().putBoolean(KEY_CHIP_SORT, on).commit();
        repaintBanners(context);
    }

    public static void setChipJoin(Context context, boolean on) {
        getPrefs(context).edit().putBoolean(KEY_CHIP_JOIN, on).commit();
        repaintBanners(context);
    }

    public static void setChipInfo(Context context, boolean on) {
        getPrefs(context).edit().putBoolean(KEY_CHIP_INFO, on).commit();
        repaintBanners(context);
    }

    public static boolean chipShown(Context context, String id) {
        if ("join".equals(id)) return chipJoin(context);
        if ("info".equals(id)) return chipInfo(context);
        return chipSort(context);
    }

    public static void setChipShown(Context context, String id, boolean on) {
        if ("join".equals(id)) setChipJoin(context, on);
        else if ("info".equals(id)) setChipInfo(context, on);
        else setChipSort(context, on);
    }

    public static List<String> chipOrder(Context context) {
        List<String> order = new ArrayList<>();
        String saved = getPrefs(context).getString(KEY_CHIP_ORDER, "");
        if (saved != null) {
            for (String part : saved.split(",")) {
                String id = part.trim();
                if (chipId(id) && !order.contains(id)) order.add(id);
            }
        }
        for (String id : new String[]{"sort", "join", "info"}) {
            if (!order.contains(id)) order.add(id);
        }
        return order;
    }

    public static void setChipOrder(Context context, List<String> order) {
        StringBuilder saved = new StringBuilder();
        for (String id : order) {
            if (!chipId(id)) continue;
            if (saved.length() > 0) saved.append(',');
            saved.append(id);
        }
        getPrefs(context).edit().putString(KEY_CHIP_ORDER, saved.toString()).commit();
        repaintBanners(context);
    }

    /** Sort, Join, and Community info. Hide takes one off the row. Drag changes the order. */
    public static void showChips(Activity activity) {
        List<String> order = new ArrayList<>(chipOrder(activity));
        LinearLayout page = MorpheDialog.page(activity, "Subreddit chips",
                "Drag the handle to change the order. Hide takes a chip off the row.");
        LinearLayout rows = new LinearLayout(activity);
        rows.setOrientation(LinearLayout.VERTICAL);
        Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            rows.removeAllViews();
            int text = MorpheDialog.text(activity);
            float density = activity.getResources().getDisplayMetrics().density;
            for (String id : order) {
                LinearLayout line = new LinearLayout(activity);
                line.setOrientation(LinearLayout.HORIZONTAL);
                line.setGravity(Gravity.CENTER_VERTICAL);
                line.setTag(id);
                line.setMinimumHeight(Math.round(48 * density));
                TextView label = new TextView(activity);
                label.setText(chipTitle(id));
                label.setTextColor(text);
                label.setTextSize(15);
                line.addView(label, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
                TextView hide = MorpheDialog.action(activity, "Hide", MorpheDialog.TEXT);
                MorpheDialog.setFilled(activity, hide, !chipShown(activity, id));
                hide.setOnClickListener(v -> {
                    setChipShown(activity, id, !chipShown(activity, id));
                    rebuild[0].run();
                });
                LinearLayout.LayoutParams gap = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                gap.leftMargin = Math.round(12 * density);
                line.addView(hide, gap);
                line.addView(DragOrder.handle(activity, rows, (from, to) -> {
                    if (from < 0 || to < 0 || from >= rows.getChildCount() || to >= rows.getChildCount()) return false;
                    String fromId = String.valueOf(rows.getChildAt(from).getTag());
                    String toId = String.valueOf(rows.getChildAt(to).getTag());
                    int ia = order.indexOf(fromId);
                    int ib = order.indexOf(toId);
                    if (ia < 0 || ib < 0) return false;
                    String moved = order.remove(ia);
                    order.add(ib, moved);
                    setChipOrder(activity, order);
                    return true;
                }));
                rows.addView(line);
            }
        };
        rebuild[0].run();
        page.addView(rows);
        TextView reset = MorpheDialog.action(activity, "Reset", MorpheDialog.SUB);
        TextView done = MorpheDialog.action(activity, "Done", MorpheDialog.GOLD);
        page.addView(MorpheDialog.actions(activity, reset, done));
        AlertDialog dialog = MorpheDialog.show(activity, page, 960);
        reset.setOnClickListener(v -> {
            order.clear();
            order.add("sort");
            order.add("join");
            order.add("info");
            setChipOrder(activity, order);
            setChipShown(activity, "sort", true);
            setChipShown(activity, "join", true);
            setChipShown(activity, "info", true);
            rebuild[0].run();
        });
        done.setOnClickListener(v -> dialog.dismiss());
    }

    private static boolean chipId(String id) {
        return "sort".equals(id) || "join".equals(id) || "info".equals(id);
    }

    private static String chipTitle(String id) {
        if ("join".equals(id)) return "Join";
        if ("info".equals(id)) return "Community info";
        return "Sort";
    }

    private static void repaintBanners(Context context) {
        if (!(context instanceof Activity)) return;
        for (Activity open : runningActivities()) {
            View decor = open.getWindow() == null ? null : open.getWindow().getDecorView();
            applyBanner(decor);
        }
    }

    /** Older builds stored one pin and one hide. Narrow stays off unless it was pinned. */
    private static void migrateRail(Context context) {
        SharedPreferences prefs = getPrefs(context);
        if (prefs.contains(KEY_RAIL_NARROW) && prefs.contains(KEY_RAIL_WIDE)) return;
        boolean hide = prefs.getBoolean(KEY_HIDE_RAIL, false);
        boolean pin = prefs.getBoolean(KEY_PIN_RAIL, false);
        prefs.edit()
                .putBoolean(KEY_RAIL_NARROW, !hide && pin)
                .putBoolean(KEY_RAIL_WIDE, !hide)
                .commit();
    }

    private static void refreshRails(Context context) {
        if (!(context instanceof Activity)) return;
        for (Activity activity : runningActivities()) {
            if (railHost(activity)) syncChrome(activity);
        }
        MorpheSettings.repaint((Activity) context);
    }

    /** A diagonal swipe closes an album. A straight up or down still changes the picture. */
    public static boolean albumSwipe(Context context) {
        return getPrefs(context).getBoolean(KEY_ALBUM_SWIPE, true);
    }

    public static void setAlbumSwipe(Context context, boolean enabled) {
        getPrefs(context).edit().putBoolean(KEY_ALBUM_SWIPE, enabled).apply();
    }

    public static int getActiveAccentColor(Context context) {
        return getPalette(context).accent;
    }

    public static int getActivePillFill(Context context) {
        int accent = getActiveAccentColor(context);
        return Color.argb(45, Color.red(accent), Color.green(accent), Color.blue(accent));
    }

    // =========================================================================
    // Theme Engine Hook: ec.e.l(int, View)
    // =========================================================================

    public static Integer getThemeColorOverride(int token, View view) {
        if (view == null) return null;
        Context context = view.getContext();
        setContext(context);
        if (!isModernUiEnabled(context)) return null;

        try {
            Palette palette = getPalette(context);

            int colPrimary = getResId(context, "color_primary", "integer");
            int colAccent = getResId(context, "color_accent", "integer");
            int colToolbarItem = getResId(context, "color_toolbar_item", "integer");
            int colUnread = getResId(context, "color_post_title_unread", "integer");
            int colRead = getResId(context, "color_post_title_read", "integer");
            int colSticky = getResId(context, "color_sticky", "integer");
            int colHighlight = getResId(context, "color_highlight", "integer");
            int colTint = getResId(context, "color_tint", "integer");
            int colMainText = getResId(context, "color_main_text", "integer");
            int colLink = getResId(context, "color_link", "integer");
            int colSubjectBg = getResId(context, "color_subject_background", "integer");
            int colCanvas = getResId(context, "color_canvas", "integer");

            // 1. Primary: Toolbar, App bar, Action bar background -> Dark M3 surface, never beige!
            if (token == 1 || (colPrimary != 0 && token == colPrimary)) {
                return palette.primary;
            }
            // 2. Accent: FAB, active tabs, switches
            if (token == 2 || (colAccent != 0 && token == colAccent)) {
                return palette.accent;
            }
            // 3. Toolbar Item: Crisp high-contrast icons and titles
            if (token == 3 || (colToolbarItem != 0 && token == colToolbarItem)) {
                return palette.onSurface;
            }
            // 4. Post Title Unread
            if (token == 4 || (colUnread != 0 && token == colUnread)) {
                return palette.onSurface;
            }
            // 5. Post Title Read. A step under the metadata grey, so a read title is easier to pick out.
            if (token == 5 || (colRead != 0 && token == colRead)) {
                return darker(palette.onSurfaceVariant, 0.58f);
            }
            // 6. Sticky / Pinned badge
            if (token == 6 || (colSticky != 0 && token == colSticky)) {
                return palette.accent;
            }
            // 7. Highlight
            if (token == 7 || (colHighlight != 0 && token == colHighlight)) {
                return palette.accent;
            }
            // 8. Tint: Metadata (author, subreddit, timestamp)
            if (token == 8 || (colTint != 0 && token == colTint)) {
                return palette.onSurfaceVariant;
            }
            // 9. Main Text: Body copy, comments text
            if (token == 9 || (colMainText != 0 && token == colMainText)) {
                return palette.onSurface;
            }
            // 10. Links: URLs, sub mentions
            if (token == 10 || (colLink != 0 && token == colLink)) {
                return palette.accent;
            }
            // 11. Subject Background: Post Cards, Dialogs, Drawers
            if (token == 11 || (colSubjectBg != 0 && token == colSubjectBg)) {
                if (isLeftDrawerSurface(view)) return palette.canvas;
                return palette.container;
            }
            // 12. Canvas: Window canvas, activity background behind cards
            if (token == 12 || (colCanvas != 0 && token == colCanvas)) {
                return palette.canvas;
            }
        } catch (Throwable t) {
            Log.e(TAG, "getThemeColorOverride error", t);
        }
        return null;
    }

    public static Integer overrideThemeColor(int token, View view, Integer orig) {
        Integer override = getThemeColorOverride(token, view);
        return override != null ? override : orig;
    }

    public static void notifyThemeChanged(Context context) {
        try {
            Class<?> themeGuy = Class.forName("ec.e");
            Object instance = themeGuy.getMethod("q").invoke(null);
            if (instance != null) {
                themeGuy.getMethod("E", boolean.class).invoke(instance, true);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to notify ThemeGuy", t);
        }
    }

    // =========================================================================
    // Card & Post View Enhancement: CCardView.a() & jc.k.a(...)
    // =========================================================================

    public static void applyCardStyle(View cardView) {
        if (cardView == null) return;
        Context context = cardView.getContext();
        if (!isModernUiEnabled(context)) return;

        try {
            float density = context.getResources().getDisplayMetrics().density;
            float radius = 16f * density;
            Palette palette = getPalette(context);

            Class<?> clazz = cardView.getClass();
            Method setRadius = null;
            Method setCardElevation = null;
            Method setMaxCardElevation = null;
            Method setCardBackgroundColor = null;

            for (Class<?> c = clazz; c != null && c != View.class; c = c.getSuperclass()) {
                if (c.getName().endsWith("CardView")) {
                    for (Method m : c.getMethods()) {
                        String name = m.getName();
                        Class<?>[] pts = m.getParameterTypes();
                        if ("setRadius".equals(name) && pts.length == 1 && pts[0] == float.class) setRadius = m;
                        if ("setCardElevation".equals(name) && pts.length == 1 && pts[0] == float.class) setCardElevation = m;
                        if ("setMaxCardElevation".equals(name) && pts.length == 1 && pts[0] == float.class) setMaxCardElevation = m;
                        if ("setCardBackgroundColor".equals(name) && pts.length == 1 && pts[0] == int.class) setCardBackgroundColor = m;
                    }
                    break;
                }
            }

            if (setRadius != null) setRadius.invoke(cardView, radius);
            if (setCardElevation != null) setCardElevation.invoke(cardView, 2f * density);
            if (setMaxCardElevation != null) setMaxCardElevation.invoke(cardView, 3f * density);
            if (setCardBackgroundColor != null) {
                setCardBackgroundColor.invoke(cardView, palette.container);
            }
            cardView.post(() -> settleSettingsCard(cardView));
        } catch (Throwable t) {
            Log.e(TAG, "applyCardStyle error", t);
        }
    }

    /** Joey settings cards share the page colour. Classic theme rows stay in the app, just hidden. */
    private static void settleSettingsCard(View card) {
        if (card == null || !isModernUiEnabled(card.getContext())) return;
        if (settingsSectionTitle(card) == null && !isSettingsGroup(card)) return;
        flattenSettingsSection(card);
        hideClassicLookRows(card);
    }

    private static boolean isSettingsGroup(View card) {
        Context context = card.getContext();
        java.util.HashSet<String> labels = new java.util.HashSet<>();
        for (String name : new String[]{
                "setting_item_general_setttings",
                "setting_item_gesture_setttings",
                "setting_item_link_handling",
                "setting_item_theme",
                "setting_item_font",
                "setting_item_about",
                "setting_item_post_style",
                "settings_theme_title"}) {
            int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
            if (id != 0) labels.add(context.getString(id));
        }
        return matchLabel(card, labels) != null;
    }

    private static void hideClassicLookRows(View card) {
        Context context = card.getContext();
        java.util.HashSet<String> hidden = new java.util.HashSet<>();
        for (String name : new String[]{
                "setting_item_theme",
                "settings_theme_title",
                "setting_item_font"}) {
            int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
            if (id != 0) hidden.add(context.getString(id));
        }
        hideMatchingRows(card, hidden);
    }

    private static void hideMatchingRows(View view, java.util.Set<String> labels) {
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            if (text != null && labels.contains(text.toString()) && view.getParent() instanceof View) {
                ((View) view.getParent()).setVisibility(View.GONE);
            }
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) hideMatchingRows(group.getChildAt(i), labels);
        }
    }

    /** Joey's settings groups: one canvas, an accent label, a hairline between groups. */
    private static void flattenSettingsSection(View card) {
        if (card == null || !isModernUiEnabled(card.getContext())) return;
        TextView title = settingsSectionTitle(card);
        try {
            Context context = card.getContext();
            Palette palette = getPalette(context);
            float density = context.getResources().getDisplayMetrics().density;
            for (Class<?> c = card.getClass(); c != null && c != View.class; c = c.getSuperclass()) {
                if (!c.getName().endsWith("CardView")) continue;
                for (Method m : c.getMethods()) {
                    String name = m.getName();
                    Class<?>[] pts = m.getParameterTypes();
                    if (pts.length != 1) continue;
                    if ("setRadius".equals(name) && pts[0] == float.class) m.invoke(card, 0f);
                    if ("setCardElevation".equals(name) && pts[0] == float.class) m.invoke(card, 0f);
                    if ("setMaxCardElevation".equals(name) && pts[0] == float.class) m.invoke(card, 0f);
                    if ("setUseCompatPadding".equals(name) && pts[0] == boolean.class) m.invoke(card, false);
                    if ("setCardBackgroundColor".equals(name) && pts[0] == int.class) m.invoke(card, palette.canvas);
                }
                break;
            }
            card.setBackgroundColor(palette.canvas);
            if (title == null) return;
            title.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            title.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            title.setTextColor(palette.accent);
            title.setTextSize(11);
            title.setAllCaps(true);
            title.setLetterSpacing(0.08f);
            int side = Math.round(16 * density);
            title.setPadding(side, Math.round(14 * density), side, Math.round(4 * density));
            if (!(title.getTag() instanceof String)) {
                title.setTag("morphe_settings_label");
                title.addOnLayoutChangeListener((v, l, t, r, b, ol, ot, or, ob) -> {
                    if (v instanceof TextView) {
                        ((TextView) v).setTextColor(getPalette(v.getContext()).accent);
                    }
                });
            }
            ViewGroup column = title.getParent() instanceof ViewGroup ? (ViewGroup) title.getParent() : null;
            if (column == null) return;
            column.setBackgroundColor(palette.canvas);
            View rule = column.findViewWithTag("morphe_settings_rule");
            if (rule == null) {
                rule = new View(context);
                rule.setTag("morphe_settings_rule");
                column.addView(rule, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Math.round(density))));
            }
            rule.setBackgroundColor(palette.outline);
        } catch (Throwable t) {
            Log.w(TAG, "settings section", t);
        }
    }

    private static TextView settingsSectionTitle(View root) {
        Context context = root.getContext();
        java.util.HashSet<String> labels = new java.util.HashSet<>();
        for (String name : new String[]{
                "settings_appearance_section_title",
                "settings_content_section_title",
                "settings_other_section_title"}) {
            int id = context.getResources().getIdentifier(name, "string", context.getPackageName());
            if (id != 0) labels.add(context.getString(id));
        }
        return matchLabel(root, labels);
    }

    private static TextView matchLabel(View view, java.util.Set<String> labels) {
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            if (text != null && labels.contains(text.toString())) return (TextView) view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                TextView found = matchLabel(group.getChildAt(i), labels);
                if (found != null) return found;
            }
        }
        return null;
    }

    public static View enhancePostView(View postView) {
        if (postView == null) return postView;
        if (!isModernUiEnabled(postView.getContext())) return postView;
        PostLayout.prepare(postView);
        return postView;
    }

    // =========================================================================
    // System Font Hook: zd.o1.a(I)Landroid/graphics/Typeface;
    // =========================================================================

    public static Typeface getTypefaceOverride(int id) {
        // Joey's comment, time, user, and arrow marks are drawn with font 5.
        if (id == 5) return null;
        Context context = getContext();
        if (context == null || !isModernUiEnabled(context)) return null;
        if (isSystemFontEnabled(context)) return Typeface.DEFAULT;
        return null;
    }

    public static Typeface overrideTypeface(int id, Typeface orig, Context context) {
        if (id == 5) return orig;
        if (context == null) return orig;
        if (!isModernUiEnabled(context)) return orig;
        if (isSystemFontEnabled(context)) {
            return Typeface.DEFAULT;
        }
        return orig;
    }

    // =========================================================================
    // Immersive Fullscreen Media Viewer Hook
    // =========================================================================

    public static void setupPhotoViewer(Activity activity) {
        if (activity == null) return;
        setContext(activity);
        if (!isModernUiEnabled(activity)) return;
        ViewerDock.attach(activity);
        applyImmersiveFullscreen(activity);
    }

    /** Album pages use the same bottom icons and fade. The status bar stays as Joey left it. */
    public static void setupAlbumViewer(Activity activity) {
        if (activity == null) return;
        setContext(activity);
        if (!isModernUiEnabled(activity)) return;
        ViewerDock.attach(activity);
    }

    public static void setupVideoViewer(Activity activity) {
        if (activity == null) return;
        setContext(activity);
        if (!isModernUiEnabled(activity)) return;
        applyImmersiveFullscreen(activity);
    }

    private static void applyImmersiveFullscreen(Activity activity) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;

            // Joey keeps the viewer window transparent and fades its own black backdrop
            // while dragging to dismiss, so the feed shows through. Do not fill the window.
            // The picture is laid out in the status-bar area from the first frame. A tap
            // only fades the controls.
            if (Build.VERSION.SDK_INT >= 30) {
                window.setDecorFitsSystemWindows(false);
            }
            window.setStatusBarColor(Color.TRANSPARENT);
            hideStatusBar(window);
            View decor = window.getDecorView();
            decor.setSystemUiVisibility(
                    View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                            | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY);
            Runnable settle = () -> {
                window.setStatusBarColor(Color.TRANSPARENT);
                hideStatusBar(window);
                pinMediaToTop(activity);
            };
            if (activity.findViewById(android.R.id.content) != null) settle.run();
            decor.post(settle);
            decor.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
                int frames = 8;

                @Override
                public boolean onPreDraw() {
                    if (activity.isFinishing() || frames-- <= 0) {
                        ViewTreeObserver observer = decor.getViewTreeObserver();
                        if (observer.isAlive()) observer.removeOnPreDrawListener(this);
                        return true;
                    }
                    int need = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                            | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_FULLSCREEN
                            | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
                    int vis = decor.getSystemUiVisibility();
                    if ((vis & need) != need) decor.setSystemUiVisibility(vis | need);
                    window.setStatusBarColor(Color.TRANSPARENT);
                    hideStatusBar(window);
                    View content = activity.findViewById(android.R.id.content);
                    View overlay = content != null && content.getParent() instanceof View
                            ? (View) content.getParent() : content;
                    if (overlay != null && overlay.getPaddingTop() != 0) {
                        overlay.setPadding(overlay.getPaddingLeft(), 0, overlay.getPaddingRight(), overlay.getPaddingBottom());
                    }
                    return true;
                }
            });
        } catch (Throwable t) {
            Log.e(TAG, "applyImmersiveFullscreen error", t);
        }
    }

    private static void hideStatusBar(Window window) {
        if (Build.VERSION.SDK_INT < 30) return;
        WindowInsetsController controller = window.getInsetsController();
        if (controller == null) return;
        controller.hide(WindowInsets.Type.statusBars());
        controller.setSystemBarsBehavior(WindowInsetsController.BEHAVIOR_SHOW_TRANSIENT_BARS_BY_SWIPE);
    }

    /** The media uses the top of the screen. The bottom inset stays, so the controls clear the gesture bar. */
    private static void pinMediaToTop(Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (content == null) return;
        View overlay = content.getParent() instanceof View ? (View) content.getParent() : content;
        overlay.setOnApplyWindowInsetsListener((view, insets) -> {
            int left;
            int right;
            int bottom;
            if (Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                left = bars.left;
                right = bars.right;
                bottom = bars.bottom;
            } else {
                left = insets.getSystemWindowInsetLeft();
                right = insets.getSystemWindowInsetRight();
                bottom = insets.getSystemWindowInsetBottom();
            }
            if (view.getPaddingLeft() != left || view.getPaddingTop() != 0
                    || view.getPaddingRight() != right || view.getPaddingBottom() != bottom) {
                view.setPadding(left, 0, right, bottom);
            }
            if (content.getPaddingTop() != 0) {
                content.setPadding(content.getPaddingLeft(), 0, content.getPaddingRight(), content.getPaddingBottom());
            }
            Window window = activity.getWindow();
            if (window != null) hideStatusBar(window);
            return insets.replaceSystemWindowInsets(left, 0, right, bottom).consumeSystemWindowInsets();
        });
        if (overlay.getPaddingTop() != 0) {
            overlay.setPadding(overlay.getPaddingLeft(), 0, overlay.getPaddingRight(), overlay.getPaddingBottom());
        }
        overlay.requestApplyInsets();
    }


    /** Saves are already committed. Repaint other screens, and rebuild Morphe settings in place. */
    public static void refreshLive(Activity current) {
        try {
            for (Activity activity : runningActivities()) {
                if (activity == null || activity == current || activity.isFinishing()) continue;
                activity.recreate();
            }
        } catch (Throwable t) {
            Log.w(TAG, "Could not refresh open screens", t);
        }
        MorpheSettings.repaint(current);
    }

    public static void setupNavigation(Activity activity) {
        if (activity == null || !isModernUiEnabled(activity)) return;
        setContext(activity);
        View content = activity.findViewById(android.R.id.content);
        if (content == null) return;
        content.post(() -> syncChrome(activity));
    }

    /** Folding does not recreate Home, so the rail and banner have to be applied again. */
    public static void syncChrome(Activity activity) {
        if (activity == null || activity.isFinishing() || !isModernUiEnabled(activity)) return;
        View content = activity.findViewById(android.R.id.content);
        applyBanner(content);
        if (showRail(activity) && railHost(activity)) ensureRail(activity);
        else removeRail(activity);
        if (homeFeed(activity) && railHost(activity)) setJoeyMenu(activity, false);
        clearTabIndicator(activity);
        applyMenuTheme(activity);
    }

    private static final WeakHashMap<View, Boolean> HEADER_GUARDS = new WeakHashMap<>();

    /** The post screen has the same header as Home, and scrolling was painting its border back. */
    public static void clearHeaderBorder(Activity activity) {
        if (activity == null || !isModernUiEnabled(activity)) return;
        clearTabIndicator(activity);
    }

    /** Joey paints showBorder along the bottom of the header, under the subreddit names. */
    private static void clearTabIndicator(Activity activity) {
        View appbar = activity.findViewById(getResId(activity, "appbar", "id"));
        if (appbar == null) return;
        stripHeaderLine(appbar);
        markCurrentTab(findChild(appbar, "sub_list_tab_layout"));
        markCurrentTab(findChild(appbar, "sliding_tab_layout"));
        hideIndicator(findChild(appbar, "tab_layout_comment_activity"));
        if (HEADER_GUARDS.containsKey(appbar)) return;
        HEADER_GUARDS.put(appbar, Boolean.TRUE);
        try {
            Class<?> listener = Class.forName(
                    "com.google.android.material.appbar.AppBarLayout$OnOffsetChangedListener");
            Object guard = java.lang.reflect.Proxy.newProxyInstance(
                    listener.getClassLoader(),
                    new Class<?>[]{listener},
                    (proxy, method, args) -> {
                        if (method.getDeclaringClass() == Object.class) {
                            if ("hashCode".equals(method.getName())) return System.identityHashCode(proxy);
                            if ("equals".equals(method.getName())) {
                                return proxy == (args == null || args.length == 0 ? null : args[0]);
                            }
                            return "morphe-header";
                        }
                        if ("onOffsetChanged".equals(method.getName()) && args != null
                                && args.length > 0 && args[0] instanceof View) {
                            stripHeaderLine((View) args[0]);
                        }
                        return null;
                    });
            appbar.getClass().getMethod("addOnOffsetChangedListener", listener).invoke(appbar, guard);
        } catch (Throwable ignored) {
        }
    }

    /** The border is drawn by the header itself, and a scroll can lift a second edge under it. */
    private static void stripHeaderLine(View appbar) {
        appbar.setElevation(0f);
        appbar.setStateListAnimator(null);
        try {
            appbar.getClass().getMethod("setLiftOnScroll", boolean.class).invoke(appbar, false);
        } catch (Throwable ignored) {
        }
        try {
            java.lang.reflect.Field border = appbar.getClass().getDeclaredField("b");
            border.setAccessible(true);
            border.setBoolean(appbar, false);
        } catch (Throwable ignored) {
        }
        appbar.invalidate();
    }

    private static final WeakHashMap<View, TabGlow> TAB_GLOWS = new WeakHashMap<>();

    /** A short accent mark under the open subreddit only. The full-width header line stays off. */
    private static void markCurrentTab(View tabs) {
        if (tabs == null) return;
        Palette palette = getPalette(tabs.getContext());
        float density = tabs.getResources().getDisplayMetrics().density;
        int height = Math.max(1, Math.round(10 * density));
        TabGlow glow = TAB_GLOWS.get(tabs);
        if (glow == null) {
            glow = new TabGlow(palette.accent);
            TAB_GLOWS.put(tabs, glow);
            try {
                tabs.getClass().getMethod("setTabIndicatorFullWidth", boolean.class).invoke(tabs, false);
            } catch (Throwable ignored) {
            }
            try {
                tabs.getClass().getMethod("setSelectedTabIndicator", android.graphics.drawable.Drawable.class)
                        .invoke(tabs, glow);
            } catch (Throwable ignored) {
            }
            try {
                tabs.getClass().getMethod("setSelectedTabIndicatorHeight", int.class).invoke(tabs, height);
            } catch (Throwable ignored) {
            }
            seatGlow(tabs);
        } else if (glow.color != palette.accent) {
            glow.setColor(palette.accent);
        }
        try {
            tabs.getClass().getMethod("setTabTextColors", int.class, int.class)
                    .invoke(tabs, palette.onSurfaceVariant, palette.onSurface);
        } catch (Throwable ignored) {
        }
    }

    /** Replacing the indicator clears its width, so the open tab has to be measured again once. */
    private static void seatGlow(View tabs) {
        try {
            int position = (Integer) tabs.getClass().getMethod("getSelectedTabPosition").invoke(tabs);
            if (position < 0) return;
            tabs.getClass().getMethod("setScrollPosition", int.class, float.class, boolean.class, boolean.class)
                    .invoke(tabs, position, 0f, false, true);
        } catch (Throwable ignored) {
        }
    }

    private static void hideIndicator(View tabs) {
        if (tabs == null) return;
        try {
            tabs.getClass().getMethod("setSelectedTabIndicatorHeight", int.class).invoke(tabs, 0);
        } catch (Throwable ignored) {
        }
        try {
            tabs.getClass().getMethod("setSelectedTabIndicator", android.graphics.drawable.Drawable.class)
                    .invoke(tabs, new Object[]{null});
        } catch (Throwable ignored) {
        }
    }

    /** Soft accent light under the name, with the short mark kept at the bottom. */
    private static final class TabGlow extends android.graphics.drawable.Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private int color;

        TabGlow(int color) {
            this.color = color;
        }

        void setColor(int color) {
            if (this.color == color) return;
            this.color = color;
            invalidateSelf();
        }

        @Override
        public void draw(Canvas canvas) {
            android.graphics.Rect bounds = getBounds();
            if (bounds.width() <= 0 || bounds.height() <= 0) return;
            int glow = Color.argb(120, Color.red(color), Color.green(color), Color.blue(color));
            paint.setColorFilter(null);
            paint.setShader(new LinearGradient(
                    0f, bounds.bottom, 0f, bounds.top,
                    new int[]{glow, Color.TRANSPARENT},
                    new float[]{0.15f, 1f},
                    Shader.TileMode.CLAMP));
            float radius = bounds.height() / 2f;
            canvas.drawRoundRect(bounds.left, bounds.top, bounds.right, bounds.bottom, radius, radius, paint);
            paint.setShader(null);
            paint.setColor(color);
            float bar = Math.max(1f, bounds.height() * 0.22f);
            canvas.drawRoundRect(bounds.left, bounds.bottom - bar, bounds.right, bounds.bottom, bar / 2f, bar / 2f, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter filter) {
        }

        @Override
        public void setTintList(android.content.res.ColorStateList tint) {
        }

        @Override
        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    private static int darker(int color, float scale) {
        return Color.argb(
                Color.alpha(color),
                Math.round(Color.red(color) * scale),
                Math.round(Color.green(color) * scale),
                Math.round(Color.blue(color) * scale));
    }

    /** The overflow menu follows the activity theme, which stays light under the Modern colors. */
    public static void applyMenuTheme(Activity activity) {
        if (activity == null || !isModernUiEnabled(activity)) return;
        int toolbarId = activity.getResources().getIdentifier("toolbar", "id", activity.getPackageName());
        if (toolbarId == 0) return;
        View toolbar = activity.findViewById(toolbarId);
        if (toolbar == null) return;
        String pkg = activity.getPackageName();
        int theme = activity.getResources().getIdentifier("ThemeOverlay.Material3.Dark", "style", pkg);
        if (theme == 0) theme = activity.getResources().getIdentifier("ThemeOverlay.AppCompat.Dark", "style", pkg);
        if (theme == 0) return;
        try {
            toolbar.getClass().getMethod("setPopupTheme", int.class).invoke(toolbar, theme);
        } catch (Throwable ignored) {
        }
    }

    public static void applyBanner(View root) {
        if (root == null) return;
        Context context = root.getContext();
        if (context == null || !isModernUiEnabled(context)) return;
        int bannerId = root.getResources().getIdentifier("top_info_banner", "id", context.getPackageName());
        if (bannerId == 0) return;
        ArrayList<View> banners = new ArrayList<>();
        collectBanners(root, bannerId, banners);
        for (View banner : banners) {
            enforceBanner(banner);
            watchBanner(banner);
        }
    }

    private static void collectBanners(View view, int bannerId, List<View> out) {
        if (view.getId() == bannerId) out.add(view);
        if (!(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collectBanners(group.getChildAt(i), bannerId, out);
    }

    /** Joey loads the subreddit image after the header binds, so the watch has to stay on the view. */
    private static void watchBanner(View banner) {
        if (BANNER_WATCH.containsKey(banner)) return;
        BANNER_WATCH.put(banner, Boolean.TRUE);
        ViewTreeObserver.OnPreDrawListener predraw = new ViewTreeObserver.OnPreDrawListener() {
            @Override
            public boolean onPreDraw() {
                enforceBanner(banner);
                return true;
            }
        };
        banner.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View v) {
                v.getViewTreeObserver().addOnPreDrawListener(predraw);
                enforceBanner(v);
            }

            @Override
            public void onViewDetachedFromWindow(View v) {
                ViewTreeObserver observer = v.getViewTreeObserver();
                if (observer.isAlive()) observer.removeOnPreDrawListener(predraw);
            }
        });
        if (banner.isAttachedToWindow()) {
            banner.getViewTreeObserver().addOnPreDrawListener(predraw);
        }
    }

    private static void enforceBanner(View banner) {
        if (banner.getLayoutParams() == null) return;
        Context context = banner.getContext();
        if (context == null || !isModernUiEnabled(context)) return;
        int scale = bannerScale(context);
        boolean hidden = scale <= 0;
        float density = banner.getResources().getDisplayMetrics().density;
        int height = Math.round(140f * density);
        if (!hidden) restoreBannerArt(banner);
        if (banner instanceof ImageView) {
            ((ImageView) banner).setAdjustViewBounds(false);
        }
        banner.setMinimumHeight(height);
        ViewGroup.LayoutParams lp = banner.getLayoutParams();
        int visibility = hidden ? View.INVISIBLE : View.VISIBLE;
        if (banner.getVisibility() != visibility) banner.setVisibility(visibility);
        if (lp.height != height) {
            lp.height = height;
            if (!banner.isInLayout()) banner.setLayoutParams(lp);
        }
        View container = banner.getParent() instanceof View ? (View) banner.getParent() : null;
        if (container == null) return;
        if (container.getVisibility() != View.VISIBLE) container.setVisibility(View.VISIBLE);
        Activity host = activityOf(context);
        int status = host == null ? 0 : statusBarHeight(host);
        if (container.getPaddingTop() != status) {
            container.setPadding(container.getPaddingLeft(), status, container.getPaddingRight(), container.getPaddingBottom());
        }
        // This runs before every draw. Repeating the text measure and the tab recolor
        // stalls a swipe, so the heavy pass only runs again when the header actually changes.
        int signature = bannerSignature(banner, container, hidden, height);
        Integer applied = BANNER_SIG.get(banner);
        if (applied != null && applied == signature) {
            // Joey can put the picture colour back over the blur between frames.
            clearPictureTint(banner);
            if (banner.getBackground() != null) banner.setBackground(null);
            followWash(container, banner);
            View collapsing = container.getParent() instanceof View ? (View) container.getParent() : null;
            if (collapsing != null && homeFeed(activityOf(context))) followToolbar(collapsing, container);
            return;
        }
        BANNER_SIG.put(banner, signature);
        clipChildren(container);
        setSlot(container, "top_info_icon", true);
        setSlot(container, "top_info_headline", true);
        setSlot(container, "top_info_desc", true);
        setSlot(container, "top_info_stats", true);
        anchorChips(container, banner);
        placeSlotCard(container, banner, hidden);
        View collapsing = container.getParent() instanceof View ? (View) container.getParent() : null;
        Activity activity = activityOf(context);
        boolean home = homeFeed(activity);
        if (collapsing != null) {
            setScrollFlags(collapsing, SCROLL_WITH_BANNER);
            setParallax(container, hidden ? 0f : 0.5f);
            if (home) {
                seatToolbar(collapsing, false);
                parkToolbar(collapsing, container);
                if (!hidden) hideCollapsedTitle(collapsing);
            } else {
                raiseBack(collapsing, container);
            }
        }
        if (collapsing != null && (hidden || !home)) paintToolbarTitle(collapsing, false);
        placeTabMenu(container, home && (activity == null || !showRail(activity)));
        if (activity != null) {
            clearTabIndicator(activity);
            seatRail(activity);
        }
    }

    /** Picture, title and size. Position is left out so a scroll does not restyle the header. */
    private static int bannerSignature(View banner, View container, boolean hidden, int height) {
        int art = 0;
        if (banner instanceof ImageView) {
            android.graphics.drawable.Drawable drawable = ((ImageView) banner).getDrawable();
            art = drawable == null ? 0 : System.identityHashCode(drawable);
        }
        View card = container.findViewWithTag("morphe_slot_card");
        int cardHeight = card == null ? -1 : card.getHeight();
        int hash = hidden ? 1 : 0;
        hash = 31 * hash + height;
        hash = 31 * hash + banner.getWidth();
        hash = 31 * hash + banner.getHeight();
        hash = 31 * hash + art;
        hash = 31 * hash + cardHeight;
        hash = 31 * hash + container.getWidth();
        hash = 31 * hash + String.valueOf(textOf(container, "top_info_headline")).hashCode();
        hash = 31 * hash + String.valueOf(textOf(container, "top_info_desc")).hashCode();
        hash = 31 * hash + chipSignature(container);
        Palette palette = getPalette(banner.getContext());
        hash = 31 * hash + palette.accent;
        hash = 31 * hash + palette.primary;
        return hash;
    }

    /** Join and sort labels, so a chip change still restyles the header. */
    private static int chipSignature(View container) {
        View chips = findChild(container, "top_info_chipGroup");
        if (!(chips instanceof ViewGroup)) return 0;
        ViewGroup group = (ViewGroup) chips;
        int hash = group.getChildCount();
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            hash = 31 * hash + child.getVisibility();
            hash = 31 * hash + chipLabel(child).hashCode();
        }
        return hash;
    }

    /** Keeps the blur lined up when the banner moves, without rebuilding it. */
    private static void followWash(View container, View banner) {
        if (!(container instanceof ViewGroup)) return;
        View wash = ((ViewGroup) container).findViewWithTag("morphe_slot_wash");
        if (wash == null || wash.getVisibility() != View.VISIBLE) return;
        float dx = banner.getLeft() - wash.getLeft();
        float dy = banner.getTop() - wash.getTop();
        if (Math.abs(wash.getTranslationX() - dx) > 1f || Math.abs(wash.getTranslationY() - dy) > 1f) {
            wash.setTranslationX(dx);
            wash.setTranslationY(dy);
        }
    }

    /** Keeps the home toolbar beside the chips while the header scrolls. */
    private static void followToolbar(View collapsing, View container) {
        View toolbar = findChild(collapsing, "toolbar");
        View chips = findChild(container, "top_info_hsv");
        if (toolbar == null || chips == null || chips.getHeight() == 0) return;
        int target = chips.getTop() + (chips.getHeight() - toolbar.getHeight()) / 2;
        float shift = target - toolbar.getTop();
        if (Math.abs(toolbar.getTranslationY() - shift) > 1f) toolbar.setTranslationY(shift);
    }

    /** Name and description sit on the lower left of the banner. The picture stays sharp. */
    private static void placeSlotCard(View container, View banner, boolean hidden) {
        if (!(container instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) container;
        placeWash(group, banner, hidden);
        LinearLayout card = (LinearLayout) group.findViewWithTag("morphe_slot_card");
        TextView nameView;
        TextView bodyView;
        if (card == null) {
            card = new LinearLayout(container.getContext());
            card.setTag("morphe_slot_card");
            card.setOrientation(LinearLayout.VERTICAL);
            nameView = new TextView(container.getContext());
            bodyView = new TextView(container.getContext());
            TextView moreView = new TextView(container.getContext());
            nameView.setTag("morphe_slot_name");
            bodyView.setTag("morphe_slot_body");
            moreView.setTag("morphe_slot_more");
            moreView.setText("More");
            moreView.setTextSize(12);
            card.addView(nameView);
            card.addView(bodyView);
            card.addView(moreView);
            group.addView(card);
        } else {
            nameView = card.findViewWithTag("morphe_slot_name");
            bodyView = card.findViewWithTag("morphe_slot_body");
        }
        float density = container.getResources().getDisplayMetrics().density;
        int pad = Math.round(8 * density);
        if (card.getPaddingLeft() != pad) card.setPadding(pad, pad, pad, pad);
        Palette palette = getPalette(container.getContext());
        int wash = hidden ? Color.argb(210, Color.red(palette.primary), Color.green(palette.primary), Color.blue(palette.primary))
                : Color.argb(150, Color.red(palette.primary), Color.green(palette.primary), Color.blue(palette.primary));
        GradientDrawable bubble = new GradientDrawable();
        bubble.setCornerRadius(12 * density);
        bubble.setColor(wash);
        card.setBackground(bubble);
        int shadow = Color.argb(56, 0, 0, 0);
        CharSequence title = textOf(container, "top_info_headline");
        if (title == null || title.length() == 0) title = toolbarTitle(container);
        CharSequence body = textOf(container, "top_info_desc");
        styleSlotText(nameView, title, 16f, palette.accent, shadow, true);
        int lines = container.getResources().getConfiguration().screenWidthDp >= 500 ? 4 : 3;
        paintBody(bodyView, body, lines, palette.onSurface, palette.accent, shadow);
        TextView moreView = card.findViewWithTag("morphe_slot_more");
        if (moreView != null && moreView.getVisibility() != View.GONE) moreView.setVisibility(View.GONE);
        boolean open = body != null && body.length() > 0;
        CharSequence fullTitle = title;
        CharSequence fullBody = body;
        card.setOnClickListener(open ? v -> showDescription(activityOf(v.getContext()), fullTitle, fullBody) : null);
        card.setClickable(open);
        if (group.indexOfChild(card) != group.getChildCount() - 1) card.bringToFront();
        int max = Math.round((container.getResources().getConfiguration().screenWidthDp >= 500 ? 420 : 300) * density);
        int limit = container.getWidth() - Math.round(24 * density);
        if (limit > 0 && max > limit) max = limit;
        nameView.setMaxWidth(max);
        bodyView.setMaxWidth(max);
        int text = Math.max(textWidth(nameView, max), textWidth(bodyView, max));
        int width = text <= 0 ? ViewGroup.LayoutParams.WRAP_CONTENT : Math.min(max, text + pad * 2);
        ViewGroup.LayoutParams cardLp = card.getLayoutParams();
        if (cardLp != null && (cardLp.width != width || cardLp.height != ViewGroup.LayoutParams.WRAP_CONTENT)) {
            cardLp.width = width;
            cardLp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
            card.setLayoutParams(cardLp);
        }
        int margin = Math.round(12 * density);
        card.setTranslationX(margin);
        int top = banner.getBottom() - card.getHeight() - margin;
        if (card.getHeight() == 0) top = banner.getTop() + margin;
        card.setTranslationY(top - card.getTop());
        if (hidden && banner.getBackground() == null) banner.setBackgroundColor(palette.primary);
    }

    /** Blurred copy behind Joey's own picture, so a short banner has no hard edge. */
    private static void placeWash(ViewGroup group, View banner, boolean hidden) {
        if (banner.getAlpha() != 1f) banner.setAlpha(1f);
        View sharp = group.findViewWithTag("morphe_slot_sharp");
        if (sharp != null && sharp.getVisibility() != View.GONE) sharp.setVisibility(View.GONE);
        ImageView wash = (ImageView) group.findViewWithTag("morphe_slot_wash");
        if (wash == null) {
            wash = new ImageView(banner.getContext());
            wash.setTag("morphe_slot_wash");
            wash.setScaleType(ImageView.ScaleType.CENTER_CROP);
            wash.setAdjustViewBounds(false);
            group.addView(wash, 0);
        }
        int height = banner.getLayoutParams() != null && banner.getLayoutParams().height > 0
                ? banner.getLayoutParams().height : banner.getHeight();
        int width = banner.getWidth() > 0 ? banner.getWidth() : ViewGroup.LayoutParams.MATCH_PARENT;
        ViewGroup.LayoutParams lp = wash.getLayoutParams();
        if (lp != null && (lp.width != width || lp.height != height)) {
            lp.width = width;
            lp.height = height;
            if (!wash.isInLayout()) wash.setLayoutParams(lp);
        }
        wash.setMinimumHeight(height);
        wash.setTranslationX(banner.getLeft() - wash.getLeft());
        wash.setTranslationY(banner.getTop() - wash.getTop());
        android.graphics.Bitmap bitmap = banner instanceof ImageView
                ? bitmapOf(((ImageView) banner).getDrawable()) : null;
        boolean blur = !hidden && needsBlur(bitmap, banner.getWidth(), height);
        if (banner instanceof ImageView) {
            ImageView picture = (ImageView) banner;
            ImageView.ScaleType scale = blur ? ImageView.ScaleType.FIT_CENTER : ImageView.ScaleType.CENTER_CROP;
            if (picture.getScaleType() != scale) picture.setScaleType(scale);
        }
        // The picture's own fill covers the blur and replaces a theme colour. Drop it once the art is in.
        if (bitmap != null && banner.getBackground() != null) banner.setBackground(null);
        if (!blur) {
            if (wash.getVisibility() != View.GONE) wash.setVisibility(View.GONE);
            if (wash.getColorFilter() != null) wash.setColorFilter(null);
            clearPictureTint(banner);
            return;
        }
        if (wash.getVisibility() != View.VISIBLE) wash.setVisibility(View.VISIBLE);
        if (wash.getScaleType() != ImageView.ScaleType.CENTER_CROP) {
            wash.setScaleType(ImageView.ScaleType.CENTER_CROP);
        }
        if (wash.getScaleX() != 1f) {
            wash.setScaleX(1f);
            wash.setScaleY(1f);
        }
        android.graphics.drawable.Drawable stored = WASH_SOURCE.get(wash);
        android.graphics.Bitmap storedBitmap = stored instanceof android.graphics.drawable.BitmapDrawable
                ? ((android.graphics.drawable.BitmapDrawable) stored).getBitmap() : null;
        if (bitmap != null && storedBitmap != bitmap) {
            Bitmap previous = WASH_BITMAP.remove(wash);
            wash.setImageBitmap(bitmap);
            if (previous != null) previous.recycle();
            WASH_SOURCE.put(wash, new android.graphics.drawable.BitmapDrawable(banner.getResources(), bitmap));
            WASH_BLUR.remove(wash);
        }
        if (Build.VERSION.SDK_INT >= 31 && bitmap != null
                && !Float.valueOf(BORDER_BLUR).equals(WASH_BLUR.get(wash))) {
            wash.setRenderEffect(android.graphics.RenderEffect.createBlurEffect(
                    BORDER_BLUR, BORDER_BLUR, android.graphics.Shader.TileMode.CLAMP));
            WASH_BLUR.put(wash, BORDER_BLUR);
        }
        clearPictureTint(banner);
        if (wash.getColorFilter() != null) wash.setColorFilter(null);
    }

    /** The sharp picture stays as Reddit sent it. */
    private static void clearPictureTint(View banner) {
        if (banner instanceof ImageView && ((ImageView) banner).getColorFilter() != null) {
            ((ImageView) banner).setColorFilter(null);
        }
    }

    /** Blur only when the picture is too narrow to cover the slot. A wide header just fills it. */
    private static boolean needsBlur(android.graphics.Bitmap bitmap, int slotWidth, int slotHeight) {
        if (bitmap == null || slotWidth <= 0 || slotHeight <= 0) return false;
        if (bitmap.getWidth() <= 0 || bitmap.getHeight() <= 0) return false;
        float image = bitmap.getWidth() / (float) bitmap.getHeight();
        float slot = slotWidth / (float) slotHeight;
        return image < slot * 0.92f;
    }

    /** The fitted picture, skipping the solid color Joey fades in behind it. */
    private static android.graphics.Bitmap bitmapOf(android.graphics.drawable.Drawable art) {
        if (art instanceof android.graphics.drawable.BitmapDrawable) {
            return ((android.graphics.drawable.BitmapDrawable) art).getBitmap();
        }
        if (art instanceof android.graphics.drawable.TransitionDrawable) {
            android.graphics.drawable.TransitionDrawable transition = (android.graphics.drawable.TransitionDrawable) art;
            for (int i = transition.getNumberOfLayers() - 1; i >= 0; i--) {
                android.graphics.Bitmap bitmap = bitmapOf(transition.getDrawable(i));
                if (bitmap != null) return bitmap;
            }
        }
        if (art instanceof android.graphics.drawable.LayerDrawable) {
            android.graphics.drawable.LayerDrawable layers = (android.graphics.drawable.LayerDrawable) art;
            for (int i = layers.getNumberOfLayers() - 1; i >= 0; i--) {
                android.graphics.Bitmap bitmap = bitmapOf(layers.getDrawable(i));
                if (bitmap != null) return bitmap;
            }
        }
        return null;
    }

    private static CharSequence toolbarTitle(View container) {
        View collapsing = container.getParent() instanceof View ? (View) container.getParent() : null;
        View toolbar = collapsing == null ? null : findChild(collapsing, "toolbar");
        if (toolbar == null) return "";
        try {
            Object title = toolbar.getClass().getMethod("getTitle").invoke(toolbar);
            return title instanceof CharSequence ? (CharSequence) title : "";
        } catch (Throwable ignored) {
            return "";
        }
    }

    /** Fits the description, and paints an accent "More" where the gray ellipsis used to be. */
    private static void paintBody(TextView view, CharSequence full, int maxLines, int color, int accent, int shadow) {
        if (view == null) return;
        view.setTextSize(13);
        view.setTextColor(color);
        view.setTypeface(Typeface.DEFAULT);
        view.setShadowLayer(14f, 0f, 1f, shadow);
        view.setMaxLines(maxLines);
        view.setEllipsize(null);
        if (full == null || full.length() == 0) {
            if (view.getVisibility() != View.GONE) view.setVisibility(View.GONE);
            return;
        }
        if (view.getVisibility() != View.VISIBLE) view.setVisibility(View.VISIBLE);
        String text = full.toString().replace('\n', ' ').trim();
        int width = view.getWidth() - view.getPaddingLeft() - view.getPaddingRight();
        CharSequence next = text;
        if (width > 0) {
            android.text.TextPaint paint = view.getPaint();
            android.text.StaticLayout whole = android.text.StaticLayout.Builder
                    .obtain(text, 0, text.length(), paint, width).build();
            if (whole.getLineCount() > maxLines) {
                String suffix = " … More";
                int low = 0;
                int high = text.length();
                int fit = 0;
                while (low <= high) {
                    int mid = (low + high) >>> 1;
                    String candidate = text.substring(0, mid).trim() + suffix;
                    android.text.StaticLayout layout = android.text.StaticLayout.Builder
                            .obtain(candidate, 0, candidate.length(), paint, width).build();
                    if (layout.getLineCount() <= maxLines) {
                        fit = mid;
                        low = mid + 1;
                    } else {
                        high = mid - 1;
                    }
                }
                String shown = text.substring(0, fit).trim();
                android.text.SpannableString span = new android.text.SpannableString(shown + suffix);
                span.setSpan(new android.text.style.ForegroundColorSpan(accent),
                        shown.length(), shown.length() + suffix.length(),
                        android.text.Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                next = span;
            }
        }
        if (!String.valueOf(view.getText()).equals(String.valueOf(next))) view.setText(next);
    }

    /** Width of the text itself, so a short description does not keep a wide bubble. */
    private static int textWidth(TextView view, int max) {
        if (view == null || view.getVisibility() == View.GONE) return 0;
        CharSequence text = view.getText();
        if (text == null || text.length() == 0) return 0;
        int inner = max > 0 ? max : 100000;
        android.text.StaticLayout layout = android.text.StaticLayout.Builder
                .obtain(text, 0, text.length(), view.getPaint(), inner).build();
        float width = 0f;
        for (int i = 0; i < layout.getLineCount(); i++) {
            width = Math.max(width, layout.getLineWidth(i));
        }
        return (int) Math.ceil(width);
    }

    private static void showDescription(Activity activity, CharSequence title, CharSequence body) {
        if (activity == null || body == null || body.length() == 0) return;
        LinearLayout page = MorpheDialog.page(activity, title == null ? "" : title.toString(), null);
        TextView copy = new TextView(activity);
        copy.setText(body);
        copy.setTextColor(MorpheDialog.TEXT);
        copy.setTextSize(15);
        copy.setLineSpacing(0f, 1.25f);
        LinearLayout copyWrap = new LinearLayout(activity);
        copyWrap.setOrientation(LinearLayout.VERTICAL);
        copyWrap.addView(copy);
        page.addView(MorpheDialog.scroller(activity, copyWrap));
        TextView close = MorpheDialog.action(activity, "Close", MorpheDialog.GOLD);
        android.app.AlertDialog[] shown = new android.app.AlertDialog[1];
        close.setOnClickListener(v -> {
            if (shown[0] != null) shown[0].dismiss();
        });
        page.addView(MorpheDialog.actions(activity, close));
        shown[0] = MorpheDialog.show(activity, page);
        android.app.AlertDialog dialog = shown[0];
        View decor = dialog.getWindow() == null ? null : dialog.getWindow().getDecorView();
        if (decor == null) return;
        decor.setAlpha(0f);
        decor.setScaleX(0.96f);
        decor.setScaleY(0.96f);
        decor.animate().alpha(1f).scaleX(1f).scaleY(1f).setDuration(220).start();
    }

    private static void styleSlotText(TextView view, CharSequence value, float size, int color, int shadow, boolean bold) {
        if (view == null) return;
        if (!String.valueOf(view.getText()).equals(String.valueOf(value))) view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        view.setTypeface(bold ? Typeface.DEFAULT_BOLD : Typeface.DEFAULT);
        view.setShadowLayer(14f, 0f, 1f, shadow);
        int visibility = value == null || value.length() == 0 ? View.GONE : View.VISIBLE;
        if (view.getVisibility() != visibility) view.setVisibility(visibility);
    }

    private static CharSequence textOf(View container, String name) {
        View view = findChild(container, name);
        if (view instanceof TextView) return ((TextView) view).getText();
        return "";
    }

    private static void tie(View view, int bannerId) {
        boolean moved = setConstraint(view, "startToStart", 0)
                | setConstraint(view, "endToEnd", 0)
                | setConstraint(view, "leftToLeft", 0)
                | setConstraint(view, "rightToRight", 0)
                | setConstraint(view, "topToTop", bannerId)
                | setConstraint(view, "bottomToBottom", bannerId);
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp.width != ViewGroup.LayoutParams.MATCH_PARENT || lp.height != 0) {
            lp.width = ViewGroup.LayoutParams.MATCH_PARENT;
            lp.height = 0;
            moved = true;
        }
        if (moved) view.setLayoutParams(lp);
    }

    private static void anchorChips(View container, View banner) {
        View chips = findChild(container, "top_info_hsv");
        if (chips == null) return;
        boolean moved = setConstraint(chips, "topToBottom", banner.getId())
                | setConstraint(chips, "topToTop", -1)
                | setConstraint(chips, "bottomToTop", -1);
        float density = container.getResources().getDisplayMetrics().density;
        int min = Math.round(48 * density);
        if (chips.getMinimumHeight() < min) chips.setMinimumHeight(min);
        if (chips.getPaddingRight() != 0) {
            chips.setPadding(chips.getPaddingLeft(), chips.getPaddingTop(), 0, chips.getPaddingBottom());
        }
        applyHeaderChips(container);
        int gutter = iconGutter(container);
        if (chips.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams) chips.getLayoutParams();
            if (Math.abs(margins.rightMargin - gutter) > 4 || Math.abs(margins.getMarginEnd() - gutter) > 4) {
                margins.rightMargin = gutter;
                margins.setMarginEnd(gutter);
                moved = true;
            }
        }
        if (moved && chips.getLayoutParams() != null) chips.setLayoutParams(chips.getLayoutParams());
    }

    private static int iconBudget = -1;

    /** How many toolbar icons may stay beside the chips. -1 means the menu decides. */
    public static int toolbarIconBudget(Activity activity) {
        if (activity == null || !isModernUiEnabled(activity)) return -1;
        int id = activity.getResources().getIdentifier("top_info_chipGroup", "id", activity.getPackageName());
        if (id == 0 || activity.findViewById(id) == null) return -1;
        return iconBudget;
    }

    /**
     * Chips keep their full width. Icons that do not fit beside them move into the overflow,
     * which always keeps its own button.
     */
    private static int iconGutter(View container) {
        float density = container.getResources().getDisplayMetrics().density;
        int slot = Math.round(48 * density);
        int gap = Math.round(8 * density);
        View group = findChild(container, "top_info_chipGroup");
        if (group == null || group.getWidth() <= 0 || container.getWidth() <= 0) {
            return slot + gap;
        }
        int inset = 0;
        View scroller = findChild(container, "top_info_hsv");
        if (scroller != null && scroller.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            inset = ((ViewGroup.MarginLayoutParams) scroller.getLayoutParams()).leftMargin;
        }
        int room = container.getWidth() - inset - group.getWidth() - gap;
        int icons = Math.max(0, (room - slot) / slot);
        if (icons != iconBudget) {
            iconBudget = icons;
            Activity activity = activityOf(container.getContext());
            if (activity != null) activity.invalidateOptionsMenu();
        }
        return (icons + 1) * slot + gap;
    }

    /** A hidden chip is marked gone as Joey adds it, so it never takes a frame on screen. */
    private static void concealHeaderChips(View container) {
        View group = findChild(container, "top_info_chipGroup");
        if (!(group instanceof ViewGroup)) return;
        ViewGroup chips = (ViewGroup) group;
        watchChips(chips);
        Context context = chips.getContext();
        if (context == null || !isModernUiEnabled(context)) return;
        for (int i = 0; i < chips.getChildCount(); i++) settleChip(chips.getChildAt(i));
    }

    private static void watchChips(ViewGroup chips) {
        if (chips.getTag(CHIP_WATCH) != null) return;
        chips.setTag(CHIP_WATCH, Boolean.TRUE);
        // ChipGroup keeps its own listener and calls this one after it. Calling that
        // listener again loops until the app crashes.
        chips.setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() {
            @Override
            public void onChildViewAdded(View parent, View child) {
                settleChip(child);
                if (!(parent instanceof ViewGroup)) return;
                if (!"join".equals(chipKind(child)) || child.getVisibility() != View.VISIBLE) return;
                ChipTurn turn = turn((ViewGroup) parent);
                turn.added = child;
                if (turn.removedView != child) child.setAlpha(0f);
                scheduleTurn((ViewGroup) parent, turn);
            }

            @Override
            public void onChildViewRemoved(View parent, View child) {
                if (!(parent instanceof ViewGroup)) return;
                if (!"join".equals(chipKind(child)) || child.getWidth() <= 0) return;
                ChipTurn turn = turn((ViewGroup) parent);
                turn.removed = true;
                turn.removedView = child;
                scheduleTurn((ViewGroup) parent, turn);
            }
        });
    }

    /** One rebuild can remove the old Joined chip and add the next. Fade only a real come or go. */
    private static void scheduleTurn(ViewGroup chips, ChipTurn turn) {
        if (turn.posted) return;
        turn.posted = true;
        chips.post(() -> {
            turn.posted = false;
            View added = turn.added;
            boolean removed = turn.removed;
            View removedView = turn.removedView;
            turn.added = null;
            turn.removed = false;
            turn.removedView = null;
            if (added != null && added == removedView) {
                dropGhost(turn);
                return;
            }
            if (added != null && removed) {
                added.setAlpha(1f);
                dropGhost(turn);
                return;
            }
            if (added != null) {
                dropGhost(turn);
                fadeJoinIn(added);
                return;
            }
            if (removedView != null) rememberJoin(turn, chips, removedView);
            fadeJoinOut(chips, turn);
        });
    }

    private static void fadeJoinIn(View chip) {
        chip.setAlpha(0f);
        ViewTreeObserver observer = chip.getViewTreeObserver();
        observer.addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
            int last = -1;
            int seen = 0;

            @Override
            public boolean onPreDraw() {
                if (!chip.isAttachedToWindow()) {
                    if (observer.isAlive()) observer.removeOnPreDrawListener(this);
                    return true;
                }
                int width = chip.getWidth();
                seen++;
                boolean settled = width > 0 && width == last;
                last = width;
                if (!settled && seen < 4) return true;
                if (observer.isAlive()) observer.removeOnPreDrawListener(this);
                chip.animate().alpha(1f).setDuration(180).start();
                return true;
            }
        });
    }

    private static void rememberJoin(ChipTurn turn, ViewGroup chips, View child) {
        dropGhost(turn);
        int width = child.getWidth();
        int height = child.getHeight();
        if (width <= 0 || height <= 0) return;
        View hostView = chips.getParent() instanceof View ? (View) chips.getParent().getParent() : null;
        if (!(hostView instanceof ViewGroup)) return;
        ViewGroup host = (ViewGroup) hostView;
        try {
            android.graphics.Bitmap bitmap = android.graphics.Bitmap.createBitmap(
                    width, height, android.graphics.Bitmap.Config.ARGB_8888);
            child.draw(new Canvas(bitmap));
            int[] chipAt = new int[2];
            int[] hostAt = new int[2];
            child.getLocationInWindow(chipAt);
            host.getLocationInWindow(hostAt);
            turn.ghost = bitmap;
            turn.host = host;
            turn.ghostLeft = chipAt[0] - hostAt[0];
            turn.ghostTop = chipAt[1] - hostAt[1];
        } catch (Throwable ignored) {
            dropGhost(turn);
        }
    }

    private static void fadeJoinOut(ViewGroup chips, ChipTurn turn) {
        android.graphics.Bitmap bitmap = turn.ghost;
        View hostView = turn.host;
        turn.ghost = null;
        turn.host = null;
        if (bitmap == null || !(hostView instanceof ViewGroup)) {
            if (bitmap != null) bitmap.recycle();
            return;
        }
        ViewGroup host = (ViewGroup) hostView;
        ImageView ghost = new ImageView(host.getContext());
        ghost.setImageBitmap(bitmap);
        host.getOverlay().add(ghost);
        ghost.layout(turn.ghostLeft, turn.ghostTop,
                turn.ghostLeft + bitmap.getWidth(), turn.ghostTop + bitmap.getHeight());
        ghost.animate().alpha(0f).setDuration(180).withEndAction(() -> {
            host.getOverlay().remove(ghost);
            bitmap.recycle();
        }).start();
    }

    private static void dropGhost(ChipTurn turn) {
        if (turn.ghost != null) turn.ghost.recycle();
        turn.ghost = null;
        turn.host = null;
    }

    private static ChipTurn turn(ViewGroup chips) {
        Object tag = chips.getTag(CHIP_TURN);
        if (tag instanceof ChipTurn) return (ChipTurn) tag;
        ChipTurn turn = new ChipTurn();
        chips.setTag(CHIP_TURN, turn);
        return turn;
    }

    private static final class ChipTurn {
        boolean posted;
        boolean removed;
        View removedView;
        View added;
        android.graphics.Bitmap ghost;
        ViewGroup host;
        int ghostLeft;
        int ghostTop;
    }

    /** Hidden chips stay gone. The join chip gets its dot before Joey's checkmark can draw. */
    private static void settleChip(View child) {
        Context context = child.getContext();
        if (context == null || !isModernUiEnabled(context)) return;
        String kind = chipKind(child);
        if (!chipShown(context, kind)) {
            if (child.getVisibility() != View.GONE) child.setVisibility(View.GONE);
            return;
        }
        if (!"join".equals(kind)) return;
        boolean joined = !"join".equals(chipLabel(child));
        Object previous = child.getTag(JOIN_STATE);
        if (previous instanceof Boolean && ((Boolean) previous) == joined
                && child.getTag(JOIN_DOT) instanceof JoinDot) {
            return;
        }
        paintJoinDot(child, joined);
    }

    private static void applyHeaderChips(View container) {
        View group = findChild(container, "top_info_chipGroup");
        if (!(group instanceof ViewGroup)) return;
        ViewGroup chips = (ViewGroup) group;
        watchChips(chips);
        Context context = container.getContext();
        orderHeaderChips(chips, context);
        boolean sort = chipSort(context);
        boolean join = chipJoin(context);
        boolean info = chipInfo(context);
        for (int i = 0; i < chips.getChildCount(); i++) {
            View child = chips.getChildAt(i);
            String value = chipLabel(child);
            boolean show;
            if (value.contains("community")) show = info;
            else if (value.equals("join") || value.equals("joined") || value.startsWith("unjoin")) show = join;
            else show = sort;
            int visibility = show ? View.VISIBLE : View.GONE;
            if (child.getVisibility() != visibility) child.setVisibility(visibility);
            if (value.equals("join") || value.equals("joined") || value.startsWith("unjoin")) {
                paintJoinDot(child, !value.equals("join"));
            }
        }
    }

    /** Hollow dot when not joined. Filled theme dot after joining. Leave plays only once the label is Join again. */
    private static void paintJoinDot(View chip, boolean joined) {
        Object previous = chip.getTag(JOIN_STATE);
        boolean same = previous instanceof Boolean && ((Boolean) previous) == joined
                && chip.getTag(JOIN_DOT) instanceof JoinDot;
        chip.setTag(JOIN_STATE, joined);
        Palette palette = getPalette(chip.getContext());
        float density = chip.getResources().getDisplayMetrics().density;
        JoinDot dot = chip.getTag(JOIN_DOT) instanceof JoinDot ? (JoinDot) chip.getTag(JOIN_DOT) : new JoinDot();
        chip.setTag(JOIN_DOT, dot);
        dot.fill.setColor(palette.accent);
        dot.ring.setColor(palette.onSurfaceVariant);
        dot.ring.setStrokeWidth(1.5f * density);
        try {
            chip.getClass().getMethod("setChipStrokeColor", ColorStateList.class)
                    .invoke(chip, ColorStateList.valueOf(joined ? palette.accent : palette.onSurface));
        } catch (Throwable ignored) {
        }
        if (same) {
            dot.invalidateSelf();
            return;
        }
        int size = Math.round(10 * density);
        dot.setBounds(0, 0, size, size);
        chipCall(chip, "setChipIcon", new Class[]{android.graphics.drawable.Drawable.class}, dot);
        chipCall(chip, "setChipIconVisible", new Class[]{boolean.class}, true);
        chipCall(chip, "setChipIconSize", new Class[]{float.class}, (float) size);
        try {
            chip.getClass().getMethod("setChipIconTint", ColorStateList.class).invoke(chip, (Object) null);
        } catch (Throwable ignored) {
        }
        dot.filled = joined;
        dot.scale = 1f;
        dot.invalidateSelf();
    }

    private static void chipCall(View chip, String name, Class<?>[] types, Object arg) {
        try {
            chip.getClass().getMethod(name, types).invoke(chip, arg);
        } catch (Throwable ignored) {
        }
    }

    private static final int JOIN_STATE = 0x4d4f0001;
    private static final int JOIN_DOT = 0x4d4f0002;
    private static final int CHIP_WATCH = 0x4d4f0003;
    private static final int CHIP_TURN = 0x4d4f0004;
    private static final int CHIP_LABEL = 0x4d4f0005;

    private static final class ChipLabel {
        final CharSequence source;
        final String value;

        ChipLabel(CharSequence source, String value) {
            this.source = source;
            this.value = value;
        }
    }

    private static final class JoinDot extends android.graphics.drawable.Drawable {
        final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        final Paint ring = new Paint(Paint.ANTI_ALIAS_FLAG);
        float scale = 1f;
        boolean filled;

        JoinDot() {
            ring.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(android.graphics.Canvas canvas) {
            android.graphics.Rect b = getBounds();
            float r = Math.min(b.width(), b.height()) / 2f * scale;
            if (r <= 0) return;
            float cx = b.centerX();
            float cy = b.centerY();
            if (filled) canvas.drawCircle(cx, cy, r, fill);
            else canvas.drawCircle(cx, cy, Math.max(1f, r - ring.getStrokeWidth()), ring);
        }

        @Override
        public void setAlpha(int alpha) {
            fill.setAlpha(alpha);
            ring.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter filter) {
            fill.setColorFilter(filter);
            ring.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    /** Sort chips stay together. Join and Community info move as their own chips. */
    private static void orderHeaderChips(ViewGroup chips, Context context) {
        List<String> order = chipOrder(context);
        ArrayList<View> children = new ArrayList<>();
        for (int i = 0; i < chips.getChildCount(); i++) children.add(chips.getChildAt(i));
        ArrayList<View> next = new ArrayList<>();
        for (String id : order) {
            for (View child : children) {
                if (id.equals(chipKind(child))) next.add(child);
            }
        }
        for (View child : children) {
            if (!next.contains(child)) next.add(child);
        }
        boolean same = next.size() == chips.getChildCount();
        for (int i = 0; same && i < next.size(); i++) {
            if (chips.getChildAt(i) != next.get(i)) same = false;
        }
        if (same) return;
        for (View child : next) chips.removeView(child);
        for (View child : next) chips.addView(child);
    }

    private static String chipKind(View child) {
        String value = chipLabel(child);
        if (value.contains("community")) return "info";
        if (value.equals("join") || value.equals("joined") || value.startsWith("unjoin")) return "join";
        return "sort";
    }

    private static Method sChipText;
    private static boolean sChipTextReady;

    private static String chipLabel(View child) {
        CharSequence text = chipText(child);
        Object cached = child.getTag(CHIP_LABEL);
        if (cached instanceof ChipLabel && ((ChipLabel) cached).source == text) {
            return ((ChipLabel) cached).value;
        }
        String value = text == null ? "" : text.toString().trim().toLowerCase();
        child.setTag(CHIP_LABEL, new ChipLabel(text, value));
        return value;
    }

    private static CharSequence chipText(View child) {
        if (child instanceof TextView) return ((TextView) child).getText();
        try {
            if (!sChipTextReady) {
                sChipTextReady = true;
                sChipText = child.getClass().getMethod("getText");
            }
            if (sChipText != null) {
                Object value = sChipText.invoke(child);
                if (value instanceof CharSequence) return (CharSequence) value;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    /**
     * The description stays on the banner. The back arrow moves up into the empty banner
     * above the bubble, and stops before the status bar.
     */
    private static void raiseBack(View collapsing, View container) {
        View card = container.findViewWithTag("morphe_slot_card");
        View banner = findChild(container, "top_info_banner");
        if (card != null && banner != null && card.getHeight() > 0) {
            float density = container.getResources().getDisplayMetrics().density;
            int margin = Math.round(12 * density);
            float shift = banner.getBottom() - card.getHeight() - margin - card.getTop();
            if (Math.abs(card.getTranslationY() - shift) > 1f) card.setTranslationY(shift);
        }
        View toolbar = findChild(collapsing, "toolbar");
        if (!(toolbar instanceof ViewGroup) || card == null || card.getHeight() == 0) return;
        View nav = null;
        ViewGroup group = (ViewGroup) toolbar;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof android.widget.ImageView && child.getVisibility() == View.VISIBLE
                    && child.getLeft() < toolbar.getWidth() / 3) {
                nav = child;
                break;
            }
        }
        if (nav == null || nav.getHeight() == 0) return;
        ((ViewGroup) toolbar).setClipChildren(false);
        ((ViewGroup) toolbar).setClipToPadding(false);
        if (toolbar.getParent() instanceof ViewGroup) {
            ((ViewGroup) toolbar.getParent()).setClipChildren(false);
            ((ViewGroup) toolbar.getParent()).setClipToPadding(false);
        }
        int[] navAt = new int[2];
        int[] cardAt = new int[2];
        int[] bannerAt = new int[2];
        nav.getLocationOnScreen(navAt);
        card.getLocationOnScreen(cardAt);
        if (banner != null) banner.getLocationOnScreen(bannerAt);
        float density = nav.getResources().getDisplayMetrics().density;
        float current = nav.getTranslationY();
        float restTop = navAt[1] - current;
        // The hit area is taller than the arrow. Measure the arrow itself, which sits in the middle.
        android.graphics.drawable.Drawable mark = ((android.widget.ImageView) nav).getDrawable();
        int drawn = mark == null ? 0 : mark.getIntrinsicHeight();
        int inner = nav.getHeight() - nav.getPaddingTop() - nav.getPaddingBottom();
        int arrow = Math.round(24f * density);
        if (drawn <= 0 || drawn > arrow + Math.round(8f * density)) drawn = arrow;
        if (drawn > inner) drawn = Math.max(1, inner);
        float iconTop = restTop + nav.getPaddingTop() + (inner - drawn) / 2f;
        float iconBottom = iconTop + drawn;
        float overlap = iconBottom - (cardAt[1] - 8f * density);
        if (overlap < 0f) overlap = 0f;
        Activity host = activityOf(nav.getContext());
        float ceiling = banner == null ? 0f : bannerAt[1] + 4f * density;
        if (host != null) {
            float belowStatus = statusBarHeight(host) + 2f * density;
            if (belowStatus > ceiling) ceiling = belowStatus;
        }
        float room = iconTop - ceiling;
        if (room < 0f) room = 0f;
        if (overlap > room) overlap = room;
        if (Math.abs(current + overlap) > 1f) nav.setTranslationY(-overlap);
    }

    /** Drops the toolbar onto the sort line so the banner can use the top of the header. */
    private static void parkToolbar(View collapsing, View container) {
        View toolbar = findChild(collapsing, "toolbar");
        View chips = findChild(container, "top_info_hsv");
        if (toolbar == null || chips == null || chips.getHeight() == 0) return;
        toolbar.setBackgroundColor(android.graphics.Color.TRANSPARENT);
        int target = chips.getTop() + (chips.getHeight() - toolbar.getHeight()) / 2;
        float shift = target - toolbar.getTop();
        if (Math.abs(toolbar.getTranslationY() - shift) > 1f) toolbar.setTranslationY(shift);
        // The toolbar is full width and covers this row. Its icons keep their own taps.
        // Everything else is handed to the chip underneath.
        if (toolbar.isClickable()) toolbar.setClickable(false);
        if (toolbar.isLongClickable()) toolbar.setLongClickable(false);
        if (toolbar.getTouchDelegate() != null) toolbar.setTouchDelegate(null);
        releaseToolbarGaps(toolbar);
        if (!TOOLBAR_PASS.containsKey(toolbar)) {
            TOOLBAR_PASS.put(toolbar, Boolean.TRUE);
            final View[] handed = new View[1];
            toolbar.setOnTouchListener((v, event) -> handToChip(chips, handed, event));
        }
    }

    private static final WeakHashMap<View, Boolean> TOOLBAR_PASS = new WeakHashMap<>();

    /** Title and spacer views sit across the chip row. They must not take the tap. */
    private static final int TOOLBAR_GAPS = 0x4d4f0006;

    private static void releaseToolbarGaps(View toolbar) {
        if (!(toolbar instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) toolbar;
        Object mark = toolbar.getTag(TOOLBAR_GAPS);
        if (mark instanceof Integer && (Integer) mark == group.getChildCount()) {
            boolean held = true;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (child instanceof ImageView && child.getVisibility() != View.INVISIBLE) {
                    held = false;
                    break;
                }
            }
            if (held) return;
        }
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child instanceof ImageView) {
                // This is the drawer button, parked on top of Hot. The tab row already has one.
                child.setVisibility(View.INVISIBLE);
                child.setEnabled(false);
                child.setClickable(false);
                continue;
            }
            String name = child.getClass().getName();
            if (name.contains("ActionMenuView")) continue;
            if (child.isClickable()) child.setClickable(false);
            if (child.isLongClickable()) child.setLongClickable(false);
            if (child.getTouchDelegate() != null) child.setTouchDelegate(null);
        }
        toolbar.setTag(TOOLBAR_GAPS, group.getChildCount());
    }

    private static boolean handToChip(View chips, View[] handed, MotionEvent event) {
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            handed[0] = chipAt(chips, event.getRawX(), event.getRawY());
            if (handed[0] != null && chips.getParent() != null) {
                chips.getParent().requestDisallowInterceptTouchEvent(true);
            }
        }
        View hit = handed[0];
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) handed[0] = null;
        if (hit == null) return false;
        int[] loc = new int[2];
        hit.getLocationOnScreen(loc);
        MotionEvent copy = MotionEvent.obtain(event);
        copy.setLocation(event.getRawX() - loc[0], event.getRawY() - loc[1]);
        boolean handled = hit.dispatchTouchEvent(copy);
        copy.recycle();
        return handled;
    }

    private static View chipAt(View view, float rawX, float rawY) {
        if (view == null || view.getVisibility() != View.VISIBLE) return null;
        int[] loc = new int[2];
        view.getLocationOnScreen(loc);
        float x = rawX - loc[0];
        float y = rawY - loc[1];
        if (x < 0 || y < 0 || x >= view.getWidth() || y >= view.getHeight()) return null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View hit = chipAt(group.getChildAt(i), rawX, rawY);
                if (hit != null) return hit;
            }
        }
        return view.isClickable() ? view : null;
    }

    private static boolean setConstraint(View view, String field, int value) {
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp == null) return false;
        try {
            Field target = lp.getClass().getField(field);
            if (target.getInt(lp) == value) return false;
            target.setInt(lp, value);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * Joey's menu button is the toolbar navigation icon. Hiding the banner collapses that
     * toolbar into the status bar, so the button is moved into the tab row, left of the names.
     */
    private static void placeTabMenu(View container, boolean show) {
        Activity activity = activityOf(container.getContext());
        View collapsing = container.getParent() instanceof View ? (View) container.getParent() : null;
        if (activity == null || collapsing == null || !(collapsing.getParent() instanceof ViewGroup)) return;
        ViewGroup appbar = (ViewGroup) collapsing.getParent();
        View tabs = visibleTabs(appbar);
        boolean needed = show && homeFeed(activity) && tabs != null && !showRail(activity);
        if (!needed) {
            if (unwrapTabMenu(appbar) && homeFeed(activity)) setJoeyMenu(activity, !showRail(activity));
            return;
        }
        View tagged = appbar.findViewWithTag(TAB_MENU_TAG);
        if (tagged instanceof ViewGroup) {
            tintTabMenu(tagged, activity);
            pinSubredditBar(tagged);
            return;
        }
        if (tagged instanceof ImageView && tagged.getParent() instanceof ViewGroup) {
            ((ViewGroup) tagged.getParent()).removeView(tagged);
        }
        tabs = visibleTabs(appbar);
        if (tabs == null || !(tabs.getParent() instanceof ViewGroup)) return;
        ViewGroup parent = (ViewGroup) tabs.getParent();
        int index = parent.indexOfChild(tabs);
        ViewGroup.LayoutParams tabParams = tabs.getLayoutParams();
        ViewGroup.LayoutParams rowParams = appBarParams(tabParams);
        ViewGroup.LayoutParams kept = appBarParams(tabParams);
        if (rowParams == tabParams || kept == tabParams) return;
        shareWidth(kept);
        // A fresh AppBar row defaults to scrolling. Joey's name strip stays put, so a
        // long scroll still leaves it on screen for a left or right swipe.
        try {
            rowParams.getClass().getMethod("setScrollFlags", int.class).invoke(rowParams, 0);
        } catch (Throwable ignored) {
        }
        parent.removeView(tabs);

        float density = activity.getResources().getDisplayMetrics().density;
        int size = Math.round(48 * density);
        LinearLayout row = new LinearLayout(activity);
        row.setTag(TAB_MENU_TAG);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        ImageView button = new ImageView(activity);
        button.setScaleType(ImageView.ScaleType.FIT_XY);
        int inset = Math.round(12 * density);
        button.setPadding(inset, inset, inset, inset);
        button.setImageDrawable(new MenuBars());
        button.setOnClickListener(v -> openDrawer(activity));
        int buttonHeight = tabParams != null && tabParams.height > 0 ? tabParams.height : size;
        row.addView(button, new LinearLayout.LayoutParams(size, buttonHeight));
        row.addView(tabs, kept);
        parent.addView(row, index, rowParams);
        tintTabMenu(row, activity);
        setJoeyMenu(activity, false);
    }

    /** Keeps Joey's AppBar layout params, and gives the names the space beside the menu button. */
    private static void shareWidth(ViewGroup.LayoutParams params) {
        try {
            params.getClass().getField("width").setInt(params, 0);
            params.getClass().getField("weight").setFloat(params, 1f);
        } catch (Throwable ignored) {
        }
    }

    private static ViewGroup.LayoutParams appBarParams(ViewGroup.LayoutParams original) {
        try {
            Class<?> type = Class.forName("com.google.android.material.appbar.AppBarLayout$LayoutParams");
            return (ViewGroup.LayoutParams) type
                    .getConstructor(ViewGroup.LayoutParams.class)
                    .newInstance(original);
        } catch (Throwable ignored) {
            return original;
        }
    }

    /** Same surface and label color as the subreddit name strip beside the button. */
    private static void tintTabMenu(View rowOrButton, Activity activity) {
        View row = rowOrButton instanceof ImageView && rowOrButton.getParent() instanceof View
                ? (View) rowOrButton.getParent() : rowOrButton;
        ImageView button = rowOrButton instanceof ImageView
                ? (ImageView) rowOrButton
                : (row instanceof ViewGroup && ((ViewGroup) row).getChildCount() > 0
                && ((ViewGroup) row).getChildAt(0) instanceof ImageView
                ? (ImageView) ((ViewGroup) row).getChildAt(0) : null);
        if (button == null) return;
        View tabs = null;
        if (row instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) row;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                if (!(child instanceof ImageView)) tabs = child;
            }
        }
        Palette palette = getPalette(activity);
        int background = palette.primary;
        int text = palette.onSurface;
        if (tabs != null) {
            android.graphics.drawable.Drawable strip = tabs.getBackground();
            if (strip instanceof android.graphics.drawable.ColorDrawable) {
                background = ((android.graphics.drawable.ColorDrawable) strip).getColor();
            }
            try {
                Object colors = tabs.getClass().getMethod("getTabTextColors").invoke(tabs);
                if (colors instanceof android.content.res.ColorStateList) {
                    android.content.res.ColorStateList list = (android.content.res.ColorStateList) colors;
                    text = list.getColorForState(
                            new int[]{android.R.attr.state_selected}, list.getDefaultColor());
                }
            } catch (Throwable ignored) {
            }
        }
        row.setBackgroundColor(background);
        button.setBackgroundColor(background);
        if (!(button.getDrawable() instanceof MenuBars)) button.setImageDrawable(new MenuBars());
        ((MenuBars) button.getDrawable()).setColor(text);
    }

    /** Three bars drawn in the tab label color. The stock hamburger drawable is hard-coded white. */
    private static final class MenuBars extends android.graphics.drawable.Drawable {
        private final android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);

        void setColor(int color) {
            if (paint.getColor() == color) return;
            paint.setColor(color);
            invalidateSelf();
        }

        @Override
        public void draw(android.graphics.Canvas canvas) {
            android.graphics.Rect bounds = getBounds();
            int bar = Math.max(1, Math.round(bounds.height() * 0.1f));
            int gap = Math.max(bar, Math.round(bounds.height() * 0.18f));
            int span = bar * 3 + gap * 2;
            float top = bounds.top + (bounds.height() - span) / 2f;
            float radius = bar / 2f;
            for (int i = 0; i < 3; i++) {
                canvas.drawRoundRect(bounds.left, top, bounds.right, top + bar, radius, radius, paint);
                top += bar + gap;
            }
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(android.graphics.ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override
        public int getOpacity() {
            return android.graphics.PixelFormat.TRANSLUCENT;
        }
    }

    /** Puts the real toolbar on its own line under the status bar, above the subreddit names. */
    private static void seatToolbar(View collapsing, boolean hidden) {
        if (collapsing == null) return;
        if (!COLLAPSE_PAD.containsKey(collapsing)) COLLAPSE_PAD.put(collapsing, collapsing.getPaddingTop());
        int base = COLLAPSE_PAD.get(collapsing);
        int pad = base;
        if (hidden) {
            Activity activity = activityOf(collapsing.getContext());
            if (activity != null) pad = base + statusBarHeight(activity);
        }
        if (collapsing.getPaddingTop() != pad) {
            collapsing.setPadding(collapsing.getPaddingLeft(), pad, collapsing.getPaddingRight(), collapsing.getPaddingBottom());
        }
        View toolbar = findChild(collapsing, "toolbar");
        if (toolbar == null) return;
        if (hidden) {
            toolbar.setBackgroundColor(getPalette(toolbar.getContext()).primary);
            HEADER_LIFTED.put(toolbar, Boolean.TRUE);
        } else if (Boolean.TRUE.equals(HEADER_LIFTED.remove(toolbar))) {
            toolbar.setBackgroundColor(android.graphics.Color.TRANSPARENT);
        }
    }

    private static boolean unwrapTabMenu(ViewGroup appbar) {
        View row = appbar.findViewWithTag(TAB_MENU_TAG);
        if (!(row instanceof ViewGroup) || !(row.getParent() instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) row;
        View tabs = null;
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (!(child instanceof ImageView)) tabs = child;
        }
        ViewGroup parent = (ViewGroup) row.getParent();
        int index = parent.indexOfChild(row);
        ViewGroup.LayoutParams params = row.getLayoutParams();
        if (tabs != null) group.removeView(tabs);
        parent.removeView(row);
        if (tabs != null) parent.addView(tabs, index, appBarParams(tabs.getLayoutParams() != null ? tabs.getLayoutParams() : params));
        return true;
    }

    private static View visibleTabs(View appbar) {
        View primary = findChild(appbar, "sub_list_tab_layout");
        View sliding = findChild(appbar, "sliding_tab_layout");
        if (primary != null && primary.getVisibility() == View.VISIBLE) return primary;
        if (sliding != null && sliding.getVisibility() == View.VISIBLE) return sliding;
        return primary != null ? primary : sliding;
    }

    private static Activity activityOf(Context context) {
        while (context instanceof android.content.ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((android.content.ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /** Joey reveals the big subreddit name once the banner has collapsed. Leave that name hidden. */
    private static void hideCollapsedTitle(View collapsing) {
        if (TITLE_GUARD.containsKey(collapsing)) return;
        paintToolbarTitle(collapsing, false);
        try {
            collapsing.getClass().getMethod("setTitleEnabled", boolean.class).invoke(collapsing, false);
        } catch (Throwable ignored) {
        }
        if (!(collapsing.getParent() instanceof View)) return;
        View appbar = (View) collapsing.getParent();
        try {
            ClassLoader loader = appbar.getClass().getClassLoader();
            Class<?> type = Class.forName(
                    "com.google.android.material.appbar.AppBarLayout$OnOffsetChangedListener", false, loader);
            Object listener = java.lang.reflect.Proxy.newProxyInstance(
                    loader,
                    new Class<?>[] { type },
                    (proxy, method, args) -> {
                        String name = method.getName();
                        if ("onOffsetChanged".equals(name)) paintToolbarTitle(collapsing, false);
                        else if ("hashCode".equals(name)) return System.identityHashCode(proxy);
                        else if ("equals".equals(name)) return proxy == (args == null ? null : args[0]);
                        else if ("toString".equals(name)) return "MorpheTitleGuard";
                        return null;
                    });
            appbar.getClass().getMethod("addOnOffsetChangedListener", type).invoke(appbar, listener);
            TITLE_GUARD.put(collapsing, Boolean.TRUE);
        } catch (Throwable ignored) {
        }
    }

    /** Hidden banner uses Joey's collapsed toolbar: small title, no big name or picture. */
    private static Method sTitleColor;
    private static Method sSubtitleColor;

    private static void paintToolbarTitle(View collapsing, boolean show) {
        View toolbar = findChild(collapsing, "toolbar");
        if (toolbar == null) return;
        int color = show ? getPalette(toolbar.getContext()).onSurface : 0;
        try {
            if (sTitleColor == null) {
                sTitleColor = toolbar.getClass().getMethod("setTitleTextColor", int.class);
                sSubtitleColor = toolbar.getClass().getMethod("setSubtitleTextColor", int.class);
            }
            sTitleColor.invoke(toolbar, color);
            sSubtitleColor.invoke(toolbar, color);
        } catch (Throwable ignored) {
        }
    }

    private static void setBarExpanded(View container, boolean expanded) {
        View collapsing = container.getParent() instanceof View ? (View) container.getParent() : null;
        if (collapsing == null || !(collapsing.getParent() instanceof View)) return;
        View appbar = (View) collapsing.getParent();
        try {
            appbar.getClass().getMethod("setExpanded", boolean.class, boolean.class).invoke(appbar, expanded, false);
        } catch (Throwable ignored) {
        }
        appbar.requestLayout();
    }

    /**
     * The toolbar menu button sits over the left of the header.
     * The icon and name move right of it. Hiding the icon puts the name back on the left.
     * The icon stays in the layout either way, because the name is constrained to it.
     */
    private static void placeSubredditIdentity(View container) {
        View icon = findChild(container, "top_info_icon");
        View name = findChild(container, "top_info_headline");
        if (icon == null || name == null) return;
        if (!(icon.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        if (!(name.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        ViewGroup.MarginLayoutParams iconLp = (ViewGroup.MarginLayoutParams) icon.getLayoutParams();
        ViewGroup.MarginLayoutParams nameLp = (ViewGroup.MarginLayoutParams) name.getLayoutParams();
        if (!ICON_MARGIN.containsKey(icon)) ICON_MARGIN.put(icon, iconLp.leftMargin);
        if (!NAME_MARGIN.containsKey(name)) NAME_MARGIN.put(name, nameLp.leftMargin);
        int iconBase = ICON_MARGIN.get(icon);
        int nameBase = NAME_MARGIN.get(name);
        boolean hide = hideSubredditIcon(container.getContext());
        float density = container.getResources().getDisplayMetrics().density;
        int toolbar = toolbarHeight(container);
        int clear = toolbar + Math.round(8 * density);
        int iconLeft = hide ? iconBase : Math.max(iconBase, clear);
        // Joey centers the circle on the banner edge, so the top half is clipped by the toolbar.
        // Bias 0 sits the whole circle below that edge. Hidden keeps the name where it was.
        setVerticalBias(icon, hide ? 0.5f : (circleIsClipped(container, icon, toolbar) ? 0f : 0.5f));
        int iconVisibility = hide ? View.INVISIBLE : View.VISIBLE;
        float iconAlpha = hide ? 0f : 1f;
        if (icon.getVisibility() != iconVisibility) icon.setVisibility(iconVisibility);
        if (icon.getAlpha() != iconAlpha) icon.setAlpha(iconAlpha);
        if (iconLp.leftMargin != iconLeft || iconLp.getMarginStart() != iconLeft) {
            iconLp.leftMargin = iconLeft;
            iconLp.setMarginStart(iconLeft);
            icon.setLayoutParams(iconLp);
        }
        if (nameLp.leftMargin != nameBase || nameLp.getMarginStart() != nameBase) {
            nameLp.leftMargin = nameBase;
            nameLp.setMarginStart(nameBase);
            name.setLayoutParams(nameLp);
        }
    }

    private static boolean circleIsClipped(View container, View icon, int toolbar) {
        View banner = findChild(container, "top_info_banner");
        if (banner == null || banner.getVisibility() == View.GONE || banner.getLayoutParams() == null) return true;
        int bannerHeight = banner.getLayoutParams().height;
        int iconHeight = icon.getLayoutParams().height > 0 ? icon.getLayoutParams().height : icon.getHeight();
        if (iconHeight <= 0) iconHeight = Math.round(64 * container.getResources().getDisplayMetrics().density);
        return bannerHeight - iconHeight / 2 < toolbar;
    }

    private static void setVerticalBias(View view, float bias) {
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp == null) return;
        try {
            Field field = lp.getClass().getField("verticalBias");
            if (field.getFloat(lp) == bias) return;
            field.setFloat(lp, bias);
            view.setLayoutParams(lp);
        } catch (Throwable ignored) {
        }
    }

    private static View findChild(View container, String name) {
        int id = getResId(container.getContext(), name, "id");
        if (id == 0) return null;
        return container.findViewById(id);
    }

    private static void restoreBannerArt(View banner) {
        banner.setWillNotDraw(false);
        if (banner instanceof ImageView && ((ImageView) banner).getImageAlpha() == 0) {
            ((ImageView) banner).setImageAlpha(255);
        }
    }

    private static void setSlot(View container, String name, boolean hide) {
        int id = getResId(container.getContext(), name, "id");
        if (id == 0) return;
        View slot = container.findViewById(id);
        if (slot == null) return;
        int visibility = hide ? View.GONE : View.VISIBLE;
        if (slot instanceof TextView) {
            TextView text = (TextView) slot;
            if (hide) {
                if (!TEXT_MIN_LINES.containsKey(text)) TEXT_MIN_LINES.put(text, text.getMinLines());
                if (text.getMinLines() != 0) text.setMinLines(0);
                if (text.getMinimumHeight() != 0) text.setMinimumHeight(0);
            } else {
                Integer min = TEXT_MIN_LINES.get(text);
                if (min != null) text.setMinLines(min);
            }
        }
        ViewGroup.LayoutParams lp = slot.getLayoutParams();
        int wantHeight = hide ? 0 : ViewGroup.LayoutParams.WRAP_CONTENT;
        if (slot.getVisibility() != visibility || (lp != null && lp.height != wantHeight)) {
            slot.setVisibility(visibility);
            if (lp != null) {
                lp.height = wantHeight;
                slot.setLayoutParams(lp);
            }
        }
    }

    private static void clipChildren(View view) {
        if (view instanceof ViewGroup && !((ViewGroup) view).getClipChildren()) {
            ((ViewGroup) view).setClipChildren(true);
        }
    }

    /** The subreddit names stay on screen. The banner above them still scrolls away. */
    private static void pinSubredditBar(View bar) {
        setScrollFlags(bar, 0);
    }

    private static void setScrollFlags(View collapsing, int flags) {
        ViewGroup.LayoutParams lp = collapsing.getLayoutParams();
        if (lp == null) return;
        try {
            Method get = lp.getClass().getMethod("getScrollFlags");
            if (((Integer) get.invoke(lp)) == flags) return;
            lp.getClass().getMethod("setScrollFlags", int.class).invoke(lp, flags);
            collapsing.setLayoutParams(lp);
        } catch (Throwable ignored) {
        }
    }

    private static void setParallax(View container, float multiplier) {
        ViewGroup.LayoutParams lp = container.getLayoutParams();
        if (lp == null) return;
        try {
            lp.getClass().getMethod("setParallaxMultiplier", float.class).invoke(lp, multiplier);
        } catch (Throwable ignored) {
        }
    }

    private static int toolbarHeight(View view) {
        int id = view.getResources().getIdentifier("toolbar_height", "dimen", view.getContext().getPackageName());
        if (id != 0) return view.getResources().getDimensionPixelSize(id);
        return Math.round(56 * view.getResources().getDisplayMetrics().density);
    }

    private static boolean wideScreen(Activity activity) {
        return activity.getResources().getConfiguration().screenWidthDp >= 500;
    }

    private static boolean showRail(Activity activity) {
        // Held for a later release. The rail stays out of this build, including settings.
        return false;
    }

    /** The main feed. A subreddit opened from Go to, or from a post, keeps Joey's back arrow. */
    private static boolean homeFeed(Activity activity) {
        return activity != null && activity.getClass().getName().endsWith("HomeActivity");
    }

    private static boolean railHost(Activity activity) {
        return activity.findViewById(getResId(activity, "drawer_layout", "id")) != null
                && activity.findViewById(getResId(activity, "appbar", "id")) != null;
    }

    private static void ensureRail(Activity activity) {
        View appbar = activity.findViewById(getResId(activity, "appbar", "id"));
        if (appbar == null || !(appbar.getParent() instanceof ViewGroup)) return;
        ViewGroup coordinator = (ViewGroup) appbar.getParent();
        float densityProbe = activity.getResources().getDisplayMetrics().density;
        int widthProbe = Math.round((wideScreen(activity) ? 72 : 48) * densityProbe);
        String signature = railSignature(activity) + "/" + widthProbe;
        View existing = coordinator.findViewWithTag(RAIL_TAG);
        if (existing != null && signature.equals(RAIL_SIG.get(existing))) return;
        if (existing != null) removeRail(activity);

        float density = activity.getResources().getDisplayMetrics().density;
        boolean wide = wideScreen(activity);
        int railWidth = Math.round((wide ? 72 : 48) * density);
        int rowHeight = Math.round((wide ? 56 : 44) * density);
        Palette palette = getPalette(activity);

        LinearLayout rail = new LinearLayout(activity);
        rail.setTag(RAIL_TAG);
        RAIL_SIG.put(rail, signature);
        rail.setOrientation(LinearLayout.VERTICAL);
        rail.setGravity(Gravity.CENTER_HORIZONTAL);
        rail.setBackgroundColor(palette.primary);
        rail.setClipToPadding(false);
        // The collapsing header draws over the rail once the banner scrolls away.
        rail.setOutlineProvider(null);
        rail.setElevation(Math.round(24 * density));
        // Banner offset applies to this group only, so it cannot push settings off the bottom.
        LinearLayout icons = new LinearLayout(activity);
        icons.setTag("morphe_rail_icons");
        icons.setOrientation(LinearLayout.VERTICAL);
        icons.setGravity(Gravity.CENTER_HORIZONTAL);
        icons.addView(railButton(activity, "hamburger", palette.onSurface, rowHeight, () -> openDrawer(activity)));
        icons.addView(railButton(activity, "home", palette.onSurfaceVariant, rowHeight, () -> scrollFeed(activity)));
        for (String key : Sidebar.optionalRailKeys(activity)) {
            String icon = railIcon(key);
            if (icon == null) continue;
            icons.addView(railButton(activity, icon, palette.onSurfaceVariant, rowHeight, () -> runRailKey(activity, key)));
        }
        icons.addView(railButton(activity, "account_circle_outline", palette.onSurfaceVariant, rowHeight, () -> openProfile(activity)));
        rail.addView(icons, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        rail.addView(railButton(activity, "settings_outline", palette.onSurfaceVariant, rowHeight,
                () -> startJoey(activity, "o.o.joey.SettingActivities.SettingsActivity")));

        int appbarId = getResId(activity, "appbar", "id");
        for (int i = 0; i < coordinator.getChildCount(); i++) {
            View child = coordinator.getChildAt(i);
            if (child.getId() == appbarId) continue;
            if (!(child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) continue;
            if (RAIL_INSET.containsKey(child)) continue;
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
            RAIL_INSET.put(child, mlp.leftMargin);
            mlp.leftMargin = mlp.leftMargin + railWidth;
            child.setLayoutParams(mlp);
        }

        rail.setLayoutParams(new ViewGroup.MarginLayoutParams(
                railWidth, ViewGroup.LayoutParams.MATCH_PARENT));
        coordinator.addView(rail);
        frontRail(coordinator, rail);
        seatRail(activity);
    }

    /**
     * The rail view always covers its column, so the header colour cannot show through it.
     * Drawing is clipped to the banner's bottom, which leaves the picture full width.
     */
    private static void seatRail(Activity activity) {
        View appbar = activity.findViewById(getResId(activity, "appbar", "id"));
        if (appbar == null || !(appbar.getParent() instanceof ViewGroup)) return;
        ViewGroup coordinator = (ViewGroup) appbar.getParent();
        View rail = coordinator.findViewWithTag(RAIL_TAG);
        if (rail == null || !(rail.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        frontRail(coordinator, rail);
        View banner = appbar.findViewById(getResId(activity, "top_info_banner", "id"));
        int top = 0;
        if (banner != null && banner.getVisibility() == View.VISIBLE && banner.getHeight() > 0) {
            int y = 0;
            View node = banner;
            while (node != null && node != coordinator) {
                y += node.getTop();
                node = node.getParent() instanceof View ? (View) node.getParent() : null;
            }
            top = Math.max(0, y + banner.getHeight());
            top = Math.max(0, top - Math.round(12 * activity.getResources().getDisplayMetrics().density));
        }
        ViewGroup.MarginLayoutParams lp = (ViewGroup.MarginLayoutParams) rail.getLayoutParams();
        if (lp.topMargin != 0) {
            lp.topMargin = 0;
            rail.setLayoutParams(lp);
        }
        int status = statusBarHeight(activity);
        int pad = Math.max(top, status);
        View icons = rail.findViewWithTag("morphe_rail_icons");
        if (icons != null) {
            if (icons.getPaddingTop() != pad) icons.setPadding(0, pad, 0, 0);
        } else if (rail.getPaddingTop() != pad) {
            rail.setPadding(0, pad, 0, rail.getPaddingBottom());
        }
        int bottom = bottomOverlap(coordinator, rail);
        if (rail.getPaddingBottom() != bottom) rail.setPadding(0, rail.getPaddingTop(), 0, bottom);
        int width = rail.getWidth() > 0 ? rail.getWidth() : lp.width;
        int height = rail.getHeight() > 0 ? rail.getHeight() : coordinator.getHeight();
        if (width > 0 && height > 0) {
            android.graphics.Rect clip = rail.getClipBounds();
            if (clip == null || clip.top != top || clip.bottom != height || clip.right != width) {
                rail.setClipBounds(new android.graphics.Rect(0, top, width, height));
            }
        }
        int railWidth = rail.getLayoutParams().width;
        // Padding on the scroller clips the first chip. A margin moves the whole row clear of the rail.
        marginForRail(appbar.findViewById(getResId(activity, "top_info_hsv", "id")), railWidth);
        padForRail(visibleTabs(appbar), railWidth);
    }

    /** Already-front children are left alone. Bringing one forward always requests a new layout. */
    private static void frontRail(ViewGroup coordinator, View rail) {
        if (coordinator.getChildAt(coordinator.getChildCount() - 1) == rail) return;
        coordinator.bringChildToFront(rail);
    }

    /** The bottom bar draws over the foot of the rail once the feed scrolls. */
    private static int bottomOverlap(ViewGroup coordinator, View rail) {
        int id = getResId(rail.getContext(), "behavior_aware_linearLayout", "id");
        View bar = id == 0 ? null : coordinator.findViewById(id);
        if (bar == null || bar.getVisibility() != View.VISIBLE || bar.getHeight() <= 0) return 0;
        int covered = rail.getHeight() - bar.getTop();
        return Math.max(0, covered);
    }

    private static void marginForRail(View view, int extra) {
        if (view == null || extra <= 0) return;
        if (!(view.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        if (view.getPaddingLeft() != 0) {
            view.setPadding(0, view.getPaddingTop(), view.getPaddingRight(), view.getPaddingBottom());
        }
        ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        if (!RAIL_PAD.containsKey(view)) RAIL_PAD.put(view, mlp.leftMargin);
        int next = RAIL_PAD.get(view) + extra;
        if (mlp.leftMargin == next && mlp.getMarginStart() == next) return;
        mlp.leftMargin = next;
        mlp.setMarginStart(next);
        view.setLayoutParams(mlp);
    }

    private static void padForRail(View view, int extra) {
        if (view == null || extra <= 0) return;
        if (!RAIL_PAD.containsKey(view)) RAIL_PAD.put(view, view.getPaddingLeft());
        int next = RAIL_PAD.get(view) + extra;
        if (view.getPaddingLeft() != next) {
            view.setPadding(next, view.getPaddingTop(), view.getPaddingRight(), view.getPaddingBottom());
        }
    }

    private static void removeRail(Activity activity) {
        View appbar = activity.findViewById(getResId(activity, "appbar", "id"));
        if (appbar == null || !(appbar.getParent() instanceof ViewGroup)) return;
        ViewGroup coordinator = (ViewGroup) appbar.getParent();
        View rail = coordinator.findViewWithTag(RAIL_TAG);
        if (rail != null) {
            RAIL_SIG.remove(rail);
            coordinator.removeView(rail);
        }
        for (View padded : new ArrayList<>(RAIL_PAD.keySet())) {
            Integer base = RAIL_PAD.remove(padded);
            if (base == null) continue;
            if (padded.getPaddingLeft() != base) {
                padded.setPadding(base, padded.getPaddingTop(), padded.getPaddingRight(), padded.getPaddingBottom());
            }
            if (padded.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
                ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) padded.getLayoutParams();
                if (mlp.leftMargin != base) {
                    mlp.leftMargin = base;
                    mlp.setMarginStart(base);
                    padded.setLayoutParams(mlp);
                }
            }
        }
        for (int i = 0; i < coordinator.getChildCount(); i++) {
            View child = coordinator.getChildAt(i);
            Integer original = RAIL_INSET.remove(child);
            if (original == null) continue;
            if (!(child.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) continue;
            ViewGroup.MarginLayoutParams mlp = (ViewGroup.MarginLayoutParams) child.getLayoutParams();
            mlp.leftMargin = original;
            child.setLayoutParams(mlp);
        }
    }

    private static View railButton(Activity activity, String drawable, int color, int rowHeight, Runnable action) {
        float density = activity.getResources().getDisplayMetrics().density;
        FrameLayout hit = new FrameLayout(activity);
        hit.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, rowHeight));
        hit.setOnClickListener(v -> action.run());
        ImageView icon = new ImageView(activity);
        int iconSize = Math.round(20 * density);
        int res = activity.getResources().getIdentifier(drawable, "drawable", activity.getPackageName());
        if (res != 0) icon.setImageResource(res);
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        icon.setImageTintList(ColorStateList.valueOf(color));
        FrameLayout.LayoutParams iconLp = new FrameLayout.LayoutParams(iconSize, iconSize, Gravity.CENTER);
        hit.addView(icon, iconLp);
        return hit;
    }

    private static String railSignature(Activity activity) {
        return Sidebar.optionalRailKeys(activity).toString();
    }

    private static String railIcon(String key) {
        if ("mail".equals(key)) return "email_outline";
        if ("chat".equals(key)) return "chat_outline";
        if ("go_to".equals(key)) return "go";
        if ("share_joey".equals(key)) return "group_outline";
        if ("report_bug".equals(key)) return "bug";
        if ("remove_ad".equals(key)) return "adchoices";
        return null;
    }

    private static void runRailKey(Activity activity, String key) {
        if ("mail".equals(key)) {
            startJoey(activity, "o.o.joey.Activities.Messages");
            return;
        }
        if ("share_joey".equals(key)) {
            try {
                Intent share = new Intent(Intent.ACTION_SEND);
                share.setType("text/plain");
                share.putExtra(Intent.EXTRA_TEXT, "https://play.google.com/store/apps/details?id=" + activity.getPackageName());
                activity.startActivity(Intent.createChooser(share, "Share Joey"));
            } catch (Throwable t) {
                Log.w(TAG, "Could not share Joey", t);
            }
            return;
        }
        openDrawer(activity);
    }

    private static void setJoeyMenu(Activity activity, boolean show) {
        try {
            View toolbar = activity.findViewById(getResId(activity, "toolbar", "id"));
            if (toolbar == null) return;
            if (!show) {
                toolbar.getClass().getMethod("setNavigationIcon", android.graphics.drawable.Drawable.class)
                        .invoke(toolbar, new Object[] {null});
                toolbar.getClass().getMethod("setNavigationOnClickListener", android.view.View.OnClickListener.class)
                        .invoke(toolbar, new Object[] {null});
                return;
            }
            int hamburger = activity.getResources().getIdentifier("hamburger", "drawable", activity.getPackageName());
            if (hamburger == 0) return;
            toolbar.getClass().getMethod("setNavigationIcon", int.class).invoke(toolbar, hamburger);
            android.view.View.OnClickListener open = v -> openDrawer(activity);
            toolbar.getClass().getMethod("setNavigationOnClickListener", android.view.View.OnClickListener.class)
                    .invoke(toolbar, open);
        } catch (Throwable t) {
            Log.w(TAG, "Could not update the Joey menu button", t);
        }
    }

    private static int sStatusBarId = -1;

    private static int statusBarHeight(Activity activity) {
        if (sStatusBarId < 0) {
            sStatusBarId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android");
        }
        if (sStatusBarId == 0) return 0;
        return activity.getResources().getDimensionPixelSize(sStatusBarId);
    }

    private static void openDrawer(Activity activity) {
        try {
            View drawer = activity.findViewById(getResId(activity, "drawer_layout", "id"));
            if (drawer == null) return;
            drawer.getClass().getMethod("K", int.class, boolean.class).invoke(drawer, 3, true);
        } catch (Throwable t) {
            Log.w(TAG, "Could not open the drawer", t);
        }
    }

    private static void scrollFeed(Activity activity) {
        try {
            View list = activity.findViewById(getResId(activity, "recyclerView", "id"));
            if (list == null) return;
            list.getClass().getMethod("smoothScrollToPosition", int.class).invoke(list, 0);
        } catch (Throwable ignored) {
        }
    }

    private static void openProfile(Activity activity) {
        try {
            Object session = Class.forName("e9.c").getMethod("q").invoke(null);
            String name = session == null ? null : (String) session.getClass().getMethod("o").invoke(session);
            if (name == null || name.length() == 0) return;
            Intent intent = new Intent(activity, Class.forName("o.o.joey.Activities.UserProfileActivity"));
            intent.putExtra("username", name);
            activity.startActivity(intent);
        } catch (Throwable t) {
            Log.w(TAG, "Could not open the profile", t);
        }
    }

    private static void startJoey(Activity activity, String className) {
        try {
            activity.startActivity(new Intent(activity, Class.forName(className)));
        } catch (Throwable t) {
            Log.w(TAG, "Could not open " + className, t);
        }
    }

    private static List<Activity> runningActivities() {
        List<Activity> found = new ArrayList<>();
        try {
            Class<?> threadClass = Class.forName("android.app.ActivityThread");
            Object thread = threadClass.getMethod("currentActivityThread").invoke(null);
            Field field = threadClass.getDeclaredField("mActivities");
            field.setAccessible(true);
            Object raw = field.get(thread);
            if (!(raw instanceof Map)) return found;
            for (Object record : ((Map<?, ?>) raw).values()) {
                Field activityField = record.getClass().getDeclaredField("activity");
                activityField.setAccessible(true);
                Object activity = activityField.get(record);
                if (activity instanceof Activity) found.add((Activity) activity);
            }
        } catch (Throwable t) {
            Log.w(TAG, "Could not list open screens", t);
        }
        return found;
    }

    // =========================================================================
    // In-App Revert & Restart
    // =========================================================================

    public static void restartApp(Activity activity) {
        try {
            Intent intent = activity.getPackageManager().getLaunchIntentForPackage(activity.getPackageName());
            if (intent != null) {
                intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                activity.finishAffinity();
                activity.startActivity(intent);
                System.exit(0);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Failed to restart", t);
            activity.recreate();
        }
    }

    private static boolean isLeftDrawerSurface(View view) {
        int recycler = getResId(view.getContext(), "home_left_drawer_recycler_view", "id");
        if (recycler == 0) return false;
        if (view.getId() == recycler) return true;
        if (!(view instanceof ViewGroup)) return false;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            if (group.getChildAt(i).getId() == recycler) return true;
        }
        return false;
    }

    private static final Map<String, Integer> RES_IDS = new HashMap<>();

    private static int getResId(Context context, String name, String type) {
        String key = type + ":" + name;
        Integer cached = RES_IDS.get(key);
        if (cached != null) return cached;
        int id = context.getResources().getIdentifier(name, type, context.getPackageName());
        RES_IDS.put(key, id);
        return id;
    }
}
