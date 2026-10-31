package com.fyber.inneractive.sdk.player;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class g implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h f30593a;

    public g(h hVar) {
        this.f30593a = hVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        h hVar = this.f30593a;
        hVar.getClass();
        IAlog.a("player progress monitor: run started", new Object[0]);
        int iB = hVar.f30594a.b();
        if (!hVar.f30597d) {
            IAlog.a("run: 2 seconds passed? played for %d since last play started", Integer.valueOf(iB));
            if (iB >= 2000) {
                IAlog.a("run: setting played 2 seconds flag", new Object[0]);
                hVar.f30597d = true;
            }
        }
        hVar.f30594a.a(iB);
    }
}
