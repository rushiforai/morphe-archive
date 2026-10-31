package com.android.launcher3;

import ai.h;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.opengl.GLSurfaceView;
import android.util.AttributeSet;
import android.view.Choreographer;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ViewConfiguration;
import android.view.ViewPropertyAnimator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.widget.FrameLayout;
import c10.a;
import ib.c;
import ib.d;
import ib.e;
import ib.f;
import o7.g0;

/* loaded from: classes2.dex */
public class CropView extends FrameLayout implements ScaleGestureDetector.OnScaleGestureListener {

    /* renamed from: a, reason: collision with root package name */
    public GLSurfaceView f20923a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f20924b;

    /* renamed from: c, reason: collision with root package name */
    public d f20925c;

    /* renamed from: d, reason: collision with root package name */
    public Object f20926d;

    /* renamed from: e, reason: collision with root package name */
    public e f20927e;

    /* renamed from: f, reason: collision with root package name */
    public h f20928f;

    /* renamed from: g, reason: collision with root package name */
    public final ScaleGestureDetector f20929g;

    /* renamed from: h, reason: collision with root package name */
    public long f20930h;

    /* renamed from: i, reason: collision with root package name */
    public float f20931i;

    /* renamed from: j, reason: collision with root package name */
    public float f20932j;

    /* renamed from: k, reason: collision with root package name */
    public float f20933k;

    /* renamed from: l, reason: collision with root package name */
    public float f20934l;

    /* renamed from: m, reason: collision with root package name */
    public float f20935m;
    public float n;
    public float o;

    /* renamed from: p, reason: collision with root package name */
    public boolean f20936p;

    /* renamed from: q, reason: collision with root package name */
    public final RectF f20937q;

    /* renamed from: r, reason: collision with root package name */
    public final float[] f20938r;

    /* renamed from: s, reason: collision with root package name */
    public final float[] f20939s;

    /* renamed from: t, reason: collision with root package name */
    public final float[] f20940t;

    /* renamed from: u, reason: collision with root package name */
    public final float[] f20941u;

    /* renamed from: v, reason: collision with root package name */
    public final float[] f20942v;

    /* renamed from: w, reason: collision with root package name */
    public a f20943w;

    /* renamed from: x, reason: collision with root package name */
    public final Matrix f20944x;

    /* renamed from: y, reason: collision with root package name */
    public final Matrix f20945y;

    public CropView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f20924b = false;
        this.f20926d = new Object();
        this.f20928f = new h(this, 19);
        new RectF();
        e eVar = new e();
        this.f20927e = eVar;
        eVar.f61505f = new c(this);
        GLSurfaceView gLSurfaceView = new GLSurfaceView(context);
        this.f20923a = gLSurfaceView;
        gLSurfaceView.setEGLContextClientVersion(2);
        gLSurfaceView.setRenderer(new f(this));
        gLSurfaceView.setRenderMode(0);
        addView(gLSurfaceView, new FrameLayout.LayoutParams(-1, -1));
        this.f20936p = true;
        this.f20937q = new RectF();
        this.f20938r = new float[]{0.0f, 0.0f};
        this.f20939s = new float[]{0.0f, 0.0f};
        this.f20940t = new float[]{0.0f, 0.0f};
        this.f20941u = new float[]{0.0f, 0.0f};
        this.f20942v = new float[]{0.0f, 0.0f};
        this.f20929g = new ScaleGestureDetector(context, this);
        this.f20944x = new Matrix();
        this.f20945y = new Matrix();
    }

    public final void a(RectF rectF) {
        float width = getWidth();
        float height = getHeight();
        float[] fArrB = b();
        float f11 = fArrB[0];
        float f12 = fArrB[1];
        e eVar = this.f20927e;
        hb.d dVar = (hb.d) eVar.f61504e;
        float f13 = dVar.f59601b / 2.0f;
        float f14 = this.f20935m - f13;
        float[] fArr = this.f20942v;
        fArr[0] = f14;
        fArr[1] = this.n - (dVar.f59602c / 2.0f);
        this.f20944x.mapPoints(fArr);
        float f15 = f11 / 2.0f;
        float f16 = fArr[0] + f15;
        fArr[0] = f16;
        float f17 = f12 / 2.0f;
        float f18 = fArr[1] + f17;
        fArr[1] = f18;
        float f19 = eVar.f61503d;
        float f21 = width / 2.0f;
        float f22 = ((((f11 - width) / 2.0f) + (f21 - f16)) * f19) + f21;
        float f23 = height / 2.0f;
        float f24 = ((((f12 - height) / 2.0f) + (f23 - f18)) * f19) + f23;
        float f25 = f15 * f19;
        float f26 = f17 * f19;
        rectF.left = f22 - f25;
        rectF.right = f22 + f25;
        rectF.top = f24 - f26;
        rectF.bottom = f24 + f26;
    }

    public final float[] b() {
        hb.d dVar = (hb.d) this.f20927e.f61504e;
        float f11 = dVar.f59601b;
        float f12 = dVar.f59602c;
        float[] fArr = this.f20941u;
        fArr[0] = f11;
        fArr[1] = f12;
        this.f20944x.mapPoints(fArr);
        fArr[0] = Math.abs(fArr[0]);
        fArr[1] = Math.abs(fArr[1]);
        return fArr;
    }

    public final void c() {
        if (getWidth() == 0 || getHeight() == 0) {
            getViewTreeObserver().addOnGlobalLayoutListener(new d9.d(this, 1));
        }
        a(this.f20937q);
        float f11 = this.f20927e.f61503d;
        this.f20935m = (float) (Math.ceil(r0.left / f11) + this.f20935m);
        e();
    }

    public final void d(hb.d dVar) {
        synchronized (this.f20926d) {
            e eVar = this.f20927e;
            eVar.f61504e = dVar;
            eVar.f61500a = dVar.f59601b / 2;
            eVar.f61501b = dVar.f59602c / 2;
            eVar.f61502c = dVar.f59605f;
            eVar.f61503d = 0.0f;
            g(eVar);
        }
        invalidate();
        e eVar2 = this.f20927e;
        this.f20935m = eVar2.f61500a;
        this.n = eVar2.f61501b;
        this.f20944x.reset();
        this.f20944x.setRotate(this.f20927e.f61502c);
        this.f20945y.reset();
        this.f20945y.setRotate(-this.f20927e.f61502c);
        f(getWidth(), getHeight(), dVar, true);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
    }

    public final void e() {
        e eVar = this.f20927e;
        eVar.f61500a = Math.round(this.f20935m);
        eVar.f61501b = Math.round(this.n);
    }

    public final void f(int i5, int i11, hb.d dVar, boolean z11) {
        synchronized (this.f20926d) {
            if (z11) {
                try {
                    this.f20927e.f61503d = 1.0f;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (dVar != null) {
                float[] fArrB = b();
                float fMax = Math.max(i5 / fArrB[0], i11 / fArrB[1]);
                this.o = fMax;
                e eVar = this.f20927e;
                eVar.f61503d = Math.max(fMax, z11 ? Float.MIN_VALUE : eVar.f61503d);
            }
        }
    }

    public final void g(e eVar) {
        if (eVar == null || ((hb.d) eVar.f61504e) == null || eVar.f61503d > 0.0f || getWidth() == 0) {
            return;
        }
        eVar.f61503d = Math.min(getWidth() / ((hb.d) eVar.f61504e).f59601b, getHeight() / ((hb.d) eVar.f61504e).f59602c);
    }

    @Override // android.view.View
    public final void invalidate() {
        if (this.f20924b) {
            return;
        }
        this.f20924b = true;
        if (this.f20925c == null) {
            this.f20925c = new d(this, 0);
        }
        Choreographer.getInstance().postFrameCallback(this.f20925c);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        synchronized (this.f20926d) {
            g(this.f20927e);
        }
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public final boolean onScale(ScaleGestureDetector scaleGestureDetector) {
        e eVar = this.f20927e;
        eVar.f61503d = scaleGestureDetector.getScaleFactor() * eVar.f61503d;
        eVar.f61503d = Math.max(this.o, eVar.f61503d);
        invalidate();
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public final boolean onScaleBegin(ScaleGestureDetector scaleGestureDetector) {
        return true;
    }

    @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
    public final void onScaleEnd(ScaleGestureDetector scaleGestureDetector) {
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        f(i5, i11, (hb.d) this.f20927e.f61504e, false);
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x0119 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:47:0x011a  */
    /* JADX WARN: Type inference failed for: r17v3, types: [boolean] */
    /* JADX WARN: Type inference failed for: r17v6 */
    /* JADX WARN: Type inference failed for: r17v7 */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z11;
        ?? r17;
        int actionMasked = motionEvent.getActionMasked();
        boolean z12 = actionMasked == 6;
        int actionIndex = z12 ? motionEvent.getActionIndex() : -1;
        int pointerCount = motionEvent.getPointerCount();
        float x11 = 0.0f;
        float y11 = 0.0f;
        for (int i5 = 0; i5 < pointerCount; i5++) {
            if (actionIndex != i5) {
                x11 += motionEvent.getX(i5);
                y11 += motionEvent.getY(i5);
            }
        }
        if (z12) {
            pointerCount--;
        }
        float f11 = pointerCount;
        float f12 = x11 / f11;
        float f13 = y11 / f11;
        if (actionMasked != 0) {
            if (actionMasked == 1) {
                ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
                float f14 = this.f20931i - f12;
                float f15 = this.f20932j - f13;
                float f16 = (f15 * f15) + (f14 * f14);
                float scaledTouchSlop = viewConfiguration.getScaledTouchSlop() * viewConfiguration.getScaledTouchSlop();
                long jCurrentTimeMillis = System.currentTimeMillis();
                if (this.f20943w != null) {
                    if (f16 < scaledTouchSlop) {
                        boolean z13 = true;
                        z11 = z13;
                        if (jCurrentTimeMillis < this.f20930h + ViewConfiguration.getTapTimeout()) {
                            a aVar = this.f20943w;
                            LauncherWallpaperPickerActivity launcherWallpaperPickerActivity = (LauncherWallpaperPickerActivity) aVar.f19149c;
                            boolean z14 = launcherWallpaperPickerActivity.f20975t;
                            launcherWallpaperPickerActivity.f20975t = false;
                            z11 = z13;
                            if (!z14) {
                                ViewPropertyAnimator viewPropertyAnimator = (ViewPropertyAnimator) aVar.f19148b;
                                if (viewPropertyAnimator != null) {
                                    viewPropertyAnimator.cancel();
                                }
                                launcherWallpaperPickerActivity.f20978w.setVisibility(0);
                                ViewPropertyAnimator viewPropertyAnimatorAnimate = launcherWallpaperPickerActivity.f20978w.animate();
                                aVar.f19148b = viewPropertyAnimatorAnimate;
                                viewPropertyAnimatorAnimate.alpha(1.0f).setDuration(150L).setInterpolator(new DecelerateInterpolator(0.75f));
                                ((ViewPropertyAnimator) aVar.f19148b).start();
                                z11 = z13;
                            }
                        }
                    } else {
                        z11 = true;
                    }
                    ((LauncherWallpaperPickerActivity) this.f20943w.f19149c).f20975t = false;
                    r17 = z11;
                }
            }
            if (this.f20936p) {
                return r17;
            }
            synchronized (this.f20926d) {
                try {
                    this.f20929g.onTouchEvent(motionEvent);
                    if (actionMasked == 2) {
                        float[] fArr = this.f20938r;
                        float f17 = this.f20933k - f12;
                        float f18 = this.f20927e.f61503d;
                        fArr[0] = f17 / f18;
                        fArr[r17] = (this.f20934l - f13) / f18;
                        this.f20945y.mapPoints(fArr);
                        this.f20935m += fArr[0];
                        this.n += fArr[r17];
                        e();
                        invalidate();
                    }
                    if (((hb.d) this.f20927e.f61504e) != null) {
                        RectF rectF = this.f20937q;
                        a(rectF);
                        float f19 = this.f20927e.f61503d;
                        float[] fArr2 = this.f20939s;
                        fArr2[0] = 1.0f;
                        fArr2[r17] = 1.0f;
                        this.f20944x.mapPoints(fArr2);
                        float[] fArr3 = this.f20940t;
                        fArr3[0] = 0.0f;
                        fArr3[r17] = 0.0f;
                        float f21 = rectF.left;
                        if (f21 > 0.0f) {
                            fArr3[0] = f21 / f19;
                        } else if (rectF.right < getWidth()) {
                            fArr3[0] = (rectF.right - getWidth()) / f19;
                        }
                        if (rectF.top > 0.0f) {
                            fArr3[r17] = (float) Math.ceil(r7 / f19);
                        } else if (rectF.bottom < getHeight()) {
                            fArr3[r17] = (rectF.bottom - getHeight()) / f19;
                        }
                        int i11 = 0;
                        for (int i12 = r17; i11 <= i12; i12 = 1) {
                            if (fArr2[i11] > 0.0f) {
                                fArr3[i11] = (float) Math.ceil(fArr3[i11]);
                            }
                            i11++;
                        }
                        this.f20945y.mapPoints(fArr3);
                        this.f20935m += fArr3[0];
                        this.n += fArr3[1];
                        e();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            this.f20933k = f12;
            this.f20934l = f13;
            return true;
        }
        this.f20931i = f12;
        this.f20932j = f13;
        this.f20930h = System.currentTimeMillis();
        a aVar2 = this.f20943w;
        if (aVar2 != null) {
            LauncherWallpaperPickerActivity launcherWallpaperPickerActivity2 = (LauncherWallpaperPickerActivity) aVar2.f19149c;
            ViewPropertyAnimator viewPropertyAnimator2 = (ViewPropertyAnimator) aVar2.f19148b;
            if (viewPropertyAnimator2 != null) {
                viewPropertyAnimator2.cancel();
            }
            if (launcherWallpaperPickerActivity2.f20978w.getAlpha() == 1.0f) {
                launcherWallpaperPickerActivity2.f20975t = true;
            }
            ViewPropertyAnimator viewPropertyAnimatorAnimate2 = launcherWallpaperPickerActivity2.f20978w.animate();
            aVar2.f19148b = viewPropertyAnimatorAnimate2;
            viewPropertyAnimatorAnimate2.alpha(0.0f).setDuration(150L).withEndAction(new g0(aVar2, 4));
            ((ViewPropertyAnimator) aVar2.f19148b).setInterpolator(new AccelerateInterpolator(0.75f));
            ((ViewPropertyAnimator) aVar2.f19148b).start();
        }
        r17 = 1;
        if (this.f20936p) {
        }
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        super.setVisibility(i5);
        this.f20923a.setVisibility(i5);
    }
}
