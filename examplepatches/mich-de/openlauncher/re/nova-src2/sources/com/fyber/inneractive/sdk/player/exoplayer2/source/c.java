package com.fyber.inneractive.sdk.player.exoplayer2.source;

import com.fyber.inneractive.sdk.player.controller.b0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f30160a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f30161b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f30162c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f f30163d;

    public c(f fVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar, int i5, int i11, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, int i12, Object obj, long j11, long j12, long j13, long j14, long j15) {
        this.f30163d = fVar;
        this.f30160a = obj;
        this.f30161b = j11;
        this.f30162c = j12;
    }

    @Override // java.lang.Runnable
    public final void run() {
        b0 b0Var = this.f30163d.f30182b;
        com.fyber.inneractive.sdk.player.exoplayer2.b.a(this.f30161b);
        f.a(this.f30163d, this.f30162c);
        IAlog.a("%s AdaptiveMediaSourceEventListener onLoadCanceled called.", b0Var.a());
    }
}
