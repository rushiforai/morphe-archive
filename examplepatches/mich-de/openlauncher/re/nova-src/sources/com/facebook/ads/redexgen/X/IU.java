package com.facebook.ads.redexgen.X;

import android.os.Bundle;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class IU {
    public static byte[] A04;
    public static String[] A05 = {"FtGjCSaauj8LvUqeje", "pB9718RTy3RZ2jRHSDaX4QoIl91sbnAH", "Qm3nix3oZnFLoPJvp2hjll7yll4CTpp5", "UbiojY7xyTWzvvH91uBFCrXRY6Y3ZCVN", "gzPvwD1IMwv3COVvALAzVtTNirGPAMDz", "j", "z4CEqdwMJZY3iPYPRY9NAf8ZGFiVZY5r", "3uj3JHZQIgtYpPF3abk9lW5VtDVAiudq"};
    public final Integer A00;
    public final Integer A01;
    public final Integer A02;
    public final Integer A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 52);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{-93, -80, -90, -76, -79, -85, -90, 112, -75, -73, -78, -78, -79, -76, -74, 112, -91, -73, -75, -74, -79, -81, -74, -93, -92, -75, 112, -89, -70, -74, -76, -93, 112, -107, -121, -123, -111, -112, -122, -125, -108, -101, -95, -106, -111, -111, -114, -124, -125, -108, -95, -123, -111, -114, -111, -108, -17, -4, -14, 0, -3, -9, -14, -68, 1, 3, -2, -2, -3, 0, 2, -68, -15, 3, 1, 2, -3, -5, 2, -17, -16, 1, -68, -13, 6, 2, 0, -17, -68, -30, -35, -35, -38, -48, -49, -32, -19, -47, -35, -38, -35, -32, -91, -78, -88, -74, -77, -83, -88, -68, 114, -90, -74, -77, -69, -73, -87, -74, 114, -89, -71, -73, -72, -77, -79, -72, -91, -90, -73, 114, -87, -68, -72, -74, -91, 114, -110, -123, -102, -115, -117, -123, -104, -115, -109, -110, -93, -122, -123, -106, -93, -121, -109, -112, -109, -106, -12, 1, -9, 5, 2, -4, -9, 11, -63, -11, 5, 2, 10, 6, -8, 5, -63, -10, 8, 6, 7, 2, 0, 7, -12, -11, 6, -63, -8, 11, 7, 5, -12, -63, -31, -44, -23, -36, -38, -44, -25, -36, -30, -31, -14, -43, -44, -27, -14, -41, -36, -23, -36, -41, -40, -27, -14, -42, -30, -33, -30, -27};
    }

    static {
        A01();
    }

    public IU(Integer num, Integer num2, Integer num3, Integer num4) {
        this.A03 = num;
        this.A02 = num2;
        this.A00 = num3;
        this.A01 = num4;
    }

    public final Bundle A02() {
        Bundle bundle = new Bundle();
        if (this.A03 != null) {
            bundle.putInt(A00(56, 46, 90), this.A03.intValue());
        }
        if (this.A02 != null) {
            bundle.putInt(A00(0, 56, 14), this.A02.intValue());
        }
        if (this.A00 != null) {
            bundle.putInt(A00(102, 54, 16), this.A00.intValue());
        }
        Integer num = this.A01;
        String[] strArr = A05;
        if (strArr[1].charAt(8) != strArr[3].charAt(8)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A05;
        strArr2[1] = "eaAhs0x5yNbGeVEb97wVbSpysq8OTqOW";
        strArr2[3] = "075ZtzWNywiYzUp69f8VDPsMDUQT2Zbm";
        if (num != null) {
            bundle.putInt(A00(156, 62, 95), this.A01.intValue());
        }
        return bundle;
    }
}
