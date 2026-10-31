package ads_mobile_sdk;

import android.os.Build;
import b.h7;
import b.o0;
import b.p2;
import b.p5;
import com.google.android.libraries.ads.mobile.sdk.internal.webview.PerAdNativeJavscriptEngineJsContext;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.u1;
import xk.w2;
import xk.x0;

/* loaded from: classes.dex */
public final class su1 extends e2 {

    /* renamed from: l, reason: collision with root package name */
    public final x60 f9693l;

    /* renamed from: m, reason: collision with root package name */
    public final ab0 f9694m;
    public final ab0 n;
    public final ae.l o;

    /* renamed from: p, reason: collision with root package name */
    public final wt1 f9695p;

    /* renamed from: q, reason: collision with root package name */
    public final ui.q f9696q;

    /* renamed from: r, reason: collision with root package name */
    public final o0 f9697r;

    /* renamed from: s, reason: collision with root package name */
    public final kz2 f9698s;

    /* renamed from: t, reason: collision with root package name */
    public final t70.j0 f9699t;

    /* renamed from: u, reason: collision with root package name */
    public final int f9700u;

    /* renamed from: v, reason: collision with root package name */
    public final em f9701v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public su1(x60 csiTicker, ab0 adComponentProvider, ab0 mediaAdComponentProvider, ae.l nativeJavascriptEngineFactory, wt1 nativeAdAssetsFactory, ui.q nativeRequest, o0 preRenderNativeJavascriptEngineConfigurator, kz2 rootTraceCreator, mi3 traceMetaSet, ni.q baseRequest, qw2 requestType, long j11, int i5, z1 adConfiguration, hv commonConfiguration, d33 serverTransaction, String renderId, t70.j0 backgroundScope, int i11, em emVar) {
        super(traceMetaSet, baseRequest, requestType, j11, i5, adConfiguration, commonConfiguration, serverTransaction, renderId, (eg2) emVar.get());
        Intrinsics.g(csiTicker, "csiTicker");
        Intrinsics.g(adComponentProvider, "adComponentProvider");
        Intrinsics.g(mediaAdComponentProvider, "mediaAdComponentProvider");
        Intrinsics.g(nativeJavascriptEngineFactory, "nativeJavascriptEngineFactory");
        Intrinsics.g(nativeAdAssetsFactory, "nativeAdAssetsFactory");
        Intrinsics.g(nativeRequest, "nativeRequest");
        Intrinsics.g(preRenderNativeJavascriptEngineConfigurator, "preRenderNativeJavascriptEngineConfigurator");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(baseRequest, "baseRequest");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(commonConfiguration, "commonConfiguration");
        Intrinsics.g(serverTransaction, "serverTransaction");
        Intrinsics.g(renderId, "renderId");
        Intrinsics.g(backgroundScope, "backgroundScope");
        this.f9693l = csiTicker;
        this.f9694m = adComponentProvider;
        this.n = mediaAdComponentProvider;
        this.o = nativeJavascriptEngineFactory;
        this.f9695p = nativeAdAssetsFactory;
        this.f9696q = nativeRequest;
        this.f9697r = preRenderNativeJavascriptEngineConfigurator;
        this.f9698s = rootTraceCreator;
        this.f9699t = backgroundScope;
        this.f9700u = i11;
        this.f9701v = emVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(p2 p2Var, z1 z1Var, ContinuationImpl continuationImpl) {
        nu1 nu1Var;
        com.google.gson.m mVarE;
        if (continuationImpl instanceof nu1) {
            nu1Var = (nu1) continuationImpl;
            int i5 = nu1Var.f7679c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nu1Var.f7679c = i5 - Integer.MIN_VALUE;
            } else {
                nu1Var = new nu1(this, continuationImpl);
            }
        }
        Object objA = nu1Var.f7677a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = nu1Var.f7679c;
        if (i11 == 0) {
            ResultKt.b(objA);
            com.google.gson.r rVar = new com.google.gson.r();
            Boolean bool = Boolean.TRUE;
            rVar.r("isNonagon", bool);
            if (Build.VERSION.SDK_INT >= 30) {
                rVar.r("skipDeepLinkValidation", bool);
            }
            com.google.gson.r rVar2 = new com.google.gson.r();
            k61 k61Var = z1Var.I;
            Intrinsics.d(k61Var);
            rVar2.p("response", k61Var.f5522d);
            rVar2.p("sdk_params", rVar);
            nu1Var.f7679c = 1;
            p2Var.getClass();
            String string = rVar2.toString();
            Intrinsics.f(string, "toString(...)");
            objA = p2Var.a("google.afma.nativeAds.preProcessJson", string, nu1Var);
            if (objA == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            return (pu0) a1Var;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        com.google.gson.r rVar3 = (com.google.gson.r) ((xu0) a1Var).f11834b;
        if (!d62.a(rVar3, "success", false)) {
            return new tu0("Process native ad json failed", wd1.f11213a);
        }
        com.google.gson.r rVarA = d62.a(rVar3, "json", (com.google.gson.r) null);
        return (rVarA == null || (mVarE = d62.e(rVarA, "ads")) == null) ? new tu0("Invalid processed native ad json", wd1.f11213a) : mVarE.f34793a.isEmpty() ? new uu0((String) null, 3) : new xu0(mVarE);
    }

    @Override // b.b
    public final boolean b() {
        k61 k61Var = this.f2711f.I;
        return (k61Var != null ? k61Var.f5522d : null) != null;
    }

    @Override // ads_mobile_sdk.e2
    public final Object a(boolean z11, Continuation continuation) {
        return a(this, (ContinuationImpl) continuation);
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x00dc, code lost:
    
        if (r12 == r1) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:49:0x00f6, code lost:
    
        if (r12 == r1) goto L50;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(su1 su1Var, ContinuationImpl continuationImpl) {
        qu1 qu1Var;
        su1 su1Var2;
        PerAdNativeJavscriptEngineJsContext perAdNativeJavscriptEngineJsContext;
        p2 p2Var;
        su1 su1Var3;
        b.a1 a1Var;
        if (continuationImpl instanceof qu1) {
            qu1Var = (qu1) continuationImpl;
            int i5 = qu1Var.f8819f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                qu1Var.f8819f = i5 - Integer.MIN_VALUE;
            } else {
                qu1Var = new qu1(su1Var, continuationImpl);
            }
        }
        Object objA = qu1Var.f8817d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = qu1Var.f8819f;
        if (i11 == 0) {
            ResultKt.b(objA);
            ae.l lVar = su1Var.o;
            z1 z1Var = su1Var.f2711f;
            qu1Var.f8814a = su1Var;
            qu1Var.f8819f = 1;
            lVar.getClass();
            objA = ae.l.a(lVar, z1Var, qu1Var);
            if (objA != coroutineSingletons) {
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 == 2) {
                perAdNativeJavscriptEngineJsContext = qu1Var.f8816c;
                p2Var = qu1Var.f8815b;
                su1Var2 = qu1Var.f8814a;
                ResultKt.b(objA);
                z1 z1Var2 = su1Var2.f2711f;
                qu1Var.f8814a = su1Var2;
                qu1Var.f8815b = p2Var;
                qu1Var.f8816c = perAdNativeJavscriptEngineJsContext;
                qu1Var.f8819f = 3;
                objA = su1Var2.a(p2Var, z1Var2, qu1Var);
                if (objA != coroutineSingletons) {
                    su1Var3 = su1Var2;
                    a1Var = (b.a1) objA;
                    if (!(a1Var instanceof pu0)) {
                    }
                }
                return coroutineSingletons;
            }
            if (i11 != 3) {
                if (i11 == 4) {
                    ResultKt.b(objA);
                    return new xu0(objA);
                }
                if (i11 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objA);
                b.a1 a1Var2 = (b.a1) objA;
                if (a1Var2 instanceof xu0) {
                    return new xu0(new n8.q(a1Var2, 3));
                }
                if (a1Var2 instanceof pu0) {
                    return a1Var2;
                }
                throw new NoWhenBranchMatchedException();
            }
            perAdNativeJavscriptEngineJsContext = qu1Var.f8816c;
            p2Var = qu1Var.f8815b;
            su1Var3 = qu1Var.f8814a;
            ResultKt.b(objA);
            a1Var = (b.a1) objA;
            if (!(a1Var instanceof pu0)) {
                return (pu0) a1Var;
            }
            Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
            com.google.gson.m mVar = (com.google.gson.m) ((xu0) a1Var).f11834b;
            int i12 = su1Var3.f9700u;
            if (i12 > 1) {
                qu1Var.f8814a = null;
                qu1Var.f8815b = null;
                qu1Var.f8816c = null;
                qu1Var.f8819f = 4;
                objA = u1.h(new b30.a(i12, su1Var3, mVar, (Continuation) null));
            } else {
                com.google.gson.r rVarA = d62.a(mVar, 0);
                qu1Var.f8814a = null;
                qu1Var.f8815b = null;
                qu1Var.f8816c = null;
                qu1Var.f8819f = 5;
                objA = su1Var3.a(rVarA, p2Var, perAdNativeJavscriptEngineJsContext, qu1Var);
            }
            return coroutineSingletons;
        }
        su1Var = qu1Var.f8814a;
        ResultKt.b(objA);
        b.a1 a1Var3 = (b.a1) objA;
        if (a1Var3 instanceof pu0) {
            return (pu0) a1Var3;
        }
        Intrinsics.e(a1Var3, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        p2 p2Var2 = (p2) ((xu0) a1Var3).f11834b;
        PerAdNativeJavscriptEngineJsContext perAdNativeJavscriptEngineJsContext2 = new PerAdNativeJavscriptEngineJsContext(p2Var2.a(), null);
        o0 o0Var = su1Var.f9697r;
        qu1Var.f8814a = su1Var;
        qu1Var.f8815b = p2Var2;
        qu1Var.f8816c = perAdNativeJavscriptEngineJsContext2;
        qu1Var.f8819f = 2;
        if (o0Var.a(perAdNativeJavscriptEngineJsContext2, qu1Var) != coroutineSingletons) {
            su1Var2 = su1Var;
            perAdNativeJavscriptEngineJsContext = perAdNativeJavscriptEngineJsContext2;
            p2Var = p2Var2;
            z1 z1Var22 = su1Var2.f2711f;
            qu1Var.f8814a = su1Var2;
            qu1Var.f8815b = p2Var;
            qu1Var.f8816c = perAdNativeJavscriptEngineJsContext;
            qu1Var.f8819f = 3;
            objA = su1Var2.a(p2Var, z1Var22, qu1Var);
            if (objA != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Code restructure failed: missing block: B:50:0x0254, code lost:
    
        if (r6.a(r5, r3) != r4) goto L52;
     */
    /* JADX WARN: Removed duplicated region for block: B:45:0x023f  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0242  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0245  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(com.google.gson.r rVar, p2 p2Var, PerAdNativeJavscriptEngineJsContext perAdNativeJavscriptEngineJsContext, ContinuationImpl continuationImpl) {
        ru1 ru1Var;
        p2 p2Var2;
        PerAdNativeJavscriptEngineJsContext perAdNativeJavscriptEngineJsContext2;
        com.google.gson.r rVar2;
        eg2 eg2Var;
        su1 su1Var;
        b.n5 n5Var;
        it1 it1Var;
        tx0 tx0Var;
        p5 nh0Var;
        if (continuationImpl instanceof ru1) {
            ru1Var = (ru1) continuationImpl;
            int i5 = ru1Var.f9324h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ru1Var.f9324h = i5 - Integer.MIN_VALUE;
            } else {
                ru1Var = new ru1(this, continuationImpl);
            }
        }
        Object obj = ru1Var.f9322f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ru1Var.f9324h;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (rVar != null && rVar.f34795a.f59936d != 0) {
                eg2 eg2Var2 = (eg2) this.f9701v.get();
                ru1Var.f9317a = this;
                ru1Var.f9318b = rVar;
                p2Var2 = p2Var;
                ru1Var.f9319c = p2Var2;
                perAdNativeJavscriptEngineJsContext2 = perAdNativeJavscriptEngineJsContext;
                ru1Var.f9320d = perAdNativeJavscriptEngineJsContext2;
                ru1Var.f9321e = eg2Var2;
                ru1Var.f9324h = 1;
                Object objA = this.f9695p.a(this.f2711f, rVar, eg2Var2, ru1Var);
                if (objA != coroutineSingletons) {
                    rVar2 = rVar;
                    eg2Var = eg2Var2;
                    obj = objA;
                    su1Var = this;
                }
                return coroutineSingletons;
            }
            return new uu0((String) null, 3);
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                n5Var = (b.n5) ru1Var.f9317a;
                ResultKt.b(obj);
                return new xu0(n5Var.a());
            }
            n5Var = (b.n5) ru1Var.f9318b;
            it1Var = (it1) ru1Var.f9317a;
            ResultKt.b(obj);
            if ((n5Var instanceof tc0) && (tx0Var = it1Var.f4941j) != null) {
                tc0 tc0Var = (tc0) n5Var;
                c30.c cVarB = x0.b(7);
                m92 openGmsgHandler = (m92) tc0Var.Q.get();
                Intrinsics.g(openGmsgHandler, "openGmsgHandler");
                cVarB.p("/open", new a91(openGmsgHandler, 5));
                os clickGmsgHandler = (os) tc0Var.M.get();
                Intrinsics.g(clickGmsgHandler, "clickGmsgHandler");
                cVarB.p("/click", new a91(clickGmsgHandler, 5));
                r12 nativeVideoClickedGmsgHandler = (r12) tc0Var.f9853d1.get();
                Intrinsics.g(nativeVideoClickedGmsgHandler, "nativeVideoClickedGmsgHandler");
                cVarB.p("/videoClicked", new a91(nativeVideoClickedGmsgHandler, 5));
                bj3 trackActiveViewUnitGmsgHandler = (bj3) tc0Var.f9856e1.get();
                Intrinsics.g(trackActiveViewUnitGmsgHandler, "trackActiveViewUnitGmsgHandler");
                cVarB.p("/trackActiveViewUnit", new a91(trackActiveViewUnitGmsgHandler, 5));
                qm3 untrackActiveViewUnitGmsgHandler = (qm3) tc0Var.f9859f1.get();
                Intrinsics.g(untrackActiveViewUnitGmsgHandler, "untrackActiveViewUnitGmsgHandler");
                cVarB.p("/untrackActiveViewUnit", new a91(untrackActiveViewUnitGmsgHandler, 5));
                kw1 nativeAdViewSignalsGmsgHandler = (kw1) tc0Var.g1.get();
                Intrinsics.g(nativeAdViewSignalsGmsgHandler, "nativeAdViewSignalsGmsgHandler");
                cVarB.p("/getNativeAdViewSignals", new a91(nativeAdViewSignalsGmsgHandler, 5));
                lx1 nativeClickMetaGmsgHandler = (lx1) tc0Var.h1.get();
                Intrinsics.g(nativeClickMetaGmsgHandler, "nativeClickMetaGmsgHandler");
                cVarB.p("/getNativeClickMeta", new a91(nativeClickMetaGmsgHandler, 5));
                hh2 hh2Var = new hh2(cVarB.c(true), 1);
                b.c6 webViewViewabilityMonitor = (b.c6) tc0Var.f9877m1.get();
                Intrinsics.g(webViewViewabilityMonitor, "webViewViewabilityMonitor");
                wk3 wk3Var = new wk3(webViewViewabilityMonitor, 3);
                z03 safeBrowsingManager = (z03) tc0Var.f9896x.get();
                Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
                o0 o0Var = new o0(w2.k(3, new Object[]{"GmsgHandlerInstaller", hh2Var, "NativeVideoViewabilityMonitorInitializer", wk3Var, "SafeBrowsingClickListener", new oh2(safeBrowsingManager, 0)}, null));
                b.u7 u7VarC = tx0Var.c();
                nh0Var = !(u7VarC instanceof p5) ? (p5) u7VarC : null;
                if (nh0Var == null) {
                    nh0Var = new nh0(tx0Var);
                }
                ru1Var.f9317a = n5Var;
                ru1Var.f9318b = null;
                ru1Var.f9324h = 3;
            }
            return new xu0(n5Var.a());
        }
        eg2Var = ru1Var.f9321e;
        PerAdNativeJavscriptEngineJsContext perAdNativeJavscriptEngineJsContext3 = ru1Var.f9320d;
        p2 p2Var3 = ru1Var.f9319c;
        rVar2 = (com.google.gson.r) ru1Var.f9318b;
        su1Var = (su1) ru1Var.f9317a;
        ResultKt.b(obj);
        perAdNativeJavscriptEngineJsContext2 = perAdNativeJavscriptEngineJsContext3;
        p2Var2 = p2Var3;
        b.a1 a1Var = (b.a1) obj;
        if (a1Var instanceof pu0) {
            return (pu0) a1Var;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        it1 it1Var2 = (it1) ((xu0) a1Var).f11834b;
        tx0 tx0Var2 = it1Var2.f4941j;
        if (tx0Var2 != null) {
            sc0 sc0Var = (sc0) su1Var.a((h7) su1Var.n.get(), false);
            x60 x60Var = su1Var.f9693l;
            x60Var.getClass();
            sc0Var.f9526s = x60Var;
            sc0Var.f9524q = it1Var2;
            rVar2.getClass();
            sc0Var.f9527t = rVar2;
            p2Var2.getClass();
            sc0Var.f9523p = p2Var2;
            perAdNativeJavscriptEngineJsContext2.getClass();
            sc0Var.f9525r = perAdNativeJavscriptEngineJsContext2;
            ui.q qVar = su1Var.f9696q;
            qVar.getClass();
            sc0Var.f9528u = qVar;
            sc0Var.f9530w = tx0Var2;
            sc0Var.f9529v = tx0Var2;
            Intrinsics.d(eg2Var);
            sc0Var.n = eg2Var;
            n5Var = (tc0) sc0Var.a();
        } else {
            qc0 qc0Var = (qc0) su1Var.a((h7) su1Var.f9694m.get(), false);
            x60 x60Var2 = su1Var.f9693l;
            x60Var2.getClass();
            qc0Var.f8576s = x60Var2;
            qc0Var.f8574q = it1Var2;
            rVar2.getClass();
            qc0Var.f8577t = rVar2;
            p2Var2.getClass();
            qc0Var.f8573p = p2Var2;
            perAdNativeJavscriptEngineJsContext2.getClass();
            qc0Var.f8575r = perAdNativeJavscriptEngineJsContext2;
            ui.q qVar2 = su1Var.f9696q;
            qVar2.getClass();
            qc0Var.f8578u = qVar2;
            Intrinsics.d(eg2Var);
            qc0Var.n = eg2Var;
            n5Var = (b.n5) qc0Var.a();
        }
        o0 o0VarD = n5Var.d();
        ru1Var.f9317a = it1Var2;
        ru1Var.f9318b = n5Var;
        ru1Var.f9319c = null;
        ru1Var.f9320d = null;
        ru1Var.f9321e = null;
        ru1Var.f9324h = 2;
        if (o0VarD.a(perAdNativeJavscriptEngineJsContext2, ru1Var) != coroutineSingletons) {
            it1Var = it1Var2;
            if (n5Var instanceof tc0) {
                tc0 tc0Var2 = (tc0) n5Var;
                c30.c cVarB2 = x0.b(7);
                m92 openGmsgHandler2 = (m92) tc0Var2.Q.get();
                Intrinsics.g(openGmsgHandler2, "openGmsgHandler");
                cVarB2.p("/open", new a91(openGmsgHandler2, 5));
                os clickGmsgHandler2 = (os) tc0Var2.M.get();
                Intrinsics.g(clickGmsgHandler2, "clickGmsgHandler");
                cVarB2.p("/click", new a91(clickGmsgHandler2, 5));
                r12 nativeVideoClickedGmsgHandler2 = (r12) tc0Var2.f9853d1.get();
                Intrinsics.g(nativeVideoClickedGmsgHandler2, "nativeVideoClickedGmsgHandler");
                cVarB2.p("/videoClicked", new a91(nativeVideoClickedGmsgHandler2, 5));
                bj3 trackActiveViewUnitGmsgHandler2 = (bj3) tc0Var2.f9856e1.get();
                Intrinsics.g(trackActiveViewUnitGmsgHandler2, "trackActiveViewUnitGmsgHandler");
                cVarB2.p("/trackActiveViewUnit", new a91(trackActiveViewUnitGmsgHandler2, 5));
                qm3 untrackActiveViewUnitGmsgHandler2 = (qm3) tc0Var2.f9859f1.get();
                Intrinsics.g(untrackActiveViewUnitGmsgHandler2, "untrackActiveViewUnitGmsgHandler");
                cVarB2.p("/untrackActiveViewUnit", new a91(untrackActiveViewUnitGmsgHandler2, 5));
                kw1 nativeAdViewSignalsGmsgHandler2 = (kw1) tc0Var2.g1.get();
                Intrinsics.g(nativeAdViewSignalsGmsgHandler2, "nativeAdViewSignalsGmsgHandler");
                cVarB2.p("/getNativeAdViewSignals", new a91(nativeAdViewSignalsGmsgHandler2, 5));
                lx1 nativeClickMetaGmsgHandler2 = (lx1) tc0Var2.h1.get();
                Intrinsics.g(nativeClickMetaGmsgHandler2, "nativeClickMetaGmsgHandler");
                cVarB2.p("/getNativeClickMeta", new a91(nativeClickMetaGmsgHandler2, 5));
                hh2 hh2Var2 = new hh2(cVarB2.c(true), 1);
                b.c6 webViewViewabilityMonitor2 = (b.c6) tc0Var2.f9877m1.get();
                Intrinsics.g(webViewViewabilityMonitor2, "webViewViewabilityMonitor");
                wk3 wk3Var2 = new wk3(webViewViewabilityMonitor2, 3);
                z03 safeBrowsingManager2 = (z03) tc0Var2.f9896x.get();
                Intrinsics.g(safeBrowsingManager2, "safeBrowsingManager");
                o0 o0Var2 = new o0(w2.k(3, new Object[]{"GmsgHandlerInstaller", hh2Var2, "NativeVideoViewabilityMonitorInitializer", wk3Var2, "SafeBrowsingClickListener", new oh2(safeBrowsingManager2, 0)}, null));
                b.u7 u7VarC2 = tx0Var.c();
                if (!(u7VarC2 instanceof p5)) {
                }
                if (nh0Var == null) {
                }
                ru1Var.f9317a = n5Var;
                ru1Var.f9318b = null;
                ru1Var.f9324h = 3;
            }
            return new xu0(n5Var.a());
        }
        return coroutineSingletons;
    }
}
