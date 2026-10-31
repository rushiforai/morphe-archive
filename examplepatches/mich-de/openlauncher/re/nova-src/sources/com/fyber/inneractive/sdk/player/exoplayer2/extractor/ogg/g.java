package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;
import java.io.EOFException;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: h, reason: collision with root package name */
    public static final int f29694h = z.a("OggS");

    /* renamed from: a, reason: collision with root package name */
    public int f29695a;

    /* renamed from: b, reason: collision with root package name */
    public long f29696b;

    /* renamed from: c, reason: collision with root package name */
    public int f29697c;

    /* renamed from: d, reason: collision with root package name */
    public int f29698d;

    /* renamed from: e, reason: collision with root package name */
    public int f29699e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f29700f = new int[255];

    /* renamed from: g, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29701g = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(255);

    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, boolean z11) throws com.fyber.inneractive.sdk.player.exoplayer2.r, EOFException {
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = this.f29701g;
        nVar.f30462b = 0;
        nVar.f30463c = 0;
        this.f29695a = 0;
        this.f29696b = 0L;
        this.f29697c = 0;
        this.f29698d = 0;
        this.f29699e = 0;
        long j11 = bVar.f29132b;
        if ((j11 != -1 && j11 - (bVar.f29133c + bVar.f29135e) < 27) || !bVar.a(nVar.f30461a, 0, 27, true)) {
            if (z11) {
                return false;
            }
            throw new EOFException();
        }
        if (this.f29701g.k() != f29694h) {
            if (z11) {
                return false;
            }
            throw new com.fyber.inneractive.sdk.player.exoplayer2.r("expected OggS capture pattern at begin of page");
        }
        if (this.f29701g.j() != 0) {
            if (z11) {
                return false;
            }
            throw new com.fyber.inneractive.sdk.player.exoplayer2.r("unsupported bit stream revision");
        }
        this.f29695a = this.f29701g.j();
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.f29701g;
        byte[] bArr = nVar2.f30461a;
        int i5 = nVar2.f30462b;
        nVar2.f30462b = i5 + 1;
        nVar2.f30462b = i5 + 2;
        nVar2.f30462b = i5 + 3;
        long j12 = (bArr[i5] & 255) | ((bArr[r4] & 255) << 8) | ((bArr[r9] & 255) << 16);
        nVar2.f30462b = i5 + 4;
        long j13 = j12 | ((bArr[r10] & 255) << 24);
        nVar2.f30462b = i5 + 5;
        long j14 = j13 | ((bArr[r9] & 255) << 32);
        nVar2.f30462b = i5 + 6;
        long j15 = j14 | ((bArr[r10] & 255) << 40);
        nVar2.f30462b = i5 + 7;
        nVar2.f30462b = i5 + 8;
        this.f29696b = j15 | ((bArr[r9] & 255) << 48) | ((255 & bArr[r10]) << 56);
        nVar2.e();
        this.f29701g.e();
        this.f29701g.e();
        int iJ = this.f29701g.j();
        this.f29697c = iJ;
        this.f29698d = iJ + 27;
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = this.f29701g;
        nVar3.f30462b = 0;
        nVar3.f30463c = 0;
        bVar.a(nVar3.f30461a, 0, iJ, false);
        for (int i11 = 0; i11 < this.f29697c; i11++) {
            this.f29700f[i11] = this.f29701g.j();
            this.f29699e += this.f29700f[i11];
        }
        return true;
    }
}
