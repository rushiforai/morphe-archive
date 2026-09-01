package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zr0 extends c09 {
    public final wp f;
    public final long g;
    public int h = 1;
    public final long i;
    public float j;
    public bs0 k;

    public zr0(wp wpVar, long j) {
        int i;
        this.f = wpVar;
        this.g = j;
        int i2 = (int) (j >> 32);
        if (i2 < 0 || (i = (int) (4294967295L & j)) < 0 || i2 > wpVar.a.getWidth() || i > wpVar.a.getHeight()) {
            ay0.e("Failed requirement.");
            throw null;
        }
        this.i = j;
        this.j = 1.0f;
    }

    @Override // defpackage.c09
    public final boolean a(float f) {
        this.j = f;
        return true;
    }

    @Override // defpackage.c09
    public final boolean e(bs0 bs0Var) {
        this.k = bs0Var;
        return true;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zr0)) {
            return false;
        }
        zr0 zr0Var = (zr0) obj;
        return g76.L(this.f, zr0Var.f) && k46.b(0L, 0L) && s46.a(this.g, zr0Var.g) && this.h == zr0Var.h;
    }

    @Override // defpackage.c09
    public final long h() {
        return nk7.C0(this.i);
    }

    public final int hashCode() {
        int iHashCode = this.f.hashCode() * 961;
        long j = this.g;
        return ((((int) (j ^ (j >>> 32))) + iHashCode) * 31) + this.h;
    }

    @Override // defpackage.c09
    public final void i(zl3 zl3Var) {
        int iRound = Math.round(Float.intBitsToFloat((int) (zl3Var.f() >> 32)));
        int iRound2 = Math.round(Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L)));
        float f = this.j;
        bs0 bs0Var = this.k;
        int i = this.h;
        ho2.l(zl3Var, this.f, this.g, (((long) iRound) << 32) | (((long) iRound2) & 4294967295L), f, bs0Var, i, 328);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BitmapPainter(image=");
        sb.append(this.f);
        sb.append(", srcOffset=");
        sb.append((Object) k46.e(0L));
        sb.append(", srcSize=");
        sb.append((Object) s46.b(this.g));
        sb.append(", filterQuality=");
        int i = this.h;
        sb.append((Object) (i == 0 ? "None" : i == 1 ? "Low" : i == 2 ? "Medium" : i == 3 ? "High" : "Unknown"));
        sb.append(')');
        return sb.toString();
    }
}
