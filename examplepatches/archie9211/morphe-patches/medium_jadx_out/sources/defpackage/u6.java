package defpackage;

import android.app.Application;
import java.lang.ref.WeakReference;
import java.util.UUID;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class u6 {
    public static final String a;
    public static final ScheduledExecutorService b;
    public static final ScheduledExecutorService c;
    public static volatile ScheduledFuture d;
    public static final Object e;
    public static final AtomicInteger f;
    public static volatile e8 g;
    public static final AtomicBoolean h;
    public static String i;
    public static long j;
    public static int k;
    public static WeakReference l;
    public static String m;

    static {
        String canonicalName = u6.class.getCanonicalName();
        if (canonicalName == null) {
            canonicalName = "com.facebook.appevents.internal.ActivityLifecycleTracker";
        }
        a = canonicalName;
        b = Executors.newSingleThreadScheduledExecutor();
        c = Executors.newSingleThreadScheduledExecutor();
        e = new Object();
        f = new AtomicInteger(0);
        h = new AtomicBoolean(false);
    }

    public static void a() {
        ScheduledFuture scheduledFuture;
        synchronized (e) {
            try {
                if (d != null && (scheduledFuture = d) != null) {
                    scheduledFuture.cancel(false);
                }
                d = null;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static final UUID b() {
        e8 e8Var;
        if (g == null || (e8Var = g) == null) {
            return null;
        }
        return (UUID) e8Var.d;
    }

    public static final void c(Application application, String str) {
        int i2 = 0;
        if (h.compareAndSet(false, true)) {
            na4.a(new j34(), ka4.CodelessEvents);
            i = str;
            application.registerActivityLifecycleCallbacks(new t6(i2));
        }
    }
}
