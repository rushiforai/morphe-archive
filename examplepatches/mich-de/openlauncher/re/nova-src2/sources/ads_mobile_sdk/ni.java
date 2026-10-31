package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ni implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final fz f7574a;

    public ni(fz consentManager) {
        Intrinsics.g(consentManager, "consentManager");
        this.f7574a = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.APP_SET_ID;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        mi miVar;
        uq uqVar;
        if (continuation instanceof mi) {
            miVar = (mi) continuation;
            int i5 = miVar.f7223c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                miVar.f7223c = i5 - Integer.MIN_VALUE;
            } else {
                miVar = new mi(this, (ContinuationImpl) continuation);
            }
        }
        Object objY = miVar.f7221a;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = miVar.f7223c;
        if (i11 == 0) {
            ResultKt.b(objY);
            miVar.f7223c = 1;
            objY = this.f7574a.y(miVar);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        b.a1 a1Var = (b.a1) objY;
        if (a1Var == null) {
            uqVar = null;
        } else {
            if (a1Var instanceof pu0) {
                return (pu0) a1Var;
            }
            uqVar = (uq) ((xu0) a1Var).f11834b;
        }
        return new xu0(new li(uqVar != null ? uqVar.f10452a : null));
    }
}
