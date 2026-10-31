package ads_mobile_sdk;

import android.app.Activity;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.RelativeLayout;
import b.d0;
import b0.b0;
import c80.d;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import java.util.Map;
import java.util.Optional;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import r70.i;
import t70.m0;

/* loaded from: classes.dex */
public final class rr1 {

    /* renamed from: a, reason: collision with root package name */
    public final bq1 f9288a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f9289b;

    /* renamed from: c, reason: collision with root package name */
    public final t70.j0 f9290c;

    /* renamed from: d, reason: collision with root package name */
    public final js1 f9291d;

    /* renamed from: e, reason: collision with root package name */
    public final g0 f9292e;

    /* renamed from: f, reason: collision with root package name */
    public final b.w4 f9293f;

    /* renamed from: g, reason: collision with root package name */
    public final jy0 f9294g;

    /* renamed from: h, reason: collision with root package name */
    public final tx0 f9295h;

    /* renamed from: i, reason: collision with root package name */
    public final d f9296i;

    /* renamed from: j, reason: collision with root package name */
    public PopupWindow f9297j;

    /* renamed from: k, reason: collision with root package name */
    public ImageView f9298k;

    /* renamed from: l, reason: collision with root package name */
    public ViewGroup.LayoutParams f9299l;

    /* renamed from: m, reason: collision with root package name */
    public fs3 f9300m;
    public ViewGroup n;

    public rr1(bq1 mraidAfmaDispatcher, t70.j0 uiScope, t70.j0 backgroundScope, js1 mraidViewabilityEventListener, Optional optionalGmaWebViewContainer, g0 activityTracker, b.w4 mraidEventEmitter) {
        Intrinsics.g(mraidAfmaDispatcher, "mraidAfmaDispatcher");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(mraidViewabilityEventListener, "mraidViewabilityEventListener");
        Intrinsics.g(optionalGmaWebViewContainer, "optionalGmaWebViewContainer");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(mraidEventEmitter, "mraidEventEmitter");
        this.f9288a = mraidAfmaDispatcher;
        this.f9289b = uiScope;
        this.f9290c = backgroundScope;
        this.f9291d = mraidViewabilityEventListener;
        this.f9292e = activityTracker;
        this.f9293f = mraidEventEmitter;
        jy0 jy0Var = (jy0) optionalGmaWebViewContainer.orElse(null);
        this.f9294g = jy0Var;
        this.f9295h = jy0Var != null ? jy0Var.f5452a : null;
        this.f9296i = new d();
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r9v12, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r9v15, types: [c80.a] */
    /* JADX WARN: Type inference failed for: r9v3 */
    /* JADX WARN: Type inference failed for: r9v4 */
    /* JADX WARN: Type inference failed for: r9v6 */
    /* JADX WARN: Type inference failed for: r9v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(rr1 rr1Var, boolean z11, ContinuationImpl continuationImpl) throws Throwable {
        kr1 kr1Var;
        d dVar;
        PopupWindow popupWindow;
        rr1 rr1Var2;
        d dVar2;
        ImageView imageView;
        ?? r92;
        if (continuationImpl instanceof kr1) {
            kr1Var = (kr1) continuationImpl;
            int i5 = kr1Var.f5944f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                kr1Var.f5944f = i5 - Integer.MIN_VALUE;
            } else {
                kr1Var = new kr1(rr1Var, continuationImpl);
            }
        }
        Object obj = kr1Var.f5942d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = kr1Var.f5944f;
        Continuation continuation = null;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                dVar = rr1Var.f9296i;
                kr1Var.f5939a = rr1Var;
                kr1Var.f5940b = dVar;
                kr1Var.f5941c = z11;
                kr1Var.f5944f = 1;
                if (dVar.e(kr1Var) != coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                r92 = kr1Var.f5940b;
                rr1Var2 = kr1Var.f5939a;
                try {
                    ResultKt.b(obj);
                    dVar2 = r92;
                    m0.t(rr1Var2.f9290c, null, null, new a60.a(rr1Var2, continuation, 11), 3);
                    dVar = dVar2;
                    rr1Var = rr1Var2;
                    rr1Var.f9297j = null;
                    rr1Var.n = null;
                    rr1Var.f9298k = null;
                    rr1Var.f9300m = null;
                    r92 = dVar;
                    Unit unit = Unit.f71706a;
                    ((d) r92).g(null);
                    return unit;
                } catch (Throwable th2) {
                    th = th2;
                    ((d) r92).g(null);
                    throw th;
                }
            }
            z11 = kr1Var.f5941c;
            ?? r93 = kr1Var.f5940b;
            rr1 rr1Var3 = kr1Var.f5939a;
            ResultKt.b(obj);
            dVar = r93;
            rr1Var = rr1Var3;
            tx0 tx0Var = rr1Var.f9295h;
            jy0 jy0Var = rr1Var.f9294g;
            if (tx0Var != null && jy0Var != null && (popupWindow = rr1Var.f9297j) != null) {
                popupWindow.dismiss();
                ViewGroup viewGroup = rr1Var.n;
                if (viewGroup != null && (imageView = rr1Var.f9298k) != null) {
                    viewGroup.removeView(imageView);
                    ViewParent parent = jy0Var.getParent();
                    ViewGroup viewGroup2 = parent instanceof ViewGroup ? (ViewGroup) parent : null;
                    if (viewGroup2 != null) {
                        viewGroup2.removeView(jy0Var);
                    }
                    fs3 fs3Var = rr1Var.f9300m;
                    if (fs3Var != null) {
                        tx0Var.a(fs3Var);
                    }
                    jy0Var.setLayoutParams(rr1Var.f9299l);
                    viewGroup.addView(jy0Var);
                }
                if (z11) {
                    bq1 bq1Var = rr1Var.f9288a;
                    kr1Var.f5939a = rr1Var;
                    kr1Var.f5940b = dVar;
                    kr1Var.f5944f = 2;
                    bq1Var.getClass();
                    if (bq1.a(tx0Var, CarrierConfigurator.APN_TYPE, kr1Var) != coroutineSingletons) {
                        rr1Var2 = rr1Var;
                        dVar2 = dVar;
                        m0.t(rr1Var2.f9290c, null, null, new a60.a(rr1Var2, continuation, 11), 3);
                        dVar = dVar2;
                        rr1Var = rr1Var2;
                    }
                    return coroutineSingletons;
                }
                rr1Var.f9297j = null;
                rr1Var.n = null;
                rr1Var.f9298k = null;
                rr1Var.f9300m = null;
            }
            r92 = dVar;
            Unit unit2 = Unit.f71706a;
            ((d) r92).g(null);
            return unit2;
        } catch (Throwable th3) {
            th = th3;
            r92 = dVar;
            ((d) r92).g(null);
            throw th;
        }
    }

    public final void a(boolean z11) {
        m0.t(this.f9289b, null, null, new jr1(this, z11, null), 3);
    }

    public final PopupWindow a(uw2 uw2Var, Activity activity, tx0 tx0Var) {
        String string;
        int i5 = uw2Var.f10504a;
        Intrinsics.g(activity, "<this>");
        DisplayMetrics displayMetrics = activity.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        int iApplyDimension = (int) TypedValue.applyDimension(1, i5, displayMetrics);
        float f11 = uw2Var.f10505b;
        DisplayMetrics displayMetrics2 = activity.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics2, "getDisplayMetrics(...)");
        int iApplyDimension2 = (int) TypedValue.applyDimension(1, f11, displayMetrics2);
        RelativeLayout relativeLayout = new RelativeLayout(activity);
        relativeLayout.setBackgroundColor(0);
        relativeLayout.setLayoutParams(new ViewGroup.LayoutParams(iApplyDimension, iApplyDimension2));
        relativeLayout.addView(this.f9294g, -1, -1);
        tx0Var.a(new fs3(es3.f2965b, iApplyDimension, iApplyDimension2, 8));
        LinearLayout linearLayout = new LinearLayout(activity);
        DisplayMetrics displayMetrics3 = activity.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics3, "getDisplayMetrics(...)");
        int iApplyDimension3 = (int) TypedValue.applyDimension(1, 50, displayMetrics3);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(iApplyDimension3, iApplyDimension3);
        xk.l0 l0VarListIterator = uw2Var.f10509f.f6960a.listIterator(0);
        while (l0VarListIterator.hasNext()) {
            layoutParams.addRule(((Number) l0VarListIterator.next()).intValue());
        }
        linearLayout.setOnClickListener(new ay.k(this, 3));
        Resources resources = activity.getResources();
        if (resources == null || (string = resources.getString(2132017626)) == null) {
            string = "Close button";
        }
        linearLayout.setContentDescription(string);
        relativeLayout.addView(linearLayout, layoutParams);
        PopupWindow popupWindow = new PopupWindow((View) relativeLayout, iApplyDimension, iApplyDimension2, false);
        popupWindow.setOutsideTouchable(false);
        popupWindow.setTouchable(true);
        popupWindow.setClippingEnabled(!uw2Var.f10508e);
        return popupWindow;
    }

    public final void a(tx0 tx0Var, String str) {
        m0.t(this.f9289b, null, null, new b0(str, this, tx0Var, (Continuation) null, 13), 3);
    }

    /* JADX WARN: Can't wrap try/catch for region: R(15:90|(1:(1:(1:(7:13|94|14|58|81|82|83)(2:18|19))(8:20|98|21|22|92|54|(5:57|58|81|82|83)|56))(1:27))(3:28|(1:31)|56)|32|(5:34|88|35|36|(4:41|81|82|83)(1:42))|43|(1:45)|46|96|47|48|86|49|50|(4:53|92|54|(0))|56) */
    /* JADX WARN: Can't wrap try/catch for region: R(20:0|2|(2:4|(1:6)(1:7))(0)|8|90|(1:(1:(1:(7:13|94|14|58|81|82|83)(2:18|19))(8:20|98|21|22|92|54|(5:57|58|81|82|83)|56))(1:27))(3:28|(1:31)|56)|32|(5:34|88|35|36|(4:41|81|82|83)(1:42))|43|(1:45)|46|96|47|48|86|49|50|(4:53|92|54|(0))|56|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:63:0x01ad, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:64:0x01ae, code lost:
    
        r12 = r18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x01b1, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x01cd, code lost:
    
        r0 = (android.view.ViewGroup) r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x01d0, code lost:
    
        r0 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x01d3, code lost:
    
        r0.removeView(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x01da, code lost:
    
        r0.removeView(r15.f9298k);
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x01e3, code lost:
    
        r0.addView(r8);
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01ea, code lost:
    
        r12.a(r0);
        r5 = r5;
     */
    /* JADX WARN: Removed duplicated region for block: B:57:0x01a2  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x01cd A[Catch: all -> 0x0108, TryCatch #2 {all -> 0x0108, blocks: (B:14:0x0041, B:58:0x01a4, B:81:0x01ed, B:66:0x01b2, B:68:0x01cd, B:71:0x01d3, B:72:0x01d6, B:74:0x01da, B:75:0x01df, B:77:0x01e3, B:78:0x01e6, B:80:0x01ea, B:54:0x0187, B:32:0x00c7, B:34:0x00cb, B:35:0x00e0, B:36:0x00ee, B:41:0x010e, B:42:0x0115, B:43:0x0119, B:45:0x0120, B:46:0x0123, B:47:0x012b, B:49:0x017a), top: B:90:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01d0  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x01d3 A[Catch: all -> 0x0108, TryCatch #2 {all -> 0x0108, blocks: (B:14:0x0041, B:58:0x01a4, B:81:0x01ed, B:66:0x01b2, B:68:0x01cd, B:71:0x01d3, B:72:0x01d6, B:74:0x01da, B:75:0x01df, B:77:0x01e3, B:78:0x01e6, B:80:0x01ea, B:54:0x0187, B:32:0x00c7, B:34:0x00cb, B:35:0x00e0, B:36:0x00ee, B:41:0x010e, B:42:0x0115, B:43:0x0119, B:45:0x0120, B:46:0x0123, B:47:0x012b, B:49:0x017a), top: B:90:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01da A[Catch: all -> 0x0108, TryCatch #2 {all -> 0x0108, blocks: (B:14:0x0041, B:58:0x01a4, B:81:0x01ed, B:66:0x01b2, B:68:0x01cd, B:71:0x01d3, B:72:0x01d6, B:74:0x01da, B:75:0x01df, B:77:0x01e3, B:78:0x01e6, B:80:0x01ea, B:54:0x0187, B:32:0x00c7, B:34:0x00cb, B:35:0x00e0, B:36:0x00ee, B:41:0x010e, B:42:0x0115, B:43:0x0119, B:45:0x0120, B:46:0x0123, B:47:0x012b, B:49:0x017a), top: B:90:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01e3 A[Catch: all -> 0x0108, TryCatch #2 {all -> 0x0108, blocks: (B:14:0x0041, B:58:0x01a4, B:81:0x01ed, B:66:0x01b2, B:68:0x01cd, B:71:0x01d3, B:72:0x01d6, B:74:0x01da, B:75:0x01df, B:77:0x01e3, B:78:0x01e6, B:80:0x01ea, B:54:0x0187, B:32:0x00c7, B:34:0x00cb, B:35:0x00e0, B:36:0x00ee, B:41:0x010e, B:42:0x0115, B:43:0x0119, B:45:0x0120, B:46:0x0123, B:47:0x012b, B:49:0x017a), top: B:90:0x0027 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01ea A[Catch: all -> 0x0108, TryCatch #2 {all -> 0x0108, blocks: (B:14:0x0041, B:58:0x01a4, B:81:0x01ed, B:66:0x01b2, B:68:0x01cd, B:71:0x01d3, B:72:0x01d6, B:74:0x01da, B:75:0x01df, B:77:0x01e3, B:78:0x01e6, B:80:0x01ea, B:54:0x0187, B:32:0x00c7, B:34:0x00cb, B:35:0x00e0, B:36:0x00ee, B:41:0x010e, B:42:0x0115, B:43:0x0119, B:45:0x0120, B:46:0x0123, B:47:0x012b, B:49:0x017a), top: B:90:0x0027 }] */
    /* JADX WARN: Type inference failed for: r5v0, types: [int] */
    /* JADX WARN: Type inference failed for: r5v1 */
    /* JADX WARN: Type inference failed for: r5v11 */
    /* JADX WARN: Type inference failed for: r5v24 */
    /* JADX WARN: Type inference failed for: r5v25 */
    /* JADX WARN: Type inference failed for: r5v26 */
    /* JADX WARN: Type inference failed for: r5v27 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ViewGroup viewGroup, uw2 uw2Var, Activity activity, Window window, tx0 tx0Var, jy0 jy0Var, ContinuationImpl continuationImpl) throws Throwable {
        nr1 nr1Var;
        Object obj;
        Activity activity2;
        Window window2;
        tx0 tx0Var2;
        rr1 rr1Var;
        jy0 jy0Var2;
        uw2 uw2Var2;
        Object obj2;
        ViewGroup viewGroup2;
        PopupWindow popupWindowA;
        nr1 nr1Var2;
        tx0 tx0Var3;
        rr1 rr1Var2;
        ImageView imageView;
        jy0 jy0Var3;
        PopupWindow popupWindow;
        ViewParent parent;
        ViewGroup viewGroup3;
        ViewGroup viewGroup4;
        ViewGroup viewGroup5;
        fs3 fs3Var;
        if (continuationImpl instanceof nr1) {
            nr1Var = (nr1) continuationImpl;
            int i5 = nr1Var.f7660k;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                nr1Var.f7660k = i5 - Integer.MIN_VALUE;
            } else {
                nr1Var = new nr1(this, continuationImpl);
            }
        }
        Object obj3 = nr1Var.f7658i;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r52 = nr1Var.f7660k;
        try {
            if (r52 == 0) {
                ResultKt.b(obj3);
                nr1Var.f7650a = this;
                nr1Var.f7651b = viewGroup;
                nr1Var.f7652c = uw2Var;
                activity2 = activity;
                nr1Var.f7653d = activity2;
                window2 = window;
                nr1Var.f7654e = window2;
                tx0Var2 = tx0Var;
                nr1Var.f7655f = tx0Var2;
                nr1Var.f7656g = jy0Var;
                d dVar = this.f9296i;
                nr1Var.f7657h = dVar;
                nr1Var.f7660k = 1;
                if (dVar.e(nr1Var) != coroutineSingletons) {
                    rr1Var = this;
                    jy0Var2 = jy0Var;
                    uw2Var2 = uw2Var;
                    obj2 = dVar;
                    viewGroup2 = viewGroup;
                }
                return coroutineSingletons;
            }
            if (r52 != 1) {
                if (r52 != 2) {
                    if (r52 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    popupWindow = (PopupWindow) nr1Var.f7654e;
                    obj2 = (c80.a) nr1Var.f7653d;
                    jy0Var3 = (jy0) nr1Var.f7652c;
                    tx0Var3 = (tx0) nr1Var.f7651b;
                    rr1Var2 = nr1Var.f7650a;
                    try {
                        ResultKt.b(obj3);
                        obj2 = obj2;
                        rr1Var2.f9297j = popupWindow;
                        r52 = obj2;
                    } catch (Exception e3) {
                        e = e3;
                        rr1Var = rr1Var2;
                        jy0Var2 = jy0Var3;
                        tx0Var2 = tx0Var3;
                        rr1Var.a(tx0Var2, "Cannot show popup window: " + e.getMessage());
                        parent = jy0Var2.getParent();
                        if (!(parent instanceof ViewGroup)) {
                        }
                        if (viewGroup3 != null) {
                        }
                        viewGroup4 = rr1Var.n;
                        if (viewGroup4 != null) {
                        }
                        viewGroup5 = rr1Var.n;
                        if (viewGroup5 != null) {
                        }
                        fs3Var = rr1Var.f9300m;
                        r52 = obj2;
                        if (fs3Var != null) {
                        }
                        Unit unit = Unit.f71706a;
                        ((d) r52).g(null);
                        return unit;
                    }
                    Unit unit2 = Unit.f71706a;
                    ((d) r52).g(null);
                    return unit2;
                }
                PopupWindow popupWindow2 = (PopupWindow) nr1Var.f7654e;
                Object obj4 = (c80.a) nr1Var.f7653d;
                jy0Var2 = (jy0) nr1Var.f7652c;
                tx0 tx0Var4 = (tx0) nr1Var.f7651b;
                rr1 rr1Var3 = nr1Var.f7650a;
                try {
                    ResultKt.b(obj3);
                    nr1Var2 = nr1Var;
                    popupWindowA = popupWindow2;
                    obj2 = obj4;
                    tx0Var3 = tx0Var4;
                    rr1Var2 = rr1Var3;
                    try {
                        bq1 bq1Var = rr1Var2.f9288a;
                        nr1Var2.f7650a = rr1Var2;
                        nr1Var2.f7651b = tx0Var3;
                        nr1Var2.f7652c = jy0Var2;
                        nr1Var2.f7653d = obj2;
                        nr1Var2.f7654e = popupWindowA;
                        nr1Var2.f7660k = 3;
                        bq1Var.getClass();
                    } catch (Exception e11) {
                        e = e11;
                        jy0Var3 = jy0Var2;
                        rr1Var = rr1Var2;
                        jy0Var2 = jy0Var3;
                        tx0Var2 = tx0Var3;
                        rr1Var.a(tx0Var2, "Cannot show popup window: " + e.getMessage());
                        parent = jy0Var2.getParent();
                        if (!(parent instanceof ViewGroup)) {
                        }
                        if (viewGroup3 != null) {
                        }
                        viewGroup4 = rr1Var.n;
                        if (viewGroup4 != null) {
                        }
                        viewGroup5 = rr1Var.n;
                        if (viewGroup5 != null) {
                        }
                        fs3Var = rr1Var.f9300m;
                        r52 = obj2;
                        if (fs3Var != null) {
                        }
                        Unit unit22 = Unit.f71706a;
                        ((d) r52).g(null);
                        return unit22;
                    }
                } catch (Exception e12) {
                    e = e12;
                    obj2 = obj4;
                    jy0Var3 = jy0Var2;
                    tx0Var3 = tx0Var4;
                    rr1Var2 = rr1Var3;
                    rr1Var = rr1Var2;
                    jy0Var2 = jy0Var3;
                    tx0Var2 = tx0Var3;
                    rr1Var.a(tx0Var2, "Cannot show popup window: " + e.getMessage());
                    parent = jy0Var2.getParent();
                    if (!(parent instanceof ViewGroup)) {
                    }
                    if (viewGroup3 != null) {
                    }
                    viewGroup4 = rr1Var.n;
                    if (viewGroup4 != null) {
                    }
                    viewGroup5 = rr1Var.n;
                    if (viewGroup5 != null) {
                    }
                    fs3Var = rr1Var.f9300m;
                    r52 = obj2;
                    if (fs3Var != null) {
                    }
                    Unit unit222 = Unit.f71706a;
                    ((d) r52).g(null);
                    return unit222;
                } catch (Throwable th2) {
                    th = th2;
                    obj = obj4;
                    ((d) obj).g(null);
                    throw th;
                }
                if (bq1.a(tx0Var3, "resized", nr1Var2) != coroutineSingletons) {
                    popupWindow = popupWindowA;
                    jy0Var3 = jy0Var2;
                    obj2 = obj2;
                    rr1Var2.f9297j = popupWindow;
                    r52 = obj2;
                    Unit unit2222 = Unit.f71706a;
                    ((d) r52).g(null);
                    return unit2222;
                }
                return coroutineSingletons;
            }
            Object obj5 = nr1Var.f7657h;
            jy0Var2 = nr1Var.f7656g;
            tx0 tx0Var5 = nr1Var.f7655f;
            window2 = (Window) nr1Var.f7654e;
            Activity activity3 = (Activity) nr1Var.f7653d;
            uw2Var2 = (uw2) nr1Var.f7652c;
            viewGroup2 = nr1Var.f7651b;
            rr1Var = nr1Var.f7650a;
            ResultKt.b(obj3);
            tx0Var2 = tx0Var5;
            activity2 = activity3;
            obj2 = obj5;
            if (rr1Var.f9297j == null) {
                rr1Var.f9300m = tx0Var2.e();
                rr1Var.f9299l = jy0Var2.getLayoutParams();
                ViewGroup.LayoutParams layoutParams = jy0Var2.getLayoutParams();
                Intrinsics.f(layoutParams, "getLayoutParams(...)");
                try {
                    Bitmap bitmapCreateBitmap = Bitmap.createBitmap(jy0Var2.getWidth(), jy0Var2.getHeight(), Bitmap.Config.ARGB_8888);
                    Intrinsics.d(bitmapCreateBitmap);
                    jy0Var2.draw(new Canvas(bitmapCreateBitmap));
                    imageView = new ImageView(activity2);
                    imageView.setLayoutParams(layoutParams);
                    imageView.setImageBitmap(bitmapCreateBitmap);
                    viewGroup2.addView(imageView);
                } catch (Exception unused) {
                    imageView = null;
                }
                if (imageView == null) {
                    rr1Var.a(tx0Var2, "Unable to create snapshot of webview.");
                    r52 = obj2;
                    Unit unit22222 = Unit.f71706a;
                    ((d) r52).g(null);
                    return unit22222;
                }
                rr1Var.f9298k = imageView;
                rr1Var.n = viewGroup2;
            }
            viewGroup2.removeView(jy0Var2);
            PopupWindow popupWindow3 = rr1Var.f9297j;
            if (popupWindow3 != null) {
                popupWindow3.dismiss();
            }
            popupWindowA = rr1Var.a(uw2Var2, activity2, tx0Var2);
            Point pointA = uw2Var2.a();
            popupWindowA.showAtLocation(window2.getDecorView(), 0, d0.b(activity2, pointA.x), d0.b(activity2, pointA.y));
            m0.t(rr1Var.f9290c, null, null, new a60.d(rr1Var, null, 13), 3);
            bq1 bq1Var2 = rr1Var.f9288a;
            int i11 = pointA.x;
            int i12 = pointA.y;
            int i13 = uw2Var2.f10504a;
            int i14 = uw2Var2.f10505b;
            nr1Var.f7650a = rr1Var;
            nr1Var.f7651b = tx0Var2;
            nr1Var.f7652c = jy0Var2;
            nr1Var.f7653d = obj2;
            nr1Var.f7654e = popupWindowA;
            nr1Var.f7655f = null;
            nr1Var.f7656g = null;
            nr1Var.f7657h = null;
            nr1Var.f7660k = 2;
            bq1Var2.getClass();
            nr1 nr1Var3 = nr1Var;
            tx0 tx0Var6 = tx0Var2;
            Object objA = bq1.a(tx0Var6, i11, i12, i13, i14, nr1Var3);
            nr1Var2 = nr1Var3;
            if (objA != coroutineSingletons) {
                tx0Var3 = tx0Var6;
                rr1Var2 = rr1Var;
                obj2 = obj2;
                bq1 bq1Var3 = rr1Var2.f9288a;
                nr1Var2.f7650a = rr1Var2;
                nr1Var2.f7651b = tx0Var3;
                nr1Var2.f7652c = jy0Var2;
                nr1Var2.f7653d = obj2;
                nr1Var2.f7654e = popupWindowA;
                nr1Var2.f7660k = 3;
                bq1Var3.getClass();
                if (bq1.a(tx0Var3, "resized", nr1Var2) != coroutineSingletons) {
                }
            }
            return coroutineSingletons;
        } catch (Throwable th3) {
            th = th3;
            obj = r52;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue
    java.lang.NullPointerException: Cannot invoke "java.util.List.iterator()" because the return value of "jadx.core.dex.visitors.regions.SwitchOverStringVisitor$SwitchData.getNewCases()" is null
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.restoreSwitchOverString(SwitchOverStringVisitor.java:109)
    	at jadx.core.dex.visitors.regions.SwitchOverStringVisitor.visitRegion(SwitchOverStringVisitor.java:66)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:77)
    	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseIterativeStepInternal(DepthRegionTraversal.java:82)
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0196  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x0294  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x02a9  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    /* JADX WARN: Type inference failed for: r0v13, types: [int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Object a(rr1 rr1Var, Map map, ContinuationImpl continuationImpl) {
        pr1 pr1Var;
        Activity activityB;
        Window window;
        ViewGroup viewGroup;
        int iIntValue;
        int iIntValue2;
        boolean zBooleanValue;
        lu luVar;
        lu luVar2;
        int i5;
        int i11;
        Boolean boolT1;
        Integer numU0;
        Integer numU02;
        Integer numU03;
        Integer numU04;
        Pair pair;
        Point point;
        Point point2;
        int i12;
        int i13;
        rr1 rr1Var2 = rr1Var;
        if (continuationImpl instanceof pr1) {
            pr1Var = (pr1) continuationImpl;
            int i14 = pr1Var.f8365m;
            if ((i14 & Integer.MIN_VALUE) != 0) {
                pr1Var.f8365m = i14 - Integer.MIN_VALUE;
            } else {
                pr1Var = new pr1(rr1Var2, continuationImpl);
            }
        }
        Object obj = pr1Var.f8363k;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i15 = pr1Var.f8365m;
        if (i15 == 0) {
            ResultKt.b(obj);
            tx0 tx0Var = rr1Var2.f9295h;
            jy0 jy0Var = rr1Var2.f9294g;
            if (tx0Var != null && jy0Var != null) {
                activityB = rr1Var2.f9292e.b();
                if (activityB == null) {
                    rr1Var2.a(tx0Var, "There is no active activity, cannot resize.");
                    return Unit.f71706a;
                }
                if (tx0Var.e().f3488a == es3.f2967d) {
                    rr1Var2.a(tx0Var, "Cannot resize full screen webview.");
                    return Unit.f71706a;
                }
                if (tx0Var.n.get()) {
                    rr1Var2.a(tx0Var, "Cannot resize expanded webview.");
                    return Unit.f71706a;
                }
                window = activityB.getWindow();
                if (window == null) {
                    rr1Var2.a(tx0Var, "Activity does not have window, cannot resize.");
                    return Unit.f71706a;
                }
                ViewParent parent = jy0Var.getParent();
                viewGroup = parent instanceof ViewGroup ? (ViewGroup) parent : null;
                if (viewGroup == null) {
                    rr1Var2.a(tx0Var, "Cannot resize webview that has no parent.");
                    return Unit.f71706a;
                }
                String str = (String) map.get("width");
                iIntValue = -1;
                iIntValue2 = (str == null || (numU04 = i.u0(str)) == null) ? -1 : numU04.intValue();
                String str2 = (String) map.get("height");
                if (str2 != null && (numU03 = i.u0(str2)) != null) {
                    iIntValue = numU03.intValue();
                }
                String str3 = (String) map.get("offsetX");
                int iIntValue3 = (str3 == null || (numU02 = i.u0(str3)) == null) ? 0 : numU02.intValue();
                String str4 = (String) map.get("offsetY");
                int iIntValue4 = (str4 == null || (numU0 = i.u0(str4)) == null) ? 0 : numU0.intValue();
                String str5 = (String) map.get("allowOffscreen");
                zBooleanValue = (str5 == null || (boolT1 = r70.k.t1(str5)) == null) ? true : boolT1.booleanValue();
                String str6 = (String) map.get("customClosePosition");
                lu.f6951b.getClass();
                if (str6 != null) {
                    switch (str6.hashCode()) {
                        case -1364013995:
                            if (str6.equals("center")) {
                                luVar = lu.f6955f;
                                break;
                            } else {
                                luVar = lu.f6954e;
                                break;
                            }
                        case -1314880604:
                            if (str6.equals("top-right")) {
                                luVar = lu.f6954e;
                                break;
                            }
                            break;
                        case -1012429441:
                            if (str6.equals("top-left")) {
                                luVar = lu.f6952c;
                                break;
                            }
                            break;
                        case -655373719:
                            if (str6.equals("bottom-left")) {
                                luVar = lu.f6956g;
                                break;
                            }
                            break;
                        case 1163912186:
                            if (str6.equals("bottom-right")) {
                                luVar = lu.f6958i;
                                break;
                            }
                            break;
                        case 1288627767:
                            if (str6.equals("bottom-center")) {
                                luVar = lu.f6957h;
                                break;
                            }
                            break;
                        case 1755462605:
                            if (str6.equals("top-center")) {
                                luVar = lu.f6953d;
                                break;
                            }
                            break;
                    }
                    js1 js1Var = rr1Var2.f9291d;
                    pr1Var.f8353a = rr1Var2;
                    pr1Var.f8354b = activityB;
                    pr1Var.f8355c = window;
                    pr1Var.f8356d = viewGroup;
                    pr1Var.f8357e = luVar;
                    pr1Var.f8358f = iIntValue2;
                    pr1Var.f8359g = iIntValue;
                    pr1Var.f8360h = iIntValue3;
                    pr1Var.f8361i = iIntValue4;
                    pr1Var.f8362j = zBooleanValue ? 1 : 0;
                    pr1Var.f8365m = 1;
                    js1Var.getClass();
                    Object objA = js1.a(js1Var, pr1Var);
                    if (objA == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    luVar2 = luVar;
                    i5 = iIntValue3;
                    obj = objA;
                    i11 = iIntValue4;
                }
            } else {
                return Unit.f71706a;
            }
        } else {
            if (i15 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ?? r02 = pr1Var.f8362j;
            int i16 = pr1Var.f8361i;
            int i17 = pr1Var.f8360h;
            iIntValue = pr1Var.f8359g;
            iIntValue2 = pr1Var.f8358f;
            lu luVar3 = pr1Var.f8357e;
            viewGroup = pr1Var.f8356d;
            window = pr1Var.f8355c;
            activityB = pr1Var.f8354b;
            rr1 rr1Var3 = pr1Var.f8353a;
            ResultKt.b(obj);
            zBooleanValue = r02;
            i11 = i16;
            rr1Var2 = rr1Var3;
            i5 = i17;
            luVar2 = luVar3;
        }
        int i18 = iIntValue;
        int i19 = iIntValue2;
        Rect rect = (Rect) obj;
        if (rect == null) {
            rect = new Rect();
        }
        Rect rect2 = rect;
        Pair pairR = d0.r(activityB);
        Object obj2 = pairR.f71683a;
        Pair pairL = d0.l(activityB);
        boolean z11 = zBooleanValue;
        uw2 uw2Var = new uw2(i19, i18, i5, i11, z11, luVar2, rect2, pairR, pairL);
        boolean z12 = z11;
        Number number = (Number) obj2;
        int iIntValue5 = number.intValue();
        int iIntValue6 = ((Number) pairR.f71684b).intValue();
        if (i19 < 50 || i19 > iIntValue5) {
            pair = new Pair(Boolean.FALSE, "Invalid width. Cannot resize.");
        } else if (i18 < 50 || i18 > iIntValue6) {
            pair = new Pair(Boolean.FALSE, "Invalid height. Cannot resize.");
        } else if (i18 >= iIntValue6 && i19 >= iIntValue5) {
            pair = new Pair(Boolean.FALSE, "Resize cannot be used to resize to full screen.");
        } else if (z12) {
            int iIntValue7 = ((Number) pairL.f71683a).intValue();
            int iIntValue8 = ((Number) pairL.f71684b).intValue();
            int iIntValue9 = number.intValue();
            int i21 = rect2.left + i5;
            int i22 = i21 + i19;
            int i23 = (i19 / 2) + i21;
            int i24 = rect2.top + i11;
            int i25 = i24 + i18;
            int i26 = (i18 / 2) + i24;
            switch (luVar2.ordinal()) {
                case 0:
                    point = new Point(i21, i24);
                    point2 = point;
                    i12 = point2.x;
                    if (i12 >= 0 || i12 + 50 > iIntValue9 || (i13 = point2.y) < iIntValue7 || i13 + 50 > iIntValue8) {
                        pair = new Pair(Boolean.FALSE, "Close button is not visible.");
                        break;
                    } else {
                        pair = new Pair(Boolean.TRUE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                        break;
                    }
                case 1:
                    point = new Point(i23 - 25, i24);
                    point2 = point;
                    i12 = point2.x;
                    if (i12 >= 0) {
                        break;
                    }
                    pair = new Pair(Boolean.FALSE, "Close button is not visible.");
                    break;
                case 2:
                    point = new Point(i22 - 50, i24);
                    point2 = point;
                    i12 = point2.x;
                    if (i12 >= 0) {
                    }
                    pair = new Pair(Boolean.FALSE, "Close button is not visible.");
                    break;
                case 3:
                    point2 = new Point(i23 - 25, i26 - 25);
                    i12 = point2.x;
                    if (i12 >= 0) {
                    }
                    pair = new Pair(Boolean.FALSE, "Close button is not visible.");
                    break;
                case 4:
                    point2 = new Point(i21, i25 - 50);
                    i12 = point2.x;
                    if (i12 >= 0) {
                    }
                    pair = new Pair(Boolean.FALSE, "Close button is not visible.");
                    break;
                case 5:
                    point2 = new Point(i23 - 25, i25 - 50);
                    i12 = point2.x;
                    if (i12 >= 0) {
                    }
                    pair = new Pair(Boolean.FALSE, "Close button is not visible.");
                    break;
                case 6:
                    point2 = new Point(i22 - 50, i25 - 50);
                    i12 = point2.x;
                    if (i12 >= 0) {
                    }
                    pair = new Pair(Boolean.FALSE, "Close button is not visible.");
                    break;
                default:
                    throw new NoWhenBranchMatchedException();
            }
        }
        boolean zBooleanValue2 = ((Boolean) pair.f71683a).booleanValue();
        String str7 = (String) pair.f71684b;
        if (!zBooleanValue2) {
            rr1Var2.a(rr1Var2.f9295h, str7);
            return Unit.f71706a;
        }
        m0.t(rr1Var2.f9289b, null, null, new m8.i(rr1Var2, viewGroup, uw2Var, activityB, window, null, 6), 3);
        return Unit.f71706a;
    }
}
