package com.bytedance.sdk.component.lud.zb.sya.zb;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.widget.ImageView;
import androidx.compose.ui.node.LayoutNode;
import com.bytedance.sdk.component.lud.zb.sya.lt;

/* loaded from: classes2.dex */
public class zb {
    public static final ImageView.ScaleType ycx = ImageView.ScaleType.CENTER_INSIDE;

    /* renamed from: zb, reason: collision with root package name */
    public static final Bitmap.Config f24042zb = Bitmap.Config.ARGB_4444;

    /* renamed from: dj, reason: collision with root package name */
    private int f24043dj;
    private final ImageView.ScaleType fby;

    /* renamed from: lt, reason: collision with root package name */
    private final int f24046lt;
    private int lud;
    private final Bitmap.Config sya;

    /* renamed from: ul, reason: collision with root package name */
    private final int f24047ul;

    /* renamed from: jw, reason: collision with root package name */
    private final int f24045jw = 1280;

    /* renamed from: jc, reason: collision with root package name */
    private final int f24044jc = 83886080;

    public zb(int i5, int i11, ImageView.ScaleType scaleType, Bitmap.Config config, int i12, int i13) {
        this.sya = config;
        this.f24043dj = i5;
        this.lud = i11;
        this.fby = scaleType;
        this.f24046lt = i12;
        this.f24047ul = i13;
        ycx(i5, i11);
    }

    private static int ycx(int i5, int i11, int i12, int i13) {
        if (i5 == 0 && i11 == 0) {
            return i12;
        }
        if (i5 == 0) {
            return (int) (i12 * (i11 / i13));
        }
        if (i11 == 0) {
            return i5;
        }
        double d5 = i13 / i12;
        double d11 = i11;
        return ((double) i5) * d5 > d11 ? (int) (d11 / d5) : i5;
    }

    public static int ycx(int i5, int i11, int i12, int i13, int i14, int i15) {
        double dMin = Math.min(i5 / i12, i11 / i13);
        if (i14 > 0 && i15 > 0) {
            dMin = Math.max(dMin, Math.min(Math.max(i5, i11) / Math.max(i14, i15), Math.min(i5, i11) / Math.min(i14, i15)));
        }
        return Integer.highestOneBit((int) dMin);
    }

    private float ycx(int i5, int i11, int i12, int i13, int i14) {
        float f11 = i5;
        return Math.max(i13 / (i11 / f11), i14 / (i12 / f11));
    }

    public Bitmap ycx(byte[] bArr, lt ltVar) {
        Context contextYcx;
        boolean zZb;
        Bitmap bitmapDecodeByteArray;
        if (ltVar != null) {
            contextYcx = ltVar.ycx();
            zZb = ltVar.zb();
        } else {
            contextYcx = null;
            zZb = false;
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        if (this.f24043dj == 0 && this.lud == 0) {
            options.inPreferredConfig = this.sya;
            bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        } else {
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            int i5 = options.outWidth;
            int i11 = options.outHeight;
            int iYcx = ycx(this.f24043dj, this.lud, i5, i11);
            int iYcx2 = ycx(this.lud, this.f24043dj, i11, i5);
            options.inJustDecodeBounds = false;
            int iYcx3 = ycx(i5, i11, iYcx, iYcx2, this.f24046lt, this.f24047ul);
            options.inSampleSize = iYcx3;
            float fYcx = ycx(iYcx3, i5, i11, iYcx, iYcx2);
            boolean z11 = fYcx > 0.0f && fYcx < 1.0f && contextYcx != null && zZb;
            if (z11) {
                options.inScaled = true;
                options.inDensity = LayoutNode.NotPlacedPlaceOrder;
                options.inTargetDensity = Math.round(fYcx * 2.1474836E9f);
            }
            bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            if (z11 && bitmapDecodeByteArray != null) {
                bitmapDecodeByteArray.setDensity(contextYcx.getResources().getDisplayMetrics().densityDpi);
            }
            if (bitmapDecodeByteArray != null && (bitmapDecodeByteArray.getWidth() > iYcx || bitmapDecodeByteArray.getHeight() > iYcx2)) {
                Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmapDecodeByteArray, iYcx, iYcx2, true);
                if (bitmapCreateScaledBitmap != bitmapDecodeByteArray) {
                    bitmapDecodeByteArray.recycle();
                }
                bitmapDecodeByteArray = bitmapCreateScaledBitmap;
            }
        }
        if (bitmapDecodeByteArray != null && bitmapDecodeByteArray.getByteCount() > 83886080) {
            int width = bitmapDecodeByteArray.getWidth() / 2;
            int height = bitmapDecodeByteArray.getHeight() / 2;
            if (width > 0 && height > 0) {
                Bitmap bitmapCreateScaledBitmap2 = Bitmap.createScaledBitmap(bitmapDecodeByteArray, width, height, true);
                if (bitmapCreateScaledBitmap2 != bitmapDecodeByteArray) {
                    bitmapDecodeByteArray.recycle();
                }
                return bitmapCreateScaledBitmap2;
            }
        }
        return bitmapDecodeByteArray;
    }

    private void ycx(int i5, int i11) {
        if (i5 > 1280 && i11 > 1280) {
            if (i5 > i11) {
                this.f24043dj = 1280;
                this.lud = (i11 * 1280) / i5;
                return;
            } else {
                this.f24043dj = (i5 * 1280) / i11;
                this.lud = 1280;
                return;
            }
        }
        if (i5 > 1280) {
            this.f24043dj = 1280;
            this.lud = (i11 * 1280) / i5;
        } else if (i11 > 1280) {
            this.f24043dj = (i5 * 1280) / i11;
            this.lud = 1280;
        }
    }
}
