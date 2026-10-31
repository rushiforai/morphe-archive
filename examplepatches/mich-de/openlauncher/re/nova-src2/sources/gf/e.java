package gf;

import com.google.android.exoplayer2.source.ClippingMediaSource$IllegalClippingException;
import fe.y1;
import fe.z1;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class e extends z0 {

    /* renamed from: l, reason: collision with root package name */
    public final long f57473l;

    /* renamed from: m, reason: collision with root package name */
    public final long f57474m;
    public final boolean n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f57475p;

    /* renamed from: q, reason: collision with root package name */
    public final ArrayList f57476q;

    /* renamed from: r, reason: collision with root package name */
    public final y1 f57477r;

    /* renamed from: s, reason: collision with root package name */
    public d f57478s;

    /* renamed from: t, reason: collision with root package name */
    public ClippingMediaSource$IllegalClippingException f57479t;

    /* renamed from: u, reason: collision with root package name */
    public long f57480u;

    /* renamed from: v, reason: collision with root package name */
    public long f57481v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(a aVar, long j11, long j12, boolean z11, boolean z12, boolean z13) {
        super(aVar);
        aVar.getClass();
        wf.a.e(j11 >= 0);
        this.f57473l = j11;
        this.f57474m = j12;
        this.n = z11;
        this.o = z12;
        this.f57475p = z13;
        this.f57476q = new ArrayList();
        this.f57477r = new y1();
    }

    @Override // gf.a
    public final t a(w wVar, vf.m mVar, long j11) {
        c cVar = new c(this.f57671k.a(wVar, mVar, j11), this.n, this.f57480u, this.f57481v);
        this.f57476q.add(cVar);
        return cVar;
    }

    @Override // gf.h, gf.a
    public final void i() throws ClippingMediaSource$IllegalClippingException {
        ClippingMediaSource$IllegalClippingException clippingMediaSource$IllegalClippingException = this.f57479t;
        if (clippingMediaSource$IllegalClippingException != null) {
            throw clippingMediaSource$IllegalClippingException;
        }
        super.i();
    }

    @Override // gf.a
    public final void m(t tVar) {
        ArrayList arrayList = this.f57476q;
        wf.a.i(arrayList.remove(tVar));
        this.f57671k.m(((c) tVar).f57457a);
        if (!arrayList.isEmpty() || this.o) {
            return;
        }
        d dVar = this.f57478s;
        dVar.getClass();
        z(dVar.f57534b);
    }

    @Override // gf.h, gf.a
    public final void o() {
        super.o();
        this.f57479t = null;
        this.f57478s = null;
    }

    @Override // gf.z0
    public final void x(z1 z1Var) {
        if (this.f57479t != null) {
            return;
        }
        z(z1Var);
    }

    public final void z(z1 z1Var) {
        long j11;
        long j12;
        long j13;
        y1 y1Var = this.f57477r;
        z1Var.n(0, y1Var);
        long j14 = y1Var.f55111p;
        d dVar = this.f57478s;
        long j15 = this.f57474m;
        ArrayList arrayList = this.f57476q;
        if (dVar == null || arrayList.isEmpty() || this.o) {
            boolean z11 = this.f57475p;
            j11 = this.f57473l;
            if (z11) {
                long j16 = y1Var.f55109l;
                j11 += j16;
                j12 = j16 + j15;
            } else {
                j12 = j15;
            }
            this.f57480u = j14 + j11;
            this.f57481v = j15 != Long.MIN_VALUE ? j14 + j12 : Long.MIN_VALUE;
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                c cVar = (c) arrayList.get(i5);
                long j17 = this.f57480u;
                long j18 = this.f57481v;
                cVar.f57461e = j17;
                cVar.f57462f = j18;
            }
            j13 = j12;
        } else {
            j11 = this.f57480u - j14;
            j13 = j15 != Long.MIN_VALUE ? this.f57481v - j14 : Long.MIN_VALUE;
        }
        try {
            d dVar2 = new d(z1Var, j11, j13);
            this.f57478s = dVar2;
            l(dVar2);
        } catch (ClippingMediaSource$IllegalClippingException e3) {
            this.f57479t = e3;
            for (int i11 = 0; i11 < arrayList.size(); i11++) {
                ((c) arrayList.get(i11)).f57463g = this.f57479t;
            }
        }
    }
}
