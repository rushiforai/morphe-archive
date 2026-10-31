package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

import b.u4;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public final class d extends l {
    public com.fyber.inneractive.sdk.player.exoplayer2.util.f n;
    public c o;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final void a(boolean z11) {
        super.a(z11);
        if (z11) {
            this.n = null;
            this.o = null;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        int i5;
        int i11;
        int i12;
        byte[] bArr = nVar.f30461a;
        int i13 = -1;
        if (bArr[0] != -1) {
            return -1L;
        }
        int i14 = (bArr[2] & 255) >> 4;
        switch (i14) {
            case 1:
                i13 = 192;
                return i13;
            case 2:
            case 3:
            case 4:
            case 5:
                i5 = i14 - 2;
                i11 = 576;
                i13 = i11 << i5;
                return i13;
            case 6:
            case 7:
                nVar.e(nVar.f30462b + 4);
                long j11 = nVar.f30461a[nVar.f30462b];
                int i15 = 7;
                while (true) {
                    if (i15 >= 0) {
                        if (((1 << i15) & j11) != 0) {
                            i15--;
                        } else if (i15 < 6) {
                            j11 &= r8 - 1;
                            i12 = 7 - i15;
                        } else if (i15 == 7) {
                            i12 = 1;
                        }
                    }
                }
                i12 = 0;
                if (i12 != 0) {
                    for (int i16 = 1; i16 < i12; i16++) {
                        if ((nVar.f30461a[nVar.f30462b + i16] & 192) != 128) {
                            throw new NumberFormatException(u4.g(j11, "Invalid UTF-8 sequence continuation byte: "));
                        }
                        j11 = (j11 << 6) | (r8 & 63);
                    }
                    nVar.f30462b += i12;
                    int iJ = i14 == 6 ? nVar.j() : nVar.o();
                    nVar.e(0);
                    i13 = iJ + 1;
                    return i13;
                }
                throw new NumberFormatException(u4.g(j11, "Invalid UTF-8 sequence first byte: "));
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                i5 = i14 - 8;
                i11 = 256;
                i13 = i11 << i5;
                return i13;
            default:
                return i13;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.l
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar, long j11, j jVar) {
        byte[] bArr = nVar.f30461a;
        if (this.n == null) {
            this.n = new com.fyber.inneractive.sdk.player.exoplayer2.util.f(bArr);
            byte[] bArrCopyOfRange = Arrays.copyOfRange(bArr, 9, nVar.f30463c);
            bArrCopyOfRange[4] = -128;
            List listSingletonList = Collections.singletonList(bArrCopyOfRange);
            com.fyber.inneractive.sdk.player.exoplayer2.util.f fVar = this.n;
            int i5 = fVar.f30437c;
            int i11 = fVar.f30435a;
            jVar.f29703a = com.fyber.inneractive.sdk.player.exoplayer2.o.a(null, "audio/flac", -1, i5 * i11, fVar.f30436b, i11, listSingletonList, null, null);
        } else {
            byte b11 = bArr[0];
            if ((b11 & AbstractJsonLexerKt.TC_INVALID) == 3) {
                c cVar = new c(this);
                this.o = cVar;
                nVar.e(nVar.f30462b + 1);
                int iL = nVar.l() / 18;
                cVar.f29683a = new long[iL];
                cVar.f29684b = new long[iL];
                for (int i12 = 0; i12 < iL; i12++) {
                    cVar.f29683a[i12] = nVar.g();
                    cVar.f29684b[i12] = nVar.g();
                    nVar.e(nVar.f30462b + 2);
                }
            } else if (b11 == -1) {
                c cVar2 = this.o;
                if (cVar2 != null) {
                    cVar2.f29685c = j11;
                    jVar.f29704b = cVar2;
                }
                return false;
            }
        }
        return true;
    }
}
