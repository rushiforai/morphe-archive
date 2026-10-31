package io.branch.search.internal;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Shader;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.ne, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3288ne {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Md f65392a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final ThreadLocal<Paint> f65393b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final A7 f65394c;

    /* renamed from: d, reason: collision with root package name */
    public final float f65395d;

    /* renamed from: io.branch.search.internal.ne$a */
    public /* synthetic */ class a {

        /* renamed from: a, reason: collision with root package name */
        public static final /* synthetic */ int[] f65396a;

        static {
            int[] iArr = new int[B7.values().length];
            iArr[B7.CIRCLE.ordinal()] = 1;
            f65396a = iArr;
        }
    }

    public /* synthetic */ C3288ne() {
        this(Ee.f62423a);
    }

    public final Bitmap a(Bitmap bitmap, float f11, int i5, int i11) {
        float height;
        Bitmap bitmapCreateBitmap = Bitmap.createBitmap(i5, i5, Bitmap.Config.ARGB_8888);
        Intrinsics.f(bitmapCreateBitmap, "createBitmap(size, size, Bitmap.Config.ARGB_8888)");
        Shader.TileMode tileMode = Shader.TileMode.CLAMP;
        BitmapShader bitmapShader = new BitmapShader(bitmap, tileMode, tileMode);
        float fMin = Math.min(bitmapCreateBitmap.getWidth() / bitmap.getWidth(), bitmapCreateBitmap.getHeight() / bitmap.getHeight());
        float width = 0.0f;
        if (bitmap.getWidth() > bitmap.getHeight()) {
            width = (bitmap.getWidth() - bitmap.getHeight()) / 2.0f;
            height = 0.0f;
        } else {
            height = bitmap.getHeight() > bitmap.getWidth() ? (bitmap.getHeight() - bitmap.getWidth()) / 2.0f : 0.0f;
        }
        Matrix matrix = new Matrix();
        matrix.setScale(fMin, fMin);
        matrix.postTranslate(height, width + 0);
        matrix.postScale(f11, f11, bitmapCreateBitmap.getWidth() / 2.0f, bitmapCreateBitmap.getHeight() / 2.0f);
        bitmapShader.setLocalMatrix(matrix);
        ThreadLocal<Paint> threadLocal = this.f65393b;
        Paint paint = threadLocal.get();
        if (paint == null) {
            paint = new Paint();
            threadLocal.set(paint);
        }
        Paint paint2 = paint;
        paint2.setShader(bitmapShader);
        int width2 = bitmapCreateBitmap.getWidth() / 2;
        float width3 = bitmapCreateBitmap.getWidth() * f11;
        float height2 = bitmapCreateBitmap.getHeight() * f11;
        float f12 = 2;
        float f13 = width2 - (width3 / f12);
        float height3 = (bitmapCreateBitmap.getHeight() / 2) - (height2 / f12);
        float f14 = f13 + width3;
        float f15 = width3 + height3;
        Canvas canvas = new Canvas(bitmapCreateBitmap);
        if (i11 != 0) {
            canvas.drawColor(i11);
        }
        canvas.clipRect(f13, height3, f14, f15);
        canvas.drawRect(0.0f, 0.0f, bitmapCreateBitmap.getWidth(), bitmapCreateBitmap.getHeight(), paint2);
        canvas.setBitmap(null);
        matrix.reset();
        paint2.setShader(null);
        return bitmapCreateBitmap;
    }

    public C3288ne(@NotNull Md shapeDelegate) {
        Intrinsics.g(shapeDelegate, "shapeDelegate");
        this.f65392a = shapeDelegate;
        this.f65393b = new ThreadLocal<>();
        this.f65394c = new A7(shapeDelegate);
        this.f65395d = 100.0f;
    }
}
