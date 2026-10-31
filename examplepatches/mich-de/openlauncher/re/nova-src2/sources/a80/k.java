package a80;

import java.util.concurrent.TimeUnit;
import y70.v;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public static final String f496a;

    /* renamed from: b, reason: collision with root package name */
    public static final long f497b;

    /* renamed from: c, reason: collision with root package name */
    public static final int f498c;

    /* renamed from: d, reason: collision with root package name */
    public static final int f499d;

    /* renamed from: e, reason: collision with root package name */
    public static final long f500e;

    /* renamed from: f, reason: collision with root package name */
    public static final g f501f;

    static {
        String property;
        int i5 = v.f96828a;
        try {
            property = System.getProperty("kotlinx.coroutines.scheduler.default.name");
        } catch (SecurityException unused) {
            property = null;
        }
        if (property == null) {
            property = "DefaultDispatcher";
        }
        f496a = property;
        f497b = y70.g.g("kotlinx.coroutines.scheduler.resolution.ns", 100000L, 1L, Long.MAX_VALUE);
        int i11 = v.f96828a;
        if (i11 < 2) {
            i11 = 2;
        }
        f498c = y70.g.h(i11, 8, "kotlinx.coroutines.scheduler.core.pool.size");
        f499d = y70.g.h(2097150, 4, "kotlinx.coroutines.scheduler.max.pool.size");
        f500e = TimeUnit.SECONDS.toNanos(y70.g.g("kotlinx.coroutines.scheduler.keep.alive.sec", 60L, 1L, Long.MAX_VALUE));
        f501f = g.f491a;
    }
}
