package cw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e1 extends kw.n2 {

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierSpec f48135b;

    /* renamed from: c, reason: collision with root package name */
    public final b2 f48136c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f48137d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e1(IdentifierSpec _identifier, b2 b2Var) {
        super(_identifier);
        Intrinsics.g(_identifier, "_identifier");
        this.f48135b = _identifier;
        this.f48136c = b2Var;
        this.f48137d = true;
    }

    @Override // kw.k2
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.k2
    public final boolean d() {
        return this.f48137d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e1)) {
            return false;
        }
        e1 e1Var = (e1) obj;
        return Intrinsics.b(this.f48135b, e1Var.f48135b) && Intrinsics.b(this.f48136c, e1Var.f48136c);
    }

    @Override // kw.n2, kw.k2
    public final void h(Map rawValuesMap) {
        Intrinsics.g(rawValuesMap, "rawValuesMap");
    }

    public final int hashCode() {
        return this.f48136c.hashCode() + (this.f48135b.hashCode() * 31);
    }

    @Override // kw.n2
    public final kw.b1 k() {
        return this.f48136c;
    }

    public final String toString() {
        return "CardNumberElement(_identifier=" + this.f48135b + ", controller=" + this.f48136c + ")";
    }
}
