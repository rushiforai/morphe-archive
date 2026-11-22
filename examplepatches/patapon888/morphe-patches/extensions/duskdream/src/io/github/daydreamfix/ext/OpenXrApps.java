package io.github.daydreamfix.ext;

import android.content.ComponentName;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.util.Log;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Lists OpenXR apps in the Daydream home next to Daydream apps, and launches them. Daydream only
 * looks for activities with the DAYDREAM category; OpenXR apps mark theirs with IMMERSIVE_HMD. The
 * OpenXR runtime (DuskDream's Monado build) makes them behave as Daydream apps once running.
 */
public final class OpenXrApps {
    static final String DAYDREAM = "com.google.intent.category.DAYDREAM";
    static final String OPENXR = "org.khronos.openxr.intent.category.IMMERSIVE_HMD";

    private OpenXrApps() {}

    private static boolean isDaydreamMainQuery(Intent intent) {
        return intent != null
                && Intent.ACTION_MAIN.equals(intent.getAction())
                && intent.hasCategory(DAYDREAM)
                && intent.getComponent() == null;
    }

    private static Intent asOpenXr(Intent intent) {
        Intent copy = new Intent(intent);
        copy.removeCategory(DAYDREAM);
        copy.addCategory(OPENXR);
        return copy;
    }

    /** Daydream's app queries also return OpenXR apps that are not Daydream apps already. */
    public static List<ResolveInfo> query(PackageManager pm, Intent intent, int flags) {
        List<ResolveInfo> result = pm.queryIntentActivities(intent, flags);
        if (!isDaydreamMainQuery(intent)) {
            return result;
        }
        try {
            List<ResolveInfo> openXr = pm.queryIntentActivities(asOpenXr(intent), flags);
            Log.i(Daydream.TAG, "Daydream app query: " + result.size() + " Daydream, "
                    + openXr.size() + " OpenXR, package " + intent.getPackage());
            if (openXr.isEmpty()) {
                return result;
            }
            Set<String> packages = new HashSet<>();
            for (ResolveInfo r : result) {
                if (r.activityInfo != null) {
                    packages.add(r.activityInfo.packageName);
                }
            }
            List<ResolveInfo> merged = new ArrayList<>(result);
            for (ResolveInfo r : openXr) {
                // Apps that are Daydream apps too keep their Daydream entry.
                if (r.activityInfo != null && packages.add(r.activityInfo.packageName)) {
                    merged.add(r);
                }
            }
            return merged;
        } catch (Throwable t) {
            Log.w(Daydream.TAG, "OpenXR app query failed", t);
            return result;
        }
    }

    private static boolean hasFilter(PackageManager pm, ComponentName c, String category) {
        Intent probe = new Intent(Intent.ACTION_MAIN).addCategory(category).setPackage(c.getPackageName());
        for (ResolveInfo r : pm.queryIntentActivities(probe, 0)) {
            if (r.activityInfo != null && c.getClassName().equals(r.activityInfo.name)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Before the home launches an app: an OpenXR activity has no DAYDREAM filter, and newer Android
     * refuses explicit intents that match none of the target's filters, so swap the category.
     * Returns false so the launch goes on.
     */
    public static boolean fixLaunch(Object launcher, Intent intent) {
        try {
            ComponentName c = intent == null ? null : intent.getComponent();
            if (c == null || !intent.hasCategory(DAYDREAM) || Daydream.app == null) {
                return false;
            }
            PackageManager pm = Daydream.app.getPackageManager();
            if (!hasFilter(pm, c, DAYDREAM) && hasFilter(pm, c, OPENXR)) {
                intent.removeCategory(DAYDREAM);
                intent.addCategory(OPENXR);
                Log.i(Daydream.TAG, "Launching OpenXR app " + c.flattenToShortString());
            }
        } catch (Throwable t) {
            Log.w(Daydream.TAG, "OpenXR launch fix failed", t);
        }
        return false;
    }

    /** vrcore builds a library app's launch intent: same category fix as {@link #fixLaunch}. */
    public static void afterVrIntent(Object result, Object app) {
        if (result instanceof Intent) {
            fixLaunch(app, (Intent) result);
        }
    }

    /**
     * vrcore decodes library icons with BitmapFactory, which gives nothing for an XML drawable such
     * as Wolvic's {@code <bitmap>} wrapper. Draw those instead; null lets the original decode run.
     */
    public static android.graphics.Bitmap iconBitmap(Object loader, int id, android.content.res.Resources res, String pkg) {
        try {
            android.graphics.BitmapFactory.Options o = new android.graphics.BitmapFactory.Options();
            o.inJustDecodeBounds = true;
            android.graphics.BitmapFactory.decodeResource(res, id, o);
            if (o.outWidth > 0 && o.outHeight > 0) {
                return null;
            }
            android.graphics.drawable.Drawable d = res.getDrawable(id, null);
            if (d instanceof android.graphics.drawable.BitmapDrawable) {
                android.graphics.Bitmap b = ((android.graphics.drawable.BitmapDrawable) d).getBitmap();
                if (b != null) {
                    return b;
                }
            }
            int w = d.getIntrinsicWidth() > 0 ? d.getIntrinsicWidth() : 192;
            int h = d.getIntrinsicHeight() > 0 ? d.getIntrinsicHeight() : 192;
            android.graphics.Bitmap b = android.graphics.Bitmap.createBitmap(w, h, android.graphics.Bitmap.Config.ARGB_8888);
            d.setBounds(0, 0, w, h);
            d.draw(new android.graphics.Canvas(b));
            Log.i(Daydream.TAG, "Drew library icon for " + pkg);
            return b;
        } catch (Throwable t) {
            Log.w(Daydream.TAG, "Library icon fallback failed for " + pkg, t);
            return null;
        }
    }
}
