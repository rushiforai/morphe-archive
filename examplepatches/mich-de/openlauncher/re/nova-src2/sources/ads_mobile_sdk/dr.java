package ads_mobile_sdk;

import android.os.SystemClock;
import b.ed;
import b.o2;
import b.ra;
import b.t2;
import b.x2;
import c80.d;
import e1.e1;
import java.util.concurrent.CancellationException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;
import t70.q0;

/* loaded from: classes.dex */
public abstract class dr extends b.h1 implements x2 {

    /* renamed from: c, reason: collision with root package name */
    public final o2 f2598c;

    /* renamed from: d, reason: collision with root package name */
    public final t70.j0 f2599d;

    /* renamed from: e, reason: collision with root package name */
    public final kz2 f2600e;

    /* renamed from: f, reason: collision with root package name */
    public final jr0 f2601f;

    /* renamed from: g, reason: collision with root package name */
    public final g0 f2602g;

    /* renamed from: h, reason: collision with root package name */
    public final d f2603h;

    /* renamed from: i, reason: collision with root package name */
    public wq f2604i;

    /* renamed from: j, reason: collision with root package name */
    public xq f2605j;

    /* renamed from: k, reason: collision with root package name */
    public t70.g2 f2606k;

    public dr(o2 clock, t70.j0 backgroundScope, kz2 rootTraceCreator, jr0 flags, g0 activityTracker) {
        Intrinsics.g(clock, "clock");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(activityTracker, "activityTracker");
        this.f2598c = clock;
        this.f2599d = backgroundScope;
        this.f2600e = rootTraceCreator;
        this.f2601f = flags;
        this.f2602g = activityTracker;
        this.f2603h = new d();
    }

    public final uv0 a(wq wqVar, xq xqVar) {
        return (wqVar == null || wqVar.a()) ? (wqVar != null && wqVar.a() && c().f3479d) ? uv0.STALE : xqVar != null ? uv0.UPDATING : uv0.EXPIRED : uv0.CACHED;
    }

    public final xq b() {
        yq yqVar = new yq(this, null);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f2599d;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        q0 q0VarE = m0.e(j0Var, context, new e1(yqVar, null, 2), 2);
        Duration.f72038b.getClass();
        return new xq(q0VarE, this.f2598c, Duration.f72039c);
    }

    public final fr c() throws Exception {
        cw0 cw0VarA = a();
        jr0 flags = this.f2601f;
        Intrinsics.g(flags, "flags");
        com.google.gson.r defaultValue = jr0.G;
        Intrinsics.g(defaultValue, "defaultValue");
        jn jnVar = jn.a$19;
        com.google.gson.r rVar = (com.google.gson.r) flags.a("gads:caching_signal_source_ttls_ms", defaultValue, jnVar);
        Duration.Companion companion = Duration.f72038b;
        long jK = t2.k(rVar, defaultValue, cw0VarA, ((Duration) flags.a("gads:default_signal_ttl", ed.k(30, DurationUnit.f72046e, "gads:default_signal_ttl"), u.a$1)).f72041a);
        com.google.gson.r defaultValue2 = jr0.D;
        Intrinsics.g(defaultValue2, "defaultValue");
        boolean zL = t2.L((com.google.gson.r) flags.a("gads:caching_signal_source_automatic_refreshes", defaultValue2, jnVar), defaultValue2, cw0VarA);
        com.google.gson.r defaultValue3 = jr0.F;
        Intrinsics.g(defaultValue3, "defaultValue");
        long jK2 = t2.k((com.google.gson.r) flags.a("gads:caching_signal_source_refresh_buffers_ms", defaultValue3, jnVar), defaultValue3, cw0VarA, DurationKt.g(0, DurationUnit.f72045d));
        com.google.gson.r defaultValue4 = jr0.E;
        Intrinsics.g(defaultValue4, "defaultValue");
        boolean zL2 = t2.L((com.google.gson.r) flags.a("gads:caching_signal_source_stale_results_enabled", defaultValue4, jnVar), defaultValue4, cw0VarA);
        com.google.gson.r defaultValue5 = jr0.H;
        Intrinsics.g(defaultValue5, "defaultValue");
        boolean zL3 = t2.L((com.google.gson.r) flags.a("gads:caching_signal_source_initialization_enabled", defaultValue5, jnVar), defaultValue5, cw0VarA);
        com.google.gson.r defaultValue6 = jr0.I;
        Intrinsics.g(defaultValue6, "defaultValue");
        return new fr(jK, zL, jK2, zL2, zL3, t2.L((com.google.gson.r) flags.a("gads:caching_signal_source_background_refresh_enabled", defaultValue6, jnVar), defaultValue6, cw0VarA));
    }

    public final u53 d() {
        ra raVarO = u53.o();
        Intrinsics.f(raVarO, "newBuilder(...)");
        raVarO.c(c().f3477b);
        raVarO.d(c().f3479d);
        return (u53) raVarO.a();
    }

    public final void g() {
        long jL;
        if ((!this.f2602g.c() || c().f3481f) && c().f3477b && this.f2606k == null) {
            wq wqVar = this.f2604i;
            if (wqVar != null) {
                long j11 = wqVar.f10861b;
                Duration.Companion companion = Duration.f72038b;
                this.f2598c.getClass();
                jL = Duration.l(j11, DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d));
            } else {
                jL = c().f3476a;
            }
            this.f2606k = m0.t(this.f2599d, null, null, new br(Duration.l(jL, c().f3478c), this, null, 0), 3);
        }
    }

    @Override // ads_mobile_sdk.c61
    public Object h(Continuation continuation) {
        return c(this, (ContinuationImpl) continuation);
    }

    public Object k(Continuation continuation) {
        return b(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:115:0x01ef A[Catch: all -> 0x01c9, TRY_LEAVE, TryCatch #3 {all -> 0x01c9, blocks: (B:93:0x01b6, B:95:0x01bd, B:97:0x01c1, B:99:0x01c5, B:102:0x01cc, B:104:0x01d0, B:106:0x01d4, B:108:0x01d8, B:109:0x01d9, B:110:0x01de, B:111:0x01df, B:112:0x01e6, B:113:0x01e7, B:114:0x01ee, B:115:0x01ef), top: B:207:0x01b6 }] */
    /* JADX WARN: Removed duplicated region for block: B:135:0x0247 A[Catch: all -> 0x023f, TryCatch #17 {all -> 0x023f, blocks: (B:125:0x021f, B:127:0x0230, B:129:0x0236, B:134:0x0242, B:135:0x0247, B:137:0x024b, B:140:0x0252, B:141:0x0257), top: B:218:0x021f, outer: #10 }] */
    /* JADX WARN: Removed duplicated region for block: B:141:0x0257 A[Catch: all -> 0x023f, TRY_LEAVE, TryCatch #17 {all -> 0x023f, blocks: (B:125:0x021f, B:127:0x0230, B:129:0x0236, B:134:0x0242, B:135:0x0247, B:137:0x024b, B:140:0x0252, B:141:0x0257), top: B:218:0x021f, outer: #10 }] */
    /* JADX WARN: Removed duplicated region for block: B:145:0x0285 A[Catch: all -> 0x028f, Exception -> 0x0291, TryCatch #9 {Exception -> 0x0291, blocks: (B:143:0x0281, B:145:0x0285, B:150:0x0293, B:152:0x0297, B:163:0x02c2, B:164:0x02c7), top: B:217:0x0281 }] */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0293 A[Catch: all -> 0x028f, Exception -> 0x0291, TryCatch #9 {Exception -> 0x0291, blocks: (B:143:0x0281, B:145:0x0285, B:150:0x0293, B:152:0x0297, B:163:0x02c2, B:164:0x02c7), top: B:217:0x0281 }] */
    /* JADX WARN: Removed duplicated region for block: B:168:0x02de A[Catch: all -> 0x02ba, TRY_LEAVE, TryCatch #15 {all -> 0x02ba, blocks: (B:15:0x003a, B:156:0x02b3, B:166:0x02da, B:168:0x02de, B:165:0x02c8), top: B:221:0x003a }] */
    /* JADX WARN: Removed duplicated region for block: B:178:0x02f8 A[Catch: all -> 0x0304, TryCatch #2 {all -> 0x0304, blocks: (B:176:0x02f1, B:178:0x02f8, B:180:0x02fc, B:182:0x0300, B:185:0x0307, B:187:0x030b, B:189:0x030f, B:191:0x0313, B:192:0x0314, B:193:0x0319, B:194:0x031a, B:195:0x0321, B:196:0x0322, B:197:0x0329, B:198:0x032a), top: B:206:0x02f1 }] */
    /* JADX WARN: Removed duplicated region for block: B:198:0x032a A[Catch: all -> 0x0304, TRY_LEAVE, TryCatch #2 {all -> 0x0304, blocks: (B:176:0x02f1, B:178:0x02f8, B:180:0x02fc, B:182:0x0300, B:185:0x0307, B:187:0x030b, B:189:0x030f, B:191:0x0313, B:192:0x0314, B:193:0x0319, B:194:0x031a, B:195:0x0321, B:196:0x0322, B:197:0x0329, B:198:0x032a), top: B:206:0x02f1 }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x010b A[Catch: all -> 0x0103, TryCatch #1 {all -> 0x0103, blocks: (B:43:0x00e3, B:45:0x00f4, B:47:0x00fa, B:52:0x0106, B:53:0x010b, B:55:0x010f, B:58:0x0116, B:59:0x011b), top: B:205:0x00e3, outer: #13 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x011b A[Catch: all -> 0x0103, TRY_LEAVE, TryCatch #1 {all -> 0x0103, blocks: (B:43:0x00e3, B:45:0x00f4, B:47:0x00fa, B:52:0x0106, B:53:0x010b, B:55:0x010f, B:58:0x0116, B:59:0x011b), top: B:205:0x00e3, outer: #13 }] */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0149 A[Catch: all -> 0x0153, Exception -> 0x0155, TryCatch #4 {Exception -> 0x0155, blocks: (B:61:0x0145, B:63:0x0149, B:68:0x0157, B:70:0x015b, B:81:0x0186, B:82:0x018b), top: B:208:0x0145 }] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x0157 A[Catch: all -> 0x0153, Exception -> 0x0155, TryCatch #4 {Exception -> 0x0155, blocks: (B:61:0x0145, B:63:0x0149, B:68:0x0157, B:70:0x015b, B:81:0x0186, B:82:0x018b), top: B:208:0x0145 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01a2 A[Catch: all -> 0x017e, TRY_LEAVE, TryCatch #16 {all -> 0x017e, blocks: (B:27:0x006c, B:74:0x0177, B:84:0x019e, B:86:0x01a2, B:83:0x018c), top: B:215:0x006c }] */
    /* JADX WARN: Removed duplicated region for block: B:95:0x01bd A[Catch: all -> 0x01c9, TryCatch #3 {all -> 0x01c9, blocks: (B:93:0x01b6, B:95:0x01bd, B:97:0x01c1, B:99:0x01c5, B:102:0x01cc, B:104:0x01d0, B:106:0x01d4, B:108:0x01d8, B:109:0x01d9, B:110:0x01de, B:111:0x01df, B:112:0x01e6, B:113:0x01e7, B:114:0x01ee, B:115:0x01ef), top: B:207:0x01b6 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(dr drVar, ContinuationImpl continuationImpl) {
        zq zqVar;
        th3 th3VarA;
        th3 th3Var;
        Ref.ObjectRef objectRef;
        d dVar;
        Ref.ObjectRef objectRef2;
        th3 th3Var2;
        th3 th3VarA2;
        th3 th3Var3;
        d dVar2;
        Ref.ObjectRef objectRef3;
        Ref.ObjectRef objectRef4;
        th3 th3Var4;
        wq wqVar;
        xq xqVar;
        vq vqVar;
        th3 th3Var5;
        th3 th3Var6;
        Object xu0Var;
        wq wqVar2;
        xq xqVar2;
        vq vqVar2;
        th3 th3Var7;
        th3 th3Var8;
        dr drVar2 = drVar;
        if (continuationImpl instanceof zq) {
            zqVar = (zq) continuationImpl;
            int i5 = zqVar.f12611i;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zqVar.f12611i = i5 - Integer.MIN_VALUE;
            } else {
                zqVar = new zq(drVar2, continuationImpl);
            }
        }
        Object objY = zqVar.f12609g;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zqVar.f12611i;
        if (i11 == 0) {
            ResultKt.b(objY);
            kz2 kz2Var = drVar2.f2600e;
            wv0 wv0Var = wv0.CUI_NAME_SIGNAL;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                th3VarA2 = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    Ref.ObjectRef objectRef5 = new Ref.ObjectRef();
                    Ref.ObjectRef objectRef6 = new Ref.ObjectRef();
                    dVar2 = drVar2.f2603h;
                    zqVar.f12603a = drVar2;
                    zqVar.f12604b = th3VarA2;
                    zqVar.f12605c = th3VarA2;
                    zqVar.f12606d = objectRef5;
                    zqVar.f12607e = objectRef6;
                    zqVar.f12608f = dVar2;
                    zqVar.f12611i = 1;
                    if (dVar2.e(zqVar) != coroutineSingletons) {
                        objectRef3 = objectRef5;
                        objectRef4 = objectRef6;
                        th3Var4 = th3VarA2;
                        drVar2.g();
                        objectRef3.f71863a = drVar2.a(drVar2.f2604i, drVar2.f2605j);
                        wqVar = drVar2.f2604i;
                        if (wqVar == null) {
                            xqVar = drVar2.f2605j;
                            if (xqVar == null) {
                                xq xqVarB = drVar2.b();
                                objectRef4.f71863a = xqVarB;
                                drVar2.f2605j = xqVarB;
                                dVar2.g(null);
                                ji3.a().e().f1804t = new u73(drVar2.a(), (uv0) objectRef3.f71863a, drVar2.d());
                                vqVar = (vq) objectRef4.f71863a;
                                if (!(vqVar instanceof wq)) {
                                }
                            }
                        }
                    }
                } catch (Throwable th2) {
                    th = th2;
                    th3Var3 = th3VarA2;
                    th3Var3.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            } else {
                th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    objectRef = new Ref.ObjectRef();
                    Ref.ObjectRef objectRef7 = new Ref.ObjectRef();
                    dVar = drVar2.f2603h;
                    zqVar.f12603a = drVar2;
                    zqVar.f12604b = th3VarA;
                    zqVar.f12605c = th3VarA;
                    zqVar.f12606d = objectRef;
                    zqVar.f12607e = objectRef7;
                    zqVar.f12608f = dVar;
                    zqVar.f12611i = 3;
                    if (dVar.e(zqVar) != coroutineSingletons) {
                        objectRef2 = objectRef7;
                        th3Var2 = th3VarA;
                        drVar2.g();
                        objectRef.f71863a = drVar2.a(drVar2.f2604i, drVar2.f2605j);
                        wqVar2 = drVar2.f2604i;
                        if (wqVar2 == null) {
                            xqVar2 = drVar2.f2605j;
                            if (xqVar2 == null) {
                                xq xqVarB2 = drVar2.b();
                                objectRef2.f71863a = xqVarB2;
                                drVar2.f2605j = xqVarB2;
                                dVar.g(null);
                                ji3.a().e().f1804t = new u73(drVar2.a(), (uv0) objectRef.f71863a, drVar2.d());
                                vqVar2 = (vq) objectRef2.f71863a;
                                if (!(vqVar2 instanceof wq)) {
                                }
                            }
                        }
                    }
                } catch (Throwable th3) {
                    th = th3;
                    th3Var = th3VarA;
                    th3Var.b(th);
                    if (th instanceof b.a4) {
                    }
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            d dVar3 = zqVar.f12608f;
            Ref.ObjectRef objectRef8 = zqVar.f12607e;
            Ref.ObjectRef objectRef9 = zqVar.f12606d;
            th3VarA2 = zqVar.f12605c;
            th3Var3 = zqVar.f12604b;
            dr drVar3 = (dr) zqVar.f12603a;
            try {
                ResultKt.b(objY);
                objectRef4 = objectRef8;
                th3Var4 = th3VarA2;
                th3VarA2 = th3Var3;
                objectRef3 = objectRef9;
                dVar2 = dVar3;
                drVar2 = drVar3;
            } catch (Throwable th4) {
                th = th4;
                th3Var3.b(th);
                if (th instanceof b.a4) {
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        th3Var3.a(th);
                    }
                    if (!(th instanceof TimeoutCancellationException)) {
                        if (!(th instanceof CancellationException)) {
                            if (th instanceof dv0) {
                                throw th;
                            }
                            throw new iu0(th);
                        }
                        throw new du0(th);
                    }
                    throw new lw0(th);
                }
                throw th;
            }
            try {
                try {
                    drVar2.g();
                    objectRef3.f71863a = drVar2.a(drVar2.f2604i, drVar2.f2605j);
                    wqVar = drVar2.f2604i;
                    if (wqVar == null && (!wqVar.a() || drVar2.c().f3479d)) {
                        objectRef4.f71863a = wqVar;
                        Unit unit = Unit.f71706a;
                    } else {
                        xqVar = drVar2.f2605j;
                        if (xqVar == null && !xqVar.a()) {
                            objectRef4.f71863a = xqVar;
                            Unit unit2 = Unit.f71706a;
                        } else {
                            xq xqVarB3 = drVar2.b();
                            objectRef4.f71863a = xqVarB3;
                            drVar2.f2605j = xqVarB3;
                        }
                    }
                    dVar2.g(null);
                    ji3.a().e().f1804t = new u73(drVar2.a(), (uv0) objectRef3.f71863a, drVar2.d());
                    vqVar = (vq) objectRef4.f71863a;
                    try {
                    } catch (Exception e3) {
                        e = e3;
                        th3Var5 = th3Var4;
                        th3Var6 = th3VarA2;
                        th3 th3VarA3 = ji3.a();
                        th3VarA3.e().f1799m = false;
                        th3VarA3.a(e);
                        xu0Var = new qu0(e, null, null, 6);
                        if (xu0Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var5, null);
                        return xu0Var;
                    }
                    if (!(vqVar instanceof wq)) {
                        xu0Var = new xu0(((wq) vqVar).f11362c);
                        th3Var5 = th3Var4;
                        th3Var6 = th3VarA2;
                        if (xu0Var instanceof pu0) {
                        }
                        CloseableKt.a(th3Var5, null);
                    } else {
                        if (vqVar instanceof xq) {
                            q0 q0Var = ((xq) vqVar).f11794c;
                            zqVar.f12603a = th3VarA2;
                            zqVar.f12604b = th3Var4;
                            zqVar.f12605c = null;
                            zqVar.f12606d = null;
                            zqVar.f12607e = null;
                            zqVar.f12608f = null;
                            zqVar.f12611i = 2;
                            objY = q0Var.y(zqVar);
                            if (objY != coroutineSingletons) {
                                th3Var5 = th3Var4;
                                th3Var6 = th3VarA2;
                                xu0Var = (b.a1) objY;
                                th3VarA2 = th3Var6;
                                th3Var4 = th3Var5;
                                th3Var5 = th3Var4;
                                th3Var6 = th3VarA2;
                                if (xu0Var instanceof pu0) {
                                }
                                CloseableKt.a(th3Var5, null);
                            }
                            return coroutineSingletons;
                        }
                        throw new NoWhenBranchMatchedException();
                    }
                } catch (Throwable th5) {
                    dVar2.g(null);
                    throw th5;
                }
            } catch (Throwable th6) {
                th = th6;
                th3Var3 = th3VarA2;
                th3VarA2 = th3Var4;
                th3Var3.b(th);
                if (th instanceof b.a4) {
                }
            }
        } else if (i11 == 2) {
            th3Var5 = zqVar.f12604b;
            th3Var6 = (th3) zqVar.f12603a;
            try {
                try {
                    ResultKt.b(objY);
                    xu0Var = (b.a1) objY;
                    th3VarA2 = th3Var6;
                    th3Var4 = th3Var5;
                    th3Var5 = th3Var4;
                    th3Var6 = th3VarA2;
                } catch (Exception e11) {
                    e = e11;
                    th3 th3VarA32 = ji3.a();
                    th3VarA32.e().f1799m = false;
                    th3VarA32.a(e);
                    xu0Var = new qu0(e, null, null, 6);
                    if (xu0Var instanceof pu0) {
                    }
                    CloseableKt.a(th3Var5, null);
                    return xu0Var;
                }
                if (xu0Var instanceof pu0) {
                    zi3.a((pu0) xu0Var, false);
                }
                CloseableKt.a(th3Var5, null);
            } catch (Throwable th7) {
                th = th7;
                th3Var3 = th3Var6;
                th3VarA2 = th3Var5;
                try {
                    th3Var3.b(th);
                    if (th instanceof b.a4) {
                    }
                } finally {
                }
            }
        } else if (i11 == 3) {
            d dVar4 = zqVar.f12608f;
            Ref.ObjectRef objectRef10 = zqVar.f12607e;
            objectRef = zqVar.f12606d;
            th3VarA = zqVar.f12605c;
            th3Var = zqVar.f12604b;
            dr drVar4 = (dr) zqVar.f12603a;
            try {
                ResultKt.b(objY);
                dVar = dVar4;
                objectRef2 = objectRef10;
                th3Var2 = th3VarA;
                th3VarA = th3Var;
                drVar2 = drVar4;
                try {
                    try {
                        drVar2.g();
                        objectRef.f71863a = drVar2.a(drVar2.f2604i, drVar2.f2605j);
                        wqVar2 = drVar2.f2604i;
                        if (wqVar2 == null && (!wqVar2.a() || drVar2.c().f3479d)) {
                            objectRef2.f71863a = wqVar2;
                            Unit unit3 = Unit.f71706a;
                        } else {
                            xqVar2 = drVar2.f2605j;
                            if (xqVar2 == null && !xqVar2.a()) {
                                objectRef2.f71863a = xqVar2;
                                Unit unit4 = Unit.f71706a;
                            } else {
                                xq xqVarB22 = drVar2.b();
                                objectRef2.f71863a = xqVarB22;
                                drVar2.f2605j = xqVarB22;
                            }
                        }
                        dVar.g(null);
                        ji3.a().e().f1804t = new u73(drVar2.a(), (uv0) objectRef.f71863a, drVar2.d());
                        vqVar2 = (vq) objectRef2.f71863a;
                        try {
                        } catch (Exception e12) {
                            e = e12;
                            th3Var7 = th3Var2;
                            th3Var8 = th3VarA;
                            th3 th3VarA4 = ji3.a();
                            th3VarA4.e().f1799m = false;
                            th3VarA4.a(e);
                            xu0Var = new qu0(e, null, null, 6);
                            if (xu0Var instanceof pu0) {
                            }
                            CloseableKt.a(th3Var7, null);
                            return xu0Var;
                        }
                        if (!(vqVar2 instanceof wq)) {
                            xu0Var = new xu0(((wq) vqVar2).f11362c);
                            th3Var7 = th3Var2;
                            th3Var8 = th3VarA;
                            if (xu0Var instanceof pu0) {
                            }
                            CloseableKt.a(th3Var7, null);
                        } else {
                            if (vqVar2 instanceof xq) {
                                q0 q0Var2 = ((xq) vqVar2).f11794c;
                                zqVar.f12603a = th3VarA;
                                zqVar.f12604b = th3Var2;
                                zqVar.f12605c = null;
                                zqVar.f12606d = null;
                                zqVar.f12607e = null;
                                zqVar.f12608f = null;
                                zqVar.f12611i = 4;
                                objY = q0Var2.y(zqVar);
                                if (objY != coroutineSingletons) {
                                    th3Var7 = th3Var2;
                                    th3Var8 = th3VarA;
                                    xu0Var = (b.a1) objY;
                                    th3VarA = th3Var8;
                                    th3Var2 = th3Var7;
                                    th3Var7 = th3Var2;
                                    th3Var8 = th3VarA;
                                    if (xu0Var instanceof pu0) {
                                    }
                                    CloseableKt.a(th3Var7, null);
                                }
                                return coroutineSingletons;
                            }
                            throw new NoWhenBranchMatchedException();
                        }
                    } catch (Throwable th8) {
                        th = th8;
                        th3Var = th3VarA;
                        th3VarA = th3Var2;
                        th3Var.b(th);
                        if (th instanceof b.a4) {
                        }
                    }
                } catch (Throwable th9) {
                    dVar.g(null);
                    throw th9;
                }
            } catch (Throwable th10) {
                th = th10;
                th3Var.b(th);
                if (th instanceof b.a4) {
                    if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                        th3Var.a(th);
                    }
                    if (!(th instanceof TimeoutCancellationException)) {
                        if (!(th instanceof CancellationException)) {
                            if (th instanceof dv0) {
                                throw th;
                            }
                            throw new iu0(th);
                        }
                        throw new du0(th);
                    }
                    throw new lw0(th);
                }
                throw th;
            }
        } else {
            if (i11 != 4) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            th3Var7 = zqVar.f12604b;
            th3Var8 = (th3) zqVar.f12603a;
            try {
                try {
                    ResultKt.b(objY);
                    xu0Var = (b.a1) objY;
                    th3VarA = th3Var8;
                    th3Var2 = th3Var7;
                    th3Var7 = th3Var2;
                    th3Var8 = th3VarA;
                } catch (Exception e13) {
                    e = e13;
                    th3 th3VarA42 = ji3.a();
                    th3VarA42.e().f1799m = false;
                    th3VarA42.a(e);
                    xu0Var = new qu0(e, null, null, 6);
                    if (xu0Var instanceof pu0) {
                    }
                    CloseableKt.a(th3Var7, null);
                    return xu0Var;
                }
                if (xu0Var instanceof pu0) {
                    zi3.a((pu0) xu0Var, false);
                }
                CloseableKt.a(th3Var7, null);
            } catch (Throwable th11) {
                th = th11;
                th3Var = th3Var8;
                th3VarA = th3Var7;
                try {
                    th3Var.b(th);
                    if (th instanceof b.a4) {
                    }
                } finally {
                    try {
                        throw th;
                    } finally {
                    }
                }
            }
        }
        return xu0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(dr drVar, ContinuationImpl continuationImpl) {
        ar arVar;
        d dVar;
        Object obj;
        uv0 uv0Var = uv0.CACHED;
        uv0 uv0Var2 = uv0.STALE;
        if (continuationImpl instanceof ar) {
            arVar = (ar) continuationImpl;
            int i5 = arVar.f1072e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                arVar.f1072e = i5 - Integer.MIN_VALUE;
            } else {
                arVar = new ar(drVar, continuationImpl);
            }
        }
        Object obj2 = arVar.f1070c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = arVar.f1072e;
        if (i11 == 0) {
            ResultKt.b(obj2);
            dVar = drVar.f2603h;
            arVar.f1068a = drVar;
            arVar.f1069b = dVar;
            arVar.f1072e = 1;
            if (dVar.e(arVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = arVar.f1069b;
            dr drVar2 = arVar.f1068a;
            ResultKt.b(obj2);
            dVar = dVar2;
            drVar = drVar2;
        }
        try {
            drVar.g();
            wq wqVar = drVar.f2604i;
            if (wqVar == null || (wqVar.a() && !drVar.c().f3479d)) {
                xq xqVar = drVar.f2605j;
                if (xqVar == null || xqVar.a()) {
                    drVar.f2605j = drVar.b();
                }
                dVar.g(null);
                return null;
            }
            kz2 kz2Var = drVar.f2600e;
            wv0 wv0Var = wv0.CUI_NAME_SIGNAL;
            EmptyList emptyList = EmptyList.f71733a;
            mi3 mi3Var = new mi3(new ur2(), new fh1(), new tu2(), new s8());
            if (ji3.b().f4777a == null) {
                em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
                try {
                    if (wqVar.a()) {
                        uv0Var = uv0Var2;
                    }
                    ji3.a().e().f1804t = new u73(drVar.a(), uv0Var, drVar.d());
                    obj = wqVar.f11362c;
                    if (obj instanceof pu0) {
                        zi3.a((pu0) obj, false);
                    }
                    em2VarA.close();
                } catch (Throwable th2) {
                    try {
                        em2VarA.b(th2);
                        if (!(th2 instanceof b.a4)) {
                            if (!(th2 instanceof TimeoutCancellationException) && !(th2 instanceof CancellationException)) {
                                em2VarA.a(th2);
                            }
                            if (!(th2 instanceof TimeoutCancellationException)) {
                                if (!(th2 instanceof CancellationException)) {
                                    if (th2 instanceof dv0) {
                                        throw th2;
                                    }
                                    throw new iu0(th2);
                                }
                                throw new du0(th2);
                            }
                            throw new lw0(th2);
                        }
                        throw th2;
                    } finally {
                    }
                }
            } else {
                th3 th3VarA = ji3.a(wv0Var, emptyList, true);
                try {
                    if (wqVar.a()) {
                        uv0Var = uv0Var2;
                    }
                    ji3.a().e().f1804t = new u73(drVar.a(), uv0Var, drVar.d());
                    obj = wqVar.f11362c;
                    if (obj instanceof pu0) {
                        zi3.a((pu0) obj, false);
                    }
                    th3VarA.close();
                } catch (Throwable th3) {
                    try {
                        th3VarA.b(th3);
                        if (!(th3 instanceof b.a4)) {
                            if (!(th3 instanceof TimeoutCancellationException) && !(th3 instanceof CancellationException)) {
                                th3VarA.a(th3);
                            }
                            if (!(th3 instanceof TimeoutCancellationException)) {
                                if (!(th3 instanceof CancellationException)) {
                                    if (th3 instanceof dv0) {
                                        throw th3;
                                    }
                                    throw new iu0(th3);
                                }
                                throw new du0(th3);
                            }
                            throw new lw0(th3);
                        }
                        throw th3;
                    } finally {
                    }
                }
            }
            dVar.g(null);
            return obj;
        } catch (Throwable th4) {
            dVar.g(null);
            throw th4;
        }
    }

    @Override // b.x2
    public final Object c(Continuation continuation) {
        return a(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(dr drVar, ContinuationImpl continuationImpl) {
        cr crVar;
        if (continuationImpl instanceof cr) {
            crVar = (cr) continuationImpl;
            int i5 = crVar.f1981c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                crVar.f1981c = i5 - Integer.MIN_VALUE;
            } else {
                crVar = new cr(drVar, continuationImpl);
            }
        }
        Object obj = crVar.f1979a;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = crVar.f1981c;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (drVar.c().f3480e) {
                crVar.f1981c = 1;
                if (drVar.k(crVar) == obj2) {
                    return obj2;
                }
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return new xu0(Unit.f71706a);
    }
}
