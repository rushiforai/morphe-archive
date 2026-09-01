package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y19 {
    public final wq a;
    public final int b;
    public final int c;
    public final int d;
    public final int e;
    public final float f;
    public final float g;

    public y19(wq wqVar, int i, int i2, int i3, int i4, float f, float f2) {
        this.a = wqVar;
        this.b = i;
        this.c = i2;
        this.d = i3;
        this.e = i4;
        this.f = f;
        this.g = f2;
    }

    public final zwa a(zwa zwaVar) {
        return zwaVar.i((((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(this.f)) & 4294967295L));
    }

    public final long b(long j, boolean z) {
        if (z) {
            long j2 = bkd.b;
            if (bkd.b(j, j2)) {
                return j2;
            }
        }
        int i = bkd.c;
        int i2 = this.b;
        return lk7.q(((int) (j >> 32)) + i2, ((int) (j & 4294967295L)) + i2);
    }

    public final zwa c(zwa zwaVar) {
        float f = -this.f;
        return zwaVar.i((((long) Float.floatToRawIntBits(0.0f)) << 32) | (((long) Float.floatToRawIntBits(f)) & 4294967295L));
    }

    public final int d(int i) {
        int i2 = this.c;
        int i3 = this.b;
        return iq7.v(i, i3, i2) - i3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof y19) {
            y19 y19Var = (y19) obj;
            if (this.a == y19Var.a && this.b == y19Var.b && this.c == y19Var.c && this.d == y19Var.d && this.e == y19Var.e && Float.compare(this.f, y19Var.f) == 0 && Float.compare(this.g, y19Var.g) == 0) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.g) + km4.p(this.f, ((((((((this.a.hashCode() * 31) + this.b) * 31) + this.c) * 31) + this.d) * 31) + this.e) * 31, 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ParagraphInfo(paragraph=");
        sb.append(this.a);
        sb.append(", startIndex=");
        sb.append(this.b);
        sb.append(", endIndex=");
        sb.append(this.c);
        sb.append(", startLineIndex=");
        sb.append(this.d);
        sb.append(", endLineIndex=");
        sb.append(this.e);
        sb.append(", top=");
        sb.append(this.f);
        sb.append(", bottom=");
        return lv8.s(sb, this.g, ')');
    }
}
