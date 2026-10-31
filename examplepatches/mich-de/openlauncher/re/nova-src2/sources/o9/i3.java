package o9;

import android.app.WallpaperManager;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.net.Uri;
import android.os.AsyncTask;
import com.android.launcher3.WallpaperCropActivity;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;

/* loaded from: classes2.dex */
public final class i3 extends AsyncTask {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f79886a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f79887b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f79888c;

    /* renamed from: d, reason: collision with root package name */
    public final int f79889d;

    /* renamed from: e, reason: collision with root package name */
    public RectF f79890e;

    /* renamed from: f, reason: collision with root package name */
    public int f79891f;

    /* renamed from: g, reason: collision with root package name */
    public int f79892g;

    /* renamed from: h, reason: collision with root package name */
    public final int f79893h;

    /* renamed from: i, reason: collision with root package name */
    public final String f79894i;

    /* renamed from: j, reason: collision with root package name */
    public final boolean f79895j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f79896k;

    /* renamed from: l, reason: collision with root package name */
    public Bitmap f79897l;

    /* renamed from: m, reason: collision with root package name */
    public Runnable f79898m;
    public final Resources n;
    public k3 o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f79899p;

    /* renamed from: q, reason: collision with root package name */
    public final int f79900q;

    public i3(int i5, int i11, int i12, byte[] bArr) {
        this.f79886a = null;
        this.f79889d = 0;
        this.f79894i = "jpg";
        this.f79888c = bArr;
        this.f79900q = 0;
        this.f79890e = null;
        this.f79893h = i5;
        this.f79891f = i11;
        this.f79892g = i12;
        this.f79895j = false;
        this.f79896k = true;
        this.f79898m = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x022c  */
    /* JADX WARN: Type inference failed for: r10v1, types: [int] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean a() throws Throwable {
        boolean z11;
        int i5;
        InputStream inputStream;
        BufferedInputStream bufferedInputStreamC;
        BitmapRegionDecoder bitmapRegionDecoderNewInstance;
        Uri uri;
        boolean z12;
        Bitmap bitmapCreateBitmap;
        boolean z13;
        Bitmap bitmap;
        Uri uri2 = this.f79886a;
        boolean z14 = this.f79895j;
        WallpaperManager wallpaperManager = z14 ? WallpaperManager.getInstance(this.f79887b.getApplicationContext()) : null;
        int i11 = this.f79900q;
        boolean z15 = false;
        if (z14 && this.f79899p) {
            try {
                BufferedInputStream bufferedInputStreamC2 = c();
                if (bufferedInputStreamC2 != null) {
                    Point point = WallpaperCropActivity.f20987r;
                    wallpaperManager.setStream(bufferedInputStreamC2, null, true, i11);
                    i9.a.a(bufferedInputStreamC2);
                }
            } catch (IOException e3) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("Launcher3.CropActivity");
                bVar.p(e3, "cannot write stream to wallpaper", new Object[0]);
                z15 = true;
            }
            return !z15;
        }
        Rect rect = new Rect();
        Matrix matrix = new Matrix();
        Matrix matrix2 = new Matrix();
        Point pointB = b();
        int i12 = this.f79893h;
        if (i12 > 0) {
            matrix.setRotate(i12);
            matrix2.setRotate(-i12);
            this.f79890e.roundOut(rect);
            this.f79890e = new RectF(rect);
            if (pointB == null) {
                mc0.b bVar2 = mc0.d.f76206a;
                bVar2.r("Launcher3.CropActivity");
                bVar2.n("cannot get bounds for image", new Object[0]);
                return false;
            }
            i5 = 2;
            float[] fArr = {pointB.x, pointB.y};
            matrix.mapPoints(fArr);
            fArr[0] = Math.abs(fArr[0]);
            float fAbs = Math.abs(fArr[1]);
            fArr[1] = fAbs;
            z11 = false;
            this.f79890e.offset((-fArr[0]) / 2.0f, (-fAbs) / 2.0f);
            matrix2.mapRect(this.f79890e);
            this.f79890e.offset(pointB.x / 2, pointB.y / 2);
        } else {
            z11 = false;
            i5 = 2;
        }
        this.f79890e.roundOut(rect);
        if (rect.width() <= 0 || rect.height() <= 0) {
            mc0.b bVar3 = mc0.d.f76206a;
            bVar3.r("Launcher3.CropActivity");
            bVar3.n("crop has bad values for full size image", new Object[0]);
            return false;
        }
        int iWidth = rect.width() / this.f79891f;
        int iHeight = rect.height();
        ?? r102 = this.f79892g;
        int iMax = Math.max(1, Math.min(iWidth, iHeight / r102));
        try {
            try {
                bufferedInputStreamC = c();
                try {
                } catch (IOException e11) {
                    e = e11;
                    bitmapRegionDecoderNewInstance = null;
                    mc0.b bVar4 = mc0.d.f76206a;
                    bVar4.r("Launcher3.CropActivity");
                    uri = uri2;
                    z12 = z14;
                    bVar4.p(e, "cannot open region decoder for file: %s", uri.toString());
                    i9.a.a(bufferedInputStreamC);
                    if (bitmapRegionDecoderNewInstance != null) {
                    }
                    if (bitmapCreateBitmap == null) {
                    }
                    if (bitmapCreateBitmap == null) {
                    }
                }
            } catch (Throwable th2) {
                th = th2;
                inputStream = r102;
                i9.a.a(inputStream);
                throw th;
            }
        } catch (IOException e12) {
            e = e12;
            bufferedInputStreamC = null;
        } catch (Throwable th3) {
            th = th3;
            inputStream = null;
            i9.a.a(inputStream);
            throw th;
        }
        if (bufferedInputStreamC == null) {
            mc0.b bVar5 = mc0.d.f76206a;
            bVar5.r("Launcher3.CropActivity");
            bVar5.n("cannot get input stream for uri=%s", uri2.toString());
            i9.a.a(bufferedInputStreamC);
            return z11;
        }
        bitmapRegionDecoderNewInstance = BitmapRegionDecoder.newInstance(bufferedInputStreamC, z11);
        try {
            i9.a.a(bufferedInputStreamC);
            i9.a.a(bufferedInputStreamC);
            uri = uri2;
            z12 = z14;
        } catch (IOException e13) {
            e = e13;
            mc0.b bVar42 = mc0.d.f76206a;
            bVar42.r("Launcher3.CropActivity");
            uri = uri2;
            z12 = z14;
            bVar42.p(e, "cannot open region decoder for file: %s", uri.toString());
            i9.a.a(bufferedInputStreamC);
            if (bitmapRegionDecoderNewInstance != null) {
            }
            if (bitmapCreateBitmap == null) {
            }
            if (bitmapCreateBitmap == null) {
            }
        }
        if (bitmapRegionDecoderNewInstance != null) {
            BitmapFactory.Options options = new BitmapFactory.Options();
            if (iMax > 1) {
                options.inSampleSize = iMax;
            }
            bitmapCreateBitmap = bitmapRegionDecoderNewInstance.decodeRegion(rect, options);
            bitmapRegionDecoderNewInstance.recycle();
        } else {
            bitmapCreateBitmap = null;
        }
        if (bitmapCreateBitmap == null) {
            BufferedInputStream bufferedInputStreamC3 = c();
            if (bufferedInputStreamC3 != null) {
                BitmapFactory.Options options2 = new BitmapFactory.Options();
                if (iMax > 1) {
                    options2.inSampleSize = iMax;
                }
                Bitmap bitmapDecodeStream = BitmapFactory.decodeStream(bufferedInputStreamC3, null, options2);
                i9.a.a(bufferedInputStreamC3);
                bitmap = bitmapDecodeStream;
            } else {
                bitmap = null;
            }
            if (bitmap != null) {
                int width = pointB.x / bitmap.getWidth();
                RectF rectF = this.f79890e;
                float f11 = width;
                rectF.left /= f11;
                rectF.top /= f11;
                rectF.bottom /= f11;
                rectF.right /= f11;
                rectF.roundOut(rect);
                if (rect.width() > bitmap.getWidth()) {
                    rect.right = bitmap.getWidth() + rect.left;
                }
                if (rect.right > bitmap.getWidth()) {
                    int iMax2 = rect.left - Math.max(0, rect.right - rect.width());
                    rect.left -= iMax2;
                    rect.right -= iMax2;
                }
                if (rect.height() > bitmap.getHeight()) {
                    rect.bottom = bitmap.getHeight() + rect.top;
                }
                if (rect.bottom > bitmap.getHeight()) {
                    int iMax3 = rect.top - Math.max(0, rect.bottom - rect.height());
                    rect.top -= iMax3;
                    rect.bottom -= iMax3;
                }
                bitmapCreateBitmap = Bitmap.createBitmap(bitmap, rect.left, rect.top, rect.width(), rect.height());
            }
        }
        if (bitmapCreateBitmap == null) {
            mc0.b bVar6 = mc0.d.f76206a;
            bVar6.r("Launcher3.CropActivity");
            bVar6.n("cannot decode file: %s", uri.toString());
            return false;
        }
        if ((this.f79891f > 0 && this.f79892g > 0) || i12 > 0) {
            float[] fArr2 = new float[i5];
            fArr2[0] = bitmapCreateBitmap.getWidth();
            fArr2[1] = bitmapCreateBitmap.getHeight();
            matrix.mapPoints(fArr2);
            fArr2[0] = Math.abs(fArr2[0]);
            fArr2[1] = Math.abs(fArr2[1]);
            if (this.f79891f <= 0 || this.f79892g <= 0) {
                this.f79891f = Math.round(fArr2[0]);
                this.f79892g = Math.round(fArr2[1]);
            }
            RectF rectF2 = new RectF(0.0f, 0.0f, fArr2[0], fArr2[1]);
            RectF rectF3 = new RectF(0.0f, 0.0f, this.f79891f, this.f79892g);
            Matrix matrix3 = new Matrix();
            if (i12 == 0) {
                matrix3.setRectToRect(rectF2, rectF3, Matrix.ScaleToFit.FILL);
            } else {
                Matrix matrix4 = new Matrix();
                matrix4.setTranslate((-bitmapCreateBitmap.getWidth()) / 2.0f, (-bitmapCreateBitmap.getHeight()) / 2.0f);
                Matrix matrix5 = new Matrix();
                matrix5.setRotate(i12);
                Matrix matrix6 = new Matrix();
                matrix6.setTranslate(fArr2[0] / 2.0f, fArr2[1] / 2.0f);
                Matrix matrix7 = new Matrix();
                matrix7.setRectToRect(rectF2, rectF3, Matrix.ScaleToFit.FILL);
                Matrix matrix8 = new Matrix();
                matrix8.setConcat(matrix5, matrix4);
                Matrix matrix9 = new Matrix();
                matrix9.setConcat(matrix7, matrix6);
                matrix3.setConcat(matrix9, matrix8);
            }
            Bitmap bitmapCreateBitmap2 = Bitmap.createBitmap((int) rectF3.width(), (int) rectF3.height(), Bitmap.Config.ARGB_8888);
            if (bitmapCreateBitmap2 != null) {
                Canvas canvas = new Canvas(bitmapCreateBitmap2);
                Paint paint = new Paint();
                paint.setFilterBitmap(true);
                canvas.drawBitmap(bitmapCreateBitmap, matrix3, paint);
                bitmapCreateBitmap = bitmapCreateBitmap2;
            }
        }
        if (this.f79896k) {
            this.f79897l = bitmapCreateBitmap;
        }
        Point point2 = WallpaperCropActivity.f20987r;
        String str = this.f79894i;
        if (str == null) {
            str = "jpg";
        }
        String lowerCase = str.toLowerCase(Locale.US);
        Bitmap.CompressFormat compressFormat = ((lowerCase.equals("png") || lowerCase.equals("gif")) ? "png" : "jpg").equals("png") ? Bitmap.CompressFormat.PNG : Bitmap.CompressFormat.JPEG;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream(2048);
        if (bitmapCreateBitmap.compress(compressFormat, 90, byteArrayOutputStream)) {
            if (z12 && wallpaperManager != null) {
                try {
                    byte[] byteArray = byteArrayOutputStream.toByteArray();
                    try {
                        wallpaperManager.setStream(new ByteArrayInputStream(byteArray), null, true, i11);
                    } catch (SecurityException e14) {
                        e14.printStackTrace();
                    }
                    k3 k3Var = this.o;
                    if (k3Var != null) {
                        k3Var.a(compressFormat, byteArray);
                    }
                } catch (IOException e15) {
                    mc0.b bVar7 = mc0.d.f76206a;
                    bVar7.r("Launcher3.CropActivity");
                    bVar7.p(e15, "cannot write stream to wallpaper", new Object[0]);
                }
            }
            z13 = false;
            return !z13;
        }
        mc0.b bVar8 = mc0.d.f76206a;
        bVar8.r("Launcher3.CropActivity");
        bVar8.n("cannot compress bitmap", new Object[0]);
        z13 = true;
        return !z13;
    }

    public final Point b() {
        BufferedInputStream bufferedInputStreamC = c();
        if (bufferedInputStreamC != null) {
            BitmapFactory.Options options = new BitmapFactory.Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeStream(bufferedInputStreamC, null, options);
            i9.a.a(bufferedInputStreamC);
            if (options.outWidth != 0 && options.outHeight != 0) {
                return new Point(options.outWidth, options.outHeight);
            }
        }
        return null;
    }

    public final BufferedInputStream c() {
        int i5 = this.f79889d;
        byte[] bArr = this.f79888c;
        Uri uri = this.f79886a;
        if (uri == null && i5 == 0 && bArr == null) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("Launcher3.CropActivity");
            bVar.n("cannot read original file, no input URI, resource ID, or image byte array given", new Object[0]);
            return null;
        }
        try {
            return uri != null ? new BufferedInputStream(this.f79887b.getContentResolver().openInputStream(uri)) : bArr != null ? new BufferedInputStream(new ByteArrayInputStream(bArr)) : new BufferedInputStream(this.n.openRawResource(i5));
        } catch (FileNotFoundException e3) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("Launcher3.CropActivity");
            bVar2.p(e3, "cannot read file: %s", uri.toString());
            return null;
        }
    }

    @Override // android.os.AsyncTask
    public final Object doInBackground(Object[] objArr) {
        return Boolean.valueOf(a());
    }

    @Override // android.os.AsyncTask
    public final void onPostExecute(Object obj) {
        Runnable runnable = this.f79898m;
        if (runnable != null) {
            runnable.run();
        }
    }

    public i3(Context context, Uri uri, RectF rectF, int i5, int i11, int i12, boolean z11, boolean z12, l30.o oVar, int i13) {
        this.f79886a = null;
        this.f79889d = 0;
        this.f79890e = null;
        this.f79894i = "jpg";
        this.f79887b = context.getApplicationContext();
        this.f79886a = uri;
        this.f79900q = i13;
        this.f79890e = rectF;
        this.f79893h = i5;
        this.f79891f = i11;
        this.f79892g = i12;
        this.f79895j = z11;
        this.f79896k = z12;
        this.f79898m = oVar;
    }

    public i3(Context context, Resources resources, int i5, RectF rectF, int i11, int i12, int i13, boolean z11, boolean z12, o7.g0 g0Var, int i14) {
        this.f79886a = null;
        this.f79889d = 0;
        this.f79890e = null;
        this.f79894i = "jpg";
        this.f79887b = context.getApplicationContext();
        this.f79889d = i5;
        this.n = resources;
        this.f79900q = i14;
        this.f79890e = rectF;
        this.f79893h = i11;
        this.f79891f = i12;
        this.f79892g = i13;
        this.f79895j = z11;
        this.f79896k = z12;
        this.f79898m = g0Var;
    }
}
