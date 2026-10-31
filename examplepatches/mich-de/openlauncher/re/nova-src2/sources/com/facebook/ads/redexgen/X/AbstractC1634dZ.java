package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.dZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1634dZ {
    public static byte[] A00;
    public static String[] A01 = {"4URjdcTGi", "po9yLUIJbjuRtvjPhj4uP8cF498HgQ7z", "A5AHd5fBub1PIS7BLeiOb31fcQ17YwU8", "7guNTFBtCQQPAQraYFx6g1j01ajqBsWs", "X9RV0REptiddGsEup40thUtqdeB8esnY", "0C3GUy", "3nXE0n0RsgZda9T4UBJMMBhHqECNX4hJ", "fMU9hpupPxlpGPmSXOlz6ZuRTfjSB1qP"};

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 61);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A00 = new byte[]{46, 33, 36, 45, 114, 103, 103};
    }

    static {
        A06();
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
            options.inSampleSize = A00(options, i5, i11);
            options.inJustDecodeBounds = false;
            return BitmapFactory.decodeStream(c1635da, null, options);
        }
        Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(c1635da);
        String[] strArr = A01;
        if (strArr[1].charAt(6) == strArr[3].charAt(6)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[1] = "xOKPhJohz1vwkifwSHBqQxwaG6oYsLRa";
        strArr2[3] = "yZ4TeTLFGP8GfQlVKCBWTEY5EmutY3CM";
        return bitmapDecodeStream;
    }

    public static Bitmap A02(String str, int i5, int i11) {
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(str, options);
        options.inSampleSize = A00(options, i5, i11);
        options.inJustDecodeBounds = false;
        return BitmapFactory.decodeFile(str, options);
    }

    public static Bitmap A03(String str, int i5, int i11, boolean z11) throws IOException {
        try {
            FileInputStream fileInputStream = new FileInputStream(new File(str));
            if (i5 > 0 && i11 > 0) {
                if (z11) {
                    Bitmap bitmapA01 = A01(fileInputStream, i5, i11);
                    A07(fileInputStream);
                    return bitmapA01;
                }
                Bitmap bitmapA02 = A02(str, i5, i11);
                A07(fileInputStream);
                return bitmapA02;
            }
            Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(fileInputStream);
            A07(fileInputStream);
            return bitmapDecodeStream;
        } catch (Throwable th2) {
            A07(null);
            throw th2;
        }
    }

    public static String A05(File file) {
        if (file != null) {
            return A04(0, 7, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE) + file.getPath();
        }
        return null;
    }

    public static void A07(Closeable closeable) throws IOException {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (IOException unused) {
        }
    }
}
