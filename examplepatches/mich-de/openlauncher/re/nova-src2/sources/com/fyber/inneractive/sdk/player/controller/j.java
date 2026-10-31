package com.fyber.inneractive.sdk.player.controller;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Exception f28913a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q f28914b;

    public j(q qVar, com.fyber.inneractive.sdk.player.mediaplayer.o oVar) {
        this.f28914b = qVar;
        this.f28913a = oVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        q qVar = this.f28914b;
        if (qVar.f28928g) {
            return;
        }
        try {
            Iterator it = qVar.f28923b.iterator();
            while (it.hasNext()) {
                ((p) it.next()).a((com.fyber.inneractive.sdk.player.mediaplayer.o) this.f28913a);
            }
        } catch (Exception e3) {
            if (IAlog.f31163a <= 3) {
                q qVar2 = this.f28914b;
                qVar2.getClass();
                IAlog.a("%sonPlayerError callback threw an exception!", e3, IAlog.a(qVar2));
            }
        }
    }
}
