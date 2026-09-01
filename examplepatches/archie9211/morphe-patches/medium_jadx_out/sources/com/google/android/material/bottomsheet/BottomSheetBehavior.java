package com.google.android.material.bottomsheet;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.os.Build;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Property;
import android.util.SparseIntArray;
import android.util.TypedValue;
import android.view.AbsSavedState;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityNodeInfo;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.medium.reader.R;
import defpackage.a1a;
import defpackage.ad;
import defpackage.awe;
import defpackage.ay0;
import defpackage.b09;
import defpackage.bk7;
import defpackage.c36;
import defpackage.cue;
import defpackage.da2;
import defpackage.dk7;
import defpackage.f4f;
import defpackage.ga2;
import defpackage.i30;
import defpackage.k4;
import defpackage.ka1;
import defpackage.kng;
import defpackage.l4;
import defpackage.mj7;
import defpackage.mte;
import defpackage.nte;
import defpackage.ow3;
import defpackage.p3c;
import defpackage.qj7;
import defpackage.rv0;
import defpackage.sl0;
import defpackage.sv0;
import defpackage.t4;
import defpackage.tv0;
import defpackage.u94;
import defpackage.ura;
import defpackage.ute;
import defpackage.uv0;
import defpackage.v5;
import defpackage.vv0;
import defpackage.wv0;
import defpackage.yve;
import defpackage.yw;
import defpackage.z4f;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class BottomSheetBehavior<V extends View> extends da2 implements mj7 {
    public boolean A;
    public final wv0 B;
    public final ValueAnimator C;
    public final int D;
    public int E;
    public int F;
    public final float G;
    public int H;
    public final float I;
    public boolean J;
    public boolean K;
    public boolean L;
    public final boolean M;
    public boolean N;
    public final boolean O;
    public int P;
    public cue Q;
    public boolean R;
    public int S;
    public boolean T;
    public final float U;
    public int V;
    public int W;
    public int X;
    public WeakReference Y;
    public final ArrayList Z;
    public final int a;
    public final ArrayList a0;
    public boolean b;
    public VelocityTracker b0;
    public final float c;
    public qj7 c0;
    public final int d;
    public int d0;
    public final boolean e;
    public int e0;
    public int f;
    public WeakReference f0;
    public boolean g;
    public boolean g0;
    public int h;
    public HashMap h0;
    public final int i;
    public final SparseIntArray i0;
    public final dk7 j;
    public final SparseIntArray j0;
    public final ColorStateList k;
    public final SparseIntArray k0;
    public int l;
    public final Rect l0;
    public final int m;
    public final tv0 m0;
    public int n;
    public final boolean o;
    public final boolean p;
    public final boolean q;
    public final boolean r;
    public final boolean s;
    public final boolean t;
    public final boolean u;
    public final boolean v;
    public int w;
    public int x;
    public final boolean y;
    public final p3c z;

    public BottomSheetBehavior(Context context, AttributeSet attributeSet) {
        int i;
        int i2 = 0;
        this.a = 0;
        this.b = true;
        this.l = -1;
        this.m = -1;
        this.B = new wv0(this);
        this.G = 0.5f;
        this.I = -1.0f;
        this.L = true;
        this.M = true;
        this.O = true;
        this.P = 4;
        this.U = 0.1f;
        this.Z = new ArrayList();
        this.a0 = new ArrayList();
        this.e0 = -1;
        this.i0 = new SparseIntArray();
        this.j0 = new SparseIntArray();
        this.k0 = new SparseIntArray();
        this.l0 = new Rect();
        this.m0 = new tv0(this, i2);
        this.i = context.getResources().getDimensionPixelSize(R.dimen.mtrl_min_touch_target_size);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ura.a);
        if (typedArrayObtainStyledAttributes.hasValue(3)) {
            this.k = kng.D(context, typedArrayObtainStyledAttributes, 3);
        }
        if (typedArrayObtainStyledAttributes.hasValue(24)) {
            this.z = p3c.e(context, attributeSet, R.attr.bottomSheetStyle, R.style.Widget_Design_BottomSheet_Modal).a();
        }
        p3c p3cVar = this.z;
        if (p3cVar != null) {
            dk7 dk7Var = new dk7(p3cVar);
            this.j = dk7Var;
            dk7Var.b.b = new ow3(context);
            dk7Var.q();
            ColorStateList colorStateList = this.k;
            if (colorStateList != null) {
                this.j.l(colorStateList);
            } else {
                TypedValue typedValue = new TypedValue();
                context.getTheme().resolveAttribute(android.R.attr.colorBackground, typedValue, true);
                this.j.setTint(typedValue.data);
            }
        }
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(x(), 1.0f);
        this.C = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(500L);
        this.C.addUpdateListener(new rv0(i2, this));
        this.I = typedArrayObtainStyledAttributes.getDimension(2, -1.0f);
        if (typedArrayObtainStyledAttributes.hasValue(0)) {
            this.l = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, -1);
        }
        if (typedArrayObtainStyledAttributes.hasValue(1)) {
            this.m = typedArrayObtainStyledAttributes.getDimensionPixelSize(1, -1);
        }
        TypedValue typedValuePeekValue = typedArrayObtainStyledAttributes.peekValue(12);
        if (typedValuePeekValue == null || (i = typedValuePeekValue.data) != -1) {
            K(typedArrayObtainStyledAttributes.getDimensionPixelSize(12, -1));
        } else {
            K(i);
        }
        J(typedArrayObtainStyledAttributes.getBoolean(10, false));
        this.o = typedArrayObtainStyledAttributes.getBoolean(16, false);
        I(typedArrayObtainStyledAttributes.getBoolean(8, true));
        this.K = typedArrayObtainStyledAttributes.getBoolean(15, false);
        this.L = typedArrayObtainStyledAttributes.getBoolean(5, true);
        this.M = typedArrayObtainStyledAttributes.getBoolean(6, true);
        this.a = typedArrayObtainStyledAttributes.getInt(13, 0);
        float f = typedArrayObtainStyledAttributes.getFloat(9, 0.5f);
        if (f <= 0.0f || f >= 1.0f) {
            ay0.e("ratio must be a float value between 0 and 1");
            throw null;
        }
        this.G = f;
        if (this.Y != null) {
            this.F = (int) ((1.0f - f) * this.X);
        }
        TypedValue typedValuePeekValue2 = typedArrayObtainStyledAttributes.peekValue(7);
        if (typedValuePeekValue2 == null || typedValuePeekValue2.type != 16) {
            int dimensionPixelOffset = typedArrayObtainStyledAttributes.getDimensionPixelOffset(7, 0);
            if (dimensionPixelOffset < 0) {
                ay0.e("offset must be greater than or equal to 0");
                throw null;
            }
            this.D = dimensionPixelOffset;
            Q(this.P, true);
        } else {
            int i3 = typedValuePeekValue2.data;
            if (i3 < 0) {
                ay0.e("offset must be greater than or equal to 0");
                throw null;
            }
            this.D = i3;
            Q(this.P, true);
        }
        this.d = typedArrayObtainStyledAttributes.getInt(14, 500);
        this.e = typedArrayObtainStyledAttributes.getBoolean(11, false);
        this.O = typedArrayObtainStyledAttributes.getBoolean(4, true);
        this.p = typedArrayObtainStyledAttributes.getBoolean(20, false);
        this.q = typedArrayObtainStyledAttributes.getBoolean(21, false);
        this.r = typedArrayObtainStyledAttributes.getBoolean(22, false);
        this.s = typedArrayObtainStyledAttributes.getBoolean(23, true);
        this.t = typedArrayObtainStyledAttributes.getBoolean(17, false);
        this.u = typedArrayObtainStyledAttributes.getBoolean(18, false);
        this.v = typedArrayObtainStyledAttributes.getBoolean(19, false);
        this.y = typedArrayObtainStyledAttributes.getBoolean(26, true);
        typedArrayObtainStyledAttributes.recycle();
        this.c = ViewConfiguration.get(context).getScaledMaximumFlingVelocity();
    }

    public static View A(View view) {
        if (view.getVisibility() != 0) {
            return null;
        }
        if (view.isNestedScrollingEnabled()) {
            return view;
        }
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View viewA = A(viewGroup.getChildAt(i));
            if (viewA != null) {
                return viewA;
            }
        }
        return null;
    }

    public static BottomSheetBehavior B(View view) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (!(layoutParams instanceof ga2)) {
            ay0.e("The view is not a child of CoordinatorLayout");
            return null;
        }
        da2 da2Var = ((ga2) layoutParams).a;
        if (da2Var instanceof BottomSheetBehavior) {
            return (BottomSheetBehavior) da2Var;
        }
        ay0.e("The view is not associated with BottomSheetBehavior");
        return null;
    }

    public static int C(int i, int i2, int i3, int i4) {
        int childMeasureSpec = ViewGroup.getChildMeasureSpec(i, i2, i4);
        if (i3 == -1) {
            return childMeasureSpec;
        }
        int mode = View.MeasureSpec.getMode(childMeasureSpec);
        int size = View.MeasureSpec.getSize(childMeasureSpec);
        if (mode == 1073741824) {
            return View.MeasureSpec.makeMeasureSpec(Math.min(size, i3), 1073741824);
        }
        if (size != 0) {
            i3 = Math.min(size, i3);
        }
        return View.MeasureSpec.makeMeasureSpec(i3, Integer.MIN_VALUE);
    }

    public final int D() {
        if (this.b) {
            return this.E;
        }
        return Math.max(this.D, this.s ? 0 : this.x);
    }

    public final int E(int i) {
        if (i == 3) {
            return D();
        }
        if (i == 4) {
            return this.H;
        }
        if (i == 5) {
            return this.X;
        }
        if (i == 6) {
            return this.F;
        }
        ay0.e(b09.w(i, "Invalid state to get top offset: "));
        return 0;
    }

    public final boolean F() {
        WeakReference weakReference = this.Y;
        if (weakReference != null && weakReference.get() != null) {
            int[] iArr = new int[2];
            ((View) this.Y.get()).getLocationOnScreen(iArr);
            if (iArr[1] == 0) {
                return true;
            }
        }
        return false;
    }

    public final boolean G(View view) {
        Iterator it2 = this.Z.iterator();
        while (it2.hasNext()) {
            if (((WeakReference) it2.next()).get() == view) {
                return true;
            }
        }
        return false;
    }

    public final void H(View view) {
        if (view.getVisibility() != 0) {
            return;
        }
        if (view.isNestedScrollingEnabled()) {
            this.Z.add(new WeakReference(view));
        } else if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i = 0; i < viewGroup.getChildCount(); i++) {
                H(viewGroup.getChildAt(i));
            }
        }
    }

    public final void I(boolean z) {
        if (this.b == z) {
            return;
        }
        this.b = z;
        if (this.Y != null) {
            w();
        }
        M((this.b && this.P == 6) ? 3 : this.P);
        Q(this.P, true);
        P();
    }

    public final void J(boolean z) {
        if (this.J != z) {
            this.J = z;
            if (!z && this.P == 5) {
                L(4);
            }
            P();
        }
    }

    public final void K(int i) {
        boolean z = this.g;
        if (i == -1) {
            if (z) {
                return;
            } else {
                this.g = true;
            }
        } else {
            if (!z && this.f == i) {
                return;
            }
            this.g = false;
            this.f = Math.max(0, i);
        }
        S();
    }

    public final void L(int i) {
        if (i == 1 || i == 2) {
            throw new IllegalArgumentException(ka1.v(new StringBuilder("STATE_"), i == 1 ? "DRAGGING" : "SETTLING", " should not be set externally."));
        }
        if (!this.J && i == 5) {
            Log.w("BottomSheetBehavior", "Cannot set state: " + i);
            return;
        }
        int i2 = (i == 6 && this.b && E(i) <= this.E) ? 3 : i;
        WeakReference weakReference = this.Y;
        if (weakReference == null || weakReference.get() == null) {
            M(i);
            return;
        }
        View view = (View) this.Y.get();
        i30 i30Var = new i30(this, view, i2);
        ViewParent parent = view.getParent();
        if (parent != null && parent.isLayoutRequested() && view.isAttachedToWindow()) {
            view.post(i30Var);
        } else {
            i30Var.run();
        }
    }

    public final void M(int i) {
        View view;
        if (this.P == i) {
            return;
        }
        this.P = i;
        if (i != 4 && i != 3 && i != 6) {
            boolean z = this.J;
        }
        WeakReference weakReference = this.Y;
        if (weakReference == null || (view = (View) weakReference.get()) == null) {
            return;
        }
        int i2 = 0;
        if (i == 3) {
            R(true);
        } else if (i == 6 || i == 5 || i == 4) {
            R(false);
        }
        Q(i, true);
        while (true) {
            ArrayList arrayList = this.a0;
            if (i2 >= arrayList.size()) {
                P();
                return;
            } else {
                ((uv0) arrayList.get(i2)).c(view, i);
                i2++;
            }
        }
    }

    public final boolean N(View view, float f) {
        if (this.K) {
            return true;
        }
        if (view.getTop() < this.H) {
            return false;
        }
        return Math.abs(((f * this.U) + ((float) view.getTop())) - ((float) this.H)) / ((float) y()) > 0.5f;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0030, code lost:
    
        if (r3 != false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0032, code lost:
    
        M(2);
        Q(r4, true);
        r2.B.c(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x003f, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x0012, code lost:
    
        if (r1.n(r3.getLeft(), r0) != false) goto L16;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void O(android.view.View r3, int r4, boolean r5) {
        /*
            r2 = this;
            int r0 = r2.E(r4)
            cue r1 = r2.Q
            if (r1 == 0) goto L40
            if (r5 == 0) goto L15
            int r3 = r3.getLeft()
            boolean r3 = r1.n(r3, r0)
            if (r3 == 0) goto L40
            goto L32
        L15:
            int r5 = r3.getLeft()
            r1.r = r3
            r3 = -1
            r1.c = r3
            r3 = 0
            boolean r3 = r1.h(r5, r0, r3, r3)
            if (r3 != 0) goto L30
            int r5 = r1.a
            if (r5 != 0) goto L30
            android.view.View r5 = r1.r
            if (r5 == 0) goto L30
            r5 = 0
            r1.r = r5
        L30:
            if (r3 == 0) goto L40
        L32:
            r3 = 2
            r2.M(r3)
            r3 = 1
            r2.Q(r4, r3)
            wv0 r2 = r2.B
            r2.c(r4)
            return
        L40:
            r2.M(r4)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.bottomsheet.BottomSheetBehavior.O(android.view.View, int, boolean):void");
    }

    public final void P() {
        View view;
        WeakReference weakReference = this.Y;
        if (weakReference == null || (view = (View) weakReference.get()) == null) {
            return;
        }
        ute.l(view, 1048576);
        ute.i(view, 0);
        ute.l(view, 524288);
        ute.i(view, 0);
        ute.l(view, 262144);
        ute.i(view, 0);
        SparseIntArray sparseIntArray = this.j0;
        int i = sparseIntArray.get(0, -1);
        if (i != -1) {
            ute.l(view, i);
            ute.i(view, 0);
            sparseIntArray.delete(0);
        }
        SparseIntArray sparseIntArray2 = this.i0;
        int i2 = sparseIntArray2.get(0, -1);
        if (i2 != -1) {
            ute.l(view, i2);
            ute.i(view, 0);
            sparseIntArray2.delete(0);
        }
        SparseIntArray sparseIntArray3 = this.k0;
        int i3 = sparseIntArray3.get(0, -1);
        if (i3 != -1) {
            ute.l(view, i3);
            ute.i(view, 0);
            sparseIntArray3.delete(0);
        }
        if (!this.b && this.P != 6) {
            sparseIntArray2.put(0, v(view, R.string.bottomsheet_action_expand_halfway, 6));
        }
        if (this.J) {
            int i4 = 5;
            if (this.P != 5) {
                ute.m(view, t4.j, new ad(i4, 2, this));
            }
        }
        int i5 = this.P;
        if (i5 == 3) {
            if (this.K && this.J) {
                return;
            }
            sparseIntArray3.put(0, v(view, R.string.bottomsheet_action_collapse, 4));
            return;
        }
        if (i5 == 4) {
            sparseIntArray.put(0, v(view, R.string.bottomsheet_action_expand, 3));
        } else {
            if (i5 != 6) {
                return;
            }
            if (!this.K || !this.J) {
                sparseIntArray3.put(0, v(view, R.string.bottomsheet_action_collapse, 4));
            }
            sparseIntArray.put(0, v(view, R.string.bottomsheet_action_expand, 3));
        }
    }

    public final void Q(int i, boolean z) {
        dk7 dk7Var;
        if (i == 2) {
            return;
        }
        boolean z2 = this.P == 3 && (this.y || F());
        if (this.A == z2 || (dk7Var = this.j) == null) {
            return;
        }
        this.A = z2;
        ValueAnimator valueAnimator = this.C;
        if (z && valueAnimator != null) {
            if (valueAnimator.isRunning()) {
                valueAnimator.reverse();
                return;
            } else {
                valueAnimator.setFloatValues(dk7Var.b.i, z2 ? x() : 1.0f);
                valueAnimator.start();
                return;
            }
        }
        if (valueAnimator != null && valueAnimator.isRunning()) {
            valueAnimator.cancel();
        }
        float fX = this.A ? x() : 1.0f;
        bk7 bk7Var = dk7Var.b;
        if (bk7Var.i != fX) {
            bk7Var.i = fX;
            dk7Var.f = true;
            dk7Var.g = true;
            dk7Var.invalidateSelf();
        }
    }

    public final void R(boolean z) {
        WeakReference weakReference = this.Y;
        if (weakReference == null) {
            return;
        }
        ViewParent parent = ((View) weakReference.get()).getParent();
        if (parent instanceof CoordinatorLayout) {
            CoordinatorLayout coordinatorLayout = (CoordinatorLayout) parent;
            int childCount = coordinatorLayout.getChildCount();
            if (z) {
                if (this.h0 != null) {
                    return;
                } else {
                    this.h0 = new HashMap(childCount);
                }
            }
            for (int i = 0; i < childCount; i++) {
                View childAt = coordinatorLayout.getChildAt(i);
                if (childAt != this.Y.get() && z) {
                    this.h0.put(childAt, Integer.valueOf(childAt.getImportantForAccessibility()));
                }
            }
            if (z) {
                return;
            }
            this.h0 = null;
        }
    }

    public final void S() {
        View view;
        if (this.Y != null) {
            w();
            if (this.P != 4 || (view = (View) this.Y.get()) == null) {
                return;
            }
            view.requestLayout();
        }
    }

    @Override // defpackage.mj7
    public final void a() {
        qj7 qj7Var = this.c0;
        if (qj7Var == null) {
            return;
        }
        int i = qj7Var.d;
        int i2 = qj7Var.c;
        sl0 sl0Var = qj7Var.f;
        qj7Var.f = null;
        if (sl0Var != null) {
            float f = sl0Var.c;
            if (Build.VERSION.SDK_INT >= 34) {
                if (!this.J) {
                    AnimatorSet animatorSetA = qj7Var.a();
                    animatorSetA.setDuration(yw.c(f, i2, i));
                    animatorSetA.start();
                    L(4);
                    return;
                }
                v5 v5Var = new v5(2, this);
                View view = qj7Var.b;
                ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view, (Property<View, Float>) View.TRANSLATION_Y, view.getScaleY() * view.getHeight());
                objectAnimatorOfFloat.setInterpolator(new u94(1));
                objectAnimatorOfFloat.setDuration(yw.c(f, i2, i));
                objectAnimatorOfFloat.addListener(new v5(4, qj7Var));
                objectAnimatorOfFloat.addListener(v5Var);
                objectAnimatorOfFloat.start();
                return;
            }
        }
        L(this.J ? 5 : 4);
    }

    @Override // defpackage.mj7
    public final void b(sl0 sl0Var) {
        qj7 qj7Var = this.c0;
        if (qj7Var == null) {
            return;
        }
        if (qj7Var.f == null) {
            Log.w("MaterialBackHelper", "Must call startBackProgress() before updateBackProgress()");
        }
        sl0 sl0Var2 = qj7Var.f;
        qj7Var.f = sl0Var;
        if (sl0Var2 == null) {
            return;
        }
        qj7Var.b(sl0Var.c);
    }

    @Override // defpackage.mj7
    public final void c(sl0 sl0Var) {
        qj7 qj7Var = this.c0;
        if (qj7Var == null) {
            return;
        }
        qj7Var.f = sl0Var;
    }

    @Override // defpackage.mj7
    public final void d() {
        qj7 qj7Var = this.c0;
        if (qj7Var == null) {
            return;
        }
        if (qj7Var.f == null) {
            Log.w("MaterialBackHelper", "Must call startBackProgress() and updateBackProgress() before cancelBackProgress()");
        }
        sl0 sl0Var = qj7Var.f;
        qj7Var.f = null;
        if (sl0Var == null) {
            return;
        }
        AnimatorSet animatorSetA = qj7Var.a();
        animatorSetA.setDuration(qj7Var.e);
        animatorSetA.start();
    }

    @Override // defpackage.da2
    public final void g(ga2 ga2Var) {
        this.Y = null;
        this.Q = null;
        this.c0 = null;
    }

    @Override // defpackage.da2
    public final void i() {
        this.Y = null;
        this.Q = null;
        this.c0 = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0122  */
    @Override // defpackage.da2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean j(androidx.coordinatorlayout.widget.CoordinatorLayout r18, android.view.View r19, android.view.MotionEvent r20) {
        /*
            Method dump skipped, instruction units count: 322
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.bottomsheet.BottomSheetBehavior.j(androidx.coordinatorlayout.widget.CoordinatorLayout, android.view.View, android.view.MotionEvent):boolean");
    }

    @Override // defpackage.da2
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, int i) {
        if (coordinatorLayout.getFitsSystemWindows() && !view.getFitsSystemWindows()) {
            view.setFitsSystemWindows(true);
        }
        int i2 = 0;
        if (this.Y == null) {
            this.h = coordinatorLayout.getResources().getDimensionPixelSize(R.dimen.design_bottom_sheet_peek_height_min);
            boolean z = (Build.VERSION.SDK_INT < 29 || this.o || this.g) ? false : true;
            if (this.p || this.q || this.r || this.t || this.u || this.v || z) {
                sv0 sv0Var = new sv0(this, z, i2);
                int paddingStart = view.getPaddingStart();
                view.getPaddingTop();
                int paddingEnd = view.getPaddingEnd();
                int paddingBottom = view.getPaddingBottom();
                awe aweVar = new awe();
                aweVar.a = paddingStart;
                aweVar.b = paddingEnd;
                aweVar.c = paddingBottom;
                a1a a1aVar = new a1a(sv0Var, 26, aweVar);
                WeakHashMap weakHashMap = ute.a;
                mte.c(view, a1aVar);
                if (view.isAttachedToWindow()) {
                    view.requestApplyInsets();
                } else {
                    view.addOnAttachStateChangeListener(new yve());
                }
            }
            c36 c36Var = new c36(view);
            WeakHashMap weakHashMap2 = ute.a;
            f4f.a(view, c36Var);
            this.Y = new WeakReference(view);
            this.c0 = new qj7(view);
            dk7 dk7Var = this.j;
            if (dk7Var != null) {
                view.setBackground(dk7Var);
                float elevation = this.I;
                if (elevation == -1.0f) {
                    elevation = view.getElevation();
                }
                dk7Var.k(elevation);
            } else {
                ColorStateList colorStateList = this.k;
                if (colorStateList != null) {
                    view.setBackgroundTintList(colorStateList);
                }
            }
            P();
            if (view.getImportantForAccessibility() == 0) {
                view.setImportantForAccessibility(1);
            }
        }
        if (this.Q == null) {
            this.Q = new cue(coordinatorLayout.getContext(), coordinatorLayout, this.m0);
        }
        int top = view.getTop();
        coordinatorLayout.j(view, i);
        this.W = coordinatorLayout.getWidth();
        this.X = coordinatorLayout.getHeight();
        int height = view.getHeight();
        this.V = height;
        int i3 = this.X;
        int i4 = i3 - height;
        int i5 = this.x;
        if (i4 < i5) {
            boolean z2 = this.s;
            int i6 = this.m;
            if (z2) {
                height = i6 == -1 ? i3 : Math.min(i3, i6);
                this.V = height;
            } else {
                int i7 = i3 - i5;
                height = i6 == -1 ? i7 : Math.min(i7, i6);
                this.V = height;
            }
        }
        this.E = Math.max(0, this.X - height);
        this.F = (int) ((1.0f - this.G) * this.X);
        w();
        int i8 = this.P;
        if (i8 == 3) {
            int iD = D();
            WeakHashMap weakHashMap3 = ute.a;
            view.offsetTopAndBottom(iD);
        } else if (i8 == 6) {
            int i9 = this.F;
            WeakHashMap weakHashMap4 = ute.a;
            view.offsetTopAndBottom(i9);
        } else if (this.J && i8 == 5) {
            int i10 = this.X;
            WeakHashMap weakHashMap5 = ute.a;
            view.offsetTopAndBottom(i10);
        } else if (i8 == 4) {
            int i11 = this.H;
            WeakHashMap weakHashMap6 = ute.a;
            view.offsetTopAndBottom(i11);
        } else if (i8 == 1 || i8 == 2) {
            int top2 = top - view.getTop();
            WeakHashMap weakHashMap7 = ute.a;
            view.offsetTopAndBottom(top2);
        }
        Q(this.P, false);
        ArrayList arrayList = this.Z;
        arrayList.clear();
        if (this.e) {
            H(view);
        } else {
            arrayList.add(new WeakReference(A(view)));
        }
        while (true) {
            ArrayList arrayList2 = this.a0;
            if (i2 >= arrayList2.size()) {
                return true;
            }
            ((uv0) arrayList2.get(i2)).a(view);
            i2++;
        }
    }

    @Override // defpackage.da2
    public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        view.measure(C(i, coordinatorLayout.getPaddingRight() + coordinatorLayout.getPaddingLeft() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i2, this.l, marginLayoutParams.width), C(i3, coordinatorLayout.getPaddingBottom() + coordinatorLayout.getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin, this.m, marginLayoutParams.height));
        return true;
    }

    @Override // defpackage.da2
    public final boolean m(View view) {
        Iterator it2 = this.Z.iterator();
        while (true) {
            if (!it2.hasNext()) {
                break;
            }
            if (((WeakReference) it2.next()).get() != null) {
                if (!G(view) || this.P == 3 || this.N) {
                    break;
                }
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.da2
    public final void n(CoordinatorLayout coordinatorLayout, View view, View view2, int i, int[] iArr, int i2) {
        boolean zG;
        if (i2 != 1 && (zG = G(view2))) {
            int top = view.getTop();
            int i3 = top - i;
            boolean z = this.M;
            if (i > 0) {
                if (!this.T && !z && zG && view2.canScrollVertically(1)) {
                    this.N = true;
                    return;
                }
                if (i3 < D()) {
                    int iD = top - D();
                    iArr[1] = iD;
                    WeakHashMap weakHashMap = ute.a;
                    view.offsetTopAndBottom(-iD);
                    M(3);
                } else {
                    if (!this.L) {
                        return;
                    }
                    iArr[1] = i;
                    WeakHashMap weakHashMap2 = ute.a;
                    view.offsetTopAndBottom(-i);
                    M(1);
                }
            } else if (i < 0) {
                boolean zCanScrollVertically = view2.canScrollVertically(-1);
                if (!this.T && !z && zG && zCanScrollVertically) {
                    this.N = true;
                    return;
                }
                if (!zCanScrollVertically) {
                    int i4 = this.H;
                    if (i3 > i4 && !this.J) {
                        int i5 = top - i4;
                        iArr[1] = i5;
                        WeakHashMap weakHashMap3 = ute.a;
                        view.offsetTopAndBottom(-i5);
                        M(4);
                    } else {
                        if (!this.L) {
                            return;
                        }
                        iArr[1] = i;
                        WeakHashMap weakHashMap4 = ute.a;
                        view.offsetTopAndBottom(-i);
                        M(1);
                    }
                }
            }
            z(view.getTop());
            this.S = i;
            this.T = true;
            this.N = false;
        }
    }

    @Override // defpackage.da2
    public final boolean p(CoordinatorLayout coordinatorLayout, View view, Rect rect) {
        if (!this.O || view.isInTouchMode()) {
            return false;
        }
        int i = this.P;
        if (i != 4 && i != 6) {
            return false;
        }
        Rect rect2 = this.l0;
        if (view.getLocalVisibleRect(rect2)) {
            WeakHashMap weakHashMap = ute.a;
            z4f z4fVarA = nte.a(view);
            if (z4fVarA != null) {
                rect2.bottom -= z4fVarA.a.i(519).d;
            }
            if (rect.top >= rect2.top && rect.bottom <= rect2.bottom) {
                return false;
            }
        }
        L(3);
        return true;
    }

    @Override // defpackage.da2
    public final void q(View view, Parcelable parcelable) {
        vv0 vv0Var = (vv0) parcelable;
        int i = this.a;
        if (i != 0) {
            if (i == -1 || (i & 1) == 1) {
                this.f = vv0Var.d;
            }
            if (i == -1 || (i & 2) == 2) {
                this.b = vv0Var.e;
            }
            if (i == -1 || (i & 4) == 4) {
                this.J = vv0Var.f;
            }
            if (i == -1 || (i & 8) == 8) {
                this.K = vv0Var.g;
            }
        }
        int i2 = vv0Var.c;
        if (i2 == 1 || i2 == 2) {
            this.P = 4;
        } else {
            this.P = i2;
        }
    }

    @Override // defpackage.da2
    public final Parcelable r(View view) {
        AbsSavedState absSavedState = View.BaseSavedState.EMPTY_STATE;
        return new vv0(this);
    }

    @Override // defpackage.da2
    public final boolean s(CoordinatorLayout coordinatorLayout, View view, View view2, View view3, int i, int i2) {
        this.S = 0;
        this.T = false;
        return (i & 2) != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00aa  */
    @Override // defpackage.da2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void t(android.view.View r4, android.view.View r5, int r6) {
        /*
            r3 = this;
            int r6 = r4.getTop()
            int r0 = r3.D()
            r1 = 3
            if (r6 != r0) goto Lf
            r3.M(r1)
            return
        Lf:
            boolean r5 = r3.G(r5)
            if (r5 == 0) goto Lb1
            boolean r5 = r3.T
            if (r5 != 0) goto L1b
            goto Lb1
        L1b:
            int r5 = r3.S
            r6 = 6
            if (r5 <= 0) goto L30
            boolean r5 = r3.b
            if (r5 == 0) goto L26
            goto Lab
        L26:
            int r5 = r4.getTop()
            int r0 = r3.F
            if (r5 <= r0) goto Lab
            goto Laa
        L30:
            boolean r5 = r3.J
            if (r5 == 0) goto L51
            android.view.VelocityTracker r5 = r3.b0
            if (r5 != 0) goto L3a
            r5 = 0
            goto L49
        L3a:
            r0 = 1000(0x3e8, float:1.401E-42)
            float r2 = r3.c
            r5.computeCurrentVelocity(r0, r2)
            android.view.VelocityTracker r5 = r3.b0
            int r0 = r3.d0
            float r5 = r5.getYVelocity(r0)
        L49:
            boolean r5 = r3.N(r4, r5)
            if (r5 == 0) goto L51
            r1 = 5
            goto Lab
        L51:
            int r5 = r3.S
            r0 = 4
            if (r5 != 0) goto L8f
            int r5 = r4.getTop()
            boolean r2 = r3.b
            if (r2 == 0) goto L70
            int r6 = r3.E
            int r6 = r5 - r6
            int r6 = java.lang.Math.abs(r6)
            int r2 = r3.H
            int r5 = r5 - r2
            int r5 = java.lang.Math.abs(r5)
            if (r6 >= r5) goto L93
            goto Lab
        L70:
            int r2 = r3.F
            if (r5 >= r2) goto L7f
            int r0 = r3.H
            int r0 = r5 - r0
            int r0 = java.lang.Math.abs(r0)
            if (r5 >= r0) goto Laa
            goto Lab
        L7f:
            int r1 = r5 - r2
            int r1 = java.lang.Math.abs(r1)
            int r2 = r3.H
            int r5 = r5 - r2
            int r5 = java.lang.Math.abs(r5)
            if (r1 >= r5) goto L93
            goto Laa
        L8f:
            boolean r5 = r3.b
            if (r5 == 0) goto L95
        L93:
            r1 = r0
            goto Lab
        L95:
            int r5 = r4.getTop()
            int r1 = r3.F
            int r1 = r5 - r1
            int r1 = java.lang.Math.abs(r1)
            int r2 = r3.H
            int r5 = r5 - r2
            int r5 = java.lang.Math.abs(r5)
            if (r1 >= r5) goto L93
        Laa:
            r1 = r6
        Lab:
            r5 = 0
            r3.O(r4, r1, r5)
            r3.T = r5
        Lb1:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.bottomsheet.BottomSheetBehavior.t(android.view.View, android.view.View, int):void");
    }

    @Override // defpackage.da2
    public final boolean u(View view, MotionEvent motionEvent) {
        if (!view.isShown()) {
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        int i = this.P;
        if (i == 1 && actionMasked == 0) {
            return true;
        }
        cue cueVar = this.Q;
        if (cueVar != null && (this.L || i == 1)) {
            cueVar.i(motionEvent);
        }
        if (actionMasked == 0) {
            this.d0 = -1;
            this.e0 = -1;
            this.f0 = null;
            VelocityTracker velocityTracker = this.b0;
            if (velocityTracker != null) {
                velocityTracker.recycle();
                this.b0 = null;
            }
        }
        VelocityTracker velocityTrackerObtain = this.b0;
        if (velocityTrackerObtain == null) {
            velocityTrackerObtain = VelocityTracker.obtain();
            this.b0 = velocityTrackerObtain;
        }
        velocityTrackerObtain.addMovement(motionEvent);
        if (this.Q != null && ((this.L || this.P == 1) && actionMasked == 2 && !this.R)) {
            float fAbs = Math.abs(this.e0 - motionEvent.getY());
            cue cueVar2 = this.Q;
            if (fAbs > cueVar2.b) {
                cueVar2.b(view, motionEvent.getPointerId(motionEvent.getActionIndex()));
            }
        }
        return !this.R;
    }

    public final int v(View view, int i, int i2) {
        int iA;
        String string = view.getResources().getString(i);
        ad adVar = new ad(i2, 2, this);
        ArrayList arrayListG = ute.g(view);
        int i3 = 0;
        while (true) {
            if (i3 >= arrayListG.size()) {
                int i4 = 0;
                int i5 = -1;
                while (true) {
                    int[] iArr = ute.d;
                    if (i4 >= 32 || i5 != -1) {
                        break;
                    }
                    int i6 = iArr[i4];
                    boolean z = true;
                    for (int i7 = 0; i7 < arrayListG.size(); i7++) {
                        z &= ((t4) arrayListG.get(i7)).a() != i6;
                    }
                    if (z) {
                        i5 = i6;
                    }
                    i4++;
                }
                iA = i5;
            } else {
                if (TextUtils.equals(string, ((AccessibilityNodeInfo.AccessibilityAction) ((t4) arrayListG.get(i3)).a).getLabel())) {
                    iA = ((t4) arrayListG.get(i3)).a();
                    break;
                }
                i3++;
            }
        }
        if (iA != -1) {
            t4 t4Var = new t4(null, iA, string, adVar, null);
            View.AccessibilityDelegate accessibilityDelegateE = ute.e(view);
            l4 l4Var = accessibilityDelegateE == null ? null : accessibilityDelegateE instanceof k4 ? ((k4) accessibilityDelegateE).a : new l4(accessibilityDelegateE);
            if (l4Var == null) {
                l4Var = new l4();
            }
            ute.o(view, l4Var);
            ute.l(view, t4Var.a());
            ute.g(view).add(t4Var);
            ute.i(view, 0);
        }
        return iA;
    }

    public final void w() {
        int iY = y();
        boolean z = this.b;
        int i = this.X;
        if (z) {
            this.H = Math.max(i - iY, this.E);
        } else {
            this.H = i - iY;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0059  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final float x() {
        /*
            r6 = this;
            r0 = 0
            dk7 r1 = r6.j
            if (r1 == 0) goto L8e
            java.lang.ref.WeakReference r2 = r6.Y
            if (r2 == 0) goto L8e
            java.lang.Object r2 = r2.get()
            if (r2 == 0) goto L8e
            int r2 = android.os.Build.VERSION.SDK_INT
            r3 = 31
            if (r2 < r3) goto L8e
            java.lang.ref.WeakReference r2 = r6.Y
            java.lang.Object r2 = r2.get()
            android.view.View r2 = (android.view.View) r2
            boolean r6 = r6.F()
            if (r6 == 0) goto L8e
            android.view.WindowInsets r6 = r2.getRootWindowInsets()
            if (r6 == 0) goto L8e
            float[] r2 = r1.B
            if (r2 == 0) goto L31
            r3 = 3
            r2 = r2[r3]
            goto L43
        L31:
            bk7 r2 = r1.b
            n3c r2 = r2.a
            p3c r2 = r2.c()
            eb2 r2 = r2.e
            android.graphics.RectF r3 = r1.e()
            float r2 = r2.a(r3)
        L43:
            r3 = 0
            android.view.RoundedCorner r4 = r6.getRoundedCorner(r3)
            if (r4 == 0) goto L59
            int r4 = r4.getRadius()
            float r4 = (float) r4
            int r5 = (r4 > r0 ? 1 : (r4 == r0 ? 0 : -1))
            if (r5 <= 0) goto L59
            int r5 = (r2 > r0 ? 1 : (r2 == r0 ? 0 : -1))
            if (r5 <= 0) goto L59
            float r4 = r4 / r2
            goto L5a
        L59:
            r4 = r0
        L5a:
            float[] r2 = r1.B
            if (r2 == 0) goto L61
            r1 = r2[r3]
            goto L73
        L61:
            bk7 r2 = r1.b
            n3c r2 = r2.a
            p3c r2 = r2.c()
            eb2 r2 = r2.f
            android.graphics.RectF r1 = r1.e()
            float r1 = r2.a(r1)
        L73:
            r2 = 1
            android.view.RoundedCorner r6 = r6.getRoundedCorner(r2)
            if (r6 == 0) goto L89
            int r6 = r6.getRadius()
            float r6 = (float) r6
            int r2 = (r6 > r0 ? 1 : (r6 == r0 ? 0 : -1))
            if (r2 <= 0) goto L89
            int r2 = (r1 > r0 ? 1 : (r1 == r0 ? 0 : -1))
            if (r2 <= 0) goto L89
            float r0 = r6 / r1
        L89:
            float r6 = java.lang.Math.max(r4, r0)
            return r6
        L8e:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.material.bottomsheet.BottomSheetBehavior.x():float");
    }

    public final int y() {
        int iMin;
        int i;
        int i2;
        if (this.g) {
            iMin = Math.min(Math.max(this.h, this.X - ((this.W * 9) / 16)), this.V);
            i = this.w;
        } else {
            if (!this.o && !this.p && (i2 = this.n) > 0) {
                return Math.max(this.f, i2 + this.i);
            }
            iMin = this.f;
            i = this.w;
        }
        return iMin + i;
    }

    public final void z(int i) {
        View view = (View) this.Y.get();
        if (view != null) {
            ArrayList arrayList = this.a0;
            if (arrayList.isEmpty()) {
                return;
            }
            int i2 = this.H;
            if (i <= i2 && i2 != D()) {
                D();
            }
            for (int i3 = 0; i3 < arrayList.size(); i3++) {
                ((uv0) arrayList.get(i3)).b(view);
            }
        }
    }

    @Override // defpackage.da2
    public final void o(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3, int[] iArr) {
    }

    public BottomSheetBehavior() {
        this.a = 0;
        this.b = true;
        this.l = -1;
        this.m = -1;
        this.B = new wv0(this);
        this.G = 0.5f;
        this.I = -1.0f;
        this.L = true;
        this.M = true;
        this.O = true;
        this.P = 4;
        this.U = 0.1f;
        this.Z = new ArrayList();
        this.a0 = new ArrayList();
        this.e0 = -1;
        this.i0 = new SparseIntArray();
        this.j0 = new SparseIntArray();
        this.k0 = new SparseIntArray();
        this.l0 = new Rect();
        this.m0 = new tv0(this, 0);
    }
}
