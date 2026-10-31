package b;

import ads_mobile_sdk.he3;
import ads_mobile_sdk.in0;
import ads_mobile_sdk.jy0;
import ads_mobile_sdk.ri;
import ads_mobile_sdk.tx0;
import ads_mobile_sdk.wf0;
import android.content.Context;
import android.widget.FrameLayout;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public interface y4 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    static Object a(y4 y4Var, jy0 jy0Var, ads_mobile_sdk.z1 z1Var, wf0 wf0Var, ContinuationImpl continuationImpl) throws Throwable {
        in0 in0Var;
        if (continuationImpl instanceof in0) {
            in0Var = (in0) continuationImpl;
            int i5 = in0Var.f4885f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                in0Var.f4885f = i5 - Integer.MIN_VALUE;
            } else {
                in0Var = new in0(y4Var, continuationImpl);
            }
        }
        Object obj = in0Var.f4883d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = in0Var.f4885f;
        if (i11 == 0) {
            ResultKt.b(obj);
            tx0 tx0Var = jy0Var.f5452a;
            in0Var.f4880a = jy0Var;
            in0Var.f4881b = z1Var;
            in0Var.f4882c = wf0Var;
            in0Var.f4885f = 1;
            com.google.gson.r rVar = new com.google.gson.r();
            rVar.s("app_muted", String.valueOf(y4Var.a().f9193d));
            rVar.s("app_volume", String.valueOf(y4Var.a().f9192c));
            Object objA = tx0Var.a(rVar, "volume", in0Var);
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
            wf0Var = in0Var.f4882c;
            z1Var = in0Var.f4881b;
            jy0Var = in0Var.f4880a;
            ResultKt.b(obj);
        }
        jy0Var.f5453b = wf0Var;
        if (z1Var.f12372c0) {
            Context context = jy0Var.getContext();
            Intrinsics.f(context, "getContext(...)");
            he3 he3Var = new he3(context);
            jy0Var.addView(he3Var, new FrameLayout.LayoutParams(-2, -2, 49));
            jy0Var.bringChildToFront(he3Var);
        }
        return Unit.f71706a;
    }

    ri a();
}
