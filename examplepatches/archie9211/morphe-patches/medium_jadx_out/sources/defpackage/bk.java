package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bk implements iy7 {
    public final zq0 a;
    public final zq0 b;
    public final int c;

    public bk(zq0 zq0Var, zq0 zq0Var2, int i) {
        this.a = zq0Var;
        this.b = zq0Var2;
        this.c = i;
    }

    @Override // defpackage.iy7
    public final int a(o46 o46Var, long j, int i) {
        int iA = this.b.a(0, o46Var.b());
        return o46Var.b + iA + (-this.a.a(0, i)) + this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bk)) {
            return false;
        }
        bk bkVar = (bk) obj;
        return this.a.equals(bkVar.a) && this.b.equals(bkVar.b) && this.c == bkVar.c;
    }

    public final int hashCode() {
        return km4.p(this.b.a, Float.floatToIntBits(this.a.a) * 31, 31) + this.c;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Vertical(menuAlignment=");
        sb.append(this.a);
        sb.append(", anchorAlignment=");
        sb.append(this.b);
        sb.append(", offset=");
        return km4.A(sb, this.c, ')');
    }
}
