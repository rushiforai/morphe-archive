package defpackage;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import com.facebook.FacebookException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.locks.ReentrantLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f94 {
    public static final f94 a = new f94();
    public static final HashSet b = qo7.q(i87.DEVELOPER_ERRORS);
    public static Executor c;
    public static volatile String d;
    public static volatile String e;
    public static String f;
    public static String g;
    public static volatile String h;
    public static volatile Boolean i;
    public static Context j;
    public static int k;
    public static final ReentrantLock l;
    public static final String m;
    public static boolean n;
    public static boolean o;
    public static boolean p;
    public static final AtomicBoolean q;
    public static volatile String r;
    public static volatile String s;
    public static final fm3 t;
    public static boolean u;

    static {
        new AtomicLong(65536L);
        k = 64206;
        l = new ReentrantLock();
        m = "v16.0";
        q = new AtomicBoolean(false);
        r = "instagram.com";
        s = "facebook.com";
        t = new fm3(13);
    }

    public static final Context a() {
        hk7.G();
        Context context = j;
        if (context != null) {
            return context;
        }
        g76.g0("applicationContext");
        throw null;
    }

    public static final String b() {
        hk7.G();
        String str = d;
        if (str != null) {
            return str;
        }
        throw new FacebookException("A valid Facebook app id must be set in the AndroidManifest.xml or set by calling FacebookSdk.setApplicationId before initializing the sdk.");
    }

    public static final Executor c() {
        ReentrantLock reentrantLock = l;
        reentrantLock.lock();
        try {
            if (c == null) {
                c = AsyncTask.THREAD_POOL_EXECUTOR;
            }
            reentrantLock.unlock();
            Executor executor = c;
            if (executor != null) {
                return executor;
            }
            ygf.f("Required value was null.");
            return null;
        } catch (Throwable th) {
            reentrantLock.unlock();
            throw th;
        }
    }

    public static final String d() {
        String str = m;
        String.format("getGraphApiVersion: %s", Arrays.copyOf(new Object[]{str}, 1));
        return str;
    }

    public static final String e() {
        Date date = w3.l;
        w3 w3VarR = wgf.r();
        String str = w3VarR != null ? w3VarR.k : null;
        String str2 = s;
        if (str != null) {
            if (str.equals("gaming")) {
                return tuc.L(str2, "facebook.com", "fb.gg");
            }
            if (str.equals("instagram")) {
                return tuc.L(str2, "facebook.com", "instagram.com");
            }
        }
        return str2;
    }

    public static final boolean f(Context context) {
        hk7.G();
        return context.getSharedPreferences("com.facebook.sdk.appEventPreferences", 0).getBoolean("limitEventUsage", false);
    }

    public static final synchronized boolean g() {
        return u;
    }

    public static final void h(i87 i87Var) {
        i87Var.getClass();
        synchronized (b) {
        }
    }

    public static final void i(Context context) {
        if (context == null) {
            return;
        }
        try {
            ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            applicationInfo.getClass();
            if (applicationInfo.metaData == null) {
                return;
            }
            if (d == null) {
                Object obj = applicationInfo.metaData.get("com.facebook.sdk.ApplicationId");
                if (obj instanceof String) {
                    String str = (String) obj;
                    Locale locale = Locale.ROOT;
                    locale.getClass();
                    String lowerCase = str.toLowerCase(locale);
                    lowerCase.getClass();
                    if (tuc.N(lowerCase, "fb", false)) {
                        d = str.substring(2);
                    } else {
                        d = str;
                    }
                } else if (obj instanceof Number) {
                    throw new FacebookException("App Ids cannot be directly placed in the manifest.They must be prefixed by 'fb' or be placed in the string resource file.");
                }
            }
            f = applicationInfo.metaData.getString("com.facebook.sdk.RedirectURI");
            g = applicationInfo.metaData.getString("com.facebook.sdk.IntentUriPackageTarget");
            if (e == null) {
                e = applicationInfo.metaData.getString("com.facebook.sdk.ApplicationName");
            }
            if (h == null) {
                h = applicationInfo.metaData.getString("com.facebook.sdk.ClientToken");
            }
            if (k == 64206) {
                k = applicationInfo.metaData.getInt("com.facebook.sdk.CallbackOffset", 64206);
            }
            if (i == null) {
                i = Boolean.valueOf(applicationInfo.metaData.getBoolean("com.facebook.sdk.CodelessDebugLogEnabled", false));
            }
        } catch (PackageManager.NameNotFoundException unused) {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0076 A[Catch: all -> 0x0013, TryCatch #1 {, blocks: (B:4:0x0003, B:8:0x000d, B:12:0x0016, B:14:0x0021, B:15:0x0026, B:17:0x0037, B:19:0x003e, B:21:0x0044, B:23:0x0048, B:25:0x004e, B:34:0x0076, B:35:0x0078, B:37:0x007c, B:39:0x0080, B:41:0x0086, B:43:0x008a, B:47:0x009b, B:49:0x00a3, B:51:0x00a7, B:57:0x00bc, B:58:0x00c0, B:59:0x00c5, B:60:0x00c6, B:62:0x00d2, B:65:0x0149, B:66:0x014e, B:44:0x0092, B:45:0x0097, B:46:0x0098, B:67:0x014f, B:68:0x0154, B:32:0x0070, B:69:0x0155, B:70:0x015c, B:71:0x015d, B:72:0x0164, B:73:0x0165, B:74:0x016a, B:54:0x00b2, B:29:0x0063), top: B:80:0x0003, inners: #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x007c A[Catch: all -> 0x0013, TryCatch #1 {, blocks: (B:4:0x0003, B:8:0x000d, B:12:0x0016, B:14:0x0021, B:15:0x0026, B:17:0x0037, B:19:0x003e, B:21:0x0044, B:23:0x0048, B:25:0x004e, B:34:0x0076, B:35:0x0078, B:37:0x007c, B:39:0x0080, B:41:0x0086, B:43:0x008a, B:47:0x009b, B:49:0x00a3, B:51:0x00a7, B:57:0x00bc, B:58:0x00c0, B:59:0x00c5, B:60:0x00c6, B:62:0x00d2, B:65:0x0149, B:66:0x014e, B:44:0x0092, B:45:0x0097, B:46:0x0098, B:67:0x014f, B:68:0x0154, B:32:0x0070, B:69:0x0155, B:70:0x015c, B:71:0x015d, B:72:0x0164, B:73:0x0165, B:74:0x016a, B:54:0x00b2, B:29:0x0063), top: B:80:0x0003, inners: #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x014f A[Catch: all -> 0x0013, TryCatch #1 {, blocks: (B:4:0x0003, B:8:0x000d, B:12:0x0016, B:14:0x0021, B:15:0x0026, B:17:0x0037, B:19:0x003e, B:21:0x0044, B:23:0x0048, B:25:0x004e, B:34:0x0076, B:35:0x0078, B:37:0x007c, B:39:0x0080, B:41:0x0086, B:43:0x008a, B:47:0x009b, B:49:0x00a3, B:51:0x00a7, B:57:0x00bc, B:58:0x00c0, B:59:0x00c5, B:60:0x00c6, B:62:0x00d2, B:65:0x0149, B:66:0x014e, B:44:0x0092, B:45:0x0097, B:46:0x0098, B:67:0x014f, B:68:0x0154, B:32:0x0070, B:69:0x0155, B:70:0x015c, B:71:0x015d, B:72:0x0164, B:73:0x0165, B:74:0x016a, B:54:0x00b2, B:29:0x0063), top: B:80:0x0003, inners: #2, #3 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final synchronized void j(android.content.Context r7) {
        /*
            Method dump skipped, instruction units count: 365
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.f94.j(android.content.Context):void");
    }
}
