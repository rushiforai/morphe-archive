package io.sentry.android.core;

import android.view.Choreographer;
import io.sentry.j3;
import io.sentry.u2;
import io.sentry.v1;
import io.sentry.w1;
import java.lang.reflect.Field;
import java.util.Date;
import java.util.Iterator;
import java.util.TreeSet;
import java.util.UUID;
import java.util.concurrent.ConcurrentSkipListSet;
import java.util.concurrent.TimeUnit;

/* loaded from: classes4.dex */
public final class y0 implements io.sentry.k0, io.sentry.android.core.internal.util.n {

    /* renamed from: h, reason: collision with root package name */
    public static final long f67096h = TimeUnit.SECONDS.toNanos(1);

    /* renamed from: i, reason: collision with root package name */
    public static final j3 f67097i = new j3(new Date(0), 0);

    /* renamed from: a, reason: collision with root package name */
    public final boolean f67098a;

    /* renamed from: c, reason: collision with root package name */
    public final io.sentry.android.core.internal.util.o f67100c;

    /* renamed from: d, reason: collision with root package name */
    public volatile String f67101d;

    /* renamed from: b, reason: collision with root package name */
    public final Object f67099b = new Object();

    /* renamed from: e, reason: collision with root package name */
    public final TreeSet f67102e = new TreeSet(new com.google.firebase.crashlytics.internal.persistence.c(7));

    /* renamed from: f, reason: collision with root package name */
    public final ConcurrentSkipListSet f67103f = new ConcurrentSkipListSet();

    /* renamed from: g, reason: collision with root package name */
    public long f67104g = 16666666;

    public y0(SentryAndroidOptions sentryAndroidOptions, io.sentry.android.core.internal.util.o oVar) {
        this.f67100c = oVar;
        this.f67098a = sentryAndroidOptions.isEnablePerformanceV2() && sentryAndroidOptions.isEnableFramesTracking();
    }

    public static long g(u2 u2Var) {
        if (u2Var instanceof j3) {
            return u2Var.b(f67097i);
        }
        return System.nanoTime() - ((System.currentTimeMillis() * 1000000) - u2Var.d());
    }

    @Override // io.sentry.android.core.internal.util.n
    public final void c(long j11, long j12, long j13, long j14, boolean z11, boolean z12, float f11) {
        ConcurrentSkipListSet concurrentSkipListSet = this.f67103f;
        if (concurrentSkipListSet.size() > 3600) {
            return;
        }
        long j15 = (long) (f67096h / f11);
        this.f67104g = j15;
        if (z11 || z12) {
            concurrentSkipListSet.add(new x0(j11, j12, j13, j14, z11, z12, j15));
        }
    }

    public final void d() {
        synchronized (this.f67099b) {
            try {
                if (this.f67101d != null) {
                    this.f67100c.a(this.f67101d);
                    this.f67101d = null;
                }
                this.f67103f.clear();
                this.f67102e.clear();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:113:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:116:0x01d2 A[Catch: all -> 0x011a, TryCatch #3 {all -> 0x011a, blocks: (B:79:0x011d, B:64:0x00ef, B:68:0x0101, B:72:0x010a, B:74:0x010e, B:76:0x0115, B:130:0x022a, B:81:0x0132, B:83:0x013c, B:85:0x0140, B:87:0x0148, B:93:0x0155, B:98:0x0162, B:102:0x016b, B:104:0x0179, B:108:0x0188, B:110:0x0192, B:112:0x019c, B:114:0x01a1, B:116:0x01d2, B:117:0x01f6, B:105:0x017e), top: B:139:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x014d  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0152  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(io.sentry.q0 q0Var) throws Throwable {
        Object obj;
        int i5;
        int i11;
        long j11;
        long j12;
        long j13;
        long jLongValue;
        int i12;
        int i13;
        int i14;
        Field field;
        Iterator it;
        Object obj2;
        if (!this.f67098a || (q0Var instanceof v1) || (q0Var instanceof w1)) {
            return;
        }
        synchronized (this.f67099b) {
            try {
                if (!this.f67102e.contains(q0Var)) {
                    return;
                }
                Object obj3 = this.f67099b;
                synchronized (obj3) {
                    try {
                        try {
                            if (this.f67102e.remove(q0Var)) {
                                u2 u2VarP = q0Var.p();
                                if (u2VarP != null) {
                                    long jG = g(q0Var.r());
                                    long jG2 = g(u2VarP);
                                    long j14 = jG2 - jG;
                                    if (j14 > 0) {
                                        long j15 = this.f67104g;
                                        if (this.f67103f.isEmpty()) {
                                            obj = obj3;
                                            i5 = 0;
                                            i11 = 0;
                                            j11 = 0;
                                            j12 = 0;
                                            j13 = 0;
                                        } else {
                                            Iterator it2 = this.f67103f.tailSet((ConcurrentSkipListSet) new x0(jG)).iterator();
                                            j11 = 0;
                                            j12 = 0;
                                            j13 = 0;
                                            i5 = 0;
                                            i11 = 0;
                                            while (it2.hasNext()) {
                                                x0 x0Var = (x0) it2.next();
                                                long j16 = x0Var.f67087a;
                                                if (j16 > jG2) {
                                                    break;
                                                }
                                                if (j16 < jG || x0Var.f67088b > jG2) {
                                                    it = it2;
                                                    if ((jG > j16 && jG < x0Var.f67088b) || (jG2 > j16 && jG2 < x0Var.f67088b)) {
                                                        long jMin = Math.min(x0Var.f67090d - Math.max(0L, Math.max(0L, jG - j16) - x0Var.f67093g), j14);
                                                        obj2 = obj3;
                                                        long jMin2 = Math.min(jG2, x0Var.f67088b) - Math.max(jG, x0Var.f67087a);
                                                        long j17 = x0Var.f67093g;
                                                        int i15 = io.sentry.android.core.internal.util.o.f66971p;
                                                        boolean z11 = jMin2 > j17;
                                                        j11 += jMin2;
                                                        if (jMin2 > io.sentry.android.core.internal.util.o.o) {
                                                            j13 += jMin;
                                                            i11++;
                                                        } else if (z11) {
                                                            j12 += jMin;
                                                            i5++;
                                                        }
                                                    }
                                                    j15 = x0Var.f67093g;
                                                    it2 = it;
                                                    obj3 = obj2;
                                                } else {
                                                    long j18 = x0Var.f67089c;
                                                    long j19 = x0Var.f67090d;
                                                    it = it2;
                                                    boolean z12 = x0Var.f67091e;
                                                    j11 += j18;
                                                    if (x0Var.f67092f) {
                                                        j13 += j19;
                                                        i11++;
                                                    } else if (z12) {
                                                        j12 += j19;
                                                        i5++;
                                                    }
                                                }
                                                obj2 = obj3;
                                                j15 = x0Var.f67093g;
                                                it2 = it;
                                                obj3 = obj2;
                                            }
                                            obj = obj3;
                                        }
                                        int iCeil = i5 + i11;
                                        io.sentry.android.core.internal.util.o oVar = this.f67100c;
                                        Choreographer choreographer = oVar.f66981j;
                                        if (choreographer == null || (field = oVar.f66982k) == null) {
                                            jLongValue = -1;
                                            if (jLongValue == -1) {
                                                long jMax = Math.max(0L, jG2 - jLongValue);
                                                if (jMax > j15) {
                                                    i12 = iCeil;
                                                    boolean z13 = jMax > io.sentry.android.core.internal.util.o.o;
                                                    long jMax2 = Math.max(0L, jMax - j15);
                                                    j11 += jMax;
                                                    if (z13) {
                                                        j13 += jMax2;
                                                        i11++;
                                                    } else {
                                                        j12 += jMax2;
                                                        i5++;
                                                    }
                                                    i13 = i5;
                                                    i14 = 1;
                                                } else {
                                                    i12 = iCeil;
                                                    i13 = i5;
                                                    i14 = 0;
                                                }
                                                int i16 = i12 + i14;
                                                long j21 = j14 - j11;
                                                i5 = i13;
                                                iCeil = i16 + (j21 > 0 ? (int) Math.ceil(j21 / j15) : 0);
                                            }
                                            double d5 = (j12 + j13) / 1.0E9d;
                                            q0Var.k(Integer.valueOf(iCeil), "frames.total");
                                            q0Var.k(Integer.valueOf(i5), "frames.slow");
                                            q0Var.k(Integer.valueOf(i11), "frames.frozen");
                                            q0Var.k(Double.valueOf(d5), "frames.delay");
                                            if (q0Var instanceof io.sentry.r0) {
                                                q0Var.g(Integer.valueOf(iCeil), "frames_total");
                                                q0Var.g(Integer.valueOf(i5), "frames_slow");
                                                q0Var.g(Integer.valueOf(i11), "frames_frozen");
                                                q0Var.g(Double.valueOf(d5), "frames_delay");
                                            }
                                        } else {
                                            try {
                                                Long l9 = (Long) field.get(choreographer);
                                                if (l9 != null) {
                                                    jLongValue = l9.longValue();
                                                }
                                            } catch (IllegalAccessException unused) {
                                            }
                                            if (jLongValue == -1) {
                                            }
                                            double d52 = (j12 + j13) / 1.0E9d;
                                            q0Var.k(Integer.valueOf(iCeil), "frames.total");
                                            q0Var.k(Integer.valueOf(i5), "frames.slow");
                                            q0Var.k(Integer.valueOf(i11), "frames.frozen");
                                            q0Var.k(Double.valueOf(d52), "frames.delay");
                                            if (q0Var instanceof io.sentry.r0) {
                                            }
                                        }
                                    }
                                }
                            }
                            synchronized (this.f67099b) {
                                try {
                                    if (this.f67102e.isEmpty()) {
                                        d();
                                    } else {
                                        this.f67103f.headSet((ConcurrentSkipListSet) new x0(g(((io.sentry.q0) this.f67102e.first()).r()))).clear();
                                    }
                                } finally {
                                }
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            throw th;
                        }
                    } catch (Throwable th3) {
                        th = th3;
                    }
                }
            } finally {
            }
        }
    }

    public final void f(io.sentry.q0 q0Var) {
        String str;
        if (!this.f67098a || (q0Var instanceof v1) || (q0Var instanceof w1)) {
            return;
        }
        synchronized (this.f67099b) {
            try {
                this.f67102e.add(q0Var);
                if (this.f67101d == null) {
                    io.sentry.android.core.internal.util.o oVar = this.f67100c;
                    if (oVar.f66978g) {
                        String string = UUID.randomUUID().toString();
                        oVar.f66977f.put(string, this);
                        oVar.c();
                        str = string;
                    } else {
                        str = null;
                    }
                    this.f67101d = str;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
