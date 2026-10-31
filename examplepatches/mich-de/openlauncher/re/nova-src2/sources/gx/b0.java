package gx;

import ads_mobile_sdk.gq;
import ads_mobile_sdk.hq;
import android.app.Application;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;
import android.util.Log;
import cw.y1;
import e00.z4;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import t70.p2;
import t70.y0;
import w70.g2;
import w70.o1;
import w70.u1;

/* loaded from: classes4.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final Application f58026a;

    /* renamed from: b, reason: collision with root package name */
    public final g2 f58027b;

    /* renamed from: c, reason: collision with root package name */
    public final dx.d0 f58028c;

    /* renamed from: d, reason: collision with root package name */
    public final y70.d f58029d;

    /* renamed from: e, reason: collision with root package name */
    public final g2 f58030e;

    /* renamed from: f, reason: collision with root package name */
    public final d f58031f;

    /* renamed from: g, reason: collision with root package name */
    public final ex.q f58032g;

    /* renamed from: h, reason: collision with root package name */
    public final ex.f f58033h;

    /* renamed from: i, reason: collision with root package name */
    public final ex.y f58034i;

    /* renamed from: j, reason: collision with root package name */
    public final ex.m f58035j;

    /* renamed from: k, reason: collision with root package name */
    public final ex.z f58036k;

    /* renamed from: l, reason: collision with root package name */
    public final fx.i f58037l;

    /* renamed from: m, reason: collision with root package name */
    public final fx.e f58038m;
    public final ConcurrentHashMap n;
    public final ConcurrentHashMap o;

    /* renamed from: p, reason: collision with root package name */
    public final ConcurrentHashMap f58039p;

    /* renamed from: q, reason: collision with root package name */
    public volatile Function0 f58040q;

    /* renamed from: r, reason: collision with root package name */
    public volatile boolean f58041r;

    /* renamed from: s, reason: collision with root package name */
    public volatile m f58042s;

    /* renamed from: t, reason: collision with root package name */
    public final String f58043t;

    /* renamed from: u, reason: collision with root package name */
    public final AtomicInteger f58044u;

    public b0(Application application, g2 rawConfigFlow, g2 consentFlow, dx.d0 d0Var) {
        Intrinsics.g(rawConfigFlow, "rawConfigFlow");
        Intrinsics.g(consentFlow, "consentFlow");
        this.f58026a = application;
        this.f58027b = consentFlow;
        this.f58028c = d0Var;
        y70.d dVarA = t70.k0.a(CoroutineContext.Element.DefaultImpls.d(t70.m0.d(), y0.f88884a).plus(new t70.i0("NovaAds")));
        this.f58029d = dVarA;
        o1 o1VarZ = u1.z(new y1(rawConfigFlow, 3), dVarA, w70.y1.f94086a, dx.h.a((dx.h) rawConfigFlow.getValue(), dx.h0.f49708a));
        this.f58030e = o1VarZ;
        this.f58031f = new d(((dx.h) o1VarZ.getValue()).f49706b);
        this.f58032g = new ex.q();
        this.f58033h = new ex.f();
        Continuation continuation = null;
        ex.y yVar = new ex.y(new l(1, this, continuation), new f(this, 0), new f(this, 4));
        this.f58034i = yVar;
        this.f58035j = new ex.m(yVar);
        this.f58036k = new ex.z(new bu.k(this, 23));
        ex.u uVar = new ex.u(new f(this, 5));
        this.f58037l = new fx.i(new f(this, 6));
        this.f58038m = new fx.e(uVar, new fx.c(), new p(this, 1));
        this.n = new ConcurrentHashMap();
        this.o = new ConcurrentHashMap();
        this.f58039p = new ConcurrentHashMap();
        this.f58040q = n.f58131a;
        this.f58042s = m.f58121a;
        String string = UUID.randomUUID().toString();
        Intrinsics.f(string, "toString(...)");
        this.f58043t = r70.l.G1(8, string);
        this.f58044u = new AtomicInteger(0);
        t70.m0.t(dVarA, null, null, new j(0, this, continuation), 3);
        t70.m0.t(dVarA, null, null, new j(1, this, continuation), 3);
        t70.m0.t(dVarA, null, null, new j(2, this, continuation), 3);
        t70.m0.t(dVarA, null, null, new l(0, this, continuation), 3);
    }

    /* JADX WARN: Code restructure failed: missing block: B:23:0x00b8, code lost:
    
        if (r13.a(r0) == r1) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00ce, code lost:
    
        if (r13.b(r0) == r1) goto L33;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(b0 b0Var, dx.g0 g0Var, Continuation continuation) {
        o oVar;
        if (continuation instanceof o) {
            oVar = (o) continuation;
            int i5 = oVar.f58141w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                oVar.f58141w = i5 - Integer.MIN_VALUE;
            } else {
                oVar = new o(b0Var, continuation);
            }
        }
        Object obj = oVar.f58139u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = oVar.f58141w;
        Continuation continuation2 = null;
        if (i11 != 0) {
            if (i11 == 1) {
                ResultKt.b(obj);
                return Unit.f71706a;
            }
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            b0Var = oVar.f58138t;
            ResultKt.b(obj);
            if (b0Var.f58041r) {
                Collection<q0> collectionValues = b0Var.n.values();
                Intrinsics.f(collectionValues, "<get-values>(...)");
                for (q0 q0Var : collectionValues) {
                    t70.m0.t(q0Var.f58168g, null, null, new m0(q0Var, continuation2, 1), 3);
                }
            }
            return Unit.f71706a;
        }
        ResultKt.b(obj);
        int iIncrementAndGet = b0Var.f58044u.incrementAndGet();
        String str = b0Var.f58043t;
        String simpleName = Reflection.f71864a.getOrCreateKotlinClass(g0Var.getClass()).getSimpleName();
        boolean z11 = b0Var.f58041r;
        m mVar = b0Var.f58042s;
        StringBuilder sb2 = new StringBuilder("applyConsent #");
        sb2.append(iIncrementAndGet);
        sb2.append(" session=");
        sb2.append(str);
        sb2.append(" state=");
        a80.m.q(simpleName, " mobileAdsInitialized=", " initState=", sb2, z11);
        sb2.append(mVar);
        Log.i("NovaAds", sb2.toString());
        if (!(g0Var instanceof dx.f0)) {
            if (!(g0Var instanceof dx.e0)) {
                throw new NoWhenBranchMatchedException();
            }
            if (!b0Var.f58041r) {
                oVar.f58138t = b0Var;
                oVar.f58141w = 2;
            }
            if (b0Var.f58041r) {
            }
            return Unit.f71706a;
        }
        Collection<q0> collectionValues2 = b0Var.n.values();
        Intrinsics.f(collectionValues2, "<get-values>(...)");
        for (q0 q0Var2 : collectionValues2) {
            t70.m0.t(q0Var2.f58168g, null, null, new j0(q0Var2, continuation2, 1), 3);
        }
        d dVar = b0Var.f58031f;
        oVar.f58141w = 1;
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x01a4  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x01a9  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        q qVar;
        Object objA;
        Object objA2;
        Object objA3;
        b0 b0Var;
        Throwable th2;
        b0 b0Var2;
        dx.j0 j0Var;
        t70.s sVar;
        boolean z11;
        b0 b0Var3;
        long j11;
        if (continuationImpl instanceof q) {
            qVar = (q) continuationImpl;
            int i5 = qVar.f58161z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qVar.f58161z = i5 - Integer.MIN_VALUE;
            } else {
                qVar = new q(this, continuationImpl);
            }
        }
        q qVar2 = qVar;
        Object objD = qVar2.f58159x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qVar2.f58161z;
        int i12 = 2;
        Continuation continuation = null;
        if (i11 != 0) {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                j11 = qVar2.f58158w;
                b0Var3 = qVar2.f58155t;
                ResultKt.b(objD);
                if (objD == null) {
                    Log.i("NovaAds", "MobileAds init session=" + b0Var3.f58043t + " grace " + j11 + "ms elapsed before adapter init complete — marking Completed with partial mediation");
                }
                b0Var3.c();
                return Unit.f71706a;
            }
            sVar = qVar2.f58157v;
            j0Var = qVar2.f58156u;
            b0Var2 = qVar2.f58155t;
            try {
                ResultKt.b(objD);
                long j12 = j0Var.f49729m;
                cv.y yVar = new cv.y(sVar, continuation, 13);
                qVar2.f58155t = b0Var2;
                qVar2.f58156u = null;
                qVar2.f58157v = null;
                qVar2.f58158w = j12;
                qVar2.f58161z = 2;
                objD = p2.d(j12, yVar, qVar2);
                if (objD != coroutineSingletons) {
                    b0Var3 = b0Var2;
                    j11 = j12;
                    if (objD == null) {
                    }
                    b0Var3.c();
                    return Unit.f71706a;
                }
                return coroutineSingletons;
            } catch (Throwable th3) {
                th2 = th3;
                b0Var2.f58042s = m.f58124d;
                Log.e("NovaAds", "MobileAds.initialize() threw synchronously", th2);
                return Unit.f71706a;
            }
        }
        ResultKt.b(objD);
        dx.j0 j0Var2 = ((dx.h) this.f58030e.getValue()).f49706b;
        String str = this.f58043t;
        String str2 = j0Var2.f49717a;
        try {
            int i13 = Result.f71687b;
            hq hqVar = gq.f4020a;
            objA = "1.4.0";
        } catch (Throwable th4) {
            int i14 = Result.f71687b;
            objA = ResultKt.a(th4);
        }
        if (objA instanceof Result.Failure) {
            objA = "?";
        }
        long j13 = j0Var2.f49729m;
        StringBuilder sbW = b.c0.w("initMobileAdsWithGrace START session=", str, " path=newSdk appId=", str2, " gmaVersion=");
        sbW.append(objA);
        sbW.append(" graceMs=");
        sbW.append(j13);
        Log.i("NovaAds", sbW.toString());
        String str3 = this.f58043t;
        Application application = this.f58026a;
        try {
            ApplicationInfo applicationInfo = application.getPackageManager().getApplicationInfo(application.getPackageName(), 128);
            Intrinsics.f(applicationInfo, "getApplicationInfo(...)");
            Bundle bundle = applicationInfo.metaData;
            objA2 = Integer.valueOf(Log.i("NovaAds", "Manifest meta session=" + str3 + " admob=" + (bundle != null ? bundle.getString("com.google.android.gms.ads.APPLICATION_ID") : null) + " facebook=" + (bundle != null ? bundle.getString("com.facebook.sdk.ApplicationId") : null)));
        } catch (Throwable th5) {
            int i15 = Result.f71687b;
            objA2 = ResultKt.a(th5);
        }
        Throwable thA = Result.a(objA2);
        if (thA != null) {
            Log.w("NovaAds", "Manifest meta read failed session=" + str3 + ": " + thA.getMessage());
        }
        try {
            synchronized (li.a.f74951a) {
                z11 = li.a.f74952b;
            }
            objA3 = Boolean.valueOf(z11);
        } catch (Throwable th6) {
            int i16 = Result.f71687b;
            objA3 = ResultKt.a(th6);
        }
        Object obj = Boolean.FALSE;
        if (objA3 instanceof Result.Failure) {
            objA3 = obj;
        }
        if (((Boolean) objA3).booleanValue()) {
            Log.i("NovaAds", "MobileAds.isInitialized=true at entry session=" + this.f58043t + " — short-circuit");
            c();
            return Unit.f71706a;
        }
        this.f58042s = m.f58122b;
        t70.s sVarB = t70.m0.b();
        y70.d dVar = this.f58029d;
        a80.e eVar = y0.f88884a;
        a80.d dVar2 = a80.d.f488c;
        t70.m0.t(dVar, dVar2, null, new z4(i12, continuation, 15), 2);
        try {
            b0Var = this;
            try {
                b10.k kVar = new b10.k(b0Var, j0Var2, sVarB, continuation, 15);
                qVar2.f58155t = b0Var;
                qVar2.f58156u = j0Var2;
                qVar2.f58157v = sVarB;
                qVar2.f58161z = 1;
                if (t70.m0.y(dVar2, kVar, qVar2) != coroutineSingletons) {
                    b0Var2 = b0Var;
                    j0Var = j0Var2;
                    sVar = sVarB;
                    long j122 = j0Var.f49729m;
                    cv.y yVar2 = new cv.y(sVar, continuation, 13);
                    qVar2.f58155t = b0Var2;
                    qVar2.f58156u = null;
                    qVar2.f58157v = null;
                    qVar2.f58158w = j122;
                    qVar2.f58161z = 2;
                    objD = p2.d(j122, yVar2, qVar2);
                    if (objD != coroutineSingletons) {
                    }
                }
                return coroutineSingletons;
            } catch (Throwable th7) {
                th = th7;
                th2 = th;
                b0Var2 = b0Var;
                b0Var2.f58042s = m.f58124d;
                Log.e("NovaAds", "MobileAds.initialize() threw synchronously", th2);
                return Unit.f71706a;
            }
        } catch (Throwable th8) {
            th = th8;
            b0Var = this;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void c() {
        Object[] objArr;
        if (this.f58041r) {
            return;
        }
        this.f58041r = true;
        this.f58042s = m.f58123c;
        this.f58036k.b((dx.h) this.f58030e.getValue());
        Collection collectionValues = ((dx.h) this.f58030e.getValue()).f49705a.values();
        ArrayList arrayList = new ArrayList();
        Iterator it = collectionValues.iterator();
        while (it.hasNext()) {
            b70.d.z0(((dx.q0) it.next()).f49763b, arrayList);
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (true) {
            objArr = 0;
            if (!it2.hasNext()) {
                break;
            }
            dx.f fVar = (dx.f) it2.next();
            dx.c cVar = fVar instanceof dx.c ? (dx.c) fVar : null;
            String str = cVar != null ? cVar.f49688b : null;
            if (str != null) {
                arrayList2.add(str);
            }
        }
        Iterator it3 = b70.g.N1(arrayList2).iterator();
        while (it3.hasNext()) {
            t70.m0.t(this.f58029d, null, null, new s(this, (String) it3.next(), objArr == true ? 1 : 0, 1), 3);
        }
        Collection collectionValues2 = ((dx.h) this.f58030e.getValue()).f49705a.values();
        ArrayList arrayList3 = new ArrayList();
        Iterator it4 = collectionValues2.iterator();
        while (it4.hasNext()) {
            b70.d.z0(((dx.q0) it4.next()).f49763b, arrayList3);
        }
        ArrayList arrayList4 = new ArrayList();
        Iterator it5 = arrayList3.iterator();
        while (it5.hasNext()) {
            dx.f fVar2 = (dx.f) it5.next();
            dx.e eVar = fVar2 instanceof dx.e ? (dx.e) fVar2 : null;
            String str2 = eVar != null ? eVar.f49695a : null;
            if (str2 != null) {
                arrayList4.add(str2);
            }
        }
        Iterator it6 = b70.g.N1(arrayList4).iterator();
        while (it6.hasNext()) {
            this.f58037l.a((String) it6.next());
        }
    }
}
