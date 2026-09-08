/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */
package psylos.morphe.extension.soundcloud;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.LruCache;
import android.view.View;
import android.widget.Toast;

import com.soundcloud.android.ui.components.buttons.DownloadActionButton;

@SuppressWarnings("unused")
public final class DownloadButtonHook {
    private static final LruCache<String, String> URL_CACHE = new LruCache<>(128);

    private DownloadButtonHook() {
    }

    public static void applyLibraryDownloadsVisibility(View view) {
        if (view != null && isEnabled()) {
            view.setVisibility(View.GONE);
        }
    }

    public static boolean filterNativeDownloadUiVisibility(boolean visible) {
        return isEnabled() ? false : visible;
    }

    public static String getRememberedUrl(Object key) {
        if (key == null) {
            return null;
        }
        return URL_CACHE.get(String.valueOf(key));
    }

    public static boolean isEnabled() {
        return DownloadHookSettings.ENABLED.get().booleanValue();
    }

    private static boolean isPublicHttpUrl(String url) {
        if (url == null) {
            return false;
        }

        String trimmed = url.trim();
        if (trimmed.isEmpty()) {
            return false;
        }

        Uri uri = Uri.parse(trimmed);
        String scheme = uri.getScheme();
        if (scheme == null ||
                !("https".equalsIgnoreCase(scheme) || "http".equalsIgnoreCase(scheme))) {
            return false;
        }

        String host = uri.getHost();
        return host != null &&
                ("soundcloud.com".equalsIgnoreCase(host) ||
                        "www.soundcloud.com".equalsIgnoreCase(host));
    }

    public static DownloadActionButton.State normalizeDownloadState(
            DownloadActionButton.State state) {
        return isEnabled() ? DownloadActionButton.State.c : state;
    }

    public static void rememberUrl(Object key, String url) {
        if (key != null && isPublicHttpUrl(url)) {
            URL_CACHE.put(String.valueOf(key), url);
        }
    }

    private static void toast(Context context, String message) {
        Toast.makeText(context.getApplicationContext(), message, Toast.LENGTH_SHORT).show();
    }

    /**
     * Sends the public SoundCloud URL to the configured external package through ACTION_SEND.
     * Once enabled, the hook consumes the native click even when validation or launching fails.
     */
    public static boolean tryShare(Context context, String url) {
        if (!isEnabled()) {
            return false;
        }

        if (context == null) {
            return true;
        }

        if (!isPublicHttpUrl(url)) {
            toast(context, "SoundCloud-Link nicht verfuegbar");
            return true;
        }

        String targetPackage = DownloadHookSettings.TARGET_PACKAGE.get();
        if (targetPackage == null || targetPackage.trim().isEmpty()) {
            toast(context, "Custom Package Name fehlt");
            return true;
        }
        targetPackage = targetPackage.trim();

        Intent intent = new Intent(Intent.ACTION_SEND)
                .setType("text/plain")
                .putExtra(Intent.EXTRA_TEXT, url)
                .setPackage(targetPackage);
        if (!(context instanceof Activity)) {
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        }

        try {
            context.startActivity(intent);
        } catch (ActivityNotFoundException | SecurityException | IllegalArgumentException ignored) {
            toast(context,
                    "Externe Download-App nicht gefunden oder ACTION_SEND nicht akzeptiert");
        }
        return true;
    }

    public static boolean tryShareRemembered(Context context, Object key) {
        return tryShare(context, getRememberedUrl(key));
    }
}
