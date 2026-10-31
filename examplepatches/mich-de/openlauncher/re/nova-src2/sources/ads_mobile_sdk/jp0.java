package ads_mobile_sdk;

import android.app.Activity;
import android.content.Context;
import android.graphics.Point;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import b.fc;
import b.k9;
import b.n;
import b.o2;
import b.p2;
import b.r1;
import b.t2;
import b0.b0;
import com.google.gson.Gson;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;
import ni.o;
import t70.m0;

/* loaded from: classes2.dex */
public final class jp0 extends zt1 {
    public final eg2 C;
    public Point D;
    public Point E;
    public long F;
    public long G;
    public final AtomicBoolean H;

    /* renamed from: g, reason: collision with root package name */
    public final com.google.gson.r f5317g;

    /* renamed from: h, reason: collision with root package name */
    public final t70.j0 f5318h;

    /* renamed from: i, reason: collision with root package name */
    public final t70.j0 f5319i;

    /* renamed from: j, reason: collision with root package name */
    public final k8 f5320j;

    /* renamed from: k, reason: collision with root package name */
    public final it1 f5321k;

    /* renamed from: l, reason: collision with root package name */
    public final zv1 f5322l;

    /* renamed from: m, reason: collision with root package name */
    public final ui.q f5323m;
    public final kz2 n;
    public final mi3 o;

    /* renamed from: p, reason: collision with root package name */
    public final o2 f5324p;

    /* renamed from: q, reason: collision with root package name */
    public final p2 f5325q;

    /* renamed from: r, reason: collision with root package name */
    public final i82 f5326r;

    /* renamed from: s, reason: collision with root package name */
    public final ih0 f5327s;

    /* renamed from: t, reason: collision with root package name */
    public final b02 f5328t;

    /* renamed from: u, reason: collision with root package name */
    public final h02 f5329u;

    /* renamed from: v, reason: collision with root package name */
    public final qw2 f5330v;

    /* renamed from: w, reason: collision with root package name */
    public final z1 f5331w;

    /* renamed from: x, reason: collision with root package name */
    public final b41 f5332x;

    /* renamed from: y, reason: collision with root package name */
    public final jr0 f5333y;

    /* renamed from: z, reason: collision with root package name */
    public final z03 f5334z;

    public jp0(com.google.gson.r nativeAdJson, t70.j0 uiScope, t70.j0 backgroundScope, k8 adSpamClient, it1 nativeAdAssets, zv1 nativeAdUtil, ui.q nativeRequest, kz2 rootTraceCreator, mi3 traceMetaSet, o2 clock, p2 nativeJavascriptEngine, i82 omidMonitor, ih0 delegatingAdEventListener, kx2 urlPinger, y2 adEventEmitter, b02 nativeOnePointFiveOverlayFactory, h02 nativePolicyValidatorOverlayFactory, qw2 requestType, z1 adConfiguration, b41 initializationConfigWrapper, jr0 flags, z03 safeBrowsingManager, Gson gson, ci3 traceLogger, eg2 placementIdWrapper) {
        Intrinsics.g(nativeAdJson, "nativeAdJson");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(adSpamClient, "adSpamClient");
        Intrinsics.g(nativeAdAssets, "nativeAdAssets");
        Intrinsics.g(nativeAdUtil, "nativeAdUtil");
        Intrinsics.g(nativeRequest, "nativeRequest");
        Intrinsics.g(rootTraceCreator, "rootTraceCreator");
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(nativeJavascriptEngine, "nativeJavascriptEngine");
        Intrinsics.g(omidMonitor, "omidMonitor");
        Intrinsics.g(delegatingAdEventListener, "delegatingAdEventListener");
        Intrinsics.g(urlPinger, "urlPinger");
        Intrinsics.g(adEventEmitter, "adEventEmitter");
        Intrinsics.g(nativeOnePointFiveOverlayFactory, "nativeOnePointFiveOverlayFactory");
        Intrinsics.g(nativePolicyValidatorOverlayFactory, "nativePolicyValidatorOverlayFactory");
        Intrinsics.g(requestType, "requestType");
        Intrinsics.g(adConfiguration, "adConfiguration");
        Intrinsics.g(initializationConfigWrapper, "initializationConfigWrapper");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(safeBrowsingManager, "safeBrowsingManager");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(placementIdWrapper, "placementIdWrapper");
        this.f5317g = nativeAdJson;
        this.f5318h = uiScope;
        this.f5319i = backgroundScope;
        this.f5320j = adSpamClient;
        this.f5321k = nativeAdAssets;
        this.f5322l = nativeAdUtil;
        this.f5323m = nativeRequest;
        this.n = rootTraceCreator;
        this.o = traceMetaSet;
        this.f5324p = clock;
        this.f5325q = nativeJavascriptEngine;
        this.f5326r = omidMonitor;
        this.f5327s = delegatingAdEventListener;
        this.f5328t = nativeOnePointFiveOverlayFactory;
        this.f5329u = nativePolicyValidatorOverlayFactory;
        this.f5330v = requestType;
        this.f5331w = adConfiguration;
        this.f5332x = initializationConfigWrapper;
        this.f5333y = flags;
        this.f5334z = safeBrowsingManager;
        this.C = placementIdWrapper;
        this.D = new Point();
        this.E = new Point();
        new AtomicBoolean(false);
        this.H = new AtomicBoolean(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(jp0 jp0Var, r1 r1Var, ContinuationImpl continuationImpl) {
        hp0 hp0Var;
        com.google.gson.r rVarX;
        FrameLayout frameLayoutD;
        AtomicBoolean atomicBoolean;
        if (continuationImpl instanceof hp0) {
            hp0Var = (hp0) continuationImpl;
            int i5 = hp0Var.f4473e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                hp0Var.f4473e = i5 - Integer.MIN_VALUE;
            } else {
                hp0Var = new hp0(jp0Var, continuationImpl);
            }
        }
        Object objA = hp0Var.f4471c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = hp0Var.f4473e;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (jp0Var.f5330v == qw2.f8862g) {
                return Unit.f71706a;
            }
            com.google.gson.r rVar = jp0Var.f5317g;
            Boolean boolValueOf = null;
            if (rVar != null) {
                try {
                    rVarX = rVar.x("overlay");
                } catch (Exception unused) {
                }
                if (rVarX != null) {
                }
                return Unit.f71706a;
            }
            rVarX = null;
            if (rVarX != null || rVarX.f34795a.isEmpty()) {
                return Unit.f71706a;
            }
            tx0 tx0Var = (tx0) jp0Var.f12655d.get();
            if (tx0Var != null && (atomicBoolean = tx0Var.f10131k) != null) {
                boolValueOf = Boolean.valueOf(atomicBoolean.get());
            }
            if (tx0Var != null && Intrinsics.b(boolValueOf, Boolean.FALSE)) {
                return Unit.f71706a;
            }
            if (tx0Var != null && Intrinsics.b(boolValueOf, Boolean.TRUE) && (frameLayoutD = ((ew1) r1Var).d()) != null) {
                frameLayoutD.removeView(tx0Var);
            }
            b02 b02Var = jp0Var.f5328t;
            hp0Var.f4469a = jp0Var;
            hp0Var.f4470b = r1Var;
            hp0Var.f4473e = 1;
            b02Var.getClass();
            objA = b02.a(b02Var, hp0Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            r1Var = hp0Var.f4470b;
            jp0Var = hp0Var.f4469a;
            ResultKt.b(objA);
        }
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            return Unit.f71706a;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        tx0 tx0Var2 = (tx0) ((xu0) a1Var).f11834b;
        WeakReference weakReference = new WeakReference(tx0Var2);
        jp0Var.getClass();
        jp0Var.f12655d = weakReference;
        FrameLayout frameLayoutD2 = ((ew1) r1Var).d();
        if (frameLayoutD2 != null) {
            frameLayoutD2.addView(tx0Var2);
        }
        return Unit.f71706a;
    }

    @Override // ads_mobile_sdk.zt1
    public final void a() {
    }

    @Override // ads_mobile_sdk.zt1
    public final void a$1() {
        a(this, null, null, "_videoMediaView", null, 48);
    }

    @Override // ads_mobile_sdk.zt1
    public final void c() {
        r1 r1Var = (r1) this.f12654c.get();
        if (r1Var == null) {
            mu0.a("Ad should be associated with an ad view before click happens.", null, 6);
            return;
        }
        ew1 ew1Var = (ew1) r1Var;
        FrameLayout frameLayoutC = ew1Var.c();
        Map mapB = ew1Var.b();
        ImageView.ScaleType scaleTypeE = ew1Var.e();
        if (scaleTypeE == null) {
            scaleTypeE = ImageView.ScaleType.CENTER_INSIDE;
        }
        vv1 vv1VarS = t2.s(this.n, this.o, this.f5322l, frameLayoutC, mapB, scaleTypeE);
        String strA = a((View) this.f12657f.get(), ew1Var.b());
        a(this, ew1Var.c(), vv1VarS, strA, this.f5322l.a(strA, this.E, this.D), 48);
    }

    @Override // ads_mobile_sdk.zt1
    public final boolean d() {
        if (e() == 0) {
            return true;
        }
        return this.f5323m.f();
    }

    @Override // ads_mobile_sdk.zt1
    public final int e() {
        ui.c cVarB = this.f5323m.b();
        if (cVarB != null) {
            return cVarB.f91283a;
        }
        return 0;
    }

    @Override // ads_mobile_sdk.zt1
    public final boolean k() {
        it1 it1Var = this.f5321k;
        return (it1Var.f4945p.isEmpty() || it1Var.f4946q == null) ? false : true;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(jp0 jp0Var, r1 r1Var, ContinuationImpl continuationImpl) {
        gp0 gp0Var;
        WindowManager windowManager;
        if (continuationImpl instanceof gp0) {
            gp0Var = (gp0) continuationImpl;
            int i5 = gp0Var.f4019e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gp0Var.f4019e = i5 - Integer.MIN_VALUE;
            } else {
                gp0Var = new gp0(jp0Var, continuationImpl);
            }
        }
        Object objA = gp0Var.f4017c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gp0Var.f4019e;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (!jp0Var.f5331w.f12398q0) {
                return Unit.f71706a;
            }
            jp0Var.f5332x.a();
            FrameLayout frameLayoutC = ((ew1) r1Var).c();
            Context context = frameLayoutC != null ? frameLayoutC.getContext() : null;
            Activity activity = context instanceof Activity ? (Activity) context : null;
            if (activity == null) {
                return Unit.f71706a;
            }
            windowManager = (WindowManager) activity.getSystemService(WindowManager.class);
            h02 h02Var = jp0Var.f5329u;
            gp0Var.f4015a = jp0Var;
            gp0Var.f4016b = windowManager;
            gp0Var.f4019e = 1;
            h02Var.getClass();
            objA = h02.a(h02Var, gp0Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            WindowManager windowManager2 = gp0Var.f4016b;
            jp0 jp0Var2 = gp0Var.f4015a;
            ResultKt.b(objA);
            windowManager = windowManager2;
            jp0Var = jp0Var2;
        }
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            return Unit.f71706a;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        tx0 tx0Var = (tx0) ((xu0) a1Var).f11834b;
        zv1 zv1Var = jp0Var.f5322l;
        zv1Var.getClass();
        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams(-2, -2, 0, 0, -2);
        jr0 jr0Var = zv1Var.f12687b;
        layoutParams.flags = ((Number) jr0Var.a("gads:policy_validator_layoutparam:flags", k9.q(jr0Var, "gads:policy_validator_layoutparam:flags", 808), jn.a$15)).intValue();
        layoutParams.type = 2;
        layoutParams.gravity = 8388659;
        windowManager.addView(tx0Var, layoutParams);
        jp0Var.f12656e = new WeakReference(tx0Var);
        return Unit.f71706a;
    }

    @Override // ads_mobile_sdk.zt1
    public final void a(View view, o oVar, LinkedHashMap assetViews, ImageView.ScaleType mediaViewScaleType) {
        Intrinsics.g(assetViews, "assetViews");
        Intrinsics.g(mediaViewScaleType, "mediaViewScaleType");
        m0.t(this.f5318h, null, null, new xo0(this, null, 0), 3);
        vv1 vv1VarS = t2.s(this.n, this.o, this.f5322l, oVar, assetViews, mediaViewScaleType);
        String strA = a(view, assetViews);
        a(this, oVar, vv1VarS, strA, this.f5322l.a(strA, this.E, this.D), 48);
    }

    @Override // ads_mobile_sdk.zt1
    public final void b(FrameLayout frameLayout, ImageView.ScaleType scaleType, Map map) {
        boolean z11;
        vv1 vv1VarS = t2.s(this.n, this.o, this.f5322l, frameLayout, map, scaleType);
        String strA = a(frameLayout);
        if (this.f5331w.f12398q0) {
            this.f5332x.a();
            z11 = true;
        } else {
            z11 = false;
        }
        m0.t(this.f5318h, null, null, new ap0(this, vv1VarS, strA, z11, null, 1), 3);
    }

    public static void a(jp0 jp0Var, FrameLayout frameLayout, vv1 vv1Var, String str, com.google.gson.r rVar, int i5) {
        m0.t(jp0Var.f5318h, null, null, new u72(jp0Var, vv1Var, rVar, str, frameLayout, (i5 & 32) == 0, null), 3);
    }

    @Override // ads_mobile_sdk.zt1
    public final void a(FrameLayout frameLayout, ImageView.ScaleType scaleType, Map map) {
        boolean z11;
        xo0 xo0Var = new xo0(this, null, 1);
        t70.j0 j0Var = this.f5318h;
        m0.t(j0Var, null, null, xo0Var, 3);
        vv1 vv1VarS = t2.s(this.n, this.o, this.f5322l, frameLayout, map, scaleType);
        String strA = a(frameLayout);
        if (this.f5331w.f12398q0) {
            this.f5332x.a();
            z11 = true;
        } else {
            z11 = false;
        }
        m0.t(j0Var, null, null, new ap0(this, vv1VarS, strA, z11, null, 0), 3);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0033  */
    @Override // ads_mobile_sdk.zt1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final com.google.gson.r b(o oVar, ImageView.ScaleType mediaViewScaleType, LinkedHashMap assetViews) {
        boolean zD;
        Intrinsics.g(assetViews, "assetViews");
        Intrinsics.g(mediaViewScaleType, "mediaViewScaleType");
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.p("nas", a(oVar, mediaViewScaleType, assetViews));
        if (this.H.get()) {
            com.google.gson.r rVar2 = this.f5317g;
            if (rVar2 == null) {
                zD = false;
                if (zD) {
                    rVar.r("custom_click_gesture_eligible", Boolean.TRUE);
                }
            } else {
                try {
                    zD = rVar2.v("allow_custom_click_gesture").d();
                } catch (Exception unused) {
                }
                if (zD) {
                }
            }
        }
        return rVar;
    }

    public final String a(FrameLayout frameLayout) {
        kz2 kz2Var = this.n;
        wv0 wv0Var = wv0.CUI_NAME_VIEW_SIGNALS;
        mi3 mi3Var = this.o;
        EmptyList emptyList = EmptyList.f71733a;
        if (ji3.b().f4777a == null) {
            em2 em2VarA = kz2.a(kz2Var, wv0Var, emptyList, mi3Var);
            try {
                String strA = this.f5320j.a(frameLayout);
                em2VarA.close();
                return strA;
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
                String strA2 = this.f5320j.a(frameLayout);
                th3VarA.close();
                return strA2;
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
    }

    public final String a(View view, Map map) {
        for (Map.Entry entry : map.entrySet()) {
            String str = (String) entry.getKey();
            if (Intrinsics.b(view, (View) ((WeakReference) entry.getValue()).get())) {
                return str;
            }
        }
        gt1 gt1Var = this.f5321k.f4933b;
        if (gt1Var != null && fc.f15851a[gt1Var.ordinal()] == 1) {
            return "3099";
        }
        return null;
    }

    @Override // ads_mobile_sdk.zt1
    public final com.google.gson.r a(o oVar, ImageView.ScaleType mediaViewScaleType, LinkedHashMap assetViews) {
        Intrinsics.g(assetViews, "assetViews");
        Intrinsics.g(mediaViewScaleType, "mediaViewScaleType");
        vv1 vv1VarS = t2.s(this.n, this.o, this.f5322l, oVar, assetViews, mediaViewScaleType);
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.p("asset_view_signal", vv1VarS.f10912a);
        rVar.p("ad_view_signal", vv1VarS.f10913b);
        rVar.p("scroll_view_signal", vv1VarS.f10914c);
        rVar.p("lock_screen_signal", vv1VarS.f10915d);
        return rVar;
    }

    @Override // ads_mobile_sdk.zt1
    public final void a(View view, int i5) {
        boolean zD;
        boolean zD2 = false;
        boolean z11 = this.f5323m.b() != null;
        com.google.gson.r rVar = this.f5317g;
        if (rVar == null) {
            zD = false;
        } else {
            try {
                zD = rVar.v("allow_sdk_custom_click_gesture").d();
            } catch (Exception unused) {
            }
        }
        com.google.gson.r rVar2 = null;
        if (!zD) {
            if (!z11) {
                if (rVar != null) {
                    try {
                        zD2 = rVar.v("allow_custom_click_gesture").d();
                    } catch (Exception unused2) {
                    }
                }
                if (zD2) {
                    if (!this.H.get()) {
                        mu0.c("Custom click reporting failed. enableCustomClickGesture is not set.", null);
                        return;
                    }
                }
            }
            mu0.c("Custom click reporting failed. Ad unit id is not in the allow list.", null);
            return;
        }
        r1 r1Var = (r1) this.f12654c.get();
        if (r1Var == null) {
            mu0.a("Ad should be associated with an ad view before calling performClickForCustomGesture()", null, 6);
            return;
        }
        ew1 ew1Var = (ew1) r1Var;
        FrameLayout frameLayoutC = ew1Var.c();
        Map mapB = ew1Var.b();
        ImageView.ScaleType scaleTypeE = ew1Var.e();
        if (scaleTypeE == null) {
            scaleTypeE = ImageView.ScaleType.CENTER_INSIDE;
        }
        vv1 vv1VarS = t2.s(this.n, this.o, this.f5322l, frameLayoutC, mapB, scaleTypeE);
        String strA = a(view, ew1Var.b());
        com.google.gson.r rVarA = this.f5322l.a(strA, this.E, this.D);
        if (zD) {
            Point point = this.E;
            Point point2 = this.D;
            try {
                com.google.gson.r rVar3 = new com.google.gson.r();
                if (point != null) {
                    rVar3.q(Integer.valueOf(point.x), "x");
                    rVar3.q(Integer.valueOf(point.y), "y");
                }
                com.google.gson.r rVar4 = new com.google.gson.r();
                if (point2 != null) {
                    rVar4.q(Integer.valueOf(point2.x), "x");
                    rVar4.q(Integer.valueOf(point2.y), "y");
                }
                com.google.gson.r rVar5 = new com.google.gson.r();
                rVar5.p("start_point", rVar3);
                rVar5.p("end_point", rVar4);
                rVar5.q(Integer.valueOf(i5), "duration_ms");
                rVar2 = rVar5;
            } catch (Exception e3) {
                mu0.a("Error occurred while grabbing custom click gesture signals.", e3);
            }
            rVar.p("custom_click_gesture_signal", rVar2);
        }
        a(this, ew1Var.c(), vv1VarS, strA, rVarA, 16);
    }

    @Override // ads_mobile_sdk.zt1
    public final void a(o oVar, MotionEvent motionEvent) {
        this.f5322l.getClass();
        int[] iArr = new int[2];
        oVar.getLocationOnScreen(iArr);
        this.D = new Point(((int) motionEvent.getRawX()) - iArr[0], ((int) motionEvent.getRawY()) - iArr[1]);
        this.f5324p.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        this.G = jCurrentTimeMillis;
        if (motionEvent.getAction() == 0) {
            this.F = jCurrentTimeMillis;
            this.E = this.D;
        }
        MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
        Point point = this.D;
        motionEventObtain.setLocation(point.x, point.y);
        k8 k8Var = this.f5320j;
        k8Var.getClass();
        ga3 ga3Var = ((f7) k8Var.b().f1694a).f3211b;
        n nVar = (n) ga3Var.f3752f.get();
        if (nVar == null) {
            ga3Var.f3751e.b(yk0.EVENT_ID_EARLY_INPUT_EVENT);
        } else {
            nVar.a(motionEventObtain);
        }
        motionEventObtain.recycle();
    }

    @Override // ads_mobile_sdk.zt1
    public final void a(WeakReference weakReference, o oVar, LinkedHashMap assetViews, ew1 ew1Var, ew1 ew1Var2) {
        Intrinsics.g(assetViews, "assetViews");
        this.f12654c = weakReference;
        this.D = new Point();
        this.E = new Point();
        m0.t(this.f5319i, null, null, new b0(this, oVar, weakReference, (Continuation) null, 4), 3);
        oVar.setOnTouchListener(ew1Var);
        oVar.setClickable(true);
        oVar.setOnClickListener(ew1Var2);
        Iterator it = assetViews.entrySet().iterator();
        while (it.hasNext()) {
            View view = (View) ((WeakReference) ((Map.Entry) it.next()).getValue()).get();
            if (view != null) {
                view.setOnTouchListener(ew1Var);
                view.setClickable(true);
                view.setOnClickListener(ew1Var2);
            }
        }
    }

    @Override // ads_mobile_sdk.zt1
    public final void a(o oVar, LinkedHashMap assetViews) {
        Intrinsics.g(assetViews, "assetViews");
        this.f12654c = new WeakReference(null);
        this.f12655d = new WeakReference(null);
        this.D = new Point();
        this.E = new Point();
    }
}
