package defpackage;

import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class a1b extends u0b implements o86 {
    public final y05 a;

    public a1b(y05 y05Var) {
        y05Var.getClass();
        this.a = y05Var;
    }

    @Override // defpackage.o86
    public final f0b a(y05 y05Var) {
        y05Var.getClass();
        return null;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a1b) {
            return g76.L(this.a, ((a1b) obj).a);
        }
        return false;
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        return ey3.a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return a1b.class.getName() + ": " + this.a;
    }
}
