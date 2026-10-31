package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class oe implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final fz f7842a;

    public oe(fz consentManager) {
        Intrinsics.g(consentManager, "consentManager");
        this.f7842a = consentManager;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.AMAZON_FIRE_AD_ID;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        ne neVar;
        oe oeVar;
        String str;
        if (continuation instanceof ne) {
            neVar = (ne) continuation;
            int i5 = neVar.f7539d;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                neVar.f7539d = i5 - Integer.MIN_VALUE;
            } else {
                neVar = new ne(this, (ContinuationImpl) continuation);
            }
        }
        Object objX = neVar.f7537b;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = neVar.f7539d;
        if (i11 == 0) {
            ResultKt.b(objX);
            neVar.f7536a = this;
            neVar.f7539d = 1;
            objX = this.f7842a.x(neVar);
            if (objX != coroutineSingletons) {
                oeVar = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            str = (String) neVar.f7536a;
            ResultKt.b(objX);
            return new xu0(new me(str, (Boolean) objX));
        }
        oeVar = (oe) neVar.f7536a;
        ResultKt.b(objX);
        String str2 = (String) objX;
        fz fzVar = oeVar.f7842a;
        neVar.f7536a = str2;
        neVar.f7539d = 2;
        Object objF = fzVar.F(neVar);
        if (objF != coroutineSingletons) {
            str = str2;
            objX = objF;
            return new xu0(new me(str, (Boolean) objX));
        }
        return coroutineSingletons;
    }
}
