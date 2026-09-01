package defpackage;

import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tjb implements m73 {
    public int a;
    public float b = 1.0f;
    public float c = 1.0f;
    public float d = 1.0f;
    public float e;
    public float f;
    public float g;
    public long h;
    public long i;
    public float j;
    public float k;
    public float l;
    public float m;
    public long n;
    public m3c o;
    public boolean p;
    public int q;
    public long r;
    public m73 s;
    public ip6 t;
    public ts0 u;
    public int v;
    public er7 w;

    public tjb() {
        long j = sf5.a;
        this.h = j;
        this.i = j;
        this.m = 8.0f;
        this.n = nrd.b;
        this.o = rv8.r;
        this.q = 0;
        this.r = 9205357640488583168L;
        this.s = sgg.n();
        this.t = ip6.Ltr;
        this.v = 3;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, Q(f));
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return i / this.s.b();
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / this.s.b();
    }

    @Override // defpackage.m73
    public final float U() {
        return this.s.U();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return this.s.b() * f;
    }

    public final void a() {
        k(1.0f);
        l(1.0f);
        c(1.0f);
        t(0.0f);
        v(0.0f);
        m(0.0f);
        long j = sf5.a;
        d(j);
        p(j);
        h(0.0f);
        i(0.0f);
        j(0.0f);
        if (this.m != 8.0f) {
            this.a |= RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
            this.m = 8.0f;
        }
        s(nrd.b);
        n(rv8.r);
        e(false);
        g(null);
        if (this.v != 3) {
            this.a |= 524288;
            this.v = 3;
        }
        if (this.q != 0) {
            this.a |= 32768;
            this.q = 0;
        }
        this.r = 9205357640488583168L;
        this.w = null;
        this.a = 0;
    }

    @Override // defpackage.m73
    public final float b() {
        return this.s.b();
    }

    public final void c(float f) {
        if (this.d == f) {
            return;
        }
        this.a |= 4;
        this.d = f;
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        throw null;
    }

    public final void d(long j) {
        long j2 = this.h;
        int i = uu1.i;
        if (ezd.a(j2, j)) {
            return;
        }
        this.a |= 64;
        this.h = j;
    }

    public final void e(boolean z) {
        if (this.p != z) {
            this.a |= OlympusMakernoteDirectory.TAG_MAIN_INFO;
            this.p = z;
        }
    }

    public final void g(ts0 ts0Var) {
        if (g76.L(this.u, ts0Var)) {
            return;
        }
        this.a |= 131072;
        this.u = ts0Var;
    }

    public final void h(float f) {
        if (this.j == f) {
            return;
        }
        this.a |= 256;
        this.j = f;
    }

    public final void i(float f) {
        if (this.k == f) {
            return;
        }
        this.a |= 512;
        this.k = f;
    }

    @Override // defpackage.m73
    public final /* synthetic */ int i0(float f) {
        return ho2.d(this, f);
    }

    public final void j(float f) {
        if (this.l == f) {
            return;
        }
        this.a |= 1024;
        this.l = f;
    }

    public final void k(float f) {
        if (this.b == f) {
            return;
        }
        this.a |= 1;
        this.b = f;
    }

    public final void l(float f) {
        if (this.c == f) {
            return;
        }
        this.a |= 2;
        this.c = f;
    }

    public final void m(float f) {
        if (this.g == f) {
            return;
        }
        this.a |= 32;
        this.g = f;
    }

    @Override // defpackage.m73
    public final /* synthetic */ long m0(long j) {
        return ho2.g(j, this);
    }

    public final void n(m3c m3cVar) {
        if (g76.L(this.o, m3cVar)) {
            return;
        }
        this.a |= 8192;
        this.o = m3cVar;
    }

    public final void p(long j) {
        long j2 = this.i;
        int i = uu1.i;
        if (ezd.a(j2, j)) {
            return;
        }
        this.a |= 128;
        this.i = j;
    }

    @Override // defpackage.m73
    public final /* synthetic */ float p0(long j) {
        return ho2.f(j, this);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long r(long j) {
        return ho2.e(j, this);
    }

    public final void s(long j) {
        if (nrd.a(this.n, j)) {
            return;
        }
        this.a |= 4096;
        this.n = j;
    }

    public final void t(float f) {
        if (this.e == f) {
            return;
        }
        this.a |= 8;
        this.e = f;
    }

    public final void v(float f) {
        if (this.f == f) {
            return;
        }
        this.a |= 16;
        this.f = f;
    }

    @Override // defpackage.m73
    public final /* synthetic */ float z(long j) {
        return km4.i(j, this);
    }
}
