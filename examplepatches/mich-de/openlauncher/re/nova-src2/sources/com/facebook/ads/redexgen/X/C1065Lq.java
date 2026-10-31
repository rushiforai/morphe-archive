package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.util.Log;
import android.view.WindowManager;
import com.facebook.ads.AdError;
import com.facebook.ads.CacheFlag;
import com.facebook.ads.RewardData;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.facebook.ads.internal.util.activity.ActivityUtils;
import com.facebook.ads.internal.util.activity.AdActivityIntent;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.UUID;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Lq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1065Lq implements InterfaceC1708en, InterfaceC1767fk {
    public static byte[] A0B;
    public static String[] A0C = {"PgLDGrk3t3a26fQCrT3IpIrRB5PMNBKm", "uls9HIPpriPjzjIXJVTR7HWmS4IMGzWu", "f2YRmtND2fanruA3kJYGXgN9aGwgjawI", "EZdssni07U2TMPMup9RmA63S0tAhTBNo", "xilKUxawUAlWzUTJOedtCKHAHwNBDRxA", "SxIuirRfQS0L7ik0LzQXw", "dF8CYh", "NQmOIXzIEfwTEqDrM9Z7TuMEUTKSiMNX"};
    public long A00;
    public RewardData A01;
    public InterfaceC1719ey A02;
    public C1720ez A03;
    public C1768fl A04;
    public C0958Hi A05;
    public String A06;
    public String A07;
    public String A08;
    public boolean A09;
    public final String A0A = UUID.randomUUID().toString();

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        byte[] bArr = {78, 108, 99, 42, 121, 45, 126, 121, 108, AbstractJsonLexerKt.TC_INVALID, 121, 45, 76, 120, 105, 100, 104, 99, 110, 104, 67, 104, 121, 122, 98, AbstractJsonLexerKt.TC_INVALID, 102, 76, 110, 121, 100, 123, 100, 121, 116, 35, 45, 64, 108, 102, 104, 45, 126, 120, AbstractJsonLexerKt.TC_INVALID, 104, 45, 121, 101, 108, 121, 45, 100, 121, 42, 126, 45, 100, 99, 45, 116, 98, 120, AbstractJsonLexerKt.TC_INVALID, 45, 76, 99, 105, AbstractJsonLexerKt.TC_INVALID, 98, 100, 105, 64, 108, 99, 100, 107, 104, 126, 121, 35, 117, 96, 97, 45, 107, 100, 97, 104, 35, 73, 77, 78, 122, 107, 102, 106, 97, 108, 106, 65, 106, 123, 120, 96, 125, 100, 68, 37, 42, 27, 37, 39, 48, 45, 50, 45, 48, 61, 83, 91, 90, 87, 95, 74, 87, 81, 80, 122, 95, 74, 95, 12, 16, 29, 31, 25, 17, 25, 18, 8, 53, 24, 52, 54, 33, 32, 33, 34, 45, 42, 33, 32, 11, 54, 45, 33, 42, 48, 37, 48, 45, 43, 42, 15, 33, 61, 6, 17, 5, 1, 17, 7, 0, 32, 29, 25, 17, 114, 105, 110, 118, 114, 98, 78, 99, 30, 1, 13, 31, 60, 17, 24, 13, 39, 57, 62, 52, 63, 39};
        if (A0C[1].charAt(29) == 'g') {
            throw new RuntimeException();
        }
        String[] strArr = A0C;
        strArr[4] = "6qgGoSyjmuhDFT94hunOHzgd3UUS7LMQ";
        strArr[0] = "q1PjRK7gg6WFD8n4pAFO870HLaNMi7ir";
        A0B = bArr;
    }

    static {
        A05();
    }

    private int A00() {
        WindowManager windowManager = (WindowManager) this.A05.getSystemService(A03(194, 6, 88));
        int rotation = windowManager.getDefaultDisplay().getRotation();
        EnumC2622tm enumC2622tmA02 = A02();
        if (enumC2622tmA02 == EnumC2622tm.A06) {
            return -1;
        }
        if (enumC2622tmA02 == EnumC2622tm.A04) {
            switch (rotation) {
                case 2:
                case 3:
                    return 8;
                default:
                    return 0;
            }
        }
        switch (rotation) {
            case 2:
                return 9;
            default:
                String[] strArr = A0C;
                String str = strArr[3];
                String str2 = strArr[7];
                int rotation2 = str.charAt(11);
                if (rotation2 != str2.charAt(11)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0C;
                strArr2[3] = "CZdwi0h9oyeTk4ywD5LtkOxTOpQ29Yc4";
                strArr2[7] = "yy96Y2PoNFwTE84mLwUlYETryPZgGhEq";
                return 1;
        }
    }

    private final EnumC2295oR A01() {
        return this.A04.A0E();
    }

    private EnumC2622tm A02() {
        return this.A04.A0F();
    }

    private void A04() {
        this.A09 = true;
    }

    private void A06(Intent intent) {
        this.A04.A0I(intent, this.A01, C1814gV.A04(this.A01, this.A0A, this.A06));
    }

    private final void A07(C0958Hi c0958Hi, InterfaceC1719ey interfaceC1719ey, C1782fz c1782fz, EnumSet<CacheFlag> enumSet, String str) {
        C1768fl c1768fl = new C1768fl(c0958Hi, c1782fz, this, str);
        AbstractC1734fD abstractC1734fDA0D = c1768fl.A0D();
        if (C2203mv.A0u(c0958Hi)) {
            boolean z11 = abstractC1734fDA0D instanceof LA;
            String[] strArr = A0C;
            if (strArr[3].charAt(11) == strArr[7].charAt(11)) {
                A0C[2] = "TkuXboGIr4gI6uBXxoSPLVsF8oObr4N9";
                if (z11 && AbstractC1705ej.A06(this.A05, AbstractC1705ej.A01(c0958Hi, c1782fz.A03(), ((LA) abstractC1734fDA0D).A37()), c0958Hi.A0A())) {
                    this.A05.A0F().A5b();
                    this.A02.AFJ(this, AdError.NO_FILL);
                    String[] strArr2 = A0C;
                    if (strArr2[3].charAt(11) == strArr2[7].charAt(11)) {
                        A0C[1] = "78EqxHXjdVB4uq4fqkQnSqdXUgUnX7wU";
                        return;
                    }
                }
            }
            throw new RuntimeException();
        }
        this.A04 = c1768fl;
        A08(c1768fl.A0E());
        c1768fl.A0J(c0958Hi, enumSet);
    }

    private void A08(EnumC2295oR enumC2295oR) {
        if (enumC2295oR.equals(EnumC2295oR.A05)) {
            this.A05.A0F().ALB(EnumC1651dr.A04);
            return;
        }
        if (enumC2295oR.equals(EnumC2295oR.A0B)) {
            this.A05.A0F().ALB(EnumC1651dr.A03);
            return;
        }
        if (enumC2295oR.equals(EnumC2295oR.A0C)) {
            this.A05.A0F().ALB(EnumC1651dr.A0B);
            return;
        }
        if (enumC2295oR.equals(EnumC2295oR.A0E)) {
            this.A05.A0F().ALB(EnumC1651dr.A0D);
            return;
        }
        if (enumC2295oR.equals(EnumC2295oR.A0D)) {
            this.A05.A0F().ALB(EnumC1651dr.A0C);
            return;
        }
        boolean zEquals = enumC2295oR.equals(EnumC2295oR.A07);
        String[] strArr = A0C;
        if (strArr[5].length() == strArr[6].length()) {
            throw new RuntimeException();
        }
        A0C[2] = "SZ1DhKHJxqFOmux8c4F7iNiG5ZFRRvjL";
        if (!zEquals) {
            return;
        }
        if (this.A04.A0K()) {
            this.A05.A0F().ALB(EnumC1651dr.A08);
        } else if ((A09() instanceof LA) && this.A04.A0L((LA) A09())) {
            this.A05.A0F().ALB(EnumC1651dr.A0A);
        } else {
            this.A05.A0F().ALB(EnumC1651dr.A09);
        }
    }

    public final AbstractC1734fD A09() {
        return this.A04.A0D();
    }

    public final void A0A(C0958Hi c0958Hi, InterfaceC1719ey interfaceC1719ey, C1782fz c1782fz, EnumSet<CacheFlag> enumSet, String str, String str2, RewardData rewardData) {
        this.A05 = c0958Hi;
        this.A02 = interfaceC1719ey;
        this.A08 = c1782fz.A02();
        this.A06 = this.A08 != null ? this.A08.split(A03(107, 1, 19))[0] : A03(0, 0, 5);
        this.A00 = c1782fz.A00();
        this.A07 = str2;
        this.A01 = rewardData;
        A07(c0958Hi, interfaceC1719ey, c1782fz, enumSet, str);
    }

    public final boolean A0B() {
        if (!this.A09) {
            if (this.A02 != null) {
                this.A02.AFJ(this, AdError.SHOW_CALLED_BEFORE_LOAD_ERROR);
            }
            return false;
        }
        AdActivityIntent adActivityIntentA06 = C2337p8.A06(this.A05);
        adActivityIntentA06.putExtra(A03(143, 24, 76), A00());
        adActivityIntentA06.putExtra(A03(178, 8, 15), this.A0A);
        adActivityIntentA06.putExtra(A03(Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, 11, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), this.A08);
        adActivityIntentA06.putExtra(A03(167, 11, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), this.A00);
        EnumC2295oR enumC2295oRA01 = A01();
        A08(enumC2295oRA01);
        adActivityIntentA06.putExtra(A03(186, 8, 96), enumC2295oRA01);
        if (this.A07 != null) {
            adActivityIntentA06.putExtra(A03(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 13, 54), this.A07);
        }
        A06(adActivityIntentA06);
        if (!ProcessUtils.isRemoteRenderingProcess()) {
            String[] strArr = A0C;
            if (strArr[5].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            A0C[2] = "xZPvgBO8krDV4upi6ZXzWcYT2LzaCOyj";
            adActivityIntentA06.addFlags(268435456);
        }
        try {
            ActivityUtils.A03(this.A05);
            if (ProcessUtils.isRemoteRenderingProcess()) {
                if (!C2337p8.A0K(this.A05, adActivityIntentA06)) {
                    this.A05.A0F().AJQ();
                    if (this.A02 != null) {
                        this.A02.AFJ(this, AdError.AD_PRESENTATION_ERROR);
                    }
                    return false;
                }
                return true;
            }
            C2337p8.A0D(this.A05, adActivityIntentA06);
            return true;
        } catch (C2335p6 e3) {
            Throwable cause = e3.getCause();
            Throwable cause2 = e3;
            if (cause != null) {
                cause2 = e3.getCause();
            }
            this.A05.A08().ABz(A03(108, 11, 76), AbstractC2126lf.A0D, new C2127lg(cause2));
            Log.e(A03(90, 17, 7), A03(0, 90, 5), cause2);
            return false;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final String A7z() {
        return this.A04.A0G();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final AdPlacementType A9N() {
        return AdPlacementType.INTERSTITIAL;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1767fk
    public final void ADk(AdError adError) {
        if (this.A02 != null) {
            this.A02.AFJ(this, adError);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1767fk
    public final void ADl() {
        A04();
        this.A02.AFI(this);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1767fk
    public final void AIm() {
        this.A03 = new C1720ez(this.A05, this.A0A, this, this.A02);
        this.A03.A02();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final boolean ALe() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1767fk
    public final void ALr() {
        if (this.A03 != null) {
            this.A03.A03();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1708en
    public final void onDestroy() {
        if (this.A04 != null) {
            this.A04.A0H();
        }
    }
}
