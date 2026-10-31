package ads_mobile_sdk;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.DisplayMetrics;
import b.d0;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import t70.m0;

/* loaded from: classes.dex */
public final class zq1 implements b.gb {

    /* renamed from: a, reason: collision with root package name */
    public final Context f12625a;

    /* renamed from: b, reason: collision with root package name */
    public final g0 f12626b;

    /* renamed from: c, reason: collision with root package name */
    public final bq1 f12627c;

    /* renamed from: d, reason: collision with root package name */
    public final String f12628d;

    /* renamed from: e, reason: collision with root package name */
    public final t70.j0 f12629e;

    /* renamed from: f, reason: collision with root package name */
    public final di0 f12630f;

    public zq1(Context context, g0 activityTracker, bq1 dispatcher, String afmaVersion, t70.j0 uiScope, di0 deviceProperties) {
        Intrinsics.g(context, "context");
        Intrinsics.g(activityTracker, "activityTracker");
        Intrinsics.g(dispatcher, "dispatcher");
        Intrinsics.g(afmaVersion, "afmaVersion");
        Intrinsics.g(uiScope, "uiScope");
        Intrinsics.g(deviceProperties, "deviceProperties");
        this.f12625a = context;
        this.f12626b = activityTracker;
        this.f12627c = dispatcher;
        this.f12628d = afmaVersion;
        this.f12629e = uiScope;
        this.f12630f = deviceProperties;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Override // b.gb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(tx0 tx0Var, Map map, Continuation continuation) {
        xq1 xq1Var;
        zq1 zq1Var;
        zq1 zq1Var2;
        tx0 tx0Var2;
        zq1 zq1Var3;
        tx0 tx0Var3;
        tx0 tx0Var4 = tx0Var;
        if (continuation instanceof xq1) {
            xq1Var = (xq1) continuation;
            int i5 = xq1Var.f11799e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                xq1Var.f11799e = i5 - Integer.MIN_VALUE;
            } else {
                xq1Var = new xq1(this, continuation);
            }
        }
        Object obj = xq1Var.f11797c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = xq1Var.f11799e;
        Continuation continuation2 = null;
        if (i11 == 0) {
            ResultKt.b(obj);
            xq1Var.f11795a = this;
            xq1Var.f11796b = tx0Var4;
            xq1Var.f11799e = 1;
            m0.t(this.f12629e, null, null, new wq1(this, tx0Var4, continuation2, 0), 3);
            if (Unit.f71706a != coroutineSingletons) {
                zq1Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                tx0Var3 = xq1Var.f11796b;
                zq1Var3 = xq1Var.f11795a;
                ResultKt.b(obj);
                m0.t(zq1Var3.f12629e, null, null, new wq1(zq1Var3, tx0Var3, continuation2, 1), 3);
                return Unit.f71706a;
            }
            tx0 tx0Var5 = xq1Var.f11796b;
            zq1 zq1Var4 = xq1Var.f11795a;
            ResultKt.b(obj);
            tx0Var2 = tx0Var5;
            zq1Var2 = zq1Var4;
            xq1Var.f11795a = zq1Var2;
            xq1Var.f11796b = tx0Var2;
            xq1Var.f11799e = 3;
            di0 di0Var = zq1Var2.f12630f;
            di0Var.getClass();
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse("sms:"));
            boolean zA = di0Var.a(intent);
            di0Var.getClass();
            Intent intent2 = new Intent("android.intent.action.DIAL");
            intent2.setData(Uri.parse("tel:"));
            boolean zA2 = di0Var.a(intent2);
            Intent type = new Intent("android.intent.action.INSERT").setType("vnd.android.cursor.dir/event");
            Intrinsics.f(type, "setType(...)");
            m0.t(zq1Var2.f12629e, null, null, new vq1(zq1Var2, tx0Var2, zA, zA2, di0Var.a(type), di0Var.c(), null), 3);
            if (Unit.f71706a != coroutineSingletons) {
                zq1Var3 = zq1Var2;
                tx0Var3 = tx0Var2;
                m0.t(zq1Var3.f12629e, null, null, new wq1(zq1Var3, tx0Var3, continuation2, 1), 3);
                return Unit.f71706a;
            }
            return coroutineSingletons;
        }
        tx0Var4 = xq1Var.f11796b;
        zq1 zq1Var5 = xq1Var.f11795a;
        ResultKt.b(obj);
        zq1Var = zq1Var5;
        tx0 tx0Var6 = tx0Var4;
        xq1Var.f11795a = zq1Var;
        xq1Var.f11796b = tx0Var6;
        xq1Var.f11799e = 2;
        zq1Var.getClass();
        Context context = zq1Var.f12625a;
        int[] iArr = new int[2];
        tx0Var6.getLocationOnScreen(iArr);
        Activity activityB = zq1Var.f12626b.b();
        int iIntValue = activityB != null ? ((Number) d0.l(activityB).f71683a).intValue() : 0;
        int i12 = iArr[0];
        int i13 = iArr[1] - iIntValue;
        int width = tx0Var6.getWidth();
        Intrinsics.g(context, "<this>");
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics, "getDisplayMetrics(...)");
        Integer num = new Integer(MathKt.b(width / displayMetrics.density));
        float height = tx0Var6.getHeight();
        DisplayMetrics displayMetrics2 = context.getResources().getDisplayMetrics();
        Intrinsics.f(displayMetrics2, "getDisplayMetrics(...)");
        m0.t(zq1Var.f12629e, null, null, new uq1(zq1Var, tx0Var6, i12, i13, num.intValue(), new Integer(MathKt.b(height / displayMetrics2.density)).intValue(), null), 3);
        if (Unit.f71706a != coroutineSingletons) {
            zq1Var2 = zq1Var;
            tx0Var2 = tx0Var6;
            xq1Var.f11795a = zq1Var2;
            xq1Var.f11796b = tx0Var2;
            xq1Var.f11799e = 3;
            di0 di0Var2 = zq1Var2.f12630f;
            di0Var2.getClass();
            Intent intent3 = new Intent("android.intent.action.VIEW");
            intent3.setData(Uri.parse("sms:"));
            boolean zA3 = di0Var2.a(intent3);
            di0Var2.getClass();
            Intent intent22 = new Intent("android.intent.action.DIAL");
            intent22.setData(Uri.parse("tel:"));
            boolean zA22 = di0Var2.a(intent22);
            Intent type2 = new Intent("android.intent.action.INSERT").setType("vnd.android.cursor.dir/event");
            Intrinsics.f(type2, "setType(...)");
            m0.t(zq1Var2.f12629e, null, null, new vq1(zq1Var2, tx0Var2, zA3, zA22, di0Var2.a(type2), di0Var2.c(), null), 3);
            if (Unit.f71706a != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }

    @Override // b.gb
    public final int b() {
        return 25;
    }
}
