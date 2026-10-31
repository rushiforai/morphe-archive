package xf;

import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES20;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import com.google.android.exoplayer2.util.GlUtil$GlException;
import com.google.android.exoplayer2.video.PlaceholderSurface;
import java.util.Locale;
import wf.v;

/* loaded from: classes3.dex */
public final class g extends HandlerThread implements Handler.Callback {

    /* renamed from: a, reason: collision with root package name */
    public wf.c f95796a;

    /* renamed from: b, reason: collision with root package name */
    public Handler f95797b;

    /* renamed from: c, reason: collision with root package name */
    public Error f95798c;

    /* renamed from: d, reason: collision with root package name */
    public RuntimeException f95799d;

    /* renamed from: e, reason: collision with root package name */
    public PlaceholderSurface f95800e;

    public final void a(int i5) throws GlUtil$GlException {
        EGLSurface eGLSurfaceEglCreatePbufferSurface;
        this.f95796a.getClass();
        wf.c cVar = this.f95796a;
        int[] iArr = cVar.f94317b;
        EGLDisplay eGLDisplayEglGetDisplay = EGL14.eglGetDisplay(0);
        wf.a.g("eglGetDisplay failed", eGLDisplayEglGetDisplay != null);
        int[] iArr2 = new int[2];
        wf.a.g("eglInitialize failed", EGL14.eglInitialize(eGLDisplayEglGetDisplay, iArr2, 0, iArr2, 1));
        cVar.f94318c = eGLDisplayEglGetDisplay;
        EGLConfig[] eGLConfigArr = new EGLConfig[1];
        int[] iArr3 = new int[1];
        boolean zEglChooseConfig = EGL14.eglChooseConfig(eGLDisplayEglGetDisplay, wf.c.f94315g, 0, eGLConfigArr, 0, 1, iArr3, 0);
        boolean z11 = zEglChooseConfig && iArr3[0] > 0 && eGLConfigArr[0] != null;
        Object[] objArr = {Boolean.valueOf(zEglChooseConfig), Integer.valueOf(iArr3[0]), eGLConfigArr[0]};
        int i11 = v.f94376a;
        wf.a.g(String.format(Locale.US, "eglChooseConfig failed: success=%b, numConfigs[0]=%d, configs[0]=%s", objArr), z11);
        EGLConfig eGLConfig = eGLConfigArr[0];
        EGLContext eGLContextEglCreateContext = EGL14.eglCreateContext(cVar.f94318c, eGLConfig, EGL14.EGL_NO_CONTEXT, i5 == 0 ? new int[]{12440, 2, 12344} : new int[]{12440, 2, 12992, 1, 12344}, 0);
        wf.a.g("eglCreateContext failed", eGLContextEglCreateContext != null);
        cVar.f94319d = eGLContextEglCreateContext;
        EGLDisplay eGLDisplay = cVar.f94318c;
        if (i5 == 1) {
            eGLSurfaceEglCreatePbufferSurface = EGL14.EGL_NO_SURFACE;
        } else {
            eGLSurfaceEglCreatePbufferSurface = EGL14.eglCreatePbufferSurface(eGLDisplay, eGLConfig, i5 == 2 ? new int[]{12375, 1, 12374, 1, 12992, 1, 12344} : new int[]{12375, 1, 12374, 1, 12344}, 0);
            wf.a.g("eglCreatePbufferSurface failed", eGLSurfaceEglCreatePbufferSurface != null);
        }
        wf.a.g("eglMakeCurrent failed", EGL14.eglMakeCurrent(eGLDisplay, eGLSurfaceEglCreatePbufferSurface, eGLSurfaceEglCreatePbufferSurface, eGLContextEglCreateContext));
        cVar.f94320e = eGLSurfaceEglCreatePbufferSurface;
        GLES20.glGenTextures(1, iArr, 0);
        wf.a.f();
        SurfaceTexture surfaceTexture = new SurfaceTexture(iArr[0]);
        cVar.f94321f = surfaceTexture;
        surfaceTexture.setOnFrameAvailableListener(cVar);
        SurfaceTexture surfaceTexture2 = this.f95796a.f94321f;
        surfaceTexture2.getClass();
        this.f95800e = new PlaceholderSurface(this, surfaceTexture2, i5 != 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void b() {
        this.f95796a.getClass();
        wf.c cVar = this.f95796a;
        cVar.f94316a.removeCallbacks(cVar);
        try {
            SurfaceTexture surfaceTexture = cVar.f94321f;
            if (surfaceTexture != null) {
                surfaceTexture.release();
                GLES20.glDeleteTextures(1, cVar.f94317b, 0);
            }
        } finally {
            EGLDisplay eGLDisplay = cVar.f94318c;
            if (eGLDisplay != null && !eGLDisplay.equals(EGL14.EGL_NO_DISPLAY)) {
                EGLDisplay eGLDisplay2 = cVar.f94318c;
                EGLSurface eGLSurface = EGL14.EGL_NO_SURFACE;
                EGL14.eglMakeCurrent(eGLDisplay2, eGLSurface, eGLSurface, EGL14.EGL_NO_CONTEXT);
            }
            EGLSurface eGLSurface2 = cVar.f94320e;
            if (eGLSurface2 != null && !eGLSurface2.equals(EGL14.EGL_NO_SURFACE)) {
                EGL14.eglDestroySurface(cVar.f94318c, cVar.f94320e);
            }
            EGLContext eGLContext = cVar.f94319d;
            if (eGLContext != null) {
                EGL14.eglDestroyContext(cVar.f94318c, eGLContext);
            }
            if (v.f94376a >= 19) {
                EGL14.eglReleaseThread();
            }
            EGLDisplay eGLDisplay3 = cVar.f94318c;
            if (eGLDisplay3 != null && !eGLDisplay3.equals(EGL14.EGL_NO_DISPLAY)) {
                EGL14.eglTerminate(cVar.f94318c);
            }
            cVar.f94318c = null;
            cVar.f94319d = null;
            cVar.f94320e = null;
            cVar.f94321f = null;
        }
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        int i5 = message.what;
        try {
            if (i5 == 1) {
                try {
                    a(message.arg1);
                    synchronized (this) {
                        notify();
                    }
                    return true;
                } catch (GlUtil$GlException e3) {
                    wf.a.p("PlaceholderSurface", "Failed to initialize placeholder surface", e3);
                    this.f95799d = new IllegalStateException(e3);
                    synchronized (this) {
                        notify();
                    }
                } catch (Error e11) {
                    wf.a.p("PlaceholderSurface", "Failed to initialize placeholder surface", e11);
                    this.f95798c = e11;
                    synchronized (this) {
                        notify();
                    }
                } catch (RuntimeException e12) {
                    wf.a.p("PlaceholderSurface", "Failed to initialize placeholder surface", e12);
                    this.f95799d = e12;
                    synchronized (this) {
                        notify();
                    }
                }
            } else if (i5 == 2) {
                try {
                    b();
                    return true;
                } catch (Throwable th2) {
                    try {
                        wf.a.p("PlaceholderSurface", "Failed to release placeholder surface", th2);
                        return true;
                    } finally {
                        quit();
                    }
                }
            }
            return true;
        } catch (Throwable th3) {
            synchronized (this) {
                notify();
                throw th3;
            }
        }
    }
}
