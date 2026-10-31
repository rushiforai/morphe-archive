package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mkv;

import java.io.EOFException;

/* loaded from: classes3.dex */
public final class g {

    /* renamed from: d, reason: collision with root package name */
    public static final long[] f29433d = {128, 64, 32, 16, 8, 4, 2, 1};

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f29434a = new byte[8];

    /* renamed from: b, reason: collision with root package name */
    public int f29435b;

    /* renamed from: c, reason: collision with root package name */
    public int f29436c;

    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, boolean z11, boolean z12, int i5) throws InterruptedException, EOFException {
        int i11;
        if (this.f29435b == 0) {
            if (!bVar.b(this.f29434a, 0, 1, z11)) {
                return -1L;
            }
            int i12 = this.f29434a[0] & 255;
            int i13 = 0;
            while (true) {
                long[] jArr = f29433d;
                if (i13 >= 8) {
                    i11 = -1;
                    break;
                }
                if ((i12 & jArr[i13]) != 0) {
                    i11 = i13 + 1;
                    break;
                }
                i13++;
            }
            this.f29436c = i11;
            if (i11 == -1) {
                throw new IllegalStateException("No valid varint length mask found");
            }
            this.f29435b = 1;
        }
        int i14 = this.f29436c;
        if (i14 > i5) {
            this.f29435b = 0;
            return -2L;
        }
        if (i14 != 1) {
            bVar.b(this.f29434a, 1, i14 - 1, false);
        }
        this.f29435b = 0;
        return a(this.f29434a, this.f29436c, z12);
    }

    public static long a(byte[] bArr, int i5, boolean z11) {
        long j11 = bArr[0] & 255;
        if (z11) {
            j11 &= ~f29433d[i5 - 1];
        }
        for (int i11 = 1; i11 < i5; i11++) {
            j11 = (j11 << 8) | (bArr[i11] & 255);
        }
        return j11;
    }
}
