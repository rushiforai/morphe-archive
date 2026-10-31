package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class o33 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final fz f7756a;

    public o33(fz consentManager) {
        Intrinsics.g(consentManager, "consentManager");
        this.f7756a = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.SESSION_ID;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        n33 n33Var;
        if (continuation instanceof n33) {
            n33Var = (n33) continuation;
            int i5 = n33Var.f7422c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                n33Var.f7422c = i5 - Integer.MIN_VALUE;
            } else {
                n33Var = new n33(this, (ContinuationImpl) continuation);
            }
        }
        Object objG = n33Var.f7420a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = n33Var.f7422c;
        if (i11 == 0) {
            ResultKt.b(objG);
            n33Var.f7422c = 1;
            fz fzVar = this.f7756a;
            fzVar.getClass();
            objG = fz.g(fzVar, n33Var);
            if (objG == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objG);
        }
        return new xu0(new m33((String) objG));
    }
}
