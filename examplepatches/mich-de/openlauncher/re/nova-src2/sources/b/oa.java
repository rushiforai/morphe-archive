package b;

import ads_mobile_sdk.qo3;
import ads_mobile_sdk.rn1;
import android.graphics.Rect;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class oa extends c3.b implements b0 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.b0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(qo3 qo3Var, Continuation continuation) {
        rn1 rn1Var;
        oa oaVar;
        if (continuation instanceof rn1) {
            rn1Var = (rn1) continuation;
            int i5 = rn1Var.f9259d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                rn1Var.f9259d = i5 - Integer.MIN_VALUE;
            } else {
                rn1Var = new rn1(this, (ContinuationImpl) continuation);
            }
        }
        Object objValueOf = rn1Var.f9257b;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = rn1Var.f9259d;
        if (i11 == 0) {
            ResultKt.b(objValueOf);
            rn1Var.f9256a = this;
            rn1Var.f9259d = 1;
            Rect rect = qo3Var.f8765d;
            Rect rect2 = qo3Var.f8770i;
            Rect rect3 = qo3Var.f8768g;
            int iWidth = rect.width();
            int iHeight = qo3Var.f8765d.height();
            objValueOf = Boolean.valueOf((qo3Var.f8769h && rect3.height() == iHeight && rect3.width() == iWidth) && (qo3Var.f8771j && rect2.height() == iHeight && rect2.width() == iWidth));
            if (objValueOf == obj) {
                return obj;
            }
            oaVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            oaVar = rn1Var.f9256a;
            ResultKt.b(objValueOf);
        }
        if (((Boolean) objValueOf).booleanValue()) {
            for (Map.Entry entry : ((Map) oaVar.f19223b).entrySet()) {
                String str = (String) entry.getKey();
                Object value = entry.getValue();
                t70.j0 j0Var = (t70.j0) oaVar.f19222a;
                r10.r rVar = new r10.r(str, value, null, 3);
                EmptyCoroutineContext context = EmptyCoroutineContext.f71803a;
                Intrinsics.g(j0Var, "<this>");
                Intrinsics.g(context, "context");
                t70.m0.t(j0Var, context, null, new ar.a(rVar, null), 2);
            }
        }
        return Unit.f71706a;
    }
}
