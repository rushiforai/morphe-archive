/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/2524
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified for Spicetify on 2026-09-25: one overlay for every mapped Spotify color, one shared
 * ResourcesLoader updated in place, and loading through activity lifecycle callbacks. On 2026-10-02:
 * each update closes the provider it replaces.
 */

package app.spicetify.extension.spotify.theme;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.om.FabricatedOverlay;
import android.content.om.OverlayInfo;
import android.content.om.OverlayManager;
import android.content.om.OverlayManagerTransaction;
import android.content.res.Resources;
import android.content.res.loader.ResourcesLoader;
import android.content.res.loader.ResourcesProvider;
import android.os.Build;
import android.util.TypedValue;
import java.io.IOException;
import java.util.Collections;
import java.util.Map;

/**
 * Applies a theme with an overlay Spotify registers for itself (Android 14 and later). The theme
 * patch declares the mapped colors overlayable under {@link #OVERLAYABLE}. The system doesn't apply
 * a self-targeting overlay: one shared {@link ResourcesLoader} carries it, and every Resources that
 * has the loader updates when its provider changes. Only this class touches Android 14 APIs, so
 * older devices never load it.
 */
@TargetApi(Build.VERSION_CODES.UPSIDE_DOWN_CAKE)
final class ThemeOverlay {
    static final String OVERLAYABLE = "SpicetifyTheme";
    private static final String NAME = "spicetify_theme";
    private static final ResourcesLoader LOADER = new ResourcesLoader();
    private static ResourcesProvider provider;

    private ThemeOverlay() {}

    static boolean isAvailable(Context context) {
        return context.getSystemService(OverlayManager.class) != null;
    }

    /** Registers the overlay with these color values, replacing the previous one, and reloads it. */
    static void register(Context context, Map<String, Integer> values) throws IOException {
        String packageName = context.getPackageName();
        FabricatedOverlay overlay = new FabricatedOverlay(NAME, packageName);
        overlay.setTargetOverlayable(OVERLAYABLE);
        for (Map.Entry<String, Integer> value : values.entrySet()) {
            overlay.setResourceValue(packageName + ":color/" + value.getKey(),
                    TypedValue.TYPE_INT_COLOR_ARGB8, value.getValue(), null);
        }
        OverlayManagerTransaction transaction = OverlayManagerTransaction.newInstance();
        transaction.registerFabricatedOverlay(overlay);
        manager(context).commit(transaction);
        reload(context);
    }

    /** Removes the overlay, so every Resources with the loader goes back to Spotify's colors. */
    static void unregister(Context context) {
        OverlayInfo info = find(context);
        if (info != null) {
            OverlayManagerTransaction transaction = OverlayManagerTransaction.newInstance();
            transaction.unregisterFabricatedOverlay(info.getOverlayIdentifier());
            manager(context).commit(transaction);
        }
        replace(null);
    }

    /** Points the shared loader at the registered overlay, or at nothing. */
    private static void reload(Context context) throws IOException {
        OverlayInfo info = find(context);
        replace(info == null ? null : ResourcesProvider.loadOverlay(info));
    }

    /** Gives the shared loader this provider, or none, and closes the one it had. */
    private static synchronized void replace(ResourcesProvider next) {
        ResourcesProvider previous = provider;
        if (next == null) {
            LOADER.clearProviders();
        } else {
            LOADER.setProviders(Collections.singletonList(next));
        }
        provider = next;
        if (previous != null) previous.close();
    }

    /** Adds the shared loader to {@code resources}; adding it again is ignored. */
    static void applyTo(Resources resources) {
        resources.addLoaders(LOADER);
    }

    private static OverlayInfo find(Context context) {
        for (OverlayInfo info : manager(context).getOverlayInfosForTarget(context.getPackageName())) {
            if (NAME.equals(info.getOverlayName())) return info;
        }
        return null;
    }

    private static OverlayManager manager(Context context) {
        OverlayManager manager = context.getSystemService(OverlayManager.class);
        if (manager == null) throw new IllegalStateException("OverlayManager is not available");
        return manager;
    }
}
