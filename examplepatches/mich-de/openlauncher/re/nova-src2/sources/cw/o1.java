package cw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o1 extends kw.n2 {

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierSpec f48245b;

    /* renamed from: c, reason: collision with root package name */
    public final n1 f48246c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f48247d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o1(IdentifierSpec _identifier, n1 controller) {
        super(_identifier);
        Intrinsics.g(_identifier, "_identifier");
        Intrinsics.g(controller, "controller");
        this.f48245b = _identifier;
        this.f48246c = controller;
        this.f48247d = true;
    }

    @Override // kw.k2
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.k2
    public final boolean d() {
        return this.f48247d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o1)) {
            return false;
        }
        o1 o1Var = (o1) obj;
        return Intrinsics.b(this.f48245b, o1Var.f48245b) && Intrinsics.b(this.f48246c, o1Var.f48246c);
    }

    @Override // kw.n2, kw.k2
    public final void h(Map rawValuesMap) {
        Intrinsics.g(rawValuesMap, "rawValuesMap");
    }

    public final int hashCode() {
        return this.f48246c.hashCode() + (this.f48245b.hashCode() * 31);
    }

    @Override // kw.n2
    public final kw.b1 k() {
        return this.f48246c;
    }

    public final String toString() {
        return "CvcElement(_identifier=" + this.f48245b + ", controller=" + this.f48246c + ")";
    }
}
