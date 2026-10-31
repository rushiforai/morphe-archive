package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

/* loaded from: classes3.dex */
public final class q implements g {

    /* renamed from: b, reason: collision with root package name */
    public final String f30405b;

    /* renamed from: c, reason: collision with root package name */
    public final m f30406c;

    /* renamed from: a, reason: collision with root package name */
    public final w f30404a = new w();

    /* renamed from: d, reason: collision with root package name */
    public final int f30407d = 2000;

    /* renamed from: e, reason: collision with root package name */
    public final int f30408e = 2000;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f30409f = true;

    public q(String str, m mVar) {
        this.f30405b = str;
        this.f30406c = mVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.g
    public final h a() {
        return new p(this.f30405b, this.f30406c, this.f30407d, this.f30408e, this.f30409f, this.f30404a);
    }
}
