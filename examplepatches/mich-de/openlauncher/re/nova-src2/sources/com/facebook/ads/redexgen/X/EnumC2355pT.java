package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import org.json.JSONArray;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* renamed from: com.facebook.ads.redexgen.X.pT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class EnumC2355pT {
    public static byte[] A01;
    public static String[] A02 = {"peMj4ElOSd01OT896P3XIxuMBnkHt0Yg", "YxwuK", "RWqd9itfSe0k84KU0sMIeZH85sWcmyMm", "VyxqqxEjvQdWG5mRQOQZWtDV", "CT7", "9P7UbmIn4oWLvhrokaQlBwpUWGR4DJQp", "qZG4OBcKZbOtuSoiMtKNO3LpLPIUPJfv", "6QNbfmd4MoWC9bt9rpmpUstZbDlYEQia"};
    public static final EnumC2355pT[] A03;
    public static final String A04;
    public static final /* synthetic */ EnumC2355pT[] A05;
    public static final EnumC2355pT A06;
    public static final EnumC2355pT A07;
    public static final EnumC2355pT A08;
    public static final EnumC2355pT A09;
    public static final EnumC2355pT A0A;
    public static final EnumC2355pT A0B;
    public static final EnumC2355pT A0C;
    public static final EnumC2355pT A0D;
    public static final EnumC2355pT A0E;
    public static final EnumC2355pT A0F;
    public static final EnumC2355pT A0G;
    public static final EnumC2355pT A0H;
    public static final EnumC2355pT A0I;
    public static final EnumC2355pT A0J;
    public static final EnumC2355pT A0K;
    public final int A00;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 14);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A01 = new byte[]{-77, -74, -47, -75, -70, -63, -69, -75, -73, -59, -115, -100, -100, -85, -115, -112, 98, 113, 113, -128, 98, 101, -128, 119, 83, -120, -105, -105, -90, -116, -107, -114, -120, -114, -116, -108, -116, -107, -101, -90, -120, -117, 112, 111, 124, 124, 115, -128, -115, -126, 125, -115, 119, 124, -126, 115, -128, -127, -126, 119, -126, 119, 111, 122, -68, -56, -69, -57, -53, -69, -60, -71, -49, -43, -71, -73, -58, -58, -65, -60, -67, 100, 112, 112, 108, 123, 104, 101, 106, 103, 111, 104, 109, 107, 104, 109, 100, 126, 117, 104, 99, 100, 110, 126, 96, 99, -73, -64, -52, -63, -65, -74, -76, -76, -78, -65, -122, -113, -101, -112, -114, -123, -125, -125, -127, -114, -101, -118, -117, -101, 125, -111, -112, -117, -101, -123, -119, -116, -101, -120, -117, -125, -125, -123, -118, -125, -110, -113, -108, -111, -91, -121, -118, -43, -46, -41, -44, -24, -54, -51, -24, -33, -69, -47, -60, -41, -52, -39, -56, -30, -58, -49, -46, -42, -56, -30, -59, -40, -41, -41, -46, -47, -72, -79, -84, -87, -84, -88, -89, -62, -81, -78, -86, -86, -84, -79, -86, -123, 120, 115, 116, 126, -114, 112, 115};
    }

    static {
        A03();
        A07 = new EnumC2355pT(A02(10, 6, 62), 0, 0);
        A0G = new EnumC2355pT(A02(146, 7, 56), 1, 1);
        A08 = new EnumC2355pT(A02(16, 9, 19), 2, 2);
        A0H = new EnumC2355pT(A02(153, 10, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), 3, 3);
        A09 = new EnumC2355pT(A02(25, 17, 57), 4, 4);
        A06 = new EnumC2355pT(A02(0, 10, 100), 5, 5);
        A0E = new EnumC2355pT(A02(106, 10, 95), 6, 6);
        A0F = new EnumC2355pT(A02(Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE, 30, 46), 7, 7);
        A0K = new EnumC2355pT(A02(197, 8, 33), 8, 8);
        A0D = new EnumC2355pT(A02(91, 15, 17), 9, 9);
        A0A = new EnumC2355pT(A02(42, 22, 32), 10, 10);
        A0I = new EnumC2355pT(A02(163, 19, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), 11, 11);
        A0J = new EnumC2355pT(A02(182, 15, 85), 12, 16);
        A0C = new EnumC2355pT(A02(81, 10, 14), 13, 17);
        A0B = new EnumC2355pT(A02(64, 17, 104), 14, 18);
        A05 = A04();
        A03 = new EnumC2355pT[]{A0H, A09, A06, A0F, A0I, A0J, A0C, A0B};
        JSONArray jSONArray = new JSONArray();
        for (EnumC2355pT supportedCapability : A03) {
            jSONArray.put(supportedCapability.A00());
        }
        A04 = jSONArray.toString();
    }

    public EnumC2355pT(String str, int i5, int i11) {
        this.A00 = i11;
    }

    private final int A00() {
        return this.A00;
    }

    public static String A01() {
        return A04;
    }

    public static /* synthetic */ EnumC2355pT[] A04() {
        EnumC2355pT[] enumC2355pTArr = {A07, A0G, A08, A0H, A09, A06, A0E, A0F, A0K, A0D, A0A, A0I, A0J, A0C, A0B};
        if (A02[7].charAt(8) == 'G') {
            throw new RuntimeException();
        }
        A02[4] = "YBrCAvYhnv";
        return enumC2355pTArr;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return String.valueOf(this.A00);
    }

    public static EnumC2355pT valueOf(String str) {
        return (EnumC2355pT) Enum.valueOf(EnumC2355pT.class, str);
    }

    public static EnumC2355pT[] values() {
        return (EnumC2355pT[]) A05.clone();
    }
}
