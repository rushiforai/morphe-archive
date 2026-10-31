package e00;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e4 extends o4 {

    /* renamed from: a, reason: collision with root package name */
    public final cy.h f50330a;

    /* renamed from: b, reason: collision with root package name */
    public final cy.m0 f50331b;

    public e4(cy.h hVar, cy.m0 m0Var) {
        this.f50330a = hVar;
        this.f50331b = m0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e4)) {
            return false;
        }
        e4 e4Var = (e4) obj;
        return Intrinsics.b(this.f50330a, e4Var.f50330a) && Intrinsics.b(this.f50331b, e4Var.f50331b);
    }

    public final int hashCode() {
        return this.f50331b.hashCode() + (this.f50330a.hashCode() * 31);
    }

    public final String toString() {
        return "ActiveUntilExpiry(info=" + this.f50330a + ", tier=" + this.f50331b + ")";
    }
}
