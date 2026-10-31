package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.content.Context;

/* loaded from: classes3.dex */
public final class o implements g {

    /* renamed from: a, reason: collision with root package name */
    public final Context f30387a;

    /* renamed from: b, reason: collision with root package name */
    public final m f30388b;

    /* renamed from: c, reason: collision with root package name */
    public final g f30389c;

    public o(Context context, m mVar, q qVar) {
        this.f30387a = context.getApplicationContext();
        this.f30388b = mVar;
        this.f30389c = qVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.g
    public final h a() {
        return new n(this.f30387a, this.f30388b, this.f30389c.a());
    }
}
