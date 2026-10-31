package com.fyber.inneractive.sdk.player.exoplayer2.extractor.flv;

import androidx.recyclerview.widget.n0;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.i;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.j;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.o;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.q;
import com.fyber.inneractive.sdk.player.exoplayer2.r;
import com.fyber.inneractive.sdk.player.exoplayer2.util.n;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.EOFException;

/* loaded from: classes3.dex */
public final class b implements i, q {
    public static final int n = z.a("FLV");

    /* renamed from: e, reason: collision with root package name */
    public j f29166e;

    /* renamed from: g, reason: collision with root package name */
    public int f29168g;

    /* renamed from: h, reason: collision with root package name */
    public int f29169h;

    /* renamed from: i, reason: collision with root package name */
    public int f29170i;

    /* renamed from: j, reason: collision with root package name */
    public long f29171j;

    /* renamed from: k, reason: collision with root package name */
    public a f29172k;

    /* renamed from: l, reason: collision with root package name */
    public f f29173l;

    /* renamed from: m, reason: collision with root package name */
    public c f29174m;

    /* renamed from: a, reason: collision with root package name */
    public final n f29162a = new n(4);

    /* renamed from: b, reason: collision with root package name */
    public final n f29163b = new n(9);

    /* renamed from: c, reason: collision with root package name */
    public final n f29164c = new n(11);

    /* renamed from: d, reason: collision with root package name */
    public final n f29165d = new n();

    /* renamed from: f, reason: collision with root package name */
    public int f29167f = 1;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        return 0L;
    }

    public final n b(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, EOFException {
        if (this.f29170i > this.f29165d.a()) {
            n nVar = this.f29165d;
            nVar.f30461a = new byte[Math.max(nVar.a() * 2, this.f29170i)];
            nVar.f30463c = 0;
            nVar.f30462b = 0;
        } else {
            this.f29165d.e(0);
        }
        this.f29165d.d(this.f29170i);
        bVar.b(this.f29165d.f30461a, 0, this.f29170i, false);
        return this.f29165d;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return this.f29174m.f29175b;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, EOFException {
        bVar.a(this.f29162a.f30461a, 0, 3, false);
        this.f29162a.e(0);
        if (this.f29162a.l() != n) {
            return false;
        }
        bVar.a(this.f29162a.f30461a, 0, 2, false);
        this.f29162a.e(0);
        if ((this.f29162a.o() & n0.DEFAULT_SWIPE_ANIMATION_DURATION) != 0) {
            return false;
        }
        bVar.a(this.f29162a.f30461a, 0, 4, false);
        this.f29162a.e(0);
        int iB = this.f29162a.b();
        bVar.f29135e = 0;
        bVar.a(iB, false);
        bVar.a(this.f29162a.f30461a, 0, 4, false);
        this.f29162a.e(0);
        return this.f29162a.b() == 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(j jVar) {
        this.f29166e = jVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        this.f29167f = 1;
        this.f29168g = 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, o oVar) throws InterruptedException, r, EOFException {
        c cVar;
        f fVar;
        a aVar;
        while (true) {
            int i5 = this.f29167f;
            boolean z11 = true;
            if (i5 != 1) {
                if (i5 == 2) {
                    bVar.a(this.f29168g);
                    this.f29168g = 0;
                    this.f29167f = 3;
                } else if (i5 != 3) {
                    if (i5 == 4) {
                        int i11 = this.f29169h;
                        if (i11 == 8 && (aVar = this.f29172k) != null) {
                            n nVarB = b(bVar);
                            long j11 = this.f29171j;
                            aVar.a(nVarB);
                            aVar.a(nVarB, j11);
                        } else if (i11 == 9 && (fVar = this.f29173l) != null) {
                            n nVarB2 = b(bVar);
                            long j12 = this.f29171j;
                            if (fVar.a(nVarB2)) {
                                fVar.a(nVarB2, j12);
                            }
                        } else if (i11 == 18 && (cVar = this.f29174m) != null) {
                            cVar.a(b(bVar), this.f29171j);
                        } else {
                            bVar.a(this.f29170i);
                            z11 = false;
                        }
                        this.f29168g = 4;
                        this.f29167f = 2;
                        if (z11) {
                            return 0;
                        }
                    } else {
                        continue;
                    }
                } else {
                    if (!bVar.b(this.f29164c.f30461a, 0, 11, true)) {
                        return -1;
                    }
                    this.f29164c.e(0);
                    this.f29169h = this.f29164c.j();
                    this.f29170i = this.f29164c.l();
                    this.f29171j = this.f29164c.l();
                    this.f29171j = ((this.f29164c.j() << 24) | this.f29171j) * 1000;
                    n nVar = this.f29164c;
                    nVar.e(nVar.f30462b + 3);
                    this.f29167f = 4;
                }
            } else {
                if (!bVar.b(this.f29163b.f30461a, 0, 9, true)) {
                    return -1;
                }
                this.f29163b.e(0);
                n nVar2 = this.f29163b;
                nVar2.e(nVar2.f30462b + 4);
                int iJ = this.f29163b.j();
                boolean z12 = (iJ & 4) != 0;
                boolean z13 = (iJ & 1) != 0;
                if (z12 && this.f29172k == null) {
                    this.f29172k = new a(this.f29166e.a(8, 1));
                }
                if (z13 && this.f29173l == null) {
                    this.f29173l = new f(this.f29166e.a(9, 2));
                }
                if (this.f29174m == null) {
                    this.f29174m = new c();
                }
                this.f29166e.b();
                this.f29166e.a(this);
                this.f29168g = this.f29163b.b() - 5;
                this.f29167f = 2;
            }
        }
    }
}
