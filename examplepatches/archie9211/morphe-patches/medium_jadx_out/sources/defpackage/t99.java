package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class t99 {
    public int a;
    public int b;
    public long c = 0;
    public long d = u99.a;
    public long e = 0;

    public abstract int M(yd ydVar);

    public int P() {
        return (int) (this.c & 4294967295L);
    }

    public int R() {
        return (int) (this.c >> 32);
    }

    public final void T() {
        this.a = iq7.v((int) (this.c >> 32), f72.j(this.d), f72.h(this.d));
        int iV = iq7.v((int) (this.c & 4294967295L), f72.i(this.d), f72.g(this.d));
        this.b = iV;
        int i = this.a;
        long j = this.c;
        this.e = (((long) ((i - ((int) (j >> 32))) / 2)) << 32) | (4294967295L & ((long) ((iV - ((int) (j & 4294967295L))) / 2)));
    }

    public abstract void X(long j, float f, x45 x45Var);

    public void a0(long j, float f, of5 of5Var) {
        X(j, f, null);
    }

    public final void d0(long j) {
        if (s46.a(this.c, j)) {
            return;
        }
        this.c = j;
        T();
    }

    public final void e0(long j) {
        if (f72.b(this.d, j)) {
            return;
        }
        this.d = j;
        T();
    }

    public Object w() {
        return null;
    }
}
