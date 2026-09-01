package defpackage;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.PowerManager;
import android.os.SystemClock;
import android.os.WorkSource;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.internal.stats.zzi;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zwe {
    public static volatile ScheduledExecutorService n;
    public static final Object o = new Object();
    public final Object a;
    public final PowerManager.WakeLock b;
    public int c;
    public ScheduledFuture d;
    public long e;
    public final HashSet f;
    public boolean g;
    public yvf h;
    public final y3b i;
    public final String j;
    public final HashMap k;
    public final AtomicInteger l;
    public final ScheduledExecutorService m;

    public zwe(Context context, String str) {
        String packageName = context.getPackageName();
        this.a = new Object();
        this.c = 0;
        this.f = new HashSet();
        this.g = true;
        this.i = y3b.e;
        this.k = new HashMap();
        this.l = new AtomicInteger(0);
        vp7.o(str, "WakeLock: wakeLockName must not be empty");
        context.getApplicationContext();
        WorkSource workSource = null;
        this.h = null;
        if ("com.google.android.gms".equals(context.getPackageName())) {
            this.j = str;
        } else {
            this.j = str.length() != 0 ? "*gcore*:".concat(str) : new String("*gcore*:");
        }
        PowerManager powerManager = (PowerManager) context.getSystemService("power");
        if (powerManager == null) {
            StringBuilder sb = new StringBuilder(29);
            sb.append((CharSequence) "expected a non-null reference", 0, 29);
            throw new zzi(sb.toString());
        }
        this.b = powerManager.newWakeLock(1, str);
        if (z7f.a(context)) {
            int i = luc.a;
            packageName = (packageName == null || packageName.trim().isEmpty()) ? context.getPackageName() : packageName;
            if (context.getPackageManager() != null && packageName != null) {
                try {
                    ApplicationInfo applicationInfo = e9f.a(context).a.getPackageManager().getApplicationInfo(packageName, 0);
                    if (applicationInfo == null) {
                        Log.e("WorkSourceUtil", "Could not get applicationInfo from package: ".concat(packageName));
                    } else {
                        int i2 = applicationInfo.uid;
                        workSource = new WorkSource();
                        Method method = z7f.b;
                        if (method != null) {
                            try {
                                method.invoke(workSource, Integer.valueOf(i2), packageName);
                            } catch (Exception e) {
                                Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource", e);
                            }
                        } else {
                            Method method2 = z7f.a;
                            if (method2 != null) {
                                try {
                                    method2.invoke(workSource, Integer.valueOf(i2));
                                } catch (Exception e2) {
                                    Log.wtf("WorkSourceUtil", "Unable to assign blame through WorkSource", e2);
                                }
                            }
                        }
                    }
                } catch (PackageManager.NameNotFoundException unused) {
                    Log.e("WorkSourceUtil", "Could not find package: ".concat(packageName));
                }
            }
            if (workSource != null) {
                try {
                    this.b.setWorkSource(workSource);
                } catch (ArrayIndexOutOfBoundsException | IllegalArgumentException e3) {
                    Log.wtf("WakeLock", e3.toString());
                }
            }
        }
        ScheduledExecutorService scheduledExecutorServiceUnconfigurableScheduledExecutorService = n;
        if (scheduledExecutorServiceUnconfigurableScheduledExecutorService == null) {
            synchronized (o) {
                try {
                    scheduledExecutorServiceUnconfigurableScheduledExecutorService = n;
                    if (scheduledExecutorServiceUnconfigurableScheduledExecutorService == null) {
                        scheduledExecutorServiceUnconfigurableScheduledExecutorService = Executors.unconfigurableScheduledExecutorService(Executors.newScheduledThreadPool(1));
                        n = scheduledExecutorServiceUnconfigurableScheduledExecutorService;
                    }
                } finally {
                }
            }
        }
        this.m = scheduledExecutorServiceUnconfigurableScheduledExecutorService;
    }

    public final void a(long j) {
        this.l.incrementAndGet();
        long jMax = Math.max(Math.min(Long.MAX_VALUE, 31622400000L), 1L);
        if (j > 0) {
            jMax = Math.min(j, jMax);
        }
        synchronized (this.a) {
            try {
                if (!b()) {
                    this.h = yvf.a;
                    this.b.acquire();
                    this.i.getClass();
                    SystemClock.elapsedRealtime();
                }
                this.c++;
                if (this.g) {
                    TextUtils.isEmpty(null);
                }
                ixf ixfVar = (ixf) this.k.get(null);
                if (ixfVar == null) {
                    ixfVar = new ixf();
                    this.k.put(null, ixfVar);
                }
                ixfVar.a++;
                this.i.getClass();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                long j2 = Long.MAX_VALUE - jElapsedRealtime > jMax ? jElapsedRealtime + jMax : Long.MAX_VALUE;
                if (j2 > this.e) {
                    this.e = j2;
                    ScheduledFuture scheduledFuture = this.d;
                    if (scheduledFuture != null) {
                        scheduledFuture.cancel(false);
                    }
                    this.d = this.m.schedule(new jn(23, this), jMax, TimeUnit.MILLISECONDS);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final boolean b() {
        boolean z;
        synchronized (this.a) {
            z = this.c > 0;
        }
        return z;
    }

    public final void c() {
        if (this.l.decrementAndGet() < 0) {
            Log.e("WakeLock", String.valueOf(this.j).concat(" release without a matched acquire!"));
        }
        synchronized (this.a) {
            try {
                if (this.g) {
                    TextUtils.isEmpty(null);
                }
                if (this.k.containsKey(null)) {
                    ixf ixfVar = (ixf) this.k.get(null);
                    if (ixfVar != null) {
                        int i = ixfVar.a - 1;
                        ixfVar.a = i;
                        if (i == 0) {
                            this.k.remove(null);
                        }
                    }
                } else {
                    Log.w("WakeLock", String.valueOf(this.j).concat(" counter does not exist"));
                }
                f();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void d(boolean z) {
        synchronized (this.a) {
            this.g = z;
        }
    }

    public final void e() {
        HashSet hashSet = this.f;
        if (hashSet.isEmpty()) {
            return;
        }
        ArrayList arrayList = new ArrayList(hashSet);
        hashSet.clear();
        if (arrayList.size() <= 0) {
            return;
        }
        arrayList.get(0).getClass();
        rd6.m();
    }

    public final void f() {
        synchronized (this.a) {
            try {
                if (b()) {
                    if (this.g) {
                        int i = this.c - 1;
                        this.c = i;
                        if (i > 0) {
                            return;
                        }
                    } else {
                        this.c = 0;
                    }
                    e();
                    Iterator it2 = this.k.values().iterator();
                    while (it2.hasNext()) {
                        ((ixf) it2.next()).a = 0;
                    }
                    this.k.clear();
                    ScheduledFuture scheduledFuture = this.d;
                    if (scheduledFuture != null) {
                        scheduledFuture.cancel(false);
                        this.d = null;
                        this.e = 0L;
                    }
                    if (this.b.isHeld()) {
                        try {
                            try {
                                this.b.release();
                                if (this.h != null) {
                                    this.h = null;
                                }
                            } catch (RuntimeException e) {
                                if (!e.getClass().equals(RuntimeException.class)) {
                                    throw e;
                                }
                                Log.e("WakeLock", String.valueOf(this.j).concat(" failed to release!"), e);
                                if (this.h != null) {
                                    this.h = null;
                                }
                            }
                        } catch (Throwable th) {
                            if (this.h != null) {
                                this.h = null;
                            }
                            throw th;
                        }
                    } else {
                        Log.e("WakeLock", String.valueOf(this.j).concat(" should be held!"));
                    }
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
