package com.fyber.inneractive.sdk.player.exoplayer2.source;

import com.fyber.inneractive.sdk.player.controller.b0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f30156a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f30157b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f30158c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f f30159d;

    public b(f fVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar, int i5, int i11, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, int i12, Object obj, long j11, long j12, long j13, long j14, long j15) {
        this.f30159d = fVar;
        this.f30156a = obj;
        this.f30157b = j11;
        this.f30158c = j12;
    }

    @Override // java.lang.Runnable
    public final void run() {
        b0 b0Var = this.f30159d.f30182b;
        com.fyber.inneractive.sdk.player.exoplayer2.b.a(this.f30157b);
        f.a(this.f30159d, this.f30158c);
        IAlog.a("%s AdaptiveMediaSourceEventListener onLoadCompleted called.", b0Var.a());
    }
}
