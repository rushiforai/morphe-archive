package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xwb {
    public final wwb a;
    public final wwb b;
    public final boolean c;

    public xwb(wwb wwbVar, wwb wwbVar2, boolean z) {
        this.a = wwbVar;
        this.b = wwbVar2;
        this.c = z;
    }

    public static xwb a(xwb xwbVar, wwb wwbVar, wwb wwbVar2, boolean z, int i) {
        if ((i & 1) != 0) {
            wwbVar = xwbVar.a;
        }
        if ((i & 2) != 0) {
            wwbVar2 = xwbVar.b;
        }
        xwbVar.getClass();
        return new xwb(wwbVar, wwbVar2, z);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xwb)) {
            return false;
        }
        xwb xwbVar = (xwb) obj;
        return g76.L(this.a, xwbVar.a) && g76.L(this.b, xwbVar.b) && this.c == xwbVar.c;
    }

    public final int hashCode() {
        return ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Selection(start=");
        sb.append(this.a);
        sb.append(", end=");
        sb.append(this.b);
        sb.append(", handlesCrossed=");
        return ev6.A(sb, this.c, ')');
    }
}
