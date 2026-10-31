package com.facebook.ads.redexgen.X;

import android.app.ActivityOptions;
import android.app.PendingIntent;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.text.TextUtils;
import android.util.SparseArray;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class J0 {
    public static byte[] A0B;
    public static String[] A0C = {"2a6ba3guspzsznVdC0TP9CS9bHV5fKvw", b.f42142b, "8rViwyKkHBncHMUMY", "Gda7KLLrRRE9ceKgYJTvia8WloJ51HdT", "M0NWTVM9q1v6qfv3DKjcP78ykP8c5Vb7", "ffYoLWnXX17PhXG7plBp1GbOkrFG6ZLx", "vL03KCqOs4Luzfj0Bj6MDX3ZjFTul0VJ", "YZoOs5jnNCYPvkQ6bUKk5VJVrU4MT11"};
    public ActivityOptions A01;
    public Bundle A02;
    public SparseArray<Bundle> A03;
    public ArrayList<Bundle> A04;
    public ArrayList<Bundle> A05;
    public ArrayList<Bundle> A06;
    public boolean A08;
    public final Intent A09 = new Intent(A01(165, 26, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
    public final IT A0A = new IT();
    public int A00 = 0;
    public boolean A07 = true;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0B, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 13);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A05() {
        A0B = new byte[]{-82, -48, -48, -46, -35, -31, -102, -71, -50, -37, -44, -30, -50, -44, -46, -116, -79, -71, -92, -81, -84, -89, 99, -71, -92, -81, -72, -88, 99, -87, -78, -75, 99, -73, -85, -88, 99, -92, -90, -73, -84, -71, -84, -73, -68, -117, -88, -84, -86, -85, -73, -107, -88, -74, -84, -67, -88, -123, -88, -85, -92, -71, -84, -78, -75, 99, -92, -75, -86, -72, -80, -88, -79, -73, -52, -15, -7, -28, -17, -20, -25, -93, -7, -28, -17, -8, -24, -93, -23, -14, -11, -93, -9, -21, -24, -93, -20, -15, -20, -9, -20, -28, -17, -53, -24, -20, -22, -21, -9, -45, -5, -93, -28, -11, -22, -8, -16, -24, -15, -9, -69, -32, -24, -45, -34, -37, -42, -110, -24, -45, -34, -25, -41, -110, -40, -31, -28, -110, -26, -38, -41, -110, -37, -32, -37, -26, -37, -45, -34, -55, -37, -42, -26, -38, -62, -22, -110, -45, -28, -39, -25, -33, -41, -32, -26, -22, -9, -19, -5, -8, -14, -19, -73, -14, -9, -3, -18, -9, -3, -73, -22, -20, -3, -14, -8, -9, -73, -33, -46, -50, -32, -61, -48, -58, -44, -47, -53, -58, -112, -43, -41, -46, -46, -47, -44, -42, -112, -59, -41, -43, -42, -47, -49, -42, -61, -60, -43, -112, -57, -38, -42, -44, -61, -112, -89, -70, -74, -76, -93, -63, -89, -80, -93, -92, -82, -89, -63, -85, -80, -75, -74, -93, -80, -74, -63, -93, -78, -78, -75, -34, -21, -31, -17, -20, -26, -31, -85, -16, -14, -19, -19, -20, -17, -15, -85, -32, -14, -16, -15, -20, -22, -15, -34, -33, -16, -85, -30, -11, -15, -17, -34, -85, -54, -62, -53, -46, -36, -58, -47, -62, -54, -48, -113, -100, -110, -96, -99, -105, -110, 92, -95, -93, -98, -98, -99, -96, -94, 92, -111, -93, -95, -94, -99, -101, -94, -113, -112, -95, 92, -109, -90, -94, -96, -113, 92, -127, 115, -127, -127, 119, 125, 124, 113, 126, 116, -126, AbstractJsonLexerKt.TC_INVALID, 121, 116, 62, -125, -123, -128, -128, AbstractJsonLexerKt.TC_INVALID, -126, -124, 62, 115, -123, -125, -124, AbstractJsonLexerKt.TC_INVALID, 125, -124, 113, 114, -125, 62, 117, -120, -124, -126, 113, 62, 99, 85, 99, 99, 89, 95, 94, 111, 89, 84, -80, -67, -77, -63, -66, -72, -77, 125, -62, -60, -65, -65, -66, -63, -61, 125, -78, -60, -62, -61, -66, -68, -61, -80, -79, -62, 125, -76, -57, -61, -63, -80, 125, -93, -104, -93, -101, -108, -82, -91, -104, -94, -104, -111, -104, -101, -104, -93, -88, 120, -123, 123, -119, -122, -128, 123, 69, -118, -116, -121, -121, -122, -119, -117, 69, 122, -116, -118, -117, -122, -124, -117, 120, 121, -118, 69, 124, -113, -117, -119, 120, 69, 107, 102, 102, 99, 89, 88, 105, 118, 96, 107, 92, 100, 106, -105, -92, -102, -88, -91, -97, -102, -82, 100, -104, -88, -91, -83, -87, -101, -88, 100, -103, -85, -87, -86, -91, -93, -86, -105, -104, -87, 100, -101, -82, -86, -88, -105, 100, 119, 121, -118, AbstractJsonLexerKt.TC_INVALID, -116, AbstractJsonLexerKt.TC_INVALID, -118, -113, -107, 126, 123, AbstractJsonLexerKt.TC_INVALID, 125, 126, -118, -107, -120, 123, -119, AbstractJsonLexerKt.TC_INVALID, -112, 123, -107, 120, 123, 126, 119, -116, AbstractJsonLexerKt.TC_INVALID, -123, -120, -56, -43, -53, -39, -42, -48, -53, -33, -107, -55, -39, -42, -34, -38, -52, -39, -107, -54, -36, -38, -37, -42, -44, -37, -56, -55, -38, -107, -52, -33, -37, -39, -56, -107, -86, -74, -77, -74, -71, -58, -70, -86, -81, -84, -76, -84, -58, -73, -88, -71, -88, -76, -70, 125, -118, -128, -114, -117, -123, -128, -108, 74, 126, -114, -117, -109, -113, -127, -114, 74, AbstractJsonLexerKt.TC_INVALID, -111, -113, -112, -117, -119, -112, 125, 126, -113, 74, -127, -108, -112, -114, 125, 74, 95, 113, 111, 112, 107, 105, 123, 95, 107, 106, 112, 97, 106, 112, 123, 93, 95, 112, 101, 107, 106, 111, -55, -42, -52, -38, -41, -47, -52, -32, -106, -54, -38, -41, -33, -37, -51, -38, -106, -53, -35, -37, -36, -41, -43, -36, -55, -54, -37, -106, -51, -32, -36, -38, -55, -106, -79, -74, -79, -68, -79, -87, -76, -57, -87, -85, -68, -79, -66, -79, -68, -63, -57, -80, -83, -79, -81, -80, -68, -57, -72, -64, -62, -49, -59, -45, -48, -54, -59, -39, -113, -61, -45, -48, -40, -44, -58, -45, -113, -60, -42, -44, -43, -48, -50, -43, -62, -61, -44, -113, -58, -39, -43, -45, -62, -113, -86, -81, -86, -75, -86, -94, -83, -64, -94, -92, -75, -86, -73, -86, -75, -70, -64, -72, -86, -91, -75, -87, -64, -79, -71, 124, -119, AbstractJsonLexerKt.TC_INVALID, -115, -118, -124, AbstractJsonLexerKt.TC_INVALID, -109, 73, 125, -115, -118, -110, -114, -128, -115, 73, 126, -112, -114, -113, -118, -120, -113, 124, 125, -114, 73, -128, -109, -113, -115, 124, 73, 110, 99, 92, 109, 96, 122, 110, 111, 92, 111, 96, -25, -13, -15, -78, -27, -14, -24, -10, -13, -19, -24, -78, -26, -10, -13, -5, -9, -23, -10, -78, -20, -23, -27, -24, -23, -10, -9};
    }

    static {
        A05();
    }

    public J0() {
    }

    public J0(JQ jq2) {
        if (jq2 != null) {
            A00(jq2);
        }
    }

    private final J0 A00(JQ jq2) {
        this.A09.setPackage(jq2.A01().getPackageName());
        A06(jq2.A02(), jq2.A00());
        return this;
    }

    private void A02() {
        if (this.A01 == null) {
            this.A01 = C0997Iw.A00();
        }
        C1000Iz.A00(this.A01, J6.A02(this.A09));
    }

    private void A03() {
        Bundle bundle;
        String strA00 = C0998Ix.A00();
        if (!TextUtils.isEmpty(strA00)) {
            Intent intent = this.A09;
            String strA01 = A01(808, 27, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE);
            if (intent.hasExtra(strA01)) {
                bundle = this.A09.getBundleExtra(strA01);
            } else {
                bundle = new Bundle();
            }
            String strA012 = A01(0, 15, 96);
            if (!bundle.containsKey(strA012)) {
                bundle.putString(strA012, strA00);
                Intent intent2 = this.A09;
                String[] strArr = A0C;
                if (strArr[3].charAt(25) == strArr[5].charAt(25)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A0C;
                strArr2[0] = "q03gYeNQUAg2DgsUhcvPcylCLTvRq0q2";
                strArr2[6] = "9i5QoBIBk0lES1dgsyURDRpATbjoH3dg";
                intent2.putExtra(strA01, bundle);
            }
        }
    }

    private void A04() {
        if (this.A01 == null) {
            this.A01 = C0997Iw.A00();
        }
        C0999Iy.A00(this.A01, this.A08);
    }

    private void A06(IBinder iBinder, PendingIntent pendingIntent) {
        Bundle bundle = new Bundle();
        bundle.putBinder(A01(292, 40, 33), iBinder);
        if (pendingIntent != null) {
            String[] strArr = A0C;
            if (strArr[1].length() == strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0C;
            strArr2[0] = "raydqOYPHuNvs0RQ7NQKn2IHhBtZjjVP";
            strArr2[6] = "XKwfhrVbuKgB0azKhyaXANsETbOgl24K";
            bundle.putParcelable(A01(332, 43, 3), pendingIntent);
        }
        this.A09.putExtras(bundle);
    }

    public final J0 A07(int i5) {
        if (i5 > 0) {
            Intent intent = this.A09;
            String[] strArr = A0C;
            if (strArr[1].length() == strArr[2].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0C;
            strArr2[3] = "R68CsIJClIVrrODf5MzHw4iqhUKdUi1i";
            strArr2[5] = "1qHZzufDvfkUdCrfiZiGKCJz0tt87kuO";
            intent.putExtra(A01(704, 59, 84), i5);
            return this;
        }
        throw new IllegalArgumentException(A01(120, 45, 101));
    }

    public final J0 A08(int i5, int i11) {
        if (i5 > 0) {
            if (i11 >= 0 && i11 <= 2) {
                this.A09.putExtra(A01(644, 60, 91), i5);
                this.A09.putExtra(A01(470, 65, 41), i11);
                return this;
            }
            throw new IllegalArgumentException(A01(15, 59, 54));
        }
        throw new IllegalArgumentException(A01(74, 46, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE));
    }

    public final J0 A09(boolean z11) {
        this.A09.putExtra(A01(375, 49, 66), z11 ? 1 : 0);
        return this;
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0085  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0090  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00f1  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0104  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x010b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final J6 A0A() {
        if (this.A09.hasExtra(A01(292, 40, 33))) {
            if (this.A06 != null) {
                this.A09.putParcelableArrayListExtra(A01(249, 43, 112), this.A06);
            }
            if (this.A04 != null) {
                this.A09.putParcelableArrayListExtra(A01(424, 46, 10), this.A04);
            }
            this.A09.putExtra(A01(191, 58, 85), this.A07);
            this.A09.putExtras(this.A0A.A00().A02());
            if (this.A02 != null) {
                this.A09.putExtras(this.A02);
            }
            if (this.A03 != null) {
                Bundle bundle = new Bundle();
                bundle.putSparseParcelableArray(A01(535, 53, 90), this.A03);
                this.A09.putExtras(bundle);
            }
            this.A09.putExtra(A01(763, 45, 14), this.A00);
            if (this.A05 != null && !this.A05.isEmpty()) {
                Intent intent = this.A09;
                if (A0C[7].length() != 23) {
                    A0C[7] = "7yFXsOtip8nhaxSsHmZFHtP1Yo";
                    intent.putParcelableArrayListExtra(A01(588, 56, 15), this.A05);
                }
            }
            if (Build.VERSION.SDK_INT >= 24) {
                A03();
            }
            Bundle bundle2 = null;
            if (Build.VERSION.SDK_INT >= 34) {
                A04();
            }
            if (Build.VERSION.SDK_INT >= 36) {
                A02();
            }
            if (this.A01 != null) {
                bundle2 = this.A01.toBundle();
            }
            return new J6(this.A09, bundle2);
        }
        if (A0C[4].charAt(21) == '7') {
            String[] strArr = A0C;
            strArr[0] = "APkkJ8YAswrAMSw4WhEFQGov7iI1DF3K";
            strArr[6] = "t3YOCrf65G17NT13UlXej7nrbJScgQnW";
            A06(null, null);
            if (this.A06 != null) {
            }
            if (this.A04 != null) {
            }
            this.A09.putExtra(A01(191, 58, 85), this.A07);
            this.A09.putExtras(this.A0A.A00().A02());
            if (this.A02 != null) {
            }
            if (this.A03 != null) {
            }
            this.A09.putExtra(A01(763, 45, 14), this.A00);
            if (this.A05 != null) {
                Intent intent2 = this.A09;
                if (A0C[7].length() != 23) {
                }
            }
            if (Build.VERSION.SDK_INT >= 24) {
            }
            Bundle bundle22 = null;
            if (Build.VERSION.SDK_INT >= 34) {
            }
            if (Build.VERSION.SDK_INT >= 36) {
            }
            if (this.A01 != null) {
            }
            return new J6(this.A09, bundle22);
        }
        throw new RuntimeException();
    }
}
