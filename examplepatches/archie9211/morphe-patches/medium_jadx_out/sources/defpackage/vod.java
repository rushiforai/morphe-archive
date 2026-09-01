package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vod {
    public static final mya d = kng.K(new n2c(12), new tjd(2));
    public float a;
    public final g49 b;
    public final g49 c;

    public vod(float f, float f2, float f3) {
        this.a = f;
        this.b = new g49(f3);
        this.c = new g49(f2);
    }

    public final float a() {
        if (this.a == 0.0f) {
            return 0.0f;
        }
        return this.c.g() / this.a;
    }

    public final void b(float f) {
        this.c.h(iq7.u(f, this.a, 0.0f));
    }
}
