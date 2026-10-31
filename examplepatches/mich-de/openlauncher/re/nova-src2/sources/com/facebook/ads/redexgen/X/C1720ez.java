package com.facebook.ads.redexgen.X;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.AdError;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.ez, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1720ez extends BroadcastReceiver {
    public static byte[] A04;
    public static String[] A05 = {"Mqy89T38jyDNWJYJSU97Fc", "8J9Kjrdi7zCHtnCCZzRPzmuoDEsoDeEL", "VQNvZgn", "c7o7ADX8z3LY2p80YK3DAawzYrr5z54S", "gktsaQP9OjZySj1PqQ2WnsX4vKhqWtKG", "61ITioRvjCkhn", "SKricJIDyiylSn4Sa9TNq02zv28wIgF", "PC7X20f3JEut9CIsHKyQodWFOl4CO7PL"};
    public C1065Lq A00;
    public InterfaceC1719ey A01;
    public C0958Hi A02;
    public String A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 53);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{-39, -92, -80, -82, 111, -89, -94, -92, -90, -93, -80, -80, -84, 111, -94, -91, -76, 111, -86, -81, -75, -90, -77, -76, -75, -86, -75, -86, -94, -83, 111, -94, -92, -75, -86, -73, -86, -75, -70, -96, -91, -90, -76, -75, -77, -80, -70, -90, -91, -72, -60, -62, -125, -69, -74, -72, -70, -73, -60, -60, -64, -125, -74, -71, -56, -125, -66, -61, -55, -70, -57, -56, -55, -66, -55, -66, -74, -63, -125, -74, -72, -55, -66, -53, -66, -55, -50, -76, -71, -70, -56, -55, -57, -60, -50, -70, -71, -113, -44, -32, -34, -97, -41, -46, -44, -42, -45, -32, -32, -36, -97, -46, -43, -28, -97, -38, -33, -27, -42, -29, -28, -27, -38, -27, -38, -46, -35, -97, -44, -35, -38, -44, -36, -42, -43, 13, 25, 23, -40, 16, 11, 13, 15, 12, 25, 25, 21, -40, 11, 14, 29, -40, 19, 24, 30, 15, 28, 29, 30, 19, 30, 19, 11, 22, -40, 13, 22, 19, 13, 21, 15, 14, -28, -87, -75, -77, 116, -84, -89, -87, -85, -88, -75, -75, -79, 116, -89, -86, -71, 116, -81, -76, -70, -85, -72, -71, -70, -81, -70, -81, -89, -78, 116, -86, -81, -71, -77, -81, -71, -71, -85, -86, -76, -64, -66, AbstractJsonLexerKt.TC_INVALID, -73, -78, -76, -74, -77, -64, -64, -68, AbstractJsonLexerKt.TC_INVALID, -78, -75, -60, AbstractJsonLexerKt.TC_INVALID, -70, -65, -59, -74, -61, -60, -59, -70, -59, -70, -78, -67, AbstractJsonLexerKt.TC_INVALID, -75, -70, -60, -66, -70, -60, -60, -74, -75, -117, -58, -46, -48, -111, -55, -60, -58, -56, -59, -46, -46, -50, -111, -60, -57, -42, -111, -52, -47, -41, -56, -43, -42, -41, -52, -41, -52, -60, -49, -111, -57, -52, -42, -45, -49, -60, -36, -56, -57, -30, -18, -20, -83, -27, -32, -30, -28, -31, -18, -18, -22, -83, -32, -29, -14, -83, -24, -19, -13, -28, -15, -14, -13, -24, -13, -24, -32, -21, -83, -29, -24, -14, -17, -21, -32, -8, -28, -29, -71, -104, -92, -94, 99, -101, -106, -104, -102, -105, -92, -92, -96, 99, -106, -103, -88, 99, -98, -93, -87, -102, -89, -88, -87, -98, -87, -98, -106, -95, 99, -102, -89, -89, -92, -89, -53, -41, -43, -106, -50, -55, -53, -51, -54, -41, -41, -45, -106, -55, -52, -37, -106, -47, -42, -36, -51, -38, -37, -36, -47, -36, -47, -55, -44, -106, -51, -38, -38, -41, -38, -94, -66, -54, -56, -119, -63, -68, -66, -64, -67, -54, -54, -58, -119, -68, -65, -50, -119, -60, -55, -49, -64, -51, -50, -49, -60, -49, -60, -68, -57, -119, -63, -60, -55, -60, -50, -61, -70, -68, -66, -49, -60, -47, -60, -49, -44, -107, -93, -81, -83, 110, -90, -95, -93, -91, -94, -81, -81, -85, 110, -95, -92, -77, 110, -87, -82, -76, -91, -78, -77, -76, -87, -76, -87, -95, -84, 110, -87, -83, -80, -78, -91, -77, -77, -87, -81, -82, 110, -84, -81, -89, -89, -91, -92, -75, -63, -65, -128, -72, -77, -75, -73, -76, -63, -63, -67, -128, -77, -74, -59, -128, -69, -64, -58, -73, -60, -59, -58, -69, -58, -69, -77, -66, -128, -69, -65, -62, -60, -73, -59, -59, -69, -63, -64, -128, -66, -63, -71, -71, -73, -74, -116, -52, -40, -42, -105, -49, -54, -52, -50, -53, -40, -40, -44, -105, -54, -51, -36, -105, -46, -41, -35, -50, -37, -36, -35, -46, -35, -46, -54, -43, -105, -37, -50, -32, -54, -37, -51, -23, -11, -13, -76, -20, -25, -23, -21, -24, -11, -11, -15, -76, -25, -22, -7, -76, -17, -12, -6, -21, -8, -7, -6, -17, -6, -17, -25, -14, -76, -8, -21, -3, -25, -8, -22, -64, 21, 33, 31, -32, 24, 19, 21, 23, 20, 33, 33, 29, -32, 19, 22, 37, -32, 27, 32, 38, 23, 36, 37, 38, 27, 38, 27, 19, 30, -32, 36, 23, 41, 19, 36, 22, 17, 37, 23, 36, 40, 23, 36, 17, 24, 19, 27, 30, 39, 36, 23, -61, -49, -51, -114, -58, -63, -61, -59, -62, -49, -49, -53, -114, -63, -60, -45, -114, -55, -50, -44, -59, -46, -45, -44, -55, -44, -55, -63, -52, -114, -46, -59, -41, -63, -46, -60, -65, -45, -59, -46, -42, -59, -46, -65, -58, -63, -55, -52, -43, -46, -59, -102, -46, -34, -36, -99, -43, -48, -46, -44, -47, -34, -34, -38, -99, -48, -45, -30, -99, -40, -35, -29, -44, -31, -30, -29, -40, -29, -40, -48, -37, -99, -31, -44, -26, -48, -31, -45, -50, -30, -44, -31, -27, -44, -31, -50, -30, -28, -46, -46, -44, -30, -30, -73, -61, -63, -126, -70, -75, -73, -71, -74, -61, -61, -65, -126, -75, -72, -57, -126, -67, -62, -56, -71, -58, -57, -56, -67, -56, -67, -75, -64, -126, -58, -71, -53, -75, -58, -72, -77, -57, -71, -58, -54, -71, -58, -77, -57, -55, -73, -73, -71, -57, -57, -114};
    }

    static {
        A01();
    }

    public C1720ez(C0958Hi c0958Hi, String str, C1065Lq c1065Lq, InterfaceC1719ey interfaceC1719ey) {
        this.A02 = c0958Hi;
        this.A03 = str;
        this.A01 = interfaceC1719ey;
        this.A00 = c1065Lq;
    }

    public final void A02() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(A00(495, 48, 29) + this.A03);
        intentFilter.addAction(A00(291, 40, 74) + this.A03);
        intentFilter.addAction(A00(Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE, 40, 28) + this.A03);
        intentFilter.addAction(A00(Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE, 38, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE) + this.A03);
        intentFilter.addAction(A00(366, 36, 51) + this.A03);
        intentFilter.addAction(A00(49, 49, 32) + this.A03);
        intentFilter.addAction(A00(579, 37, 81) + this.A03);
        intentFilter.addAction(A00(770, 52, 31) + this.A03);
        intentFilter.addAction(A00(667, 52, 43) + this.A03);
        intentFilter.addAction(A00(TTAdConstant.AD_ID_IS_NULL_CODE, 46, 38) + this.A03);
        C1840gw.A00(this.A02).A06(this, intentFilter);
    }

    public final void A03() {
        try {
            C1840gw.A00(this.A02).A05(this);
        } catch (Exception unused) {
        }
    }

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (action == null) {
            return;
        }
        String intentAction = A00(0, 1, 106);
        String[] parts = action.split(intentAction);
        String str = parts[0];
        if (this.A01 == null || str == null) {
            return;
        }
        String intentAction2 = A00(98, 37, 60);
        if (intentAction2.equals(str)) {
            InterfaceC1719ey interfaceC1719ey = this.A01;
            C1065Lq c1065Lq = this.A00;
            String[] parts2 = A05;
            String intentAction3 = parts2[0];
            if (intentAction3.length() != 22) {
                throw new RuntimeException();
            }
            A05[3] = "aZIvEWsb8DNHwIIatfYd47toXevBFNNm";
            interfaceC1719ey.AFF(c1065Lq, null, true);
            return;
        }
        String intentAction4 = A00(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 39, 17);
        if (intentAction4.equals(str)) {
            InterfaceC1719ey interfaceC1719ey2 = this.A01;
            C1065Lq c1065Lq2 = this.A00;
            String[] parts3 = A05;
            if (parts3[3].charAt(4) != 'D') {
                A05[0] = "TqpNublq1V6zWfVafs4QLB";
                interfaceC1719ey2.AFG(c1065Lq2);
                return;
            } else {
                A05[3] = "eUYQ7IhEg8fLvUIhXbZonlQsFkme40oK";
                interfaceC1719ey2.AFG(c1065Lq2);
                return;
            }
        }
        String intentAction5 = A00(252, 39, 46);
        if (intentAction5.equals(str)) {
            this.A01.AFH(this.A00);
            return;
        }
        String intentAction6 = A00(448, 47, 11);
        if (intentAction6.equals(str)) {
            this.A01.AFK(this.A00);
            return;
        }
        String intentAction7 = A00(331, 35, 0);
        if (intentAction7.equals(str)) {
            if (C2203mv.A1y(context)) {
                this.A01.AFJ(this.A00, AdError.AD_PRESENTATION_ERROR);
                return;
            } else {
                this.A01.AFJ(this.A00, AdError.INTERNAL_ERROR);
                return;
            }
        }
        String intentAction8 = A00(1, 48, 12);
        if (intentAction8.equals(str)) {
            InterfaceC1719ey interfaceC1719ey3 = this.A01;
            String[] strArr = A05;
            String str2 = strArr[5];
            String intentAction9 = strArr[6];
            if (str2.length() != intentAction9.length()) {
                String[] strArr2 = A05;
                strArr2[5] = "PFaD7A78iWhw0";
                strArr2[6] = "Xokjp6dtHHi9pHEHnv2i6gjJxblfyLK";
                interfaceC1719ey3.onInterstitialActivityDestroyed();
                return;
            }
            String[] strArr3 = A05;
            strArr3[5] = "QgYf1mTjAK5D7";
            strArr3[6] = "MAH4q6CsALUjtSr7ZeRTo0JQtTwrXFy";
            interfaceC1719ey3.onInterstitialActivityDestroyed();
            return;
        }
        String intentAction10 = A00(543, 36, 52);
        if (intentAction10.equals(str)) {
            this.A01.AFL();
            return;
        }
        String intentAction11 = A00(719, 51, 58);
        if (intentAction11.equals(str)) {
            InterfaceC1719ey interfaceC1719ey4 = this.A01;
            String[] parts4 = A05;
            if (parts4[7].charAt(0) != 'P') {
                throw new RuntimeException();
            }
            A05[0] = "2dNMpRkIvORsTqY7tSIXPx";
            interfaceC1719ey4.AFN();
            return;
        }
        String intentAction12 = A00(616, 51, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
        if (intentAction12.equals(str)) {
            this.A01.AFM();
        }
    }
}
