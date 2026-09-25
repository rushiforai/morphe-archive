package app.morphe.extension.tiktok.theme;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Maps TikTok 46.7.3 Compose packed sRGB colors to the active BlueIT palette.
 *
 * TikTok's normal Settings & privacy UI does not get its real page/card colors from the outer
 * Android ComposeView. It reads a native Compose palette (LX/05Pc) through LX/0VTU.LIZIZ and then
 * paints the screen from packed Color longs. The patch therefore has two fail-open layers:
 *
 *  1. mapPalette(Object) remaps the native palette object at its provider. This covers page, cards,
 *     text, dividers and other Compose consumers without guessing individual obfuscated field names.
 *  2. mapColor(long) remains available at exact renderer reads as a narrow fallback.
 *
 * The original values of every palette instance are snapshotted in a WeakHashMap. A live preset
 * switch first restores those originals and then reapplies the new BlueIT palette, so the mapping is
 * idempotent and TikTok default can be restored without accumulating color transformations.
 */
@SuppressWarnings({"unused", "JavaReflectionMemberAccess"})
public final class ThemeComposeColorResolver {
    private static final int TIKTOK_ACCENT = Color.rgb(254, 44, 85);
    private static final int TIKTOK_LIGHT_TEXT = Color.rgb(22, 24, 35);

    private static final AtomicInteger COLOR_LOG_BUDGET = new AtomicInteger(24);
    private static final AtomicBoolean PALETTE_LOGGED = new AtomicBoolean(false);
    private static final Object PALETTE_LOCK = new Object();
    private static final Map<Object, PaletteSnapshot> PALETTE_SNAPSHOTS =
            Collections.synchronizedMap(new WeakHashMap<>());

    private ThemeComposeColorResolver() {}

    /**
     * Called from the exact LX/0VTU.LIZIZ Compose-palette provider.
     *
     * @return the same object, always. Any reflection/layout mismatch fails open to TikTok stock.
     */
    public static Object mapPalette(Object palette) {
        if (palette == null) return null;

        try {
            Context context = Utils.getContext();
            if (context == null) return palette;

            String preset = ThemeStateStore.currentPreset(context);
            synchronized (PALETTE_LOCK) {
                PaletteSnapshot snapshot = PALETTE_SNAPSHOTS.get(palette);
                if (snapshot == null) {
                    snapshot = capturePalette(palette);
                    if (snapshot == null || snapshot.entries.isEmpty()) return palette;
                    PALETTE_SNAPSHOTS.put(palette, snapshot);
                }

                if (preset.equals(snapshot.appliedPreset)) return palette;

                // Never remap an already-remapped value. Restore the exact native palette first.
                restorePalette(palette, snapshot);

                int changed = 0;
                if (!"default".equals(preset)) {
                    for (PaletteEntry entry : snapshot.entries) {
                        long mapped = mapPackedColor(entry.originalValue, context);
                        if (mapped == entry.originalValue) continue;
                        try {
                            entry.field.setLong(palette, mapped);
                            changed++;
                        } catch (Throwable ignored) {
                            // One inaccessible field must not prevent the remaining palette mapping.
                        }
                    }
                }

                snapshot.appliedPreset = preset;

                if (PALETTE_LOGGED.compareAndSet(false, true)) {
                    final int total = snapshot.entries.size();
                    final int mappedCount = changed;
                    final String activePreset = preset;
                    Logger.printInfo(() -> "[BlueIT Theme Compose] native palette hooked fields="
                            + total + " mapped=" + mappedCount + " preset=" + activePreset);
                }
            }
        } catch (Throwable ignored) {
            // Theme code is visual-only and must never break Compose rendering.
        }
        return palette;
    }

    public static long mapColor(long packed) {
        try {
            Context context = Utils.getContext();
            if (context == null || "default".equals(ThemeStateStore.currentPreset(context))) {
                return packed;
            }
            return mapPackedColor(packed, context);
        } catch (Throwable ignored) {
            return packed;
        }
    }

    private static long mapPackedColor(long packed, Context context) {
        try {
            // Compose's common sRGB Color(Int) representation keeps ARGB in the high 32 bits and
            // zero in the low 32 bits. Leave extended color-space encodings untouched.
            if ((packed & 0xFFFFFFFFL) != 0L) return packed;

            int stock = (int) (packed >>> 32);
            int alpha = Color.alpha(stock);
            if (alpha == 0) return packed;

            Integer mapped = mapArgb(stock, context);
            if (mapped == null || mapped == stock) return packed;

            int mappedAlpha = Color.alpha(mapped);
            if (alpha < mappedAlpha) {
                mapped = Color.argb(
                        alpha,
                        Color.red(mapped),
                        Color.green(mapped),
                        Color.blue(mapped)
                );
            }

            if (COLOR_LOG_BUDGET.getAndDecrement() > 0) {
                final int from = stock;
                final int to = mapped;
                Logger.printInfo(() -> String.format(
                        "[BlueIT Theme Compose] mapped #%08X -> #%08X",
                        from,
                        to
                ));
            }

            return Integer.toUnsignedLong(mapped) << 32;
        } catch (Throwable ignored) {
            return packed;
        }
    }

    private static PaletteSnapshot capturePalette(Object palette) {
        try {
            List<PaletteEntry> entries = new ArrayList<>();
            for (Field field : palette.getClass().getFields()) {
                if (field.getType() != long.class || Modifier.isStatic(field.getModifiers())) continue;
                try {
                    field.setAccessible(true);
                    entries.add(new PaletteEntry(field, field.getLong(palette)));
                } catch (Throwable ignored) {
                }
            }
            return new PaletteSnapshot(entries);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void restorePalette(Object palette, PaletteSnapshot snapshot) {
        for (PaletteEntry entry : snapshot.entries) {
            try {
                entry.field.setLong(palette, entry.originalValue);
            } catch (Throwable ignored) {
            }
        }
    }

    private static Integer mapArgb(int stock, Context context) {
        int opaque = Color.rgb(Color.red(stock), Color.green(stock), Color.blue(stock));

        if (distance(opaque, TIKTOK_ACCENT) <= 34.0) {
            return ThemeEngine.accentColor(context);
        }

        int r = Color.red(opaque);
        int g = Color.green(opaque);
        int b = Color.blue(opaque);
        int spread = Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b));

        // Preserve colorful semantic/status/media colors.
        if (spread > 34) return null;

        double y = lightness(opaque);
        int alpha = Color.alpha(stock);
        boolean dark = stockDarkMode(context);

        // Dark TikTok: page is black and grouped surfaces are roughly #1E1E1E/#252525/#2C2C2C.
        if (dark) {
            if (y <= 0.045) return ThemeEngine.backgroundColor(context);
            if (y <= 0.22) return ThemeEngine.surfaceColor(context);
            if (y >= 0.82) return ThemeEngine.textColor(context);
            if (alpha < 100) return ThemeEngine.dividerColor(context);
            if (y >= 0.34) return ThemeEngine.secondaryTextColor(context);
            return ThemeEngine.dividerColor(context);
        }

        if (distance(opaque, TIKTOK_LIGHT_TEXT) <= 48.0 || y <= 0.12) {
            return ThemeEngine.textColor(context);
        }
        if (y >= 0.965) return ThemeEngine.backgroundColor(context);
        if (y >= 0.80) return ThemeEngine.surfaceColor(context);
        if (alpha < 100) return ThemeEngine.dividerColor(context);
        if (y <= 0.64) return ThemeEngine.secondaryTextColor(context);
        return ThemeEngine.dividerColor(context);
    }

    private static boolean stockDarkMode(Context context) {
        try {
            int mode = context.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK;
            return mode == Configuration.UI_MODE_NIGHT_YES;
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static double lightness(int color) {
        double r = Color.red(color) / 255.0;
        double g = Color.green(color) / 255.0;
        double b = Color.blue(color) / 255.0;
        return 0.2126 * r + 0.7152 * g + 0.0722 * b;
    }

    private static double distance(int first, int second) {
        int dr = Color.red(first) - Color.red(second);
        int dg = Color.green(first) - Color.green(second);
        int db = Color.blue(first) - Color.blue(second);
        return Math.sqrt(dr * dr + dg * dg + db * db);
    }

    private static final class PaletteSnapshot {
        final List<PaletteEntry> entries;
        String appliedPreset = "__unmapped__";

        PaletteSnapshot(List<PaletteEntry> entries) {
            this.entries = entries;
        }
    }

    private static final class PaletteEntry {
        final Field field;
        final long originalValue;

        PaletteEntry(Field field, long originalValue) {
            this.field = field;
            this.originalValue = originalValue;
        }
    }
}
