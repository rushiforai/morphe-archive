package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pb3 {
    public final boolean a;
    public final boolean b;
    public final ovb c;

    public pb3(int i) {
        boolean z = (i & 1) != 0;
        boolean z2 = (i & 2) != 0;
        ovb ovbVar = ovb.Inherit;
        this.a = z;
        this.b = z2;
        this.c = ovbVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof pb3)) {
            return false;
        }
        pb3 pb3Var = (pb3) obj;
        return this.a == pb3Var.a && this.b == pb3Var.b && this.c == pb3Var.c;
    }

    public final int hashCode() {
        return (((((((this.c.hashCode() + ((((this.a ? 1231 : 1237) * 31) + (this.b ? 1231 : 1237)) * 31)) * 31) + 1231) * 31) + 1231) * 31) + 2) * 31;
    }
}
