package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hh0 {
    public int a;
    public int b;
    public float c;
    public float d;
    public long e;
    public long f;
    public long g;
    public float h;
    public int i;

    public final float a(long j) {
        if (j < this.e) {
            return 0.0f;
        }
        long j2 = this.g;
        if (j2 < 0 || j < j2) {
            return a37.b((j - r0) / this.a, 0.0f, 1.0f) * 0.5f;
        }
        float f = this.h;
        return (a37.b((j - j2) / this.i, 0.0f, 1.0f) * f) + (1.0f - f);
    }
}
