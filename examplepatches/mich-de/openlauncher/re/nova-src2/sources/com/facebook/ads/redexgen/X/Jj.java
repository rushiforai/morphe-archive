package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import android.os.Message;
import android.util.Log;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.AdError;
import com.facebook.ads.InterstitialAd;
import com.facebook.ads.InterstitialAdExtendedListener;
import com.facebook.ads.InterstitialAdListener;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class Jj implements InterfaceC1803gK {
    public static byte[] A05;
    public static String[] A06 = {"PyT2XUnl", "3EmvKqRjFYzRkizxlD8eotggUBC8U5J9", "Ib6uyfMRsh5ysHZ3i8ryXk3sO16qq9Ys", "q2kkzr74cnXMazMYxmC9c", "9U931lGThJH7Qz6wctlm6EKEWHFtvDAV", "f15MquYM06llw3BWZWASFwAp5egI2HKX", "yMUgiPhi", "t3xZZPMR"};
    public boolean A00;
    public final InterfaceC1788g5 A01;
    public final C1020Jv A02;
    public final HandlerC1795gC A03;
    public final C0958Hi A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 57);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{-77, -42, -110, -31, -44, -36, -41, -43, -26, -110, -37, -27, -110, -32, -25, -34, -34, -115, -96, -103, -113, -105, -112, -86, -112, -93, -97, -99, -116, -98, -86, -106, -112, -92, -74, -78, -79, -27, -44, -39, -43, -34, -45, -43, -66, -43, -28, -25, -33, -30, -37, -87, -82, -76, -65, -91, -78, -78, -81, -78, -65, -93, -81, -92, -91, -65, -85, -91, -71, 4, 7, 6, -1, 23, 1, 6, 14, -7, 4, 1, -4, -7, 12, 1, 7, 6, 23, 12, 1, 5, -3, 23, 3, -3, 17, -61, -37, -23, -23, -41, -35, -37, -80, -106, -66, -38, -28, -28, -38, -33, -40, -111, -45, -26, -33, -43, -35, -42, -111, -41, -32, -29, -111, -34, -42, -28, -28, -46, -40, -42, -97, -95, -94, -96, -83, -109, -96, -96, -99, -96, -83, -101, -109, -95, -95, -113, -107, -109, -83, -103, -109, -89, 4, 19, 12};
    }

    static {
        A01();
    }

    public Jj(C0958Hi c0958Hi, C1020Jv c1020Jv, InterfaceC1788g5 interfaceC1788g5, HandlerC1795gC handlerC1795gC) {
        this.A04 = c0958Hi;
        this.A02 = c1020Jv;
        this.A01 = interfaceC1788g5;
        this.A03 = handlerC1795gC;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final Bundle A60(String str) {
        return AbstractC1810gR.A02(str, this.A02);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final void A6U() {
        this.A03.A0F(TTAdConstant.IMAGE_MODE_1012, null);
        this.A03.A0C();
        this.A02.A0D(null);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final int A91() {
        return TTAdConstant.IMAGE_MODE_1010;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:19:0x00ad  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x00b5 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00eb  */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void AAN(Message message) {
        InterstitialAd interstitialAdA7K = this.A02.A7K();
        String strA00 = A00(152, 3, 106);
        if (interstitialAdA7K == null) {
            this.A04.A08().ABz(strA00, AbstractC2126lf.A0K, new C2127lg(A00(0, 17, 57)));
            return;
        }
        int i5 = message.what;
        String strA002 = A00(95, 9, 61);
        String strA003 = A00(104, 27, 56);
        String strA004 = A00(17, 17, 18);
        switch (i5) {
            case 10:
            case 1023:
                EnumC2154m8.A04(EnumC2154m8.A0A, EnumC2154m8.A07);
                Bundle bundle = message.getData().getBundle(strA004);
                if (bundle != null) {
                    int i11 = bundle.getInt(A00(51, 18, 39));
                    String string = bundle.getString(A00(Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, 21, 21));
                    AdError adError = new AdError(i11, string);
                    this.A01.AKj(adError);
                    if (this.A02.A7O() != null) {
                        InterstitialAdListener interstitialAdListenerA7O = this.A02.A7O();
                        String[] strArr = A06;
                        String str = strArr[3];
                        String str2 = strArr[7];
                        int errorCode = str.length();
                        if (errorCode != str2.length()) {
                            A06[2] = "38H5G1BKqQclfZgbDo4KbeEy0dV8wgme";
                            interstitialAdListenerA7O.onError(interstitialAdA7K, adError);
                        } else {
                            String[] strArr2 = A06;
                            strArr2[6] = "pEqkzk2o";
                            strArr2[0] = "rqU6ms8L";
                            interstitialAdListenerA7O.onError(interstitialAdA7K, adError);
                        }
                    } else {
                        Log.e(A00(34, 17, 55), string);
                    }
                } else {
                    this.A01.AKe(EnumC1787g4.A05);
                    this.A04.A08().ABz(strA00, AbstractC2126lf.A0V, new C2127lg(strA003, strA002 + message));
                }
                this.A02.A0D(null);
                return;
            case 1020:
                this.A01.AKo();
                Bundle bundle2 = message.getData().getBundle(strA004);
                if (bundle2 != null) {
                    this.A02.A0C(bundle2.getLong(A00(69, 26, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE)));
                } else {
                    this.A04.A08().ABz(strA00, AbstractC2126lf.A0V, new C2127lg(strA003, strA002 + message));
                }
                this.A02.A0D(null);
                break;
            case 1022:
                this.A01.AL4();
                break;
        }
        if (this.A02.A7O() == null) {
            return;
        }
        switch (message.what) {
            case 1020:
                EnumC2154m8.A04(EnumC2154m8.A0A, EnumC2154m8.A09);
                if (!this.A00) {
                    this.A02.A7O().onAdLoaded(interstitialAdA7K);
                    return;
                } else {
                    this.A00 = false;
                    return;
                }
            case 1021:
                this.A04.A0F().AAz();
                InterstitialAdListener interstitialAdListenerA7O2 = this.A02.A7O();
                if (A06[2].charAt(18) != 'n') {
                    String[] strArr3 = A06;
                    strArr3[1] = "IMuRostxJ5htnzhiOcsxYcu1iidsGUgj";
                    strArr3[5] = "ubJ4M5GxN6FfPval4rtOnbhl8vPUgGKC";
                    interstitialAdListenerA7O2.onInterstitialDisplayed(interstitialAdA7K);
                    return;
                }
                throw new RuntimeException();
            case 1022:
                this.A04.A0F().AAy();
                this.A02.A7O().onInterstitialDismissed(interstitialAdA7K);
                return;
            case 1023:
            default:
                if (this.A02.A04() != null) {
                    return;
                }
                int i12 = message.what;
                String[] strArr4 = A06;
                if (strArr4[3].length() != strArr4[7].length()) {
                    A06[4] = "YO9dGq40ZDljeOjTjHA4uB3VVKU9R56I";
                    switch (i12) {
                        case 3000:
                            this.A04.A0F().A3y();
                            this.A02.A04().onRewardedAdCompleted();
                            return;
                        case 3001:
                            this.A04.A0F().ACl();
                            C1020Jv c1020Jv = this.A02;
                            if (A06[2].charAt(18) == 'n') {
                                c1020Jv.A04().onRewardedAdServerSucceeded();
                                return;
                            }
                            String[] strArr5 = A06;
                            strArr5[1] = "4ubpoteMIucGsWyTMsTtOH4ZOdBl9bHr";
                            strArr5[5] = "Xxx4qDjyhZoijrhiIp4u1mFMOEMCLZoL";
                            c1020Jv.A04().onRewardedAdServerSucceeded();
                            return;
                        case 3002:
                            this.A04.A0F().ACk();
                            this.A02.A04().onRewardedAdServerFailed();
                            return;
                        default:
                            return;
                    }
                }
                throw new RuntimeException();
            case 1024:
                this.A04.A0F().A3g();
                this.A02.A7O().onAdClicked(interstitialAdA7K);
                return;
            case 1025:
                this.A02.A7O().onLoggingImpression(interstitialAdA7K);
                return;
            case 1026:
                this.A04.A0F().AAx();
                if (this.A02.A7O() instanceof InterstitialAdExtendedListener) {
                    C1020Jv c1020Jv2 = this.A02;
                    if (A06[2].charAt(18) != 'n') {
                        A06[2] = "QiAUsDkapNh1fTZA9J8Gsz0JLC17Ghy8";
                        ((InterstitialAdExtendedListener) c1020Jv2.A7O()).onInterstitialActivityDestroyed();
                        if (this.A02.A04() != null) {
                        }
                    }
                }
                throw new RuntimeException();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1803gK
    public final void AL5(boolean z11) {
        this.A00 = z11;
    }
}
