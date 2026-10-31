package vt;

import com.stripe.android.model.ClientAttributionMetadata;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final q.c f93145a;

    public w(q.c cVar, r0 intentFirstConfirmationInterceptorFactory, xq.c logger, ClientAttributionMetadata clientAttributionMetadata) {
        Intrinsics.g(intentFirstConfirmationInterceptorFactory, "intentFirstConfirmationInterceptorFactory");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(clientAttributionMetadata, "clientAttributionMetadata");
        this.f93145a = cVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(SetupIntent setupIntent, PaymentMethod paymentMethod, ContinuationImpl continuationImpl) {
        v vVar;
        w wVar;
        if (continuationImpl instanceof v) {
            vVar = (v) continuationImpl;
            int i5 = vVar.f93143y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                vVar.f93143y = i5 - Integer.MIN_VALUE;
            } else {
                vVar = new v(this, continuationImpl);
            }
        }
        Object objH = vVar.f93141w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = vVar.f93143y;
        if (i11 == 0) {
            ResultKt.b(objH);
            vVar.f93138t = this;
            vVar.f93139u = setupIntent;
            vVar.f93140v = paymentMethod;
            vVar.f93143y = 1;
            objH = this.f93145a.h(vVar);
            if (objH == coroutineSingletons) {
                return coroutineSingletons;
            }
            wVar = this;
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(objH);
                    return (mt.d) objH;
                }
                ResultKt.b(objH);
                if (objH == null) {
                    throw new NoWhenBranchMatchedException();
                }
                throw new ClassCastException();
            }
            paymentMethod = vVar.f93140v;
            setupIntent = vVar.f93139u;
            wVar = vVar.f93138t;
            ResultKt.b(objH);
        }
        if (objH != null) {
            throw new ClassCastException();
        }
        vVar.f93138t = wVar;
        vVar.f93139u = setupIntent;
        vVar.f93140v = paymentMethod;
        vVar.f93143y = 2;
        throw null;
    }
}
