package com.fyber.inneractive.sdk.player.exoplayer2.source;

import com.fyber.inneractive.sdk.player.controller.b0;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class l implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IOException f30188a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f30189b;

    public l(p pVar, IOException iOException) {
        this.f30189b = pVar;
        this.f30188a = iOException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        b0 b0Var = this.f30189b.f30209e;
        IOException iOException = this.f30188a;
        if (((com.fyber.inneractive.sdk.player.controller.f) b0Var.f28885a.get()) != null) {
            iOException.getCause();
        }
    }
}
