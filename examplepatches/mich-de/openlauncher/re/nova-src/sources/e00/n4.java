package e00;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n4 extends o4 {

    /* renamed from: a, reason: collision with root package name */
    public final cy.h f50788a;

    public n4(cy.h hVar) {
        this.f50788a = hVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n4) && Intrinsics.b(this.f50788a, ((n4) obj).f50788a);
    }

    public final int hashCode() {
        return this.f50788a.hashCode();
    }

    public final String toString() {
        return "PrimeActive(info=" + this.f50788a + ")";
    }
}
