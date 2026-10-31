package io.branch.search.internal;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import java.nio.ByteBuffer;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class A7 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Md f62020a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Paint f62021b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Paint f62022c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Paint f62023d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final Paint f62024e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Rect f62025f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final Path f62026g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final Path f62027h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final Path f62028i;

    /* renamed from: j, reason: collision with root package name */
    @NotNull
    public final Matrix f62029j;

    public static final class a {
        public static final void a(a aVar, float[] fArr, int i5, int i11, int i12) {
            aVar.getClass();
            float[] fArr2 = new float[fArr.length - 1];
            int i13 = i11 + 1;
            if (i13 > i12) {
                return;
            }
            int i14 = -1;
            float f11 = Float.MAX_VALUE;
            while (true) {
                float f12 = fArr[i13];
                if (f12 > -1.0f) {
                    if (f11 == Float.MAX_VALUE) {
                        i14 = i11;
                    } else {
                        float f13 = ((f12 - fArr[i14]) / (i13 - i14)) - f11;
                        float f14 = i5;
                        if (f13 * f14 < 0.0f) {
                            while (i14 > i11) {
                                i14--;
                                if ((((fArr[i13] - fArr[i14]) / (i13 - i14)) - fArr2[i14]) * f14 >= 0.0f) {
                                    break;
                                }
                            }
                        }
                    }
                    f11 = (fArr[i13] - fArr[i14]) / (i13 - i14);
                    for (int i15 = i14; i15 < i13; i15++) {
                        fArr2[i15] = f11;
                        fArr[i15] = ((i15 - i14) * f11) + fArr[i14];
                    }
                    i14 = i13;
                }
                if (i13 == i12) {
                    return;
                } else {
                    i13++;
                }
            }
        }
    }

    public A7(@NotNull Md delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f62020a = delegate;
        Paint paint = new Paint();
        paint.setColor(-65536);
        paint.setStyle(Paint.Style.FILL);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.XOR));
        this.f62021b = paint;
        Paint paint2 = new Paint();
        float f11 = 256 * 0.03f;
        paint2.setStrokeWidth(f11 < 2.0f ? 2.0f : f11);
        paint2.setStyle(Paint.Style.STROKE);
        paint2.setColor(-16777216);
        PorterDuff.Mode mode = PorterDuff.Mode.CLEAR;
        paint2.setXfermode(new PorterDuffXfermode(mode));
        this.f62022c = paint2;
        Paint paint3 = new Paint();
        paint3.setXfermode(new PorterDuffXfermode(mode));
        this.f62023d = paint3;
        this.f62024e = new Paint(3);
        this.f62025f = new Rect();
        this.f62026g = new Path();
        this.f62027h = new Path();
        this.f62028i = new Path();
        this.f62029j = new Matrix();
    }

    public final float a(B7 b72, Bitmap bitmap, Canvas canvas, byte[] bArr) {
        float f11 = 1;
        if (Math.abs((this.f62025f.width() / this.f62025f.height()) - f11) > 0.05f) {
            this.f62020a.getClass();
            return 1.0f;
        }
        this.f62029j.reset();
        this.f62029j.setScale((this.f62025f.width() * f11) / 100.0f, (this.f62025f.height() * f11) / 100.0f);
        Matrix matrix = this.f62029j;
        Rect rect = this.f62025f;
        matrix.postTranslate(rect.left, rect.top);
        b72.f62135a.transform(this.f62029j, this.f62026g);
        this.f62020a.getClass();
        canvas.drawPath(this.f62026g, this.f62021b);
        this.f62020a.getClass();
        canvas.drawPath(this.f62026g, this.f62022c);
        this.f62020a.getClass();
        Path path = this.f62027h;
        path.rewind();
        Rect rect2 = this.f62025f;
        float f12 = rect2.left;
        float f13 = rect2.top;
        float f14 = rect2.right;
        float f15 = rect2.bottom;
        Path.Direction direction = Path.Direction.CCW;
        path.addRect(f12, f13, f14, f15, direction);
        Path path2 = this.f62028i;
        path2.rewind();
        Rect rect3 = this.f62025f;
        path2.addRoundRect(rect3.left, rect3.top, rect3.right, rect3.bottom, rect3.width() * 0.2f, this.f62025f.height() * 0.2f, direction);
        path.op(path2, Path.Op.DIFFERENCE);
        canvas.drawPath(path, this.f62022c);
        canvas.drawPath(path, this.f62023d);
        ByteBuffer byteBufferWrap = ByteBuffer.wrap(bArr);
        byteBufferWrap.rewind();
        bitmap.copyPixelsToBuffer(byteBufferWrap);
        int i5 = this.f62025f.top;
        int width = bitmap.getWidth() * i5;
        int width2 = bitmap.getWidth() - this.f62025f.right;
        int i11 = 0;
        while (true) {
            Rect rect4 = this.f62025f;
            if (i5 >= rect4.bottom) {
                return i11 / (this.f62025f.height() * rect4.width());
            }
            int i12 = rect4.left;
            int i13 = width + i12;
            int i14 = rect4.right;
            while (i12 < i14) {
                if ((bArr[i13] & 255) > 60) {
                    i11++;
                }
                i13++;
                i12++;
            }
            width = i13 + width2;
            i5++;
        }
    }

    public static final void a(Bitmap bitmap, Ref.IntRef intRef, float[] fArr, float[] fArr2, Canvas canvas, A7 a72) {
        Canvas canvas2;
        int i5 = 0;
        bitmap.eraseColor(0);
        int i11 = intRef.f71861a;
        while (i5 < i11) {
            float f11 = fArr[i5];
            float f12 = fArr2[i5];
            if (f11 == -1.0f || f12 == -1.0f || f11 == f12) {
                canvas2 = canvas;
            } else {
                float f13 = i5;
                canvas2 = canvas;
                canvas2.drawRect(f11, f13, f12, f13 + 1.0f, a72.f62024e);
            }
            i5++;
            canvas = canvas2;
        }
    }
}
