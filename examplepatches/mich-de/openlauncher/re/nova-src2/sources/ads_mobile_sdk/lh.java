package ads_mobile_sdk;

import b.j4;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import w70.u1;

/* loaded from: classes2.dex */
public final class lh implements b.v4 {

    /* renamed from: a, reason: collision with root package name */
    public final ab0 f6236a;

    public lh(ab0 componentProvider) {
        Intrinsics.g(componentProvider, "componentProvider");
        this.f6236a = componentProvider;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(ni.k kVar, qw2 qw2Var, mi3 mi3Var, boolean z11, ts2 ts2Var, b71 b71Var, i8 i8Var, ContinuationImpl continuationImpl) {
        kh khVar;
        if (continuationImpl instanceof kh) {
            khVar = (kh) continuationImpl;
            int i5 = khVar.f5736c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                khVar.f5736c = i5 - Integer.MIN_VALUE;
            } else {
                khVar = new kh(this, continuationImpl);
            }
        }
        Object objA = khVar.f5734a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = khVar.f5736c;
        if (i11 == 0) {
            ResultKt.b(objA);
            mb0 mb0Var = (mb0) ((j4) this.f6236a.get());
            kVar.getClass();
            mb0Var.f7077c = kVar;
            qw2Var.getClass();
            mb0Var.f7076b = qw2Var;
            ur2 ur2Var = mi3Var.f7224a;
            ur2Var.getClass();
            mb0Var.f7078d = ur2Var;
            fh1 fh1Var = mi3Var.f7225b;
            fh1Var.getClass();
            mb0Var.f7079e = fh1Var;
            mb0Var.f7081g = Boolean.valueOf(z11);
            ts2Var.getClass();
            mb0Var.f7082h = ts2Var;
            mb0Var.f7083i = Boolean.TRUE;
            b71Var.getClass();
            mb0Var.f7080f = b71Var;
            i8Var.getClass();
            mb0Var.f7085k = i8Var;
            mb0Var.f7084j = Boolean.FALSE;
            b.g1 g1Var = (b.g1) mb0Var.a().f7512z0.get();
            khVar.f5736c = 1;
            objA = ((jc1) g1Var).a(khVar);
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
        khVar.f5736c = 2;
        Object objO = u1.o((w70.m) objA, khVar);
        return objO == coroutineSingletons ? coroutineSingletons : objO;
    }
}
