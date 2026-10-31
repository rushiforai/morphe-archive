package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;

/* loaded from: assets/audience_network/classes.dex */
public final class P0 {
    public static String[] A09 = {"MmCYZgBPri8bmVXa", "J3inhn0J44grqBzsgHfl", "luxmx", "aD89Cmw6ZMy3IRLE5Jpd1StHj7IjoKmQ", "vvXCP", "MmSeJsvfII2Tg6FOzoJQIYN", "VDoaGMZnHNSgWJ9xUvi1", "eI"};
    public final long A00;
    public final long A01;
    public final long A02;
    public final long A03;
    public final C1202Rk A04;
    public final boolean A05;
    public final boolean A06;
    public final boolean A07;
    public final boolean A08;

    @MetaExoPlayerCustomization
    public P0(C1202Rk c1202Rk, long j11, long j12, long j13, long j14, boolean z11, boolean z12) {
        this.A04 = c1202Rk;
        this.A03 = j11;
        this.A01 = j12;
        this.A02 = j13;
        this.A00 = j14;
        this.A07 = z11;
        this.A05 = z12;
        this.A06 = false;
        this.A08 = false;
    }

    @MetaExoPlayerCustomization
    public P0(C1202Rk c1202Rk, long j11, long j12, long j13, long j14, boolean z11, boolean z12, boolean z13, boolean z14) {
        this.A04 = c1202Rk;
        this.A03 = j11;
        this.A02 = j12;
        this.A01 = j13;
        this.A00 = j14;
        this.A06 = z11;
        this.A07 = z12;
        this.A08 = z13;
        this.A05 = z14;
    }

    public final P0 A00(long j11) {
        if (j11 == this.A03) {
            return this;
        }
        return new P0(this.A04, j11, this.A02, this.A01, this.A00, this.A06, this.A07, this.A08, this.A05);
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0076  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (A09[5].length() == 1) {
            throw new RuntimeException();
        }
        String[] strArr = A09;
        strArr[0] = "QgrbeDZix4AeaffD";
        strArr[1] = "DNzUJYhBqjbejkLXkccI";
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        P0 p02 = (P0) obj;
        if (this.A03 == p02.A03 && this.A02 == p02.A02 && this.A01 == p02.A01 && this.A00 == p02.A00 && this.A06 == p02.A06 && this.A07 == p02.A07) {
            boolean z11 = this.A08;
            boolean z12 = p02.A08;
            if (A09[5].length() != 1) {
                String[] strArr2 = A09;
                strArr2[0] = "PW4PujGLkAdsS5e1";
                strArr2[1] = "uJZYz5auQLLxJuAPKnp5";
                if (z11 == z12) {
                    if (this.A05 == p02.A05 && N1.A1E(this.A04, p02.A04)) {
                        return true;
                    }
                }
            } else {
                String[] strArr3 = A09;
                strArr3[0] = "N0101jdjAMvBEvtR";
                strArr3[1] = "dSSvaMoaZvMqSLv8mM1N";
                if (z11 == z12) {
                }
            }
        }
        return false;
    }

    public final int hashCode() {
        return (((((((((((((((((17 * 31) + this.A04.hashCode()) * 31) + ((int) this.A03)) * 31) + ((int) this.A02)) * 31) + ((int) this.A01)) * 31) + ((int) this.A00)) * 31) + (this.A06 ? 1 : 0)) * 31) + (this.A07 ? 1 : 0)) * 31) + (this.A08 ? 1 : 0)) * 31) + (this.A05 ? 1 : 0);
    }
}
