package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.exoplayer.offline.DownloadRequest;

/* loaded from: assets/audience_network/classes.dex */
public final class TW {
    public final C1262Ts A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final long A04;
    public final long A05;
    public final long A06;
    public final DownloadRequest A07;

    public TW(DownloadRequest downloadRequest, int i5, long j11, long j12, long j13, int i11, int i12) {
        this(downloadRequest, i5, j11, j12, j13, i11, i12, new C1262Ts());
    }

    public TW(DownloadRequest downloadRequest, int i5, long j11, long j12, long j13, int i11, int i12, C1262Ts c1262Ts) {
        AbstractC1062Ln.A01(c1262Ts);
        AbstractC1062Ln.A07((i12 == 0) == (i5 != 4));
        if (i11 != 0) {
            AbstractC1062Ln.A07((i5 == 2 || i5 == 0) ? false : true);
        }
        this.A07 = downloadRequest;
        this.A02 = i5;
        this.A05 = j11;
        this.A06 = j12;
        this.A04 = j13;
        this.A03 = i11;
        this.A01 = i12;
        this.A00 = c1262Ts;
    }

    public final float A00() {
        return this.A00.A00;
    }

    public final long A01() {
        return this.A00.A01;
    }

    public final boolean A02() {
        return this.A02 == 3 || this.A02 == 4;
    }
}
