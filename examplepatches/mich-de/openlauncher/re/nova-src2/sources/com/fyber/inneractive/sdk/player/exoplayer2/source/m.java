package com.fyber.inneractive.sdk.player.exoplayer2.source;

import android.net.Uri;

/* loaded from: classes3.dex */
public final class m implements com.fyber.inneractive.sdk.player.exoplayer2.upstream.z {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f30190a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.h f30191b;

    /* renamed from: c, reason: collision with root package name */
    public final n f30192c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.e f30193d;

    /* renamed from: e, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.o f30194e;

    /* renamed from: f, reason: collision with root package name */
    public volatile boolean f30195f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f30196g;

    /* renamed from: h, reason: collision with root package name */
    public long f30197h;

    /* renamed from: i, reason: collision with root package name */
    public long f30198i;

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ p f30199j;

    public m(p pVar, Uri uri, com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar, n nVar, com.fyber.inneractive.sdk.player.exoplayer2.util.e eVar) {
        this.f30199j = pVar;
        uri.getClass();
        this.f30190a = uri;
        hVar.getClass();
        this.f30191b = hVar;
        nVar.getClass();
        this.f30192c = nVar;
        this.f30193d = eVar;
        this.f30194e = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.o();
        this.f30196g = true;
        this.f30198i = -1L;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final boolean a() {
        return this.f30195f;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final void b() {
        this.f30195f = true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.z
    public final void load() throws Throwable {
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar;
        int iA = 0;
        while (iA == 0 && !this.f30195f) {
            try {
                long j11 = this.f30194e.f29669a;
                long jA = this.f30191b.a(new com.fyber.inneractive.sdk.player.exoplayer2.upstream.k(this.f30190a, j11, j11, -1L, this.f30199j.f30212h, 0));
                this.f30198i = jA;
                if (jA != -1) {
                    this.f30198i = jA + j11;
                }
                com.fyber.inneractive.sdk.player.exoplayer2.upstream.h hVar = this.f30191b;
                bVar = new com.fyber.inneractive.sdk.player.exoplayer2.extractor.b(hVar, j11, this.f30198i);
                try {
                    n nVar = this.f30192c;
                    hVar.a();
                    com.fyber.inneractive.sdk.player.exoplayer2.extractor.i iVarA = nVar.a(bVar);
                    if (this.f30196g) {
                        iVarA.a(j11, this.f30197h);
                        this.f30196g = false;
                    }
                    while (iA == 0 && !this.f30195f) {
                        com.fyber.inneractive.sdk.player.exoplayer2.util.e eVar = this.f30193d;
                        synchronized (eVar) {
                            while (!eVar.f30434a) {
                                eVar.wait();
                            }
                        }
                        iA = iVarA.a(bVar, this.f30194e);
                        long j12 = bVar.f29133c;
                        if (j12 > 1048576 + j11) {
                            this.f30193d.a();
                            p pVar = this.f30199j;
                            pVar.n.post(pVar.f30217m);
                            j11 = j12;
                        }
                    }
                    if (iA == 1) {
                        iA = 0;
                    } else {
                        this.f30194e.f29669a = bVar.f29133c;
                    }
                    com.fyber.inneractive.sdk.player.exoplayer2.util.z.a(this.f30191b);
                } catch (Throwable th2) {
                    th = th2;
                    if (iA != 1 && bVar != null) {
                        this.f30194e.f29669a = bVar.f29133c;
                    }
                    com.fyber.inneractive.sdk.player.exoplayer2.util.z.a(this.f30191b);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                bVar = null;
            }
        }
    }
}
