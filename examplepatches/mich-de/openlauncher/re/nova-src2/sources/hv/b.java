package hv;

import b.c9;
import com.stripe.android.paymentsheet.model.PaymentMethodIncentive;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f60131a;

    /* renamed from: b, reason: collision with root package name */
    public final List f60132b;

    /* renamed from: c, reason: collision with root package name */
    public final yu.a f60133c;

    /* renamed from: d, reason: collision with root package name */
    public final List f60134d;

    /* renamed from: e, reason: collision with root package name */
    public final PaymentSelection f60135e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f60136f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f60137g;

    /* renamed from: h, reason: collision with root package name */
    public final PaymentMethodIncentive f60138h;

    /* renamed from: i, reason: collision with root package name */
    public final zu.m f60139i;

    /* renamed from: j, reason: collision with root package name */
    public final List f60140j;

    public b(String selectedPaymentMethodCode, List list, yu.a arguments, List formElements, PaymentSelection paymentSelection, boolean z11, boolean z12, PaymentMethodIncentive paymentMethodIncentive, zu.m usBankAccountFormArguments) {
        Intrinsics.g(selectedPaymentMethodCode, "selectedPaymentMethodCode");
        Intrinsics.g(arguments, "arguments");
        Intrinsics.g(formElements, "formElements");
        Intrinsics.g(usBankAccountFormArguments, "usBankAccountFormArguments");
        this.f60131a = selectedPaymentMethodCode;
        this.f60132b = list;
        this.f60133c = arguments;
        this.f60134d = formElements;
        this.f60135e = paymentSelection;
        this.f60136f = z11;
        this.f60137g = z12;
        this.f60138h = paymentMethodIncentive;
        this.f60139i = usBankAccountFormArguments;
        List list2 = formElements;
        Iterator it = list2.iterator();
        while (it.hasNext()) {
            ((kw.x0) it.next()).a(this.f60137g);
        }
        this.f60140j = list2;
    }

    public static b a(b bVar, String str, yu.a aVar, List list, PaymentSelection paymentSelection, boolean z11, zu.m mVar, int i5) {
        if ((i5 & 1) != 0) {
            str = bVar.f60131a;
        }
        String selectedPaymentMethodCode = str;
        List list2 = bVar.f60132b;
        if ((i5 & 4) != 0) {
            aVar = bVar.f60133c;
        }
        yu.a arguments = aVar;
        List formElements = (i5 & 8) != 0 ? bVar.f60134d : list;
        PaymentSelection paymentSelection2 = (i5 & 16) != 0 ? bVar.f60135e : paymentSelection;
        boolean z12 = (i5 & 32) != 0 ? bVar.f60136f : z11;
        boolean z13 = (i5 & 64) != 0 ? bVar.f60137g : true;
        PaymentMethodIncentive paymentMethodIncentive = bVar.f60138h;
        zu.m usBankAccountFormArguments = (i5 & 256) != 0 ? bVar.f60139i : mVar;
        bVar.getClass();
        Intrinsics.g(selectedPaymentMethodCode, "selectedPaymentMethodCode");
        Intrinsics.g(arguments, "arguments");
        Intrinsics.g(formElements, "formElements");
        Intrinsics.g(usBankAccountFormArguments, "usBankAccountFormArguments");
        return new b(selectedPaymentMethodCode, list2, arguments, formElements, paymentSelection2, z12, z13, paymentMethodIncentive, usBankAccountFormArguments);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f60131a, bVar.f60131a) && Intrinsics.b(this.f60132b, bVar.f60132b) && Intrinsics.b(this.f60133c, bVar.f60133c) && Intrinsics.b(this.f60134d, bVar.f60134d) && Intrinsics.b(this.f60135e, bVar.f60135e) && this.f60136f == bVar.f60136f && this.f60137g == bVar.f60137g && Intrinsics.b(this.f60138h, bVar.f60138h) && Intrinsics.b(this.f60139i, bVar.f60139i);
    }

    public final int hashCode() {
        int iC = b.u4.c((this.f60133c.hashCode() + b.u4.c(this.f60131a.hashCode() * 31, 31, this.f60132b)) * 31, 31, this.f60134d);
        PaymentSelection paymentSelection = this.f60135e;
        int iF = c9.f(c9.f((iC + (paymentSelection == null ? 0 : paymentSelection.hashCode())) * 31, 31, this.f60136f), 31, this.f60137g);
        PaymentMethodIncentive paymentMethodIncentive = this.f60138h;
        return this.f60139i.hashCode() + ((iF + (paymentMethodIncentive != null ? paymentMethodIncentive.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "State(selectedPaymentMethodCode=" + this.f60131a + ", supportedPaymentMethods=" + this.f60132b + ", arguments=" + this.f60133c + ", formElements=" + this.f60134d + ", paymentSelection=" + this.f60135e + ", processing=" + this.f60136f + ", validating=" + this.f60137g + ", incentive=" + this.f60138h + ", usBankAccountFormArguments=" + this.f60139i + ")";
    }
}
