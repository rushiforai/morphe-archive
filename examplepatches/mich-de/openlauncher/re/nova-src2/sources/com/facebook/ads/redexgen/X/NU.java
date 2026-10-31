package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;
import java.util.Collections;
import java.util.Map;

@MetaExoPlayerCustomization
/* loaded from: assets/audience_network/classes.dex */
public final class NU {
    public static byte[] A0A;
    public int A00;
    public int A01;
    public long A02;
    public long A03;
    public long A04;
    public Uri A05;
    public C1667e7 A06;
    public String A07;
    public Map<String, String> A08;
    public byte[] A09;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 44);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A0A = new byte[]{64, 124, 113, 52, 97, 102, 125, 52, 121, 97, 103, 96, 52, 118, 113, 52, 103, 113, 96, 58};
    }

    public NU() {
        this.A01 = 1;
        this.A08 = Collections.emptyMap();
        this.A02 = -1L;
    }

    @MetaExoPlayerCustomization
    public NU(NX nx2) {
        this.A05 = nx2.A06;
        this.A04 = nx2.A05;
        this.A01 = nx2.A01;
        this.A09 = nx2.A0A;
        this.A08 = nx2.A09;
        this.A03 = nx2.A04;
        this.A02 = nx2.A03;
        this.A07 = nx2.A08;
        this.A00 = nx2.A00;
        this.A06 = nx2.A07;
    }

    public final NU A02(int i5) {
        this.A00 = i5;
        return this;
    }

    public final NU A03(long j11) {
        this.A02 = j11;
        return this;
    }

    public final NU A04(long j11) {
        this.A03 = j11;
        return this;
    }

    public final NU A05(long j11) {
        this.A04 = j11;
        return this;
    }

    public final NU A06(Uri uri) {
        this.A05 = uri;
        return this;
    }

    @MetaExoPlayerCustomization
    public final NU A07(C1667e7 c1667e7) {
        this.A06 = c1667e7;
        return this;
    }

    public final NU A08(String str) {
        this.A07 = str;
        return this;
    }

    @MetaExoPlayerCustomization
    public final NX A09() {
        C1667e7 c1667e7;
        AbstractC1062Ln.A03(this.A05, A00(0, 20, 56));
        Uri uri = this.A05;
        long j11 = this.A04;
        int i5 = this.A01;
        byte[] bArr = this.A09;
        Map<String, String> map = this.A08;
        long j12 = this.A03;
        long j13 = this.A02;
        String str = this.A07;
        int i11 = this.A00;
        if (this.A06 != null) {
            c1667e7 = this.A06;
        } else {
            c1667e7 = new C1667e7();
        }
        return new NX(uri, j11, i5, bArr, map, j12, j13, str, i11, c1667e7);
    }
}
