package jz;

import aa.p;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PointF;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import com.teslacoilsw.launcher.NovaLauncher;
import kl.q0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import o9.g3;
import o9.n1;
import o9.r0;

/* loaded from: classes4.dex */
public abstract class c extends o9.a implements ua.h, r0 {

    /* renamed from: u, reason: collision with root package name */
    public static final b f70509u = new b(0, Float.TYPE, "translationShift");

    /* renamed from: c, reason: collision with root package name */
    public final NovaLauncher f70510c;

    /* renamed from: d, reason: collision with root package name */
    public final ObjectAnimator f70511d;

    /* renamed from: e, reason: collision with root package name */
    public final View f70512e;

    /* renamed from: f, reason: collision with root package name */
    public ViewGroup f70513f;

    /* renamed from: g, reason: collision with root package name */
    public float f70514g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f70515h;

    /* renamed from: i, reason: collision with root package name */
    public final ua.i f70516i;

    /* renamed from: j, reason: collision with root package name */
    public Interpolator f70517j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f70518k;

    /* renamed from: l, reason: collision with root package name */
    public final boolean f70519l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f70520m;
    public int n;
    public final Rect o;

    /* renamed from: p, reason: collision with root package name */
    public final PointF f70521p;

    /* renamed from: q, reason: collision with root package name */
    public final int f70522q;

    /* renamed from: r, reason: collision with root package name */
    public final Paint f70523r;

    /* renamed from: s, reason: collision with root package name */
    public final int f70524s;

    /* renamed from: t, reason: collision with root package name */
    public final boolean f70525t;

    public c(Context context, AttributeSet attributeSet) {
        View view;
        super(context, attributeSet, 0);
        this.f70514g = 1.0f;
        this.f70519l = true;
        this.f70520m = true;
        this.o = new Rect();
        this.f70521p = new PointF();
        this.f70522q = ViewConfiguration.get(context).getScaledTouchSlop();
        Paint paint = new Paint();
        paint.setColor(p.b(context, 2130968659));
        this.f70523r = paint;
        this.f70524s = (paint.getColor() >> 24) & 255;
        this.f70525t = true;
        q0 q0Var = n1.C0;
        NovaLauncher novaLauncher = (NovaLauncher) o9.k.Y(context);
        this.f70510c = novaLauncher;
        this.f70517j = s9.k.f86806u;
        this.f70516i = new ua.i(context, this, ua.i.f90766w);
        ObjectAnimator objectAnimatorOfPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(this, new PropertyValuesHolder[0]);
        this.f70511d = objectAnimatorOfPropertyValuesHolder;
        objectAnimatorOfPropertyValuesHolder.addListener(new a(this, 0));
        int iY = Y(novaLauncher);
        if (iY != -1) {
            b bVar = za.c.f98408l;
            view = new View(novaLauncher);
            view.forceHasOverlappingRendering(false);
            view.setBackgroundColor(iY);
            za.h hVar = new za.h(-1, -1);
            hVar.f80099a = true;
            view.setLayoutParams(hVar);
        } else {
            view = null;
        }
        this.f70512e = view;
        if (view != null) {
            view.setElevation(getElevation());
        }
    }

    @Override // o9.a
    public boolean S() {
        if (!Z() || this.f70518k) {
            K(true);
            return true;
        }
        e0(true);
        return true;
    }

    public final void U() {
        NovaLauncher novaLauncher = this.f70510c;
        View view = this.f70512e;
        if (view != null) {
            novaLauncher.P.addView(view);
        }
        novaLauncher.P.addView(this);
    }

    public boolean V() {
        return this.f70525t;
    }

    public boolean W() {
        return this.f70519l;
    }

    public boolean X() {
        return this.f70520m;
    }

    public abstract int Y(Context context);

    public final boolean Z() {
        return this.n > 0;
    }

    public final float a0() {
        float f11 = this.o.bottom + this.n;
        Intrinsics.d(this.f70513f);
        return 1.0f - (f11 / r1.getMeasuredHeight());
    }

    public final void b0(long j11, boolean z11) {
        if (this.f79742a) {
            ua.i iVar = this.f70516i;
            ObjectAnimator objectAnimator = this.f70511d;
            if (!z11) {
                objectAnimator.cancel();
                iVar.h(1);
                f0(1.0f);
                c0();
                I();
                return;
            }
            objectAnimator.setValues(PropertyValuesHolder.ofFloat(f70509u, 1.0f));
            objectAnimator.addListener(new a(this, 1));
            if (iVar.f()) {
                objectAnimator.setDuration(j11).setInterpolator(s9.k.f86789b);
            } else {
                objectAnimator.setInterpolator(this.f70517j);
            }
            objectAnimator.start();
        }
    }

    public abstract void c0();

    @Override // ua.h
    public final void d(float f11, float f12) {
        boolean zE = this.f70516i.e(f11, f12);
        boolean z11 = this.f70518k;
        b bVar = f70509u;
        ObjectAnimator objectAnimator = this.f70511d;
        if (!z11) {
            if ((!zE || f11 <= 0.0f) && this.f70514g <= 0.5f) {
                objectAnimator.setValues(PropertyValuesHolder.ofFloat(bVar, 0.0f));
                objectAnimator.setDuration(ua.c.a(f11, this.f70514g)).setInterpolator(s9.k.f86792e);
                objectAnimator.start();
                return;
            }
            this.f70517j = s9.k.b(f11);
            objectAnimator.setDuration(ua.c.a(f11, 1.0f - this.f70514g));
            boolean zA = g3.a();
            if (Z()) {
                e0(zA);
                return;
            } else {
                K(zA);
                return;
            }
        }
        if ((zE && f11 < 0.0f) || this.f70514g < 0.5f) {
            objectAnimator.setValues(PropertyValuesHolder.ofFloat(bVar, 0.0f));
            objectAnimator.setDuration(ua.c.a(f11, this.f70514g)).setInterpolator(s9.k.f86792e);
            objectAnimator.start();
        } else {
            if (zE && f11 > 0.0f) {
                this.f70517j = s9.k.b(f11);
                objectAnimator.setDuration(ua.c.a(f11, 1.0f - this.f70514g));
                K(g3.a());
                return;
            }
            this.f70517j = s9.k.b(f11);
            objectAnimator.setDuration(ua.c.a(f11, 1.0f - this.f70514g));
            boolean zA2 = g3.a();
            if (Z()) {
                e0(zA2);
            } else {
                K(zA2);
            }
        }
    }

    public void d0() {
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (X()) {
            Rect rect = this.o;
            if (rect.bottom > bh.g.M(getContext(), 24)) {
                canvas.drawRect(this.f70513f != null ? r1.getLeft() : 0.0f, getHeight() - rect.bottom, this.f70513f != null ? r0.getRight() : getWidth(), getHeight(), this.f70523r);
            }
        }
    }

    public final void e0(boolean z11) {
        if (this.f79742a) {
            ua.i iVar = this.f70516i;
            ObjectAnimator objectAnimator = this.f70511d;
            if (!z11) {
                objectAnimator.cancel();
                iVar.c();
                f0(a0());
                this.f70518k = true;
                I();
                return;
            }
            objectAnimator.setValues(PropertyValuesHolder.ofFloat(f70509u, a0()));
            objectAnimator.addListener(new a(this, 2));
            if (iVar.f()) {
                objectAnimator.setDuration(200L).setInterpolator(s9.k.f86798k);
            } else {
                objectAnimator.setInterpolator(this.f70517j);
            }
            objectAnimator.start();
        }
    }

    public void f0(float f11) {
        this.f70514g = f11;
        ViewGroup viewGroup = this.f70513f;
        Intrinsics.d(viewGroup);
        float f12 = this.f70514g;
        Intrinsics.d(this.f70513f);
        viewGroup.setTranslationY(f12 * r2.getHeight());
        if (f11 == 0.0f) {
            this.f70518k = false;
        }
        if (Z()) {
            ViewGroup viewGroup2 = this.f70513f;
            Intrinsics.d(viewGroup2);
            if (viewGroup2.getHeight() > 0) {
                ViewGroup viewGroup3 = this.f70513f;
                Intrinsics.d(viewGroup3);
                float translationY = viewGroup3.getTranslationY();
                if (!Float.isInfinite(translationY) && !Float.isNaN(translationY)) {
                    ViewGroup viewGroup4 = this.f70513f;
                    Intrinsics.d(viewGroup4);
                    int height = viewGroup4.getHeight();
                    Rect rect = this.o;
                    int i5 = height - rect.bottom;
                    ViewGroup viewGroup5 = this.f70513f;
                    Intrinsics.d(viewGroup5);
                    int height2 = (viewGroup5.getHeight() - this.n) - rect.bottom;
                    ViewGroup viewGroup6 = this.f70513f;
                    Intrinsics.d(viewGroup6);
                    int iB = MathKt.b(kotlin.ranges.a.d0(1.0f - ((viewGroup6.getTranslationY() - height2) / (i5 - height2)), 0.0f, 1.0f) * this.f70524s);
                    Paint paint = this.f70523r;
                    if (iB != ((paint.getColor() >> 24) & 255)) {
                        paint.setColor(r4.a.n(paint.getColor(), iB));
                        invalidate();
                    }
                }
            }
        }
        View view = this.f70512e;
        if (view != null) {
            if (Z()) {
                view.setAlpha(1 - (this.f70514g / a0()));
            } else {
                view.setAlpha(1 - this.f70514g);
            }
        }
    }

    @Override // ua.h
    public final boolean g(float f11) {
        ViewGroup viewGroup = this.f70513f;
        Intrinsics.d(viewGroup);
        float height = viewGroup.getHeight();
        if (!this.f70518k) {
            f0(kotlin.ranges.a.d0(f11, 0.0f, height) / height);
            return true;
        }
        f0(kotlin.ranges.a.d0((f11 / height) + a0(), 0.0f, 1.0f));
        return true;
    }

    @Override // o9.a, ya.k0
    public final boolean k(MotionEvent motionEvent) {
        ua.i iVar = this.f70516i;
        iVar.g(motionEvent);
        if (motionEvent.getAction() == 1 && iVar.f() && ((!this.f79742a || !this.f70511d.isRunning()) && V() && !this.f70510c.P.m(this.f70513f, motionEvent))) {
            K(true);
        }
        return true;
    }

    public boolean l(MotionEvent motionEvent) {
        if (!this.f70515h) {
            ua.i iVar = this.f70516i;
            iVar.f90770u = iVar.f() ? (Z() && this.f70518k) ? 3 : 2 : 0;
            iVar.o = false;
            iVar.g(motionEvent);
            if (iVar.d()) {
                return true;
            }
            if (V() && !this.f70510c.P.m(this.f70513f, motionEvent)) {
                return true;
            }
        }
        return false;
    }

    public void m(float f11, boolean z11) {
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (this.f70518k && W()) {
            return true;
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    @Override // o9.a, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        NovaLauncher novaLauncher = this.f70510c;
        if (!novaLauncher.P.m(this.f70513f, motionEvent)) {
            int action = motionEvent.getAction();
            PointF pointF = this.f70521p;
            if (action == 0) {
                pointF.set(motionEvent.getX(), motionEvent.getY());
            } else if (motionEvent.getAction() == 1 && !novaLauncher.P.m(this.f70513f, motionEvent) && ((float) Math.hypot(motionEvent.getX() - pointF.x, motionEvent.getY() - pointF.y)) < this.f70522q) {
                d0();
            }
            return !this.f70518k;
        }
        if (motionEvent.getAction() == 1 && g3.a() && this.f70518k) {
            ObjectAnimator objectAnimatorOfPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(this, new PropertyValuesHolder[0]);
            Intrinsics.d(this.f70513f);
            objectAnimatorOfPropertyValuesHolder.setValues(PropertyValuesHolder.ofFloat(f70509u, a0(), 1.0f - (((this.o.bottom + this.n) + bh.g.M(getContext(), 32)) / r4.getMeasuredHeight())));
            objectAnimatorOfPropertyValuesHolder.setDuration(100L);
            objectAnimatorOfPropertyValuesHolder.setInterpolator(s9.k.f86792e);
            objectAnimatorOfPropertyValuesHolder.setRepeatMode(2);
            objectAnimatorOfPropertyValuesHolder.setRepeatCount(1);
            objectAnimatorOfPropertyValuesHolder.start();
        }
        return true;
    }
}
