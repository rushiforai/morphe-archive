package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.os.Message;
import android.util.Log;
import com.facebook.ads.AdError;
import com.facebook.ads.RewardedVideoAdExtendedListener;
import com.facebook.ads.S2SRewardedVideoAdListener;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Jd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1004Jd implements InterfaceC1803gK {
    public static byte[] A05;
    public static String[] A06 = {"l1o30ubgNMqwIxdsvAhdwl", "uEolzpc8zYF03u8DLAeDfs0A9wQx2vsd", "zKwy", "mFz9Za5MD8BXE4Lkxv", "Wms6Ep20", b.f42142b, "s6yiLC", "izOiniaIEQHycLDhhOkzL"};
    public boolean A00;
    public final InterfaceC1788g5 A01;
    public final HandlerC1795gC A02;
    public final C1003Jc A03;
    public final C0958Hi A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{57, 28, 88, 23, 26, 18, 29, 27, 12, 88, 17, 11, 88, 22, 13, 20, 20, 56, 47, 52, 62, 54, 63, 37, 63, 34, 46, 40, 59, 41, 37, 49, 63, 35, 9, 13, 14, 58, 43, 38, 42, 33, 44, 42, 1, 42, 59, 56, 32, 61, 36, 98, 101, AbstractJsonLexerKt.TC_INVALID, 116, 110, 121, 121, 100, 121, 116, 104, 100, 111, 110, 116, 96, 110, 114, 14, 9, 19, 24, 21, 17, 24, 17, 14, 3, 2, 8, 24, 3, 18, 21, 6, 19, 14, 8, 9, 24, 12, 2, 30, 111, 108, 109, 100, 124, 106, 109, 117, 98, 111, 106, 103, 98, 119, 106, 108, 109, 124, 119, 106, 110, 102, 124, 104, 102, 122, 59, 19, 5, 5, 23, 17, 19, 76, 86, 96, 68, 94, 94, 68, 67, 74, 13, 79, 88, 67, 73, 65, 72, 13, 75, 66, 95, 13, 64, 72, 94, 94, 76, 74, 72, 8, 44, 54, 54, 44, 43, 34, 101, 39, 48, 43, 33, 41, 32, 101, 35, 42, 55, 101, 40, 32, 54, 54, 36, 34, 32, 107, 90, 93, 91, 86, 76, 91, 91, 70, 91, 86, 68, 76, 90, 90, 72, 78, 76, 86, 66, 76, 80, 5, 20, 13};
        String[] strArr = A06;
        if (strArr[6].length() == strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A06;
        strArr2[1] = "11z8nLjTbJ8kXGgkHyQ0qsLYj80GB6ec";
        strArr2[2] = "E5wc";
    }

    static {
        A01();
    }

    public C1004Jd(C0958Hi c0958Hi, C1003Jc c1003Jc, InterfaceC1788g5 interfaceC1788g5, HandlerC1795gC handlerC1795gC) {
        this.A04 = c0958Hi;
        this.A03 = c1003Jc;
        this.A01 = interfaceC1788g5;
        this.A02 = handlerC1795gC;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final Bundle A60(String str) {
        return AbstractC1810gR.A03(str, this.A03);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final void A6U() {
        this.A02.A0F(2002, null);
        this.A02.A0C();
        this.A03.A02(null);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final int A91() {
        return 2000;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final void AAN(Message message) {
        com.facebook.ads.Ad adA7K = this.A03.A7K();
        String strA00 = A00(Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 3, 16);
        if (adA7K == null) {
            this.A04.A08().ABz(strA00, AbstractC2126lf.A0K, new C2127lg(A00(0, 17, 12)));
            return;
        }
        int i5 = message.what;
        String strA002 = A00(120, 9, 2);
        String strA003 = A00(17, 17, 14);
        switch (i5) {
            case 10:
            case 2103:
                EnumC2154m8.A05(EnumC2154m8.A0A, EnumC2154m8.A07);
                Bundle bundle = message.getData().getBundle(strA003);
                if (bundle != null) {
                    int i11 = bundle.getInt(A00(51, 18, 95));
                    String string = bundle.getString(A00(182, 21, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
                    AdError adError = new AdError(i11, string);
                    this.A01.AKj(adError);
                    if (this.A03.A04 != null) {
                        this.A03.A04.onError(adA7K, adError);
                    } else {
                        Log.e(A00(34, 17, 59), string);
                    }
                } else {
                    this.A01.AKe(EnumC1787g4.A05);
                    String errorMessage = strA002 + message;
                    this.A04.A08().ABz(strA00, AbstractC2126lf.A0V, new C2127lg(A00(155, 27, 49), errorMessage));
                }
                this.A03.A02(null);
                return;
            case AdError.BROKEN_MEDIA_ERROR_CODE /* 2100 */:
                this.A01.AKo();
                Bundle bundle2 = message.getData().getBundle(strA003);
                if (bundle2 != null) {
                    this.A03.A01 = bundle2.getLong(A00(94, 26, 87));
                    C1003Jc c1003Jc = this.A03;
                    int i12 = bundle2.getInt(A00(69, 25, 51));
                    String[] strArr = A06;
                    if (strArr[6].length() == strArr[7].length()) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A06;
                    strArr2[6] = "eimvHB";
                    strArr2[7] = "9nAYjps8XJWkdVKe7ORqJ";
                    c1003Jc.A00 = i12;
                } else {
                    this.A04.A08().ABz(strA00, AbstractC2126lf.A0V, new C2127lg(A00(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 26, 89), strA002 + message));
                }
                this.A03.A02(null);
                break;
            case 2106:
                this.A03.A02(null);
                break;
            case 2110:
                this.A01.AL4();
                break;
        }
        if (this.A03.A04 == null) {
            return;
        }
        switch (message.what) {
            case AdError.BROKEN_MEDIA_ERROR_CODE /* 2100 */:
                EnumC2154m8.A05(EnumC2154m8.A0A, EnumC2154m8.A09);
                if (!this.A00) {
                    this.A03.A04.onAdLoaded(adA7K);
                    return;
                } else {
                    this.A00 = false;
                    return;
                }
            case 2104:
                this.A04.A0F().A3g();
                this.A03.A04.onAdClicked(adA7K);
                return;
            case 2105:
                this.A03.A04.onLoggingImpression(adA7K);
                return;
            case 2106:
                if (this.A03.A04 instanceof RewardedVideoAdExtendedListener) {
                    ((RewardedVideoAdExtendedListener) this.A03.A04).onRewardedVideoActivityDestroyed();
                    return;
                }
                return;
            case 2110:
                this.A04.A0F().ABl();
                this.A03.A04.onRewardedVideoClosed();
                return;
            case 3000:
                this.A04.A0F().A3y();
                this.A03.A04.onRewardedVideoCompleted();
                return;
            case 3001:
                this.A04.A0F().ACl();
                if (this.A03.A04 instanceof S2SRewardedVideoAdListener) {
                    ((S2SRewardedVideoAdListener) this.A03.A04).onRewardServerSuccess();
                    return;
                }
                return;
            case 3002:
                this.A04.A0F().ACk();
                if (this.A03.A04 instanceof S2SRewardedVideoAdListener) {
                    ((S2SRewardedVideoAdListener) this.A03.A04).onRewardServerFailed();
                    return;
                }
                return;
            default:
                return;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final void AL5(boolean z11) {
        this.A00 = z11;
    }
}
