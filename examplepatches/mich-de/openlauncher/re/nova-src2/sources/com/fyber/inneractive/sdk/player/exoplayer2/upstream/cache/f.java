package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import com.fyber.inneractive.sdk.player.exoplayer2.upstream.o;
import com.fyber.inneractive.sdk.player.exoplayer2.upstream.t;

/* loaded from: classes3.dex */
public final class f implements com.fyber.inneractive.sdk.player.exoplayer2.upstream.g {

    /* renamed from: a, reason: collision with root package name */
    public final l f30303a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.g f30304b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.g f30305c;

    /* renamed from: d, reason: collision with root package name */
    public final d f30306d;

    public f(l lVar, o oVar) {
        t tVar = new t();
        d dVar = new d(lVar);
        this.f30303a = lVar;
        this.f30304b = oVar;
        this.f30305c = tVar;
        this.f30306d = dVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.g
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h a() {
        l lVar = this.f30303a;
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVarA = this.f30304b.a();
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVarA2 = this.f30305c.a();
        d dVar = this.f30306d;
        return new e(lVar, hVarA, hVarA2, dVar != null ? new c(dVar.f30287a) : null);
    }
}
