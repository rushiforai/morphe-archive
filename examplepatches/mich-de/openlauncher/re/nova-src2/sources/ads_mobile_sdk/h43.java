package ads_mobile_sdk;

import android.os.Bundle;
import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h43 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final fz f4211a;

    public h43(fz consentManager) {
        Intrinsics.g(consentManager, "consentManager");
        this.f4211a = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.CONSENT_STRINGS;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        g43 g43Var;
        if (continuation instanceof g43) {
            g43Var = (g43) continuation;
            int i5 = g43Var.f3641c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g43Var.f3641c = i5 - Integer.MIN_VALUE;
            } else {
                g43Var = new g43(this, (ContinuationImpl) continuation);
            }
        }
        Object objC = g43Var.f3639a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g43Var.f3641c;
        if (i11 == 0) {
            ResultKt.b(objC);
            g43Var.f3641c = 1;
            fz fzVar = this.f4211a;
            fzVar.getClass();
            objC = fz.c(fzVar, g43Var);
            if (objC == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objC);
        }
        return new xu0(new f43((Bundle) objC));
    }
}
