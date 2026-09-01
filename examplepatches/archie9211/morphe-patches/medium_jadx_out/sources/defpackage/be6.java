package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class be6 {
    public final h5b a;
    public final h5b b;
    public final Map c = fy3.a;
    public final boolean d;

    public be6(h5b h5bVar, h5b h5bVar2) {
        this.a = h5bVar;
        this.b = h5bVar2;
        new w5d(new v2(19, this));
        h5b h5bVar3 = h5b.IGNORE;
        this.d = h5bVar == h5bVar3 && h5bVar2 == h5bVar3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof be6)) {
            return false;
        }
        be6 be6Var = (be6) obj;
        return this.a == be6Var.a && this.b == be6Var.b && this.c.equals(be6Var.c);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        h5b h5bVar = this.b;
        return this.c.hashCode() + ((iHashCode + (h5bVar == null ? 0 : h5bVar.hashCode())) * 31);
    }

    public final String toString() {
        return "Jsr305Settings(globalLevel=" + this.a + ", migrationLevel=" + this.b + ", userDefinedLevelForSpecificAnnotation=" + this.c + ')';
    }
}
