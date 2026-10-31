package com.google.android.exoplayer2.video;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.os.Handler;
import android.view.Surface;
import wf.a;
import wf.c;
import wf.v;
import xf.g;

/* loaded from: classes3.dex */
public final class PlaceholderSurface extends Surface {

    /* renamed from: d, reason: collision with root package name */
    public static int f31597d;

    /* renamed from: e, reason: collision with root package name */
    public static boolean f31598e;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f31599a;

    /* renamed from: b, reason: collision with root package name */
    public final g f31600b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f31601c;

    public PlaceholderSurface(g gVar, SurfaceTexture surfaceTexture, boolean z11) {
        super(surfaceTexture);
        this.f31600b = gVar;
        this.f31599a = z11;
    }

    public static int a(Context context) {
        String strEglQueryString;
        String strEglQueryString2;
        int i5 = v.f94376a;
        if (i5 >= 24 && ((i5 >= 26 || !("samsung".equals(v.f94378c) || "XT1650".equals(v.f94379d))) && ((i5 >= 26 || context.getPackageManager().hasSystemFeature("android.hardware.vr.high_performance")) && (strEglQueryString = EGL14.eglQueryString(EGL14.eglGetDisplay(0), 12373)) != null && strEglQueryString.contains("EGL_EXT_protected_content")))) {
            return (i5 >= 17 && (strEglQueryString2 = EGL14.eglQueryString(EGL14.eglGetDisplay(0), 12373)) != null && strEglQueryString2.contains("EGL_KHR_surfaceless_context")) ? 1 : 2;
        }
        return 0;
    }

    public static synchronized boolean b(Context context) {
        try {
            if (!f31598e) {
                f31597d = a(context);
                f31598e = true;
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return f31597d != 0;
    }

    public static PlaceholderSurface d(Context context, boolean z11) {
        boolean z12 = false;
        a.i(!z11 || b(context));
        g gVar = new g("ExoPlayer:PlaceholderSurface");
        int i5 = z11 ? f31597d : 0;
        gVar.start();
        Handler handler = new Handler(gVar.getLooper(), gVar);
        gVar.f95797b = handler;
        gVar.f95796a = new c(handler);
        synchronized (gVar) {
            gVar.f95797b.obtainMessage(1, i5, 0).sendToTarget();
            while (gVar.f95800e == null && gVar.f95799d == null && gVar.f95798c == null) {
                try {
                    gVar.wait();
                } catch (InterruptedException unused) {
                    z12 = true;
                }
            }
        }
        if (z12) {
            Thread.currentThread().interrupt();
        }
        RuntimeException runtimeException = gVar.f95799d;
        if (runtimeException != null) {
            throw runtimeException;
        }
        Error error = gVar.f95798c;
        if (error != null) {
            throw error;
        }
        PlaceholderSurface placeholderSurface = gVar.f95800e;
        placeholderSurface.getClass();
        return placeholderSurface;
    }

    @Override // android.view.Surface
    public final void release() {
        super.release();
        synchronized (this.f31600b) {
            try {
                if (!this.f31601c) {
                    g gVar = this.f31600b;
                    gVar.f95797b.getClass();
                    gVar.f95797b.sendEmptyMessage(2);
                    this.f31601c = true;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
