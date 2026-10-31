package com.facebook.ads.redexgen.X;

import android.content.ContentResolver;
import android.content.Intent;
import android.provider.Settings;
import android.text.TextUtils;
import com.facebook.ads.AdError;
import com.facebook.ads.internal.util.activity.ActivityUtils;
import com.facebook.ads.internal.util.activity.AdActivityIntent;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.7m, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07207m extends LG {
    public static C2086kz A0D;
    public static byte[] A0E;
    public static String[] A0F = {"YJVWhBFSVFKs7NrWmWULGh", "0GvTyPfIpVaCupDTXIuhVv", "vKmpQ0k2zgunQxdAFsx7Wlk6dmYtSCUc", "dqRYVPDeGy45RCRFCWIUPRHRtp9NBigI", "NSweCua6lZ8ChPFZ3cKnaOBscLcsrWLc", "HenZyTRrHhMHTWT00jKprDJGPW9d4C4V", "lvvcgtkpn6JHhS0LrJ19j3FN0lJsZZOv", "GmBDkEWrzwPugE8SLtTHysECIxUFQGpg"};
    public long A00;
    public InterfaceC1727f6 A01;
    public C1728f7 A02;
    public AbstractC1734fD A03;
    public C0958Hi A04;
    public EnumC2295oR A05;
    public C1245Tb A06;
    public String A07;
    public String A08;
    public String A09;
    public String A0A;
    public final String A0B = UUID.randomUUID().toString();
    public final AtomicBoolean A0C = new AtomicBoolean();

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0E, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A0E = new byte[]{56, 52, 54, 54, 48, 57, 48, 39, 58, 56, 48, 33, 48, 39, 10, 39, 58, 33, 52, 33, 60, 58, 59, 108, 99, 82, 108, 110, 121, 100, 123, 100, 121, 116, 9, 2, 11, 3, 4, 15, 14, 43, 14, 46, 11, 30, 11, 40, 31, 4, 14, 6, 15, 68, 76, 77, 64, 72, 93, 64, 70, 71, 109, 72, 93, 72, 12, 16, 29, 31, 25, 17, 25, 18, 8, 53, 24, 87, 85, 66, 67, 66, 65, 78, 73, 66, 67, 104, 85, 78, 66, 73, 83, 70, 83, 78, 72, 73, 108, 66, 94, 4, 19, 7, 3, 19, 5, 2, 34, 31, 27, 19, 104, AbstractJsonLexerKt.TC_INVALID, 109, 123, 104, 126, 73, AbstractJsonLexerKt.TC_INVALID, 104, 108, AbstractJsonLexerKt.TC_INVALID, 104, 79, 72, 86, 25, 14, 28, 10, 25, 15, 14, 15, 61, 2, 15, 14, 4, 42, 15, 47, 10, 31, 10, 41, 30, 5, 15, 7, 14, 87, 64, 82, 68, 87, 65, 64, 65, 122, 83, 76, 65, 64, 74, 124, 103, 96, 120, 124, 108, 64, 109, 83, 76, 64, 82, 113, 92, 85, 64};
    }

    static {
        A09();
    }

    private void A07() {
        C1840gw.A00(this.A04).A06(this.A02, this.A02.A00());
    }

    private void A08() {
        if (this.A02 != null) {
            try {
                C1840gw.A00(this.A04).A05(this.A02);
            } catch (Exception unused) {
            }
        }
    }

    private void A0A(Intent intent) {
        int i5 = super.A00;
        String strA05 = A05(77, 24, 89);
        if (i5 != -1) {
            ContentResolver contentResolver = this.A04.getContentResolver();
            if (A0F[3].charAt(29) != 'i') {
                throw new RuntimeException();
            }
            String[] strArr = A0F;
            strArr[7] = "ryaiaZaF8EzuUPZd67FeoIG9jUALGHZG";
            strArr[6] = "XITZtpYy2wf6QHmOozCOnY6Xlkm3ca51";
            if (Settings.System.getInt(contentResolver, A05(1, 22, 43), 0) != 1) {
                int i11 = super.A00;
                if (A0F[2].charAt(2) != 'm') {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0F;
                strArr2[1] = "mo2n49jFbf8CHvb7nubztA";
                strArr2[0] = "3h0LYrxRFByrgEG7Z48zJG";
                intent.putExtra(strA05, i11);
                return;
            }
        }
        if (!C2203mv.A0f(this.A04)) {
            intent.putExtra(strA05, 6);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0C(final C0958Hi c0958Hi, final C1048Kz c1048Kz, final int i5) {
        if (i5 >= c1048Kz.A2v()) {
            return;
        }
        final C07147g c07147g = (C07147g) c1048Kz.A2z(i5);
        A0D = new C2086kz(c0958Hi);
        A0D.A0e(new C2232nO(c07147g.A37(), c0958Hi.A0A()));
        if (c07147g.A39().size() > 1) {
            AbstractC1780fx.A03(c0958Hi, A0D, c07147g);
        } else {
            AbstractC1780fx.A02(c0958Hi, A0D, c07147g);
        }
        final boolean z11 = i5 == 0;
        A0D.A0X(new KM(z11) { // from class: com.facebook.ads.redexgen.X.7n
            @Override // com.facebook.ads.redexgen.X.KM
            public final void A00() {
                this.A01.A01.AGw(this.A01, AdError.CACHE_ERROR);
            }

            @Override // com.facebook.ads.redexgen.X.KM
            public final void A01(boolean z12) {
                C07207m.A0D = null;
                if (z12) {
                    c0958Hi.A01().AKW(c07147g.A37(), c1048Kz.A30());
                }
                if (i5 == c1048Kz.A2x()) {
                    this.A01.A0C.set(true);
                    this.A01.A01.AGt(this.A01);
                }
                this.A01.A0C(c0958Hi, c1048Kz, i5 + 1);
            }
        }, new C2079ks(c07147g.A1r(), A05(152, 14, 91), i5));
    }

    private void A0D(boolean z11) {
        if (this.A05 == EnumC2295oR.A0H) {
            A0F(z11);
            return;
        }
        EnumC2295oR enumC2295oR = this.A05;
        String[] strArr = A0F;
        if (strArr[1].length() != strArr[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0F;
        strArr2[4] = "1yOiFacRiwJanRzqDJ6A5hJ77lYfziAe";
        strArr2[5] = "McEelBumOV7dKb1zb6BdvUT5HG6VvrgI";
        if (enumC2295oR == EnumC2295oR.A0I) {
            C0958Hi c0958Hi = this.A04;
            C07147g c07147g = (C07147g) this.A03;
            InterfaceC1727f6 interfaceC1727f6 = this.A01;
            if (A0F[2].charAt(2) != 'm') {
                String[] strArr3 = A0F;
                strArr3[4] = "iuhCbiYTMBJ6bSiVa8laVFn7PspsTGXh";
                strArr3[5] = "G6DDtB1lS5Mkt2kKUdjWlkRFPy2AJN8W";
                AbstractC1726f5.A02(c0958Hi, c07147g, interfaceC1727f6, this.A0C, this);
                return;
            }
            A0F[3] = "ILTFu289iGTDK30YJZ974PSb1jdVwigU";
            AbstractC1726f5.A02(c0958Hi, c07147g, interfaceC1727f6, this.A0C, this);
            return;
        }
        if (this.A05 == EnumC2295oR.A0K) {
            A0G(z11);
        } else if (this.A05 == EnumC2295oR.A0J) {
            A0E(z11);
        } else {
            A0G(z11);
        }
    }

    private void A0E(boolean z11) {
        C2086kz c2086kz = new C2086kz(this.A04);
        boolean z12 = C2203mv.A2H(this.A04) && C2051kP.A0A(this.A03.A1x());
        if (z12) {
            C2051kP c2051kP = new C2051kP(c2086kz, this.A03.A1x(), this.A03.A1c(), this.A03.A1r(), z12, new LT(this));
            c2086kz.A0e(new C2232nO(((LA) this.A03).A37(), this.A04.A0A()));
            c2051kP.A0B();
            return;
        }
        AbstractC1779fw.A02(this.A04, (LA) this.A03, z11, new LR(this));
    }

    private void A0F(boolean z11) {
        C2086kz c2086kz = new C2086kz(this.A04);
        c2086kz.A0e(new C2232nO(((LA) this.A03).A37(), this.A04.A0A()));
        AbstractC1780fx.A03(this.A04, c2086kz, (C07147g) this.A03);
        c2086kz.A0X(new C1055Lg(this), new C2079ks(this.A03.A1r(), A05(152, 14, 91)));
    }

    private void A0G(boolean z11) {
        boolean z12 = false;
        if (this.A03.A2L()) {
            C1048Kz c1048Kz = (C1048Kz) this.A03;
            for (int i5 = 0; i5 < c1048Kz.A2v(); i5++) {
                if (!A0H(c1048Kz.A2z(i5))) {
                    this.A01.AGw(this, AdError.INTERNAL_ERROR);
                    return;
                }
            }
            A0C(this.A04, c1048Kz, 0);
            return;
        }
        C2086kz c2086kz = new C2086kz(this.A04);
        c2086kz.A0e(new C2232nO(((LA) this.A03).A37(), this.A04.A0A()));
        if (C2203mv.A2H(this.A04) && C2051kP.A0A(this.A03.A1x())) {
            z12 = true;
        }
        boolean zA2Q = this.A03.A2Q();
        if (z12) {
            C2051kP unifiedAssetsLoader = new C2051kP(c2086kz, this.A03.A1x(), this.A03.A1c(), this.A03.A1r(), z12, new C1053Le(this, zA2Q));
            unifiedAssetsLoader.A0B();
            return;
        }
        C07147g c07147g = (C07147g) this.A03;
        if (TextUtils.isEmpty(c07147g.A32().A0I().A09())) {
            if (this.A05 == EnumC2295oR.A0L) {
                this.A04.A0F().AFT();
            }
            this.A01.AGw(this, AdError.INTERNAL_ERROR);
        } else {
            AbstractC1780fx.A02(this.A04, c2086kz, c07147g);
            c2086kz.A0X(new C07227o(this, z11, zA2Q, c07147g, this), new C2079ks(c07147g.A1r(), A05(152, 14, 91)));
        }
    }

    private boolean A0H(LA la2) {
        boolean isCarouselAd = la2.A39().size() > 1;
        if (isCarouselAd) {
            return true;
        }
        boolean zIsEmpty = TextUtils.isEmpty(la2.A32().A0I().A09());
        if (A0F[3].charAt(29) != 'i') {
            throw new RuntimeException();
        }
        A0F[3] = "kjF6g6ww3qDDyel7svnLAojonSzXQi6O";
        if (zIsEmpty) {
            boolean isCarouselAd2 = TextUtils.isEmpty(la2.A32().A0I().A08());
            if (isCarouselAd2) {
                return false;
            }
        }
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.LG
    public final int A0I() {
        if (this.A03 != null) {
            return this.A03.A1M();
        }
        String[] strArr = A0F;
        if (strArr[4].charAt(5) == strArr[5].charAt(5)) {
            throw new RuntimeException();
        }
        A0F[3] = "zy8kAWNFspHhc9OUOOhBHMIK4AaCMilm";
        return -1;
    }

    @Override // com.facebook.ads.redexgen.X.LG
    public final AbstractC1734fD A0J() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.LG
    public final boolean A0K() throws SecurityException {
        if (!this.A0C.get()) {
            return false;
        }
        this.A03.A1z(super.A01);
        String strA04 = C1814gV.A04(super.A02, this.A0B, this.A07);
        this.A03.A20(super.A02);
        this.A03.A24(strA04);
        AdActivityIntent adActivityIntentA06 = C2337p8.A06(this.A04);
        adActivityIntentA06.putExtra(A05(174, 8, 91), this.A05);
        if (this.A05 == EnumC2295oR.A0H && this.A03.A2k()) {
            AbstractC2011jl.A02(this.A0B, (LA) this.A03);
        } else {
            EnumC2295oR enumC2295oR = this.A05;
            EnumC2295oR enumC2295oR2 = EnumC2295oR.A06;
            String[] strArr = A0F;
            if (strArr[1].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0F;
            strArr2[1] = "L0ou65zbaEHIK9W1EiRqjH";
            strArr2[0] = "MlzKsAmmQguOmiSj0COpPP";
            if (enumC2295oR == enumC2295oR2 && this.A03.A2l()) {
                AbstractC2012jm.A02(this.A0B, (C1048Kz) this.A03);
            } else {
                adActivityIntentA06.putExtra(A05(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 25, 21), this.A03);
                adActivityIntentA06.putExtra(A05(34, 19, 20), this.A03);
            }
        }
        adActivityIntentA06.putExtra(A05(166, 8, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE), this.A0B);
        if (strA04 != null) {
            adActivityIntentA06.putExtra(A05(112, 15, 100), strA04);
        }
        adActivityIntentA06.putExtra(A05(66, 11, 2), this.A0A);
        adActivityIntentA06.putExtra(A05(101, 11, 8), this.A00);
        if (this.A09 != null) {
            adActivityIntentA06.putExtra(A05(53, 13, 87), this.A09);
        }
        A0A(adActivityIntentA06);
        if (!ProcessUtils.isRemoteRenderingProcess()) {
            adActivityIntentA06.setFlags(adActivityIntentA06.getFlags() | 268435456);
        }
        ActivityUtils.A03(this.A04);
        try {
            if (ProcessUtils.isRemoteRenderingProcess()) {
                if (!C2337p8.A0K(this.A04, adActivityIntentA06)) {
                    this.A04.A0F().AJQ();
                    if (this.A01 != null) {
                        this.A01.AGw(this, AdError.AD_PRESENTATION_ERROR);
                    }
                    return false;
                }
                return true;
            }
            C2337p8.A0D(this.A04, adActivityIntentA06);
            return true;
        } catch (C2335p6 e3) {
            if (this.A05 == EnumC2295oR.A0H && this.A03.A2k()) {
                AbstractC2011jl.A01(this.A0B);
            }
            if (this.A05 == EnumC2295oR.A06 && this.A03.A2l()) {
                AbstractC2012jm.A01(this.A0B);
            }
            Throwable cause = e3.getCause();
            Throwable cause2 = e3;
            if (cause != null) {
                cause2 = e3.getCause();
            }
            this.A04.A08().ABz(A05(23, 11, 115), AbstractC2126lf.A01, new C2127lg(cause2));
            return true;
        }
    }

    public final void A0L(C0958Hi c0958Hi, InterfaceC1727f6 interfaceC1727f6, C1782fz c1782fz, boolean z11, String str, String str2) {
        this.A0C.set(false);
        this.A04 = c0958Hi;
        this.A01 = interfaceC1727f6;
        this.A0A = c1782fz.A02();
        this.A00 = c1782fz.A00();
        this.A09 = str2;
        this.A07 = this.A0A != null ? this.A0A.split(A05(0, 1, 25))[0] : A05(0, 0, 20);
        this.A03 = AbstractC1734fD.A0H(c1782fz.A03(), this.A04);
        this.A03.A22(str);
        this.A03.A1y(c1782fz.A01().A06());
        if (this.A03.A2L()) {
            this.A08 = ((C1048Kz) this.A03).A32();
        } else {
            this.A08 = ((LA) this.A03).A37();
        }
        boolean zA2Q = this.A03.A2Q();
        String[] strArr = A0F;
        if (strArr[7].charAt(31) == strArr[6].charAt(31)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0F;
        strArr2[7] = "T6UzDEu82kzY1KsvV3iHB7OkWnIxnMBs";
        strArr2[6] = "PWXGgNcAlDXPEXP1mMx0dPQCA8p68UI5";
        if (zA2Q) {
            this.A05 = EnumC2295oR.A09;
            if (this.A03.A2B()) {
                this.A04.A0F().ALB(EnumC1651dr.A08);
            } else {
                this.A04.A0F().ALB(EnumC1651dr.A0A);
            }
        } else {
            switch (this.A03.A1L()) {
                case 0:
                    this.A05 = EnumC2295oR.A0K;
                    this.A04.A0F().ALB(EnumC1651dr.A0D);
                    break;
                case 1:
                    this.A05 = EnumC2295oR.A0J;
                    this.A04.A0F().ALB(EnumC1651dr.A0C);
                    break;
                case 2:
                    this.A05 = EnumC2295oR.A06;
                    this.A04.A0F().ALB(EnumC1651dr.A04);
                    break;
                case 3:
                    this.A05 = EnumC2295oR.A0H;
                    this.A04.A0F().ALB(EnumC1651dr.A03);
                    break;
                case 4:
                    this.A05 = EnumC2295oR.A0L;
                    C0958Hi c0958Hi2 = this.A04;
                    String[] strArr3 = A0F;
                    String str3 = strArr3[7];
                    String str4 = strArr3[6];
                    int experienceType = str3.charAt(31);
                    if (experienceType != str4.charAt(31)) {
                        String[] strArr4 = A0F;
                        strArr4[7] = "FFkeuuVk1meHqgTyMiNT7tgr8739x7mc";
                        strArr4[6] = "JwuXN3bqyC9CcnquHiHDyzq7R0rb3kLZ";
                        c0958Hi2.A0F().ALB(EnumC1651dr.A0E);
                        break;
                    } else {
                        String[] strArr5 = A0F;
                        strArr5[7] = "QuYSy7nqZhyT9avsyztjWhd8F7hW1wjU";
                        strArr5[6] = "5b6UXiMlNaCol2aZqv4zpvCfEMtgCuxD";
                        c0958Hi2.A0F().ALB(EnumC1651dr.A0E);
                        break;
                    }
                case 5:
                    if (!C2203mv.A1H(c0958Hi)) {
                        this.A01.AGw(this, AdError.INTERNAL_ERROR);
                        return;
                    }
                    this.A05 = EnumC2295oR.A0I;
                    this.A04.A0F().ALB(EnumC1651dr.A0B);
                    if (this.A03.A2o()) {
                        AbstractC1734fD abstractC1734fD = this.A03;
                        int experienceType2 = A0F[3].charAt(29);
                        if (experienceType2 != 105) {
                            A0F[3] = "i1vVIMuEE2CogviWDEosGc55NgD83ibP";
                            abstractC1734fD.A26(true);
                            break;
                        } else {
                            A0F[2] = "e7mQJdX4ST7JevLzoIctPRomcGPYY6Su";
                            abstractC1734fD.A26(true);
                            break;
                        }
                    }
                    break;
            }
        }
        if (C2203mv.A0u(c0958Hi)) {
            if (this.A03.A2L()) {
                C1048Kz c1048Kz = (C1048Kz) this.A03;
                for (int iA2v = c1048Kz.A2v() - 1; iA2v >= 0; iA2v--) {
                    LA laA2z = c1048Kz.A2z(iA2v);
                    if (AbstractC1705ej.A06(this.A04, AbstractC1705ej.A01(c0958Hi, laA2z.A1x(), laA2z.A37()), c0958Hi.A0A())) {
                        this.A04.A0F().A5b();
                        c1048Kz.A34(iA2v);
                        return;
                    }
                }
                if (c1048Kz.A2v() == 0) {
                    this.A01.AGw(this, AdError.NO_FILL);
                    return;
                }
            } else if (AbstractC1705ej.A06(this.A04, AbstractC1705ej.A01(c0958Hi, c1782fz.A03(), ((LA) this.A03).A37()), c0958Hi.A0A())) {
                this.A04.A0F().A5b();
                this.A01.AGw(this, AdError.NO_FILL);
                return;
            }
        }
        this.A02 = new C1728f7(this.A0B, this, interfaceC1727f6);
        A07();
        A0D(z11);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final String A7z() {
        return this.A08;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final boolean ALe() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final void onDestroy() {
        A08();
    }
}
