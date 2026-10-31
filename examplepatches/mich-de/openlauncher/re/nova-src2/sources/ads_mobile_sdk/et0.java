package ads_mobile_sdk;

import ads_mobile_sdk.et0;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.textclassifier.TextClassifier;
import android.webkit.CookieManager;
import android.webkit.DownloadListener;
import android.widget.RelativeLayout;
import android.widget.Toolbar;
import b.j2;
import b.k9;
import b.l2;
import b.t2;
import b0.b0;
import c3.c1;
import c80.d;
import com.google.android.libraries.ads.mobile.sdk.common.AdActivity;
import g.a0;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import mk.v;
import t70.m0;

/* loaded from: classes.dex */
public abstract class et0 extends g.s implements b.f4, j2 {
    public static final /* synthetic */ KProperty[] D = {t2.C(et0.class, "hasContentViewBeenSet", "getHasContentViewBeenSet()Z")};
    public boolean A;
    public t70.g2 B;
    public boolean C;

    /* renamed from: a, reason: collision with root package name */
    public final Context f2970a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f2971b;

    /* renamed from: c, reason: collision with root package name */
    public final CoroutineContext f2972c;

    /* renamed from: d, reason: collision with root package name */
    public final t70.j0 f2973d;

    /* renamed from: e, reason: collision with root package name */
    public final jr0 f2974e;

    /* renamed from: f, reason: collision with root package name */
    public final ci3 f2975f;

    /* renamed from: g, reason: collision with root package name */
    public final String f2976g;

    /* renamed from: h, reason: collision with root package name */
    public final rw0 f2977h;

    /* renamed from: i, reason: collision with root package name */
    public final uk f2978i;

    /* renamed from: j, reason: collision with root package name */
    public final Optional f2979j;

    /* renamed from: k, reason: collision with root package name */
    public t70.g2 f2980k;

    /* renamed from: l, reason: collision with root package name */
    public AdActivity f2981l;

    /* renamed from: m, reason: collision with root package name */
    public final io.sentry.e3 f2982m;
    public final AtomicBoolean n;
    public final AtomicBoolean o;

    /* renamed from: p, reason: collision with root package name */
    public RelativeLayout f2983p;

    /* renamed from: q, reason: collision with root package name */
    public ViewGroup f2984q;

    /* renamed from: r, reason: collision with root package name */
    public mi.b f2985r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f2986s;

    /* renamed from: t, reason: collision with root package name */
    public pu f2987t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f2988u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f2989v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f2990w;

    /* renamed from: x, reason: collision with root package name */
    public Toolbar f2991x;

    /* renamed from: y, reason: collision with root package name */
    public final d f2992y;

    /* renamed from: z, reason: collision with root package name */
    public int f2993z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public et0(Context applicationContext, t70.j0 uiScope, CoroutineContext uiContext, t70.j0 backgroundScope, jr0 flags, ci3 traceLogger, String afmaVersion, rw0 gmaUtil, uk backButtonStateDelegate, Optional optional) {
        super(true);
        Intrinsics.g(applicationContext, "applicationContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(gmaUtil, "gmaUtil");
        Intrinsics.g(backButtonStateDelegate, "backButtonStateDelegate");
        this.f2970a = applicationContext;
        this.f2971b = uiScope;
        this.f2972c = uiContext;
        this.f2973d = backgroundScope;
        this.f2974e = flags;
        this.f2975f = traceLogger;
        this.f2976g = afmaVersion;
        this.f2977h = gmaUtil;
        this.f2978i = backButtonStateDelegate;
        this.f2979j = optional;
        this.f2982m = new io.sentry.e3(Boolean.FALSE);
        this.n = new AtomicBoolean(false);
        this.o = new AtomicBoolean(false);
        this.f2992y = new d();
    }

    public abstract void a(int i5);

    @Override // b.j2
    public void a(pu puVar) {
        this.f2987t = puVar;
        AdActivity adActivity = this.f2981l;
        if (adActivity != null) {
            adActivity.finish();
        }
    }

    @Override // b.f4
    public final void a$1() {
        if (!j().f10131k.get()) {
            j().onResume();
        }
        this.f2979j.ifPresent(new l2(4));
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x0071, code lost:
    
        if (r5 == r1) goto L26;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(tx0 tx0Var, ContinuationImpl continuationImpl) throws Throwable {
        ns0 ns0Var;
        if (continuationImpl instanceof ns0) {
            ns0Var = (ns0) continuationImpl;
            int i5 = ns0Var.f7670d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ns0Var.f7670d = i5 - Integer.MIN_VALUE;
            } else {
                ns0Var = new ns0(this, continuationImpl);
            }
        }
        Object obj = ns0Var.f7668b;
        Object obj2 = CoroutineSingletons.f71806a;
        int i11 = ns0Var.f7670d;
        Object obj3 = null;
        boolean z11 = false;
        if (i11 == 0) {
            ResultKt.b(obj);
            com.google.gson.r rVar = new com.google.gson.r();
            rVar.s("version", this.f2976g);
            m0.u(EmptyCoroutineContext.f71803a, new aq1(tx0Var, rVar, z11 ? 1 : 0, 1));
            ns0Var.f7667a = tx0Var;
            ns0Var.f7670d = 1;
            if (tx0Var.c("aes2", ns0Var) != obj2) {
            }
            return obj2;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        tx0Var = ns0Var.f7667a;
        ResultKt.b(obj);
        ns0Var.f7667a = null;
        ns0Var.f7670d = 2;
        x60 x60Var = tx0Var.f10124d;
        if (x60Var != null) {
            Object objA = x60.a(x60Var, "native:view_show", ns0Var);
            obj3 = objA;
            if (objA != obj2) {
                obj3 = (kh3) objA;
            }
        }
    }

    public abstract Object b(ContinuationImpl continuationImpl);

    public Object c(SuspendLambda suspendLambda) {
        return a(this, suspendLambda);
    }

    public Unit d(Continuation continuation) {
        return Unit.f71706a;
    }

    @Override // b.f4
    public final void e() {
        this.f2982m.setValue(this, D[0], Boolean.TRUE);
    }

    public boolean f() {
        return false;
    }

    public final View g() {
        ViewGroup viewGroup = this.f2984q;
        if (viewGroup != null) {
            return viewGroup;
        }
        Intrinsics.m("contentView");
        throw null;
    }

    public boolean h() {
        return false;
    }

    @Override // g.s
    public final void handleOnBackPressed() {
        a0 onBackPressedDispatcher;
        if (j().canGoBack()) {
            j().goBack();
            return;
        }
        if (!this.f2978i.f10382a.get() && !j().f10131k.get()) {
            hs0 hs0Var = new hs0(this, null, 1);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f2971b;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(hs0Var, null), 2);
            return;
        }
        this.f2987t = pu.f8384a;
        setEnabled(false);
        AdActivity adActivity = this.f2981l;
        if (adActivity == null || (onBackPressedDispatcher = adActivity.getOnBackPressedDispatcher()) == null) {
            return;
        }
        onBackPressedDispatcher.d();
    }

    public boolean i() {
        return false;
    }

    public abstract tx0 j();

    public abstract int k();

    public final void l() {
        ct0 ct0Var = new ct0(this, null, 4);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f2973d;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        this.f2980k = m0.t(j0Var, context, null, new ar.a(ct0Var, null), 2);
    }

    public final void n() {
        AdActivity adActivity = this.f2981l;
        if (adActivity == null || !adActivity.isFinishing() || this.o.get()) {
            return;
        }
        ct0 ct0Var = new ct0(this, null, 0);
        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
        t70.j0 j0Var = this.f2971b;
        Intrinsics.g(j0Var, "<this>");
        Intrinsics.g(context, "context");
        m0.t(j0Var, context, null, new ar.a(ct0Var, null), 2);
    }

    public final void o() {
        try {
            AdActivity adActivity = this.f2981l;
            if (adActivity == null) {
                return;
            }
            adActivity.setRequestedOrientation(k());
        } catch (IllegalStateException e3) {
            cz.b bVar = mu0.f7335a;
            mu0.c("Unable to update orientation: " + e3, null);
        }
    }

    @Override // b.f4
    public final void onConfigurationChanged(Configuration configuration) {
    }

    @Override // b.f4
    public final void onDestroy() {
        n();
        this.f2979j.ifPresent(new l2(3));
    }

    @Override // b.f4
    public final void onPause() {
        n();
        this.f2979j.ifPresent(new l2(1));
    }

    @Override // b.f4
    public final void onResume() {
        AdActivity adActivity;
        Window window;
        AdActivity adActivity2 = this.f2981l;
        if (adActivity2 != null && !adActivity2.isInMultiWindowMode() && (adActivity = this.f2981l) != null && (window = adActivity.getWindow()) != null) {
            a5.d dVarI = v.I(window.getDecorView(), window);
            if (this.f2988u) {
                dVarI.I();
            }
            dVarI.F(this.f2988u ? 7 : 1);
        }
        if (!j().f10131k.get()) {
            j().onResume();
        }
        this.f2979j.ifPresent(new l2(0));
    }

    @Override // b.f4
    public void onStop() {
        if (!j().f10131k.get()) {
            j().onPause();
        }
        n();
        this.f2979j.ifPresent(new l2(5));
    }

    @Override // b.f4
    public final void c() {
        this.f2979j.ifPresent(new l2(6));
    }

    public Object e(ct0 ct0Var) {
        return Unit.f71706a;
    }

    public Toolbar a(RelativeLayout relativeLayout) {
        return a(relativeLayout, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public final Toolbar a(RelativeLayout relativeLayout, String str) {
        Toolbar toolbar = new Toolbar(this.f2981l);
        toolbar.setId(View.generateViewId());
        g().setId(View.generateViewId());
        toolbar.setBackgroundColor(-12303292);
        toolbar.setTitleMarginStart(0);
        toolbar.setSubtitle(str);
        toolbar.setVisibility(0);
        toolbar.setContentDescription("gma_custom_webview_toolbar");
        try {
            toolbar.setNavigationIcon(this.f2970a.getResources().getDrawable(2131231042, null));
        } catch (Resources.NotFoundException e3) {
            mu0.a("Error obtaining close icon.", e3, 4);
        } catch (NullPointerException e11) {
            mu0.a("Error obtaining close icon.", e11, 4);
        }
        toolbar.setNavigationOnClickListener(new ay.k(this, 1));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(10);
        relativeLayout.addView(toolbar, layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(3, toolbar.getId());
        layoutParams2.addRule(12);
        relativeLayout.addView(g(), layoutParams2);
        return toolbar;
    }

    @Override // b.f4
    public final void b() {
        this.f2979j.ifPresent(new l2(7));
    }

    /* JADX WARN: Code restructure failed: missing block: B:68:0x0139, code lost:
    
        if (t70.m0.y(r12, r4, r0) != r1) goto L70;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x00e4  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00fe A[Catch: all -> 0x0039, PHI: r2 r11
      0x00fe: PHI (r2v6 ads_mobile_sdk.et0) = (r2v5 ads_mobile_sdk.et0), (r2v8 ads_mobile_sdk.et0) binds: [B:59:0x00fb, B:22:0x0044] A[DONT_GENERATE, DONT_INLINE]
      0x00fe: PHI (r11v8 c80.d) = (r11v25 c80.d), (r11v26 c80.d) binds: [B:59:0x00fb, B:22:0x0044] A[DONT_GENERATE, DONT_INLINE], TRY_ENTER, TRY_LEAVE, TryCatch #0 {all -> 0x0039, blocks: (B:16:0x0034, B:70:0x013c, B:61:0x00fe, B:64:0x0104, B:66:0x0108, B:67:0x0126), top: B:75:0x0024 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r11v0, types: [ads_mobile_sdk.et0, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v1 */
    /* JADX WARN: Type inference failed for: r11v22 */
    /* JADX WARN: Type inference failed for: r11v23 */
    /* JADX WARN: Type inference failed for: r11v24 */
    /* JADX WARN: Type inference failed for: r11v9 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(et0 et0Var, ContinuationImpl continuationImpl) {
        is0 is0Var;
        et0 et0Var2;
        RelativeLayout relativeLayout;
        mi.b bVar;
        jr0 jr0Var;
        RelativeLayout relativeLayout2;
        et0 et0Var3;
        et0 et0Var4;
        Object objE;
        d dVar;
        boolean z11;
        t70.j0 j0Var;
        if (continuationImpl instanceof is0) {
            is0Var = (is0) continuationImpl;
            int i5 = is0Var.f4929e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                is0Var.f4929e = i5 - Integer.MIN_VALUE;
            } else {
                is0Var = new is0(et0Var, continuationImpl);
            }
        }
        Object obj = is0Var.f4927c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = is0Var.f4929e;
        int i12 = 1;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                if (et0Var.o.getAndSet(true)) {
                    return Boolean.FALSE;
                }
                t70.g2 g2Var = et0Var.f2980k;
                if (g2Var != null) {
                    g2Var.c(null);
                }
                et0Var.f2978i.f10382a.set(true);
                AdActivity adActivity = et0Var.f2981l;
                et0Var2 = et0Var;
                if (adActivity != null) {
                    CoroutineContext coroutineContext = et0Var.f2972c;
                    androidx.room.c cVar = new androidx.room.c(adActivity, continuation, 10);
                    is0Var.f4925a = et0Var;
                    is0Var.f4929e = 1;
                    et0Var2 = et0Var;
                    if (m0.y(coroutineContext, cVar, is0Var) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    if (i11 == 2) {
                        et0Var2 = (et0) is0Var.f4925a;
                        ResultKt.b(obj);
                        relativeLayout = et0Var2.f2983p;
                        if (relativeLayout != null) {
                            relativeLayout.removeView(et0Var2.g());
                        }
                        bVar = et0Var2.f2985r;
                        if (bVar != null && (relativeLayout2 = et0Var2.f2983p) != null) {
                            relativeLayout2.removeView(bVar);
                        }
                        et0Var2.f2985r = null;
                        jr0Var = et0Var2.f2974e;
                        jr0Var.getClass();
                        et0Var3 = et0Var2;
                        if (((Boolean) jr0Var.a("gad:interstitial_notify_publisher_without_delay", Boolean.FALSE, jn.a$10)).booleanValue()) {
                            is0Var.f4925a = et0Var2;
                            is0Var.f4929e = 3;
                            Unit unitD = et0Var2.d(is0Var);
                            et0Var3 = et0Var2;
                            if (unitD != coroutineSingletons) {
                            }
                            return coroutineSingletons;
                        }
                        et0Var4 = et0Var3;
                        d dVar2 = et0Var4.f2992y;
                        is0Var.f4925a = et0Var4;
                        is0Var.f4926b = dVar2;
                        is0Var.f4929e = 4;
                        objE = dVar2.e(is0Var);
                        dVar = dVar2;
                        if (objE != coroutineSingletons) {
                        }
                        return coroutineSingletons;
                    }
                    if (i11 == 3) {
                        et0 et0Var5 = (et0) is0Var.f4925a;
                        ResultKt.b(obj);
                        et0Var3 = et0Var5;
                        et0Var4 = et0Var3;
                        d dVar22 = et0Var4.f2992y;
                        is0Var.f4925a = et0Var4;
                        is0Var.f4926b = dVar22;
                        is0Var.f4929e = 4;
                        objE = dVar22.e(is0Var);
                        dVar = dVar22;
                        if (objE != coroutineSingletons) {
                            z11 = et0Var4.A;
                            j0Var = et0Var4.f2973d;
                            if (!z11) {
                            }
                            CoroutineContext coroutineContext2 = j0Var.getCoroutineContext();
                            ct0 ct0Var = new ct0(et0Var4, continuation, i12);
                            is0Var.f4925a = dVar;
                            is0Var.f4926b = null;
                            is0Var.f4929e = 5;
                            et0Var = dVar;
                        }
                        return coroutineSingletons;
                    }
                    if (i11 != 4) {
                        if (i11 != 5) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        c80.a aVar = (c80.a) is0Var.f4925a;
                        ResultKt.b(obj);
                        et0Var = aVar;
                        Unit unit = Unit.f71706a;
                        ((d) et0Var).g(null);
                        return Boolean.TRUE;
                    }
                    d dVar3 = is0Var.f4926b;
                    et0Var4 = (et0) is0Var.f4925a;
                    ResultKt.b(obj);
                    dVar = dVar3;
                    z11 = et0Var4.A;
                    j0Var = et0Var4.f2973d;
                    if (!z11 && !et0Var4.C) {
                        b0 b0Var = new b0(et0Var4, continuation, 7);
                        EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                        Intrinsics.g(j0Var, "<this>");
                        Intrinsics.g(context, "context");
                        et0Var4.B = m0.t(j0Var, context, null, new ar.a(b0Var, null), 2);
                        et0Var = dVar;
                    } else {
                        CoroutineContext coroutineContext22 = j0Var.getCoroutineContext();
                        ct0 ct0Var2 = new ct0(et0Var4, continuation, i12);
                        is0Var.f4925a = dVar;
                        is0Var.f4926b = null;
                        is0Var.f4929e = 5;
                        et0Var = dVar;
                    }
                    Unit unit2 = Unit.f71706a;
                    ((d) et0Var).g(null);
                    return Boolean.TRUE;
                }
                et0 et0Var6 = (et0) is0Var.f4925a;
                ResultKt.b(obj);
                et0Var2 = et0Var6;
            }
            et0Var2.f2981l = null;
            is0Var.f4925a = et0Var2;
            is0Var.f4929e = 2;
            Object objA = et0Var2.a(et0Var2.j(), (ContinuationImpl) is0Var);
            if (objA != coroutineSingletons) {
                objA = Unit.f71706a;
            }
            if (objA != coroutineSingletons) {
                relativeLayout = et0Var2.f2983p;
                if (relativeLayout != null) {
                }
                bVar = et0Var2.f2985r;
                if (bVar != null) {
                    relativeLayout2.removeView(bVar);
                }
                et0Var2.f2985r = null;
                jr0Var = et0Var2.f2974e;
                jr0Var.getClass();
                et0Var3 = et0Var2;
                if (((Boolean) jr0Var.a("gad:interstitial_notify_publisher_without_delay", Boolean.FALSE, jn.a$10)).booleanValue()) {
                }
                et0Var4 = et0Var3;
                d dVar222 = et0Var4.f2992y;
                is0Var.f4925a = et0Var4;
                is0Var.f4926b = dVar222;
                is0Var.f4929e = 4;
                objE = dVar222.e(is0Var);
                dVar = dVar222;
                if (objE != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th2) {
            ((d) et0Var).g(null);
            throw th2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00bf A[PHI: r2 r11
      0x00bf: PHI (r2v7 ads_mobile_sdk.et0) = (r2v6 ads_mobile_sdk.et0), (r2v12 ads_mobile_sdk.et0) binds: [B:40:0x00bc, B:18:0x0039] A[DONT_GENERATE, DONT_INLINE]
      0x00bf: PHI (r11v3 ads_mobile_sdk.tx0) = (r11v2 ads_mobile_sdk.tx0), (r11v10 ads_mobile_sdk.tx0) binds: [B:40:0x00bc, B:18:0x0039] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, ContinuationImpl continuationImpl) {
        ms0 ms0Var;
        int iOrdinal;
        String strValueOf;
        et0 et0Var;
        et0 et0Var2;
        x60 x60Var;
        Object objA;
        if (continuationImpl instanceof ms0) {
            ms0Var = (ms0) continuationImpl;
            int i5 = ms0Var.f7329f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ms0Var.f7329f = i5 - Integer.MIN_VALUE;
            } else {
                ms0Var = new ms0(this, continuationImpl);
            }
        }
        Object obj = ms0Var.f7327d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ms0Var.f7329f;
        if (i11 == 0) {
            ResultKt.b(obj);
            pu puVar = this.f2987t;
            if (puVar != null) {
                iOrdinal = puVar.ordinal();
            } else {
                pu puVar2 = pu.f8384a;
                iOrdinal = 3;
            }
            strValueOf = String.valueOf(iOrdinal);
            com.google.gson.r rVar = new com.google.gson.r();
            rVar.s("closetype", strValueOf);
            rVar.s("version", this.f2976g);
            ms0Var.f7324a = this;
            ms0Var.f7325b = tx0Var;
            ms0Var.f7326c = strValueOf;
            ms0Var.f7329f = 1;
            if (tx0Var.a(rVar, "onhide", ms0Var) != coroutineSingletons) {
                et0Var = this;
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    if (i11 != 4) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                tx0Var = ms0Var.f7325b;
                et0Var2 = ms0Var.f7324a;
                ResultKt.b(obj);
                if (et0Var2.f2987t != pu.f8384a) {
                    ms0Var.f7324a = null;
                    ms0Var.f7325b = null;
                    ms0Var.f7329f = 4;
                    Object objC = tx0Var.c("aebb2", ms0Var);
                    return objC == coroutineSingletons ? coroutineSingletons : objC;
                }
                return Unit.f71706a;
            }
            String str = ms0Var.f7326c;
            tx0 tx0Var2 = ms0Var.f7325b;
            et0 et0Var3 = ms0Var.f7324a;
            ResultKt.b(obj);
            strValueOf = str;
            tx0Var = tx0Var2;
            et0Var2 = et0Var3;
            ms0Var.f7324a = et0Var2;
            ms0Var.f7325b = tx0Var;
            ms0Var.f7326c = null;
            ms0Var.f7329f = 3;
            x60Var = tx0Var.f10124d;
            if (x60Var == null) {
                objA = x60Var.a("close_type", strValueOf, true, (ContinuationImpl) ms0Var);
                if (objA != coroutineSingletons) {
                    objA = Unit.f71706a;
                }
            } else {
                objA = null;
            }
            if (objA != coroutineSingletons) {
                if (et0Var2.f2987t != pu.f8384a) {
                }
            }
        }
        String str2 = ms0Var.f7326c;
        tx0 tx0Var3 = ms0Var.f7325b;
        et0Var = ms0Var.f7324a;
        ResultKt.b(obj);
        strValueOf = str2;
        tx0Var = tx0Var3;
        ms0Var.f7324a = et0Var;
        ms0Var.f7325b = tx0Var;
        ms0Var.f7326c = strValueOf;
        ms0Var.f7329f = 2;
        if (tx0Var.c("aeh2", ms0Var) != coroutineSingletons) {
            et0Var2 = et0Var;
            ms0Var.f7324a = et0Var2;
            ms0Var.f7325b = tx0Var;
            ms0Var.f7326c = null;
            ms0Var.f7329f = 3;
            x60Var = tx0Var.f10124d;
            if (x60Var == null) {
            }
            if (objA != coroutineSingletons) {
            }
        }
    }

    public final boolean a(Context context) {
        ci3 ci3Var = this.f2975f;
        t70.j0 j0Var = this.f2973d;
        Intrinsics.g(context, "context");
        Continuation continuation = null;
        try {
            j().o = this;
            context.startActivity(this.f2977h.a(context, this));
            l();
            return true;
        } catch (ActivityNotFoundException e3) {
            zi3.a(j0Var, new ct0(this, continuation, 2));
            zi3.a(4, "Exception starting Activity", e3);
            ci3Var.a("AdActivityLauncher.show", (Throwable) e3);
            return false;
        } catch (SecurityException e11) {
            zi3.a(j0Var, new ct0(this, continuation, 3));
            zi3.a(4, "Exception starting Activity", e11);
            ci3Var.a("AdActivityLauncher.show", (Throwable) e11);
            return false;
        }
    }

    public void a(mi.b bVar) {
    }

    @Override // b.f4
    public final void a(AdActivity adActivity) throws Throwable {
        Window window;
        this.f2981l = adActivity;
        if (this.o.get()) {
            adActivity.finish();
            return;
        }
        if (!this.n.getAndSet(true)) {
            t70.g2 g2Var = this.f2980k;
            Continuation continuation = null;
            if (g2Var != null) {
                g2Var.c(null);
            }
            adActivity.getOnBackPressedDispatcher().a(adActivity, this);
            jn jnVar = jn.a$10;
            o();
            if (i()) {
                j().setLayerType(1, null);
            } else {
                Window window2 = adActivity.getWindow();
                if (window2 != null) {
                    window2.setFlags(16777216, 16777216);
                }
            }
            RelativeLayout relativeLayout = new RelativeLayout(adActivity);
            relativeLayout.setId(View.generateViewId());
            relativeLayout.setBackgroundColor(this.f2989v ? 0 : -16777216);
            this.f2983p = relativeLayout;
            int i5 = Build.VERSION.SDK_INT;
            jr0 jr0Var = this.f2974e;
            if (i5 >= 31) {
                jr0Var.getClass();
                if (((Boolean) jr0Var.a("gads:enable_blur_transparent_background", Boolean.TRUE, jnVar)).booleanValue() && (window = adActivity.getWindow()) != null) {
                    window.setBackgroundBlurRadius(this.f2993z);
                }
            }
            if (this.f2990w) {
                CookieManager.getInstance().setAcceptThirdPartyCookies(j(), false);
                jr0Var.getClass();
                Boolean bool = Boolean.FALSE;
                if (((Boolean) jr0Var.a("gads:custom_webview_disable_text_classifier:enabled", bool, jnVar)).booleanValue() && i5 >= 27) {
                    j().setTextClassifier(TextClassifier.NO_OP);
                }
                if (((Boolean) jr0Var.a("gads:custom_webview_disable_downloads:enabled", bool, jnVar)).booleanValue()) {
                    j().setDownloadListener(new DownloadListener() { // from class: b.m2
                        @Override // android.webkit.DownloadListener
                        public final void onDownloadStart(String str, String str2, String str3, String str4, long j11) {
                            KProperty[] kPropertyArr = et0.D;
                        }
                    });
                }
                if (i5 >= 28) {
                    adActivity.setShowWhenLocked(true);
                } else {
                    adActivity.getWindow().addFlags(524288);
                }
                this.f2991x = a(relativeLayout);
            } else {
                relativeLayout.addView(g(), -1, -1);
                int iIntValue = ((Number) jr0Var.a("gad:interstitial:close_button_padding_dip", k9.q(jr0Var, "gad:interstitial:close_button_padding_dip", 20), jn.a$15)).intValue();
                boolean zBooleanValue = ((Boolean) jr0Var.a("gads:force_top_right_close_button:enabled", Boolean.TRUE, jnVar)).booleanValue();
                mi.b bVar = new mi.b(adActivity, (String) jr0Var.a("gads:close_button_asset_name", "white", u.a$7), new ju(zBooleanValue ? iIntValue : 0, zBooleanValue ? 0 : iIntValue, iIntValue));
                RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
                layoutParams.addRule(10);
                if (zBooleanValue) {
                    layoutParams.addRule(11);
                } else {
                    layoutParams.addRule(9);
                }
                this.f2985r = bVar;
                bVar.f76412b = new c1(this, 3);
                if ((this.f2986s && !h()) || f()) {
                    mi.b bVar2 = this.f2985r;
                    if (bVar2 != null) {
                        bVar2.setVisibility(8);
                    }
                    this.f2986s = true;
                } else {
                    mi.b bVar3 = this.f2985r;
                    if (bVar3 != null) {
                        bVar3.setVisibility(0);
                    }
                    this.f2986s = false;
                }
                RelativeLayout relativeLayout2 = this.f2983p;
                if (relativeLayout2 != null) {
                    relativeLayout2.addView(bVar, layoutParams);
                }
                a(bVar);
            }
            RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -1);
            layoutParams2.addRule(10);
            layoutParams2.addRule(9);
            adActivity.setContentView(relativeLayout, layoutParams2);
            m0.u(EmptyCoroutineContext.f71803a, new hs0(this, continuation, 0));
            ar.a aVar = new ar.a(this, relativeLayout, continuation, 10);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            t70.j0 j0Var = this.f2973d;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(aVar, null), 2);
        }
        this.f2979j.ifPresent(new l2(2));
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0071, code lost:
    
        if (r6.b(r0) == r1) goto L32;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:38:0x007f A[Catch: all -> 0x002f, TryCatch #1 {all -> 0x002f, blocks: (B:13:0x002b, B:36:0x007b, B:38:0x007f, B:39:0x0082, B:41:0x0086), top: B:48:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v3, types: [c80.a] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        dt0 dt0Var;
        d dVar;
        et0 et0Var;
        Throwable th2;
        c80.a aVar;
        et0 et0Var2;
        t70.g2 g2Var;
        if (continuationImpl instanceof dt0) {
            dt0Var = (dt0) continuationImpl;
            int i5 = dt0Var.f2621f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dt0Var.f2621f = i5 - Integer.MIN_VALUE;
            } else {
                dt0Var = new dt0(this, continuationImpl);
            }
        }
        Object obj = dt0Var.f2619d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dt0Var.f2621f;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dt0Var.f2616a = this;
                dVar = this.f2992y;
                dt0Var.f2617b = dVar;
                dt0Var.f2618c = z11;
                dt0Var.f2621f = 1;
                if (dVar.e(dt0Var) != coroutineSingletons) {
                    et0Var = this;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                aVar = dt0Var.f2617b;
                et0Var2 = dt0Var.f2616a;
                try {
                    ResultKt.b(obj);
                    g2Var = et0Var2.B;
                    if (g2Var != null) {
                        g2Var.c(null);
                    }
                    et0Var2.B = null;
                    Unit unit = Unit.f71706a;
                    ((d) aVar).g(null);
                    return unit;
                } catch (Throwable th3) {
                    th2 = th3;
                    ((d) aVar).g(null);
                    throw th2;
                }
            }
            z11 = dt0Var.f2618c;
            ?? r22 = dt0Var.f2617b;
            et0Var = dt0Var.f2616a;
            ResultKt.b(obj);
            dVar = r22;
            if (!et0Var.C) {
                et0Var.A = z11;
                if (!z11) {
                    et0Var.C = true;
                    if (et0Var.B != null) {
                        dt0Var.f2616a = et0Var;
                        dt0Var.f2617b = dVar;
                        dt0Var.f2621f = 2;
                    }
                    aVar = dVar;
                    et0Var2 = et0Var;
                    g2Var = et0Var2.B;
                    if (g2Var != null) {
                    }
                    et0Var2.B = null;
                    Unit unit2 = Unit.f71706a;
                    ((d) aVar).g(null);
                    return unit2;
                }
            }
            aVar = dVar;
            Unit unit22 = Unit.f71706a;
            ((d) aVar).g(null);
            return unit22;
        } catch (Throwable th4) {
            d dVar2 = dVar;
            th2 = th4;
            aVar = dVar2;
            ((d) aVar).g(null);
            throw th2;
        }
    }

    public Object a(ni.s sVar, Continuation continuation) {
        return Unit.f71706a;
    }

    public Object a(View view, Continuation continuation) {
        return Unit.f71706a;
    }
}
