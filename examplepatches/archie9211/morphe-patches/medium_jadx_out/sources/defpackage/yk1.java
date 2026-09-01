package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yk1 {
    public final br a;
    public final br b;
    public final br c;
    public final br d;

    public yk1(br brVar, br brVar2, br brVar3, br brVar4) {
        this.a = brVar;
        this.b = brVar2;
        this.c = brVar3;
        this.d = brVar4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yk1)) {
            return false;
        }
        yk1 yk1Var = (yk1) obj;
        return this.a == yk1Var.a && this.b == yk1Var.b && this.c == yk1Var.c && this.d == yk1Var.d;
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "ChartPaths(backPath=" + this.a + ", backLinePath=" + this.b + ", frontPath=" + this.c + ", frontLinePath=" + this.d + ")";
    }
}
