package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import w70.u1;

/* loaded from: classes2.dex */
public final class wy2 {

    /* renamed from: a, reason: collision with root package name */
    public final ab0 f11519a;

    public wy2(ab0 ab0Var) {
        this.f11519a = ab0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ni.k kVar, qw2 qw2Var, mi3 mi3Var, boolean z11, ts2 ts2Var, b71 b71Var, i8 i8Var, ContinuationImpl continuationImpl) {
        vy2 vy2Var;
        if (continuationImpl instanceof vy2) {
            vy2Var = (vy2) continuationImpl;
            int i5 = vy2Var.f10973c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vy2Var.f10973c = i5 - Integer.MIN_VALUE;
            } else {
                vy2Var = new vy2(this, continuationImpl);
            }
        }
        Object objA = vy2Var.f10971a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vy2Var.f10973c;
        if (i11 == 0) {
            ResultKt.b(objA);
            gc0 gc0Var = (gc0) this.f11519a.get();
            kVar.getClass();
            gc0Var.f3759c = kVar;
            qw2Var.getClass();
            gc0Var.f3758b = qw2Var;
            ur2 ur2Var = mi3Var.f7224a;
            ur2Var.getClass();
            gc0Var.f3760d = ur2Var;
            fh1 fh1Var = mi3Var.f7225b;
            fh1Var.getClass();
            gc0Var.f3761e = fh1Var;
            gc0Var.f3763g = Boolean.valueOf(z11);
            ts2Var.getClass();
            gc0Var.f3764h = ts2Var;
            gc0Var.f3765i = Boolean.TRUE;
            b71Var.getClass();
            gc0Var.f3762f = b71Var;
            i8Var.getClass();
            gc0Var.f3767k = i8Var;
            gc0Var.f3766j = Boolean.FALSE;
            b.g1 g1Var = (b.g1) gc0Var.a().A0.get();
            vy2Var.f10973c = 1;
            objA = ((jc1) g1Var).a(vy2Var);
            if (objA != coroutineSingletons) {
            }
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
            return objA;
        }
        ResultKt.b(objA);
        vy2Var.f10973c = 2;
        Object objO = u1.o((w70.m) objA, vy2Var);
        return objO == coroutineSingletons ? coroutineSingletons : objO;
    }
}
