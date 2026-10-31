package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class vb2 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final fz f10722a;

    public vb2(fz consentManager) {
        Intrinsics.g(consentManager, "consentManager");
        this.f10722a = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.PER_APP_ID_V1;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        ub2 ub2Var;
        wy0 wy0Var;
        if (continuation instanceof ub2) {
            ub2Var = (ub2) continuation;
            int i5 = ub2Var.f10286c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                ub2Var.f10286c = i5 - Integer.MIN_VALUE;
            } else {
                ub2Var = new ub2(this, (ContinuationImpl) continuation);
            }
        }
        Object objC = ub2Var.f10284a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = ub2Var.f10286c;
        if (i11 == 0) {
            ResultKt.b(objC);
            ub2Var.f10286c = 1;
            objC = this.f10722a.C(ub2Var);
            if (objC == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objC);
        }
        b.a1 a1Var = (b.a1) objC;
        if (a1Var == null) {
            wy0Var = null;
        } else {
            if (a1Var instanceof pu0) {
                return (pu0) a1Var;
            }
            wy0Var = (wy0) ((xu0) a1Var).f11834b;
        }
        return new xu0(new tb2(wy0Var));
    }
}
