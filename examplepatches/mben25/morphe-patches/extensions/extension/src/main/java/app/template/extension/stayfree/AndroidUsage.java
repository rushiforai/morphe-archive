package app.template.extension.stayfree;

import android.app.usage.UsageEvents;
import android.app.usage.UsageStatsManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.provider.Settings;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * The phone's own usage, read live from {@link UsageStatsManager} (StayFree already holds the
 * usage-access permission) instead of being uploaded anywhere.
 */
final class AndroidUsage {
    /** Sessions that started before the requested window are found by looking back this far. */
    private static final long LOOKBACK_MS = 6 * 60 * 60 * 1000L;
    /** Activity switches inside one app produce pause/resume pairs; gaps this small are merged. */
    private static final long MERGE_GAP_MS = 2000L;
    private static final int ICON_SIZE_PX = 96;

    private final Context context;
    private final Map<String, byte[]> iconCache = new LinkedHashMap<String, byte[]>(64, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, byte[]> eldest) {
            return size() > 200;
        }
    };

    AndroidUsage(Context context) {
        this.context = context;
    }

    String deviceName() {
        try {
            String name = Settings.Global.getString(context.getContentResolver(), Settings.Global.DEVICE_NAME);
            if (name != null && !name.trim().isEmpty()) return name.trim();
        } catch (Throwable ignored) {
        }
        return Build.MODEL;
    }

    /**
     * Appends this phone's foreground sessions overlapping [startMs, endMs] to {@code out} in the
     * {@code DeviceGroupSessions.android_apps} shape.
     */
    void appendSessions(JSONObject out, long startMs, long endMs, Set<String> appIds, String installId) {
        UsageStatsManager usm = (UsageStatsManager) context.getSystemService(Context.USAGE_STATS_SERVICE);
        if (usm == null) return;
        long now = System.currentTimeMillis();
        endMs = Math.min(endMs, now);
        if (endMs <= startMs) return;

        Set<String> excluded = excludedPackages();
        Map<String, long[]> open = new HashMap<>(); // package -> [start, lastEnd] of the session being built
        String current = null;
        long currentStart = 0;

        UsageEvents events = usm.queryEvents(startMs - LOOKBACK_MS, endMs);
        UsageEvents.Event event = new UsageEvents.Event();
        while (events.hasNextEvent()) {
            events.getNextEvent(event);
            String pkg = event.getPackageName();
            long ts = event.getTimeStamp();
            switch (event.getEventType()) {
                case UsageEvents.Event.ACTIVITY_RESUMED:
                    if (pkg != null && !pkg.equals(current)) {
                        if (current != null) close(out, open, current, currentStart, ts, startMs, endMs, appIds, excluded, installId);
                        current = pkg;
                        currentStart = ts;
                    }
                    break;
                case UsageEvents.Event.ACTIVITY_PAUSED:
                case UsageEvents.Event.ACTIVITY_STOPPED:
                    if (pkg != null && pkg.equals(current)) {
                        close(out, open, current, currentStart, ts, startMs, endMs, appIds, excluded, installId);
                        current = null;
                    }
                    break;
                case UsageEvents.Event.SCREEN_NON_INTERACTIVE:
                case UsageEvents.Event.KEYGUARD_SHOWN:
                case UsageEvents.Event.DEVICE_SHUTDOWN:
                    if (current != null) {
                        close(out, open, current, currentStart, ts, startMs, endMs, appIds, excluded, installId);
                        current = null;
                    }
                    break;
                default:
                    break;
            }
        }
        if (current != null) close(out, open, current, currentStart, endMs, startMs, endMs, appIds, excluded, installId);
        for (Map.Entry<String, long[]> e : open.entrySet()) flush(out, e.getKey(), e.getValue(), startMs, endMs, installId);
    }

    private static void close(JSONObject out, Map<String, long[]> open, String pkg, long start, long end,
                              long windowStart, long windowEnd, Set<String> appIds, Set<String> excluded,
                              String installId) {
        if (end <= start || excluded.contains(pkg) || (appIds != null && !appIds.contains(pkg))) return;
        long[] pending = open.get(pkg);
        if (pending != null && start - pending[1] <= MERGE_GAP_MS) {
            pending[1] = Math.max(pending[1], end);
            return;
        }
        if (pending != null) flush(out, pkg, pending, windowStart, windowEnd, installId);
        open.put(pkg, new long[]{start, end});
    }

    private static void flush(JSONObject out, String pkg, long[] session, long windowStart, long windowEnd, String installId) {
        long start = Math.max(session[0], windowStart);
        long end = Math.min(session[1], windowEnd);
        long durationSec = (end - start) / 1000;
        if (durationSec < 1) return;
        LocalSyncStore.addSession(out, pkg, start / 1000, durationSec, installId);
    }

    /** Home screens and System UI are not "app usage" in StayFree's sense. */
    private Set<String> excludedPackages() {
        Set<String> excluded = new HashSet<>();
        excluded.add("com.android.systemui");
        excluded.add("android");
        try {
            Intent home = new Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME);
            List<ResolveInfo> launchers = context.getPackageManager().queryIntentActivities(home, PackageManager.MATCH_ALL);
            for (ResolveInfo info : launchers) excluded.add(info.activityInfo.packageName);
        } catch (Throwable ignored) {
        }
        return excluded;
    }

    /** Answers the extension's {@code GET /v1/android/apps?app_ids=...} from PackageManager. */
    JSONArray appInfo(Set<String> appIds, String iconBaseUrl) {
        JSONArray result = new JSONArray();
        if (appIds == null) return result;
        PackageManager pm = context.getPackageManager();
        for (String pkg : appIds) {
            JSONObject app = new JSONObject();
            String label = pkg;
            try {
                ApplicationInfo info = pm.getApplicationInfo(pkg, 0);
                label = String.valueOf(pm.getApplicationLabel(info));
            } catch (PackageManager.NameNotFoundException ignored) {
            }
            LocalSyncStore.put(app, "app_id", pkg);
            LocalSyncStore.put(app, "display_name", label);
            LocalSyncStore.put(app, "icon_url", iconBaseUrl + pkg);
            result.put(app);
        }
        return result;
    }

    synchronized byte[] iconPng(String pkg) {
        byte[] cached = iconCache.get(pkg);
        if (cached != null) return cached;
        try {
            Drawable drawable = context.getPackageManager().getApplicationIcon(pkg);
            Bitmap bitmap = Bitmap.createBitmap(ICON_SIZE_PX, ICON_SIZE_PX, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            drawable.setBounds(0, 0, ICON_SIZE_PX, ICON_SIZE_PX);
            drawable.draw(canvas);
            ByteArrayOutputStream png = new ByteArrayOutputStream();
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, png);
            bitmap.recycle();
            byte[] bytes = png.toByteArray();
            iconCache.put(pkg, bytes);
            return bytes;
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }
}
