package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ac2 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final fz f921a;

    public ac2(fz consentManager) {
        Intrinsics.g(consentManager, "consentManager");
        this.f921a = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.PER_APP_ID_V2;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        zb2 zb2Var;
        xb2 xb2Var;
        if (continuation instanceof zb2) {
            zb2Var = (zb2) continuation;
            int i5 = zb2Var.f12514c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zb2Var.f12514c = i5 - Integer.MIN_VALUE;
            } else {
                zb2Var = new zb2(this, (ContinuationImpl) continuation);
            }
        }
        Object objD = zb2Var.f12512a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zb2Var.f12514c;
        if (i11 == 0) {
            ResultKt.b(objD);
            zb2Var.f12514c = 1;
            objD = this.f921a.D(zb2Var);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objD);
        }
        b.a1 a1Var = (b.a1) objD;
        if (a1Var == null) {
            xb2Var = null;
        } else {
            if (a1Var instanceof pu0) {
                return (pu0) a1Var;
            }
            xb2Var = (xb2) ((xu0) a1Var).f11834b;
        }
        return new xu0(new yb2(xb2Var));
    }
}
