package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class l4 {
    public static byte[] A00;
    public static String[] A01 = {"saA", "gsu0V7M30A0NMF7CCSUYPh3cFWPt1hff", "hVxu2Q6ZShYzBI97SqaChGOYIegrj2bT", "iLekaVu0ssZ24ywI2n5i0", "ZQTLQEWltIyhgyN12SCZP", "FIPHcIP", "kvf5zj6hzySbenz4GqUtk8dS7ChHa1Hj", "NwuZH9dVnpyA530YX9Yk4gKqarhwm0Sh"};

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 86);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{92, 88, 84, 82, 80};
    }

    static {
        A04();
    }

    public static int A00(BitmapFactory.Options options, int halfWidth, int i5) {
        int width = options.outHeight;
        int height = options.outWidth;
        int halfHeight = 1;
        if (width > i5 || height > halfWidth) {
            int inSampleSize = width / 2;
            int width2 = height / 2;
            while (inSampleSize / halfHeight >= i5 && width2 / halfHeight >= halfWidth) {
                halfHeight *= 2;
            }
        }
        return halfHeight;
    }

    public static Bitmap A01(InputStream inputStream, int i5, int i11) throws IOException {
        C1635da c1635da = new C1635da(inputStream);
        c1635da.mark(UserMetadata.MAX_INTERNAL_KEY_SIZE);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeStream(c1635da, null, options);
        c1635da.reset();
        if (!c1635da.A00()) {
            options.inSampleSize = A00(options, i11, i5);
            options.inJustDecodeBounds = false;
            return BitmapFactory.decodeStream(c1635da, null, options);
        }
        Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(c1635da);
        String[] strArr = A01;
        if (strArr[2].charAt(29) == strArr[6].charAt(29)) {
            throw new RuntimeException();
        }
        A01[7] = "VCmc3JPUbNaRwcggqLYvJLdbl9zvOrS8";
        return bitmapDecodeStream;
    }

    public static Bitmap A02(String str, int i5, int i11, C2095lA c2095lA) {
        try {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(str, options);
            options.inSampleSize = A00(options, i11, i5);
            options.inJustDecodeBounds = false;
            return BitmapFactory.decodeFile(str, options);
        } catch (Throwable t6) {
            c2095lA.A08().ABz(A03(0, 5, 99), AbstractC2126lf.A1h, new C2127lg(t6));
            return null;
        }
    }
}
