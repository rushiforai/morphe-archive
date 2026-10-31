package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.b0, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1475b0 {
    public static byte[] A05;
    public static String[] A06 = {"62zPkRZ7qDvAsxVWJCXfIikRvQRMbbxe", "1ZZPOPyQl", "pLRx6zCrX", "QayRPU9tLH84cK0drErDk1Ig5LL1omtA", "sBeoOmQCHygigd3c57PuQ", "oppJdrD8ZGAhJbEqRSESrz19nmtKW69m", "njsmR3KXoNdoZ1EbRFKp4", "DilasQUje3bijE85HccTZn0KYYyixyhF"};
    public int A00;
    public final ZP A01;
    public final ZQ A02;
    public final C1485bA A03;
    public final C1488bD A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            String[] strArr = A06;
            if (strArr[4].length() != strArr[6].length()) {
                throw new RuntimeException();
            }
            A06[5] = "IOrZE0Uk6Qvc1ZEm0XmmfqLvDORjdaFm";
            bArrCopyOfRange[i13] = (byte) ((b11 ^ i12) ^ Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{89, 77, 92, 81, 87, 23, 76, 74, 77, 93, 21, 80, 92};
    }

    static {
        A01();
    }

    public C1475b0(C1485bA c1485bA, C1488bD c1488bD, ZP zp2) {
        ZQ zq;
        this.A03 = c1485bA;
        this.A04 = c1488bD;
        this.A01 = zp2;
        if (A00(0, 13, 78).equals(c1485bA.A07.A0W)) {
            zq = new ZQ();
        } else {
            zq = null;
        }
        this.A02 = zq;
    }
}
