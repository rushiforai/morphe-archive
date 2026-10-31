package kw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g1 implements x0 {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierSpec f72379a;

    /* renamed from: b, reason: collision with root package name */
    public final d1 f72380b;

    public g1(IdentifierSpec identifierSpec, d1 d1Var) {
        this.f72379a = identifierSpec;
        this.f72380b = d1Var;
    }

    @Override // kw.x0
    public final void a(boolean z11) {
    }

    @Override // kw.x0
    public final IdentifierSpec b() {
        return this.f72379a;
    }

    @Override // kw.x0
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.x0
    public final boolean d() {
        return true;
    }

    @Override // kw.x0
    public final w70.g2 e() {
        return ps.v.u(this.f72380b.f72349c, new e1(this, 0));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g1)) {
            return false;
        }
        g1 g1Var = (g1) obj;
        return Intrinsics.b(this.f72379a, g1Var.f72379a) && Intrinsics.b(this.f72380b, g1Var.f72380b);
    }

    @Override // kw.x0
    public final w70.g2 f() {
        return ps.v.y(EmptyList.f71733a);
    }

    public final int hashCode() {
        return this.f72380b.hashCode() + (this.f72379a.hashCode() * 31);
    }

    public final String toString() {
        return "OTPElement(identifier=" + this.f72379a + ", controller=" + this.f72380b + ")";
    }
}
