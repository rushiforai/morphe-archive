package com.bytedance.adsdk.zb.lt;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.graphics.PointF;
import android.graphics.RectF;
import android.provider.Settings;
import com.bytedance.adsdk.zb.ycx.ycx.thx;
import java.io.Closeable;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.ProtocolException;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.net.UnknownServiceException;
import java.nio.channels.ClosedChannelException;
import javax.net.ssl.SSLException;

/* loaded from: classes2.dex */
public final class lt {
    private static final ThreadLocal<PathMeasure> ycx = new ThreadLocal<PathMeasure>() { // from class: com.bytedance.adsdk.zb.lt.lt.1
        @Override // java.lang.ThreadLocal
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public PathMeasure initialValue() {
            return new PathMeasure();
        }
    };

    /* renamed from: zb, reason: collision with root package name */
    private static final ThreadLocal<Path> f22911zb = new ThreadLocal<Path>() { // from class: com.bytedance.adsdk.zb.lt.lt.2
        @Override // java.lang.ThreadLocal
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public Path initialValue() {
            return new Path();
        }
    };
    private static final ThreadLocal<Path> sya = new ThreadLocal<Path>() { // from class: com.bytedance.adsdk.zb.lt.lt.3
        @Override // java.lang.ThreadLocal
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public Path initialValue() {
            return new Path();
        }
    };

    /* renamed from: dj, reason: collision with root package name */
    private static final ThreadLocal<float[]> f22910dj = new ThreadLocal<float[]>() { // from class: com.bytedance.adsdk.zb.lt.lt.4
        @Override // java.lang.ThreadLocal
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public float[] initialValue() {
            return new float[4];
        }
    };
    private static final float lud = (float) (Math.sqrt(2.0d) / 2.0d);

    public static int ycx(float f11, float f12, float f13, float f14) {
        int i5 = f11 != 0.0f ? (int) (f11 * 527.0f) : 17;
        if (f12 != 0.0f) {
            i5 = (int) (i5 * 31 * f12);
        }
        if (f13 != 0.0f) {
            i5 = (int) (i5 * 31 * f13);
        }
        return f14 != 0.0f ? (int) (i5 * 31 * f14) : i5;
    }

    public static boolean zb(Matrix matrix) {
        float[] fArr = f22910dj.get();
        fArr[0] = 0.0f;
        fArr[1] = 0.0f;
        fArr[2] = 37394.73f;
        fArr[3] = 39575.234f;
        matrix.mapPoints(fArr);
        return fArr[0] == fArr[2] || fArr[1] == fArr[3];
    }

    public static boolean ycx(int i5, int i11, int i12, int i13, int i14, int i15) {
        if (i5 < i13) {
            return false;
        }
        if (i5 > i13) {
            return true;
        }
        if (i11 < i14) {
            return false;
        }
        return i11 > i14 || i12 >= i15;
    }

    public static Path ycx(PointF pointF, PointF pointF2, PointF pointF3, PointF pointF4) {
        Path path = new Path();
        path.moveTo(pointF.x, pointF.y);
        if (pointF3 != null && pointF4 != null && (pointF3.length() != 0.0f || pointF4.length() != 0.0f)) {
            float f11 = pointF.x + pointF3.x;
            float f12 = pointF.y + pointF3.y;
            float f13 = pointF2.x;
            float f14 = f13 + pointF4.x;
            float f15 = pointF2.y;
            path.cubicTo(f11, f12, f14, f15 + pointF4.y, f13, f15);
            return path;
        }
        path.lineTo(pointF2.x, pointF2.y);
        return path;
    }

    public static void ycx(Closeable closeable) throws IOException {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (RuntimeException e3) {
                throw e3;
            } catch (Exception unused) {
            }
        }
    }

    public static float ycx(Matrix matrix) {
        float[] fArr = f22910dj.get();
        fArr[0] = 0.0f;
        fArr[1] = 0.0f;
        float f11 = lud;
        fArr[2] = f11;
        fArr[3] = f11;
        matrix.mapPoints(fArr);
        return (float) Math.hypot(fArr[2] - fArr[0], fArr[3] - fArr[1]);
    }

    public static void ycx(Path path, thx thxVar) {
        if (thxVar == null || thxVar.lt()) {
            return;
        }
        ycx(path, ((com.bytedance.adsdk.zb.ycx.zb.dj) thxVar.sya()).jw() / 100.0f, ((com.bytedance.adsdk.zb.ycx.zb.dj) thxVar.dj()).jw() / 100.0f, ((com.bytedance.adsdk.zb.ycx.zb.dj) thxVar.lud()).jw() / 360.0f);
    }

    public static void ycx(Path path, float f11, float f12, float f13) {
        com.bytedance.adsdk.zb.lud.ycx("applyTrimPathIfNeeded");
        PathMeasure pathMeasure = ycx.get();
        Path path2 = f22911zb.get();
        Path path3 = sya.get();
        pathMeasure.setPath(path, false);
        float length = pathMeasure.getLength();
        if (f11 == 1.0f && f12 == 0.0f) {
            com.bytedance.adsdk.zb.lud.zb("applyTrimPathIfNeeded");
            return;
        }
        if (length >= 1.0f && Math.abs((f12 - f11) - 1.0f) >= 0.01d) {
            float f14 = f11 * length;
            float f15 = f12 * length;
            float f16 = f13 * length;
            float fMin = Math.min(f14, f15) + f16;
            float fMax = Math.max(f14, f15) + f16;
            if (fMin >= length && fMax >= length) {
                fMin = lud.ycx(fMin, length);
                fMax = lud.ycx(fMax, length);
            }
            if (fMin < 0.0f) {
                fMin = lud.ycx(fMin, length);
            }
            if (fMax < 0.0f) {
                fMax = lud.ycx(fMax, length);
            }
            if (fMin == fMax) {
                path.reset();
                com.bytedance.adsdk.zb.lud.zb("applyTrimPathIfNeeded");
                return;
            }
            if (fMin >= fMax) {
                fMin -= length;
            }
            path2.reset();
            pathMeasure.getSegment(fMin, fMax, path2, true);
            if (fMax > length) {
                path3.reset();
                pathMeasure.getSegment(0.0f, fMax % length, path3, true);
                path2.addPath(path3);
            } else if (fMin < 0.0f) {
                path3.reset();
                pathMeasure.getSegment(fMin + length, length, path3, true);
                path2.addPath(path3);
            }
            path.set(path2);
            com.bytedance.adsdk.zb.lud.zb("applyTrimPathIfNeeded");
            return;
        }
        com.bytedance.adsdk.zb.lud.zb("applyTrimPathIfNeeded");
    }

    public static float ycx() {
        return Resources.getSystem().getDisplayMetrics().density;
    }

    public static float ycx(Context context) {
        return Settings.Global.getFloat(context.getContentResolver(), "animator_duration_scale", 1.0f);
    }

    public static Bitmap ycx(Bitmap bitmap, int i5, int i11) {
        if (bitmap.getWidth() == i5 && bitmap.getHeight() == i11) {
            return bitmap;
        }
        Bitmap bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmap, i5, i11, true);
        bitmap.recycle();
        return bitmapCreateScaledBitmap;
    }

    public static boolean ycx(Throwable th2) {
        return (th2 instanceof SocketException) || (th2 instanceof ClosedChannelException) || (th2 instanceof InterruptedIOException) || (th2 instanceof ProtocolException) || (th2 instanceof SSLException) || (th2 instanceof UnknownHostException) || (th2 instanceof UnknownServiceException);
    }

    public static void ycx(Canvas canvas, RectF rectF, Paint paint) {
        ycx(canvas, rectF, paint, 31);
    }

    public static void ycx(Canvas canvas, RectF rectF, Paint paint, int i5) {
        com.bytedance.adsdk.zb.lud.ycx("Utils#saveLayer");
        canvas.saveLayer(rectF, paint);
        com.bytedance.adsdk.zb.lud.zb("Utils#saveLayer");
    }
}
