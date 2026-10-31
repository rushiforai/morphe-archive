package com.fyber.inneractive.sdk.player.mediaplayer;

import android.view.Surface;

/* loaded from: classes3.dex */
public final class f implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Surface f30609a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f30610b;

    public f(p pVar, Surface surface) {
        this.f30610b = pVar;
        this.f30609a = surface;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p.a(this.f30610b, this.f30609a);
    }
}
