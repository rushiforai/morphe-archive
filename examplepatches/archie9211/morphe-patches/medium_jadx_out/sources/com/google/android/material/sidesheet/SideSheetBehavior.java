package com.google.android.material.sidesheet;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Property;
import android.util.TypedValue;
import android.view.AbsSavedState;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.medium.reader.R;
import defpackage.ay0;
import defpackage.cue;
import defpackage.da2;
import defpackage.dk7;
import defpackage.dx6;
import defpackage.ev6;
import defpackage.fk7;
import defpackage.ga2;
import defpackage.gk7;
import defpackage.gq7;
import defpackage.ka1;
import defpackage.kng;
import defpackage.l5;
import defpackage.mj7;
import defpackage.o3c;
import defpackage.ow3;
import defpackage.p3c;
import defpackage.rd6;
import defpackage.s9c;
import defpackage.sl0;
import defpackage.t4;
import defpackage.tv0;
import defpackage.u94;
import defpackage.ura;
import defpackage.ute;
import defpackage.v5;
import defpackage.wv0;
import defpackage.x;
import defpackage.yw;
import defpackage.yy;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SideSheetBehavior<V extends View> extends da2 implements mj7 {
    public gq7 a;
    public final dk7 b;
    public final ColorStateList c;
    public final p3c d;
    public final wv0 e;
    public final float f;
    public final boolean g;
    public int h;
    public cue i;
    public boolean j;
    public final float k;
    public int l;
    public int m;
    public int n;
    public int o;
    public WeakReference p;
    public WeakReference q;
    public final int r;
    public VelocityTracker s;
    public gk7 t;
    public int u;
    public final LinkedHashSet v;
    public final tv0 w;

    public SideSheetBehavior(Context context, AttributeSet attributeSet) {
        this.e = new wv0(this);
        this.g = true;
        this.h = 5;
        this.k = 0.1f;
        this.r = -1;
        this.v = new LinkedHashSet();
        this.w = new tv0(this, 1);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ura.p);
        if (typedArrayObtainStyledAttributes.hasValue(3)) {
            this.c = kng.D(context, typedArrayObtainStyledAttributes, 3);
        }
        if (typedArrayObtainStyledAttributes.hasValue(6)) {
            this.d = p3c.e(context, attributeSet, 0, R.style.Widget_Material3_SideSheet).a();
        }
        if (typedArrayObtainStyledAttributes.hasValue(5)) {
            int resourceId = typedArrayObtainStyledAttributes.getResourceId(5, -1);
            this.r = resourceId;
            WeakReference weakReference = this.q;
            if (weakReference != null) {
                weakReference.clear();
            }
            this.q = null;
            WeakReference weakReference2 = this.p;
            if (weakReference2 != null) {
                View view = (View) weakReference2.get();
                if (resourceId != -1 && view.isLaidOut()) {
                    view.requestLayout();
                }
            }
        }
        p3c p3cVar = this.d;
        if (p3cVar != null) {
            dk7 dk7Var = new dk7(p3cVar);
            this.b = dk7Var;
            dk7Var.b.b = new ow3(context);
            dk7Var.q();
            ColorStateList colorStateList = this.c;
            if (colorStateList != null) {
                this.b.l(colorStateList);
            } else {
                TypedValue typedValue = new TypedValue();
                context.getTheme().resolveAttribute(android.R.attr.colorBackground, typedValue, true);
                this.b.setTint(typedValue.data);
            }
        }
        this.f = typedArrayObtainStyledAttributes.getDimension(2, -1.0f);
        this.g = typedArrayObtainStyledAttributes.getBoolean(4, true);
        typedArrayObtainStyledAttributes.recycle();
        ViewConfiguration.get(context).getScaledMaximumFlingVelocity();
    }

    @Override // defpackage.mj7
    public final void a() {
        int i;
        final ViewGroup.MarginLayoutParams marginLayoutParams;
        gk7 gk7Var = this.t;
        if (gk7Var == null) {
            return;
        }
        sl0 sl0Var = gk7Var.f;
        ValueAnimator.AnimatorUpdateListener animatorUpdateListener = null;
        gk7Var.f = null;
        if (sl0Var == null || Build.VERSION.SDK_INT < 34) {
            v(5);
            return;
        }
        gq7 gq7Var = this.a;
        int i2 = (gq7Var == null || gq7Var.A() == 0) ? 5 : 3;
        v5 v5Var = new v5(5, this);
        WeakReference weakReference = this.q;
        final View view = weakReference != null ? (View) weakReference.get() : null;
        if (view != null && (marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams()) != null) {
            final int iP = this.a.p(marginLayoutParams);
            animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener() { // from class: r9c
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    this.a.a.Y(marginLayoutParams, yw.c(valueAnimator.getAnimatedFraction(), iP, 0));
                    view.requestLayout();
                }
            };
        }
        View view2 = gk7Var.b;
        boolean z = sl0Var.d == 0;
        boolean z2 = (Gravity.getAbsoluteGravity(i2, view2.getLayoutDirection()) & 3) == 3;
        float scaleX = view2.getScaleX() * view2.getWidth();
        ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) layoutParams;
            i = z2 ? marginLayoutParams2.leftMargin : marginLayoutParams2.rightMargin;
        } else {
            i = 0;
        }
        float f = scaleX + i;
        Property property = View.TRANSLATION_X;
        if (z2) {
            f = -f;
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view2, (Property<View, Float>) property, f);
        if (animatorUpdateListener != null) {
            objectAnimatorOfFloat.addUpdateListener(animatorUpdateListener);
        }
        objectAnimatorOfFloat.setInterpolator(new u94(1));
        objectAnimatorOfFloat.setDuration(yw.c(sl0Var.c, gk7Var.c, gk7Var.d));
        objectAnimatorOfFloat.addListener(new fk7(gk7Var, z, i2));
        objectAnimatorOfFloat.addListener(v5Var);
        objectAnimatorOfFloat.start();
    }

    @Override // defpackage.mj7
    public final void b(sl0 sl0Var) {
        ViewGroup.MarginLayoutParams marginLayoutParams;
        gk7 gk7Var = this.t;
        if (gk7Var == null) {
            return;
        }
        gq7 gq7Var = this.a;
        int i = (gq7Var == null || gq7Var.A() == 0) ? 5 : 3;
        if (gk7Var.f == null) {
            Log.w("MaterialBackHelper", "Must call startBackProgress() before updateBackProgress()");
        }
        sl0 sl0Var2 = gk7Var.f;
        gk7Var.f = sl0Var;
        if (sl0Var2 != null) {
            gk7Var.a(sl0Var.c, i, sl0Var.d == 0);
        }
        WeakReference weakReference = this.p;
        if (weakReference == null || weakReference.get() == null) {
            return;
        }
        View view = (View) this.p.get();
        WeakReference weakReference2 = this.q;
        View view2 = weakReference2 != null ? (View) weakReference2.get() : null;
        if (view2 == null || (marginLayoutParams = (ViewGroup.MarginLayoutParams) view2.getLayoutParams()) == null) {
            return;
        }
        this.a.Y(marginLayoutParams, (int) ((view.getScaleX() * this.l) + this.o));
        view2.requestLayout();
    }

    @Override // defpackage.mj7
    public final void c(sl0 sl0Var) {
        gk7 gk7Var = this.t;
        if (gk7Var == null) {
            return;
        }
        gk7Var.f = sl0Var;
    }

    @Override // defpackage.mj7
    public final void d() {
        gk7 gk7Var = this.t;
        if (gk7Var == null) {
            return;
        }
        View view = gk7Var.b;
        if (gk7Var.f == null) {
            Log.w("MaterialBackHelper", "Must call startBackProgress() and updateBackProgress() before cancelBackProgress()");
        }
        sl0 sl0Var = gk7Var.f;
        gk7Var.f = null;
        if (sl0Var == null) {
            return;
        }
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(ObjectAnimator.ofFloat(view, (Property<View, Float>) View.SCALE_X, 1.0f), ObjectAnimator.ofFloat(view, (Property<View, Float>) View.SCALE_Y, 1.0f));
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                animatorSet.playTogether(ObjectAnimator.ofFloat(viewGroup.getChildAt(i), (Property<View, Float>) View.SCALE_Y, 1.0f));
            }
        }
        animatorSet.setDuration(gk7Var.e);
        animatorSet.start();
    }

    @Override // defpackage.da2
    public final void g(ga2 ga2Var) {
        this.p = null;
        this.i = null;
        this.t = null;
    }

    @Override // defpackage.da2
    public final void i() {
        this.p = null;
        this.i = null;
        this.t = null;
    }

    @Override // defpackage.da2
    public final boolean j(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        cue cueVar;
        VelocityTracker velocityTracker;
        if ((!view.isShown() && ute.f(view) == null) || !this.g) {
            this.j = true;
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0 && (velocityTracker = this.s) != null) {
            velocityTracker.recycle();
            this.s = null;
        }
        VelocityTracker velocityTrackerObtain = this.s;
        if (velocityTrackerObtain == null) {
            velocityTrackerObtain = VelocityTracker.obtain();
            this.s = velocityTrackerObtain;
        }
        velocityTrackerObtain.addMovement(motionEvent);
        if (actionMasked == 0) {
            this.u = (int) motionEvent.getX();
        } else if ((actionMasked == 1 || actionMasked == 3) && this.j) {
            this.j = false;
            return false;
        }
        return (this.j || (cueVar = this.i) == null || !cueVar.o(motionEvent)) ? false : true;
    }

    @Override // defpackage.da2
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, int i) {
        View view2;
        View view3;
        int iX;
        int i2;
        View viewFindViewById;
        int i3 = 1;
        if (coordinatorLayout.getFitsSystemWindows() && !view.getFitsSystemWindows()) {
            view.setFitsSystemWindows(true);
        }
        WeakReference weakReference = this.p;
        dk7 dk7Var = this.b;
        int i4 = 0;
        if (weakReference == null) {
            this.p = new WeakReference(view);
            this.t = new gk7(view);
            if (dk7Var != null) {
                view.setBackground(dk7Var);
                float elevation = this.f;
                if (elevation == -1.0f) {
                    elevation = view.getElevation();
                }
                dk7Var.k(elevation);
            } else {
                ColorStateList colorStateList = this.c;
                if (colorStateList != null) {
                    WeakHashMap weakHashMap = ute.a;
                    view.setBackgroundTintList(colorStateList);
                }
            }
            int i5 = this.h == 5 ? 4 : 0;
            if (view.getVisibility() != i5) {
                view.setVisibility(i5);
            }
            z();
            if (view.getImportantForAccessibility() == 0) {
                view.setImportantForAccessibility(1);
            }
            if (ute.f(view) == null) {
                ute.p(view, view.getResources().getString(R.string.side_sheet_accessibility_pane_title));
            }
        }
        int i6 = Gravity.getAbsoluteGravity(((ga2) view.getLayoutParams()).c, i) == 3 ? 1 : 0;
        gq7 gq7Var = this.a;
        if (gq7Var == null || gq7Var.A() != i6) {
            ga2 ga2Var = null;
            p3c p3cVar = this.d;
            if (i6 == 0) {
                this.a = new dx6(this, i3);
                if (p3cVar != null) {
                    WeakReference weakReference2 = this.p;
                    if (weakReference2 != null && (view3 = (View) weakReference2.get()) != null && (view3.getLayoutParams() instanceof ga2)) {
                        ga2Var = (ga2) view3.getLayoutParams();
                    }
                    if (ga2Var == null || ((ViewGroup.MarginLayoutParams) ga2Var).rightMargin <= 0) {
                        o3c o3cVarI = p3cVar.i();
                        o3cVarI.f = new x(0.0f);
                        o3cVarI.g = new x(0.0f);
                        p3c p3cVarA = o3cVarI.a();
                        if (dk7Var != null) {
                            dk7Var.setShapeAppearanceModel(p3cVarA);
                        }
                    }
                }
            } else {
                if (i6 != 1) {
                    ay0.e(ev6.w("Invalid sheet edge position value: ", i6, ". Must be 0 or 1."));
                    return false;
                }
                this.a = new dx6(this, i4);
                if (p3cVar != null) {
                    WeakReference weakReference3 = this.p;
                    if (weakReference3 != null && (view2 = (View) weakReference3.get()) != null && (view2.getLayoutParams() instanceof ga2)) {
                        ga2Var = (ga2) view2.getLayoutParams();
                    }
                    if (ga2Var == null || ((ViewGroup.MarginLayoutParams) ga2Var).leftMargin <= 0) {
                        o3c o3cVarI2 = p3cVar.i();
                        o3cVarI2.e = new x(0.0f);
                        o3cVarI2.h = new x(0.0f);
                        p3c p3cVarA2 = o3cVarI2.a();
                        if (dk7Var != null) {
                            dk7Var.setShapeAppearanceModel(p3cVarA2);
                        }
                    }
                }
            }
        }
        if (this.i == null) {
            this.i = new cue(coordinatorLayout.getContext(), coordinatorLayout, this.w);
        }
        int iX2 = this.a.x(view);
        coordinatorLayout.j(view, i);
        this.m = coordinatorLayout.getWidth();
        this.n = this.a.y(coordinatorLayout);
        this.l = view.getWidth();
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        this.o = marginLayoutParams != null ? this.a.j(marginLayoutParams) : 0;
        int i7 = this.h;
        if (i7 == 1 || i7 == 2) {
            iX = iX2 - this.a.x(view);
        } else if (i7 == 3) {
            iX = 0;
        } else {
            if (i7 != 5) {
                throw new IllegalStateException("Unexpected value: " + this.h);
            }
            iX = this.a.t();
        }
        WeakHashMap weakHashMap2 = ute.a;
        view.offsetLeftAndRight(iX);
        if (this.q == null && (i2 = this.r) != -1 && (viewFindViewById = coordinatorLayout.findViewById(i2)) != null) {
            this.q = new WeakReference(viewFindViewById);
        }
        Iterator it2 = this.v.iterator();
        while (it2.hasNext()) {
            if (it2.next() != null) {
                rd6.m();
                return false;
            }
        }
        return true;
    }

    @Override // defpackage.da2
    public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        view.measure(ViewGroup.getChildMeasureSpec(i, coordinatorLayout.getPaddingRight() + coordinatorLayout.getPaddingLeft() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i2, marginLayoutParams.width), ViewGroup.getChildMeasureSpec(i3, coordinatorLayout.getPaddingBottom() + coordinatorLayout.getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin, marginLayoutParams.height));
        return true;
    }

    @Override // defpackage.da2
    public final void q(View view, Parcelable parcelable) {
        int i = ((s9c) parcelable).c;
        if (i == 1 || i == 2) {
            i = 5;
        }
        this.h = i;
    }

    @Override // defpackage.da2
    public final Parcelable r(View view) {
        AbsSavedState absSavedState = View.BaseSavedState.EMPTY_STATE;
        return new s9c(this);
    }

    @Override // defpackage.da2
    public final boolean u(View view, MotionEvent motionEvent) {
        VelocityTracker velocityTracker;
        if (!view.isShown()) {
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        if (this.h == 1 && actionMasked == 0) {
            return true;
        }
        if (x()) {
            this.i.i(motionEvent);
        }
        if (actionMasked == 0 && (velocityTracker = this.s) != null) {
            velocityTracker.recycle();
            this.s = null;
        }
        VelocityTracker velocityTrackerObtain = this.s;
        if (velocityTrackerObtain == null) {
            velocityTrackerObtain = VelocityTracker.obtain();
            this.s = velocityTrackerObtain;
        }
        velocityTrackerObtain.addMovement(motionEvent);
        if (x() && actionMasked == 2 && !this.j && x()) {
            float fAbs = Math.abs(this.u - motionEvent.getX());
            cue cueVar = this.i;
            if (fAbs > cueVar.b) {
                cueVar.b(view, motionEvent.getPointerId(motionEvent.getActionIndex()));
            }
        }
        return !this.j;
    }

    public final void v(int i) {
        if (i == 1 || i == 2) {
            throw new IllegalArgumentException(ka1.v(new StringBuilder("STATE_"), i == 1 ? "DRAGGING" : "SETTLING", " should not be set externally."));
        }
        WeakReference weakReference = this.p;
        if (weakReference == null || weakReference.get() == null) {
            w(i);
            return;
        }
        View view = (View) this.p.get();
        yy yyVar = new yy(i, 4, this);
        ViewParent parent = view.getParent();
        if (parent != null && parent.isLayoutRequested() && view.isAttachedToWindow()) {
            view.post(yyVar);
        } else {
            yyVar.run();
        }
    }

    public final void w(int i) {
        View view;
        if (this.h == i) {
            return;
        }
        this.h = i;
        WeakReference weakReference = this.p;
        if (weakReference == null || (view = (View) weakReference.get()) == null) {
            return;
        }
        int i2 = this.h == 5 ? 4 : 0;
        if (view.getVisibility() != i2) {
            view.setVisibility(i2);
        }
        Iterator it2 = this.v.iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
        z();
    }

    public final boolean x() {
        if (this.i != null) {
            return this.g || this.h == 1;
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x002b, code lost:
    
        if (r1.n(r0, r3.getTop()) != false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x0049, code lost:
    
        if (r3 != false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x004b, code lost:
    
        w(2);
        r2.e.c(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0054, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void y(android.view.View r3, int r4, boolean r5) {
        /*
            r2 = this;
            r0 = 3
            if (r4 == r0) goto L17
            r0 = 5
            if (r4 != r0) goto Ld
            gq7 r0 = r2.a
            int r0 = r0.t()
            goto L1d
        Ld:
            java.lang.String r2 = "Invalid state to get outer edge offset: "
            java.lang.String r2 = defpackage.b09.w(r4, r2)
            defpackage.ay0.e(r2)
            return
        L17:
            gq7 r0 = r2.a
            int r0 = r0.q()
        L1d:
            cue r1 = r2.i
            if (r1 == 0) goto L55
            if (r5 == 0) goto L2e
            int r3 = r3.getTop()
            boolean r3 = r1.n(r0, r3)
            if (r3 == 0) goto L55
            goto L4b
        L2e:
            int r5 = r3.getTop()
            r1.r = r3
            r3 = -1
            r1.c = r3
            r3 = 0
            boolean r3 = r1.h(r0, r5, r3, r3)
            if (r3 != 0) goto L49
            int r5 = r1.a
            if (r5 != 0) goto L49
            android.view.View r5 = r1.r
            if (r5 == 0) goto L49
            r5 = 0
            r1.r = r5
        L49:
            if (r3 == 0) goto L55
        L4b:
            r3 = 2
            r2.w(r3)
            wv0 r2 = r2.e
            r2.c(r4)
            return
        L55:
            r2.w(r4)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.sidesheet.SideSheetBehavior.y(android.view.View, int, boolean):void");
    }

    public final void z() {
        View view;
        WeakReference weakReference = this.p;
        if (weakReference == null || (view = (View) weakReference.get()) == null) {
            return;
        }
        ute.l(view, 262144);
        ute.i(view, 0);
        ute.l(view, 1048576);
        ute.i(view, 0);
        final int i = 5;
        if (this.h != 5) {
            ute.m(view, t4.j, new l5() { // from class: q9c
                @Override // defpackage.l5
                public final boolean d(View view2) {
                    this.a.v(i);
                    return true;
                }
            });
        }
        final int i2 = 3;
        if (this.h != 3) {
            ute.m(view, t4.i, new l5() { // from class: q9c
                @Override // defpackage.l5
                public final boolean d(View view2) {
                    this.a.v(i2);
                    return true;
                }
            });
        }
    }

    public SideSheetBehavior() {
        this.e = new wv0(this);
        this.g = true;
        this.h = 5;
        this.k = 0.1f;
        this.r = -1;
        this.v = new LinkedHashSet();
        this.w = new tv0(this, 1);
    }
}
