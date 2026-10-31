package vt;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final q.c f93133a;

    public u(q.c cVar, xq.c logger) {
        Intrinsics.g(logger, "logger");
        this.f93133a = cVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(SetupIntent setupIntent, PaymentMethod paymentMethod, ContinuationImpl continuationImpl) {
        t tVar;
        u uVar;
        if (continuationImpl instanceof t) {
            tVar = (t) continuationImpl;
            int i5 = tVar.f93126y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                tVar.f93126y = i5 - Integer.MIN_VALUE;
            } else {
                tVar = new t(this, continuationImpl);
            }
        }
        Object objH = tVar.f93124w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = tVar.f93126y;
        if (i11 == 0) {
            ResultKt.b(objH);
            tVar.f93121t = this;
            tVar.f93122u = setupIntent;
            tVar.f93123v = paymentMethod;
            tVar.f93126y = 1;
            objH = this.f93133a.h(tVar);
            if (objH == coroutineSingletons) {
                return;
            } else {
                uVar = this;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objH);
                if (objH != null) {
                    throw new ClassCastException();
                }
                throw new NoWhenBranchMatchedException();
            }
            paymentMethod = tVar.f93123v;
            setupIntent = tVar.f93122u;
            uVar = tVar.f93121t;
            ResultKt.b(objH);
        }
        if (objH != null) {
            throw new ClassCastException();
        }
        String str = paymentMethod.f43569a;
        tVar.f93121t = uVar;
        tVar.f93122u = setupIntent;
        tVar.f93123v = paymentMethod;
        tVar.f93126y = 2;
        throw null;
    }
}
