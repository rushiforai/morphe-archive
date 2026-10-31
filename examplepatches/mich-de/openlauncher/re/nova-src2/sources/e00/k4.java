package e00;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k4 extends o4 {

    /* renamed from: a, reason: collision with root package name */
    public final cy.h f50618a;

    /* renamed from: b, reason: collision with root package name */
    public final cy.m0 f50619b;

    public k4(cy.h hVar, cy.m0 m0Var) {
        this.f50618a = hVar;
        this.f50619b = m0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k4)) {
            return false;
        }
        k4 k4Var = (k4) obj;
        return Intrinsics.b(this.f50618a, k4Var.f50618a) && Intrinsics.b(this.f50619b, k4Var.f50619b);
    }

    public final int hashCode() {
        return this.f50619b.hashCode() + (this.f50618a.hashCode() * 31);
    }

    public final String toString() {
        return "OnHold(info=" + this.f50618a + ", tier=" + this.f50619b + ")";
    }
}
