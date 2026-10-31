package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.facebook.ads.AdError;
import com.facebook.ads.AdExperienceType;
import com.facebook.ads.RewardData;
import com.facebook.ads.RewardedVideoAd;
import com.facebook.ads.S2SRewardedVideoAdExtendedListener;
import com.facebook.ads.internal.protocol.AdPlacementType;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Jw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1021Jw implements InterfaceC1790g7 {
    public static byte[] A09;
    public static String[] A0A = {"gd6Snq8TqC5qGLc", "5Vo8FrFWo5Fl4YG5W1yHT6ZfMsOXSACT", "HYpFHiAeuVvng5d4eXQK0awgijL0SEef", "zgL9OdntC9Jt", "c4pha1QVXZPHNWU", "oPtBq8V8zceab2K03f0YSkruz1vfGvQp", "tGZii7gSURWSZ1CI0FSKqsks", "YmWpveYB3lCv"};
    public static final String A0B;
    public long A01;
    public RewardedVideoAd A02;
    public AbstractC1734fD A03;
    public C07087a A04;
    public final C0958Hi A06;
    public final S2SRewardedVideoAdExtendedListener A07;
    public final C1003Jc A08;
    public boolean A05 = false;
    public long A00 = -1;

    public static String A09(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 93);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A09 = new byte[]{120, 87, 25, 88, 93, 25, 85, 86, 88, 93, 25, 80, 74, 25, 88, 85, 75, 92, 88, 93, 64, 25, 80, 87, 25, 73, 75, 86, 94, 75, 92, 74, 74, 23, 25, 96, 86, 76, 25, 74, 81, 86, 76, 85, 93, 25, 78, 88, 80, 77, 25, 95, 86, 75, 25, 88, 93, 117, 86, 88, 93, 92, 93, 17, 16, 25, 77, 86, 25, 91, 92, 25, 90, 88, 85, 85, 92, 93, 47, 24, 24, 5, 24, 74, 6, 5, 11, 14, 3, 4, 13, 74, 24, 15, 29, 11, 24, 14, 15, 14, 74, 28, 3, 14, 15, 5, 74, 11, 14, 92, 77, 84};
        if (A0A[6].length() != 24) {
            throw new RuntimeException();
        }
        String[] strArr = A0A;
        strArr[4] = "OGOVhUIoezz1oHK";
        strArr[0] = "xl2MkcRK0CWEWUY";
    }

    static {
        A0A();
        A0B = C1021Jw.class.getSimpleName();
    }

    public C1021Jw(C1003Jc c1003Jc, InterfaceC1809gQ interfaceC1809gQ, String str) {
        this.A08 = c1003Jc;
        this.A06 = c1003Jc.A0B;
        this.A07 = new JZ(str, interfaceC1809gQ, this, c1003Jc);
    }

    private void A0C(String str, AdExperienceType adExperienceType, boolean z11) {
        String strA02;
        if (!this.A05 && this.A04 != null) {
            Log.w(A0B, A09(0, 78, 100));
        }
        A0D(false);
        this.A05 = false;
        C1781fy c1781fy = new C1781fy(this.A08.A0D, EnumC2265nx.A06, AdPlacementType.REWARDED_VIDEO, EnumC2264nw.A07, 1, this.A08.A0C);
        c1781fy.A08(z11);
        if (C2203mv.A2j(this.A06) && (strA02 = C2352pQ.A02(this.A06, this.A08.A06)) != null) {
            C1003Jc c1003Jc = this.A08;
            String[] strArr = A0A;
            String extraHints = strArr[2];
            if (extraHints.charAt(28) != strArr[1].charAt(28)) {
                throw new RuntimeException();
            }
            A0A[6] = "NRWBzlFLQPOGySbiiYXSLDN6";
            c1003Jc.A06 = strA02;
        }
        c1781fy.A06(this.A08.A06);
        c1781fy.A07(this.A08.A07);
        this.A04 = new C07087a(this.A08.A0B, c1781fy);
        this.A04.A0R(new C1023Jy(this));
        this.A04.A0W(str, adExperienceType);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0D(boolean z11) {
        if (this.A04 != null) {
            this.A04.A0R(new C1022Jx(this));
            this.A04.A0X(z11);
            this.A04.A0J();
            this.A04 = null;
        }
    }

    public final long A0F() {
        if (this.A04 != null) {
            return this.A04.A0F();
        }
        return -1L;
    }

    public final C1003Jc A0G() {
        return this.A08;
    }

    public final C0958Hi A0H() {
        return this.A06;
    }

    public final void A0I(RewardData rewardData) {
        this.A08.A03 = rewardData;
        if (this.A05 && this.A04 != null) {
            this.A04.A0Z(rewardData);
        }
    }

    public final void A0J(String str, AdExperienceType adExperienceType, boolean z11) {
        this.A00 = System.currentTimeMillis();
        try {
            A0C(str, adExperienceType, z11);
        } catch (Exception e3) {
            Log.e(A0B, A09(78, 31, 55), e3);
            this.A08.A0B.A08().ABz(A09(109, 3, 96), AbstractC2126lf.A0b, new C2127lg(e3));
            AdError adErrorInternalError = AdError.internalError(2004);
            this.A08.A0B.A0F().A3j(C2416qS.A01(this.A00), adErrorInternalError.getErrorCode(), adErrorInternalError.getErrorMessage());
            this.A07.onError(this.A08.A7K(), adErrorInternalError);
        }
    }

    public final boolean A0K() {
        return this.A04 == null || this.A04.A0Y();
    }

    public final boolean A0L() {
        return this.A05;
    }

    public final boolean A0M(int i5, long j11) {
        if (!this.A05) {
            this.A07.onError(this.A08.A7K(), AdError.SHOW_CALLED_BEFORE_LOAD_ERROR);
            return false;
        }
        if (this.A04 != null) {
            this.A01 = System.currentTimeMillis();
            this.A04.A08.A02(i5);
            this.A04.A08.A03(j11);
            this.A04.A0L();
            this.A05 = false;
            return true;
        }
        this.A05 = false;
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1790g7
    public final void destroy() {
        A0D(true);
    }
}
