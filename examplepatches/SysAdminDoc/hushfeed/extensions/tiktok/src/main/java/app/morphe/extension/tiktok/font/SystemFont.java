/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.font;

import android.graphics.Typeface;
import android.os.Build;

import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.Settings;

import java.util.Locale;

/**
 * Swaps TikTok's own text font for the device's system font (issue #7), or for a font file the
 * reader imported.
 *
 * <p>TikTok draws its interface text in a bundled family, TikTok Sans, built by one font engine
 * (two implementations of one interface, renamed on every build; SystemFontAnchorsTest holds
 * the patch's match to each declared build). Every text
 * typeface the app asks for is produced by that engine's two methods, the variable-font builder
 * and the static asset loader, and this stands at their exit. The engine handles only the
 * TikTok text and display fonts, so the icon glyph fonts, the gift combo font and the
 * mention/hashtag font, which load through other paths, are left alone. TikTok's static
 * typeface factory (the nine-parameter one that picks TikTok Display or TikTok Text by size)
 * and its Compose font loader both build through that engine, so they reach this too.
 *
 * <p>The replacement is returned at the same weight and slant the engine built, so bold stays
 * bold. The weight is read back from the typeface the engine produced rather than trusted from a
 * parameter, so a build that reshuffles the engine cannot feed a stale register in. An imported
 * font with one weight is made bolder by Android where TikTok asks for a heavier one.
 *
 * <p>PineDrama carries none of TikTok's font files, so its engine finds nothing in its assets and
 * answers null, and the app then draws in the device font (#243). The engine's entry hands this
 * the weight and slant it was asked for (from the builder's parameters, or the asset's file name),
 * so an imported font still has a weight to be built at when the answer comes back empty.
 */
public final class SystemFont {
    private static final String HOOK_FAMILY = "system font";
    private static final int REGULAR = 400;

    /** The weight and slant (1 for italic) the engine was last asked for on this thread. */
    private static final ThreadLocal<int[]> ASKED = new ThreadLocal<>();

    private SystemFont() {}

    /** At the variable-font builder's entry: the weight and slant TikTok asked for. */
    public static void askedWeight(int weight, boolean italic) {
        ASKED.set(new int[]{weight, italic ? 1 : 0});
    }

    /** At the asset loader's entry: the file name carries the weight, as in TikTok-Text-Bold.otf. */
    public static void askedFile(String path) {
        askedWeight(weightOf(path), path != null && path.toLowerCase(Locale.ROOT).contains("italic"));
    }

    /** The weight an asset's file name stands for, regular when it names none. */
    static int weightOf(String path) {
        if (path == null) return REGULAR;
        String name = path.toLowerCase(Locale.ROOT);
        if (name.contains("black") || name.contains("heavy")) return 900;
        if (name.contains("extrabold")) return 800;
        if (name.contains("semibold")) return 600;
        if (name.contains("bold")) return 700;
        if (name.contains("medium")) return 500;
        if (name.contains("light")) return 300;
        if (name.contains("thin")) return 100;
        return REGULAR;
    }

    /**
     * The replacement at {@code original}'s weight and slant while a switch asks for one,
     * otherwise {@code original} unchanged. Null, the engine's "no typeface" answer, becomes the
     * imported font at the weight the engine was asked for, and stays null otherwise: the app
     * already draws a null in the device font.
     */
    public static Typeface systemize(Typeface original) {
        Typeface family = replacementFamily();
        // Reported whichever way the switches are set, so an export separates "patch not present"
        // from "present and off" from "present and swapping", and says which font it swaps in.
        HookStatus.bound(HOOK_FAMILY, family == null ? "tiktok" : family == Typeface.DEFAULT ? "system" : "imported");
        if (family == null) return original;
        if (original == null && family == Typeface.DEFAULT) return null;
        try {
            if (original == null) {
                int[] asked = ASKED.get();
                return build(family, asked == null ? REGULAR : asked[0], asked != null && asked[1] == 1);
            }
            if (Build.VERSION.SDK_INT >= 28) {
                return Typeface.create(family, original.getWeight(), original.isItalic());
            }
            return Typeface.create(family, original.getStyle());
        } catch (Throwable failure) {
            HookStatus.threw(HOOK_FAMILY, "systemize", failure);
            return original;
        }
    }

    private static Typeface build(Typeface family, int weight, boolean italic) {
        int bounded = weight < 1 || weight > 1000 ? REGULAR : weight;
        if (Build.VERSION.SDK_INT >= 28) return Typeface.create(family, bounded, italic);
        int style = (bounded >= 600 ? Typeface.BOLD : Typeface.NORMAL) | (italic ? Typeface.ITALIC : Typeface.NORMAL);
        return Typeface.create(family, style);
    }

    /**
     * The one place that decides what TikTok's text is drawn in: the family to restyle into, or
     * null to keep TikTok's own. An imported font wins while Use an imported font is on and the
     * file loads. With that switch off, or the file gone or unreadable, the answer is what Use
     * system font alone would give: the device font while it's on, TikTok's own while it's off.
     */
    static Typeface replacementFamily() {
        if (Settings.IMPORTED_FONT.get()) {
            Typeface imported = ImportedFont.typeface();
            if (imported != null) return imported;
        }
        return Settings.SYSTEM_FONT.get() ? Typeface.DEFAULT : null;
    }
}
