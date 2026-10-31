package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

import java.io.EOFException;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final g f29689a = new g();

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29690b = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(0, new byte[65025]);

    /* renamed from: c, reason: collision with root package name */
    public int f29691c = -1;

    /* renamed from: d, reason: collision with root package name */
    public int f29692d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f29693e;

    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, EOFException {
        int i5;
        int i11;
        int i12;
        if (this.f29693e) {
            this.f29693e = false;
            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = this.f29690b;
            nVar.f30462b = 0;
            nVar.f30463c = 0;
        }
        while (true) {
            if (this.f29693e) {
                return true;
            }
            if (this.f29691c < 0) {
                if (!this.f29689a.a(bVar, true)) {
                    return false;
                }
                g gVar = this.f29689a;
                int i13 = gVar.f29698d;
                if ((gVar.f29695a & 1) == 1 && this.f29690b.f30463c == 0) {
                    this.f29692d = 0;
                    int i14 = 0;
                    do {
                        int i15 = this.f29692d;
                        g gVar2 = this.f29689a;
                        if (i15 >= gVar2.f29697c) {
                            break;
                        }
                        int[] iArr = gVar2.f29700f;
                        this.f29692d = i15 + 1;
                        i12 = iArr[i15];
                        i14 += i12;
                    } while (i12 == 255);
                    i13 += i14;
                    i11 = this.f29692d;
                } else {
                    i11 = 0;
                }
                bVar.a(i13);
                this.f29691c = i11;
            }
            int i16 = this.f29691c;
            this.f29692d = 0;
            int i17 = 0;
            do {
                int i18 = this.f29692d;
                int i19 = i16 + i18;
                g gVar3 = this.f29689a;
                if (i19 >= gVar3.f29697c) {
                    break;
                }
                int[] iArr2 = gVar3.f29700f;
                this.f29692d = i18 + 1;
                i5 = iArr2[i19];
                i17 += i5;
            } while (i5 == 255);
            int i21 = this.f29691c + this.f29692d;
            if (i17 > 0) {
                int iA = this.f29690b.a();
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.f29690b;
                int i22 = nVar2.f30463c + i17;
                if (iA < i22) {
                    nVar2.f30461a = Arrays.copyOf(nVar2.f30461a, i22);
                }
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar3 = this.f29690b;
                bVar.b(nVar3.f30461a, nVar3.f30463c, i17, false);
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar4 = this.f29690b;
                nVar4.d(nVar4.f30463c + i17);
                this.f29693e = this.f29689a.f29700f[i21 + (-1)] != 255;
            }
            if (i21 == this.f29689a.f29697c) {
                i21 = -1;
            }
            this.f29691c = i21;
        }
    }

    public final void a() {
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = this.f29690b;
        byte[] bArr = nVar.f30461a;
        if (bArr.length == 65025) {
            return;
        }
        nVar.f30461a = Arrays.copyOf(bArr, Math.max(65025, nVar.f30463c));
    }
}
