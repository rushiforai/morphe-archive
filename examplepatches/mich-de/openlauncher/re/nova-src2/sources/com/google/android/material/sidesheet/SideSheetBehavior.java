package com.google.android.material.sidesheet;

import a5.a1;
import a5.s0;
import aa.i0;
import ab.k;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Parcel;
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
import b.c0;
import b.u4;
import bk.g;
import bk.j;
import ck.e;
import com.google.android.gms.internal.consent_sdk.e0;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.ref.WeakReference;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.WeakHashMap;
import l4.b;
import ps.f0;
import r5.d;
import vj.h;

/* loaded from: classes3.dex */
public class SideSheetBehavior<V extends View> extends b implements vj.b {

    /* renamed from: a, reason: collision with root package name */
    public e0 f34331a;

    /* renamed from: b, reason: collision with root package name */
    public final g f34332b;

    /* renamed from: c, reason: collision with root package name */
    public final ColorStateList f34333c;

    /* renamed from: d, reason: collision with root package name */
    public final j f34334d;

    /* renamed from: e, reason: collision with root package name */
    public final e f34335e;

    /* renamed from: f, reason: collision with root package name */
    public final float f34336f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f34337g;

    /* renamed from: h, reason: collision with root package name */
    public int f34338h;

    /* renamed from: i, reason: collision with root package name */
    public d f34339i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f34340j;

    /* renamed from: k, reason: collision with root package name */
    public final float f34341k;

    /* renamed from: l, reason: collision with root package name */
    public int f34342l;

    /* renamed from: m, reason: collision with root package name */
    public int f34343m;
    public int n;
    public int o;

    /* renamed from: p, reason: collision with root package name */
    public WeakReference f34344p;

    /* renamed from: q, reason: collision with root package name */
    public WeakReference f34345q;

    /* renamed from: r, reason: collision with root package name */
    public final int f34346r;

    /* renamed from: s, reason: collision with root package name */
    public VelocityTracker f34347s;

    /* renamed from: t, reason: collision with root package name */
    public h f34348t;

    /* renamed from: u, reason: collision with root package name */
    public int f34349u;

    /* renamed from: v, reason: collision with root package name */
    public final LinkedHashSet f34350v;

    /* renamed from: w, reason: collision with root package name */
    public final ck.d f34351w;

    public SideSheetBehavior() {
        this.f34335e = new e(this);
        this.f34337g = true;
        this.f34338h = 5;
        this.f34341k = 0.1f;
        this.f34346r = -1;
        this.f34350v = new LinkedHashSet();
        this.f34351w = new ck.d(this, 0);
    }

    public final void A() {
        View view;
        WeakReference weakReference = this.f34344p;
        if (weakReference == null || (view = (View) weakReference.get()) == null) {
            return;
        }
        a1.h(SQLiteDatabase.OPEN_PRIVATECACHE, view);
        a1.f(0, view);
        a1.h(1048576, view);
        a1.f(0, view);
        int i5 = 5;
        if (this.f34338h != 5) {
            a1.i(view, b5.d.f17542l, new ck.b(this, i5));
        }
        int i11 = 3;
        if (this.f34338h != 3) {
            a1.i(view, b5.d.f17540j, new ck.b(this, i11));
        }
    }

    @Override // vj.b
    public final void a(g.b bVar) {
        ViewGroup.MarginLayoutParams marginLayoutParams;
        h hVar = this.f34348t;
        if (hVar == null) {
            return;
        }
        e0 e0Var = this.f34331a;
        int i5 = (e0Var == null || e0Var.Q() == 0) ? 5 : 3;
        if (hVar.f92791f == null) {
            Log.w("MaterialBackHelper", "Must call startBackProgress() before updateBackProgress()");
        }
        g.b bVar2 = hVar.f92791f;
        hVar.f92791f = bVar;
        if (bVar2 != null) {
            hVar.a(i5, bVar.f56404c, bVar.f56405d == 0);
        }
        WeakReference weakReference = this.f34344p;
        if (weakReference == null || weakReference.get() == null) {
            return;
        }
        View view = (View) this.f34344p.get();
        WeakReference weakReference2 = this.f34345q;
        View view2 = weakReference2 != null ? (View) weakReference2.get() : null;
        if (view2 == null || (marginLayoutParams = (ViewGroup.MarginLayoutParams) view2.getLayoutParams()) == null) {
            return;
        }
        this.f34331a.k0(marginLayoutParams, (int) ((view.getScaleX() * this.f34342l) + this.o));
        view2.requestLayout();
    }

    @Override // vj.b
    public final void b(g.b bVar) {
        h hVar = this.f34348t;
        if (hVar == null) {
            return;
        }
        hVar.f92791f = bVar;
    }

    @Override // vj.b
    public final void c() {
        h hVar = this.f34348t;
        if (hVar == null) {
            return;
        }
        View view = hVar.f92787b;
        if (hVar.f92791f == null) {
            Log.w("MaterialBackHelper", "Must call startBackProgress() and updateBackProgress() before cancelBackProgress()");
        }
        g.b bVar = hVar.f92791f;
        hVar.f92791f = null;
        if (bVar == null) {
            return;
        }
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(ObjectAnimator.ofFloat(view, (Property<View, Float>) View.SCALE_X, 1.0f), ObjectAnimator.ofFloat(view, (Property<View, Float>) View.SCALE_Y, 1.0f));
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                animatorSet.playTogether(ObjectAnimator.ofFloat(viewGroup.getChildAt(i5), (Property<View, Float>) View.SCALE_Y, 1.0f));
            }
        }
        animatorSet.setDuration(hVar.f92790e);
        animatorSet.start();
    }

    @Override // vj.b
    public final void d() {
        int i5;
        final ViewGroup.MarginLayoutParams marginLayoutParams;
        h hVar = this.f34348t;
        if (hVar == null) {
            return;
        }
        g.b bVar = hVar.f92791f;
        ValueAnimator.AnimatorUpdateListener animatorUpdateListener = null;
        hVar.f92791f = null;
        int i11 = 5;
        if (bVar == null || Build.VERSION.SDK_INT < 34) {
            w(5);
            return;
        }
        e0 e0Var = this.f34331a;
        if (e0Var != null && e0Var.Q() != 0) {
            i11 = 3;
        }
        i0 i0Var = new i0(this, 2);
        WeakReference weakReference = this.f34345q;
        final View view = weakReference != null ? (View) weakReference.get() : null;
        if (view != null && (marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams()) != null) {
            final int iC = this.f34331a.C(marginLayoutParams);
            animatorUpdateListener = new ValueAnimator.AnimatorUpdateListener() { // from class: ck.c
                @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                    this.f19970a.f34331a.k0(marginLayoutParams, cj.a.c(valueAnimator.getAnimatedFraction(), iC, 0));
                    view.requestLayout();
                }
            };
        }
        View view2 = hVar.f92787b;
        boolean z11 = bVar.f56405d == 0;
        WeakHashMap weakHashMap = a1.f250a;
        boolean z12 = (Gravity.getAbsoluteGravity(i11, view2.getLayoutDirection()) & 3) == 3;
        float scaleX = view2.getScaleX() * view2.getWidth();
        ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) layoutParams;
            i5 = z12 ? marginLayoutParams2.leftMargin : marginLayoutParams2.rightMargin;
        } else {
            i5 = 0;
        }
        float f11 = scaleX + i5;
        Property property = View.TRANSLATION_X;
        if (z12) {
            f11 = -f11;
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view2, (Property<View, Float>) property, f11);
        if (animatorUpdateListener != null) {
            objectAnimatorOfFloat.addUpdateListener(animatorUpdateListener);
        }
        objectAnimatorOfFloat.setInterpolator(new f6.a(1));
        objectAnimatorOfFloat.setDuration(cj.a.c(bVar.f56404c, hVar.f92788c, hVar.f92789d));
        objectAnimatorOfFloat.addListener(new vj.g(hVar, z11, i11));
        objectAnimatorOfFloat.addListener(i0Var);
        objectAnimatorOfFloat.start();
    }

    @Override // l4.b
    public final void g(l4.e eVar) {
        this.f34344p = null;
        this.f34339i = null;
        this.f34348t = null;
    }

    @Override // l4.b
    public final void j() {
        this.f34344p = null;
        this.f34339i = null;
        this.f34348t = null;
    }

    @Override // l4.b
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        d dVar;
        VelocityTracker velocityTracker;
        if ((!view.isShown() && a1.c(view) == null) || !this.f34337g) {
            this.f34340j = true;
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0 && (velocityTracker = this.f34347s) != null) {
            velocityTracker.recycle();
            this.f34347s = null;
        }
        if (this.f34347s == null) {
            this.f34347s = VelocityTracker.obtain();
        }
        this.f34347s.addMovement(motionEvent);
        if (actionMasked == 0) {
            this.f34349u = (int) motionEvent.getX();
        } else if ((actionMasked == 1 || actionMasked == 3) && this.f34340j) {
            this.f34340j = false;
            return false;
        }
        return (this.f34340j || (dVar = this.f34339i) == null || !dVar.p(motionEvent)) ? false : true;
    }

    @Override // l4.b
    public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) {
        View view2;
        View view3;
        int i11;
        View viewFindViewById;
        WeakHashMap weakHashMap = a1.f250a;
        int i12 = 1;
        if (coordinatorLayout.getFitsSystemWindows() && !view.getFitsSystemWindows()) {
            view.setFitsSystemWindows(true);
        }
        WeakReference weakReference = this.f34344p;
        g gVar = this.f34332b;
        int iK = 0;
        if (weakReference == null) {
            this.f34344p = new WeakReference(view);
            this.f34348t = new h(view);
            if (gVar != null) {
                view.setBackground(gVar);
                float fE = this.f34336f;
                if (fE == -1.0f) {
                    fE = s0.e(view);
                }
                gVar.k(fE);
            } else {
                ColorStateList colorStateList = this.f34333c;
                if (colorStateList != null) {
                    s0.i(view, colorStateList);
                }
            }
            int i13 = this.f34338h == 5 ? 4 : 0;
            if (view.getVisibility() != i13) {
                view.setVisibility(i13);
            }
            A();
            if (view.getImportantForAccessibility() == 0) {
                view.setImportantForAccessibility(1);
            }
            if (a1.c(view) == null) {
                a1.l(view, view.getResources().getString(2132019533));
            }
        }
        int i14 = Gravity.getAbsoluteGravity(((l4.e) view.getLayoutParams()).f74698c, i5) == 3 ? 1 : 0;
        e0 e0Var = this.f34331a;
        if (e0Var == null || e0Var.Q() != i14) {
            l4.e eVar = null;
            j jVar = this.f34334d;
            if (i14 == 0) {
                this.f34331a = new ck.a(this, i12);
                if (jVar != null) {
                    WeakReference weakReference2 = this.f34344p;
                    if (weakReference2 != null && (view3 = (View) weakReference2.get()) != null && (view3.getLayoutParams() instanceof l4.e)) {
                        eVar = (l4.e) view3.getLayoutParams();
                    }
                    if (eVar == null || ((ViewGroup.MarginLayoutParams) eVar).rightMargin <= 0) {
                        j jVarF = jVar.f();
                        jVarF.f18008f = new bk.a(0.0f);
                        jVarF.f18009g = new bk.a(0.0f);
                        j jVarA = jVarF.a();
                        if (gVar != null) {
                            gVar.c(jVarA);
                        }
                    }
                }
            } else {
                if (i14 != 1) {
                    throw new IllegalArgumentException(c0.i(i14, "Invalid sheet edge position value: ", ". Must be 0 or 1."));
                }
                this.f34331a = new ck.a(this, iK);
                if (jVar != null) {
                    WeakReference weakReference3 = this.f34344p;
                    if (weakReference3 != null && (view2 = (View) weakReference3.get()) != null && (view2.getLayoutParams() instanceof l4.e)) {
                        eVar = (l4.e) view2.getLayoutParams();
                    }
                    if (eVar == null || ((ViewGroup.MarginLayoutParams) eVar).leftMargin <= 0) {
                        j jVarF2 = jVar.f();
                        jVarF2.f18007e = new bk.a(0.0f);
                        jVarF2.f18010h = new bk.a(0.0f);
                        j jVarA2 = jVarF2.a();
                        if (gVar != null) {
                            gVar.c(jVarA2);
                        }
                    }
                }
            }
        }
        if (this.f34339i == null) {
            this.f34339i = new d(coordinatorLayout.getContext(), coordinatorLayout, this.f34351w);
        }
        int iK2 = this.f34331a.K(view);
        coordinatorLayout.r(i5, view);
        this.f34343m = coordinatorLayout.getWidth();
        this.n = this.f34331a.L(coordinatorLayout);
        this.f34342l = view.getWidth();
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        this.o = marginLayoutParams != null ? this.f34331a.t(marginLayoutParams) : 0;
        int i15 = this.f34338h;
        if (i15 == 1 || i15 == 2) {
            iK = iK2 - this.f34331a.K(view);
        } else if (i15 != 3) {
            if (i15 != 5) {
                throw new IllegalStateException("Unexpected value: " + this.f34338h);
            }
            iK = this.f34331a.G();
        }
        view.offsetLeftAndRight(iK);
        if (this.f34345q == null && (i11 = this.f34346r) != -1 && (viewFindViewById = coordinatorLayout.findViewById(i11)) != null) {
            this.f34345q = new WeakReference(viewFindViewById);
        }
        Iterator it = this.f34350v.iterator();
        while (it.hasNext()) {
            if (it.next() != null) {
                throw new ClassCastException();
            }
        }
        return true;
    }

    @Override // l4.b
    public final boolean m(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        view.measure(ViewGroup.getChildMeasureSpec(i5, coordinatorLayout.getPaddingRight() + coordinatorLayout.getPaddingLeft() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i11, marginLayoutParams.width), ViewGroup.getChildMeasureSpec(i12, coordinatorLayout.getPaddingBottom() + coordinatorLayout.getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin, marginLayoutParams.height));
        return true;
    }

    @Override // l4.b
    public final void r(View view, Parcelable parcelable) {
        int i5 = ((SavedState) parcelable).f34352c;
        if (i5 == 1 || i5 == 2) {
            i5 = 5;
        }
        this.f34338h = i5;
    }

    @Override // l4.b
    public final Parcelable s(View view) {
        AbsSavedState absSavedState = View.BaseSavedState.EMPTY_STATE;
        return new SavedState(this);
    }

    @Override // l4.b
    public final boolean v(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        VelocityTracker velocityTracker;
        if (!view.isShown()) {
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        if (this.f34338h == 1 && actionMasked == 0) {
            return true;
        }
        if (y()) {
            this.f34339i.j(motionEvent);
        }
        if (actionMasked == 0 && (velocityTracker = this.f34347s) != null) {
            velocityTracker.recycle();
            this.f34347s = null;
        }
        if (this.f34347s == null) {
            this.f34347s = VelocityTracker.obtain();
        }
        this.f34347s.addMovement(motionEvent);
        if (y() && actionMasked == 2 && !this.f34340j && y()) {
            float fAbs = Math.abs(this.f34349u - motionEvent.getX());
            d dVar = this.f34339i;
            if (fAbs > dVar.f85507b) {
                dVar.b(motionEvent.getPointerId(motionEvent.getActionIndex()), view);
            }
        }
        return !this.f34340j;
    }

    public final void w(int i5) {
        if (i5 == 1 || i5 == 2) {
            throw new IllegalArgumentException(c0.q(new StringBuilder("STATE_"), i5 == 1 ? "DRAGGING" : "SETTLING", " should not be set externally."));
        }
        WeakReference weakReference = this.f34344p;
        if (weakReference == null || weakReference.get() == null) {
            x(i5);
            return;
        }
        View view = (View) this.f34344p.get();
        k kVar = new k(this, i5, 3);
        ViewParent parent = view.getParent();
        if (parent != null && parent.isLayoutRequested()) {
            WeakHashMap weakHashMap = a1.f250a;
            if (view.isAttachedToWindow()) {
                view.post(kVar);
                return;
            }
        }
        kVar.run();
    }

    public final void x(int i5) {
        View view;
        if (this.f34338h == i5) {
            return;
        }
        this.f34338h = i5;
        WeakReference weakReference = this.f34344p;
        if (weakReference == null || (view = (View) weakReference.get()) == null) {
            return;
        }
        int i11 = this.f34338h == 5 ? 4 : 0;
        if (view.getVisibility() != i11) {
            view.setVisibility(i11);
        }
        Iterator it = this.f34350v.iterator();
        if (it.hasNext()) {
            throw u4.e(it);
        }
        A();
    }

    public final boolean y() {
        if (this.f34339i != null) {
            return this.f34337g || this.f34338h == 1;
        }
        return false;
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x002d, code lost:
    
        if (r1.o(r0, r3.getTop()) != false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x004b, code lost:
    
        if (r3 != false) goto L24;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x004d, code lost:
    
        x(2);
        r2.f34335e.i(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x0056, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void z(View view, int i5, boolean z11) {
        int iF;
        if (i5 == 3) {
            iF = this.f34331a.F();
        } else {
            if (i5 != 5) {
                throw new IllegalArgumentException(c0.h(i5, "Invalid state to get outer edge offset: "));
            }
            iF = this.f34331a.G();
        }
        d dVar = this.f34339i;
        if (dVar != null) {
            if (!z11) {
                int top = view.getTop();
                dVar.f85521r = view;
                dVar.f85508c = -1;
                boolean zH = dVar.h(iF, top, 0, 0);
                if (!zH && dVar.f85506a == 0 && dVar.f85521r != null) {
                    dVar.f85521r = null;
                }
            }
        }
        x(i5);
    }

    public static class SavedState extends androidx.customview.view.AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public final int f34352c;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f34352c = parcel.readInt();
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f34352c);
        }

        public SavedState(SideSheetBehavior sideSheetBehavior) {
            super(AbsSavedState.EMPTY_STATE);
            this.f34352c = sideSheetBehavior.f34338h;
        }
    }

    public SideSheetBehavior(Context context, AttributeSet attributeSet) {
        this.f34335e = new e(this);
        this.f34337g = true;
        this.f34338h = 5;
        this.f34341k = 0.1f;
        this.f34346r = -1;
        this.f34350v = new LinkedHashSet();
        this.f34351w = new ck.d(this, 0);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.I);
        if (typedArrayObtainStyledAttributes.hasValue(3)) {
            this.f34333c = f0.m(context, typedArrayObtainStyledAttributes, 3);
        }
        if (typedArrayObtainStyledAttributes.hasValue(6)) {
            this.f34334d = j.c(context, attributeSet, 0, 2132083907).a();
        }
        if (typedArrayObtainStyledAttributes.hasValue(5)) {
            int resourceId = typedArrayObtainStyledAttributes.getResourceId(5, -1);
            this.f34346r = resourceId;
            WeakReference weakReference = this.f34345q;
            if (weakReference != null) {
                weakReference.clear();
            }
            this.f34345q = null;
            WeakReference weakReference2 = this.f34344p;
            if (weakReference2 != null) {
                View view = (View) weakReference2.get();
                if (resourceId != -1) {
                    WeakHashMap weakHashMap = a1.f250a;
                    if (view.isLaidOut()) {
                        view.requestLayout();
                    }
                }
            }
        }
        j jVar = this.f34334d;
        if (jVar != null) {
            g gVar = new g(jVar);
            this.f34332b = gVar;
            gVar.j(context);
            ColorStateList colorStateList = this.f34333c;
            if (colorStateList != null) {
                this.f34332b.l(colorStateList);
            } else {
                TypedValue typedValue = new TypedValue();
                context.getTheme().resolveAttribute(16842801, typedValue, true);
                this.f34332b.setTint(typedValue.data);
            }
        }
        this.f34336f = typedArrayObtainStyledAttributes.getDimension(2, -1.0f);
        this.f34337g = typedArrayObtainStyledAttributes.getBoolean(4, true);
        typedArrayObtainStyledAttributes.recycle();
        ViewConfiguration.get(context).getScaledMaximumFlingVelocity();
    }
}
