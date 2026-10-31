package com.fyber.inneractive.sdk.player.ui.remote;

import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.r;

/* loaded from: classes3.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f30700a;

    public b(d dVar) {
        this.f30700a = dVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        IAlog.a("%s : remote UI load timeout task executed", "RemoteUIWebviewController");
        d dVar = this.f30700a;
        dVar.f30708g = true;
        IAlog.a("%s : UI load timed out", "RemoteUIWebviewController");
        r.f31216b.post(dVar.f30713l);
    }
}
