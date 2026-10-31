package o9;

import android.graphics.Bitmap;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class w2 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f80223a;

    static {
        int[] iArr = new int[Bitmap.CompressFormat.values().length];
        f80223a = iArr;
        try {
            iArr[Bitmap.CompressFormat.PNG.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f80223a[Bitmap.CompressFormat.JPEG.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f80223a[Bitmap.CompressFormat.WEBP.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            f80223a[Bitmap.CompressFormat.WEBP_LOSSLESS.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            f80223a[Bitmap.CompressFormat.WEBP_LOSSY.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
    }
}
