package ads_mobile_sdk;

import e10.q2;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ts1 implements b.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ b.b f10055a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b.zb f10056b;

    public ts1(b.b bVar, b.zb zbVar) {
        this.f10055a = bVar;
        this.f10056b = zbVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(String str, int i5, ContinuationImpl continuationImpl) {
        ss1 ss1Var;
        ts1 ts1Var;
        if (continuationImpl instanceof ss1) {
            ss1Var = (ss1) continuationImpl;
            int i11 = ss1Var.f9654d;
            if ((i11 & Integer.MIN_VALUE) != 0) {
                ss1Var.f9654d = i11 - Integer.MIN_VALUE;
            } else {
                ss1Var = new ss1(this, continuationImpl);
            }
        }
        Object objA = ss1Var.f9652b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i12 = ss1Var.f9654d;
        if (i12 == 0) {
            ResultKt.b(objA);
            ss1Var.f9651a = this;
            ss1Var.f9654d = 1;
            objA = this.f10055a.a(str, i5, ss1Var);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            ts1Var = this;
        } else {
            if (i12 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ts1Var = ss1Var.f9651a;
            ResultKt.b(objA);
        }
        b.a1 a1Var = (b.a1) objA;
        if (a1Var instanceof pu0) {
            return (pu0) a1Var;
        }
        Intrinsics.e(a1Var, "null cannot be cast to non-null type com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Success<T of com.google.android.libraries.ads.mobile.sdk.internal.util.GmaResult.Companion.returnIfError>");
        return new xu0(new q2(2, (w70.m) ((xu0) a1Var).f11834b, ts1Var.f10056b));
    }

    @Override // b.b
    public final boolean b() {
        return this.f10055a.b();
    }
}
