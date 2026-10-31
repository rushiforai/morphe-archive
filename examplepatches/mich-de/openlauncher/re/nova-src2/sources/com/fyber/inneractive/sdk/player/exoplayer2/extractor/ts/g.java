package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class g implements h {

    /* renamed from: a, reason: collision with root package name */
    public final List f29816a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.r[] f29817b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f29818c;

    /* renamed from: d, reason: collision with root package name */
    public int f29819d;

    /* renamed from: e, reason: collision with root package name */
    public int f29820e;

    /* renamed from: f, reason: collision with root package name */
    public long f29821f;

    public g(List list) {
        this.f29816a = list;
        this.f29817b = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.r[list.size()];
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        this.f29818c = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
        if (this.f29818c) {
            for (com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar : this.f29817b) {
                rVar.a(this.f29821f, 1, this.f29820e, 0, null);
            }
            this.f29818c = false;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        for (int i5 = 0; i5 < this.f29817b.length; i5++) {
            c0 c0Var = (c0) this.f29816a.get(i5);
            e0Var.a();
            e0Var.b();
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(e0Var.f29803d, 3);
            e0Var.b();
            gVarA.a(new com.fyber.inneractive.sdk.player.exoplayer2.o(e0Var.f29804e, null, "application/dvbsubs", null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, 0, c0Var.f29777a, -1, Long.MAX_VALUE, Collections.singletonList(c0Var.f29778b), null, null));
            this.f29817b[i5] = gVarA;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        if (z11) {
            this.f29818c = true;
            this.f29821f = j11;
            this.f29820e = 0;
            this.f29819d = 2;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        boolean z11;
        boolean z12;
        if (this.f29818c) {
            if (this.f29819d == 2) {
                if (nVar.f30463c - nVar.f30462b == 0) {
                    z12 = false;
                } else {
                    if (nVar.j() != 32) {
                        this.f29818c = false;
                    }
                    this.f29819d--;
                    z12 = this.f29818c;
                }
                if (!z12) {
                    return;
                }
            }
            if (this.f29819d == 1) {
                if (nVar.f30463c - nVar.f30462b == 0) {
                    z11 = false;
                } else {
                    if (nVar.j() != 0) {
                        this.f29818c = false;
                    }
                    this.f29819d--;
                    z11 = this.f29818c;
                }
                if (!z11) {
                    return;
                }
            }
            int i5 = nVar.f30462b;
            int i11 = nVar.f30463c - i5;
            for (com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar : this.f29817b) {
                nVar.e(i5);
                rVar.a(i11, nVar);
            }
            this.f29820e += i11;
        }
    }
}
