package rg;

import android.app.ActivityManager;
import android.app.Application;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import b.u4;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.Feature;
import com.google.android.gms.common.api.GoogleApiActivity;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.UnsupportedApiCallException;
import com.google.android.gms.common.internal.MethodInvocation;
import com.google.android.gms.common.internal.RootTelemetryConfiguration;
import com.google.android.gms.common.internal.TelemetryData;
import com.google.android.gms.internal.measurement.z6;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import p6.p0;
import sg.g0;

/* loaded from: classes.dex */
public final class e implements Handler.Callback {

    /* renamed from: p, reason: collision with root package name */
    public static final Status f85870p = new Status(4, "Sign-out occurred while this API call was in progress.", null, null);

    /* renamed from: q, reason: collision with root package name */
    public static final Status f85871q = new Status(4, "The user must be signed in to make this API call.", null, null);

    /* renamed from: r, reason: collision with root package name */
    public static final Object f85872r = new Object();

    /* renamed from: s, reason: collision with root package name */
    public static e f85873s;

    /* renamed from: a, reason: collision with root package name */
    public long f85874a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f85875b;

    /* renamed from: c, reason: collision with root package name */
    public TelemetryData f85876c;

    /* renamed from: d, reason: collision with root package name */
    public ug.d f85877d;

    /* renamed from: e, reason: collision with root package name */
    public final Context f85878e;

    /* renamed from: f, reason: collision with root package name */
    public final pg.b f85879f;

    /* renamed from: g, reason: collision with root package name */
    public final nx.l f85880g;

    /* renamed from: h, reason: collision with root package name */
    public final AtomicInteger f85881h;

    /* renamed from: i, reason: collision with root package name */
    public final AtomicInteger f85882i;

    /* renamed from: j, reason: collision with root package name */
    public final ConcurrentHashMap f85883j;

    /* renamed from: k, reason: collision with root package name */
    public n f85884k;

    /* renamed from: l, reason: collision with root package name */
    public final z.f f85885l;

    /* renamed from: m, reason: collision with root package name */
    public final z.f f85886m;
    public final z6 n;
    public volatile boolean o;

    public e(Context context, Looper looper) {
        pg.b bVar = pg.b.f82559e;
        this.f85874a = com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c;
        this.f85875b = false;
        this.f85881h = new AtomicInteger(1);
        this.f85882i = new AtomicInteger(0);
        this.f85883j = new ConcurrentHashMap(5, 0.75f, 1);
        this.f85884k = null;
        this.f85885l = new z.f(0);
        this.f85886m = new z.f(0);
        this.o = true;
        this.f85878e = context;
        z6 z6Var = new z6(looper, this);
        this.n = z6Var;
        this.f85879f = bVar;
        this.f85880g = new nx.l(12);
        PackageManager packageManager = context.getPackageManager();
        if (xg.b.f95836f == null) {
            xg.b.f95836f = Boolean.valueOf(packageManager.hasSystemFeature("android.hardware.type.automotive"));
        }
        if (xg.b.f95836f.booleanValue()) {
            this.o = false;
        }
        z6Var.sendMessage(z6Var.obtainMessage(6));
    }

    public static void a() {
        synchronized (f85872r) {
            try {
                e eVar = f85873s;
                if (eVar != null) {
                    eVar.f85882i.incrementAndGet();
                    z6 z6Var = eVar.n;
                    z6Var.sendMessageAtFrontOfQueue(z6Var.obtainMessage(10));
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static Status c(a aVar, ConnectionResult connectionResult) {
        String str = (String) aVar.f85853b.f692c;
        String strValueOf = String.valueOf(connectionResult);
        return new Status(17, b.c0.s(new StringBuilder(String.valueOf(str).length() + 63 + strValueOf.length()), "API: ", str, " is not available on this device. Connection failed with: ", strValueOf), connectionResult.f31780h, connectionResult);
    }

    public static e d(Context context) {
        e eVar;
        HandlerThread handlerThread;
        synchronized (f85872r) {
            if (f85873s == null) {
                synchronized (g0.f87431g) {
                    try {
                        handlerThread = g0.f87433i;
                        if (handlerThread == null) {
                            HandlerThread handlerThread2 = new HandlerThread("GoogleApiHandler", 9);
                            g0.f87433i = handlerThread2;
                            handlerThread2.start();
                            handlerThread = g0.f87433i;
                        }
                    } finally {
                    }
                }
                Looper looper = handlerThread.getLooper();
                Context applicationContext = context.getApplicationContext();
                Object obj = pg.b.f82558d;
                f85873s = new e(applicationContext, looper);
            }
            eVar = f85873s;
        }
        return eVar;
    }

    public final p b(qg.f fVar) {
        a aVar = fVar.f84057f;
        ConcurrentHashMap concurrentHashMap = this.f85883j;
        p pVar = (p) concurrentHashMap.get(aVar);
        if (pVar == null) {
            pVar = new p(this, fVar);
            concurrentHashMap.put(aVar, pVar);
        }
        if (pVar.f85904b.requiresSignIn()) {
            this.f85886m.add(aVar);
        }
        pVar.o();
        return pVar;
    }

    public final void e(n nVar) {
        synchronized (f85872r) {
            try {
                if (this.f85884k != nVar) {
                    this.f85884k = nVar;
                    this.f85885l.clear();
                }
                this.f85885l.addAll(nVar.e());
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean f() {
        if (this.f85875b) {
            return false;
        }
        RootTelemetryConfiguration rootTelemetryConfiguration = (RootTelemetryConfiguration) sg.k.b().f87446a;
        if (rootTelemetryConfiguration != null && !rootTelemetryConfiguration.f31860g) {
            return false;
        }
        int iT = this.f85880g.t(203400000);
        return iT == -1 || iT == 0;
    }

    public final boolean g(ConnectionResult connectionResult, int i5) {
        pg.b bVar = this.f85879f;
        bVar.getClass();
        Context context = this.f85878e;
        if (!zg.a.M(context)) {
            int i11 = connectionResult.f31779g;
            PendingIntent pendingIntentA = connectionResult.f31780h;
            if (!((i11 == 0 || pendingIntentA == null) ? false : true)) {
                pendingIntentA = null;
                Intent intentA = bVar.a(context, i11, null);
                if (intentA != null) {
                    pendingIntentA = n4.f.a(context, intentA);
                }
            }
            if (pendingIntentA != null) {
                bVar.g(context, i11, jh.b.a(context, GoogleApiActivity.a(context, pendingIntentA, i5, true), jh.b.f69561a | 134217728));
                bVar.h(context, connectionResult, false);
                return true;
            }
        }
        return false;
    }

    public final void h(ConnectionResult connectionResult, int i5) {
        if (g(connectionResult, i5)) {
            return;
        }
        z6 z6Var = this.n;
        z6Var.sendMessage(z6Var.obtainMessage(5, i5, 0, connectionResult));
    }

    /* JADX WARN: Removed duplicated region for block: B:136:0x02cb  */
    @Override // android.os.Handler.Callback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean handleMessage(Message message) {
        p pVar;
        boolean z11;
        Feature[] featureArrF;
        int i5 = message.what;
        Context context = this.f85878e;
        z6 z6Var = this.n;
        ConcurrentHashMap concurrentHashMap = this.f85883j;
        switch (i5) {
            case 1:
                this.f85874a = true == ((Boolean) message.obj).booleanValue() ? com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c : 300000L;
                z6Var.removeMessages(12);
                Iterator it = concurrentHashMap.keySet().iterator();
                while (it.hasNext()) {
                    z6Var.sendMessageDelayed(z6Var.obtainMessage(12, (a) it.next()), this.f85874a);
                }
                return true;
            case 2:
                throw u4.d(message.obj);
            case 3:
                for (p pVar2 : concurrentHashMap.values()) {
                    sg.w.d(pVar2.f85915m.n);
                    pVar2.f85913k = null;
                    pVar2.o();
                }
                return true;
            case 4:
            case 8:
            case 13:
                v vVar = (v) message.obj;
                qg.f fVar = vVar.f85930c;
                c0 c0Var = vVar.f85928a;
                p pVarB = (p) concurrentHashMap.get(fVar.f84057f);
                if (pVarB == null) {
                    pVarB = b(fVar);
                }
                if (!pVarB.f85904b.requiresSignIn() || this.f85882i.get() == vVar.f85929b) {
                    pVarB.m(c0Var);
                    return true;
                }
                c0Var.a(f85870p);
                pVarB.n();
                return true;
            case 5:
                int i11 = message.arg1;
                ConnectionResult connectionResult = (ConnectionResult) message.obj;
                Iterator it2 = concurrentHashMap.values().iterator();
                while (true) {
                    if (it2.hasNext()) {
                        pVar = (p) it2.next();
                        if (pVar.f85909g == i11) {
                        }
                    } else {
                        pVar = null;
                    }
                }
                if (pVar == null) {
                    StringBuilder sb2 = new StringBuilder(String.valueOf(i11).length() + 65);
                    sb2.append("Could not find API instance ");
                    sb2.append(i11);
                    sb2.append(" while trying to fail enqueued calls.");
                    Log.wtf("GoogleApiManager", sb2.toString(), new Exception());
                    return true;
                }
                int i12 = connectionResult.f31779g;
                if (i12 != 13) {
                    pVar.g(c(pVar.f85905c, connectionResult));
                    return true;
                }
                this.f85879f.getClass();
                AtomicBoolean atomicBoolean = pg.e.f82564a;
                String strD = ConnectionResult.d(i12);
                String str = connectionResult.f31781i;
                pVar.g(new Status(17, b.c0.s(new StringBuilder(String.valueOf(strD).length() + 69 + String.valueOf(str).length()), "Error resolution was canceled by the user, original error message: ", strD, ": ", str), null, null));
                return true;
            case 6:
                if (context.getApplicationContext() instanceof Application) {
                    c.b((Application) context.getApplicationContext());
                    c cVar = c.f85862e;
                    cVar.a(new o(this));
                    AtomicBoolean atomicBoolean2 = cVar.f85863a;
                    AtomicBoolean atomicBoolean3 = cVar.f85864b;
                    if (atomicBoolean3.get()) {
                        z11 = atomicBoolean2.get();
                        if (!z11) {
                            this.f85874a = 300000L;
                            return true;
                        }
                    } else if (ps.c.v()) {
                        z11 = true;
                        if (!z11) {
                        }
                    } else {
                        ActivityManager.RunningAppProcessInfo runningAppProcessInfo = new ActivityManager.RunningAppProcessInfo();
                        ActivityManager.getMyMemoryState(runningAppProcessInfo);
                        if (!atomicBoolean3.getAndSet(true) && runningAppProcessInfo.importance > 100) {
                            atomicBoolean2.set(true);
                        }
                        z11 = atomicBoolean2.get();
                        if (!z11) {
                        }
                    }
                }
                return true;
            case 7:
                b((qg.f) message.obj);
                return true;
            case 9:
                if (concurrentHashMap.containsKey(message.obj)) {
                    p pVar3 = (p) concurrentHashMap.get(message.obj);
                    sg.w.d(pVar3.f85915m.n);
                    if (pVar3.f85911i) {
                        pVar3.o();
                        return true;
                    }
                }
                return true;
            case 10:
                z.f fVar2 = this.f85886m;
                fVar2.getClass();
                z.a aVar = new z.a(fVar2);
                while (aVar.hasNext()) {
                    p pVar4 = (p) concurrentHashMap.remove((a) aVar.next());
                    if (pVar4 != null) {
                        pVar4.n();
                    }
                }
                fVar2.clear();
                return true;
            case 11:
                if (concurrentHashMap.containsKey(message.obj)) {
                    p pVar5 = (p) concurrentHashMap.get(message.obj);
                    e eVar = pVar5.f85915m;
                    sg.w.d(eVar.n);
                    boolean z12 = pVar5.f85911i;
                    if (z12) {
                        if (z12) {
                            e eVar2 = pVar5.f85915m;
                            a aVar2 = pVar5.f85905c;
                            eVar2.n.removeMessages(11, aVar2);
                            eVar2.n.removeMessages(9, aVar2);
                            pVar5.f85911i = false;
                        }
                        pVar5.g(eVar.f85879f.b(eVar.f85878e, pg.c.f82561a) == 18 ? new Status(21, "Connection timed out waiting for Google Play services update to complete.", null, null) : new Status(22, "API failed to connect while resuming due to an unknown error.", null, null));
                        ((sg.e) pVar5.f85904b).disconnect("Timing out connection while resuming.");
                        return true;
                    }
                }
                return true;
            case 12:
                if (concurrentHashMap.containsKey(message.obj)) {
                    p pVar6 = (p) concurrentHashMap.get(message.obj);
                    sg.w.d(pVar6.f85915m.n);
                    sg.e eVar3 = (sg.e) pVar6.f85904b;
                    if (eVar3.isConnected() && pVar6.f85908f.isEmpty()) {
                        if (pVar6.f85906d.u()) {
                            pVar6.h();
                        } else {
                            eVar3.disconnect("Timing out service connection.");
                        }
                    }
                    return true;
                }
                return true;
            case 14:
                throw u4.d(message.obj);
            case 15:
                q qVar = (q) message.obj;
                if (concurrentHashMap.containsKey(qVar.f85916a)) {
                    p pVar7 = (p) concurrentHashMap.get(qVar.f85916a);
                    if (pVar7.f85912j.contains(qVar) && !pVar7.f85911i) {
                        if (((sg.e) pVar7.f85904b).isConnected()) {
                            pVar7.d();
                            return true;
                        }
                        pVar7.o();
                        return true;
                    }
                }
                return true;
            case 16:
                q qVar2 = (q) message.obj;
                if (concurrentHashMap.containsKey(qVar2.f85916a)) {
                    p pVar8 = (p) concurrentHashMap.get(qVar2.f85916a);
                    if (pVar8.f85912j.remove(qVar2)) {
                        e eVar4 = pVar8.f85915m;
                        eVar4.n.removeMessages(15, qVar2);
                        eVar4.n.removeMessages(16, qVar2);
                        Feature feature = qVar2.f85917b;
                        LinkedList<c0> linkedList = pVar8.f85903a;
                        ArrayList arrayList = new ArrayList(linkedList.size());
                        for (c0 c0Var2 : linkedList) {
                            if ((c0Var2 instanceof u) && (featureArrF = ((u) c0Var2).f(pVar8)) != null && p0.e(featureArrF, feature)) {
                                arrayList.add(c0Var2);
                            }
                        }
                        int size = arrayList.size();
                        for (int i13 = 0; i13 < size; i13++) {
                            c0 c0Var3 = (c0) arrayList.get(i13);
                            linkedList.remove(c0Var3);
                            c0Var3.b(new UnsupportedApiCallException(feature));
                        }
                    }
                }
                return true;
            case 17:
                TelemetryData telemetryData = this.f85876c;
                if (telemetryData != null) {
                    if (telemetryData.d() > 0 || f()) {
                        if (this.f85877d == null) {
                            this.f85877d = p3.i.u(context);
                        }
                        this.f85877d.d(telemetryData);
                    }
                    this.f85876c = null;
                    return true;
                }
                return true;
            case 18:
                t tVar = (t) message.obj;
                long j11 = tVar.f85926c;
                MethodInvocation methodInvocation = tVar.f85924a;
                int i14 = tVar.f85925b;
                if (j11 == 0) {
                    TelemetryData telemetryData2 = new TelemetryData(i14, Arrays.asList(methodInvocation));
                    if (this.f85877d == null) {
                        this.f85877d = p3.i.u(context);
                    }
                    this.f85877d.d(telemetryData2);
                    return true;
                }
                TelemetryData telemetryData3 = this.f85876c;
                if (telemetryData3 != null) {
                    List listL = telemetryData3.l();
                    if (telemetryData3.d() != i14 || (listL != null && listL.size() >= tVar.f85927d)) {
                        z6Var.removeMessages(17);
                        TelemetryData telemetryData4 = this.f85876c;
                        if (telemetryData4 != null) {
                            if (telemetryData4.d() > 0 || f()) {
                                if (this.f85877d == null) {
                                    this.f85877d = p3.i.u(context);
                                }
                                this.f85877d.d(telemetryData4);
                            }
                            this.f85876c = null;
                        }
                    } else {
                        this.f85876c.p(methodInvocation);
                    }
                }
                if (this.f85876c == null) {
                    ArrayList arrayList2 = new ArrayList();
                    arrayList2.add(methodInvocation);
                    this.f85876c = new TelemetryData(i14, arrayList2);
                    z6Var.sendMessageDelayed(z6Var.obtainMessage(17), j11);
                    return true;
                }
                return true;
            case 19:
                this.f85875b = false;
                return true;
            default:
                StringBuilder sb3 = new StringBuilder(String.valueOf(i5).length() + 20);
                sb3.append("Unknown message id: ");
                sb3.append(i5);
                Log.w("GoogleApiManager", sb3.toString());
                return false;
        }
    }
}
