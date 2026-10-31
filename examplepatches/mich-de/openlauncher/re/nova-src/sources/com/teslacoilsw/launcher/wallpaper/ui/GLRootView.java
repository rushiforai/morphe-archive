package com.teslacoilsw.launcher.wallpaper.ui;

import ai.i2;
import android.content.Context;
import android.graphics.Matrix;
import android.opengl.GLSurfaceView;
import android.opengl.GLU;
import android.os.Process;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import b.c0;
import b3.x;
import h6.c1;
import i30.a;
import i30.f;
import i30.i;
import i30.j;
import i30.l;
import i30.m;
import i30.o;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.WeakHashMap;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
import javax.microedition.khronos.opengles.GL11;
import mc0.d;
import mk.v;

/* loaded from: classes4.dex */
public class GLRootView extends GLSurfaceView implements GLSurfaceView.Renderer, l {

    /* renamed from: a, reason: collision with root package name */
    public GL11 f46386a;

    /* renamed from: b, reason: collision with root package name */
    public i f46387b;

    /* renamed from: c, reason: collision with root package name */
    public f f46388c;

    /* renamed from: d, reason: collision with root package name */
    public int f46389d;

    /* renamed from: e, reason: collision with root package name */
    public volatile boolean f46390e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f46391f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayDeque f46392g;

    /* renamed from: h, reason: collision with root package name */
    public final i2 f46393h;

    /* renamed from: i, reason: collision with root package name */
    public final ReentrantLock f46394i;

    /* renamed from: j, reason: collision with root package name */
    public final Condition f46395j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f46396k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f46397l;

    public GLRootView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        new Matrix();
        this.f46389d = 2;
        this.f46390e = false;
        o oVar = new o();
        this.f46391f = new ArrayList();
        this.f46392g = new ArrayDeque();
        this.f46393h = new i2(this);
        ReentrantLock reentrantLock = new ReentrantLock();
        this.f46394i = reentrantLock;
        this.f46395j = reentrantLock.newCondition();
        this.f46396k = false;
        this.f46397l = true;
        this.f46389d = 1 | this.f46389d;
        setBackgroundDrawable(null);
        setEGLConfigChooser(oVar);
        setRenderer(this);
        getHolder().setFormat(4);
    }

    public final void a() {
        this.f46394i.lock();
    }

    public final void b() {
        i iVar = this.f46387b;
        synchronized (iVar.f61311m) {
            try {
                x xVar = iVar.f61311m;
                int i5 = xVar.f17391a;
                if (i5 > 0) {
                    GL11 gl11 = iVar.f61299a;
                    int[] iArr = xVar.f17392b;
                    synchronized (j.class) {
                        gl11.glDeleteTextures(i5, iArr, 0);
                    }
                    xVar.f17391a = 0;
                    if (xVar.f17392b.length != 8) {
                        xVar.f17392b = new int[8];
                    }
                }
                x xVar2 = iVar.n;
                int i11 = xVar2.f17391a;
                if (i11 > 0) {
                    GL11 gl112 = iVar.f61299a;
                    int[] iArr2 = xVar2.f17392b;
                    synchronized (j.class) {
                        gl112.glDeleteBuffers(i11, iArr2, 0);
                    }
                    xVar2.f17391a = 0;
                    if (xVar2.f17392b.length != 8) {
                        xVar2.f17392b = new int[8];
                    }
                }
            } finally {
            }
        }
        HashMap map = i30.x.f61367m;
        this.f46390e = false;
        int i12 = this.f46389d;
        if ((i12 & 2) != 0) {
            this.f46389d = i12 & (-3);
            int width = getWidth();
            int height = getHeight();
            d.f76206a.h(c1.n(width, "layout content pane ", "x", height, " (compensation 0)"), new Object[0]);
            f fVar = this.f46388c;
            if (fVar != null && width != 0 && height != 0) {
                fVar.i(width, height);
            }
        }
        this.f46387b.h(-1);
        f fVar2 = this.f46388c;
        if (fVar2 != null) {
            fVar2.o(this.f46387b);
        }
        this.f46387b.g();
        if (!this.f46391f.isEmpty()) {
            if (this.f46391f.size() > 0) {
                this.f46391f.get(0).getClass();
                throw new ClassCastException();
            }
            this.f46391f.clear();
        }
        synchronized (this.f46392g) {
            try {
                if (!this.f46392g.isEmpty()) {
                    i2 i2Var = this.f46393h;
                    if (!i2Var.f13012b) {
                        i2Var.f13012b = true;
                        ((GLRootView) i2Var.f13013c).queueEvent(i2Var);
                    }
                }
            } finally {
            }
        }
    }

    public final void c() {
        ReentrantLock reentrantLock = this.f46394i;
        reentrantLock.lock();
        try {
            if (this.f46388c != null) {
                int i5 = this.f46389d;
                if ((i5 & 2) == 0) {
                    if ((i5 & 1) == 0) {
                        return;
                    }
                    this.f46389d = i5 | 2;
                    requestRender();
                }
            }
        } finally {
            reentrantLock.unlock();
        }
    }

    public final void d() {
        ReentrantLock reentrantLock = this.f46394i;
        reentrantLock.lock();
        try {
            this.f46395j.signalAll();
        } finally {
            reentrantLock.unlock();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0017, code lost:
    
        if (r0 != 0) goto L12;
     */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        boolean z11 = false;
        if (isEnabled()) {
            int action = motionEvent.getAction();
            if (action == 3 || action == 1) {
                this.f46396k = false;
            } else if (!this.f46396k) {
            }
            ReentrantLock reentrantLock = this.f46394i;
            reentrantLock.lock();
            try {
                f fVar = this.f46388c;
                if (fVar != null && fVar.b(motionEvent)) {
                    z11 = true;
                }
                if (action == 0 && z11) {
                    this.f46396k = true;
                }
                reentrantLock.unlock();
                return z11;
            } catch (Throwable th2) {
                reentrantLock.unlock();
                throw th2;
            }
        }
        return false;
    }

    public final void e() {
        this.f46394i.unlock();
    }

    @Override // android.opengl.GLSurfaceView
    public final void finalize() throws Throwable {
        try {
            d();
        } finally {
            super.finalize();
        }
    }

    @Override // android.opengl.GLSurfaceView, android.view.SurfaceView, android.view.View
    public final void onDetachedFromWindow() {
        d();
        super.onDetachedFromWindow();
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public final void onDrawFrame(GL10 gl10) {
        v.f76490c = SystemClock.uptimeMillis();
        this.f46394i.lock();
        try {
            b();
            this.f46394i.unlock();
            if (this.f46397l) {
                this.f46397l = false;
                post(new m(this));
            }
        } catch (Throwable th2) {
            this.f46394i.unlock();
            throw th2;
        }
    }

    @Override // android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        if (z11) {
            c();
        }
    }

    @Override // android.opengl.GLSurfaceView
    public final void onPause() {
        d();
        super.onPause();
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public final void onSurfaceChanged(GL10 gl10, int i5, int i11) throws SecurityException, IllegalArgumentException {
        StringBuilder sbT = c0.t(i5, "onSurfaceChanged: ", "x", i11, ", gl10: ");
        sbT.append(gl10.toString());
        d.f76206a.h(sbT.toString(), new Object[0]);
        Process.setThreadPriority(-4);
        f30.f.a(this.f46386a == ((GL11) gl10));
        i iVar = this.f46387b;
        iVar.getClass();
        f30.f.a(i5 >= 0 && i11 >= 0);
        iVar.f61305g = 1.0f;
        GL11 gl11 = iVar.f61299a;
        gl11.glViewport(0, 0, i5, i11);
        gl11.glMatrixMode(5889);
        gl11.glLoadIdentity();
        float f11 = i11;
        GLU.gluOrtho2D(gl11, 0.0f, i5, 0.0f, f11);
        gl11.glMatrixMode(5888);
        gl11.glLoadIdentity();
        float[] fArr = iVar.f61300b;
        android.opengl.Matrix.setIdentityM(fArr, 0);
        android.opengl.Matrix.translateM(fArr, 0, 0.0f, f11, 0.0f);
        android.opengl.Matrix.scaleM(fArr, 0, 1.0f, -1.0f, 1.0f);
    }

    @Override // android.opengl.GLSurfaceView.Renderer
    public final void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        GL11 gl11 = (GL11) gl10;
        GL11 gl112 = this.f46386a;
        if (gl112 != null) {
            d.f76206a.h("GLObject has changed from %s to %s", gl112, gl11);
        }
        this.f46394i.lock();
        try {
            this.f46386a = gl11;
            this.f46387b = new i(gl11);
            WeakHashMap weakHashMap = a.f61245h;
            synchronized (weakHashMap) {
                try {
                    for (a aVar : weakHashMap.keySet()) {
                        aVar.f61248b = 0;
                        aVar.f61253g = null;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            this.f46394i.unlock();
            setRenderMode(0);
        } catch (Throwable th3) {
            this.f46394i.unlock();
            throw th3;
        }
    }

    @Override // android.opengl.GLSurfaceView, i30.l
    public final void requestRender() {
        if (this.f46390e) {
            return;
        }
        this.f46390e = true;
        super.requestRender();
    }

    @Override // android.opengl.GLSurfaceView, android.view.SurfaceHolder.Callback
    public final void surfaceChanged(SurfaceHolder surfaceHolder, int i5, int i11, int i12) {
        d();
        super.surfaceChanged(surfaceHolder, i5, i11, i12);
    }

    @Override // android.opengl.GLSurfaceView, android.view.SurfaceHolder.Callback
    public final void surfaceCreated(SurfaceHolder surfaceHolder) {
        d();
        super.surfaceCreated(surfaceHolder);
    }

    @Override // android.opengl.GLSurfaceView, android.view.SurfaceHolder.Callback
    public final void surfaceDestroyed(SurfaceHolder surfaceHolder) {
        d();
        super.surfaceDestroyed(surfaceHolder);
    }
}
