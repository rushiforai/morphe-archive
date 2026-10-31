package com.amplitude;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Picture;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.view.PixelCopy;
import android.view.Surface;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import com.amplitude.C0482n;
import com.amplitude.common.Logger;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;
import kotlin.time.LongSaturatedMathKt;
import kotlin.time.MonotonicTimeSource;
import kotlin.time.TimeSource;

/* renamed from: com.amplitude.n, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0482n implements E {

    /* renamed from: a, reason: collision with root package name */
    public final long f20669a;

    /* renamed from: b, reason: collision with root package name */
    public final EnumC0458j f20670b;

    /* renamed from: c, reason: collision with root package name */
    public final int f20671c;

    /* renamed from: d, reason: collision with root package name */
    public final int f20672d;

    /* renamed from: e, reason: collision with root package name */
    public final long f20673e;

    /* renamed from: f, reason: collision with root package name */
    public Picture f20674f;

    /* renamed from: g, reason: collision with root package name */
    public Bitmap f20675g;

    /* renamed from: h, reason: collision with root package name */
    public String f20676h;

    public C0482n(View view, K3 logger, boolean z11, u4 viewCache) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        Intrinsics.g(view, "view");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(viewCache, "viewCache");
        this.f20669a = jCurrentTimeMillis;
        int width = view.getWidth();
        int height = view.getHeight();
        boolean z12 = view instanceof ViewGroup;
        float f11 = (z12 || (view instanceof ImageView) || (view instanceof TextureView) || (view instanceof SurfaceView)) ? 0.25f : 0.5f;
        int width2 = (int) (view.getWidth() * f11);
        this.f20671c = width2;
        int height2 = (int) (view.getHeight() * f11);
        this.f20672d = height2;
        this.f20673e = 1000L;
        if (width2 <= 0 || height2 <= 0) {
            return;
        }
        if (z12) {
            this.f20670b = EnumC0458j.f20617a;
            Drawable background = ((ViewGroup) view).getBackground();
            if (background == null) {
                return;
            }
            TimeSource.Monotonic.f72054a.getClass();
            MonotonicTimeSource.f72052a.getClass();
            long jA = MonotonicTimeSource.a();
            Picture picture = new Picture();
            Canvas canvasBeginRecording = picture.beginRecording(width2, height2);
            Intrinsics.f(canvasBeginRecording, "beginRecording(...)");
            canvasBeginRecording.scale(f11, f11);
            background.draw(canvasBeginRecording);
            picture.endRecording();
            this.f20674f = picture;
            long jA2 = MonotonicTimeSource.a();
            DurationUnit unit = DurationUnit.f72043b;
            Intrinsics.g(unit, "unit");
            long jH = Duration.h((1 | (jA - 1)) == Long.MAX_VALUE ? Duration.t(LongSaturatedMathKt.a(jA)) : LongSaturatedMathKt.b(jA2, jA, unit));
            long j11 = 1000;
            this.f20673e = kotlin.ranges.a.g0(jH * j11, 1000L, Math.max(jH, 1000L) * j11);
            return;
        }
        if (view instanceof TextureView) {
            this.f20670b = EnumC0458j.f20618b;
            if (z11) {
                return;
            }
            a((TextureView) view, viewCache, logger);
            return;
        }
        if (view instanceof SurfaceView) {
            this.f20670b = EnumC0458j.f20619c;
            if (z11) {
                return;
            }
            a((SurfaceView) view, viewCache, logger);
            return;
        }
        if (!z11) {
            this.f20670b = EnumC0458j.f20620d;
            Picture picture2 = new Picture();
            Canvas canvasBeginRecording2 = picture2.beginRecording(width, height);
            Intrinsics.f(canvasBeginRecording2, "beginRecording(...)");
            canvasBeginRecording2.scale(f11, f11);
            view.draw(canvasBeginRecording2);
            picture2.endRecording();
            this.f20674f = picture2;
            return;
        }
        this.f20670b = EnumC0458j.f20620d;
        Picture picture3 = new Picture();
        Canvas canvasBeginRecording3 = picture3.beginRecording(width, height);
        Intrinsics.f(canvasBeginRecording3, "beginRecording(...)");
        Y0 y02 = new Y0(canvasBeginRecording3);
        y02.f20435a.scale(f11, f11);
        view.draw(y02);
        picture3.endRecording();
        this.f20674f = picture3;
    }

    public final void a(TextureView textureView, final u4 u4Var, final K3 k32) {
        if (!textureView.isAvailable()) {
            Logger logger = k32.f20306a;
            if (logger != null) {
                logger.warn("AndroidViewBitmapRendering: TextureView is not available, skipping screenshot");
                return;
            }
            return;
        }
        Logger logger2 = k32.f20306a;
        if (logger2 != null) {
            logger2.debug("TextureView is available, proceeding with screenshot");
        }
        final Surface surface = new Surface(textureView.getSurfaceTexture());
        final Bitmap bitmapA = u4Var.a(this.f20671c, this.f20672d);
        PixelCopy.request(surface, bitmapA, new PixelCopy.OnPixelCopyFinishedListener() { // from class: g9.c
            @Override // android.view.PixelCopy.OnPixelCopyFinishedListener
            public final void onPixelCopyFinished(int i5) {
                C0482n.a(surface, this, bitmapA, k32, u4Var, i5);
            }
        }, new Handler(u4Var.f20784f.getLooper()));
    }

    public static final void a(Surface surface, C0482n this$0, Bitmap textureBitmap, K3 logger, u4 viewCache, int i5) {
        Intrinsics.g(surface, "$surface");
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(textureBitmap, "$textureBitmap");
        Intrinsics.g(logger, "$logger");
        Intrinsics.g(viewCache, "$viewCache");
        surface.release();
        if (i5 == 0) {
            this$0.f20675g = textureBitmap;
            logger.debug("AndroidViewBitmapRendering: Successfully copied texture view to bitmap " + this$0);
            return;
        }
        ((D) viewCache.f20782d.getValue()).a(textureBitmap);
        logger.error("AndroidViewBitmapRendering: Failed to copy texture view to bitmap: " + i5);
    }

    public final void a(SurfaceView surfaceView, final u4 u4Var, final K3 k32) {
        Surface surface = surfaceView.getHolder().getSurface();
        if (surface.isValid()) {
            final Bitmap bitmapA = u4Var.a(this.f20671c, this.f20672d);
            PixelCopy.request(surface, bitmapA, new PixelCopy.OnPixelCopyFinishedListener() { // from class: g9.d
                @Override // android.view.PixelCopy.OnPixelCopyFinishedListener
                public final void onPixelCopyFinished(int i5) {
                    C0482n.a(this.f57243a, bitmapA, k32, u4Var, i5);
                }
            }, new Handler(u4Var.f20784f.getLooper()));
        } else {
            Logger logger = k32.f20306a;
            if (logger != null) {
                logger.warn("AndroidViewBitmapRendering: SurfaceView holder surface is not valid, skipping screenshot");
            }
        }
    }

    public static final void a(C0482n this$0, Bitmap surfaceBitmap, K3 logger, u4 viewCache, int i5) {
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(surfaceBitmap, "$surfaceBitmap");
        Intrinsics.g(logger, "$logger");
        Intrinsics.g(viewCache, "$viewCache");
        if (i5 == 0) {
            this$0.f20675g = surfaceBitmap;
            Logger logger2 = logger.f20306a;
            if (logger2 != null) {
                logger2.debug("AndroidViewBitmapRendering: Successfully copied surface view to bitmap");
                return;
            }
            return;
        }
        ((D) viewCache.f20782d.getValue()).a(surfaceBitmap);
        logger.error("AndroidViewBitmapRendering: Failed to copy surface view to bitmap: " + i5);
    }

    @Override // com.amplitude.E
    public final String a(u4 viewCache, K3 logger) {
        Bitmap bitmap;
        D d5;
        Intrinsics.g(viewCache, "viewCache");
        Intrinsics.g(logger, "logger");
        try {
            if (this.f20676h == null && (this.f20675g != null || this.f20674f != null)) {
                logger.a(new C0470l(this));
                Bitmap bitmapA = this.f20675g;
                if (bitmapA == null) {
                    bitmapA = viewCache.a(this.f20671c, this.f20672d);
                }
                Canvas canvas = new Canvas(bitmapA);
                Picture picture = this.f20674f;
                if (picture != null) {
                    picture.draw(canvas);
                }
                this.f20676h = B.a(bitmapA);
                canvas.drawColor(0, PorterDuff.Mode.CLEAR);
                this.f20675g = bitmapA;
            }
            bitmap = this.f20675g;
        } catch (Throwable th2) {
            try {
                logger.a(th2, C0476m.f20663a);
                bitmap = this.f20675g;
                if (bitmap != null) {
                    d5 = (D) viewCache.f20782d.getValue();
                }
            } catch (Throwable th3) {
                Bitmap bitmap2 = this.f20675g;
                if (bitmap2 != null) {
                    ((D) viewCache.f20782d.getValue()).a(bitmap2);
                }
                this.f20675g = null;
                this.f20674f = null;
                throw th3;
            }
        }
        if (bitmap != null) {
            d5 = (D) viewCache.f20782d.getValue();
            d5.a(bitmap);
        }
        this.f20675g = null;
        this.f20674f = null;
        return this.f20676h;
    }
}
