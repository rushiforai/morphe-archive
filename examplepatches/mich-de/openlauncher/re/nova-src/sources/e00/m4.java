package e00;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m4 extends o4 {

    /* renamed from: a, reason: collision with root package name */
    public final cy.h f50730a;

    public m4(cy.h hVar) {
        this.f50730a = hVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m4) && Intrinsics.b(this.f50730a, ((m4) obj).f50730a);
    }

    public final int hashCode() {
        return this.f50730a.hashCode();
    }

    public final String toString() {
        return "PlusActive(info=" + this.f50730a + ")";
    }
}
