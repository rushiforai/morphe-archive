package app.saketh.extension.theme;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.ImageView;
import app.saketh.extension.controls.PatchSettings;

public final class ThemeHooks {
    private static volatile boolean dark;
    private static final SparseArray<int[]> TOKENS = new SparseArray<>();
    private static final int[] UNCHANGED = new int[0];
    private static int activeNavigationColor, inactiveNavigationColor;
    private static final int READER = 1, OPAQUE = 2, AMOLED = 4;
    private static int neutralSelection, blueSelection, blueNightSelection;

    private ThemeHooks() {}

    public static boolean recordDark(boolean value) { dark = value; return value; }
    public static void setDark(boolean value) { dark = value; }
    public static boolean isDark() { return dark; }
    public static int recordReaderMode(int value) { dark = value == 1; return value; }

    public static int color(Context context, int id, int original) {
        int[] token = paletteToken(context, id);
        if (amoled(token)) return original & 0xff000000;
        int target = paletteId(token, id, false);
        if (target == id) return original;
        int alpha = (token[3] & OPAQUE) != 0 ? 0xff000000 : original & 0xff000000;
        return alpha | (context.getColor(target) & 0x00ffffff);
    }

    public static int resourceId(int original) {
        Context context = PatchSettings.context;
        if (context == null) return original;
        int[] token = paletteToken(context, original);
        return amoled(token) ? android.R.color.black : paletteId(token, original, true);
    }

    private static boolean materialYou() { return Build.VERSION.SDK_INT >= 31 && PatchSettings.materialYou(); }

    private static boolean amoledActive() { return dark && PatchSettings.amoled(); }

    private static boolean amoled(int[] token) { return token.length != 0 && (token[3] & AMOLED) != 0 && amoledActive(); }

    private static int[] paletteToken(Context context, int id) {
        if (!materialYou() && !amoledActive()) return UNCHANGED;
        int[] token;
        synchronized (TOKENS) {
            token = TOKENS.get(id);
            if (token == null) {
                token = resolve(context.getResources(), id);
                TOKENS.put(id, token);
            }
        }
        return token;
    }

    private static int paletteId(int[] token, int id, boolean opaqueOnly) {
        if (token.length == 0 || !materialYou()
                || ((token[3] & READER) != 0 && !PatchSettings.readerMaterialYou())
                || (opaqueOnly && token[2] != 255 && (token[3] & OPAQUE) == 0)) return id;
        int target = token[dark ? 1 : 0];
        return target == 0 ? id : target;
    }

    public static ColorStateList stateList(Context context, int id, ColorStateList original) {
        // Selector states retain their stock pressed/disabled behavior.
        if (original == null || original.isStateful()) return original;
        int before = original.getDefaultColor();
        int after = color(context, id, before);
        return before == after ? original : ColorStateList.valueOf(after);
    }

    public static Drawable drawable(Context context, int id, Drawable original) {
        if (!(original instanceof ColorDrawable)) return original;
        int before = ((ColorDrawable) original).getColor();
        int after = color(context, id, before);
        if (before != after) ((ColorDrawable) original.mutate()).setColor(after);
        return original;
    }

    private static int readerTone(int original, int day, int night) {
        Context context = PatchSettings.context;
        return !PatchSettings.readerMaterialYou() || context == null ? original : context.getColor(dark ? night : day);
    }

    public static int readerBackground(int original) {
        if (amoledActive()) return 0xff000000;
        return Build.VERSION.SDK_INT >= 34
                ? readerTone(original, android.R.color.system_surface_light, android.R.color.system_surface_dark)
                : readerTone(original, android.R.color.system_neutral1_10, android.R.color.system_neutral1_900);
    }

    public static int readerText(int original) {
        return Build.VERSION.SDK_INT >= 34
                ? readerTone(original, android.R.color.system_on_surface_light, android.R.color.system_on_surface_dark)
                : readerTone(original, android.R.color.system_neutral1_900, android.R.color.system_neutral1_100);
    }

    public static int readerMuted(int original) {
        return Build.VERSION.SDK_INT >= 34
                ? readerTone(original, android.R.color.system_on_surface_variant_light, android.R.color.system_on_surface_variant_dark)
                : readerTone(original, android.R.color.system_neutral2_700, android.R.color.system_neutral2_200);
    }

    public static boolean readerPageBackground(FrameLayout view) {
        if (!ownsReaderBackground() || view == null) return false;
        view.removeAllViews();
        view.setBackgroundColor(readerBackground(0));
        return true;
    }

    public static boolean readerChromeBackground(ViewGroup view, ImageView image) {
        if (!ownsReaderBackground() || view == null || image == null) return false;
        image.setImageDrawable(null);
        image.setVisibility(View.GONE);
        view.setBackgroundColor(readerBackground(0));
        return true;
    }

    // The night page and chrome paint their stock color or artwork directly, bypassing the renderer palette.
    private static boolean ownsReaderBackground() { return PatchSettings.readerMaterialYou() || amoledActive(); }

    public static void readerLabel(TextView view) {
        if (PatchSettings.readerMaterialYou()) view.setTextColor(readerMuted(view.getCurrentTextColor()));
    }

    public static void readerIcon(ImageView view) {
        if (PatchSettings.readerMaterialYou()) view.setImageTintList(ColorStateList.valueOf(readerMuted(0)));
    }

    public static int readerSelectionId(int original) {
        if (!PatchSettings.readerMaterialYou()) return original;
        Context context = PatchSettings.context;
        if (neutralSelection == 0) {
            Resources resources = context.getResources();
            String app = context.getPackageName();
            neutralSelection = resources.getIdentifier("neutral_content", "color", app);
            blueSelection = resources.getIdentifier("color_3b66f5", "color", app);
            blueNightSelection = resources.getIdentifier("color_2744A3", "color", app);
        }
        if (original != neutralSelection && original != blueSelection && original != blueNightSelection) return original;
        if (Build.VERSION.SDK_INT >= 34) return dark ? android.R.color.system_primary_dark : android.R.color.system_primary_light;
        return dark ? android.R.color.system_accent1_200 : android.R.color.system_accent1_600;
    }

    public static void navigationIcon(ImageView view, boolean active) {
        if (Build.VERSION.SDK_INT < 31 || !PatchSettings.materialYou()) return;
        Drawable icon = view.getDrawable();
        if (icon == null) return;
        Context context = view.getContext();
        if (activeNavigationColor == 0) {
            activeNavigationColor = context.getResources().getIdentifier("primary_content", "color", context.getPackageName());
            inactiveNavigationColor = context.getResources().getIdentifier("neutral_content", "color", context.getPackageName());
        }
        int id = active ? activeNavigationColor : inactiveNavigationColor;
        // Stock vectors encode path alpha; mutate only this instance, never downloaded theme artwork.
        icon.mutate().setTint(color(context, id, context.getColor(id)) | 0xff000000);
    }

    private static int[] resolve(Resources resources, int id) {
        String name;
        try {
            if (!"com.qidian.Int.reader".equals(resources.getResourcePackageName(id))
                    || !"color".equals(resources.getResourceTypeName(id))) return UNCHANGED;
            name = resources.getResourceEntryName(id);
        } catch (Resources.NotFoundException missing) {
            return UNCHANGED;
        }
        boolean night = name.endsWith("_night");
        if (night) name = name.substring(0, name.length() - 6);
        String palette, role = null;
        int light, darkTone, flags = 0;
        switch (name) {
            case "reader_color_background":
                palette = "neutral1"; light = 10; darkTone = 900; flags = READER | OPAQUE | AMOLED; role = "surface"; break;
            case "reader_color_surface":
                palette = "neutral1"; light = 50; darkTone = 800; flags = READER | OPAQUE; role = "surface"; break;
            case "reader_color_text":
                palette = "neutral1"; light = 900; darkTone = 100; flags = READER | OPAQUE; role = "on_surface"; break;
            case "reader_color_text_weak":
            case "reader_color_battery_healthy":
                palette = "neutral2"; light = 700; darkTone = 200; flags = READER | OPAQUE; role = "on_surface_variant"; break;
            case "reader_color_bubble_surface_strong":
                palette = "accent1"; light = 600; darkTone = 200; flags = READER | OPAQUE; role = "primary"; break;
            case "reader_color_bubble_text_strong":
                palette = "accent1"; light = 0; darkTone = 800; flags = READER | OPAQUE; role = "on_primary"; break;
            case "reader_color_bubble_text":
                palette = "neutral1"; light = 900; darkTone = 100; flags = READER | OPAQUE; role = "on_surface"; break;
            case "reader_color_border":
            case "reader_color_overlay":
            case "reader_color_bubble_surface":
                palette = "neutral2"; light = 500; darkTone = 500; flags = READER; break;
            // The medium role is shared with rewards. Reader-only call sites recolor it locally.
            case "bottomBar_color_badge_surface":
            case "primary_brand": palette = "accent1"; light = 200; darkTone = 200; break;
            case "primary_content":
            case "bottomBar_color_text_active":
            case "primary_content_weak": palette = "accent1"; light = 700; darkTone = 200; break;
            case "primary_surface": palette = "accent1"; light = 50; darkTone = 800; break;
            case "primary_surface_emphasis": palette = "accent1"; light = 600; darkTone = 200; break;
            case "primary_content_on_emphasis":
            case "primary_content_on_emphasis_weak": palette = "accent1"; light = 0; darkTone = 900; break;
            case "bottomBar_color_badge_text":
            case "primary_content_on_brand": palette = "accent1"; light = 900; darkTone = 900; break;
            case "primary_content_on_brand_weak": palette = "accent1"; light = 700; darkTone = 700; break;
            case "primary_border":
            case "primary_border_emphasis": palette = "accent1"; light = 500; darkTone = 500; break;
            case "secondary_content":
            case "secondary_content_weak": palette = "accent2"; light = 700; darkTone = 200; break;
            case "secondary_surface": palette = "accent2"; light = 50; darkTone = 800; break;
            case "secondary_surface_emphasis": palette = "accent2"; light = 600; darkTone = 200; break;
            case "secondary_content_on_emphasis":
            case "secondary_content_on_emphasis_weak": palette = "accent2"; light = 0; darkTone = 900; break;
            case "secondary_border":
            case "secondary_border_emphasis": palette = "accent2"; light = 500; darkTone = 500; break;
            case "neutral_surface": palette = "neutral1"; light = 10; darkTone = 900; flags = AMOLED; break;
            case "bottomBar_color_text":
                palette = "neutral1"; light = 900; darkTone = 50; break;
            case "bottomBar_color_surface":
                palette = "neutral1"; light = 50; darkTone = 800; flags = AMOLED; break;
            case "bottomBar_color_border":
                palette = "neutral2"; light = 100; darkTone = 700; break;
            // WebNovel deliberately keeps this chrome dark in both native appearance modes.
            case "neutral_bg": palette = "neutral1"; light = 900; darkTone = 900; break;
            case "neutral_content_on_bg":
            case "neutral_content_on_bg_medium":
            case "neutral_content_on_bg_weak": palette = "neutral1"; light = 50; darkTone = 50; break;
            case "neutral_surface_medium": palette = "neutral1"; light = 50; darkTone = 800; break;
            case "neutral_surface_strong": palette = "neutral1"; light = 100; darkTone = 700; break;
            case "neutral_surface_inverse": palette = "neutral1"; light = 900; darkTone = 10; break;
            case "neutral_surface_inverse_medium": palette = "neutral1"; light = 800; darkTone = 50; break;
            case "neutral_surface_inverse_strong": palette = "neutral1"; light = 700; darkTone = 100; break;
            case "neutral_content":
            case "neutral_content_medium":
            case "neutral_content_weak": palette = "neutral1"; light = 900; darkTone = 50; break;
            case "neutral_content_on_inverse":
            case "neutral_content_on_inverse_medium":
            case "neutral_content_on_inverse_weak": palette = "neutral1"; light = 50; darkTone = 900; break;
            case "neutral_opaque_border": palette = "neutral2"; light = 100; darkTone = 700; break;
            case "neutral_opaque_border_inverse": palette = "neutral2"; light = 700; darkTone = 100; break;
            case "neutral_overlay":
            case "neutral_border":
            case "neutral_border_inverse": palette = "neutral2"; light = 500; darkTone = 500; break;
            default: return UNCHANGED;
        }
        boolean semantic = role != null && Build.VERSION.SDK_INT >= 34;
        int lightId = resources.getIdentifier(semantic ? "system_" + role + "_light" : "system_" + palette + "_" + light, "color", "android");
        int darkId = resources.getIdentifier(semantic ? "system_" + role + "_dark" : "system_" + palette + "_" + darkTone, "color", "android");
        int alpha = resources.getColor(id, null) >>> 24;
        return night ? new int[]{darkId, darkId, alpha, flags} : new int[]{lightId, darkId, alpha, flags};
    }
}
