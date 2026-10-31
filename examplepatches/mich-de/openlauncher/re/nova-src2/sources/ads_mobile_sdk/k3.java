package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class k3 extends cc3 {

    /* renamed from: d, reason: collision with root package name */
    public final fz f5473d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k3(fz consentManager) {
        super(wv0.CUI_NAME_SDKINIT_INIT_AD_ID_PERMISSION, 2);
        Intrinsics.g(consentManager, "consentManager");
        this.f5473d = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.AD_ID_PERMISSION;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        j3 j3Var;
        if (continuation instanceof j3) {
            j3Var = (j3) continuation;
            int i5 = j3Var.f5104c;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                j3Var.f5104c = i5 - Integer.MIN_VALUE;
            } else {
                j3Var = new j3(this, (ContinuationImpl) continuation);
            }
        }
        Object objValueOf = j3Var.f5102a;
        Object obj = CoroutineSingletons.f71806a;
        int i11 = j3Var.f5104c;
        if (i11 == 0) {
            ResultKt.b(objValueOf);
            j3Var.f5104c = 1;
            fz fzVar = this.f5473d;
            fzVar.getClass();
            b.i8 i8Var = rw0.f9327f;
            objValueOf = Boolean.valueOf(b.i8.p(fzVar.f3566c, "com.google.android.gms.permission.AD_ID"));
            if (objValueOf == obj) {
                return obj;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objValueOf);
        }
        return new xu0(new i3(((Boolean) objValueOf).booleanValue()));
    }
}
