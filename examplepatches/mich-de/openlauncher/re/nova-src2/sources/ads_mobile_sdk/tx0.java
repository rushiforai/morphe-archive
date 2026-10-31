package ads_mobile_sdk;

import ae.i;
import android.content.Context;
import android.os.Looper;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import androidx.compose.ui.node.LayoutNode;
import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewFeature;
import b.c0;
import b.d0;
import b.n;
import b.x7;
import java.io.Closeable;
import java.util.UUID;
import java.util.WeakHashMap;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.io.CloseableKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.TimeoutCancellationException;
import t70.m0;

/* loaded from: classes.dex */
public final class tx0 extends WebView {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f10121a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f10122b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f10123c;

    /* renamed from: d, reason: collision with root package name */
    public final x60 f10124d;

    /* renamed from: e, reason: collision with root package name */
    public final ci3 f10125e;

    /* renamed from: f, reason: collision with root package name */
    public final k8 f10126f;

    /* renamed from: g, reason: collision with root package name */
    public final x7 f10127g;

    /* renamed from: h, reason: collision with root package name */
    public final p01 f10128h;

    /* renamed from: i, reason: collision with root package name */
    public final jr0 f10129i;

    /* renamed from: j, reason: collision with root package name */
    public final xj f10130j;

    /* renamed from: k, reason: collision with root package name */
    public final AtomicBoolean f10131k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicBoolean f10132l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicBoolean f10133m;
    public final AtomicBoolean n;
    public et0 o;

    /* renamed from: p, reason: collision with root package name */
    public volatile b.c7 f10134p;

    /* renamed from: q, reason: collision with root package name */
    public sy0 f10135q;

    /* renamed from: r, reason: collision with root package name */
    public fs3 f10136r;

    /* renamed from: s, reason: collision with root package name */
    public int f10137s;

    /* renamed from: t, reason: collision with root package name */
    public i f10138t;

    /* renamed from: u, reason: collision with root package name */
    public final kh3 f10139u;

    /* renamed from: v, reason: collision with root package name */
    public kh3 f10140v;

    /* renamed from: w, reason: collision with root package name */
    public final DisplayMetrics f10141w;

    /* renamed from: x, reason: collision with root package name */
    public b.u7 f10142x;

    /* renamed from: y, reason: collision with root package name */
    public iy0 f10143y;

    /* renamed from: z, reason: collision with root package name */
    public final ConcurrentLinkedQueue f10144z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tx0(CoroutineContext uiContext, t70.j0 uiScope, t70.j0 backgroundScope, x60 x60Var, ci3 traceLogger, k8 adSpamClient, Context context, String userAgent, fs3 size, x7 webViewCompatWrapper, p01 htmlUtil, jr0 flags, xj appState) throws Throwable {
        super(context);
        Intrinsics.g(uiContext, "uiContext");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(traceLogger, "traceLogger");
        Intrinsics.g(adSpamClient, "adSpamClient");
        Intrinsics.g(context, "context");
        Intrinsics.g(userAgent, "userAgent");
        Intrinsics.g(size, "size");
        Intrinsics.g(webViewCompatWrapper, "webViewCompatWrapper");
        Intrinsics.g(htmlUtil, "htmlUtil");
        Intrinsics.g(flags, "flags");
        Intrinsics.g(appState, "appState");
        this.f10121a = uiContext;
        this.f10122b = uiScope;
        this.f10123c = backgroundScope;
        this.f10124d = x60Var;
        this.f10125e = traceLogger;
        this.f10126f = adSpamClient;
        this.f10127g = webViewCompatWrapper;
        this.f10128h = htmlUtil;
        this.f10129i = flags;
        this.f10130j = appState;
        this.f10131k = new AtomicBoolean(false);
        this.f10132l = new AtomicBoolean(false);
        this.f10133m = new AtomicBoolean(false);
        this.n = new AtomicBoolean(false);
        this.f10136r = size;
        this.f10137s = -1;
        Continuation continuation = null;
        this.f10139u = (kh3) m0.u(EmptyCoroutineContext.f71803a, new bx0(this, continuation, 6));
        this.f10141w = d0.g(context);
        this.f10144z = new ConcurrentLinkedQueue();
        m0.u(EmptyCoroutineContext.f71803a, new bx0(this, continuation, 7));
        WebSettings settings = getSettings();
        settings.setAllowContentAccess(false);
        settings.setAllowFileAccess(false);
        settings.setMixedContentMode(2);
        settings.setBuiltInZoomControls(true);
        settings.setDisplayZoomControls(false);
        settings.setTextZoom(100);
        settings.setSupportMultipleWindows(true);
        settings.setSupportZoom(true);
        settings.setDatabaseEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setJavaScriptEnabled(true);
        settings.setJavaScriptCanOpenWindowsAutomatically(true);
        settings.setMediaPlaybackRequiresUserGesture(false);
        settings.setUserAgentString(userAgent);
        Boolean bool = Boolean.FALSE;
        jn jnVar = jn.a$10;
        if (((Boolean) flags.a("gads:clear_webview_cache:enabled", bool, jnVar)).booleanValue()) {
            clearCache(true);
        }
        setWillNotDraw(false);
        setLayerType(0, null);
        removeJavascriptInterface("accessibility");
        removeJavascriptInterface("accessibilityTraversal");
        setBackgroundColor(0);
        if (((Boolean) flags.a("gads:webview_sound_effects:disabled", Boolean.TRUE, jnVar)).booleanValue()) {
            setSoundEffectsEnabled(false);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00f9  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0109  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, UUID uuid, ContinuationImpl continuationImpl) {
        zw0 zw0Var;
        UUID uuid2;
        t70.r rVar;
        String str3;
        String str4;
        tx0 tx0Var;
        tx0 tx0Var2;
        tx0 tx0Var3;
        if (continuationImpl instanceof zw0) {
            zw0Var = (zw0) continuationImpl;
            int i5 = zw0Var.f12702h;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zw0Var.f12702h = i5 - Integer.MIN_VALUE;
            } else {
                zw0Var = new zw0(this, continuationImpl);
            }
        }
        Object objL = zw0Var.f12700f;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zw0Var.f12702h;
        Continuation continuation = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        if (i11 == 0) {
            ResultKt.b(objL);
            if (this.f10131k.get()) {
                return bv0.f1574c;
            }
            t70.s sVarB = m0.b();
            b.u7 u7VarC = c();
            String string = uuid.toString();
            Intrinsics.f(string, "toString(...)");
            zw0Var.f12695a = this;
            zw0Var.f12696b = str;
            zw0Var.f12697c = str2;
            uuid2 = uuid;
            zw0Var.f12698d = uuid2;
            zw0Var.f12699e = sVarB;
            zw0Var.f12702h = 1;
            Object objA = u7VarC.a(string, sVarB, zw0Var);
            if (objA != coroutineSingletons) {
                rVar = sVarB;
                objL = objA;
                str3 = str2;
                str4 = str;
                tx0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                tx0Var2 = zw0Var.f12695a;
                try {
                    ResultKt.b(objL);
                    return new xu0(objL);
                } catch (Exception e3) {
                    e = e3;
                    tx0Var3 = tx0Var2;
                    if (!(e instanceof CancellationException)) {
                    }
                    return new qu0(e, objArr2 == true ? 1 : 0, objArr == true ? 1 : 0, 6);
                }
            }
            rVar = (t70.r) zw0Var.f12696b;
            tx0Var3 = zw0Var.f12695a;
            try {
                ResultKt.b(objL);
                zw0Var.f12695a = tx0Var3;
                zw0Var.f12696b = null;
                zw0Var.f12702h = 3;
                objL = rVar.l(zw0Var);
                if (objL != coroutineSingletons) {
                    tx0Var2 = tx0Var3;
                    return new xu0(objL);
                }
                return coroutineSingletons;
            } catch (Exception e11) {
                e = e11;
                if (!(e instanceof CancellationException)) {
                    m0.t(tx0Var3.f10122b, null, null, new bx0(tx0Var3, continuation, 0), 3);
                }
                return new qu0(e, objArr2 == true ? 1 : 0, objArr == true ? 1 : 0, 6);
            }
        }
        rVar = zw0Var.f12699e;
        UUID uuid3 = zw0Var.f12698d;
        String str5 = zw0Var.f12697c;
        String str6 = (String) zw0Var.f12696b;
        tx0 tx0Var4 = zw0Var.f12695a;
        ResultKt.b(objL);
        str4 = str6;
        tx0Var = tx0Var4;
        uuid2 = uuid3;
        str3 = str5;
        if (!((Boolean) objL).booleanValue()) {
            return new tu0("Unable to register result listener. Did you forget to register the result GMSG handler?", wd1.f11213a);
        }
        b.k3 k3Var = tx0Var.f10129i.f5357s;
        k3Var.getClass();
        String str7 = ((Boolean) k3Var.a("gads:use_javascript_interface_for_result:enabled", Boolean.TRUE, jn.a$10)).booleanValue() ? "1" : "0";
        try {
            CoroutineContext coroutineContext = tx0Var.f10121a;
            ax0 ax0Var = new ax0(tx0Var, str4, uuid2, str3, str7, (Continuation) null);
            zw0Var.f12695a = tx0Var;
            zw0Var.f12696b = rVar;
            zw0Var.f12697c = null;
            zw0Var.f12698d = null;
            zw0Var.f12699e = null;
            zw0Var.f12702h = 2;
            if (m0.y(coroutineContext, ax0Var, zw0Var) != coroutineSingletons) {
                tx0Var3 = tx0Var;
                zw0Var.f12695a = tx0Var3;
                zw0Var.f12696b = null;
                zw0Var.f12702h = 3;
                objL = rVar.l(zw0Var);
                if (objL != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } catch (Exception e12) {
            e = e12;
            tx0Var2 = tx0Var;
            tx0Var3 = tx0Var2;
            if (!(e instanceof CancellationException)) {
            }
            return new qu0(e, objArr2 == true ? 1 : 0, objArr == true ? 1 : 0, 6);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, String str2, UUID uuid, ContinuationImpl continuationImpl) {
        cx0 cx0Var;
        if (continuationImpl instanceof cx0) {
            cx0Var = (cx0) continuationImpl;
            int i5 = cx0Var.f2091d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cx0Var.f2091d = i5 - Integer.MIN_VALUE;
            } else {
                cx0Var = new cx0(this, continuationImpl);
            }
        }
        Object objA = cx0Var.f2089b;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = cx0Var.f2091d;
        if (i11 == 0) {
            ResultKt.b(objA);
            cx0Var.f2088a = str;
            cx0Var.f2091d = 1;
            objA = a(str, str2, uuid, cx0Var);
            if (objA == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = cx0Var.f2088a;
            ResultKt.b(objA);
        }
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            return (pu0) a1Var;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        com.google.gson.r rVar = (com.google.gson.r) ((xu0) a1Var).a();
        return rVar == null ? new tu0(c0.k("Null response from ", str)) : new xu0(rVar);
    }

    public final b.u7 c() {
        b.u7 u7Var = this.f10142x;
        if (u7Var != null) {
            return u7Var;
        }
        Intrinsics.m("jsContext");
        throw null;
    }

    public final sy0 d() {
        sy0 sy0Var;
        synchronized (this) {
            sy0Var = this.f10135q;
        }
        return sy0Var;
    }

    @Override // android.webkit.WebView
    public final void destroy() {
        if (!this.f10132l.getAndSet(true)) {
            ql1 ql1Var = this.f10130j.f11732a;
            ql1Var.f8726c = ql1Var.f8725b.decrementAndGet();
        }
        this.f10131k.set(true);
        x60 x60Var = this.f10124d;
        if (x60Var != null) {
            t70.j0 j0Var = x60Var.f11585a;
            a60.a aVar = new a60.a(x60Var, null, 17);
            EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
            Intrinsics.g(j0Var, "<this>");
            Intrinsics.g(context, "context");
            m0.t(j0Var, context, null, new ar.a(aVar, null), 2);
        }
        super.destroy();
    }

    public final fs3 e() {
        fs3 fs3Var;
        synchronized (this) {
            fs3Var = this.f10136r;
        }
        return fs3Var;
    }

    @Override // android.webkit.WebView, android.widget.AbsoluteLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        es3 es3Var;
        int i12;
        float f11;
        if (this.f10131k.get()) {
            setMeasuredDimension(0, 0);
            return;
        }
        fs3 fs3VarE = e();
        if (isInEditMode() || fs3VarE.a() || this.n.get() || (es3Var = fs3VarE.f3488a) == es3.f2967d) {
            super.onMeasure(i5, i11);
            return;
        }
        if (es3Var == es3.f2968e) {
            sy0 sy0VarD = d();
            if (sy0VarD != null) {
                synchronized (sy0VarD.f9733f) {
                    f11 = sy0VarD.f9734h;
                }
            } else {
                f11 = 0.0f;
            }
            if (f11 <= 0.0f) {
                super.onMeasure(i5, i11);
                return;
            }
            int size = View.MeasureSpec.getSize(i5);
            int size2 = View.MeasureSpec.getSize(i11);
            int i13 = (int) (size2 * f11);
            int i14 = (int) (size / f11);
            if (size2 == 0 && i14 != 0) {
                i13 = size;
                size2 = i14;
            } else if (size != 0 || i13 == 0) {
                i13 = size;
                size = i13;
                i14 = size2;
                size2 = i14;
            } else {
                i14 = size2;
                size = i13;
            }
            setMeasuredDimension(Math.min(size, i13), Math.min(size2, i14));
            return;
        }
        Continuation continuation = null;
        if (fs3VarE.f3491d) {
            zi3.a(this.f10123c, new bx0(this, continuation, 2));
            synchronized (this) {
                i12 = this.f10137s;
            }
            setMeasuredDimension(View.MeasureSpec.getSize(i5), i12 == -1 ? View.MeasureSpec.getSize(i11) : (int) (i12 * this.f10141w.density));
            return;
        }
        int mode = View.MeasureSpec.getMode(i5);
        int size3 = View.MeasureSpec.getSize(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        int size4 = View.MeasureSpec.getSize(i11);
        int i15 = LayoutNode.NotPlacedPlaceOrder;
        int i16 = (mode == Integer.MIN_VALUE || mode == 1073741824) ? size3 : Integer.MAX_VALUE;
        if (mode2 == Integer.MIN_VALUE || mode2 == 1073741824) {
            i15 = size4;
        }
        int i17 = fs3VarE.f3489b;
        if (i17 > i16 || fs3VarE.f3490c > i15) {
            float f12 = this.f10141w.density;
            int i18 = (int) (size3 / f12);
            int i19 = (int) (size4 / f12);
            StringBuilder sbT = c0.t((int) (i17 / f12), "Not enough space to show the full ad. Need ", "x", (int) (fs3VarE.f3490c / f12), " dp, but only have ");
            sbT.append(i18);
            sbT.append("x");
            sbT.append(i19);
            sbT.append(" dp.");
            String string = sbT.toString();
            mu0.c(string, null);
            if (!this.f10133m.getAndSet(true)) {
                zi3.a(this.f10123c, new gx0(this, string, continuation, 2));
            }
        }
        if (getVisibility() != 8) {
            setVisibility(0);
        }
        setMeasuredDimension(fs3VarE.f3489b, fs3VarE.f3490c);
    }

    @Override // android.webkit.WebView
    public final void onPause() {
        super.onPause();
        this.f10127g.getClass();
        try {
            if (WebViewFeature.a(WebViewFeature.MUTE_AUDIO)) {
                WebViewCompat.setAudioMuted(this, true);
            }
        } catch (Throwable unused) {
        }
    }

    @Override // android.webkit.WebView
    public final void onResume() {
        super.onResume();
        this.f10127g.getClass();
        try {
            if (WebViewFeature.a(WebViewFeature.MUTE_AUDIO)) {
                WebViewCompat.setAudioMuted(this, false);
            }
        } catch (Throwable unused) {
        }
    }

    @Override // android.webkit.WebView, android.view.View
    public final boolean onTouchEvent(MotionEvent event) {
        Unit unit;
        Intrinsics.g(event, "event");
        i iVar = this.f10138t;
        if (iVar != null) {
            iVar.c(event);
            unit = Unit.f71706a;
        } else {
            unit = null;
        }
        if (unit == null) {
            k8 k8Var = this.f10126f;
            k8Var.getClass();
            ga3 ga3Var = ((f7) k8Var.b().f1694a).f3211b;
            n nVar = (n) ga3Var.f3752f.get();
            if (nVar == null) {
                ga3Var.f3751e.b(yk0.EVENT_ID_EARLY_INPUT_EVENT);
            } else {
                nVar.a(event);
            }
        }
        if (this.f10131k.get()) {
            return false;
        }
        return super.onTouchEvent(event);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object c(String str, ContinuationImpl continuationImpl) {
        rx0 rx0Var;
        x60 x60Var;
        if (continuationImpl instanceof rx0) {
            rx0Var = (rx0) continuationImpl;
            int i5 = rx0Var.f9343c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rx0Var.f9343c = i5 - Integer.MIN_VALUE;
            } else {
                rx0Var = new rx0(this, continuationImpl);
            }
        }
        rx0 rx0Var2 = rx0Var;
        Object obj = rx0Var2.f9341a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = rx0Var2.f9343c;
        if (i11 == 0) {
            ResultKt.b(obj);
            kh3 kh3Var = this.f10139u;
            if (kh3Var == null || (x60Var = this.f10124d) == null) {
                return null;
            }
            rx0Var2.f9343c = 1;
            String str2 = kh3Var.f5742a;
            Duration.Companion companion = Duration.f72038b;
            x60Var.f11587c.getClass();
            Object objA = x60Var.a(str, str2, DurationKt.h(SystemClock.elapsedRealtime(), DurationUnit.f72045d), rx0Var2);
            if (objA != coroutineSingletons) {
                objA = Unit.f71706a;
            }
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }

    public final iy0 b() {
        iy0 iy0Var = this.f10143y;
        if (iy0Var != null) {
            return iy0Var;
        }
        Intrinsics.m("gmaWebViewClient");
        throw null;
    }

    public final Object b(com.google.gson.r rVar, String str, Continuation continuation) throws Throwable {
        Object objA = a(str + "(" + rVar + ");", continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x01a5, code lost:
    
        if (t70.m0.y(r6, r7, r2) == r3) goto L140;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x012b, code lost:
    
        if (t70.m0.y(r6, r7, r2) == r3) goto L140;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x0176, code lost:
    
        if (t70.m0.y(r0, r8, r2) == r3) goto L140;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0111  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0118 A[Catch: all -> 0x012f, TRY_LEAVE, TryCatch #5 {all -> 0x012f, blocks: (B:59:0x0114, B:61:0x0118, B:97:0x018b, B:99:0x018f, B:85:0x015d, B:87:0x0161), top: B:139:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x0161 A[Catch: all -> 0x012f, TRY_LEAVE, TryCatch #5 {all -> 0x012f, blocks: (B:59:0x0114, B:61:0x0118, B:97:0x018b, B:99:0x018f, B:85:0x015d, B:87:0x0161), top: B:139:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0181 A[Catch: all -> 0x004e, TRY_LEAVE, TryCatch #4 {all -> 0x004e, blocks: (B:18:0x0049, B:104:0x01ac, B:24:0x0066, B:92:0x017c, B:94:0x0181), top: B:139:0x002b }] */
    /* JADX WARN: Removed duplicated region for block: B:99:0x018f A[Catch: all -> 0x012f, TRY_LEAVE, TryCatch #5 {all -> 0x012f, blocks: (B:59:0x0114, B:61:0x0118, B:97:0x018b, B:99:0x018f, B:85:0x015d, B:87:0x0161), top: B:139:0x002b }] */
    /* JADX WARN: Type inference failed for: r13v0 */
    /* JADX WARN: Type inference failed for: r13v1 */
    /* JADX WARN: Type inference failed for: r13v13, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r13v19 */
    /* JADX WARN: Type inference failed for: r13v2, types: [ads_mobile_sdk.th3] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v15, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v18, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v2, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v22 */
    /* JADX WARN: Type inference failed for: r4v23 */
    /* JADX WARN: Type inference failed for: r4v25, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v26, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v28, types: [java.io.Closeable] */
    /* JADX WARN: Type inference failed for: r4v35 */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v41 */
    /* JADX WARN: Type inference failed for: r4v42 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(String str, ContinuationImpl continuationImpl) throws Throwable {
        mx0 mx0Var;
        ?? r13;
        ?? r42;
        t70.s sVarB;
        ?? r43;
        th3 th3Var;
        tx0 tx0Var;
        th3 th3Var2;
        Object obj;
        th3 th3Var3;
        Object obj2;
        th3 th3Var4;
        th3 th3Var5;
        Object obj3;
        th3 th3Var6;
        Object obj4;
        if (continuationImpl instanceof mx0) {
            mx0Var = (mx0) continuationImpl;
            int i5 = mx0Var.f7363g;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                mx0Var.f7363g = i5 - Integer.MIN_VALUE;
            } else {
                mx0Var = new mx0(this, continuationImpl);
            }
        }
        Object objY = mx0Var.f7361e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = mx0Var.f7363g;
        int i12 = 11;
        int i13 = 1;
        Continuation continuation = null;
        boolean z11 = false;
        boolean z12 = false;
        boolean z13 = false;
        boolean z14 = false;
        boolean z15 = false;
        boolean z16 = false;
        try {
            try {
                if (i11 == 0) {
                    ResultKt.b(objY);
                    WeakHashMap weakHashMap = ji3.f5253a;
                    th3 th3VarA = ji3.a(wv0.CUI_NAME_WEBVIEW_LOAD, EmptyList.f71733a, true);
                    try {
                        if (!this.f10131k.get()) {
                            sVarB = m0.b();
                            iy0 iy0VarB = b();
                            io.sentry.e3 e3Var = iy0VarB.f5036i;
                            KProperty[] kPropertyArr = iy0.f5027w;
                            t70.r rVar = (t70.r) e3Var.getValue(iy0VarB, kPropertyArr[0]);
                            if (rVar != null) {
                                rVar.c(null);
                            }
                            e3Var.setValue(iy0VarB, kPropertyArr[0], sVarB);
                            try {
                                CoroutineContext coroutineContext = this.f10121a;
                                gx0 gx0Var = new gx0(this, str, z11 ? 1 : 0, i13);
                                mx0Var.f7357a = this;
                                mx0Var.f7358b = th3VarA;
                                mx0Var.f7359c = th3VarA;
                                mx0Var.f7360d = sVarB;
                                mx0Var.f7363g = 1;
                                if (m0.y(coroutineContext, gx0Var, mx0Var) != coroutineSingletons) {
                                    th3Var2 = th3VarA;
                                    th3Var = th3Var2;
                                    tx0Var = this;
                                    mx0Var.f7357a = tx0Var;
                                    mx0Var.f7358b = th3Var;
                                    mx0Var.f7359c = th3Var2;
                                    mx0Var.f7360d = null;
                                    mx0Var.f7363g = 2;
                                    objY = sVarB.y(mx0Var);
                                    if (objY != coroutineSingletons) {
                                    }
                                }
                            } catch (Exception e3) {
                                e = e3;
                                r43 = th3VarA;
                                th3Var = r43;
                                tx0Var = this;
                                m0.t(tx0Var.f10122b, null, null, new bx0(tx0Var, z16 ? 1 : 0, i13), 3);
                                Object qu0Var = new qu0(e, z15 ? 1 : 0, z14 ? 1 : 0, 6);
                                if (tx0Var.f10124d != null) {
                                }
                                obj2 = qu0Var;
                                th3Var4 = r43;
                                obj3 = obj2;
                                th3Var5 = th3Var4;
                                obj = obj3;
                                th3Var3 = th3Var5;
                                if (obj instanceof pu0) {
                                }
                                CloseableKt.a(th3Var3, null);
                                return obj;
                            } catch (Throwable th2) {
                                th = th2;
                                r43 = th3VarA;
                                th3Var = r43;
                                tx0Var = this;
                                if (tx0Var.f10124d != null) {
                                }
                                throw th;
                            }
                            return coroutineSingletons;
                        }
                        obj = bv0.f1574c;
                        th3Var3 = th3VarA;
                    } catch (Throwable th3) {
                        th = th3;
                        r42 = th3VarA;
                        r13 = th3VarA;
                        try {
                            r13.b(th);
                            if (!(th instanceof b.a4)) {
                                if (!(th instanceof TimeoutCancellationException) && !(th instanceof CancellationException)) {
                                    r13.a(th);
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
                        } catch (Throwable th4) {
                            try {
                                throw th4;
                            } catch (Throwable th5) {
                                CloseableKt.a(r42, th4);
                                throw th5;
                            }
                        }
                    }
                } else {
                    if (i11 == 1) {
                        sVarB = mx0Var.f7360d;
                        ?? r132 = (Closeable) mx0Var.f7359c;
                        th3Var = (th3) mx0Var.f7358b;
                        tx0 tx0Var2 = (tx0) mx0Var.f7357a;
                        try {
                            ResultKt.b(objY);
                            th3Var2 = r132;
                            tx0Var = tx0Var2;
                        } catch (Exception e11) {
                            e = e11;
                            r43 = r132;
                            tx0Var = tx0Var2;
                            m0.t(tx0Var.f10122b, null, null, new bx0(tx0Var, z16 ? 1 : 0, i13), 3);
                            Object qu0Var2 = new qu0(e, z15 ? 1 : 0, z14 ? 1 : 0, 6);
                            if (tx0Var.f10124d != null) {
                            }
                            obj2 = qu0Var2;
                            th3Var4 = r43;
                            obj3 = obj2;
                            th3Var5 = th3Var4;
                            obj = obj3;
                            th3Var3 = th3Var5;
                            if (obj instanceof pu0) {
                            }
                            CloseableKt.a(th3Var3, null);
                            return obj;
                        } catch (Throwable th6) {
                            th = th6;
                            r43 = r132;
                            tx0Var = tx0Var2;
                            if (tx0Var.f10124d != null) {
                            }
                            throw th;
                        }
                        try {
                            mx0Var.f7357a = tx0Var;
                            mx0Var.f7358b = th3Var;
                            mx0Var.f7359c = th3Var2;
                            mx0Var.f7360d = null;
                            mx0Var.f7363g = 2;
                            objY = sVarB.y(mx0Var);
                        } catch (Exception e12) {
                            e = e12;
                            r43 = th3Var2;
                            m0.t(tx0Var.f10122b, null, null, new bx0(tx0Var, z16 ? 1 : 0, i13), 3);
                            Object qu0Var22 = new qu0(e, z15 ? 1 : 0, z14 ? 1 : 0, 6);
                            if (tx0Var.f10124d != null) {
                            }
                            obj2 = qu0Var22;
                            th3Var4 = r43;
                            obj3 = obj2;
                            th3Var5 = th3Var4;
                            obj = obj3;
                            th3Var3 = th3Var5;
                            if (obj instanceof pu0) {
                            }
                            CloseableKt.a(th3Var3, null);
                            return obj;
                        } catch (Throwable th7) {
                            th = th7;
                            r43 = th3Var2;
                            if (tx0Var.f10124d != null) {
                            }
                            throw th;
                        }
                        if (objY != coroutineSingletons) {
                            r43 = th3Var2;
                            Object obj5 = (b.a1) objY;
                            if (tx0Var.f10124d != null) {
                            }
                            obj2 = obj5;
                            th3Var4 = r43;
                            obj3 = obj2;
                            th3Var5 = th3Var4;
                            obj = obj3;
                            th3Var3 = th3Var5;
                        }
                        return coroutineSingletons;
                    }
                    if (i11 != 2) {
                        if (i11 == 3) {
                            Object obj6 = (b.a1) mx0Var.f7359c;
                            ?? r44 = mx0Var.f7358b;
                            obj4 = obj6;
                            th3Var6 = r44;
                        } else {
                            if (i11 != 4) {
                                if (i11 != 5) {
                                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                                }
                                Throwable th8 = (Throwable) mx0Var.f7359c;
                                Closeable closeable = mx0Var.f7358b;
                                ResultKt.b(objY);
                                throw th8;
                            }
                            Object obj7 = (b.a1) mx0Var.f7359c;
                            ?? r45 = mx0Var.f7358b;
                            obj4 = obj7;
                            th3Var6 = r45;
                        }
                        ResultKt.b(objY);
                        obj3 = obj4;
                        th3Var5 = th3Var6;
                        obj = obj3;
                        th3Var3 = th3Var5;
                    } else {
                        r43 = (Closeable) mx0Var.f7359c;
                        th3 th3Var7 = (th3) mx0Var.f7358b;
                        tx0Var = (tx0) mx0Var.f7357a;
                        try {
                            ResultKt.b(objY);
                            th3Var = th3Var7;
                            r43 = r43;
                            try {
                                try {
                                    Object obj52 = (b.a1) objY;
                                    if (tx0Var.f10124d != null) {
                                        t70.c2 c2Var = t70.c2.f88780b;
                                        b00.e eVar = new b00.e(tx0Var, continuation, i12);
                                        mx0Var.f7357a = th3Var;
                                        mx0Var.f7358b = r43;
                                        mx0Var.f7359c = obj52;
                                        mx0Var.f7363g = 3;
                                        i11 = r43;
                                    }
                                    obj2 = obj52;
                                    th3Var4 = r43;
                                } catch (Exception e13) {
                                    e = e13;
                                    m0.t(tx0Var.f10122b, null, null, new bx0(tx0Var, z16 ? 1 : 0, i13), 3);
                                    Object qu0Var222 = new qu0(e, z15 ? 1 : 0, z14 ? 1 : 0, 6);
                                    if (tx0Var.f10124d != null) {
                                        t70.c2 c2Var2 = t70.c2.f88780b;
                                        b00.e eVar2 = new b00.e((Object) tx0Var, (Continuation) (z13 ? 1 : 0), i12);
                                        mx0Var.f7357a = th3Var;
                                        mx0Var.f7358b = r43;
                                        mx0Var.f7359c = qu0Var222;
                                        mx0Var.f7360d = null;
                                        mx0Var.f7363g = 4;
                                        i11 = r43;
                                    }
                                    obj2 = qu0Var222;
                                    th3Var4 = r43;
                                    obj3 = obj2;
                                    th3Var5 = th3Var4;
                                    obj = obj3;
                                    th3Var3 = th3Var5;
                                    if (obj instanceof pu0) {
                                    }
                                    CloseableKt.a(th3Var3, null);
                                    return obj;
                                }
                            } catch (Throwable th9) {
                                th = th9;
                                if (tx0Var.f10124d != null) {
                                    t70.c2 c2Var3 = t70.c2.f88780b;
                                    b00.e eVar3 = new b00.e((Object) tx0Var, (Continuation) (z12 ? 1 : 0), i12);
                                    mx0Var.f7357a = th3Var;
                                    mx0Var.f7358b = r43;
                                    mx0Var.f7359c = th;
                                    mx0Var.f7360d = null;
                                    mx0Var.f7363g = 5;
                                    i11 = r43;
                                }
                                throw th;
                            }
                        } catch (Exception e14) {
                            e = e14;
                            th3Var = th3Var7;
                            m0.t(tx0Var.f10122b, null, null, new bx0(tx0Var, z16 ? 1 : 0, i13), 3);
                            Object qu0Var2222 = new qu0(e, z15 ? 1 : 0, z14 ? 1 : 0, 6);
                            if (tx0Var.f10124d != null) {
                            }
                            obj2 = qu0Var2222;
                            th3Var4 = r43;
                            obj3 = obj2;
                            th3Var5 = th3Var4;
                            obj = obj3;
                            th3Var3 = th3Var5;
                            if (obj instanceof pu0) {
                            }
                            CloseableKt.a(th3Var3, null);
                            return obj;
                        } catch (Throwable th10) {
                            th = th10;
                            th3Var = th3Var7;
                            if (tx0Var.f10124d != null) {
                            }
                            throw th;
                        }
                        obj3 = obj2;
                        th3Var5 = th3Var4;
                        obj = obj3;
                        th3Var3 = th3Var5;
                    }
                }
                if (obj instanceof pu0) {
                    zi3.a((pu0) obj, false);
                }
                CloseableKt.a(th3Var3, null);
                return obj;
            } catch (Throwable th11) {
                th = th11;
                r13 = mx0Var;
                r42 = i11;
            }
        } catch (Throwable th12) {
            th = th12;
            r13 = th3Var;
            r42 = i11;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(Continuation continuation) {
        dx0 dx0Var;
        tx0 tx0Var;
        if (continuation instanceof dx0) {
            dx0Var = (dx0) continuation;
            int i5 = dx0Var.f2668d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dx0Var.f2668d = i5 - Integer.MIN_VALUE;
            } else {
                dx0Var = new dx0(this, continuation);
            }
        }
        Object obj = dx0Var.f2666b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dx0Var.f2668d;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (this.f10131k.getAndSet(true)) {
                return Unit.f71706a;
            }
            if (!this.f10132l.getAndSet(true)) {
                ql1 ql1Var = this.f10130j.f11732a;
                ql1Var.f8726c = ql1Var.f8725b.decrementAndGet();
            }
            try {
                CoroutineContext coroutineContext = this.f10121a;
                ex0 ex0Var = new ex0(this, null, 0);
                dx0Var.f2665a = this;
                dx0Var.f2668d = 1;
                if (m0.y(coroutineContext, ex0Var, dx0Var) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } catch (Throwable th2) {
                th = th2;
                tx0Var = this;
                tx0Var.f10125e.a("GmaWebView.destroySafe", th);
                return Unit.f71706a;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            tx0Var = dx0Var.f2665a;
            try {
                ResultKt.b(obj);
            } catch (Throwable th3) {
                th = th3;
                tx0Var.f10125e.a("GmaWebView.destroySafe", th);
                return Unit.f71706a;
            }
        }
        return Unit.f71706a;
    }

    public final Object a(com.google.gson.r rVar, String str, Continuation continuation) throws Throwable {
        String str2 = "(window.AFMA_ReceiveMessage || function() {})('" + str + "', " + rVar + ");";
        cz.b bVar = mu0.f7335a;
        mu0.b("Dispatching AFMA event: " + str2, null);
        Object objA = a(str2, continuation);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public final Object a(String str, Continuation continuation) throws Throwable {
        if (this.f10131k.get()) {
            return Unit.f71706a;
        }
        Continuation continuation2 = null;
        if (Looper.getMainLooper().isCurrentThread()) {
            evaluateJavascript(str, null);
            return Unit.f71706a;
        }
        Object objY = m0.y(this.f10121a, new gx0(this, str, continuation2, 0), continuation);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:72:0x0163, code lost:
    
        if (t70.m0.y(r0, r6, r7) == r8) goto L110;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x01bd A[Catch: all -> 0x01e8, TRY_LEAVE, TryCatch #12 {all -> 0x01e8, blocks: (B:19:0x004b, B:113:0x01eb, B:99:0x01b9, B:101:0x01bd, B:69:0x014b, B:71:0x014f, B:106:0x01cb, B:108:0x01cf, B:94:0x019c, B:96:0x01a0), top: B:146:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:108:0x01cf A[Catch: all -> 0x01e8, TryCatch #12 {all -> 0x01e8, blocks: (B:19:0x004b, B:113:0x01eb, B:99:0x01b9, B:101:0x01bd, B:69:0x014b, B:71:0x014f, B:106:0x01cb, B:108:0x01cf, B:94:0x019c, B:96:0x01a0), top: B:146:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:113:0x01eb A[Catch: all -> 0x01e8, TRY_LEAVE, TryCatch #12 {all -> 0x01e8, blocks: (B:19:0x004b, B:113:0x01eb, B:99:0x01b9, B:101:0x01bd, B:69:0x014b, B:71:0x014f, B:106:0x01cb, B:108:0x01cf, B:94:0x019c, B:96:0x01a0), top: B:146:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:117:0x01f5 A[Catch: all -> 0x0201, TryCatch #2 {all -> 0x0201, blocks: (B:115:0x01ee, B:117:0x01f5, B:119:0x01f9, B:121:0x01fd, B:124:0x0204, B:126:0x0208, B:128:0x020c, B:130:0x0210, B:131:0x0211, B:132:0x0216, B:133:0x0217, B:134:0x021e, B:135:0x021f, B:136:0x0226, B:137:0x0227), top: B:143:0x01ee }] */
    /* JADX WARN: Removed duplicated region for block: B:137:0x0227 A[Catch: all -> 0x0201, TRY_LEAVE, TryCatch #2 {all -> 0x0201, blocks: (B:115:0x01ee, B:117:0x01f5, B:119:0x01f9, B:121:0x01fd, B:124:0x0204, B:126:0x0208, B:128:0x020c, B:130:0x0210, B:131:0x0211, B:132:0x0216, B:133:0x0217, B:134:0x021e, B:135:0x021f, B:136:0x0226, B:137:0x0227), top: B:143:0x01ee }] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x014f A[Catch: all -> 0x01e8, TRY_LEAVE, TryCatch #12 {all -> 0x01e8, blocks: (B:19:0x004b, B:113:0x01eb, B:99:0x01b9, B:101:0x01bd, B:69:0x014b, B:71:0x014f, B:106:0x01cb, B:108:0x01cf, B:94:0x019c, B:96:0x01a0), top: B:146:0x002d }] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0018  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01a0 A[Catch: all -> 0x01e8, TryCatch #12 {all -> 0x01e8, blocks: (B:19:0x004b, B:113:0x01eb, B:99:0x01b9, B:101:0x01bd, B:69:0x014b, B:71:0x014f, B:106:0x01cb, B:108:0x01cf, B:94:0x019c, B:96:0x01a0), top: B:146:0x002d }] */
    /* JADX WARN: Type inference failed for: r12v10, types: [kotlin.coroutines.Continuation, t70.s] */
    /* JADX WARN: Type inference failed for: r12v11 */
    /* JADX WARN: Type inference failed for: r12v12, types: [ads_mobile_sdk.wd1, java.lang.String, kotlin.coroutines.Continuation, kotlin.coroutines.CoroutineContext, t70.l0, t70.s] */
    /* JADX WARN: Type inference failed for: r12v13, types: [kotlin.coroutines.Continuation] */
    /* JADX WARN: Type inference failed for: r12v18 */
    /* JADX WARN: Type inference failed for: r12v19 */
    /* JADX WARN: Type inference failed for: r12v20 */
    /* JADX WARN: Type inference failed for: r12v26 */
    /* JADX WARN: Type inference failed for: r12v27 */
    /* JADX WARN: Type inference failed for: r12v28 */
    /* JADX WARN: Type inference failed for: r12v29 */
    /* JADX WARN: Type inference failed for: r12v30 */
    /* JADX WARN: Type inference failed for: r12v31 */
    /* JADX WARN: Type inference failed for: r12v32 */
    /* JADX WARN: Type inference failed for: r4v29 */
    /* JADX WARN: Type inference failed for: r4v34 */
    /* JADX WARN: Type inference failed for: r4v5 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, String str2, String str3, String str4, boolean z11, ContinuationImpl continuationImpl) {
        ix0 ix0Var;
        th3 th3Var;
        ?? r42;
        th3 th3Var2;
        t70.s sVar;
        Throwable th2;
        tx0 tx0Var;
        Closeable closeable;
        Closeable closeable2;
        CoroutineContext coroutineContext;
        t70.s sVar2;
        Closeable closeable3;
        Closeable closeable4;
        Throwable th3;
        b.a1 qu0Var;
        t70.s sVar3;
        t70.s sVar4;
        tx0 tx0Var2;
        ?? r12;
        ?? r122;
        Throwable th4;
        if (continuationImpl instanceof ix0) {
            ix0Var = (ix0) continuationImpl;
            int i5 = ix0Var.f5001g;
            r42 = -2147483648;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ix0Var.f5001g = i5 - Integer.MIN_VALUE;
            } else {
                ix0Var = new ix0(this, continuationImpl);
            }
        }
        ix0 ix0Var2 = ix0Var;
        Object objY = ix0Var2.f4999e;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ix0Var2.f5001g;
        int i12 = 11;
        int i13 = 1;
        Closeable closeable5 = null;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                String strA = z11 ? p01.a(str, ul.b.P(this.f10128h.a())) : str;
                WeakHashMap weakHashMap = ji3.f5253a;
                th3 th3VarA = ji3.a(wv0.CUI_NAME_WEBVIEW_LOAD, EmptyList.f71733a, true);
                try {
                    if (!this.f10131k.get()) {
                        t70.s sVarB = m0.b();
                        iy0 iy0VarB = b();
                        io.sentry.e3 e3Var = iy0VarB.f5036i;
                        KProperty[] kPropertyArr = iy0.f5027w;
                        t70.r rVar = (t70.r) e3Var.getValue(iy0VarB, kPropertyArr[0]);
                        if (rVar != null) {
                            rVar.c(null);
                        }
                        e3Var.setValue(iy0VarB, kPropertyArr[0], sVarB);
                        try {
                            coroutineContext = this.f10121a;
                            sVar = null;
                            th3Var2 = th3VarA;
                        } catch (Exception e3) {
                            e = e3;
                            th3Var2 = th3VarA;
                            sVar = null;
                        } catch (Throwable th5) {
                            th = th5;
                            th3Var2 = th3VarA;
                            sVar = null;
                        }
                        try {
                            ax0 ax0Var = new ax0(this, (Continuation) null, str2, strA, str3, str4);
                            ix0Var2.f4995a = this;
                            ix0Var2.f4996b = th3Var2;
                            ix0Var2.f4997c = th3Var2;
                            ix0Var2.f4998d = sVarB;
                            ix0Var2.f5001g = 1;
                            if (m0.y(coroutineContext, ax0Var, ix0Var2) != coroutineSingletons) {
                                tx0Var = this;
                                sVar2 = sVarB;
                                closeable3 = th3Var2;
                                closeable4 = closeable3;
                                sVar4 = sVar;
                                ix0Var2.f4995a = tx0Var;
                                ix0Var2.f4996b = closeable4;
                                ix0Var2.f4997c = closeable3;
                                ix0Var2.f4998d = sVar4;
                                ix0Var2.f5001g = 2;
                                objY = sVar2.y(ix0Var2);
                                if (objY != coroutineSingletons) {
                                }
                            }
                        } catch (Exception e11) {
                            e = e11;
                            tx0Var = this;
                            closeable = th3Var2;
                            closeable2 = closeable;
                            r122 = sVar;
                            m0.t(tx0Var.f10122b, r122, r122, new bx0(tx0Var, r122, i13), 3);
                            qu0Var = new qu0(e, r122, r122, 6);
                            th3 = r122;
                            if (tx0Var.f10124d != null) {
                            }
                            if (qu0Var instanceof pu0) {
                            }
                            CloseableKt.a(closeable, th3);
                            return qu0Var;
                        } catch (Throwable th6) {
                            th = th6;
                            th2 = th;
                            tx0Var = this;
                            closeable = th3Var2;
                            closeable2 = closeable;
                            r12 = sVar;
                            if (tx0Var.f10124d == null) {
                            }
                        }
                    } else {
                        th3 = null;
                        qu0Var = bv0.f1574c;
                        closeable = th3VarA;
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(closeable, th3);
                        return qu0Var;
                    }
                } catch (Throwable th7) {
                    th = th7;
                    th3Var = th3VarA;
                    closeable5 = th3Var;
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
            } else if (i11 == 1) {
                sVar2 = ix0Var2.f4998d;
                closeable3 = (Closeable) ix0Var2.f4997c;
                closeable4 = (th3) ix0Var2.f4996b;
                tx0Var = (tx0) ix0Var2.f4995a;
                try {
                    ResultKt.b(objY);
                    sVar4 = null;
                    try {
                        ix0Var2.f4995a = tx0Var;
                        ix0Var2.f4996b = closeable4;
                        ix0Var2.f4997c = closeable3;
                        ix0Var2.f4998d = sVar4;
                        ix0Var2.f5001g = 2;
                        objY = sVar2.y(ix0Var2);
                    } catch (Exception e12) {
                        e = e12;
                        closeable = closeable3;
                        closeable2 = closeable4;
                        r122 = sVar4;
                        m0.t(tx0Var.f10122b, r122, r122, new bx0(tx0Var, r122, i13), 3);
                        qu0Var = new qu0(e, r122, r122, 6);
                        th3 = r122;
                        if (tx0Var.f10124d != null) {
                            t70.c2 c2Var = t70.c2.f88780b;
                            b00.e eVar = new b00.e(tx0Var, (Continuation) r122, i12);
                            ix0Var2.f4995a = closeable2;
                            ix0Var2.f4996b = closeable;
                            ix0Var2.f4997c = qu0Var;
                            ix0Var2.f4998d = r122;
                            ix0Var2.f5001g = 4;
                            th3 = r122;
                            if (m0.y(c2Var, eVar, ix0Var2) == coroutineSingletons) {
                                return coroutineSingletons;
                            }
                        }
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(closeable, th3);
                        return qu0Var;
                    } catch (Throwable th8) {
                        th2 = th8;
                        sVar3 = sVar4;
                        closeable = closeable3;
                        closeable2 = closeable4;
                        r12 = sVar3;
                        if (tx0Var.f10124d == null) {
                        }
                    }
                } catch (Exception e13) {
                    e = e13;
                    sVar4 = null;
                    closeable = closeable3;
                    closeable2 = closeable4;
                    r122 = sVar4;
                    m0.t(tx0Var.f10122b, r122, r122, new bx0(tx0Var, r122, i13), 3);
                    qu0Var = new qu0(e, r122, r122, 6);
                    th3 = r122;
                    if (tx0Var.f10124d != null) {
                    }
                    if (qu0Var instanceof pu0) {
                    }
                    CloseableKt.a(closeable, th3);
                    return qu0Var;
                } catch (Throwable th9) {
                    th2 = th9;
                    sVar3 = null;
                    closeable = closeable3;
                    closeable2 = closeable4;
                    r12 = sVar3;
                    if (tx0Var.f10124d == null) {
                    }
                }
                if (objY != coroutineSingletons) {
                    closeable = closeable3;
                    closeable2 = closeable4;
                    tx0Var2 = tx0Var;
                    r122 = sVar4;
                    qu0Var = (b.a1) objY;
                    th3 = r122;
                    if (tx0Var2.f10124d != null) {
                    }
                    if (qu0Var instanceof pu0) {
                    }
                    CloseableKt.a(closeable, th3);
                    return qu0Var;
                }
            } else {
                if (i11 == 2) {
                    Closeable closeable6 = (Closeable) ix0Var2.f4997c;
                    closeable2 = (th3) ix0Var2.f4996b;
                    tx0Var2 = (tx0) ix0Var2.f4995a;
                    try {
                        ResultKt.b(objY);
                        r122 = 0;
                        closeable = closeable6;
                    } catch (Exception e14) {
                        e = e14;
                        r122 = 0;
                        tx0Var = tx0Var2;
                        closeable = closeable6;
                        try {
                            m0.t(tx0Var.f10122b, r122, r122, new bx0(tx0Var, r122, i13), 3);
                            qu0Var = new qu0(e, r122, r122, 6);
                            th3 = r122;
                            if (tx0Var.f10124d != null) {
                            }
                            if (qu0Var instanceof pu0) {
                            }
                            CloseableKt.a(closeable, th3);
                            return qu0Var;
                        } catch (Throwable th10) {
                            th4 = th10;
                            th2 = th4;
                            r12 = r122;
                            if (tx0Var.f10124d == null) {
                                t70.c2 c2Var2 = t70.c2.f88780b;
                                b00.e eVar2 = new b00.e(tx0Var, (Continuation) r12, i12);
                                ix0Var2.f4995a = closeable2;
                                ix0Var2.f4996b = closeable;
                                ix0Var2.f4997c = th2;
                                ix0Var2.f4998d = r12;
                                ix0Var2.f5001g = 5;
                                if (m0.y(c2Var2, eVar2, ix0Var2) != coroutineSingletons) {
                                    throw th2;
                                }
                                return coroutineSingletons;
                            }
                            throw th2;
                        }
                    } catch (Throwable th11) {
                        th4 = th11;
                        r122 = 0;
                        tx0Var = tx0Var2;
                        closeable = closeable6;
                        th2 = th4;
                        r12 = r122;
                        if (tx0Var.f10124d == null) {
                        }
                    }
                    try {
                        qu0Var = (b.a1) objY;
                        th3 = r122;
                        if (tx0Var2.f10124d != null) {
                            t70.c2 c2Var3 = t70.c2.f88780b;
                            b00.e eVar3 = new b00.e(tx0Var2, (Continuation) r122, i12);
                            ix0Var2.f4995a = closeable2;
                            ix0Var2.f4996b = closeable;
                            ix0Var2.f4997c = qu0Var;
                            ix0Var2.f5001g = 3;
                            th3 = r122;
                        }
                    } catch (Exception e15) {
                        e = e15;
                        tx0Var = tx0Var2;
                        r122 = r122;
                        m0.t(tx0Var.f10122b, r122, r122, new bx0(tx0Var, r122, i13), 3);
                        qu0Var = new qu0(e, r122, r122, 6);
                        th3 = r122;
                        if (tx0Var.f10124d != null) {
                        }
                        if (qu0Var instanceof pu0) {
                        }
                        CloseableKt.a(closeable, th3);
                        return qu0Var;
                    } catch (Throwable th12) {
                        th4 = th12;
                        tx0Var = tx0Var2;
                        th2 = th4;
                        r12 = r122;
                        if (tx0Var.f10124d == null) {
                        }
                    }
                    if (qu0Var instanceof pu0) {
                    }
                    CloseableKt.a(closeable, th3);
                    return qu0Var;
                }
                if (i11 != 3 && i11 != 4) {
                    if (i11 != 5) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    Throwable th13 = (Throwable) ix0Var2.f4997c;
                    Closeable closeable7 = ix0Var2.f4996b;
                    ResultKt.b(objY);
                    throw th13;
                }
                qu0Var = (b.a1) ix0Var2.f4997c;
                Closeable closeable8 = ix0Var2.f4996b;
                th3 th3Var3 = (th3) ix0Var2.f4995a;
                try {
                    ResultKt.b(objY);
                    th3 = null;
                    closeable = closeable8;
                    if (qu0Var instanceof pu0) {
                        zi3.a((pu0) qu0Var, false);
                    }
                    CloseableKt.a(closeable, th3);
                    return qu0Var;
                } catch (Throwable th14) {
                    th = th14;
                    closeable5 = closeable8;
                    r42 = th3Var3;
                    th3Var = r42;
                    try {
                        th3Var.b(th);
                        if (th instanceof b.a4) {
                        }
                    } catch (Throwable th15) {
                        try {
                            throw th15;
                        } catch (Throwable th16) {
                            CloseableKt.a(closeable5, th15);
                            throw th16;
                        }
                    }
                }
            }
            return coroutineSingletons;
        } catch (Throwable th17) {
            th = th17;
        }
    }

    public static /* synthetic */ Object a(tx0 tx0Var, String str, String str2, boolean z11, ContinuationImpl continuationImpl, int i5) {
        if ((i5 & 2) != 0) {
            str2 = null;
        }
        return tx0Var.a(str, str2, "text/html", "UTF-8", z11, continuationImpl);
    }

    public final void a(fs3 value) {
        Intrinsics.g(value, "value");
        synchronized (this) {
            this.f10136r = value;
            Unit unit = Unit.f71706a;
        }
        requestLayout();
    }
}
