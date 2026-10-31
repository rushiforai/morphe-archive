package com.fyber.inneractive.sdk.player.exoplayer2.extractor.wav;

import android.util.Log;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.i;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.j;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.o;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.q;
import com.fyber.inneractive.sdk.player.exoplayer2.extractor.r;
import com.fyber.inneractive.sdk.player.exoplayer2.util.n;
import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.EOFException;

/* loaded from: classes3.dex */
public final class a implements i, q {

    /* renamed from: a, reason: collision with root package name */
    public j f29970a;

    /* renamed from: b, reason: collision with root package name */
    public r f29971b;

    /* renamed from: c, reason: collision with root package name */
    public b f29972c;

    /* renamed from: d, reason: collision with root package name */
    public int f29973d;

    /* renamed from: e, reason: collision with root package name */
    public int f29974e;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return ((this.f29972c.f29982h / r0.f29978d) * 1000000) / r0.f29976b;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        return d.a(bVar) != null;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(j jVar) {
        this.f29970a = jVar;
        this.f29971b = jVar.a(0, 1);
        this.f29972c = null;
        jVar.b();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        this.f29974e = 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, o oVar) throws InterruptedException, com.fyber.inneractive.sdk.player.exoplayer2.r, EOFException {
        if (this.f29972c == null) {
            b bVarA = d.a(bVar);
            this.f29972c = bVarA;
            if (bVarA != null) {
                int i5 = bVarA.f29976b;
                int i11 = bVarA.f29979e * i5;
                int i12 = bVarA.f29975a;
                this.f29971b.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(null, "audio/raw", i11 * i12, SQLiteDatabase.OPEN_NOMUTEX, i12, i5, bVarA.f29980f, -1, -1, null, null, 0, null, null));
                this.f29973d = this.f29972c.f29978d;
            } else {
                throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Unsupported or unrecognized wav header.");
            }
        }
        b bVar2 = this.f29972c;
        if (bVar2.f29981g == 0 || bVar2.f29982h == 0) {
            bVar.f29135e = 0;
            n nVar = new n(8);
            c cVarA = c.a(bVar, nVar);
            while (cVarA.f29983a != z.a("data")) {
                Log.w("WavHeaderReader", "Ignoring unknown WAV chunk: " + cVarA.f29983a);
                long j11 = cVarA.f29984b + 8;
                if (cVarA.f29983a == z.a("RIFF")) {
                    j11 = 12;
                }
                if (j11 <= 2147483647L) {
                    bVar.a((int) j11);
                    cVarA = c.a(bVar, nVar);
                } else {
                    throw new com.fyber.inneractive.sdk.player.exoplayer2.r("Chunk is too large (~2GB+) to skip; id: " + cVarA.f29983a);
                }
            }
            bVar.a(8);
            long j12 = bVar.f29133c;
            long j13 = cVarA.f29984b;
            bVar2.f29981g = j12;
            bVar2.f29982h = j13;
            this.f29970a.a(this);
        }
        int iA = this.f29971b.a(bVar, SQLiteDatabase.OPEN_NOMUTEX - this.f29974e, true);
        if (iA != -1) {
            this.f29974e += iA;
        }
        int i13 = this.f29974e;
        int i14 = this.f29973d;
        int i15 = i13 / i14;
        if (i15 > 0) {
            long j14 = ((bVar.f29133c - i13) * 1000000) / this.f29972c.f29977c;
            int i16 = i15 * i14;
            int i17 = i13 - i16;
            this.f29974e = i17;
            this.f29971b.a(j14, 1, i16, i17, null);
        }
        return iA == -1 ? -1 : 0;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        b bVar = this.f29972c;
        long j12 = (j11 * bVar.f29977c) / 1000000;
        long j13 = bVar.f29978d;
        return Math.min((j12 / j13) * j13, bVar.f29982h - j13) + bVar.f29981g;
    }
}
