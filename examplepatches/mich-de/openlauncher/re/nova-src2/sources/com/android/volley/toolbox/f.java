package com.android.volley.toolbox;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.widget.ImageView;
import com.android.volley.ParseError;
import jb.k;
import jb.l;
import jb.m;
import jb.q;

/* loaded from: classes2.dex */
public abstract class f extends jb.i {
    public static final float DEFAULT_IMAGE_BACKOFF_MULT = 2.0f;
    public static final int DEFAULT_IMAGE_MAX_RETRIES = 2;
    public static final int DEFAULT_IMAGE_TIMEOUT_MS = 1000;
    private static final Object sDecodeLock = new Object();
    private final Bitmap.Config mDecodeConfig;
    private l mListener;
    private final Object mLock;
    private final int mMaxHeight;
    private final int mMaxWidth;
    private final ImageView.ScaleType mScaleType;

    public f(String str, l lVar, ImageView.ScaleType scaleType, Bitmap.Config config, k kVar) {
        super(str, kVar);
        this.mLock = new Object();
        setRetryPolicy(new jb.c(1000, 2, 2.0f));
        this.mListener = lVar;
        this.mDecodeConfig = config;
        this.mMaxWidth = 0;
        this.mMaxHeight = 0;
        this.mScaleType = scaleType;
    }

    public static int c(int i5, int i11, int i12, int i13, ImageView.ScaleType scaleType) {
        if (i5 != 0 || i11 != 0) {
            if (scaleType != ImageView.ScaleType.FIT_XY) {
                if (i5 == 0) {
                    return (int) (i12 * (i11 / i13));
                }
                if (i11 == 0) {
                    return i5;
                }
                double d5 = i13 / i12;
                if (scaleType == ImageView.ScaleType.CENTER_CROP) {
                    double d11 = i11;
                    return ((double) i5) * d5 < d11 ? (int) (d11 / d5) : i5;
                }
                double d12 = i11;
                return ((double) i5) * d5 > d12 ? (int) (d12 / d5) : i5;
            }
            if (i5 != 0) {
                return i5;
            }
        }
        return i12;
    }

    public static int findBestSampleSize(int i5, int i11, int i12, int i13) {
        double dMin = Math.min(i5 / i12, i11 / i13);
        float f11 = 1.0f;
        while (true) {
            float f12 = 2.0f * f11;
            if (f12 > dMin) {
                return (int) f11;
            }
            f11 = f12;
        }
    }

    public final m b(jb.f fVar) {
        Bitmap bitmapDecodeByteArray;
        byte[] bArr = fVar.f69396b;
        BitmapFactory.Options options = new BitmapFactory.Options();
        if (this.mMaxWidth == 0 && this.mMaxHeight == 0) {
            options.inPreferredConfig = this.mDecodeConfig;
            bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        } else {
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            int i5 = options.outWidth;
            int i11 = options.outHeight;
            int iC = c(this.mMaxWidth, this.mMaxHeight, i5, i11, this.mScaleType);
            int iC2 = c(this.mMaxHeight, this.mMaxWidth, i11, i5, this.mScaleType);
            options.inJustDecodeBounds = false;
            options.inSampleSize = findBestSampleSize(i5, i11, iC, iC2);
            bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
            if (bitmapDecodeByteArray != null && (bitmapDecodeByteArray.getWidth() > iC || bitmapDecodeByteArray.getHeight() > iC2)) {
                Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmapDecodeByteArray, iC, iC2, true);
                bitmapDecodeByteArray.recycle();
                bitmapDecodeByteArray = bitmapCreateScaledBitmap;
            }
        }
        return bitmapDecodeByteArray == null ? new m(new ParseError(fVar)) : new m(bitmapDecodeByteArray, ex.i.K(fVar));
    }

    @Override // jb.i
    public void cancel() {
        super.cancel();
        synchronized (this.mLock) {
            this.mListener = null;
        }
    }

    @Override // jb.i
    public jb.h getPriority() {
        return jb.h.f69400a;
    }

    @Override // jb.i
    public m parseNetworkResponse(jb.f fVar) {
        m mVarB;
        synchronized (sDecodeLock) {
            try {
                try {
                    mVarB = b(fVar);
                } catch (OutOfMemoryError e3) {
                    q.b("Caught OOM for %d byte image, url=%s", Integer.valueOf(fVar.f69396b.length), getUrl());
                    return new m(new ParseError(e3));
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return mVarB;
    }

    @Override // jb.i
    public void deliverResponse(Bitmap bitmap) {
        l lVar;
        synchronized (this.mLock) {
            lVar = this.mListener;
        }
        if (lVar != null) {
            lVar.onResponse(bitmap);
        }
    }
}
