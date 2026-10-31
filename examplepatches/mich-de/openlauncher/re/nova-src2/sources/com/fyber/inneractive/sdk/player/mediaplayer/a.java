package com.fyber.inneractive.sdk.player.mediaplayer;

import b.c0;
import com.fyber.inneractive.sdk.player.controller.q;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f30600a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f30601b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p f30602c;

    public a(p pVar, int i5, int i11) {
        this.f30602c = pVar;
        this.f30600a = i5;
        this.f30601b = i11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f30602c.f30627i != null) {
            Locale locale = Locale.ENGLISH;
            String strG = c0.g(this.f30600a, this.f30601b, "Player Error: ", ", ");
            n nVar = this.f30602c.f30627i;
            o oVar = new o(strG);
            q qVar = (q) nVar;
            qVar.a(com.fyber.inneractive.sdk.player.enums.b.Error);
            IAlog.a("%sonPlayerError called with: %s for onPlayerError", IAlog.a(qVar), oVar);
            qVar.f28930i.post(new com.fyber.inneractive.sdk.player.controller.j(qVar, oVar));
            qVar.k();
        }
    }
}
