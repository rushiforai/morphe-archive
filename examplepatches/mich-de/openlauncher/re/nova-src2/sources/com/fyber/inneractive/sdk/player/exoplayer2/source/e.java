package com.fyber.inneractive.sdk.player.exoplayer2.source;

import com.fyber.inneractive.sdk.player.controller.b0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f30178a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f30179b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ f f30180c;

    public e(f fVar, int i5, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, int i11, Object obj, long j11) {
        this.f30180c = fVar;
        this.f30178a = obj;
        this.f30179b = j11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        b0 b0Var = this.f30180c.f30182b;
        com.fyber.inneractive.sdk.player.exoplayer2.b.a(this.f30179b);
        IAlog.a("%s AdaptiveMediaSourceEventListener onDownstreamFormatChanged called.", b0Var.a());
    }
}
