package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes3.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public final ExecutorService f30274a;

    /* renamed from: b, reason: collision with root package name */
    public y f30275b;

    /* renamed from: c, reason: collision with root package name */
    public IOException f30276c;

    public b0(String str) {
        int i5 = com.fyber.inneractive.sdk.player.exoplayer2.util.z.f30489a;
        this.f30274a = Executors.newSingleThreadExecutor(new com.fyber.inneractive.sdk.player.exoplayer2.util.y(str));
    }

    public final boolean a() {
        return this.f30275b != null;
    }

    public final void b() throws IOException {
        IOException iOException = this.f30276c;
        if (iOException != null) {
            throw iOException;
        }
        y yVar = this.f30275b;
        if (yVar != null) {
            int i5 = yVar.f30420c;
            IOException iOException2 = yVar.f30422e;
            if (iOException2 != null && yVar.f30423f > i5) {
                throw iOException2;
            }
        }
    }

    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.source.k kVar) {
        y yVar = this.f30275b;
        if (yVar != null) {
            yVar.a(true);
        }
        if (kVar != null) {
            this.f30274a.execute(kVar);
        }
        this.f30274a.shutdown();
    }
}
