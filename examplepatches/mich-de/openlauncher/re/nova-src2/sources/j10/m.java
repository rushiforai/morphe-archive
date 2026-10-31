package j10;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import androidx.lifecycle.ProcessLifecycleOwner;
import b10.v0;
import com.teslacoilsw.launcher.NovaApplication;
import cy.t;
import h6.c1;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.e0;
import t70.k0;
import t70.m0;
import t70.y0;
import w70.i2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public static final m f68628a = new m();

    /* renamed from: b, reason: collision with root package name */
    public static final long f68629b;

    /* renamed from: c, reason: collision with root package name */
    public static final long f68630c;

    /* renamed from: d, reason: collision with root package name */
    public static final long f68631d;

    /* renamed from: e, reason: collision with root package name */
    public static final long f68632e;

    /* renamed from: f, reason: collision with root package name */
    public static final Set f68633f;

    /* renamed from: g, reason: collision with root package name */
    public static final y70.d f68634g;

    /* renamed from: h, reason: collision with root package name */
    public static final c80.d f68635h;

    /* renamed from: i, reason: collision with root package name */
    public static final Object f68636i;

    /* renamed from: j, reason: collision with root package name */
    public static final CopyOnWriteArrayList f68637j;

    /* renamed from: k, reason: collision with root package name */
    public static final AtomicBoolean f68638k;

    /* renamed from: l, reason: collision with root package name */
    public static final AtomicBoolean f68639l;

    /* renamed from: m, reason: collision with root package name */
    public static volatile boolean f68640m;
    public static volatile Boolean n;
    public static volatile long o;

    /* renamed from: p, reason: collision with root package name */
    public static volatile Long f68641p;

    /* renamed from: q, reason: collision with root package name */
    public static volatile String f68642q;

    /* renamed from: r, reason: collision with root package name */
    public static volatile Long f68643r;

    /* renamed from: s, reason: collision with root package name */
    public static volatile i f68644s;

    /* renamed from: t, reason: collision with root package name */
    public static final i2 f68645t;

    /* renamed from: u, reason: collision with root package name */
    public static final o1 f68646u;

    static {
        TimeUnit timeUnit = TimeUnit.MINUTES;
        f68629b = timeUnit.toMillis(1L);
        f68630c = TimeUnit.HOURS.toMillis(1L);
        f68631d = TimeUnit.DAYS.toMillis(1L);
        f68632e = timeUnit.toMillis(1L);
        f68633f = kotlin.collections.c.f1(new String[]{"android.permission.ACCESS_FINE_LOCATION", "android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_BACKGROUND_LOCATION"});
        t70.i2 i2VarD = m0.d();
        a80.e eVar = y0.f88884a;
        f68634g = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, a80.d.f488c).plus(new l(e0.f88787a)));
        f68635h = new c80.d();
        f68636i = new Object();
        f68637j = new CopyOnWriteArrayList();
        f68638k = new AtomicBoolean(false);
        f68639l = new AtomicBoolean(false);
        i2 i2VarC = u1.c(Boolean.TRUE);
        f68645t = i2VarC;
        f68646u = new o1(i2VarC);
    }

    public static final boolean a(Context context, String str) {
        return f68633f.contains(str) && i(context);
    }

    public static i b(String str, Boolean bool, boolean z11) {
        if (l(str)) {
            return i.f68618b;
        }
        boolean z12 = str == null || r70.k.U0(str);
        if (bool == null) {
            return i.f68617a;
        }
        if ((!bool.booleanValue() || z12 || !z11) && bool.booleanValue()) {
            return i.f68618b;
        }
        return i.f68619c;
    }

    public static i c(Context context) {
        Context applicationContext = context.getApplicationContext();
        d(applicationContext);
        i iVarB = b(p(applicationContext), n, !j(o, f68631d));
        if (f68644s != iVarB) {
            n(applicationContext, iVarB);
        }
        return iVarB;
    }

    public static void d(Context context) {
        if (f68640m) {
            return;
        }
        synchronized (f68636i) {
            try {
                if (f68640m) {
                    return;
                }
                SharedPreferences sharedPreferences = context.getApplicationContext().getSharedPreferences("korea_location_gate", 0);
                n = sharedPreferences.contains("ip_is_korea") ? Boolean.valueOf(sharedPreferences.getBoolean("ip_is_korea", false)) : null;
                o = sharedPreferences.getLong("ip_checked_at", 0L);
                f68640m = true;
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static List e(Context context, Collection collection) {
        Collection collection2 = collection;
        if (!i(context)) {
            return b70.g.I1(collection2);
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : collection2) {
            if (!f68633f.contains((String) obj)) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static o1 f() {
        return f68646u;
    }

    public static Set g() {
        return f68633f;
    }

    public static void h(NovaApplication novaApplication) {
        Context applicationContext = novaApplication.getApplicationContext();
        d(applicationContext);
        if (f68639l.compareAndSet(false, true)) {
            ProcessLifecycleOwner.f14727c.f14729b.a(new c9.c(applicationContext, 1));
            ConnectivityManager connectivityManager = (ConnectivityManager) applicationContext.getSystemService(ConnectivityManager.class);
            if (connectivityManager != null) {
                try {
                    connectivityManager.registerDefaultNetworkCallback(new k(applicationContext));
                } catch (Exception e3) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("KoreaLocationGate");
                    bVar.c(e3, "could not watch the default network", new Object[0]);
                }
            }
        }
        r(applicationContext);
    }

    public static final boolean i(Context context) {
        i iVarC = c(context);
        if (iVarC == i.f68617a || !j(o, f68630c)) {
            r(context);
        }
        return iVarC != i.f68619c;
    }

    public static boolean j(long j11, long j12) {
        if (n == null) {
            return false;
        }
        long jCurrentTimeMillis = System.currentTimeMillis() - j11;
        return 0 <= jCurrentTimeMillis && jCurrentTimeMillis < j12;
    }

    public static final boolean k(Context context) {
        return c(context) == i.f68618b;
    }

    public static boolean l(String str) {
        return r70.j.B0(str != null ? r70.k.u1(str).toString() : null, "KR", true);
    }

    public static boolean m() {
        Long l9 = f68641p;
        if (l9 == null) {
            return false;
        }
        long jLongValue = l9.longValue();
        long j11 = f68632e;
        long jElapsedRealtime = SystemClock.elapsedRealtime() - jLongValue;
        return 0 <= jElapsedRealtime && jElapsedRealtime < j11;
    }

    public static void n(Context context, i iVar) {
        f68644s = iVar;
        Continuation continuation = null;
        c1.B(iVar != i.f68619c, f68645t, null);
        if (iVar != i.f68618b) {
            f68638k.set(false);
        } else if (f68638k.compareAndSet(false, true)) {
            Iterator it = f68637j.iterator();
            while (it.hasNext()) {
                m0.t(f68634g, null, null, new h6.c((Function2) it.next(), context, continuation, 14), 3);
            }
        }
    }

    public static /* synthetic */ void o(Context context) {
        n(context, b(p(context), n, !j(o, f68631d)));
    }

    public static String p(Context context) {
        String networkCountryIso;
        long jElapsedRealtime = SystemClock.elapsedRealtime();
        Long l9 = f68643r;
        if (l9 != null) {
            long j11 = f68629b;
            long jLongValue = jElapsedRealtime - l9.longValue();
            if (0 <= jLongValue && jLongValue < j11) {
                return f68642q;
            }
        }
        String str = null;
        try {
            Object systemService = context.getSystemService("phone");
            TelephonyManager telephonyManager = systemService instanceof TelephonyManager ? (TelephonyManager) systemService : null;
            if (telephonyManager != null && (networkCountryIso = telephonyManager.getNetworkCountryIso()) != null) {
                String upperCase = networkCountryIso.toUpperCase(Locale.US);
                Intrinsics.f(upperCase, "toUpperCase(...)");
                str = upperCase;
            }
        } catch (Exception unused) {
        }
        f68642q = str;
        f68643r = Long.valueOf(jElapsedRealtime);
        return f68642q;
    }

    public static final void r(Context context) {
        Context applicationContext = context.getApplicationContext();
        d(applicationContext);
        if (j(o, f68630c) || m()) {
            return;
        }
        m0.t(f68634g, null, null, new t(applicationContext, null, 3), 3);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00e0 A[Catch: all -> 0x0037, TryCatch #1 {all -> 0x0037, blocks: (B:15:0x0032, B:49:0x00dc, B:51:0x00e0, B:52:0x010e, B:58:0x0126, B:22:0x004a), top: B:65:0x0021 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r12v11, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r13v0, types: [boolean] */
    /* JADX WARN: Type inference failed for: r13v1 */
    /* JADX WARN: Type inference failed for: r13v2 */
    /* JADX WARN: Type inference failed for: r13v22 */
    /* JADX WARN: Type inference failed for: r13v35 */
    /* JADX WARN: Type inference failed for: r13v5 */
    /* JADX WARN: Type inference failed for: r13v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object q(Context context, boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        j jVar;
        c80.d dVar;
        boolean z12;
        Context applicationContext;
        NetworkCapabilities networkCapabilities;
        Object obj;
        Object obj2;
        String str;
        Object obj3;
        if (continuationImpl instanceof j) {
            jVar = (j) continuationImpl;
            int i5 = jVar.f68626y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                jVar.f68626y = i5 - Integer.MIN_VALUE;
            } else {
                jVar = new j(this, continuationImpl);
            }
        }
        Object obj4 = jVar.f68624w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = jVar.f68626y;
        Continuation continuation = null;
        try {
            try {
                if (i11 == 0) {
                    ResultKt.b(obj4);
                    dVar = f68635h;
                    jVar.f68621t = context;
                    jVar.f68622u = dVar;
                    jVar.f68623v = z11;
                    jVar.f68626y = 1;
                    z12 = z11;
                    if (dVar.e(jVar) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                if (i11 != 1) {
                    if (i11 == 2) {
                        applicationContext = (Context) jVar.f68622u;
                        Object obj5 = (c80.a) jVar.f68621t;
                        ResultKt.b(obj4);
                        obj = obj5;
                        str = null;
                        obj3 = obj;
                        if (str != null) {
                        }
                        l(p(applicationContext));
                        c(applicationContext).toString();
                        o(applicationContext);
                        z11 = obj3;
                        Unit unit = Unit.f71706a;
                        ((c80.d) z11).g(null);
                        return unit;
                    }
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    applicationContext = (Context) jVar.f68622u;
                    Object obj6 = (c80.a) jVar.f68621t;
                    ResultKt.b(obj4);
                    obj2 = obj6;
                    str = (String) obj4;
                    obj3 = obj2;
                    if (str != null) {
                        boolean zL = l(str);
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        n = Boolean.valueOf(zL);
                        o = jCurrentTimeMillis;
                        applicationContext.getApplicationContext().getSharedPreferences("korea_location_gate", 0).edit().putBoolean("ip_is_korea", zL).putLong("ip_checked_at", jCurrentTimeMillis).apply();
                    }
                    l(p(applicationContext));
                    c(applicationContext).toString();
                    o(applicationContext);
                    z11 = obj3;
                    Unit unit2 = Unit.f71706a;
                    ((c80.d) z11).g(null);
                    return unit2;
                }
                boolean z13 = jVar.f68623v;
                ?? r12 = (c80.a) jVar.f68622u;
                Context context2 = (Context) jVar.f68621t;
                ResultKt.b(obj4);
                dVar = r12;
                context = context2;
                z12 = z13;
                applicationContext = context.getApplicationContext();
                d(applicationContext);
                boolean zJ = j(o, f68630c);
                boolean zM = m();
                if ((!z12 || zJ) && (zM || (!z12 && zJ))) {
                    o(applicationContext);
                    z11 = dVar;
                    Unit unit22 = Unit.f71706a;
                    ((c80.d) z11).g(null);
                    return unit22;
                }
                f68641p = new Long(SystemClock.elapsedRealtime());
                if (n != null) {
                    try {
                        ConnectivityManager connectivityManager = (ConnectivityManager) applicationContext.getSystemService(ConnectivityManager.class);
                        networkCapabilities = connectivityManager != null ? connectivityManager.getNetworkCapabilities(connectivityManager.getActiveNetwork()) : null;
                    } catch (Exception unused) {
                    }
                    if (networkCapabilities != null) {
                        if (networkCapabilities.hasTransport(4)) {
                            obj = dVar;
                            str = null;
                            obj3 = obj;
                            if (str != null) {
                            }
                            l(p(applicationContext));
                            c(applicationContext).toString();
                            o(applicationContext);
                            z11 = obj3;
                            Unit unit222 = Unit.f71706a;
                            ((c80.d) z11).g(null);
                            return unit222;
                        }
                    }
                }
                jVar.f68621t = dVar;
                jVar.f68622u = applicationContext;
                jVar.f68626y = 3;
                a80.e eVar = y0.f88884a;
                Object objY = m0.y(a80.d.f488c, new v0(applicationContext, continuation, 19), jVar);
                if (objY != coroutineSingletons) {
                    Object obj7 = dVar;
                    obj4 = objY;
                    obj2 = obj7;
                    str = (String) obj4;
                    obj3 = obj2;
                    if (str != null) {
                    }
                    l(p(applicationContext));
                    c(applicationContext).toString();
                    o(applicationContext);
                    z11 = obj3;
                    Unit unit2222 = Unit.f71706a;
                    ((c80.d) z11).g(null);
                    return unit2222;
                }
                return coroutineSingletons;
            } catch (Throwable th2) {
                th = th2;
                z11 = dVar;
                ((c80.d) z11).g(null);
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }
}
