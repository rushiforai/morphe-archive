package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p3f implements iy7 {
    public final zq0 a;
    public final int b;

    public p3f(zq0 zq0Var, int i) {
        this.a = zq0Var;
        this.b = i;
    }

    @Override // defpackage.iy7
    public final int a(o46 o46Var, long j, int i) {
        int i2 = (int) (j & 4294967295L);
        int i3 = this.b;
        return i >= i2 - (i3 * 2) ? Math.round(((i2 - i) / 2.0f) * 1.0f) : iq7.v(this.a.a(i, i2), i3, (i2 - i3) - i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p3f)) {
            return false;
        }
        p3f p3fVar = (p3f) obj;
        return this.a.equals(p3fVar.a) && this.b == p3fVar.b;
    }

    public final int hashCode() {
        return (Float.floatToIntBits(this.a.a) * 31) + this.b;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Vertical(alignment=");
        sb.append(this.a);
        sb.append(", margin=");
        return km4.A(sb, this.b, ')');
    }
}
