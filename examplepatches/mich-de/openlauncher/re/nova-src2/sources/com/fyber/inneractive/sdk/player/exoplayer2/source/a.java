package com.fyber.inneractive.sdk.player.exoplayer2.source;

import com.fyber.inneractive.sdk.player.controller.b0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f30152a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f30153b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f30154c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f f30155d;

    public a(f fVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar, int i5, int i11, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, int i12, Object obj, long j11, long j12, long j13) {
        this.f30155d = fVar;
        this.f30152a = obj;
        this.f30153b = j11;
        this.f30154c = j12;
    }

    @Override // java.lang.Runnable
    public final void run() {
        b0 b0Var = this.f30155d.f30182b;
        com.fyber.inneractive.sdk.player.exoplayer2.b.a(this.f30153b);
        f.a(this.f30155d, this.f30154c);
        IAlog.a("%s AdaptiveMediaSourceEventListener onLoadStarted called.", b0Var.a());
    }
}
