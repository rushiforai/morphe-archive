package com.fyber.inneractive.sdk.player.exoplayer2.source;

import android.net.Uri;
import android.os.Handler;
import com.fyber.inneractive.sdk.player.controller.b0;

/* loaded from: classes3.dex */
public final class q implements u, t {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f30229a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.g f30230b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.k f30231c;

    /* renamed from: d, reason: collision with root package name */
    public final int f30232d;

    /* renamed from: e, reason: collision with root package name */
    public final Handler f30233e;

    /* renamed from: f, reason: collision with root package name */
    public final b0 f30234f;

    /* renamed from: g, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.v f30235g = new com.fyber.inneractive.sdk.player.exoplayer2.v();

    /* renamed from: h, reason: collision with root package name */
    public t f30236h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f30237i;

    public q(Uri uri, com.fyber.inneractive.sdk.player.exoplayer2.upstream.g gVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.c cVar, int i5, Handler handler, b0 b0Var) {
        this.f30229a = uri;
        this.f30230b = gVar;
        this.f30231c = cVar;
        this.f30232d = i5;
        this.f30233e = handler;
        this.f30234f = b0Var;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.u
    public final void a() {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.u
    public final void b() {
        this.f30236h = null;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.u
    public final void a(t tVar) {
        this.f30236h = tVar;
        tVar.a(new x(-9223372036854775807L, -9223372036854775807L, 0L, 0L, false, false), null);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.u
    public final s a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.upstream.b bVar, long j11) {
        if (i5 == 0) {
            return new p(this.f30229a, this.f30230b.a(), this.f30231c.a(), this.f30232d, this.f30233e, this.f30234f, this, bVar);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.u
    public final void a(s sVar) {
        p pVar = (p) sVar;
        pVar.f30213i.a(new k(pVar, pVar.f30214j));
        pVar.n.removeCallbacksAndMessages(null);
        pVar.G = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.t
    public final void a(x xVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.g gVar) {
        boolean z11 = xVar.a(0, this.f30235g, false).f30500d != -9223372036854775807L;
        if (!this.f30237i || z11) {
            this.f30237i = z11;
            this.f30236h.a(xVar, null);
        }
    }
}
