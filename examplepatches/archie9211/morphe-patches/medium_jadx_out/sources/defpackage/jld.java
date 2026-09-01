package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jld {
    public final k68 a;
    public ild b;
    public long c;
    public long d;
    public long e;
    public long f;
    public float[] g;

    public jld() {
        k68 k68Var = j46.a;
        this.a = new k68();
        this.c = -1L;
        this.d = 0L;
        this.e = 0L;
    }

    public final void a(ild ildVar, long j, long j2, float[] fArr, long j3) {
        long j4 = ildVar.g;
        if (j3 - j4 > 0 || j4 == Long.MIN_VALUE) {
            ildVar.g = j3;
            ildVar.a(ildVar.e, ildVar.f, j, j2, fArr);
        }
    }

    public final boolean b(long j, long j2, float[] fArr, int i, int i2) {
        boolean z;
        if (k46.b(j2, this.d)) {
            z = false;
        } else {
            this.d = j2;
            z = true;
        }
        if (!k46.b(j, this.e)) {
            this.e = j;
            z = true;
        }
        if (fArr != null) {
            this.g = fArr;
            z = true;
        }
        long j3 = (((long) i) << 32) | (((long) i2) & 4294967295L);
        if (j3 == this.f) {
            return z;
        }
        this.f = j3;
        return true;
    }
}
