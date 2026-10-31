package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.Uk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1277Uk implements InterfaceC1018Jt {
    public final float A00;
    public final float A01;
    public final long A02;
    public final long A03;
    public final long A04;
    public static String[] A05 = {"qnKsSHhqap", b.f42142b, "cUTdyaGGiVWkS4mAAsRuvFYFZTmOUWHx", "d9PN3P609LWiHZ4WaJEEigU3Xw52boud", "3Bzj", "t441T8WV9LQC3wNFQfuXYmVulfNtQcUh", "XmSRzun0SVrlpg5CvKpTiSL6VD9nKWrE", "GsIwkPFPk5Xbti76ybE"};
    public static final C1277Uk A07 = new C1040Kp().A05();
    public static final InterfaceC1017Js<C1277Uk> A06 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.Ul
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return C1277Uk.A00(bundle);
        }
    };

    @Deprecated
    public C1277Uk(long j11, long j12, long j13, float f11, float f12) {
        this.A04 = j11;
        this.A03 = j12;
        this.A02 = j13;
        this.A01 = f11;
        this.A00 = f12;
    }

    public C1277Uk(C1040Kp c1040Kp) {
        this(c1040Kp.A04, c1040Kp.A03, c1040Kp.A02, c1040Kp.A01, c1040Kp.A00);
    }

    public static /* synthetic */ C1277Uk A00(Bundle bundle) {
        return new C1277Uk(bundle.getLong(A01(0), -9223372036854775807L), bundle.getLong(A01(1), -9223372036854775807L), bundle.getLong(A01(2), -9223372036854775807L), bundle.getFloat(A01(3), -3.4028235E38f), bundle.getFloat(A01(4), -3.4028235E38f));
    }

    public static String A01(int i5) {
        return Integer.toString(i5, 36);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        boolean z11 = obj instanceof C1277Uk;
        if (A05[7].length() == 24) {
            throw new RuntimeException();
        }
        String[] strArr = A05;
        strArr[4] = "Jm74";
        strArr[0] = "dTDU5I0i2H";
        if (!z11) {
            return false;
        }
        C1277Uk c1277Uk = (C1277Uk) obj;
        return this.A04 == c1277Uk.A04 && this.A03 == c1277Uk.A03 && this.A02 == c1277Uk.A02 && this.A01 == c1277Uk.A01 && this.A00 == c1277Uk.A00;
    }

    public final int hashCode() {
        int i5 = ((((int) (this.A04 ^ (this.A04 >>> 32))) * 31) + ((int) (this.A03 ^ (this.A03 >>> 32)))) * 31;
        int result = (int) (this.A02 ^ (this.A02 >>> 32));
        return ((((i5 + result) * 31) + (this.A01 != 0.0f ? Float.floatToIntBits(this.A01) : 0)) * 31) + (this.A00 != 0.0f ? Float.floatToIntBits(this.A00) : 0);
    }
}
