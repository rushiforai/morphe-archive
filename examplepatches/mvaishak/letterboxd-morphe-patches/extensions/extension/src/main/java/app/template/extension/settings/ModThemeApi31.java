/*
 * The ResourcesLoader-based runtime .arsc overlay technique here is adapted from Piko
 * (https://github.com/crimera/piko), licensed under GPLv3 with additional Section 7 terms.
 * See the included NOTICE file for the credit this project owes under those terms.
 */

package app.template.extension.settings;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.loader.ResourcesLoader;
import android.content.res.loader.ResourcesProvider;
import android.os.ParcelFileDescriptor;

import androidx.annotation.RequiresApi;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * The Android 12+ half of {@link ModTheme}: copies the chosen overlay {@code .arsc} files out of
 * assets, wraps each in a {@link ResourcesLoader}, and adds the whole set to each {@link Resources}
 * instance once. Later loaders win, so the accent overlay is added after OLED (they touch disjoint
 * resources, so ordering is only a safety net).
 *
 * <p>Restart-based: the loader set is fixed at process start, there is no removal path.
 */
@RequiresApi(31)
final class ModThemeApi31 {

    private static final List<ResourcesLoader> LOADERS = new ArrayList<>();
    private static final Set<Resources> APPLIED =
            Collections.newSetFromMap(new WeakHashMap<Resources, Boolean>());
    private static boolean prepared;

    private ModThemeApi31() {}

    private static final String[] ACCENT_RESOURCES = {
            "colorAccent", "green00E054", "green0ADE53", "green00A010", "green00B020", "green00C030",
    };

    static synchronized void prepare(Context context, String surface, String accent, String navStyle) {
        if (prepared) return;
        prepared = true;

        Context app = context.getApplicationContext();
        if (app == null) app = context;

        if ("oled".equals(surface)) {
            addAssetLoader(app, "morphe/oled.arsc", "morphe-oled.arsc");
        }
        if ("custom".equals(accent)) {
            String hex = Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, "");
            if (!hex.isEmpty()) {
                try {
                    addAccentColorLoader(app, AccentMath.parseHex(hex), "morphe-accent-custom.arsc");
                } catch (Throwable ignored) {
                }
            }
        } else if (AccentPresets.MATERIAL_YOU.equals(accent) || AccentPresets.MATERIAL_YOU_2.equals(accent)
                || AccentPresets.MATERIAL_YOU_3.equals(accent)) {
            // Device-dependent, so it can't be a pre-baked patch-time asset like the presets below
            // — built at runtime the same way "custom" hex is, from the live system tone instead.
            int family = AccentPresets.MATERIAL_YOU_3.equals(accent) ? 3
                    : AccentPresets.MATERIAL_YOU_2.equals(accent) ? 2 : 1;
            Integer tone = AccentPresets.materialYouTone(app, family);
            if (tone != null) addAccentColorLoader(app, tone, "morphe-accent-" + accent + ".arsc");
        } else if (accent != null && !accent.isEmpty() && !"green".equals(accent)) {
            addAssetLoader(app, "morphe/accent_" + accent + ".arsc", "morphe-accent-" + accent + ".arsc");
        }
        addNavIconLoader(app, accent, navStyle);
    }

    /** Recolour the selected bottom-nav icon (the {@code @color/blue40BCF4} the 4 filled vectors use). */
    private static void addNavIconLoader(Context app, String accent, String navStyle) {
        try {
            int color;
            if ("white".equals(navStyle)) {
                color = 0xFFF2F2F2;
            } else if ("accent".equals(navStyle) || "accentPill".equals(navStyle)) {
                int a = AccentPresets.previewColor(app, accent, Prefs.getString(Prefs.KEY_THEME_ACCENT_HEX, ""));
                // Stock green would clash with the always-green "+" button — keep the icon white.
                color = "green".equals(accent) ? 0xFFF2F2F2 : (0xFF000000 | a);
            } else {
                return; // stock / nopill — leave the app's blue
            }

            String pkg = app.getPackageName();
            int id = app.getResources().getIdentifier("blue40BCF4", "color", pkg);
            if (id == 0) return;

            Map<Integer, Integer> one = new java.util.LinkedHashMap<>();
            one.put(id, color);
            byte[] table = MiniArsc.colorOverlay(pkg, (id >> 24) & 0xff, one);

            File file = new File(app.getCodeCacheDir(), "morphe-navicon.arsc");
            try (FileOutputStream out = new FileOutputStream(file, false)) {
                out.write(table);
            }
            addFileLoader(file);
        } catch (Throwable ignored) {
        }
    }

    /** Shared by "custom" hex and {@link AccentPresets#MATERIAL_YOU} — any accent colour known only
     * at runtime, built the same way a patch-time preset asset would be, just on the fly. */
    private static void addAccentColorLoader(Context app, int primary, String cacheName) {
        try {
            String pkg = app.getPackageName();
            int[] ids = new int[ACCENT_RESOURCES.length];
            for (int i = 0; i < ids.length; i++) {
                ids[i] = app.getResources().getIdentifier(ACCENT_RESOURCES[i], "color", pkg);
                if (ids[i] == 0) return; // resource names changed — bail, keep stock green
            }

            Map<Integer, Integer> overrides = AccentMath.overlay(ids, primary);
            byte[] table = MiniArsc.colorOverlay(pkg, (ids[0] >> 24) & 0xff, overrides);

            File file = new File(app.getCodeCacheDir(), cacheName);
            try (FileOutputStream out = new FileOutputStream(file, false)) {
                out.write(table);
            }
            addFileLoader(file);
        } catch (Throwable ignored) {
        }
    }

    static synchronized void applyTo(Resources resources) {
        if (resources == null || LOADERS.isEmpty() || APPLIED.contains(resources)) return;
        try {
            resources.addLoaders(LOADERS.toArray(new ResourcesLoader[0]));
            APPLIED.add(resources);
        } catch (Throwable ignored) {
        }
    }

    private static void addAssetLoader(Context app, String assetName, String cacheName) {
        try {
            File file = new File(app.getCodeCacheDir(), cacheName);
            copyAsset(app, assetName, file);
            addFileLoader(file);
        } catch (Throwable ignored) {
        }
    }

    private static void addFileLoader(File file) {
        try {
            ResourcesProvider provider;
            try (ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(
                    file, ParcelFileDescriptor.MODE_READ_ONLY)) {
                provider = ResourcesProvider.loadFromTable(descriptor, null);
            }
            ResourcesLoader loader = new ResourcesLoader();
            loader.addProvider(provider);
            LOADERS.add(loader);
        } catch (Throwable ignored) {
        }
    }

    private static void copyAsset(Context context, String assetName, File output) throws Exception {
        try (InputStream input = context.getAssets().open(assetName);
             FileOutputStream out = new FileOutputStream(output, false)) {
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
        }
    }
}
