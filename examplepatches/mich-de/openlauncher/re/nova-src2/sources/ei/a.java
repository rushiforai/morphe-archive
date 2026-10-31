package ei;

import ai.h;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.PowerManager;
import android.os.SystemClock;
import android.os.WorkSource;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.internal.stats.zzi;
import java.lang.reflect.InvocationTargetException;
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
import sg.w;
import xg.c;
import xg.d;

/* loaded from: classes3.dex */
public final class a {
    public static final long o = TimeUnit.DAYS.toMillis(366);

    /* renamed from: p, reason: collision with root package name */
    public static volatile ScheduledExecutorService f52774p = null;

    /* renamed from: q, reason: collision with root package name */
    public static final Object f52775q = new Object();

    /* renamed from: a, reason: collision with root package name */
    public final Object f52776a;

    /* renamed from: b, reason: collision with root package name */
    public final PowerManager.WakeLock f52777b;

    /* renamed from: c, reason: collision with root package name */
    public int f52778c;

    /* renamed from: d, reason: collision with root package name */
    public ScheduledFuture f52779d;

    /* renamed from: e, reason: collision with root package name */
    public long f52780e;

    /* renamed from: f, reason: collision with root package name */
    public final HashSet f52781f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f52782g;

    /* renamed from: h, reason: collision with root package name */
    public rh.a f52783h;

    /* renamed from: i, reason: collision with root package name */
    public final xg.a f52784i;

    /* renamed from: j, reason: collision with root package name */
    public final String f52785j;

    /* renamed from: k, reason: collision with root package name */
    public final Context f52786k;

    /* renamed from: l, reason: collision with root package name */
    public final HashMap f52787l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicInteger f52788m;
    public final ScheduledExecutorService n;

    public a(Context context) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        boolean zBooleanValue;
        String packageName = context.getPackageName();
        this.f52776a = new Object();
        this.f52778c = 0;
        this.f52781f = new HashSet();
        this.f52782g = true;
        this.f52784i = xg.a.f95830a;
        this.f52787l = new HashMap();
        this.f52788m = new AtomicInteger(0);
        w.f("wake:com.google.firebase.iid.WakeLockHolder", "WakeLock: wakeLockName must not be empty");
        this.f52786k = context.getApplicationContext();
        WorkSource workSource = null;
        this.f52783h = null;
        if ("com.google.android.gms".equals(context.getPackageName())) {
            this.f52785j = "wake:com.google.firebase.iid.WakeLockHolder";
        } else {
            this.f52785j = "wake:com.google.firebase.iid.WakeLockHolder".length() != 0 ? "*gcore*:".concat("wake:com.google.firebase.iid.WakeLockHolder") : new String("*gcore*:");
        }
        PowerManager powerManager = (PowerManager) context.getSystemService("power");
        if (powerManager == null) {
            StringBuilder sb2 = new StringBuilder(29);
            sb2.append((CharSequence) "expected a non-null reference", 0, 29);
            throw new zzi(sb2.toString());
        }
        this.f52777b = powerManager.newWakeLock(1, "wake:com.google.firebase.iid.WakeLockHolder");
        Method method = d.f95838a;
        synchronized (d.class) {
            Boolean bool = d.f95842e;
            if (bool != null) {
                zBooleanValue = bool.booleanValue();
            } else {
                zBooleanValue = o4.a.a(context, "android.permission.UPDATE_DEVICE_STATS") == 0;
                d.f95842e = Boolean.valueOf(zBooleanValue);
            }
        }
        if (zBooleanValue) {
            int i5 = c.f95837a;
            packageName = packageName == null || packageName.trim().isEmpty() ? context.getPackageName() : packageName;
            if (context.getPackageManager() != null && packageName != null) {
                try {
                    ApplicationInfo applicationInfoB = zg.b.a(context).b(0, packageName);
                    if (applicationInfoB == null) {
                        Log.e("WorkSourceUtil", "Could not get applicationInfo from package: ".concat(packageName));
                    } else {
                        int i11 = applicationInfoB.uid;
                        workSource = new WorkSource();
                        d.a(workSource, i11, packageName);
                    }
                } catch (PackageManager.NameNotFoundException unused) {
                    Log.e("WorkSourceUtil", "Could not find package: ".concat(packageName));
                }
            }
            if (workSource != null) {
                try {
                    this.f52777b.setWorkSource(workSource);
                } catch (ArrayIndexOutOfBoundsException | IllegalArgumentException e3) {
                    Log.wtf("WakeLock", e3.toString());
                }
            }
        }
        ScheduledExecutorService scheduledExecutorServiceUnconfigurableScheduledExecutorService = f52774p;
        if (scheduledExecutorServiceUnconfigurableScheduledExecutorService == null) {
            synchronized (f52775q) {
                try {
                    scheduledExecutorServiceUnconfigurableScheduledExecutorService = f52774p;
                    if (scheduledExecutorServiceUnconfigurableScheduledExecutorService == null) {
                        scheduledExecutorServiceUnconfigurableScheduledExecutorService = Executors.unconfigurableScheduledExecutorService(Executors.newScheduledThreadPool(1));
                        f52774p = scheduledExecutorServiceUnconfigurableScheduledExecutorService;
                    }
                } finally {
                }
            }
        }
        this.n = scheduledExecutorServiceUnconfigurableScheduledExecutorService;
    }

    public final void a(long j11) {
        this.f52788m.incrementAndGet();
        long jMax = Math.max(Math.min(Long.MAX_VALUE, o), 1L);
        if (j11 > 0) {
            jMax = Math.min(j11, jMax);
        }
        synchronized (this.f52776a) {
            try {
                if (!b()) {
                    this.f52783h = rh.a.f85943a;
                    this.f52777b.acquire();
                    this.f52784i.getClass();
                    SystemClock.elapsedRealtime();
                }
                this.f52778c++;
                if (this.f52782g) {
                    TextUtils.isEmpty(null);
                }
                b bVar = (b) this.f52787l.get(null);
                if (bVar == null) {
                    bVar = new b();
                    this.f52787l.put(null, bVar);
                }
                bVar.f52789a++;
                this.f52784i.getClass();
                long jElapsedRealtime = SystemClock.elapsedRealtime();
                long j12 = Long.MAX_VALUE - jElapsedRealtime > jMax ? jElapsedRealtime + jMax : Long.MAX_VALUE;
                if (j12 > this.f52780e) {
                    this.f52780e = j12;
                    ScheduledFuture scheduledFuture = this.f52779d;
                    if (scheduledFuture != null) {
                        scheduledFuture.cancel(false);
                    }
                    this.f52779d = this.n.schedule(new h(this, 15), jMax, TimeUnit.MILLISECONDS);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean b() {
        boolean z11;
        synchronized (this.f52776a) {
            z11 = this.f52778c > 0;
        }
        return z11;
    }

    public final void c() {
        if (this.f52788m.decrementAndGet() < 0) {
            Log.e("WakeLock", String.valueOf(this.f52785j).concat(" release without a matched acquire!"));
        }
        synchronized (this.f52776a) {
            try {
                if (this.f52782g) {
                    TextUtils.isEmpty(null);
                }
                if (this.f52787l.containsKey(null)) {
                    b bVar = (b) this.f52787l.get(null);
                    if (bVar != null) {
                        int i5 = bVar.f52789a - 1;
                        bVar.f52789a = i5;
                        if (i5 == 0) {
                            this.f52787l.remove(null);
                        }
                    }
                } else {
                    Log.w("WakeLock", String.valueOf(this.f52785j).concat(" counter does not exist"));
                }
                e();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void d() {
        HashSet hashSet = this.f52781f;
        if (hashSet.isEmpty()) {
            return;
        }
        ArrayList arrayList = new ArrayList(hashSet);
        hashSet.clear();
        if (arrayList.size() <= 0) {
            return;
        }
        arrayList.get(0).getClass();
        throw new ClassCastException();
    }

    public final void e() {
        synchronized (this.f52776a) {
            try {
                if (b()) {
                    if (this.f52782g) {
                        int i5 = this.f52778c - 1;
                        this.f52778c = i5;
                        if (i5 > 0) {
                            return;
                        }
                    } else {
                        this.f52778c = 0;
                    }
                    d();
                    Iterator it = this.f52787l.values().iterator();
                    while (it.hasNext()) {
                        ((b) it.next()).f52789a = 0;
                    }
                    this.f52787l.clear();
                    ScheduledFuture scheduledFuture = this.f52779d;
                    if (scheduledFuture != null) {
                        scheduledFuture.cancel(false);
                        this.f52779d = null;
                        this.f52780e = 0L;
                    }
                    if (this.f52777b.isHeld()) {
                        try {
                            try {
                                this.f52777b.release();
                                if (this.f52783h != null) {
                                    this.f52783h = null;
                                }
                            } catch (RuntimeException e3) {
                                if (!e3.getClass().equals(RuntimeException.class)) {
                                    throw e3;
                                }
                                Log.e("WakeLock", String.valueOf(this.f52785j).concat(" failed to release!"), e3);
                                if (this.f52783h != null) {
                                    this.f52783h = null;
                                }
                            }
                        } catch (Throwable th2) {
                            if (this.f52783h != null) {
                                this.f52783h = null;
                            }
                            throw th2;
                        }
                    } else {
                        Log.e("WakeLock", String.valueOf(this.f52785j).concat(" should be held!"));
                    }
                }
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }
}
