package com.facebook.ads.redexgen.X;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.text.TextUtils;
import android.util.Base64;
import android.util.DisplayMetrics;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.i5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1909i5 {
    public static boolean A00;
    public static byte[] A01;
    public static String[] A02 = {"Y0rICHp14ARSNu9MlXOQlrQKpJ7V2hwf", "9bmfgm9m8nITbmWk0ICcMAG3MrS", "cwEc0HiI6y8ZhWJ4MUGuUSsWKgKIPOUb", "CeguwAwwe", "1UN8Pz5pD", "KG5kSs2s3o8nfvSCZiVMOrQyfdZTA2DP", "BO8EwxINC4bfwl9QwPIiUjcYWt5Jq71N", "VnsxrIf3KddrD6MinhDJfsdqz9CBs5tu"};

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A02[2].charAt(4) == 'h') {
                throw new RuntimeException();
            }
            A02[5] = "V4DWKv2CalsHghC0GoFw5ZQ5aRA0odCa";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 71);
            i13++;
        }
    }

    public static void A03() {
        A01 = new byte[]{-1, 36, 46, 43, 39, 28, 52, 8, 32, 47, 45, 36, 30, 46, -37, 36, 46, -37, 41, 48, 39, 39, -23, 9, 28, 42, 38, 44, 41, 26, 28, 42, -41, 32, 42, -41, 37, 44, 35, 35, -27, -65, -54, -43, -46, -51, -54, -35, -46, -40, -41, -119, -49, -54, -46, -43, -50, -51, -105, -34, -32, -35};
    }

    static {
        A03();
        A00 = true;
    }

    public static BitmapDrawable A00(C0958Hi c0958Hi, String str) {
        try {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            byte[] bArrDecode = Base64.decode(str, 0);
            Bitmap overlayBm = BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length);
            if (overlayBm != null && (!A00 || A05(c0958Hi, overlayBm))) {
                BitmapDrawable overlayRepeat = new BitmapDrawable(overlayBm);
                overlayRepeat.setTileModeXY(Shader.TileMode.REPEAT, Shader.TileMode.REPEAT);
                Resources resources = c0958Hi.getResources();
                if (resources != null) {
                    DisplayMetrics displayMetrics = resources.getDisplayMetrics();
                    if (displayMetrics != null) {
                        overlayRepeat.setTargetDensity(displayMetrics.densityDpi);
                    } else {
                        A04(c0958Hi, A02(0, 23, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE));
                    }
                } else {
                    A04(c0958Hi, A02(23, 18, 112));
                }
                return overlayRepeat;
            }
            return null;
        } catch (Throwable th2) {
            c0958Hi.A08().ABz(A02(59, 3, 42), AbstractC2126lf.A1u, new C2127lg(th2));
            return null;
        }
    }

    public static C1908i4 A01(C0958Hi c0958Hi, String str) {
        BitmapDrawable bitmapDrawableA00;
        try {
            if (TextUtils.isEmpty(str) || (bitmapDrawableA00 = A00(c0958Hi, str)) == null) {
                return null;
            }
            C1908i4 c1908i4 = new C1908i4(c0958Hi);
            c1908i4.setBackground(bitmapDrawableA00);
            c1908i4.setClickable(false);
            c1908i4.setFocusable(false);
            return c1908i4;
        } catch (Throwable th2) {
            c0958Hi.A08().ABz(A02(59, 3, 42), AbstractC2126lf.A1u, new C2127lg(th2));
            return null;
        }
    }

    public static void A04(C0958Hi c0958Hi, String str) {
        c0958Hi.A08().ABz(A02(59, 3, 42), AbstractC2126lf.A1u, new C2127lg(str));
    }

    /* JADX WARN: Incorrect condition in loop: B:9:0x0021 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A05(C0958Hi c0958Hi, Bitmap bitmap) {
        int i5 = 0;
        while (true) {
            int width = bitmap.getWidth();
            if (A02[2].charAt(4) == 'h') {
                throw new RuntimeException();
            }
            A02[2] = "44dBdHmZhYYzc5DiIB6SXSnn6xfqMO61";
            if (i5 < width) {
                for (int pixel = 0; pixel < x; pixel++) {
                    int x11 = bitmap.getPixel(i5, pixel);
                    if (Color.alpha(x11) / 255.0f > 0.03f) {
                        A04(c0958Hi, A02(41, 18, 34));
                        return false;
                    }
                }
                i5++;
            } else {
                return true;
            }
        }
    }
}
