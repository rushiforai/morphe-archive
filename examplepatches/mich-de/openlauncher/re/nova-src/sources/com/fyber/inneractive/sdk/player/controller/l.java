package com.fyber.inneractive.sdk.player.controller;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class l implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f28917a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q f28918b;

    public l(q qVar, int i5) {
        this.f28918b = qVar;
        this.f28917a = i5;
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            Iterator it = this.f28918b.f28924c.iterator();
            while (it.hasNext()) {
                ((o) it.next()).a(this.f28917a);
            }
        } catch (Exception e3) {
            if (IAlog.f31163a <= 3) {
                q qVar = this.f28918b;
                qVar.getClass();
                IAlog.a("%sonPlayerProgress callback threw an exception!", e3, IAlog.a(qVar));
            }
        }
    }
}
