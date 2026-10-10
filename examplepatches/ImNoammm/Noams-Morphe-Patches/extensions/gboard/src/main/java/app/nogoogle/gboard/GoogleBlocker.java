package app.nogoogle.gboard;

import android.app.Activity;
import android.content.ComponentName;
import android.content.ContentProviderClient;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.AssetFileDescriptor;
import android.database.ContentObserver;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.os.CancellationSignal;
import android.os.ParcelFileDescriptor;
import android.os.UserHandle;
import android.util.Log;
import android.view.textclassifier.TextClassificationManager;
import android.view.textclassifier.TextClassifier;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Executor;

/**
 * Every Context / ContentResolver IPC call site in Gboard is rewritten to go through these
 * methods: anything addressed to a Google app, content provider or web host is dropped, so Gboard
 * can't hand data to Google through another process (it has no network access of its own).
 */
@SuppressWarnings({"unused", "deprecation"})
public final class GoogleBlocker {
    private static final String TAG = "NoGoogle";

    private GoogleBlocker() {
    }

    public static boolean isGooglePackage(Context context, String pkg) {
        if (pkg == null || pkg.isEmpty()) return false;
        if (context != null && pkg.equals(context.getPackageName())) return false;
        return pkg.startsWith("com.google.")
                || pkg.equals("com.google")
                || pkg.equals("com.android.vending")
                || pkg.startsWith("com.android.vending.")
                || pkg.equals("com.android.chrome")
                || pkg.startsWith("com.chrome.")
                || pkg.startsWith("com.google.android.");
    }

    public static boolean isGoogleAuthority(Context context, String authority) {
        if (authority == null) return false;
        for (String a : authority.split(";")) {
            int at = a.lastIndexOf('@'); // content://0@authority (user-qualified)
            if (at >= 0) a = a.substring(at + 1);
            if (context != null && (a.equals(context.getPackageName())
                    || a.startsWith(context.getPackageName() + "."))) {
                continue;
            }
            if (a.startsWith("com.google.") || a.startsWith("com.android.vending")
                    || a.startsWith("com.android.chrome")) {
                return true;
            }
        }
        return false;
    }

    public static boolean isGoogleHost(String host) {
        if (host == null) return false;
        String h = host.toLowerCase(Locale.ROOT);
        if (h.endsWith(".")) h = h.substring(0, h.length() - 1);
        // google.com, google.co.il, www.google.de, ...
        if (h.matches("(.*\\.)?google(\\.[a-z]{2,3}){1,2}")) return true;
        String[] suffixes = {
                "googleapis.com", "gstatic.com", "googleusercontent.com", "googlevideo.com",
                "googletagmanager.com", "google-analytics.com", "googleadservices.com",
                "googlesyndication.com", "doubleclick.net", "app-measurement.com",
                "firebaseio.com", "firebase.google.com", "crashlytics.com", "gvt1.com",
                "gvt2.com", "gvt3.com", "ggpht.com", "goo.gl", "g.co", "youtube.com",
                "youtu.be", "ytimg.com", "tenor.com", "tenor.co", "android.com",
                "withgoogle.com", "googleblog.com", "gmail.com", "1e100.net", "app.goo.gl",
                "page.link",
        };
        for (String s : suffixes) {
            if (h.equals(s) || h.endsWith("." + s)) return true;
        }
        return false;
    }

    private static boolean isGoogleUri(Context context, Uri uri) {
        if (uri == null) return false;
        String scheme = uri.getScheme();
        if ("content".equalsIgnoreCase(scheme)) return isGoogleAuthority(context, uri.getAuthority());
        if ("android.resource".equalsIgnoreCase(scheme)) return isGooglePackage(context, uri.getAuthority());
        return isGoogleHost(uri.getHost());
    }

    private static boolean isExplicitlyGoogle(Context context, Intent intent) {
        if (intent == null) return false;
        if (isGooglePackage(context, intent.getPackage())) return true;
        ComponentName component = intent.getComponent();
        if (component != null && isGooglePackage(context, component.getPackageName())) return true;
        if (isGoogleUri(context, intent.getData())) return true;
        if (intent.getClipData() != null) {
            for (int i = 0; i < intent.getClipData().getItemCount(); i++) {
                if (isGoogleUri(context, intent.getClipData().getItemAt(i).getUri())) return true;
            }
        }
        Intent selector = intent.getSelector();
        if (selector != null && selector != intent && isExplicitlyGoogle(context, selector)) return true;
        // Chooser / wrapped intents.
        try {
            Intent inner = intent.getParcelableExtra(Intent.EXTRA_INTENT);
            if (inner != null && inner != intent && isExplicitlyGoogle(context, inner)) return true;
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static boolean isExplicit(Intent intent) {
        return intent.getPackage() != null || intent.getComponent() != null;
    }

    private static boolean anyGoogle(Context context, List<ResolveInfo> infos) {
        if (infos == null) return false;
        for (ResolveInfo info : infos) {
            String pkg = null;
            if (info.serviceInfo != null) pkg = info.serviceInfo.packageName;
            else if (info.activityInfo != null) pkg = info.activityInfo.packageName;
            else if (info.providerInfo != null) pkg = info.providerInfo.packageName;
            if (isGooglePackage(context, pkg)) return true;
        }
        return false;
    }

    public static boolean blockService(Context context, Intent intent) {
        if (intent == null) return false;
        if (!NoGoogleSettings.bool(NoGoogleSettings.BLOCK_SERVICES)) return false;
        if (isExplicitlyGoogle(context, intent)) return true;
        if (isExplicit(intent)) return false;
        try {
            return anyGoogle(context, context.getPackageManager().queryIntentServices(intent, 0));
        } catch (Throwable t) {
            return true;
        }
    }

    public static boolean blockActivity(Context context, Intent intent) {
        if (intent == null) return false;
        if (!NoGoogleSettings.bool(NoGoogleSettings.BLOCK_ACTIVITIES)) return false;
        if (isExplicitlyGoogle(context, intent)) return true;
        if (isExplicit(intent)) return false;
        try {
            // Block when the intent would land directly in a Google app (no chooser).
            ResolveInfo info = context.getPackageManager()
                    .resolveActivity(intent, PackageManager.MATCH_DEFAULT_ONLY);
            if (info != null && info.activityInfo != null
                    && isGooglePackage(context, info.activityInfo.packageName)) {
                return true;
            }
            // Or when only Google apps can handle it.
            List<ResolveInfo> all = context.getPackageManager().queryIntentActivities(intent, 0);
            if (all != null && !all.isEmpty()) {
                for (ResolveInfo r : all) {
                    if (r.activityInfo == null
                            || !isGooglePackage(context, r.activityInfo.packageName)) {
                        return false;
                    }
                }
                return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /**
     * Returns the intent to broadcast, or null to drop it. Implicit broadcasts that are not
     * plain android.* system broadcasts are confined to Gboard itself so no other app
     * (e.g. a Google app with a runtime receiver) can pick them up.
     */
    private static Intent filterBroadcast(Context context, Intent intent) {
        if (intent == null) return null;
        if (!NoGoogleSettings.bool(NoGoogleSettings.BLOCK_BROADCASTS)) return intent;
        if (isExplicitlyGoogle(context, intent)) return null;
        if (isExplicit(intent)) return intent;
        String action = intent.getAction();
        if (action != null && action.startsWith("android.")) return intent;
        Intent copy = new Intent(intent);
        copy.setPackage(context.getPackageName());
        return copy;
    }

    private static void log(String what, Object target) {
        try {
            Log.i(TAG, "Blocked " + what + ": " + target);
            NoGoogleSettings.logBlocked(what + ": " + target);
        } catch (Throwable ignored) {
        }
    }

    public static Context wrap(Context context) {
        if (context == null || context instanceof BlockingContext) return context;
        return new BlockingContext(context);
    }

    public static boolean bindService(Context c, Intent i, ServiceConnection conn, int flags) {
        if (blockService(c, i)) { log("bindService", i); return false; }
        return c.bindService(i, conn, flags);
    }

    public static boolean bindService(Context c, Intent i, int flags, Executor e, ServiceConnection conn) {
        if (blockService(c, i)) { log("bindService", i); return false; }
        return c.bindService(i, flags, e, conn);
    }

    public static boolean bindServiceAsUser(Context c, Intent i, ServiceConnection conn, int flags, UserHandle user) {
        if (blockService(c, i)) { log("bindServiceAsUser", i); return false; }
        return c.bindServiceAsUser(i, conn, flags, user);
    }

    public static ComponentName startService(Context c, Intent i) {
        if (blockService(c, i)) { log("startService", i); return null; }
        return c.startService(i);
    }

    public static ComponentName startForegroundService(Context c, Intent i) {
        if (blockService(c, i)) { log("startForegroundService", i); return null; }
        return c.startForegroundService(i);
    }

    public static void sendBroadcast(Context c, Intent i) {
        Intent f = filterBroadcast(c, i);
        if (f == null) { log("sendBroadcast", i); return; }
        c.sendBroadcast(f);
    }

    public static void sendBroadcast(Context c, Intent i, String permission) {
        Intent f = filterBroadcast(c, i);
        if (f == null) { log("sendBroadcast", i); return; }
        c.sendBroadcast(f, permission);
    }

    public static void startActivity(Context c, Intent i) {
        if (blockActivity(c, i)) { log("startActivity", i); return; }
        c.startActivity(i);
    }

    public static void startActivity(Context c, Intent i, Bundle options) {
        if (blockActivity(c, i)) { log("startActivity", i); return; }
        c.startActivity(i, options);
    }

    public static void startActivities(Context c, Intent[] intents) {
        if (intents != null) for (Intent i : intents) {
            if (blockActivity(c, i)) { log("startActivities", i); return; }
        }
        c.startActivities(intents);
    }

    public static void startActivities(Context c, Intent[] intents, Bundle options) {
        if (intents != null) for (Intent i : intents) {
            if (blockActivity(c, i)) { log("startActivities", i); return; }
        }
        c.startActivities(intents, options);
    }

    public static void startActivityForResult(Activity a, Intent i, int requestCode) {
        if (blockActivity(a, i)) { log("startActivityForResult", i); return; }
        a.startActivityForResult(i, requestCode);
    }

    public static void startActivityForResult(Activity a, Intent i, int requestCode, Bundle options) {
        if (blockActivity(a, i)) { log("startActivityForResult", i); return; }
        a.startActivityForResult(i, requestCode, options);
    }

    private static Object filterSystemService(Object service, String name) {
        if (!NoGoogleSettings.bool(NoGoogleSettings.BLOCK_SYSTEM_AI)) return service;
        if (service instanceof TextClassificationManager) {
            // The system text classifier on Google ROMs is Android System Intelligence.
            try {
                ((TextClassificationManager) service).setTextClassifier(TextClassifier.NO_OP);
            } catch (Throwable ignored) {
            }
            return service;
        }
        return service;
    }

    private static boolean blockTranslation() {
        return NoGoogleSettings.bool(NoGoogleSettings.BLOCK_SYSTEM_AI);
    }

    public static Object getSystemService(Context c, String name) {
        if ("translation".equals(name) && blockTranslation()) {
            log("getSystemService", name);
            return null;
        }
        return filterSystemService(c.getSystemService(name), name);
    }

    public static Object getSystemService(Context c, Class<?> cls) {
        if (cls != null && "android.view.translation.TranslationManager".equals(cls.getName())
                && blockTranslation()) {
            log("getSystemService", cls.getName());
            return null;
        }
        return filterSystemService(c.getSystemService(cls), null);
    }

    private static Context ctx() {
        return ContextHolder.get();
    }

    private static boolean blockUri(Uri uri) {
        if (!NoGoogleSettings.bool(NoGoogleSettings.BLOCK_PROVIDERS)) return false;
        return isGoogleUri(ctx(), uri);
    }

    public static Cursor query(ContentResolver r, Uri uri, String[] projection, String selection,
                               String[] selectionArgs, String sortOrder) {
        if (blockUri(uri)) { log("query", uri); return null; }
        return r.query(uri, projection, selection, selectionArgs, sortOrder);
    }

    public static Uri insert(ContentResolver r, Uri uri, ContentValues values) {
        if (blockUri(uri)) { log("insert", uri); return null; }
        return r.insert(uri, values);
    }

    public static int update(ContentResolver r, Uri uri, ContentValues values, String where, String[] args) {
        if (blockUri(uri)) { log("update", uri); return 0; }
        return r.update(uri, values, where, args);
    }

    public static int delete(ContentResolver r, Uri uri, String where, String[] args) {
        if (blockUri(uri)) { log("delete", uri); return 0; }
        return r.delete(uri, where, args);
    }

    public static String getType(ContentResolver r, Uri uri) {
        if (blockUri(uri)) { log("getType", uri); return null; }
        return r.getType(uri);
    }

    public static InputStream openInputStream(ContentResolver r, Uri uri) throws FileNotFoundException {
        if (blockUri(uri)) { log("openInputStream", uri); throw new FileNotFoundException("Blocked: " + uri); }
        return r.openInputStream(uri);
    }

    public static ParcelFileDescriptor openFileDescriptor(ContentResolver r, Uri uri, String mode)
            throws FileNotFoundException {
        if (blockUri(uri)) { log("openFileDescriptor", uri); throw new FileNotFoundException("Blocked: " + uri); }
        return r.openFileDescriptor(uri, mode);
    }

    public static ParcelFileDescriptor openFileDescriptor(ContentResolver r, Uri uri, String mode,
                                                          CancellationSignal signal) throws FileNotFoundException {
        if (blockUri(uri)) { log("openFileDescriptor", uri); throw new FileNotFoundException("Blocked: " + uri); }
        return r.openFileDescriptor(uri, mode, signal);
    }

    public static AssetFileDescriptor openAssetFileDescriptor(ContentResolver r, Uri uri, String mode)
            throws FileNotFoundException {
        if (blockUri(uri)) { log("openAssetFileDescriptor", uri); throw new FileNotFoundException("Blocked: " + uri); }
        return r.openAssetFileDescriptor(uri, mode);
    }

    public static void registerContentObserver(ContentResolver r, Uri uri, boolean descendants,
                                               ContentObserver observer) {
        if (blockUri(uri)) { log("registerContentObserver", uri); return; }
        r.registerContentObserver(uri, descendants, observer);
    }

    public static ContentProviderClient acquireUnstableContentProviderClient(ContentResolver r, Uri uri) {
        if (blockUri(uri)) { log("acquireUnstableContentProviderClient", uri); return null; }
        return r.acquireUnstableContentProviderClient(uri);
    }

    public static ContentProviderClient acquireUnstableContentProviderClient(ContentResolver r, String name) {
        if (isGoogleAuthority(ctx(), name)) { log("acquireUnstableContentProviderClient", name); return null; }
        return r.acquireUnstableContentProviderClient(name);
    }

    public static ContentProviderClient acquireContentProviderClient(ContentResolver r, Uri uri) {
        if (blockUri(uri)) { log("acquireContentProviderClient", uri); return null; }
        return r.acquireContentProviderClient(uri);
    }

    public static ContentProviderClient acquireContentProviderClient(ContentResolver r, String name) {
        if (isGoogleAuthority(ctx(), name)) { log("acquireContentProviderClient", name); return null; }
        return r.acquireContentProviderClient(name);
    }

    public static Bundle call(ContentResolver r, Uri uri, String method, String arg, Bundle extras) {
        if (blockUri(uri)) { log("call", uri); return null; }
        return r.call(uri, method, arg, extras);
    }

    public static Bundle call(ContentResolver r, String authority, String method, String arg, Bundle extras) {
        if (isGoogleAuthority(ctx(), authority)) { log("call", authority); return null; }
        return r.call(authority, method, arg, extras);
    }
}
