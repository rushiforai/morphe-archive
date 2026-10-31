package e00;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l4 extends o4 {

    /* renamed from: a, reason: collision with root package name */
    public final cy.h f50680a;

    /* renamed from: b, reason: collision with root package name */
    public final cy.m0 f50681b;

    public l4(cy.h hVar, cy.m0 m0Var) {
        this.f50680a = hVar;
        this.f50681b = m0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l4)) {
            return false;
        }
        l4 l4Var = (l4) obj;
        return Intrinsics.b(this.f50680a, l4Var.f50680a) && Intrinsics.b(this.f50681b, l4Var.f50681b);
    }

    public final int hashCode() {
        return this.f50681b.hashCode() + (this.f50680a.hashCode() * 31);
    }

    public final String toString() {
        return "Pending(info=" + this.f50680a + ", tier=" + this.f50681b + ")";
    }
}
