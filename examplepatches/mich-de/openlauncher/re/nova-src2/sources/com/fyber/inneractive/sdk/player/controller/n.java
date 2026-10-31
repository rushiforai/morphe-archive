package com.fyber.inneractive.sdk.player.controller;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class n implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ q f28921a;

    public n(q qVar) {
        this.f28921a = qVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            Iterator it = this.f28921a.f28923b.iterator();
            while (it.hasNext()) {
                ((p) it.next()).d();
            }
        } catch (Exception e3) {
            if (IAlog.f31163a <= 3) {
                q qVar = this.f28921a;
                qVar.getClass();
                IAlog.a("%sonDrawnToSurface callback threw an exception!", e3, IAlog.a(qVar));
            }
        }
    }
}
