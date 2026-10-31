package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class l70 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final fz f6103a;

    public l70(fz consentManager) {
        Intrinsics.g(consentManager, "consentManager");
        this.f6103a = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.CSRB_ECO_DATA;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        k70 k70Var;
        if (continuation instanceof k70) {
            k70Var = (k70) continuation;
            int i5 = k70Var.f5537c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                k70Var.f5537c = i5 - Integer.MIN_VALUE;
            } else {
                k70Var = new k70(this, (ContinuationImpl) continuation);
            }
        }
        Object objB = k70Var.f5535a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = k70Var.f5537c;
        if (i11 == 0) {
            ResultKt.b(objB);
            k70Var.f5537c = 1;
            fz fzVar = this.f6103a;
            fzVar.getClass();
            objB = fz.b(fzVar, k70Var);
            if (objB == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objB);
        }
        return new xu0(new j70((com.google.gson.r) objB));
    }
}
