package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qn4 implements hn4 {
    public final int a;
    public final yn3 b;
    public final long c;
    public final long d;

    public qn4(int i, int i2, yn3 yn3Var) {
        this.a = i;
        this.b = yn3Var;
        this.c = ((long) i) * 1000000;
        this.d = ((long) i2) * 1000000;
    }

    @Override // defpackage.ww
    public final jre a(hud hudVar) {
        return new o2b(this);
    }

    @Override // defpackage.hn4
    public final long b(float f, float f2, float f3) {
        return this.d + this.c;
    }

    @Override // defpackage.hn4
    public final float c(float f, float f2, float f3, long j) {
        long j2 = j - this.d;
        if (j2 < 0) {
            j2 = 0;
        }
        long j3 = this.c;
        long j4 = j2 > j3 ? j3 : j2;
        if (j4 == 0) {
            return f3;
        }
        return (e(f, f2, f3, j4) - e(f, f2, f3, j4 - 1000000)) * 1000.0f;
    }

    @Override // defpackage.hn4
    public final float d(float f, float f2, float f3) {
        return c(f, f2, f3, b(f, f2, f3));
    }

    @Override // defpackage.hn4
    public final float e(float f, float f2, float f3, long j) {
        long j2 = j - this.d;
        if (j2 < 0) {
            j2 = 0;
        }
        long j3 = this.c;
        if (j2 > j3) {
            j2 = j3;
        }
        float fA = this.b.a(this.a == 0 ? 1.0f : j2 / j3);
        return (f2 * fA) + ((1.0f - fA) * f);
    }
}
