package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

/* renamed from: com.facebook.ads.redexgen.X.oH, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2285oH {
    public static byte[] A0C;
    public static String[] A0D = {"D9utVieqpHmzq", "1reJ20tywIkt8c03XFg68iFkPgUpcQh9", "1hiVgm3FzyAWthqubctijKn7iSl8t7OZ", "2MGbhVYWK6vnLzanQZMPK5FLJbU6N2Mg", "tHlP6Jv5sj70nCQXOaNATx3kiWqPf1Tp", "kSrICwDX6P2QTtBsWrInLj9wi3Ca9feR", "Z5GcmA6HHHf7tKUPWv2sbOMAsuTj15Gl", "CZogAanemwBaq"};
    public int A00;
    public C2095lA A01;
    public EnumC2265nx A02;
    public C2402qE A03;
    public String A04;
    public String A05;
    public String A06;
    public String A07;
    public boolean A08;
    public final InterfaceC2151m5 A09;
    public final AdPlacementType A0A;
    public final C2269o1 A0B;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 87);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0C = new byte[]{-69, -68, -91, -88, -61, -87, -68, -76, -87, -74, -83, -87, -78, -89, -87, -61, -72, -67, -76, -87, 18, 21, 48, 35, 22, 33, 32, 35, 37, 26, 31, 24, 48, 20, 32, 31, 23, 26, 24, 48, 29, 18, 36, 37, 48, 38, 33, 21, 18, 37, 22, 48, 37, 26, 30, 22, 10, 17, 12, 39, 17, 12, -32, -25, -30, -3, -14, -25, -21, -29, -3, -14, -19, -23, -29, -20, -29, -20, -23, -27, -18, -12, -1, -14, -27, -15, -11, -27, -13, -12, -1, -23, -28, -73, -61, -60, -60, -75, -50, -49, -41, -39, -23, -53, -50, -23, -45, -50, 11, 30, 26, 24, 7, 37, 14, 15, 20, 26, 25, -16, -19, -15, -17, -16, -4, -5, -10, -8, -13, -65, -70, -68, -73, -43, -68, -62, -73, -67, -4, 6, 18, 0, 8, -1, 7, -4, 18, -12, -9, 18, -8, 11, 3, -8, 5, -4, -8, 1, -10, -8, -14, -18, 6, -7, -20, -6, -5, -7, -16, -22, -5, -20, -21, -43, -54, -36, -35, -24, -36, -54, -33, -50, -51, -24, -43, -40, -52, -54, -43, -50, 22, 29, 21, 39, 9, 12, 27, 39, 26, 13, 25, 29, 13, 27, 28, 13, 12, -86, -90, -101, -99, -97, -89, -97, -88, -82, -71, -93, -98, -59, -63, -74, -72, -70, -62, -70, -61, -55, -44, -55, -50, -59, -70, 39, 26, 38, 42, 26, 40, 41, 52, 41, 30, 34, 26, 28, 29, 10, 12, 20, 40, 29, 27, 10, 12, 14, -49, -64, -56, -53, -57, -68, -49, -64, -38, -60, -65, 14, -1, 13, 14, 25, 7, 9, -2, -1, -30, -44, -49, -33, -45};
    }

    static {
        A02();
    }

    public C2285oH(C2095lA c2095lA, String str, C2402qE c2402qE, EnumC2265nx enumC2265nx, int i5, C2269o1 c2269o1, String str2, String str3, String str4, InterfaceC2151m5 interfaceC2151m5) {
        this.A01 = c2095lA;
        this.A06 = str;
        this.A03 = c2402qE;
        this.A02 = enumC2265nx;
        this.A00 = i5;
        this.A0B = c2269o1;
        this.A0A = enumC2265nx.A05(this.A01);
        this.A07 = str2;
        this.A05 = str3;
        this.A04 = str4;
        this.A09 = interfaceC2151m5;
    }

    private long A00() {
        SharedPreferences sharedPreferencesA00 = AbstractC2297oU.A00(this.A01);
        String strA01 = A01(0, 0, 83);
        String strA012 = A01(TTAdConstant.IMAGE_MODE_VERTICAL_IMG_173, 17, 50);
        String string = sharedPreferencesA00.getString(strA012, strA01);
        if (string == null) {
            return 0L;
        }
        String string2 = Locale.getDefault().toString();
        if (A0D[5].length() != 32) {
            throw new RuntimeException();
        }
        String[] strArr = A0D;
        strArr[7] = "UbRIo10SAcnK0";
        strArr[0] = "rMKDtS17rDD7f";
        if (string.equals(string2)) {
            return AbstractC1820gb.A00(this.A01.A02()).A09();
        }
        sharedPreferencesA00.edit().putString(strA012, Locale.getDefault().toString()).apply();
        return 0L;
    }

    private void A03(Map<String, String> params, String str, String str2) {
        params.put(str, str2);
    }

    public final int A04() {
        return this.A00;
    }

    public final InterfaceC2151m5 A05() {
        return this.A09;
    }

    public final AdPlacementType A06() {
        return this.A0A;
    }

    public final EnumC2265nx A07() {
        return this.A02;
    }

    public final C2402qE A08() {
        return this.A03;
    }

    public final String A09() {
        return this.A06;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0159  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x01c6  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x01d7  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0214  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0227  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Map<String, String> A0A(Map<String, String> map) {
        String strA01;
        String strA05;
        HashMap map2 = new HashMap(map);
        A03(map2, A01(Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE, 4, 91), AbstractC2063kb.A00().A03());
        if (AbstractC2063kb.A00().A04()) {
            strA01 = A01(0, 1, 52);
        } else {
            strA01 = A01(1, 1, 52);
        }
        A03(map2, A01(Sdk.SDKError.Reason.EMPTY_TPAT_ERROR_VALUE, 9, 31), strA01);
        A03(map2, A01(93, 5, 29), String.valueOf(this.A09.ABI()));
        String idfaFlag = A01(Sdk.SDKError.Reason.PLACEMENT_AD_TYPE_MISMATCH_VALUE, 12, 3);
        A03(map2, idfaFlag, this.A06);
        if (this.A0A != AdPlacementType.UNKNOWN) {
            A03(map2, A01(Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE, 14, 30), this.A0A.toString().toLowerCase());
        }
        if (this.A03 != null) {
            A03(map2, A01(276, 5, 52), String.valueOf(this.A03.A01()));
            A03(map2, A01(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 6, 81), String.valueOf(this.A03.A00()));
        }
        if (this.A02 != null) {
            A03(map2, A01(256, 11, 36), String.valueOf(this.A02.A04()));
        }
        InterfaceC2151m5 interfaceC2151m5 = this.A09;
        C2095lA c2095lA = this.A01;
        String[] strArr = A0D;
        String idfaFlag2 = strArr[1];
        if (idfaFlag2.charAt(22) == strArr[3].charAt(22)) {
            String[] strArr2 = A0D;
            strArr2[1] = "IzDezfH0vo2hFBj3g0HaogFvU1PF9PgW";
            strArr2[3] = "07eFZyxYDfzIdCogAj5SagFmNdTPnXPY";
            if (interfaceC2151m5.isTestMode(c2095lA)) {
                String strA012 = A01(267, 9, 99);
                String strA013 = A01(1, 1, 52);
                String[] strArr3 = A0D;
                String idfaFlag3 = strArr3[7];
                if (idfaFlag3.length() == strArr3[0].length()) {
                    A0D[5] = "fhkQkDUQCs0vTSuMh05aUEfBswduYuq5";
                    A03(map2, strA012, strA013);
                    if (this.A09.A9t() != null) {
                        A03(map2, A01(98, 10, 51), this.A09.A9t());
                    }
                    if (this.A00 != 0) {
                        A03(map2, A01(190, 17, 113), String.valueOf(this.A00));
                    }
                    if (this.A08) {
                        A03(map2, A01(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 22, 92), String.valueOf(this.A08));
                    }
                    A03(map2, A01(160, 13, 80), String.valueOf(C2427qd.A02(this.A01)));
                    A03(map2, A01(233, 12, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), C2416qS.A06(System.currentTimeMillis()));
                    if (this.A0B.A06() && this.A0B.A04() != null) {
                        A03(map2, A01(56, 6, 113), this.A0B.A04());
                    }
                    strA05 = this.A0B.A05();
                    if (!TextUtils.isEmpty(strA05)) {
                        A03(map2, A01(62, 14, 71), strA05);
                    }
                    if (this.A07 != null) {
                        String idfaFlag4 = A01(245, 11, 114);
                        A03(map2, idfaFlag4, this.A07);
                    }
                    A03(map2, A01(76, 17, 73), UUID.randomUUID().toString());
                    A03(map2, A01(20, 36, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), C2416qS.A07(A00()));
                    if (this.A05 != null) {
                        String idfaFlag5 = A01(108, 11, 111);
                        A03(map2, idfaFlag5, this.A05);
                    }
                    if (this.A04 != null) {
                        if (A0D[5].length() == 32) {
                            String[] strArr4 = A0D;
                            strArr4[1] = "oug9irQjulGDcN1zjjec1oFwPujMP8yb";
                            strArr4[3] = "P1fPvVUp9X55Q5Xl2H8DBdFxzWSw3WjN";
                            A03(map2, A01(2, 18, 13), this.A04);
                        }
                    }
                    return map2;
                }
            } else {
                if (this.A09.A9t() != null) {
                }
                if (this.A00 != 0) {
                }
                if (this.A08) {
                }
                A03(map2, A01(160, 13, 80), String.valueOf(C2427qd.A02(this.A01)));
                A03(map2, A01(233, 12, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), C2416qS.A06(System.currentTimeMillis()));
                if (this.A0B.A06()) {
                    A03(map2, A01(56, 6, 113), this.A0B.A04());
                }
                strA05 = this.A0B.A05();
                if (!TextUtils.isEmpty(strA05)) {
                }
                if (this.A07 != null) {
                }
                A03(map2, A01(76, 17, 73), UUID.randomUUID().toString());
                A03(map2, A01(20, 36, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), C2416qS.A07(A00()));
                if (this.A05 != null) {
                }
                if (this.A04 != null) {
                }
                return map2;
            }
        }
        throw new RuntimeException();
    }
}
