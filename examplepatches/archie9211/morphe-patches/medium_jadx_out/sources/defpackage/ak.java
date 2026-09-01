package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ak implements hy7 {
    public final yq0 a;
    public final yq0 b;
    public final int c;

    public ak(yq0 yq0Var, yq0 yq0Var2, int i) {
        this.a = yq0Var;
        this.b = yq0Var2;
        this.c = i;
    }

    @Override // defpackage.hy7
    public final int a(o46 o46Var, long j, int i, ip6 ip6Var) {
        int iA = this.b.a(0, o46Var.d(), ip6Var);
        int i2 = -this.a.a(0, i, ip6Var);
        ip6 ip6Var2 = ip6.Ltr;
        int i3 = this.c;
        if (ip6Var != ip6Var2) {
            i3 = -i3;
        }
        return o46Var.a + iA + i2 + i3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ak)) {
            return false;
        }
        ak akVar = (ak) obj;
        return this.a.equals(akVar.a) && this.b.equals(akVar.b) && this.c == akVar.c;
    }

    public final int hashCode() {
        return km4.p(this.b.a, Float.floatToIntBits(this.a.a) * 31, 31) + this.c;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Horizontal(menuAlignment=");
        sb.append(this.a);
        sb.append(", anchorAlignment=");
        sb.append(this.b);
        sb.append(", offset=");
        return km4.A(sb, this.c, ')');
    }
}
