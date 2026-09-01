package defpackage;

import android.animation.Animator;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Choreographer;
import android.view.View;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rc7 extends Drawable implements Drawable.Callback, Animatable {
    public static final boolean O;
    public static final List P;
    public static final ThreadPoolExecutor Q;
    public Rect A;
    public Rect B;
    public RectF C;
    public RectF D;
    public Matrix E;
    public final float[] F;
    public Matrix G;
    public boolean H;
    public t90 I;
    public final Semaphore J;
    public Handler K;
    public mc7 L;
    public final mc7 M;
    public float N;
    public bc7 a;
    public final zc7 b;
    public final boolean c;
    public boolean d;
    public qc7 e;
    public final ArrayList f;
    public m50 g;
    public n0c h;
    public Map i;
    public final pkf j;
    public boolean k;
    public boolean l;
    public s22 m;
    public int n;
    public boolean o;
    public boolean p;
    public boolean q;
    public boolean r;
    public n4b s;
    public boolean t;
    public final Matrix u;
    public Bitmap v;
    public Canvas w;
    public Rect x;
    public RectF y;
    public ao6 z;

    static {
        O = Build.VERSION.SDK_INT <= 25;
        P = Arrays.asList("reduced motion", "reduced_motion", "reduced-motion", "reducedmotion");
        Q = new ThreadPoolExecutor(0, 2, 35L, TimeUnit.MILLISECONDS, new LinkedBlockingQueue(), new yc7());
    }

    public rc7() {
        zc7 zc7Var = new zc7();
        zc7Var.d = 1.0f;
        zc7Var.e = false;
        zc7Var.f = 0L;
        zc7Var.g = 0.0f;
        zc7Var.h = 0.0f;
        zc7Var.i = 0;
        zc7Var.j = -2.1474836E9f;
        zc7Var.k = 2.1474836E9f;
        zc7Var.m = false;
        this.b = zc7Var;
        this.c = true;
        this.d = false;
        this.e = qc7.NONE;
        this.f = new ArrayList();
        this.j = new pkf(18);
        this.k = false;
        this.l = true;
        this.n = 255;
        this.r = false;
        this.s = n4b.AUTOMATIC;
        this.t = false;
        this.u = new Matrix();
        this.F = new float[9];
        this.H = false;
        lc7 lc7Var = new lc7(this);
        this.J = new Semaphore(1);
        this.M = new mc7(this, 0);
        this.N = -3.4028235E38f;
        zc7Var.addUpdateListener(lc7Var);
    }

    public static void d(RectF rectF, Rect rect) {
        rect.set((int) Math.floor(rectF.left), (int) Math.floor(rectF.top), (int) Math.ceil(rectF.right), (int) Math.ceil(rectF.bottom));
    }

    public static boolean h(float f) {
        return (Float.isNaN(f) || Float.isInfinite(f)) ? false : true;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0022  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean a(android.content.Context r2) {
        /*
            r1 = this;
            boolean r1 = r1.c
            if (r1 == 0) goto L2a
            cd7 r1 = defpackage.xn6.b
            r1.getClass()
            if (r2 == 0) goto L22
            android.graphics.Matrix r1 = defpackage.gpe.a
            android.content.ContentResolver r1 = r2.getContentResolver()
            java.lang.String r2 = "animator_duration_scale"
            r0 = 1065353216(0x3f800000, float:1.0)
            float r1 = android.provider.Settings.Global.getFloat(r1, r2, r0)
            r2 = 0
            int r1 = (r1 > r2 ? 1 : (r1 == r2 ? 0 : -1))
            if (r1 == 0) goto L1f
            goto L22
        L1f:
            lya r1 = defpackage.lya.REDUCED_MOTION
            goto L24
        L22:
            lya r1 = defpackage.lya.STANDARD_MOTION
        L24:
            lya r2 = defpackage.lya.STANDARD_MOTION
            if (r1 != r2) goto L2a
            r1 = 1
            return r1
        L2a:
            r1 = 0
            return r1
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rc7.a(android.content.Context):boolean");
    }

    public final void b() {
        bc7 bc7Var = this.a;
        if (bc7Var == null) {
            return;
        }
        hx4 hx4Var = yo6.a;
        Rect rect = bc7Var.k;
        List list = Collections.EMPTY_LIST;
        s22 s22Var = new s22(this, new wo6(list, bc7Var, "__container", -1L, uo6.PRE_COMP, -1L, null, list, new vu(), 0, 0, 0, 0.0f, 0.0f, rect.width(), rect.height(), null, null, list, vo6.NONE, null, false, null, null, zn6.NORMAL), bc7Var.j, bc7Var);
        this.m = s22Var;
        if (this.o) {
            s22Var.m(true);
        }
        this.m.L = this.l;
    }

    public final void c() {
        bc7 bc7Var = this.a;
        if (bc7Var == null) {
            return;
        }
        this.t = this.s.useSoftwareRendering(Build.VERSION.SDK_INT, bc7Var.o, bc7Var.p);
    }

    @Override // android.graphics.drawable.Drawable
    public final void draw(Canvas canvas) {
        s22 s22Var = this.m;
        if (s22Var == null) {
            return;
        }
        t90 t90Var = this.I;
        if (t90Var == null) {
            t90Var = xn6.a;
        }
        boolean z = t90Var == t90.ENABLED;
        mc7 mc7Var = this.M;
        ThreadPoolExecutor threadPoolExecutor = Q;
        zc7 zc7Var = this.b;
        Semaphore semaphore = this.J;
        if (z) {
            try {
                semaphore.acquire();
            } catch (InterruptedException unused) {
                t90 t90Var2 = xn6.a;
                if (!z) {
                    return;
                }
                semaphore.release();
                if (s22Var.K == zc7Var.d()) {
                    return;
                }
            } catch (Throwable th) {
                t90 t90Var3 = xn6.a;
                if (z) {
                    semaphore.release();
                    if (s22Var.K != zc7Var.d()) {
                        threadPoolExecutor.execute(mc7Var);
                    }
                }
                throw th;
            }
        }
        t90 t90Var4 = xn6.a;
        if (z && n()) {
            m(zc7Var.d());
        }
        boolean z2 = this.d;
        boolean z3 = this.t;
        if (z2) {
            try {
                if (z3) {
                    j(canvas, s22Var);
                } else {
                    e(canvas);
                }
            } catch (Throwable unused2) {
                h87.a.getClass();
                t90 t90Var5 = xn6.a;
            }
        } else if (z3) {
            j(canvas, s22Var);
        } else {
            e(canvas);
        }
        this.H = false;
        if (z) {
            semaphore.release();
            if (s22Var.K == zc7Var.d()) {
                return;
            }
            threadPoolExecutor.execute(mc7Var);
        }
    }

    public final void e(Canvas canvas) {
        s22 s22Var = this.m;
        bc7 bc7Var = this.a;
        if (s22Var == null || bc7Var == null) {
            return;
        }
        Matrix matrix = this.u;
        matrix.reset();
        if (!getBounds().isEmpty()) {
            matrix.preTranslate(r3.left, r3.top);
            matrix.preScale(r3.width() / bc7Var.k.width(), r3.height() / bc7Var.k.height());
        }
        s22Var.e(canvas, matrix, this.n, null);
    }

    public final Context f() {
        Drawable.Callback callback = getCallback();
        if (callback != null && (callback instanceof View)) {
            return ((View) callback).getContext();
        }
        return null;
    }

    public final ki7 g() {
        ki7 ki7Var = null;
        for (String str : P) {
            bc7 bc7Var = this.a;
            int size = bc7Var.g.size();
            for (int i = 0; i < size; i++) {
                ki7 ki7Var2 = (ki7) bc7Var.g.get(i);
                String str2 = ki7Var2.a;
                if (str2.equalsIgnoreCase(str) || (str2.endsWith("\r") && str2.substring(0, str2.length() - 1).equalsIgnoreCase(str))) {
                    ki7Var = ki7Var2;
                    break;
                }
            }
            ki7Var = null;
            if (ki7Var != null) {
                break;
            }
        }
        return ki7Var;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getAlpha() {
        return this.n;
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicHeight() {
        bc7 bc7Var = this.a;
        if (bc7Var == null) {
            return -1;
        }
        return bc7Var.k.height();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getIntrinsicWidth() {
        bc7 bc7Var = this.a;
        if (bc7Var == null) {
            return -1;
        }
        return bc7Var.k.width();
    }

    @Override // android.graphics.drawable.Drawable
    public final int getOpacity() {
        return -3;
    }

    public final void i() {
        if (this.m == null) {
            this.f.add(new kc7(this, 1));
            return;
        }
        c();
        boolean zA = a(f());
        zc7 zc7Var = this.b;
        if (zA || zc7Var.getRepeatCount() == 0) {
            if (isVisible()) {
                zc7Var.m = true;
                zc7Var.b(zc7Var.h());
                zc7Var.j((int) (zc7Var.h() ? zc7Var.e() : zc7Var.g()));
                zc7Var.f = 0L;
                zc7Var.i = 0;
                if (zc7Var.m) {
                    zc7Var.i(false);
                    Choreographer.getInstance().postFrameCallback(zc7Var);
                }
                this.e = qc7.NONE;
            } else {
                this.e = qc7.PLAY;
            }
        }
        if (a(f())) {
            return;
        }
        ki7 ki7VarG = g();
        if (ki7VarG != null) {
            l((int) ki7VarG.b);
        } else {
            l((int) (zc7Var.d < 0.0f ? zc7Var.g() : zc7Var.e()));
        }
        zc7Var.i(true);
        zc7Var.a(zc7Var.h());
        if (isVisible()) {
            return;
        }
        this.e = qc7.NONE;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void invalidateDrawable(Drawable drawable) {
        Drawable.Callback callback = getCallback();
        if (callback == null) {
            return;
        }
        callback.invalidateDrawable(this);
    }

    @Override // android.graphics.drawable.Drawable
    public final void invalidateSelf() {
        Drawable.Callback callback;
        if (this.H) {
            return;
        }
        this.H = true;
        if ((!O || Looper.getMainLooper() == Looper.myLooper()) && (callback = getCallback()) != null) {
            callback.invalidateDrawable(this);
        }
    }

    @Override // android.graphics.drawable.Animatable
    public final boolean isRunning() {
        zc7 zc7Var = this.b;
        if (zc7Var == null) {
            return false;
        }
        return zc7Var.m;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x00d3  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void j(android.graphics.Canvas r12, defpackage.s22 r13) {
        /*
            Method dump skipped, instruction units count: 535
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rc7.j(android.graphics.Canvas, s22):void");
    }

    public final void k() {
        if (this.m == null) {
            this.f.add(new kc7(this, 0));
            return;
        }
        c();
        boolean zA = a(f());
        zc7 zc7Var = this.b;
        if (zA || zc7Var.getRepeatCount() == 0) {
            if (isVisible()) {
                zc7Var.m = true;
                zc7Var.i(false);
                Choreographer.getInstance().postFrameCallback(zc7Var);
                zc7Var.f = 0L;
                if (zc7Var.h() && zc7Var.h == zc7Var.g()) {
                    zc7Var.j(zc7Var.e());
                } else if (!zc7Var.h() && zc7Var.h == zc7Var.e()) {
                    zc7Var.j(zc7Var.g());
                }
                Iterator it2 = zc7Var.c.iterator();
                while (it2.hasNext()) {
                    ((Animator.AnimatorPauseListener) it2.next()).onAnimationResume(zc7Var);
                }
                this.e = qc7.NONE;
            } else {
                this.e = qc7.RESUME;
            }
        }
        if (a(f())) {
            return;
        }
        l((int) (zc7Var.d < 0.0f ? zc7Var.g() : zc7Var.e()));
        zc7Var.i(true);
        zc7Var.a(zc7Var.h());
        if (isVisible()) {
            return;
        }
        this.e = qc7.NONE;
    }

    public final void l(final int i) {
        if (this.a != null) {
            this.b.j(i);
        } else {
            this.f.add(new pc7() { // from class: oc7
                @Override // defpackage.pc7
                public final void run() {
                    this.a.l(i);
                }
            });
        }
    }

    public final void m(final float f) {
        bc7 bc7Var = this.a;
        if (bc7Var == null) {
            this.f.add(new pc7() { // from class: nc7
                @Override // defpackage.pc7
                public final void run() {
                    this.a.m(f);
                }
            });
        } else {
            t90 t90Var = xn6.a;
            this.b.j(a18.e(bc7Var.l, bc7Var.m, f));
        }
    }

    public final boolean n() {
        bc7 bc7Var = this.a;
        if (bc7Var == null) {
            return false;
        }
        float f = this.N;
        float fD = this.b.d();
        this.N = fD;
        return Math.abs(fD - f) * bc7Var.b() >= 50.0f;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void scheduleDrawable(Drawable drawable, Runnable runnable, long j) {
        Drawable.Callback callback = getCallback();
        if (callback == null) {
            return;
        }
        callback.scheduleDrawable(this, runnable, j);
    }

    @Override // android.graphics.drawable.Drawable
    public final void setAlpha(int i) {
        this.n = i;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public final void setColorFilter(ColorFilter colorFilter) {
        h87.a("Use addColorFilter instead.");
    }

    @Override // android.graphics.drawable.Drawable
    public final boolean setVisible(boolean z, boolean z2) {
        boolean zIsVisible = isVisible();
        boolean visible = super.setVisible(z, z2);
        if (z) {
            qc7 qc7Var = this.e;
            if (qc7Var == qc7.PLAY) {
                i();
                return visible;
            }
            if (qc7Var == qc7.RESUME) {
                k();
                return visible;
            }
        } else {
            zc7 zc7Var = this.b;
            if (zc7Var.m) {
                this.f.clear();
                zc7Var.i(true);
                Iterator it2 = zc7Var.c.iterator();
                while (it2.hasNext()) {
                    ((Animator.AnimatorPauseListener) it2.next()).onAnimationPause(zc7Var);
                }
                if (!isVisible()) {
                    this.e = qc7.NONE;
                }
                this.e = qc7.RESUME;
                return visible;
            }
            if (zIsVisible) {
                this.e = qc7.NONE;
            }
        }
        return visible;
    }

    @Override // android.graphics.drawable.Animatable
    public final void start() {
        Drawable.Callback callback = getCallback();
        if ((callback instanceof View) && ((View) callback).isInEditMode()) {
            return;
        }
        i();
    }

    @Override // android.graphics.drawable.Animatable
    public final void stop() {
        this.f.clear();
        zc7 zc7Var = this.b;
        zc7Var.i(true);
        zc7Var.a(zc7Var.h());
        if (isVisible()) {
            return;
        }
        this.e = qc7.NONE;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public final void unscheduleDrawable(Drawable drawable, Runnable runnable) {
        Drawable.Callback callback = getCallback();
        if (callback == null) {
            return;
        }
        callback.unscheduleDrawable(this, runnable);
    }
}
