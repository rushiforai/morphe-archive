package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.content.pm.PackageManager;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Runtime switches default to the original Messenger behavior. */
public final class Settings {
    static volatile SharedPreferences preferences;
    static volatile Set<String> installed = Collections.emptySet();
    static boolean preview;

    public static void initialize(Context context) {
        preferences = context.getApplicationContext().getSharedPreferences("hushmessenger", Context.MODE_PRIVATE);
        Set<String> features = new HashSet<>();
        preview = false;
        try {
            Bundle metadata = context.getPackageManager().getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA).metaData;
            preview = metadata != null && metadata.getBoolean("hush.preview", false);
            if (metadata != null) for (String name : metadata.keySet()) {
                if (name.startsWith("hush.feature.") && metadata.getBoolean(name, false)) features.add(name.substring(13));
            }
        } catch (PackageManager.NameNotFoundException error) {
            android.util.Log.e("HushMessenger", "Can't read installed controls", error);
        }
        installed = Collections.unmodifiableSet(features);
    }

    public static boolean enabled(String key) {
        SharedPreferences prefs = preferences;
        return installed.contains(key) && prefs != null && !prefs.getBoolean("paused", false) && prefs.getBoolean(key, false);
    }

    public static boolean hideStories() { return enabled("stories"); }
    public static boolean hideFacebook() { return enabled("facebook"); }
    public static boolean hideMetaAi() { return enabled("meta_ai"); }
    public static boolean showSubtabs(boolean original) { return original && !enabled("subtabs"); }
    public static boolean suppressTyping() { return enabled("typing"); }
    static boolean available(String key) { return !"bubbles".equals(key) || Build.VERSION.SDK_INT >= 30; }
    public static boolean enableBubbles() { return available("bubbles") && enabled("bubbles"); }

    /** Null means return the exact original list. Only typed ad rows are removed. */
    public static List<?> filterInboxAds(List<?> items) {
        if (!enabled("ads") || items == null || items.isEmpty()) return null;
        List<Object> filtered = null;
        for (int index = 0; index < items.size(); index++) {
            Object item = items.get(index);
            boolean ad = false;
            for (Class<?> type = item == null ? null : item.getClass(); type != null; type = type.getSuperclass()) {
                if ("com.facebook.messaging.business.inboxads.common.InboxAdsItem".equals(type.getName())) { ad = true; break; }
            }
            if (ad && filtered == null) filtered = new ArrayList<>(items.subList(0, index));
            if (!ad && filtered != null) filtered.add(item);
        }
        return filtered;
    }

    /** Keep non-web routes and Messenger's surrounding link handling intact. */
    public static boolean preferExternalBrowser(boolean original, Uri uri) {
        if (uri == null || !enabled("external_browser")) return original;
        String scheme = uri.getScheme();
        return ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme)) || original;
    }

    private Settings() { }
}
