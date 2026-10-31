package gv;

import com.stripe.android.common.model.CommonConfiguration;
import com.stripe.android.model.Customer;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetails;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public final fv.k f57844a;

    public c0(fv.k customerRepository) {
        Intrinsics.g(customerRepository, "customerRepository");
        this.f57844a = customerRepository;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(CommonConfiguration commonConfiguration, fv.j jVar, ContinuationImpl continuationImpl) {
        b0 b0Var;
        String str;
        if (continuationImpl instanceof b0) {
            b0Var = (b0) continuationImpl;
            int i5 = b0Var.f57839v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                b0Var.f57839v = i5 - Integer.MIN_VALUE;
            } else {
                b0Var = new b0(this, continuationImpl);
            }
        }
        Object objD = b0Var.f57837t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = b0Var.f57839v;
        if (i11 == 0) {
            ResultKt.b(objD);
            PaymentSheet$BillingDetails paymentSheet$BillingDetails = commonConfiguration.f42528e;
            if (paymentSheet$BillingDetails != null && (str = paymentSheet$BillingDetails.f44510b) != null) {
                return str;
            }
            if (jVar == null) {
                return null;
            }
            b0Var.f57839v = 1;
            objD = ((fv.i) this.f57844a).d(jVar, b0Var);
            if (objD == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objD);
        }
        Customer customer = (Customer) objD;
        if (customer != null) {
            return customer.f43366i;
        }
        return null;
    }
}
