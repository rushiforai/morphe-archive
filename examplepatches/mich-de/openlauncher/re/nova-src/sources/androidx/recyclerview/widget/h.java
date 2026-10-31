package androidx.recyclerview.widget;

/* loaded from: classes.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public long f14975a = 0;

    /* renamed from: b, reason: collision with root package name */
    public h f14976b;

    public final void a(int i5) {
        if (i5 < 64) {
            this.f14975a &= ~(1 << i5);
            return;
        }
        h hVar = this.f14976b;
        if (hVar != null) {
            hVar.a(i5 - 64);
        }
    }

    public final int b(int i5) {
        h hVar = this.f14976b;
        if (hVar == null) {
            return i5 >= 64 ? Long.bitCount(this.f14975a) : Long.bitCount(this.f14975a & ((1 << i5) - 1));
        }
        if (i5 < 64) {
            return Long.bitCount(this.f14975a & ((1 << i5) - 1));
        }
        return Long.bitCount(this.f14975a) + hVar.b(i5 - 64);
    }

    public final void c() {
        if (this.f14976b == null) {
            this.f14976b = new h();
        }
    }

    public final boolean d(int i5) {
        if (i5 < 64) {
            return (this.f14975a & (1 << i5)) != 0;
        }
        c();
        return this.f14976b.d(i5 - 64);
    }

    public final void e(int i5, boolean z11) {
        if (i5 >= 64) {
            c();
            this.f14976b.e(i5 - 64, z11);
            return;
        }
        long j11 = this.f14975a;
        boolean z12 = (Long.MIN_VALUE & j11) != 0;
        long j12 = (1 << i5) - 1;
        this.f14975a = ((j11 & (~j12)) << 1) | (j11 & j12);
        if (z11) {
            h(i5);
        } else {
            a(i5);
        }
        if (z12 || this.f14976b != null) {
            c();
            this.f14976b.e(0, z12);
        }
    }

    public final boolean f(int i5) {
        if (i5 >= 64) {
            c();
            return this.f14976b.f(i5 - 64);
        }
        long j11 = 1 << i5;
        long j12 = this.f14975a;
        boolean z11 = (j12 & j11) != 0;
        long j13 = j12 & (~j11);
        this.f14975a = j13;
        long j14 = j11 - 1;
        this.f14975a = (j13 & j14) | Long.rotateRight((~j14) & j13, 1);
        h hVar = this.f14976b;
        if (hVar != null) {
            if (hVar.d(0)) {
                h(63);
            }
            this.f14976b.f(0);
        }
        return z11;
    }

    public final void g() {
        this.f14975a = 0L;
        h hVar = this.f14976b;
        if (hVar != null) {
            hVar.g();
        }
    }

    public final void h(int i5) {
        if (i5 < 64) {
            this.f14975a |= 1 << i5;
        } else {
            c();
            this.f14976b.h(i5 - 64);
        }
    }

    public final String toString() {
        if (this.f14976b == null) {
            return Long.toBinaryString(this.f14975a);
        }
        return this.f14976b.toString() + "xx" + Long.toBinaryString(this.f14975a);
    }
}
