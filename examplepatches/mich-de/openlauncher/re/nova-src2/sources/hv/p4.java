package hv;

import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p4 {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f60499a;

    /* renamed from: b, reason: collision with root package name */
    public final q4 f60500b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f60501c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f60502d;

    public p4(ResolvableString resolvableString, q4 status, boolean z11, boolean z12) {
        Intrinsics.g(status, "status");
        this.f60499a = resolvableString;
        this.f60500b = status;
        this.f60501c = z11;
        this.f60502d = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p4)) {
            return false;
        }
        p4 p4Var = (p4) obj;
        return Intrinsics.b(this.f60499a, p4Var.f60499a) && this.f60500b == p4Var.f60500b && this.f60501c == p4Var.f60501c && this.f60502d == p4Var.f60502d;
    }

    public final int hashCode() {
        ResolvableString resolvableString = this.f60499a;
        return Boolean.hashCode(this.f60502d) + c9.f((this.f60500b.hashCode() + ((resolvableString == null ? 0 : resolvableString.hashCode()) * 31)) * 31, 31, this.f60501c);
    }

    public final String toString() {
        return "State(error=" + this.f60499a + ", status=" + this.f60500b + ", setAsDefaultCheckboxChecked=" + this.f60501c + ", isSaveButtonEnabled=" + this.f60502d + ")";
    }
}
