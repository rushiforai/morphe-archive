package com.fyber.inneractive.sdk.player.controller;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class k implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ boolean f28915a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q f28916b;

    public k(f fVar, boolean z11) {
        this.f28916b = fVar;
        this.f28915a = z11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        q qVar = this.f28916b;
        if (qVar.f28928g) {
            return;
        }
        try {
            Iterator it = qVar.f28923b.iterator();
            while (it.hasNext()) {
                ((p) it.next()).c(this.f28915a);
            }
        } catch (Exception e3) {
            if (IAlog.f31163a <= 3) {
                q qVar2 = this.f28916b;
                qVar2.getClass();
                IAlog.a("%sonPlayerError callback threw an exception!", e3, IAlog.a(qVar2));
            }
        }
    }
}
