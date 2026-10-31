package jr;

import com.stripe.android.customersheet.CustomerSheet$Configuration;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import com.stripe.android.ui.core.cbc.CardBrandChoiceEligibility;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final List f69638a;

    /* renamed from: b, reason: collision with root package name */
    public final PaymentSelection f69639b;

    /* renamed from: c, reason: collision with root package name */
    public final a f69640c;

    /* renamed from: d, reason: collision with root package name */
    public final CustomerSheet$Configuration f69641d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f69642e;

    /* renamed from: f, reason: collision with root package name */
    public final CardBrandChoiceEligibility f69643f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f69644g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f69645h;

    public b0(List paymentMethods, PaymentSelection paymentSelection, a aVar, CustomerSheet$Configuration configuration) {
        PaymentMethod.Card.Networks networks;
        Set set;
        Intrinsics.g(paymentMethods, "paymentMethods");
        Intrinsics.g(configuration, "configuration");
        this.f69638a = paymentMethods;
        this.f69639b = paymentSelection;
        this.f69640c = aVar;
        this.f69641d = configuration;
        int size = paymentMethods.size();
        if (size != 0 && size != 1) {
            tq.a aVar2 = tq.a.f89560b;
        }
        boolean z11 = false;
        this.f69642e = false;
        this.f69643f = CardBrandChoiceEligibility.Ineligible.f45280a;
        List list = paymentMethods;
        if (!(list instanceof Collection) || !list.isEmpty()) {
            Iterator it = list.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                PaymentMethod paymentMethod = (PaymentMethod) it.next();
                CardBrandChoiceEligibility cbcEligibility = this.f69643f;
                Intrinsics.g(paymentMethod, "paymentMethod");
                PaymentMethod.Card card = paymentMethod.f43576h;
                Intrinsics.g(cbcEligibility, "cbcEligibility");
                boolean z12 = (card == null || (networks = card.f43616k) == null || (set = networks.f43621a) == null || set.size() <= 1) ? false : true;
                if ((cbcEligibility instanceof CardBrandChoiceEligibility.Eligible) && z12) {
                    z11 = true;
                    break;
                }
            }
        }
        this.f69644g = z11;
        this.f69645h = !this.f69638a.isEmpty();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b0)) {
            return false;
        }
        b0 b0Var = (b0) obj;
        return Intrinsics.b(this.f69638a, b0Var.f69638a) && Intrinsics.b(this.f69639b, b0Var.f69639b) && this.f69640c.equals(b0Var.f69640c) && Intrinsics.b(this.f69641d, b0Var.f69641d);
    }

    public final int hashCode() {
        int iHashCode = this.f69638a.hashCode() * 31;
        PaymentSelection paymentSelection = this.f69639b;
        return this.f69641d.hashCode() + ((this.f69640c.hashCode() + ((iHashCode + (paymentSelection == null ? 0 : paymentSelection.hashCode())) * 961)) * 31);
    }

    public final String toString() {
        return "CustomerState(paymentMethods=" + this.f69638a + ", currentSelection=" + this.f69639b + ", metadata=null, permissions=" + this.f69640c + ", configuration=" + this.f69641d + ")";
    }
}
