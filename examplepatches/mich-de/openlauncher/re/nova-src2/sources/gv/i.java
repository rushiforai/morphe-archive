package gv;

import com.stripe.android.model.ElementsSession;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements k {

    /* renamed from: a, reason: collision with root package name */
    public final ElementsSession.Customer f57870a;

    /* renamed from: b, reason: collision with root package name */
    public final String f57871b;

    /* renamed from: c, reason: collision with root package name */
    public final String f57872c;

    /* renamed from: d, reason: collision with root package name */
    public final String f57873d;

    public i(ElementsSession.Customer elementsSessionCustomer, String customerSessionClientSecret) {
        Intrinsics.g(elementsSessionCustomer, "elementsSessionCustomer");
        Intrinsics.g(customerSessionClientSecret, "customerSessionClientSecret");
        this.f57870a = elementsSessionCustomer;
        this.f57871b = customerSessionClientSecret;
        ElementsSession.Customer.Session session = elementsSessionCustomer.f43412c;
        this.f57872c = session.f43429e;
        this.f57873d = session.f43427c;
    }

    @Override // gv.k
    public final String a() {
        return this.f57873d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return Intrinsics.b(this.f57870a, iVar.f57870a) && Intrinsics.b(this.f57871b, iVar.f57871b);
    }

    @Override // gv.k
    public final String getId() {
        return this.f57872c;
    }

    public final int hashCode() {
        return this.f57871b.hashCode() + (this.f57870a.hashCode() * 31);
    }

    public final String toString() {
        return "CustomerSession(elementsSessionCustomer=" + this.f57870a + ", customerSessionClientSecret=" + this.f57871b + ")";
    }
}
