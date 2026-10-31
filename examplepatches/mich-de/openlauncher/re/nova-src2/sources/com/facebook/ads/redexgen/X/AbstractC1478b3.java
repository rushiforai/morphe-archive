package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.UUID;

/* renamed from: com.facebook.ads.redexgen.X.b3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1478b3 {
    public static byte[] A00;
    public static String[] A01 = {"bWm4MdcTIwBOXnaA6gk00N", "2egpmu6QICmDaEoNAGV4KoEhrE", "VtNQfL8fGYouF2P2CY5m8Tg7KTaoXEyS", "IqrQCDQ5grOO7J3jMUqBT8WUSgZM", "ViQjihdRfJv4dSHacOdgHgP3pHJs", "AeQb7kz", "g7oQuvQq3H7nw7Ugglblr7aD13p3MdPF", "WiM2hEomy3K"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 26);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{-69, -34, -34, -45, -84, -33, -38, -40, -64, -33, -44, -41, -98, -73, -68, -66, -71, -71, -72, -69, -67, -82, -83, 105, -71, -68, -68, -79, 105, -65, -82, -69, -68, -78, -72, -73, -125, 105};
    }

    static {
        A03();
    }

    public static C1477b2 A00(byte[] bArr) {
        C1084Mk c1084Mk = new C1084Mk(bArr);
        if (c1084Mk.A0A() < 32) {
            return null;
        }
        c1084Mk.A0f(0);
        if (c1084Mk.A0C() != c1084Mk.A07() + 4 || c1084Mk.A0C() != 1886614376) {
            return null;
        }
        int dataSize = AbstractC1455ag.A03(c1084Mk.A0C());
        if (dataSize > 1) {
            MV.A07(A01(0, 12, 81), A01(12, 26, 47) + dataSize);
            return null;
        }
        UUID uuid = new UUID(c1084Mk.A0P(), c1084Mk.A0P());
        if (dataSize == 1) {
            int atomType = c1084Mk.A0L() * 16;
            if (A01[4].length() != 28) {
                throw new RuntimeException();
            }
            A01[4] = "8kunImGG1Wvt4Tl8nInnCvkZmBXs";
            c1084Mk.A0g(atomType);
        }
        int atomSize = c1084Mk.A0L();
        if (atomSize != c1084Mk.A07()) {
            return null;
        }
        byte[] bArr2 = new byte[atomSize];
        c1084Mk.A0k(bArr2, 0, atomSize);
        return new C1477b2(uuid, dataSize, bArr2);
    }

    public static UUID A02(byte[] bArr) {
        C1477b2 parsedAtom = A00(bArr);
        if (parsedAtom != null) {
            return parsedAtom.A01;
        }
        return null;
    }
}
