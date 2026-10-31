package com.fyber.inneractive.sdk.player.ui;

/* loaded from: classes3.dex */
public final class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f30678a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f30679b;

    public d(e eVar, boolean z11) {
        this.f30679b = eVar;
        this.f30678a = z11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f30678a == this.f30679b.hasWindowFocus()) {
            this.f30679b.f();
        }
    }
}
