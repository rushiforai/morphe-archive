package com.fyber.inneractive.sdk.player.exoplayer2;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final int f28969a;

    /* renamed from: b, reason: collision with root package name */
    public t f28970b;

    /* renamed from: c, reason: collision with root package name */
    public int f28971c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.source.v f28972d;

    /* renamed from: e, reason: collision with root package name */
    public long f28973e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f28974f = true;

    /* renamed from: g, reason: collision with root package name */
    public boolean f28975g;

    public a(int i5) {
        this.f28969a = i5;
    }

    public abstract void a(int i5, Object obj);

    public abstract void a(long j11, long j12);

    public abstract void a(boolean z11, long j11);

    public void a(o[] oVarArr) {
    }

    public final void c() {
        if (this.f28971c != 1) {
            throw new IllegalStateException();
        }
        this.f28971c = 0;
        this.f28972d = null;
        this.f28975g = false;
        g();
    }

    public com.fyber.inneractive.sdk.player.exoplayer2.util.h d() {
        return null;
    }

    public abstract boolean e();

    public abstract boolean f();

    public abstract void g();

    public abstract void h();

    public abstract void i();

    public abstract void j();

    public final int a(p pVar, com.fyber.inneractive.sdk.player.exoplayer2.decoder.c cVar, boolean z11) {
        int iA = this.f28972d.a(pVar, cVar, z11);
        if (iA == -4) {
            if (cVar.b(4)) {
                this.f28974f = true;
                return this.f28975g ? -4 : -3;
            }
            cVar.f29114d += this.f28973e;
            return iA;
        }
        if (iA == -5) {
            o oVar = pVar.f30147a;
            long j11 = oVar.f30143w;
            if (j11 != Long.MAX_VALUE) {
                pVar.f30147a = new o(oVar.f30123a, oVar.f30127e, oVar.f30128f, oVar.f30125c, oVar.f30124b, oVar.f30129g, oVar.f30132j, oVar.f30133k, oVar.f30134l, oVar.f30135m, oVar.n, oVar.f30136p, oVar.o, oVar.f30137q, oVar.f30138r, oVar.f30139s, oVar.f30140t, oVar.f30141u, oVar.f30142v, oVar.f30144x, oVar.f30145y, oVar.f30146z, j11 + this.f28973e, oVar.f30130h, oVar.f30131i, oVar.f30126d);
            }
        }
        return iA;
    }
}
