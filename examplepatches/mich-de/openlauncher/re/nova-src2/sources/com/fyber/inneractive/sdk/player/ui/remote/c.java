package com.fyber.inneractive.sdk.player.ui.remote;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f30701a;

    public c(d dVar) {
        this.f30701a = dVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        IAlog.a("%s : remote UI failed task executed", "RemoteUIWebviewController");
        d dVar = this.f30701a;
        if (dVar.f30709h) {
            return;
        }
        dVar.a(com.fyber.inneractive.sdk.network.events.b.TEMPLATE_LOAD_TIMEOUT, "Loading remote UI timed out", true, null);
    }
}
