package kw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q0 extends n2 {

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierSpec f72566b;

    /* renamed from: c, reason: collision with root package name */
    public final String f72567c;

    /* renamed from: d, reason: collision with root package name */
    public final y2 f72568d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f72569e;

    public q0(IdentifierSpec identifier, String str, int i5) {
        if ((i5 & 1) != 0) {
            IdentifierSpec.Companion.getClass();
            identifier = IdentifierSpec.f45372m;
        }
        t2 t2Var = new t2(new p0(false, 3), str, null, 4);
        Intrinsics.g(identifier, "identifier");
        super(identifier);
        this.f72566b = identifier;
        this.f72567c = str;
        this.f72568d = t2Var;
        this.f72569e = true;
    }

    @Override // kw.n2, kw.k2
    public final IdentifierSpec b() {
        return this.f72566b;
    }

    @Override // kw.k2
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.k2
    public final boolean d() {
        return this.f72569e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0)) {
            return false;
        }
        q0 q0Var = (q0) obj;
        return Intrinsics.b(this.f72566b, q0Var.f72566b) && Intrinsics.b(this.f72567c, q0Var.f72567c) && Intrinsics.b(this.f72568d, q0Var.f72568d);
    }

    public final int hashCode() {
        int iHashCode = this.f72566b.hashCode() * 31;
        String str = this.f72567c;
        return this.f72568d.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    @Override // kw.n2
    public final b1 k() {
        return this.f72568d;
    }

    public final String toString() {
        return "EmailElement(identifier=" + this.f72566b + ", initialValue=" + this.f72567c + ", controller=" + this.f72568d + ")";
    }
}
