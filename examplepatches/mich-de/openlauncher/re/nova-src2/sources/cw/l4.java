package cw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l4 extends kw.n2 {

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierSpec f48209b;

    /* renamed from: c, reason: collision with root package name */
    public final kw.i0 f48210c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f48211d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l4(IdentifierSpec identifier, kw.i0 i0Var) {
        super(identifier);
        Intrinsics.g(identifier, "identifier");
        this.f48209b = identifier;
        this.f48210c = i0Var;
        this.f48211d = true;
    }

    @Override // kw.n2, kw.k2
    public final IdentifierSpec b() {
        return this.f48209b;
    }

    @Override // kw.k2
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.k2
    public final boolean d() {
        return this.f48211d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l4)) {
            return false;
        }
        l4 l4Var = (l4) obj;
        return Intrinsics.b(this.f48209b, l4Var.f48209b) && Intrinsics.b(this.f48210c, l4Var.f48210c);
    }

    public final int hashCode() {
        return this.f48210c.hashCode() + (this.f48209b.hashCode() * 31);
    }

    @Override // kw.n2
    public final kw.b1 k() {
        return this.f48210c;
    }

    public final String toString() {
        return "SimpleDropdownElement(identifier=" + this.f48209b + ", controller=" + this.f48210c + ")";
    }
}
