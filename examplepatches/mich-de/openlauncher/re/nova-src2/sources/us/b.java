package us;

import b.c9;
import b.u4;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.PaymentMethodCreateParams;
import java.util.Iterator;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kw.x0;
import ps.q0;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final yu.a f91516a;

    /* renamed from: b, reason: collision with root package name */
    public final List f91517b;

    /* renamed from: c, reason: collision with root package name */
    public final q0 f91518c;

    /* renamed from: d, reason: collision with root package name */
    public final ResolvableString f91519d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f91520e;

    /* renamed from: f, reason: collision with root package name */
    public final PaymentMethodCreateParams f91521f;

    /* renamed from: g, reason: collision with root package name */
    public final ResolvableString f91522g;

    /* renamed from: h, reason: collision with root package name */
    public final List f91523h;

    public b(yu.a aVar, List formElements, q0 q0Var, ResolvableString resolvableString, boolean z11, PaymentMethodCreateParams paymentMethodCreateParams, ResolvableString resolvableString2) {
        Intrinsics.g(formElements, "formElements");
        this.f91516a = aVar;
        this.f91517b = formElements;
        this.f91518c = q0Var;
        this.f91519d = resolvableString;
        this.f91520e = z11;
        this.f91521f = paymentMethodCreateParams;
        this.f91522g = resolvableString2;
        List list = formElements;
        Iterator it = list.iterator();
        while (it.hasNext()) {
            ((x0) it.next()).a(this.f91520e);
        }
        this.f91523h = list;
    }

    public static b a(b bVar, q0 q0Var, boolean z11, PaymentMethodCreateParams paymentMethodCreateParams, ResolvableString resolvableString, int i5) {
        yu.a aVar = bVar.f91516a;
        List formElements = bVar.f91517b;
        if ((i5 & 4) != 0) {
            q0Var = bVar.f91518c;
        }
        q0 q0Var2 = q0Var;
        ResolvableString resolvableString2 = bVar.f91519d;
        if ((i5 & 16) != 0) {
            z11 = bVar.f91520e;
        }
        boolean z12 = z11;
        if ((i5 & 32) != 0) {
            paymentMethodCreateParams = bVar.f91521f;
        }
        PaymentMethodCreateParams paymentMethodCreateParams2 = paymentMethodCreateParams;
        if ((i5 & 64) != 0) {
            resolvableString = bVar.f91522g;
        }
        bVar.getClass();
        Intrinsics.g(formElements, "formElements");
        return new b(aVar, formElements, q0Var2, resolvableString2, z12, paymentMethodCreateParams2, resolvableString);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f91516a, bVar.f91516a) && Intrinsics.b(this.f91517b, bVar.f91517b) && this.f91518c == bVar.f91518c && Intrinsics.b(this.f91519d, bVar.f91519d) && this.f91520e == bVar.f91520e && Intrinsics.b(this.f91521f, bVar.f91521f) && Intrinsics.b(this.f91522g, bVar.f91522g);
    }

    public final int hashCode() {
        int iF = c9.f((this.f91519d.hashCode() + ((this.f91518c.hashCode() + u4.c(this.f91516a.hashCode() * 31, 31, this.f91517b)) * 31)) * 31, 31, this.f91520e);
        PaymentMethodCreateParams paymentMethodCreateParams = this.f91521f;
        int iHashCode = (iF + (paymentMethodCreateParams == null ? 0 : paymentMethodCreateParams.hashCode())) * 31;
        ResolvableString resolvableString = this.f91522g;
        return iHashCode + (resolvableString != null ? resolvableString.hashCode() : 0);
    }

    public final String toString() {
        return "PaymentMethodState(formArguments=" + this.f91516a + ", formElements=" + this.f91517b + ", primaryButtonState=" + this.f91518c + ", primaryButtonLabel=" + this.f91519d + ", isValidating=" + this.f91520e + ", paymentMethodCreateParams=" + this.f91521f + ", errorMessage=" + this.f91522g + ")";
    }
}
