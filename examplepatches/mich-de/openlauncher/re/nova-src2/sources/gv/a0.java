package gv;

import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.lpmfoundations.paymentmethod.CustomerMetadata;
import com.stripe.android.model.Address;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import kotlin.ResultKt;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a0 implements h0 {
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Serializable a(List list, bn.i iVar, ContinuationImpl continuationImpl) {
        z zVar;
        boolean zH;
        String upperCase;
        boolean zContains;
        Address address;
        String str;
        if (continuationImpl instanceof z) {
            zVar = (z) continuationImpl;
            int i5 = zVar.f58001w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                zVar.f58001w = i5 - Integer.MIN_VALUE;
            } else {
                zVar = new z(this, continuationImpl);
            }
        }
        Object objA = zVar.f57999u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = zVar.f58001w;
        if (i11 == 0) {
            ResultKt.b(objA);
            t70.p0 p0Var = (t70.p0) iVar.f18214f;
            String str2 = (String) iVar.f18211c;
            CustomerMetadata customerMetadata = (CustomerMetadata) iVar.f18210b;
            boolean z11 = customerMetadata != null ? customerMetadata.f43074d : false;
            zVar.f57998t = iVar;
            zVar.f58001w = 1;
            objA = j0.a(list, p0Var, z11, str2, zVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            iVar = zVar.f57998t;
            ResultKt.b(objA);
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : (Iterable) objA) {
            PaymentMethod paymentMethod = (PaymentMethod) obj;
            PaymentMethod.Card card = paymentMethod.f43576h;
            if (card != null) {
                CardFundingFilter cardFundingFilter = (CardFundingFilter) iVar.f18213e;
                b6.e eVar = ft.c.f55910b;
                String str3 = card.f43612g;
                eVar.getClass();
                zH = cardFundingFilter.H(b6.e.i(str3));
            } else {
                zH = true;
            }
            if (((CardBrandFilter) iVar.f18212d).q0(paymentMethod) && zH) {
                PaymentSheet$BillingDetailsCollectionConfiguration billingDetailsCollectionConfiguration = (PaymentSheet$BillingDetailsCollectionConfiguration) iVar.f18209a;
                Intrinsics.g(billingDetailsCollectionConfiguration, "billingDetailsCollectionConfiguration");
                Set setB = billingDetailsCollectionConfiguration.b();
                if (setB.isEmpty()) {
                    zContains = true;
                } else {
                    PaymentMethod.BillingDetails billingDetails = paymentMethod.f43574f;
                    if (billingDetails == null || (address = billingDetails.f43602a) == null || (str = address.f43128b) == null) {
                        upperCase = null;
                    } else {
                        upperCase = str.toUpperCase(Locale.ROOT);
                        Intrinsics.f(upperCase, "toUpperCase(...)");
                    }
                    zContains = upperCase != null ? setB.contains(upperCase) : false;
                }
                if (zContains) {
                    arrayList.add(obj);
                }
            }
        }
        return arrayList;
    }
}
