package kl;

import java.util.Objects;
import pl.b2;
import pl.j1;

/* loaded from: classes.dex */
public final class t extends el.g {

    /* renamed from: a, reason: collision with root package name */
    public final q0 f71635a;

    public t(q0 q0Var) {
        this.f71635a = q0Var;
    }

    @Override // el.g
    public final boolean a() {
        return ((j1) this.f71635a.f71630b).z() != b2.RAW;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof t)) {
            return false;
        }
        q0 q0Var = ((t) obj).f71635a;
        q0 q0Var2 = this.f71635a;
        b2 b2VarZ = ((j1) q0Var2.f71630b).z();
        j1 j1Var = (j1) q0Var.f71630b;
        j1 j1Var2 = (j1) q0Var.f71630b;
        return b2VarZ.equals(j1Var.z()) && ((j1) q0Var2.f71630b).A().equals(j1Var2.A()) && ((j1) q0Var2.f71630b).B().equals(j1Var2.B());
    }

    public final int hashCode() {
        q0 q0Var = this.f71635a;
        return Objects.hash((j1) q0Var.f71630b, (tl.a) q0Var.f71629a);
    }

    public final String toString() {
        q0 q0Var = this.f71635a;
        String strA = ((j1) q0Var.f71630b).A();
        int iOrdinal = ((j1) q0Var.f71630b).z().ordinal();
        return b.c0.n("(typeUrl=", strA, ", outputPrefixType=", iOrdinal != 1 ? iOrdinal != 2 ? iOrdinal != 3 ? iOrdinal != 4 ? "UNKNOWN" : "CRUNCHY" : "RAW" : "LEGACY" : "TINK", ")");
    }
}
