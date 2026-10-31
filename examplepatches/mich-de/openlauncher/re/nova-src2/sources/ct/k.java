package ct;

import com.stripe.android.lpmfoundations.paymentmethod.PaymentMethodMetadata;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class k {
    public static final boolean a(j jVar, PaymentMethodMetadata paymentMethodMetadata) {
        Intrinsics.g(jVar, "<this>");
        Set setA = jVar.a(paymentMethodMetadata.m(jVar.getType().f43655a));
        if ((setA instanceof Collection) && setA.isEmpty()) {
            return true;
        }
        Iterator it = setA.iterator();
        while (it.hasNext()) {
            if (!((i) it.next()).a(paymentMethodMetadata, jVar.getType().f43655a)) {
                return false;
            }
        }
        return true;
    }
}
