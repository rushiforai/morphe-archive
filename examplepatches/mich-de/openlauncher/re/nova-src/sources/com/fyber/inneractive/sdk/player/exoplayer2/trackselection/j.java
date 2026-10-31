package com.fyber.inneractive.sdk.player.exoplayer2.trackselection;

import com.fyber.inneractive.sdk.player.exoplayer2.source.z;
import com.fyber.inneractive.sdk.player.exoplayer2.t;

/* loaded from: classes3.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final z f30268a;

    /* renamed from: b, reason: collision with root package name */
    public final h f30269b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f30270c;

    /* renamed from: d, reason: collision with root package name */
    public final t[] f30271d;

    public j(z zVar, h hVar, f fVar, t[] tVarArr) {
        this.f30268a = zVar;
        this.f30269b = hVar;
        this.f30270c = fVar;
        this.f30271d = tVarArr;
    }

    public final boolean a(j jVar, int i5) {
        return jVar != null && com.fyber.inneractive.sdk.player.exoplayer2.util.z.a(this.f30269b.f30266b[i5], jVar.f30269b.f30266b[i5]) && com.fyber.inneractive.sdk.player.exoplayer2.util.z.a(this.f30271d[i5], jVar.f30271d[i5]);
    }
}
