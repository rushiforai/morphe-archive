package com.fyber.inneractive.sdk.renderers;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class p implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ r f31010a;

    public p(r rVar) {
        this.f31010a = rVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        r rVar = this.f31010a;
        if (rVar.f31018t != null) {
            IAlog.a("%sIdle state reached!", IAlog.a(rVar));
            com.fyber.inneractive.sdk.ui.controller.b bVar = this.f31010a.f30983k;
            if (bVar != null) {
                ((com.fyber.inneractive.sdk.player.controller.s) bVar).h(true);
            }
            this.f31010a.f31018t = null;
        }
    }
}
