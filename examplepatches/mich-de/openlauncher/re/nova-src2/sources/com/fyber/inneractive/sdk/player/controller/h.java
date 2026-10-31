package com.fyber.inneractive.sdk.player.controller;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class h implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f28911a;

    public h(i iVar) {
        this.f28911a = iVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        x xVar = this.f28911a.f28912a.f28925d;
        if (xVar != null) {
            z zVar = xVar.f28942a;
            zVar.getClass();
            IAlog.a("%s onTextureViewDestroyed", IAlog.a(zVar));
        }
    }
}
