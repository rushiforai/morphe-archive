package ads_mobile_sdk;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import b.o2;
import b.t2;
import b.x;
import b4.i;
import c80.d;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import k30.d0;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public final class q22 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f8445a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f8446b;

    /* renamed from: c, reason: collision with root package name */
    public final o2 f8447c;

    /* renamed from: d, reason: collision with root package name */
    public final ci3 f8448d;

    /* renamed from: e, reason: collision with root package name */
    public final Set f8449e;

    /* renamed from: f, reason: collision with root package name */
    public ConnectivityManager f8450f;

    /* renamed from: g, reason: collision with root package name */
    public d0 f8451g;

    /* renamed from: h, reason: collision with root package name */
    public final d f8452h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f8453i;

    /* renamed from: j, reason: collision with root package name */
    public long f8454j;

    /* renamed from: k, reason: collision with root package name */
    public ce3 f8455k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicBoolean f8456l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicInteger f8457m;
    public final AtomicInteger n;

    public q22(Context context, t70.j0 backgroundScope, o2 clock, ci3 traceLogger, Set networkChangeListeners) {
        Intrinsics.g(context, "context");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(networkChangeListeners, "networkChangeListeners");
        this.f8445a = context;
        this.f8446b = backgroundScope;
        this.f8447c = clock;
        this.f8448d = traceLogger;
        this.f8449e = networkChangeListeners;
        this.f8452h = new d();
        this.f8453i = true;
        Duration.f72038b.getClass();
        this.f8454j = Duration.l(0L, DurationKt.g(1, DurationUnit.f72046e));
        this.f8456l = new AtomicBoolean(true);
        this.f8457m = new AtomicInteger(0);
        this.n = new AtomicInteger(-1);
    }

    public final int a() {
        return this.f8457m.get();
    }

    public final int b() {
        return this.n.get();
    }

    public final boolean c() {
        return this.f8456l.get();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ContinuationImpl continuationImpl) {
        c22 c22Var;
        q22 q22Var;
        d dVar;
        if (continuationImpl instanceof c22) {
            c22Var = (c22) continuationImpl;
            int i5 = c22Var.f1639e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c22Var.f1639e = i5 - Integer.MIN_VALUE;
            } else {
                c22Var = new c22(this, continuationImpl);
            }
        }
        Object obj = c22Var.f1637c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c22Var.f1639e;
        if (i11 == 0) {
            ResultKt.b(obj);
            c22Var.f1635a = this;
            d dVar2 = this.f8452h;
            c22Var.f1636b = dVar2;
            c22Var.f1639e = 1;
            if (dVar2.e(c22Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            q22Var = this;
            dVar = dVar2;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            dVar = c22Var.f1636b;
            q22Var = c22Var.f1635a;
            ResultKt.b(obj);
        }
        try {
            ce3 ce3Var = q22Var.f8455k;
            Context context = q22Var.f8445a;
            if (ce3Var != null) {
                return ce3Var;
            }
            Intrinsics.g(context, "context");
            String networkOperator = ((TelephonyManager) context.getSystemService(TelephonyManager.class)).getNetworkOperator();
            Intrinsics.f(networkOperator, "getNetworkOperator(...)");
            return new ce3(networkOperator, t2.f(context, null), t2.X(context), ((TelephonyManager) context.getSystemService(TelephonyManager.class)).getPhoneType(), t2.I(context, "android.permission.ACCESS_NETWORK_STATE") ? ((ConnectivityManager) context.getSystemService(ConnectivityManager.class)).isActiveNetworkMetered() : false, t2.e(context));
        } finally {
            dVar.g(null);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        d22 d22Var;
        q22 q22Var;
        if (continuationImpl instanceof d22) {
            d22Var = (d22) continuationImpl;
            int i5 = d22Var.f2162d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d22Var.f2162d = i5 - Integer.MIN_VALUE;
            } else {
                d22Var = new d22(this, continuationImpl);
            }
        }
        d22 d22Var2 = d22Var;
        Object obj = d22Var2.f2160b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d22Var2.f2162d;
        if (i11 == 0) {
            ResultKt.b(obj);
            Duration.Companion companion = Duration.f72038b;
            this.f8447c.getClass();
            long jH = DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d);
            Context context = this.f8445a;
            Object systemService = context.getSystemService((Class<Object>) ConnectivityManager.class);
            Intrinsics.f(systemService, "getSystemService(...)");
            this.f8450f = (ConnectivityManager) systemService;
            b.i8 i8Var = rw0.f9327f;
            if (b.i8.p(context, "android.permission.ACCESS_NETWORK_STATE")) {
                d0 d0Var = new d0(this, 2);
                this.f8451g = d0Var;
                try {
                    if (Build.VERSION.SDK_INT < 31) {
                        ConnectivityManager connectivityManager = this.f8450f;
                        if (connectivityManager == null) {
                            Intrinsics.m("connectivityManager");
                            throw null;
                        }
                        connectivityManager.registerDefaultNetworkCallback(d0Var);
                    } else {
                        ConnectivityManager connectivityManager2 = this.f8450f;
                        if (connectivityManager2 == null) {
                            Intrinsics.m("connectivityManager");
                            throw null;
                        }
                        NetworkRequest networkRequestBuild = new NetworkRequest.Builder().addTransportType(1).addTransportType(0).addTransportType(3).build();
                        d0 d0Var2 = this.f8451g;
                        if (d0Var2 == null) {
                            Intrinsics.m("callback");
                            throw null;
                        }
                        connectivityManager2.registerBestMatchingNetworkCallback(networkRequestBuild, d0Var2, new Handler(Looper.getMainLooper()));
                    }
                } catch (Exception e3) {
                    this.f8448d.a("Failed to register network callbacks.", (Throwable) e3);
                }
            }
            d22Var2.f2159a = this;
            d22Var2.f2162d = 1;
            if (a(jH, null, null, true, d22Var2) == coroutineSingletons) {
                return coroutineSingletons;
            }
            q22Var = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            q22Var = d22Var2.f2159a;
            ResultKt.b(obj);
        }
        xv.f11844a = q22Var;
        return new xu0(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0217 A[LOOP:0: B:100:0x0211->B:102:0x0217, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0170 A[Catch: all -> 0x0178, TRY_LEAVE, TryCatch #1 {all -> 0x0178, blocks: (B:64:0x0168, B:66:0x0170, B:71:0x017a, B:73:0x0198, B:79:0x01a7), top: B:110:0x0168 }] */
    /* JADX WARN: Removed duplicated region for block: B:71:0x017a A[Catch: all -> 0x0178, TRY_ENTER, TryCatch #1 {all -> 0x0178, blocks: (B:64:0x0168, B:66:0x0170, B:71:0x017a, B:73:0x0198, B:79:0x01a7), top: B:110:0x0168 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01ec A[Catch: all -> 0x01ef, TryCatch #2 {all -> 0x01ef, blocks: (B:87:0x01dc, B:89:0x01ec, B:93:0x01f2, B:95:0x01fb, B:97:0x01ff), top: B:111:0x01dc }] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01f1  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01fb A[Catch: all -> 0x01ef, TryCatch #2 {all -> 0x01ef, blocks: (B:87:0x01dc, B:89:0x01ec, B:93:0x01f2, B:95:0x01fb, B:97:0x01ff), top: B:111:0x01dc }] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01fe  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(long j11, Network network, NetworkCapabilities networkCapabilities, boolean z11, ContinuationImpl continuationImpl) {
        l22 l22Var;
        d dVar;
        long j12;
        Network network2;
        NetworkCapabilities networkCapabilities2;
        boolean z12;
        q22 q22Var;
        c80.a aVar;
        q22 q22Var2;
        long j13;
        ce3 ce3Var;
        c80.a aVar2;
        boolean z13;
        long j14;
        String str;
        long j15;
        boolean z14;
        Iterator it;
        if (continuationImpl instanceof l22) {
            l22Var = (l22) continuationImpl;
            int i5 = l22Var.f6047i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                l22Var.f6047i = i5 - Integer.MIN_VALUE;
            } else {
                l22Var = new l22(this, continuationImpl);
            }
        }
        Object obj = l22Var.f6045g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = l22Var.f6047i;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                l22Var.f6039a = this;
                l22Var.f6040b = network;
                l22Var.f6041c = networkCapabilities;
                dVar = this.f8452h;
                l22Var.f6042d = dVar;
                j12 = j11;
                l22Var.f6043e = j12;
                l22Var.f6044f = z11;
                l22Var.f6047i = 1;
                if (dVar.e(l22Var) != coroutineSingletons) {
                    network2 = network;
                    networkCapabilities2 = networkCapabilities;
                    z12 = z11;
                    q22Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    j13 = l22Var.f6043e;
                    aVar = (c80.a) l22Var.f6040b;
                    q22Var2 = l22Var.f6039a;
                    ResultKt.b(obj);
                    try {
                        q22Var2.f8454j = j13;
                        q22Var2.f8453i = true;
                        q22Var2.f8456l.set(true);
                        AtomicInteger atomicInteger = q22Var2.f8457m;
                        ce3 ce3Var2 = q22Var2.f8455k;
                        atomicInteger.set(ce3Var2 == null ? ce3Var2.f1842c : 0);
                        AtomicInteger atomicInteger2 = q22Var2.n;
                        ce3 ce3Var3 = q22Var2.f8455k;
                        atomicInteger2.set(ce3Var3 == null ? ce3Var3.f1841b : -1);
                        Unit unit = Unit.f71706a;
                        ((d) aVar2).g(null);
                        j15 = j13;
                        z14 = true;
                        it = q22Var2.f8449e.iterator();
                        while (it.hasNext()) {
                            zi3.a(q22Var2.f8446b, new i(z14, (x) it.next(), j15, null, 2));
                        }
                        return Unit.f71706a;
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
                boolean z15 = l22Var.f6044f;
                j14 = l22Var.f6043e;
                aVar2 = (c80.a) l22Var.f6041c;
                ce3Var = (ce3) l22Var.f6040b;
                q22Var2 = l22Var.f6039a;
                ResultKt.b(obj);
                z13 = z15;
                try {
                    if (Duration.c(j14, q22Var2.f8454j) > 0) {
                        return Unit.f71706a;
                    }
                    q22Var2.f8454j = j14;
                    q22Var2.f8455k = ce3Var;
                    mu0.a(new p22(j14));
                    q22Var2.f8457m.set(ce3Var.f1842c);
                    q22Var2.n.set(ce3Var.f1841b);
                    if (z13 == q22Var2.f8453i) {
                        return Unit.f71706a;
                    }
                    if (z13) {
                        str = "online";
                    } else {
                        str = "offline";
                    }
                    mu0.b("Device is now ".concat(str), null);
                    q22Var2.f8453i = z13;
                    q22Var2.f8456l.set(z13);
                    Unit unit2 = Unit.f71706a;
                    ((d) aVar2).g(null);
                    j15 = j14;
                    z14 = z13;
                    it = q22Var2.f8449e.iterator();
                    while (it.hasNext()) {
                    }
                    return Unit.f71706a;
                } finally {
                    ((d) aVar2).g(null);
                }
            }
            z12 = l22Var.f6044f;
            j12 = l22Var.f6043e;
            dVar = l22Var.f6042d;
            networkCapabilities2 = (NetworkCapabilities) l22Var.f6041c;
            network2 = (Network) l22Var.f6040b;
            q22Var = l22Var.f6039a;
            ResultKt.b(obj);
            long j16 = q22Var.f8454j;
            d dVar2 = q22Var.f8452h;
            Context context = q22Var.f8445a;
            if (Duration.c(j12, j16) <= 0) {
                return Unit.f71706a;
            }
            boolean z16 = q22Var.f8453i;
            dVar.g(null);
            mu0.a(new m22(j12, z16));
            b.i8 i8Var = rw0.f9327f;
            if (b.i8.p(context, "android.permission.ACCESS_NETWORK_STATE")) {
                if (networkCapabilities2 == null) {
                    if (network2 != null) {
                        ConnectivityManager connectivityManager = q22Var.f8450f;
                        if (connectivityManager == null) {
                            Intrinsics.m("connectivityManager");
                            throw null;
                        }
                        networkCapabilities2 = connectivityManager.getNetworkCapabilities(network2);
                    } else if (z12) {
                        ConnectivityManager connectivityManager2 = q22Var.f8450f;
                        if (connectivityManager2 == null) {
                            Intrinsics.m("connectivityManager");
                            throw null;
                        }
                        networkCapabilities2 = connectivityManager2.getNetworkCapabilities(connectivityManager2.getActiveNetwork());
                    } else {
                        networkCapabilities2 = null;
                    }
                }
                boolean z17 = networkCapabilities2 != null && networkCapabilities2.hasCapability(12) && networkCapabilities2.hasCapability(16);
                mu0.a(new o22(j12, z17));
                String networkOperator = ((TelephonyManager) context.getSystemService(TelephonyManager.class)).getNetworkOperator();
                Intrinsics.f(networkOperator, "getNetworkOperator(...)");
                ce3Var = new ce3(networkOperator, t2.f(context, networkCapabilities2), t2.X(context), ((TelephonyManager) context.getSystemService(TelephonyManager.class)).getPhoneType(), t2.I(context, "android.permission.ACCESS_NETWORK_STATE") ? ((ConnectivityManager) context.getSystemService(ConnectivityManager.class)).isActiveNetworkMetered() : false, t2.e(context));
                l22Var.f6039a = q22Var;
                l22Var.f6040b = ce3Var;
                l22Var.f6041c = dVar2;
                l22Var.f6042d = null;
                l22Var.f6043e = j12;
                l22Var.f6044f = z17;
                l22Var.f6047i = 2;
                if (dVar2.e(l22Var) != coroutineSingletons) {
                    aVar2 = dVar2;
                    z13 = z17;
                    q22Var2 = q22Var;
                    j14 = j12;
                    if (Duration.c(j14, q22Var2.f8454j) > 0) {
                    }
                }
            } else {
                l22Var.f6039a = q22Var;
                l22Var.f6040b = dVar2;
                l22Var.f6041c = null;
                l22Var.f6042d = null;
                l22Var.f6043e = j12;
                l22Var.f6047i = 3;
                if (dVar2.e(l22Var) != coroutineSingletons) {
                    aVar = dVar2;
                    q22Var2 = q22Var;
                    j13 = j12;
                    q22Var2.f8454j = j13;
                    q22Var2.f8453i = true;
                    q22Var2.f8456l.set(true);
                    AtomicInteger atomicInteger3 = q22Var2.f8457m;
                    ce3 ce3Var22 = q22Var2.f8455k;
                    atomicInteger3.set(ce3Var22 == null ? ce3Var22.f1842c : 0);
                    AtomicInteger atomicInteger22 = q22Var2.n;
                    ce3 ce3Var32 = q22Var2.f8455k;
                    atomicInteger22.set(ce3Var32 == null ? ce3Var32.f1841b : -1);
                    Unit unit3 = Unit.f71706a;
                    ((d) aVar2).g(null);
                    j15 = j13;
                    z14 = true;
                    it = q22Var2.f8449e.iterator();
                    while (it.hasNext()) {
                    }
                    return Unit.f71706a;
                }
            }
            return coroutineSingletons;
        } finally {
            dVar.g(null);
        }
    }
}
