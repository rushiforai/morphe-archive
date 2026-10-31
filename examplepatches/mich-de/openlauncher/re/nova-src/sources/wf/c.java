package wf;

import android.graphics.SurfaceTexture;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.os.Handler;

/* loaded from: classes3.dex */
public final class c implements SurfaceTexture.OnFrameAvailableListener, Runnable {

    /* renamed from: g, reason: collision with root package name */
    public static final int[] f94315g = {12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12325, 0, 12327, 12344, 12339, 4, 12344};

    /* renamed from: a, reason: collision with root package name */
    public final Handler f94316a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f94317b = new int[1];

    /* renamed from: c, reason: collision with root package name */
    public EGLDisplay f94318c;

    /* renamed from: d, reason: collision with root package name */
    public EGLContext f94319d;

    /* renamed from: e, reason: collision with root package name */
    public EGLSurface f94320e;

    /* renamed from: f, reason: collision with root package name */
    public SurfaceTexture f94321f;

    public c(Handler handler) {
        this.f94316a = handler;
    }

    @Override // android.graphics.SurfaceTexture.OnFrameAvailableListener
    public final void onFrameAvailable(SurfaceTexture surfaceTexture) {
        this.f94316a.post(this);
    }

    @Override // java.lang.Runnable
    public final void run() {
        SurfaceTexture surfaceTexture = this.f94321f;
        if (surfaceTexture != null) {
            try {
                surfaceTexture.updateTexImage();
            } catch (RuntimeException unused) {
            }
        }
    }
}
