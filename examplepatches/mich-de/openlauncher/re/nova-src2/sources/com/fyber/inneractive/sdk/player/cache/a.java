package com.fyber.inneractive.sdk.player.cache;

import java.util.concurrent.Callable;

/* loaded from: classes.dex */
public final class a implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g f28839a;

    public a(g gVar) {
        this.f28839a = gVar;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        synchronized (this.f28839a) {
            try {
                g gVar = this.f28839a;
                if (gVar.f28860i == null) {
                    return null;
                }
                gVar.d();
                g gVar2 = this.f28839a;
                int i5 = gVar2.f28862k;
                if (i5 >= 2000 && i5 >= gVar2.f28861j.size()) {
                    this.f28839a.c();
                    this.f28839a.f28862k = 0;
                }
                return null;
            } finally {
            }
        }
    }
}
