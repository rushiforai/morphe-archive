package cw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w2 extends kw.n2 {

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierSpec f48362b;

    /* renamed from: c, reason: collision with root package name */
    public final kw.t2 f48363c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f48364d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w2(IdentifierSpec identifier, kw.t2 t2Var) {
        super(identifier);
        Intrinsics.g(identifier, "identifier");
        this.f48362b = identifier;
        this.f48363c = t2Var;
        this.f48364d = true;
    }

    @Override // kw.n2, kw.k2
    public final IdentifierSpec b() {
        return this.f48362b;
    }

    @Override // kw.k2
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.k2
    public final boolean d() {
        return this.f48364d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w2)) {
            return false;
        }
        w2 w2Var = (w2) obj;
        return Intrinsics.b(this.f48362b, w2Var.f48362b) && Intrinsics.b(this.f48363c, w2Var.f48363c);
    }

    public final int hashCode() {
        return this.f48363c.hashCode() + (this.f48362b.hashCode() * 31);
    }

    @Override // kw.n2
    public final kw.b1 k() {
        return this.f48363c;
    }

    public final String toString() {
        return "IbanElement(identifier=" + this.f48362b + ", controller=" + this.f48363c + ")";
    }
}
