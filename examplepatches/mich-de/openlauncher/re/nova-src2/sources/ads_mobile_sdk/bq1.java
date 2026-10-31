package ads_mobile_sdk;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.util.DisplayMetrics;
import android.view.Display;
import b.d0;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import t70.m0;

/* loaded from: classes2.dex */
public final class bq1 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f1491a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.j0 f1492b;

    /* renamed from: c, reason: collision with root package name */
    public final g0 f1493c;

    /* renamed from: d, reason: collision with root package name */
    public final dj0 f1494d;

    public bq1(Context context, t70.j0 uiScope, g0 activityTracker, dj0 displayUtil) {
        Intrinsics.g(context, "context");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(displayUtil, "displayUtil");
        this.f1491a = context;
        this.f1492b = uiScope;
        this.f1493c = activityTracker;
        this.f1494d = displayUtil;
    }

    public static Object a(tx0 tx0Var, String str, String str2, SuspendLambda suspendLambda) throws Throwable {
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.s("action", str2);
        rVar.s(PglCryptUtils.KEY_MESSAGE, str);
        Object objA = tx0Var.a(rVar, "onError", suspendLambda);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public final Unit a(tx0 tx0Var) {
        Display display;
        dj0 dj0Var = this.f1494d;
        Context context = this.f1491a;
        Context contextC = dj0Var.c(context);
        Context contextC2 = dj0Var.c(context);
        Continuation continuation = null;
        if (Build.VERSION.SDK_INT >= 30) {
            try {
                display = contextC2.getDisplay();
            } catch (Exception e3) {
                cz.b bVar = mu0.f7335a;
                mu0.a("Unable to get display: " + e3.getMessage(), null, 6);
            }
        } else {
            display = dj0Var.b(contextC2).getDefaultDisplay();
        }
        if (display == null) {
            mu0.b("Unable to get Display in MraidAfmaDispatcher", null);
            return Unit.f71706a;
        }
        int rotation = display.getRotation();
        DisplayMetrics displayMetricsG = d0.g(contextC);
        float f11 = displayMetricsG.density;
        float f12 = displayMetricsG.widthPixels;
        DisplayMetrics displayMetrics = contextC.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        int iB = MathKt.b(f12 / displayMetrics.density);
        float f13 = displayMetricsG.heightPixels;
        DisplayMetrics displayMetrics2 = contextC.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics2, "getDisplayMetrics(...)");
        int iB2 = MathKt.b(f13 / displayMetrics2.density);
        Activity activityB = this.f1493c.b();
        Pair pairR = activityB != null ? d0.r(activityB) : new Pair(new Integer(iB), new Integer(iB2));
        int iIntValue = ((Number) pairR.f71683a).intValue();
        int iIntValue2 = ((Number) pairR.f71684b).intValue();
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.q(new Integer(iB), "width");
        rVar.q(new Integer(iB2), "height");
        rVar.q(new Integer(iIntValue), "maxSizeWidth");
        rVar.q(new Integer(iIntValue2), "maxSizeHeight");
        rVar.q(new Double(f11), "density");
        rVar.q(new Integer(rotation), "rotation");
        m0.t(this.f1492b, null, null, new aq1(tx0Var, rVar, continuation, 0), 3);
        return Unit.f71706a;
    }

    public static Object a(tx0 tx0Var, int i5, int i11, int i12, int i13, nr1 nr1Var) throws Throwable {
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.q(new Integer(i5), "x");
        rVar.q(new Integer(i11), "y");
        rVar.q(new Integer(i12), "width");
        rVar.q(new Integer(i13), "height");
        Object objA = tx0Var.a(rVar, "onSizeChanged", nr1Var);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }

    public static Object a(tx0 tx0Var, String str, ContinuationImpl continuationImpl) throws Throwable {
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.s("state", str);
        Object objA = tx0Var.a(rVar, "onStateChanged", continuationImpl);
        return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
    }
}
