package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.facebook.ads.AdError;
import com.facebook.ads.CacheFlag;
import com.facebook.ads.InterstitialAd;
import com.facebook.ads.InterstitialAdExtendedListener;
import com.facebook.ads.internal.protocol.AdErrorType;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.EnumSet;

/* renamed from: com.facebook.ads.redexgen.X.Jz, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1024Jz implements InterfaceC1790g7 {
    public static byte[] A09;
    public static String[] A0A = {"Q9RghtL5kPMxXUG2hlpmHrVaJwYYGwGq", "TIO3FaU0Mikock0w3rckrPhiuYRMfGhJ", "k6SAISDvmHdOF1rkjeEeymm6HvDlJVR0", "eDRhFd25R2oFsFg27vb0d5UADzs1KoZv", "MaVPWgska1IH7XOKtPwNB8GdxIWUIxDt", "dS1g8OO0fBonmOwqVSSlXi39LbvMIXQb", "JdFW5Fpsu4G", "QGzwgj8zvaLwI8"};
    public static final String A0B;
    public long A00 = -1;
    public InterstitialAd A01;
    public AbstractC1734fD A02;
    public C07127e A03;
    public boolean A04;
    public boolean A05;
    public final C0958Hi A06;
    public final InterstitialAdExtendedListener A07;
    public final C1020Jv A08;

    public static String A09(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 110);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A09 = new byte[]{-59, -14, -92, -27, -24, -92, -16, -13, -27, -24, -92, -19, -9, -92, -27, -16, -10, -23, -27, -24, -3, -92, -19, -14, -92, -12, -10, -13, -21, -10, -23, -9, -9, -78, -92, -35, -13, -7, -92, -9, -20, -13, -7, -16, -24, -92, -5, -27, -19, -8, -92, -22, -13, -10, -92, -27, -24, -48, -13, -27, -24, -23, -24, -84, -83, -92, -8, -13, -92, -26, -23, -92, -25, -27, -16, -16, -23, -24, -4, 33, 39, 24, 37, 38, 39, 28, 39, 28, 20, 31, -45, 31, 34, 20, 23, -45, 22, 20, 31, 31, 24, 23, -45, 42, 27, 28, 31, 24, -45, 38, 27, 34, 42, 28, 33, 26, -45, 28, 33, 39, 24, 37, 38, 39, 28, 39, 28, 20, 31, -31, 13, 28, 21};
    }

    static {
        A0A();
        A0B = C1024Jz.class.getSimpleName();
    }

    public C1024Jz(C1020Jv c1020Jv, InterfaceC1809gQ interfaceC1809gQ, String str) {
        this.A08 = c1020Jv;
        this.A06 = c1020Jv.A05();
        this.A07 = new C1001Ja(str, interfaceC1809gQ, this);
    }

    public final long A0D() {
        if (this.A03 != null) {
            return this.A03.A0F();
        }
        return -1L;
    }

    public final C1020Jv A0E() {
        return this.A08;
    }

    public final C0958Hi A0F() {
        return this.A06;
    }

    public final void A0G(EnumSet<CacheFlag> cacheFlags, String str) {
        String strA02;
        this.A00 = System.currentTimeMillis();
        if (!this.A05 && this.A03 != null) {
            Log.w(A0B, A09(0, 78, 22));
        }
        this.A05 = false;
        if (this.A04 && !C2203mv.A0g(this.A06)) {
            this.A06.A08().ABz(A09(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 3, 62), AbstractC2126lf.A0L, new C2127lg(A09(78, 52, 69)));
            AdErrorType adErrorType = AdErrorType.LOAD_CALLED_WHILE_SHOWING_AD;
            this.A06.A0F().A3j(C2416qS.A01(this.A00), adErrorType.getErrorCode(), adErrorType.getDefaultErrorMessage());
            this.A07.onError(this.A08.A7K(), new AdError(adErrorType.getErrorCode(), adErrorType.getDefaultErrorMessage()));
            return;
        }
        if (this.A03 != null) {
            this.A03.A0R(new K4(this));
            this.A03.A0M();
            this.A03.A0J();
            this.A03 = null;
        }
        C1781fy c1781fy = new C1781fy(this.A08.A0A(), AbstractC2267nz.A00(this.A06.getResources().getDisplayMetrics()), AdPlacementType.INTERSTITIAL, EnumC2264nw.A07, 1, cacheFlags, this.A08.A06());
        if (C2203mv.A2j(this.A06) && (strA02 = C2352pQ.A02(this.A06, this.A08.A08())) != null) {
            C1020Jv c1020Jv = this.A08;
            if (A0A[6].length() != 11) {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[3] = "6YCA3PHZSlLj0jmN2b2hvaW99ZyRMwjh";
            strArr[5] = "7PoIPIeUN8KAt8vfreK3c69iBAU82q7R";
            c1020Jv.A0I(strA02);
        }
        c1781fy.A06(this.A08.A08());
        c1781fy.A07(this.A08.A09());
        c1781fy.A04(this.A08.A03());
        this.A03 = new C07127e(this.A06, c1781fy);
        this.A03.A0R(new K1(this));
        this.A03.A0V(str);
    }

    public final boolean A0H() {
        return this.A03 == null || this.A03.A0Y();
    }

    public final boolean A0I() {
        return this.A05;
    }

    public final boolean A0J() {
        AdError adError = AdError.SHOW_CALLED_BEFORE_LOAD_ERROR;
        if (!this.A05) {
            this.A06.A0F().A3j(C2416qS.A01(this.A00), adError.getErrorCode(), adError.getErrorMessage());
            this.A07.onError(this.A08.A7K(), adError);
            return false;
        }
        if (this.A03 == null) {
            this.A06.A08().ABz(A09(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 3, 62), AbstractC2126lf.A0S, new C2127lg(AdErrorType.INTERSTITIAL_CONTROLLER_IS_NULL.getDefaultErrorMessage()));
            this.A06.A0F().A3j(C2416qS.A01(this.A00), adError.getErrorCode(), adError.getErrorMessage());
            this.A07.onError(this.A08.A7K(), adError);
            return false;
        }
        this.A03.A0L();
        this.A04 = true;
        this.A05 = false;
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1790g7
    public final void destroy() {
        if (this.A03 != null) {
            this.A03.A0R(new K0(this));
            this.A03.A0X(true);
            this.A03.A0J();
            this.A03 = null;
            this.A05 = false;
            this.A04 = false;
        }
    }
}
