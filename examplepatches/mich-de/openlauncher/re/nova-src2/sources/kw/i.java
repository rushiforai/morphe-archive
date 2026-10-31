package kw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i extends n2 {

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierSpec f72396b;

    /* renamed from: c, reason: collision with root package name */
    public final i0 f72397c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f72398d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(IdentifierSpec identifier, i0 i0Var) {
        super(identifier);
        Intrinsics.g(identifier, "identifier");
        this.f72396b = identifier;
        this.f72397c = i0Var;
        this.f72398d = true;
    }

    @Override // kw.n2, kw.k2
    public final IdentifierSpec b() {
        return this.f72396b;
    }

    @Override // kw.k2
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.k2
    public final boolean d() {
        return this.f72398d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return Intrinsics.b(this.f72396b, iVar.f72396b) && Intrinsics.b(this.f72397c, iVar.f72397c);
    }

    public final int hashCode() {
        return this.f72397c.hashCode() + (this.f72396b.hashCode() * 31);
    }

    @Override // kw.n2
    public final b1 k() {
        return this.f72397c;
    }

    public final String toString() {
        return "AdministrativeAreaElement(identifier=" + this.f72396b + ", controller=" + this.f72397c + ")";
    }
}
