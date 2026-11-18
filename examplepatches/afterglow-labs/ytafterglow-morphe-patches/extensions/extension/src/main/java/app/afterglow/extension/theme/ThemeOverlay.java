/*
 * Overlay registration/loading adapted from Morphe ThemeColorOverlay (2026, GPLv3),
 * https://github.com/MorpheApp/morphe-patches/pull/2524 . See NOTICE.
 * Modified for Afterglow's semantic roles and self-targeting package-independent resources.
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */
package app.afterglow.extension.theme;

import android.content.Context;
import android.content.om.FabricatedOverlay;
import android.content.om.OverlayInfo;
import android.content.om.OverlayManager;
import android.content.om.OverlayManagerTransaction;
import android.content.res.loader.ResourcesLoader;
import android.content.res.loader.ResourcesProvider;
import android.util.Log;
import android.util.TypedValue;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.LinkedHashMap;
import java.util.Map;

import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.NativeThemeColors;
import app.afterglow.extension.settings.ThemePalette;
import app.afterglow.extension.settings.ThemeRole;

/** API 34 types are isolated here; older devices never load this class. */
final class ThemeOverlay {
    private static final String NAME = "afterglow_theme";
    private static ResourcesLoader loader;

    static void initialize(Context context, ThemePalette palette) throws Exception {
        OverlayManager manager = context.getSystemService(OverlayManager.class);
        if (manager == null) throw new IllegalStateException("Self-targeting overlays are unavailable");
        String pkg = context.getPackageName();
        FabricatedOverlay overlay = new FabricatedOverlay(NAME, pkg);
        overlay.setTargetOverlayable("AfterglowTheme");
        Map<String, Integer> colors = new LinkedHashMap<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                context.getAssets().open("afterglow-theme-colors.txt"), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] pair = line.split("=", 2);
                if (pair.length != 2) throw new IllegalStateException("Invalid theme resource binding");
                String[] role = pair[1].split(":", 2);
                ThemeRole semantic = ThemeRole.valueOf(role[0]);
                Integer color = NativeThemeColors.resourceColor(palette, semantic);
                if (color != null) colors.put(pair[0], role.length == 1 ? color
                        : NativeThemeColors.withOpacity(color, Double.parseDouble(role[1])));
            }
        }
        OverlayManagerTransaction transaction = OverlayManagerTransaction.newInstance();
        if (colors.isEmpty()) {
            if (find(manager, pkg) != null) {
                transaction.unregisterFabricatedOverlay(overlay.getIdentifier());
                manager.commit(transaction);
            }
            Log.i(Afterglow.TAG, "Native theme: system colors");
            return;
        }
        for (Map.Entry<String, Integer> entry : colors.entrySet()) {
            overlay.setResourceValue(pkg + ":color/" + entry.getKey(),
                    TypedValue.TYPE_INT_COLOR_ARGB8, entry.getValue(), null);
        }
        transaction.registerFabricatedOverlay(overlay);
        manager.commit(transaction);
        OverlayInfo info = find(manager, pkg);
        if (info == null) throw new IllegalStateException("Theme overlay was not registered");
        ResourcesLoader next = new ResourcesLoader();
        next.addProvider(ResourcesProvider.loadOverlay(info));
        loader = next;
        Log.i(Afterglow.TAG, "Native theme: " + palette.identifier + ", " + colors.size() + " color resources");
    }

    static void apply(Context context) {
        if (loader != null) context.getResources().addLoaders(loader);
    }

    private static OverlayInfo find(OverlayManager manager, String pkg) {
        for (OverlayInfo info : manager.getOverlayInfosForTarget(pkg)) {
            if (NAME.equals(info.getOverlayName())) return info;
        }
        return null;
    }
}
