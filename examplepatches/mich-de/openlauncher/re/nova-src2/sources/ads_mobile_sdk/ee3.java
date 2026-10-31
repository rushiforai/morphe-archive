package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class ee3 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final q22 f2854a;

    public ee3(q22 networkConnectivityManager) {
        Intrinsics.g(networkConnectivityManager, "networkConnectivityManager");
        this.f2854a = networkConnectivityManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.TELEPHONY;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        de3 de3Var;
        if (continuation instanceof de3) {
            de3Var = (de3) continuation;
            int i5 = de3Var.f2488c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                de3Var.f2488c = i5 - Integer.MIN_VALUE;
            } else {
                de3Var = new de3(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = de3Var.f2486a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = de3Var.f2488c;
        if (i11 == 0) {
            ResultKt.b(objA);
            de3Var.f2488c = 1;
            objA = this.f2854a.a(de3Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        return new xu0(objA);
    }
}
