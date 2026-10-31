package b;

import ads_mobile_sdk.gn3;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.text.MatcherMatchResult$groupValues$1;
import kotlin.text.Regex;

/* loaded from: classes2.dex */
public interface y3 {
    static {
        Regex regex = e3.f15812a;
    }

    default Object a() {
        return null;
    }

    Object a(ContinuationImpl continuationImpl);

    Object b(ContinuationImpl continuationImpl);

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    static Object a(y3 y3Var, ContinuationImpl continuationImpl) {
        gn3 gn3Var;
        kotlin.text.b bVarB;
        if (continuationImpl instanceof gn3) {
            gn3Var = (gn3) continuationImpl;
            int i5 = gn3Var.f4012c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gn3Var.f4012c = i5 - Integer.MIN_VALUE;
            } else {
                gn3Var = new gn3(y3Var, continuationImpl);
            }
        }
        Object objA = gn3Var.f4010a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gn3Var.f4012c;
        if (i11 == 0) {
            ResultKt.b(objA);
            gn3Var.f4012c = 1;
            objA = y3Var.a();
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        String str = (String) objA;
        if (str == null || (bVarB = e3.f15812a.b(str)) == null) {
            return null;
        }
        return (String) ((MatcherMatchResult$groupValues$1) bVarB.a()).get(1);
    }
}
