package qq;

import hv.g3;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import mx.e0;
import t70.p2;
import w70.i2;

/* loaded from: classes4.dex */
public abstract class c {
    public static final q.c a(i2 i2Var) {
        Intrinsics.g(i2Var, "<this>");
        return new q.c(i2Var, 5);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(q.c cVar, long j11, g3 g3Var, ContinuationImpl continuationImpl) {
        b bVar;
        if (continuationImpl instanceof b) {
            bVar = (b) continuationImpl;
            int i5 = bVar.f84316v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                bVar.f84316v = i5 - Integer.MIN_VALUE;
            } else {
                bVar = new b(continuationImpl);
            }
        }
        Object objE = bVar.f84315u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = bVar.f84316v;
        if (i11 == 0) {
            ResultKt.b(objE);
            e0 e0Var = new e0(cVar, (Continuation) null, 18);
            bVar.f84314t = g3Var;
            bVar.f84316v = 1;
            objE = p2.e(j11, e0Var, bVar);
            if (objE == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            g3Var = bVar.f84314t;
            ResultKt.b(objE);
        }
        if (objE != null) {
            int i12 = Result.f71687b;
            return objE;
        }
        int i13 = Result.f71687b;
        return ResultKt.a(new IllegalStateException((String) g3Var.invoke()));
    }
}
