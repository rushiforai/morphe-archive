package com.fyber.inneractive.sdk.player.mediaplayer;

import com.fyber.inneractive.sdk.player.controller.q;

/* loaded from: classes3.dex */
public final class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.player.enums.b f30605a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f30606b;

    public d(p pVar, com.fyber.inneractive.sdk.player.enums.b bVar) {
        this.f30606b = pVar;
        this.f30605a = bVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        n nVar = this.f30606b.f30627i;
        if (nVar != null) {
            ((q) nVar).a(this.f30605a);
        }
    }
}
