package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.net.Uri;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class e0 implements h {

    /* renamed from: a, reason: collision with root package name */
    public final h f30349a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.c f30350b;

    public e0(h hVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.c cVar) {
        hVar.getClass();
        this.f30349a = hVar;
        cVar.getClass();
        this.f30350b = cVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final long a(k kVar) throws com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.b {
        long jA = this.f30349a.a(kVar);
        if (kVar.f30368d == -1 && jA != -1) {
            kVar = new k(kVar.f30365a, kVar.f30366b, kVar.f30367c, jA, kVar.f30369e, kVar.f30370f);
        }
        com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.c cVar = this.f30350b;
        cVar.getClass();
        if (kVar.f30368d == -1 && (kVar.f30370f & 2) != 2) {
            cVar.f30280d = null;
            return jA;
        }
        cVar.f30280d = kVar;
        cVar.f30285i = 0L;
        try {
            cVar.b();
            return jA;
        } catch (IOException e3) {
            throw new com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.b(e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final void close() throws com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.b {
        try {
            this.f30349a.close();
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.c cVar = this.f30350b;
            if (cVar.f30280d == null) {
                return;
            }
            try {
                cVar.a();
            } catch (IOException e3) {
                throw new com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.b(e3);
            }
        } catch (Throwable th2) {
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.c cVar2 = this.f30350b;
            if (cVar2.f30280d != null) {
                try {
                    cVar2.a();
                } catch (IOException e11) {
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.b(e11);
                }
            }
            throw th2;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f30349a.read(bArr, i5, i11);
        if (i12 > 0) {
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.c cVar = this.f30350b;
            if (cVar.f30280d != null) {
                int i13 = 0;
                while (i13 < i12) {
                    try {
                        if (cVar.f30284h == cVar.f30278b) {
                            cVar.a();
                            cVar.b();
                        }
                        int iMin = (int) Math.min(i12 - i13, cVar.f30278b - cVar.f30284h);
                        cVar.f30282f.write(bArr, i5 + i13, iMin);
                        i13 += iMin;
                        long j11 = iMin;
                        cVar.f30284h += j11;
                        cVar.f30285i += j11;
                    } catch (IOException e3) {
                        throw new com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache.b(e3);
                    }
                }
            }
        }
        return i12;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.upstream.h
    public final Uri a() {
        return this.f30349a.a();
    }
}
