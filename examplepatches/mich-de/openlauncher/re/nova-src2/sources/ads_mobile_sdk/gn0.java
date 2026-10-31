package ads_mobile_sdk;

import b.x2;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class gn0 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final fz f4006a;

    /* renamed from: b, reason: collision with root package name */
    public final um0 f4007b;

    public gn0(fz consentManager, um0 firebaseAnalyticsAdapter) {
        Intrinsics.g(consentManager, "consentManager");
        Intrinsics.g(firebaseAnalyticsAdapter, "firebaseAnalyticsAdapter");
        this.f4006a = consentManager;
        this.f4007b = firebaseAnalyticsAdapter;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.FIREBASE_ANALYTICS;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a7  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // b.x2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object d(Continuation continuation) {
        fn0 fn0Var;
        gn0 gn0Var;
        String str;
        Object objZ;
        String str2;
        gn0 gn0Var2;
        String str3;
        if (continuation instanceof fn0) {
            fn0Var = (fn0) continuation;
            int i5 = fn0Var.f3442f;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fn0Var.f3442f = i5 - Integer.MIN_VALUE;
            } else {
                fn0Var = new fn0(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = fn0Var.f3440d;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fn0Var.f3442f;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (this.f4007b.f10410e.getValue() == null) {
                return new xu0(new en0(null, null, null, null, false));
            }
            fn0Var.f3437a = this;
            fn0Var.f3442f = 1;
            objA = this.f4006a.A(fn0Var);
            if (objA != coroutineSingletons) {
                gn0Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                if (i11 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                String str4 = fn0Var.f3439c;
                str3 = fn0Var.f3438b;
                gn0Var2 = fn0Var.f3437a;
                ResultKt.b(objA);
                str2 = str4;
                return new xu0(new en0(str3, str2, (String) objA, gn0Var2.f4007b.f10410e.getValue() == null ? "fa" : null, true));
            }
            String str5 = fn0Var.f3438b;
            gn0 gn0Var3 = fn0Var.f3437a;
            ResultKt.b(objA);
            str = str5;
            gn0Var = gn0Var3;
            String str6 = (String) objA;
            fz fzVar = gn0Var.f4006a;
            fn0Var.f3437a = gn0Var;
            fn0Var.f3438b = str;
            fn0Var.f3439c = str6;
            fn0Var.f3442f = 3;
            objZ = fzVar.z(fn0Var);
            if (objZ != coroutineSingletons) {
                str2 = str6;
                objA = objZ;
                gn0Var2 = gn0Var;
                str3 = str;
                return new xu0(new en0(str3, str2, (String) objA, gn0Var2.f4007b.f10410e.getValue() == null ? "fa" : null, true));
            }
            return coroutineSingletons;
        }
        gn0Var = fn0Var.f3437a;
        ResultKt.b(objA);
        String str7 = (String) objA;
        fz fzVar2 = gn0Var.f4006a;
        fn0Var.f3437a = gn0Var;
        fn0Var.f3438b = str7;
        fn0Var.f3442f = 2;
        Object objB = fzVar2.B(fn0Var);
        if (objB != coroutineSingletons) {
            str = str7;
            objA = objB;
            String str62 = (String) objA;
            fz fzVar3 = gn0Var.f4006a;
            fn0Var.f3437a = gn0Var;
            fn0Var.f3438b = str;
            fn0Var.f3439c = str62;
            fn0Var.f3442f = 3;
            objZ = fzVar3.z(fn0Var);
            if (objZ != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }
}
