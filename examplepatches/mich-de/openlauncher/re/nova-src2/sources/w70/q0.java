package w70;

import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlinx.coroutines.flow.internal.AbortFlowException;

/* loaded from: classes.dex */
public abstract /* synthetic */ class q0 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final void a(n nVar, Object obj, Object obj2, ContinuationImpl continuationImpl) {
        k0 k0Var;
        if (continuationImpl instanceof k0) {
            k0Var = (k0) continuationImpl;
            int i5 = k0Var.f93949v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k0Var.f93949v = i5 - Integer.MIN_VALUE;
            } else {
                k0Var = new k0(continuationImpl);
            }
        }
        Object obj3 = k0Var.f93948u;
        Object obj4 = CoroutineSingletons.f71806a;
        int i11 = k0Var.f93949v;
        if (i11 == 0) {
            ResultKt.b(obj3);
            k0Var.f93947t = obj2;
            k0Var.f93949v = 1;
            if (nVar.emit(obj, k0Var) == obj4) {
                return;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            obj2 = k0Var.f93947t;
            ResultKt.b(obj3);
        }
        throw new AbortFlowException(obj2);
    }
}
