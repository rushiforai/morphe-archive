package com.facebook.ads.redexgen.X;

import android.content.Context;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.me, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2186me {
    public static byte[] A01;
    public final File A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 41);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A01 = new byte[]{-90, -60, -47, -47, -46, -41, -125, -56, -47, -42, -40, -43, -56, -125, -118, -120, -42, -118, -125, -52, -42, -125, -60, -125, -57, -52, -43, -56, -58, -41, -46, -43, -36, -118, -91, -83, -80, -87, -88, 100, -72, -77, 100, -89, -74, -87, -91, -72, -87, 100, -88, -83, -74, -87, -89, -72, -77, -74, -67, 100, 107, 105, -73, 107, -58, -62, -45, -60, -53, -65, -52, -49, -57};
    }

    public C2186me(File file) {
        this.A00 = file;
    }

    public static C2186me A00(String str, Context context) throws IOException {
        File filesDir = new File(context.getFilesDir(), A01(64, 9, 55));
        A03(filesDir);
        File fbsdklogDir = new File(filesDir, str);
        A03(fbsdklogDir);
        return new C2186me(fbsdklogDir);
    }

    public static void A03(File file) throws IOException {
        if (file.exists() || file.mkdir()) {
            if (file.isDirectory()) {
                return;
            } else {
                throw new C2187mf(String.format(Locale.US, A01(0, 33, 58), file.getCanonicalPath()));
            }
        }
        throw new C2187mf(String.format(Locale.US, A01(33, 31, 27), file.getCanonicalPath()));
    }

    public final C2186me A04(String str) throws IOException {
        File file = new File(this.A00, str);
        A03(file);
        return new C2186me(file);
    }

    public final File A05() {
        return this.A00;
    }
}
