package kw;

import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q2 extends n2 {

    /* renamed from: b, reason: collision with root package name */
    public final IdentifierSpec f72581b;

    /* renamed from: c, reason: collision with root package name */
    public final y2 f72582c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f72583d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q2(IdentifierSpec identifier, y2 controller) {
        super(identifier);
        Intrinsics.g(identifier, "identifier");
        Intrinsics.g(controller, "controller");
        this.f72581b = identifier;
        this.f72582c = controller;
        this.f72583d = true;
    }

    @Override // kw.n2, kw.k2
    public final IdentifierSpec b() {
        return this.f72581b;
    }

    @Override // kw.k2
    public final ResolvableString c() {
        return null;
    }

    @Override // kw.k2
    public final boolean d() {
        return this.f72583d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q2)) {
            return false;
        }
        q2 q2Var = (q2) obj;
        return Intrinsics.b(this.f72581b, q2Var.f72581b) && Intrinsics.b(this.f72582c, q2Var.f72582c);
    }

    public final int hashCode() {
        return this.f72582c.hashCode() + (this.f72581b.hashCode() * 31);
    }

    @Override // kw.n2
    public final b1 k() {
        return this.f72582c;
    }

    public final String toString() {
        return "SimpleTextElement(identifier=" + this.f72581b + ", controller=" + this.f72582c + ")";
    }
}
