package ads_mobile_sdk;

import android.view.View;
import b.b9;
import b.ed;
import c80.d;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CancellationException;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import t70.m0;
import t70.p0;
import t70.t0;

/* loaded from: classes2.dex */
public final class i82 extends o50.j implements b9 {

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f4670c;

    /* renamed from: d, reason: collision with root package name */
    public final com.google.gson.r f4671d;

    /* renamed from: e, reason: collision with root package name */
    public final z1 f4672e;

    /* renamed from: f, reason: collision with root package name */
    public final x52 f4673f;

    /* renamed from: g, reason: collision with root package name */
    public final it1 f4674g;

    /* renamed from: h, reason: collision with root package name */
    public final z03 f4675h;

    /* renamed from: i, reason: collision with root package name */
    public final d f4676i;

    /* renamed from: j, reason: collision with root package name */
    public t70.g2 f4677j;

    /* renamed from: k, reason: collision with root package name */
    public tx0 f4678k;

    /* renamed from: l, reason: collision with root package name */
    public b.v3 f4679l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f4680m;
    public final List n;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i82(CoroutineContext uiContext, t70.j0 backgroundScope, com.google.gson.r nativeAdJson, z1 adConfiguration, x52 omid, it1 nativeAdAssets, jr0 flags, z03 safeBrowsingManager) {
        super(flags, uiContext);
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(nativeAdJson, "nativeAdJson");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(omid, "omid");
        Intrinsics.g(nativeAdAssets, "nativeAdAssets");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
        this.f4670c = backgroundScope;
        this.f4671d = nativeAdJson;
        this.f4672e = adConfiguration;
        this.f4673f = omid;
        this.f4674g = nativeAdAssets;
        this.f4675h = safeBrowsingManager;
        this.f4676i = new d();
        q82 q82Var = nativeAdAssets.n;
        this.f4680m = (q82Var != null ? q82Var.f8517a : null) == p82.f8135a;
        this.n = Collections.synchronizedList(new ArrayList());
    }

    /* JADX WARN: Code restructure failed: missing block: B:52:0x00df, code lost:
    
        if (r12.a(r0) == r1) goto L53;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00d1 A[Catch: all -> 0x0036, PHI: r2 r11
      0x00d1: PHI (r2v11 ads_mobile_sdk.i82) = (r2v7 ads_mobile_sdk.i82), (r2v10 ads_mobile_sdk.i82), (r2v14 ads_mobile_sdk.i82) binds: [B:48:0x00cf, B:44:0x00ca, B:22:0x0045] A[DONT_GENERATE, DONT_INLINE]
      0x00d1: PHI (r11v9 c80.d) = (r11v6 c80.d), (r11v20 c80.d), (r11v21 c80.d) binds: [B:48:0x00cf, B:44:0x00ca, B:22:0x0045] A[DONT_GENERATE, DONT_INLINE], TryCatch #0 {all -> 0x0036, blocks: (B:15:0x0031, B:55:0x00e3, B:22:0x0045, B:49:0x00d1, B:51:0x00d5, B:25:0x004e, B:43:0x00a0), top: B:61:0x0023 }] */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d5 A[Catch: all -> 0x0036, TryCatch #0 {all -> 0x0036, blocks: (B:15:0x0031, B:55:0x00e3, B:22:0x0045, B:49:0x00d1, B:51:0x00d5, B:25:0x004e, B:43:0x00a0), top: B:61:0x0023 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v0, types: [ads_mobile_sdk.i82] */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v10 */
    /* JADX WARN: Type inference failed for: r11v12, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r11v14, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r11v15, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r11v18 */
    /* JADX WARN: Type inference failed for: r11v19 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object b(i82 i82Var, ContinuationImpl continuationImpl) throws Throwable {
        z72 z72Var;
        d dVar;
        Throwable th2;
        i82 i82Var2;
        i82 i82Var3;
        d dVar2;
        d dVar3;
        long j11;
        tx0 tx0Var;
        i82 i82Var4;
        if (continuationImpl instanceof z72) {
            z72Var = (z72) continuationImpl;
            int i5 = z72Var.f12472e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                z72Var.f12472e = i5 - Integer.MIN_VALUE;
            } else {
                z72Var = new z72(i82Var, continuationImpl);
            }
        }
        Object obj = z72Var.f12470c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = z72Var.f12472e;
        int i12 = 1;
        Continuation continuation = null;
        try {
        } catch (Throwable th3) {
            dVar = i82Var;
            th2 = th3;
        }
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = i82Var.f4676i;
                z72Var.f12468a = i82Var;
                z72Var.f12469b = dVar;
                z72Var.f12472e = 1;
                i82Var2 = i82Var;
                if (dVar.e(z72Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 == 2) {
                    ?? r11 = z72Var.f12469b;
                    i82Var3 = z72Var.f12468a;
                    ResultKt.b(obj);
                    dVar3 = r11;
                    jr0 jr0Var = (jr0) i82Var3.f79577b;
                    jr0Var.getClass();
                    Duration.Companion companion = Duration.f72038b;
                    j11 = ((Duration) jr0Var.a("gads:omid:destroy_webview_delay", new Duration(DurationKt.g(2, DurationUnit.f72046e)), u.a$1)).f72041a;
                    z72Var.f12468a = i82Var3;
                    z72Var.f12469b = dVar3;
                    z72Var.f12472e = 3;
                    dVar2 = dVar3;
                    if (t0.c(j11, z72Var) == coroutineSingletons) {
                        tx0Var = i82Var3.f4678k;
                        if (tx0Var != null) {
                        }
                        i82Var4 = i82Var3;
                        i82Var = dVar2;
                        i82Var4.f4677j = null;
                        i82Var4.f4679l = null;
                        i82Var4.f4678k = null;
                        Unit unit = Unit.f71706a;
                        ((d) i82Var).g(null);
                        return unit;
                    }
                    return coroutineSingletons;
                }
                if (i11 != 3) {
                    if (i11 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    c80.a aVar = z72Var.f12469b;
                    i82Var4 = z72Var.f12468a;
                    ResultKt.b(obj);
                    i82Var = aVar;
                    i82Var4.f4677j = null;
                    i82Var4.f4679l = null;
                    i82Var4.f4678k = null;
                    Unit unit2 = Unit.f71706a;
                    ((d) i82Var).g(null);
                    return unit2;
                }
                ?? r112 = z72Var.f12469b;
                i82Var3 = z72Var.f12468a;
                ResultKt.b(obj);
                dVar2 = r112;
                tx0Var = i82Var3.f4678k;
                if (tx0Var != null) {
                    z72Var.f12468a = i82Var3;
                    z72Var.f12469b = dVar2;
                    z72Var.f12472e = 4;
                }
                i82Var4 = i82Var3;
                i82Var = dVar2;
                i82Var4.f4677j = null;
                i82Var4.f4679l = null;
                i82Var4.f4678k = null;
                Unit unit22 = Unit.f71706a;
                ((d) i82Var).g(null);
                return unit22;
            }
            ?? r113 = z72Var.f12469b;
            i82 i82Var5 = z72Var.f12468a;
            ResultKt.b(obj);
            dVar = r113;
            i82Var2 = i82Var5;
            t70.g2 g2Var = i82Var2.f4677j;
            if (g2Var != null) {
                g2Var.c(null);
            }
            p0 p0Var = i82Var2.f4674g.o;
            if (p0Var != null) {
                p0Var.c(null);
            }
            i82Var2.n.clear();
            b.v3 v3Var = i82Var2.f4679l;
            if (v3Var == null) {
                i82Var3 = i82Var2;
                dVar2 = dVar;
                tx0Var = i82Var3.f4678k;
                if (tx0Var != null) {
                }
                i82Var4 = i82Var3;
                i82Var = dVar2;
                i82Var4.f4677j = null;
                i82Var4.f4679l = null;
                i82Var4.f4678k = null;
                Unit unit222 = Unit.f71706a;
                ((d) i82Var).g(null);
                return unit222;
            }
            CoroutineContext coroutineContext = (CoroutineContext) i82Var2.o;
            mx.e eVar = new mx.e(i82Var2, v3Var, continuation, i12);
            z72Var.f12468a = i82Var2;
            z72Var.f12469b = dVar;
            z72Var.f12472e = 2;
            if (m0.y(coroutineContext, eVar, z72Var) != coroutineSingletons) {
                i82Var3 = i82Var2;
                dVar3 = dVar;
                jr0 jr0Var2 = (jr0) i82Var3.f79577b;
                jr0Var2.getClass();
                Duration.Companion companion2 = Duration.f72038b;
                j11 = ((Duration) jr0Var2.a("gads:omid:destroy_webview_delay", new Duration(DurationKt.g(2, DurationUnit.f72046e)), u.a$1)).f72041a;
                z72Var.f12468a = i82Var3;
                z72Var.f12469b = dVar3;
                z72Var.f12472e = 3;
                dVar2 = dVar3;
                if (t0.c(j11, z72Var) == coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th4) {
            th2 = th4;
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object c(i82 i82Var, ContinuationImpl continuationImpl) {
        b82 b82Var;
        d dVar;
        if (continuationImpl instanceof b82) {
            b82Var = (b82) continuationImpl;
            int i5 = b82Var.f1324e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b82Var.f1324e = i5 - Integer.MIN_VALUE;
            } else {
                b82Var = new b82(i82Var, continuationImpl);
            }
        }
        Object obj = b82Var.f1322c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b82Var.f1324e;
        boolean z11 = true;
        if (i11 == 0) {
            ResultKt.b(obj);
            dVar = i82Var.f4676i;
            b82Var.f1320a = i82Var;
            b82Var.f1321b = dVar;
            b82Var.f1324e = 1;
            if (dVar.e(b82Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            d dVar2 = b82Var.f1321b;
            i82 i82Var2 = b82Var.f1320a;
            ResultKt.b(obj);
            dVar = dVar2;
            i82Var = i82Var2;
        }
        try {
            if (i82Var.f4679l == null && i82Var.f4677j == null) {
                z11 = false;
            }
            Boolean boolValueOf = Boolean.valueOf(z11);
            dVar.g(null);
            return boolValueOf;
        } catch (Throwable th2) {
            dVar.g(null);
            throw th2;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:41:0x0092, code lost:
    
        if ((r8 != null ? r8.f8517a : null) == ads_mobile_sdk.p82.f8136b) goto L48;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00a1, code lost:
    
        if (r7.a("Google", true, ads_mobile_sdk.q31.f8483e, r0) == r1) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object d(i82 i82Var, ContinuationImpl continuationImpl) {
        f82 f82Var;
        Boolean boolValueOf;
        com.google.gson.r rVar;
        if (continuationImpl instanceof f82) {
            f82Var = (f82) continuationImpl;
            int i5 = f82Var.f3251d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f82Var.f3251d = i5 - Integer.MIN_VALUE;
            } else {
                f82Var = new f82(i82Var, continuationImpl);
            }
        }
        Object objC = f82Var.f3249b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f82Var.f3251d;
        if (i11 == 0) {
            ResultKt.b(objC);
            ci3 ci3Var = i82Var.f4673f.f11580f;
            ci3Var.getClass();
            try {
                boolValueOf = Boolean.valueOf(ed.f15830r.f17888a);
            } catch (Exception e3) {
                ci3Var.a("IsActive", (Throwable) e3);
                boolValueOf = null;
            }
            if (boolValueOf != null && boolValueOf.booleanValue() && (rVar = i82Var.f4671d) != null) {
                try {
                    if (rVar.v("enable_omid").d()) {
                        f82Var.f3248a = i82Var;
                        f82Var.f3251d = 1;
                        objC = c(i82Var, f82Var);
                        if (objC != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    }
                } catch (Exception unused) {
                }
            }
            return Unit.f71706a;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objC);
            return Unit.f71706a;
        }
        i82Var = f82Var.f3248a;
        ResultKt.b(objC);
        if (!((Boolean) objC).booleanValue()) {
            it1 it1Var = i82Var.f4674g;
            if (it1Var.f4933b == gt1.f4063b) {
                q82 q82Var = it1Var.n;
            }
            f82Var.f3248a = null;
            f82Var.f3251d = 2;
        }
        return Unit.f71706a;
    }

    @Override // b.b9
    public final Object a(View view, xr0 xr0Var, SuspendLambda suspendLambda) throws Throwable {
        Object objA = a("addFriendlyObstruction", new r72(this, view, xr0Var, null), suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.va
    public final Object i(Continuation continuation) {
        return d(this, (ContinuationImpl) continuation);
    }

    @Override // b.b9
    public final Object l(mq3 mq3Var) {
        return c(this, mq3Var);
    }

    @Override // b.b9
    public final Object m(ht0 ht0Var) throws Throwable {
        Object objA = a("measurePreviousView", new x5.j(this, (Continuation) null), ht0Var);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    @Override // b.va
    public final Object n(Continuation continuation) {
        Object objA;
        q82 q82Var = this.f4674g.n;
        return ((q82Var != null ? q82Var.f8517a : null) == p82.f8135a && (objA = a("onAdClicked", new d82(3, null, 0), (ContinuationImpl) continuation)) == CoroutineSingletons.f71806a) ? objA : Unit.f71706a;
    }

    @Override // b.va
    public final Object q(Continuation continuation) throws Throwable {
        Object objA = a("onAdImpression", new d82(3, null, 1), (ContinuationImpl) continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, boolean z11, q31 q31Var, ContinuationImpl continuationImpl) throws Throwable {
        s72 s72Var;
        String str2;
        i82 i82Var;
        q31 q31Var2;
        d dVar;
        boolean z12;
        int i5;
        if (continuationImpl instanceof s72) {
            s72Var = (s72) continuationImpl;
            int i11 = s72Var.f9457h;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                s72Var.f9457h = i11 - Integer.MIN_VALUE;
            } else {
                s72Var = new s72(this, continuationImpl);
            }
        }
        Object obj = s72Var.f9455f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = s72Var.f9457h;
        if (i12 == 0) {
            ResultKt.b(obj);
            s72Var.f9450a = this;
            s72Var.f9451b = str;
            s72Var.f9452c = q31Var;
            d dVar2 = this.f4676i;
            s72Var.f9453d = dVar2;
            s72Var.f9454e = z11;
            s72Var.f9457h = 1;
            if (dVar2.e(s72Var) == coroutineSingletons) {
                return coroutineSingletons;
            }
            str2 = str;
            i82Var = this;
            q31Var2 = q31Var;
            dVar = dVar2;
            z12 = z11;
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            boolean z13 = s72Var.f9454e;
            dVar = s72Var.f9453d;
            q31 q31Var3 = s72Var.f9452c;
            String str3 = s72Var.f9451b;
            i82 i82Var2 = s72Var.f9450a;
            ResultKt.b(obj);
            i82Var = i82Var2;
            z12 = z13;
            q31Var2 = q31Var3;
            str2 = str3;
        }
        Object obj2 = null;
        try {
            it1 it1Var = i82Var.f4674g;
            t70.j0 j0Var = i82Var.f4670c;
            q82 q82Var = it1Var.n;
            if (q82Var == null) {
                try {
                    Unit unit = Unit.f71706a;
                    dVar.g(null);
                    return unit;
                } catch (Throwable th2) {
                    th = th2;
                    dVar.g(obj2);
                    throw th;
                }
            }
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            int iOrdinal = q82Var.f8517a.ordinal();
            if (iOrdinal == 0) {
                i5 = 2;
                tx0 tx0Var = it1Var.f4941j;
                if (tx0Var == null) {
                    mu0.c("No media webview in OmidNativeMonitor", null);
                    Unit unit2 = Unit.f71706a;
                    dVar.g(null);
                    return unit2;
                }
                if (tx0Var.d() == null) {
                    mu0.c("No video controller in OmidNativeMonitor", null);
                    Unit unit3 = Unit.f71706a;
                    dVar.g(null);
                    return unit3;
                }
                objectRef.f71863a = m0.a(tx0Var);
                i82Var.f4678k = tx0Var;
                objectRef2.f71863a = d00.f2129e;
                objectRef3.f71863a = ha2.f4271c;
            } else {
                if (iOrdinal != 1) {
                    if (iOrdinal != 2) {
                        throw new NoWhenBranchMatchedException();
                    }
                    mu0.c("Unknown media type in OmidNativeMonitor", null);
                    Unit unit4 = Unit.f71706a;
                    dVar.g(null);
                    return unit4;
                }
                p0 p0Var = it1Var.o;
                if (p0Var == null) {
                    mu0.c("No omid webview in OmidNativeMonitor", null);
                    Unit unit5 = Unit.f71706a;
                    dVar.g(null);
                    return unit5;
                }
                objectRef.f71863a = p0Var;
                objectRef2.f71863a = d00.f2128d;
                objectRef3.f71863a = ha2.f4272d;
                jr0 jr0Var = (jr0) i82Var.f79577b;
                jr0Var.getClass();
                if (((Boolean) jr0Var.a("gads:native_click_protection:enabled", Boolean.FALSE, jn.a$10)).booleanValue()) {
                    b00.e eVar = new b00.e(p0Var, i82Var, null, 18);
                    EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                    Intrinsics.g(j0Var, "<this>");
                    Intrinsics.g(context, "context");
                    ar.a aVar = new ar.a(eVar, null);
                    i5 = 2;
                    m0.t(j0Var, context, null, aVar, 2);
                } else {
                    i5 = 2;
                }
            }
            v72 v72Var = new v72(objectRef, i82Var, str2, objectRef2, q31Var2, objectRef3, z12, null);
            EmptyCoroutineContext context2 = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context2, "context");
            i82Var.f4677j = m0.t(j0Var, context2, null, new ar.a(v72Var, null), i5);
            Unit unit6 = Unit.f71706a;
            dVar.g(null);
            return unit6;
        } catch (Throwable th3) {
            th = th3;
            obj2 = null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00ce A[Catch: all -> 0x00d4, TRY_LEAVE, TryCatch #2 {all -> 0x00d4, blocks: (B:46:0x00ca, B:48:0x00ce, B:53:0x00d6, B:55:0x00da, B:58:0x00e0), top: B:83:0x00ca }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00d6 A[Catch: all -> 0x00d4, TRY_ENTER, TryCatch #2 {all -> 0x00d4, blocks: (B:46:0x00ca, B:48:0x00ce, B:53:0x00d6, B:55:0x00da, B:58:0x00e0), top: B:83:0x00ca }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /* JADX WARN: Type inference failed for: r15v14 */
    /* JADX WARN: Type inference failed for: r15v21, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r15v22 */
    /* JADX WARN: Type inference failed for: r15v23 */
    /* JADX WARN: Type inference failed for: r15v24 */
    /* JADX WARN: Type inference failed for: r15v25 */
    /* JADX WARN: Type inference failed for: r15v6, types: [c80.d, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r15v7 */
    /* JADX WARN: Type inference failed for: r15v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, Function3 function3, ContinuationImpl continuationImpl) throws Throwable {
        x72 x72Var;
        Function3 function32;
        i82 i82Var;
        String str2;
        d dVar;
        Function3 function33;
        i82 i82Var2;
        String str3;
        d dVar2;
        ?? r15;
        Function3 function34;
        String str4;
        tx0 tx0Var;
        if (continuationImpl instanceof x72) {
            x72Var = (x72) continuationImpl;
            int i5 = x72Var.f11621g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                x72Var.f11621g = i5 - Integer.MIN_VALUE;
            } else {
                x72Var = new x72(this, continuationImpl);
            }
        }
        Object obj = x72Var.f11619e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = x72Var.f11621g;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                x72Var.f11615a = this;
                x72Var.f11616b = str;
                function32 = function3;
                x72Var.f11617c = function32;
                d dVar3 = this.f4676i;
                x72Var.f11618d = dVar3;
                x72Var.f11621g = 1;
                if (dVar3.e(x72Var) != coroutineSingletons) {
                    i82Var = this;
                    str2 = str;
                    dVar = dVar3;
                }
                return coroutineSingletons;
            }
            if (i11 == 1) {
                dVar = x72Var.f11618d;
                Function3 function35 = x72Var.f11617c;
                str2 = (String) x72Var.f11616b;
                i82Var = (i82) x72Var.f11615a;
                ResultKt.b(obj);
                function32 = function35;
            } else {
                if (i11 == 2) {
                    Function3 function36 = x72Var.f11617c;
                    String str5 = (String) x72Var.f11616b;
                    i82Var2 = (i82) x72Var.f11615a;
                    try {
                        ResultKt.b(obj);
                        str2 = str5;
                        function33 = function36;
                        dVar2 = i82Var2.f4676i;
                        x72Var.f11615a = i82Var2;
                        x72Var.f11616b = str2;
                        x72Var.f11617c = function33;
                        x72Var.f11618d = dVar2;
                        x72Var.f11621g = 3;
                        if (dVar2.e(x72Var) != coroutineSingletons) {
                            str3 = str2;
                            r15 = dVar2;
                            function34 = function33;
                            tx0Var = i82Var2.f4678k;
                            if (tx0Var != null) {
                            }
                        }
                        return coroutineSingletons;
                    } catch (CancellationException unused) {
                        str3 = str5;
                    }
                } else {
                    if (i11 == 3) {
                        d dVar4 = x72Var.f11618d;
                        function33 = x72Var.f11617c;
                        str3 = (String) x72Var.f11616b;
                        i82Var2 = (i82) x72Var.f11615a;
                        try {
                            ResultKt.b(obj);
                            r15 = dVar4;
                            function34 = function33;
                            try {
                                tx0Var = i82Var2.f4678k;
                            } catch (Throwable th2) {
                                th = th2;
                                str4 = str3;
                                ((d) r15).g(null);
                                throw th;
                            }
                        } catch (CancellationException unused2) {
                        }
                        if (tx0Var != null) {
                            return Unit.f71706a;
                        }
                        b.v3 v3Var = i82Var2.f4679l;
                        if (v3Var == null) {
                            return Unit.f71706a;
                        }
                        db dbVar = new db(function34, tx0Var, v3Var, continuation, 2);
                        x72Var.f11615a = str3;
                        x72Var.f11616b = r15;
                        x72Var.f11617c = null;
                        x72Var.f11618d = null;
                        x72Var.f11621g = 4;
                        if (i82Var2.a$1(dbVar, x72Var) != coroutineSingletons) {
                            str4 = str3;
                            r15 = r15;
                            Unit unit = Unit.f71706a;
                            ((d) r15).g(null);
                            return Unit.f71706a;
                        }
                        return coroutineSingletons;
                    }
                    if (i11 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    r15 = (c80.a) x72Var.f11616b;
                    str4 = (String) x72Var.f11615a;
                    try {
                        ResultKt.b(obj);
                        r15 = r15;
                        Unit unit2 = Unit.f71706a;
                        try {
                            ((d) r15).g(null);
                        } catch (CancellationException unused3) {
                            str3 = str4;
                        }
                        return Unit.f71706a;
                    } catch (Throwable th3) {
                        th = th3;
                        try {
                            ((d) r15).g(null);
                            throw th;
                        } catch (CancellationException unused4) {
                        }
                    }
                }
                str4 = str3;
                cz.b bVar = mu0.f7335a;
                mu0.c("Ad session was cancelled in " + str4, null);
                return Unit.f71706a;
            }
            t70.g2 g2Var = i82Var.f4677j;
            if (g2Var == null) {
                return Unit.f71706a;
            }
            try {
                x72Var.f11615a = i82Var;
                x72Var.f11616b = str2;
                x72Var.f11617c = function32;
                x72Var.f11618d = null;
                x72Var.f11621g = 2;
                if (g2Var.K(x72Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                function33 = function32;
                i82Var2 = i82Var;
                dVar2 = i82Var2.f4676i;
                x72Var.f11615a = i82Var2;
                x72Var.f11616b = str2;
                x72Var.f11617c = function33;
                x72Var.f11618d = dVar2;
                x72Var.f11621g = 3;
                if (dVar2.e(x72Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            } catch (CancellationException unused5) {
                str3 = str2;
            }
        } finally {
            dVar.g(null);
        }
    }

    @Override // b.b9
    public final Object a(mq3 mq3Var) {
        return b(this, mq3Var);
    }

    @Override // b.va
    public final Object a(Continuation continuation) throws Throwable {
        Object objB = b(this, (ContinuationImpl) continuation);
        return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
    }

    @Override // b.b9
    public final Object a(View view, Continuation continuation) throws Throwable {
        if (this.f4680m) {
            return Unit.f71706a;
        }
        Object objA = a("updateRegisteredAdView", new cw.v1(this, view, (Continuation) null), (ContinuationImpl) continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
