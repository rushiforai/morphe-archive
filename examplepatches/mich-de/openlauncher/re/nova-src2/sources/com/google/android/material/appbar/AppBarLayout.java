package com.google.android.material.appbar;

import a5.a1;
import a5.g1;
import a5.h2;
import a5.s0;
import a5.v;
import android.animation.AnimatorInflater;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.widget.AbsListView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.customview.view.AbsSavedState;
import bk.g;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.android.material.appbar.AppBarLayout;
import dj.d;
import dj.f;
import dj.h;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.WeakHashMap;
import l4.e;
import ps.e0;
import ps.f0;
import ps.l;
import tj.i;
import z.c1;

/* loaded from: classes3.dex */
public class AppBarLayout extends LinearLayout implements l4.a {

    /* renamed from: y, reason: collision with root package name */
    public static final /* synthetic */ int f34003y = 0;

    /* renamed from: a, reason: collision with root package name */
    public int f34004a;

    /* renamed from: b, reason: collision with root package name */
    public int f34005b;

    /* renamed from: c, reason: collision with root package name */
    public int f34006c;

    /* renamed from: d, reason: collision with root package name */
    public int f34007d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f34008e;

    /* renamed from: f, reason: collision with root package name */
    public int f34009f;

    /* renamed from: g, reason: collision with root package name */
    public h2 f34010g;

    /* renamed from: h, reason: collision with root package name */
    public ArrayList f34011h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f34012i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f34013j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f34014k;

    /* renamed from: l, reason: collision with root package name */
    public final int f34015l;

    /* renamed from: m, reason: collision with root package name */
    public WeakReference f34016m;
    public final boolean n;
    public ValueAnimator o;

    /* renamed from: p, reason: collision with root package name */
    public final ValueAnimator.AnimatorUpdateListener f34017p;

    /* renamed from: q, reason: collision with root package name */
    public final ArrayList f34018q;

    /* renamed from: r, reason: collision with root package name */
    public final long f34019r;

    /* renamed from: s, reason: collision with root package name */
    public final TimeInterpolator f34020s;

    /* renamed from: t, reason: collision with root package name */
    public int[] f34021t;

    /* renamed from: u, reason: collision with root package name */
    public final Drawable f34022u;

    /* renamed from: v, reason: collision with root package name */
    public final Integer f34023v;

    /* renamed from: w, reason: collision with root package name */
    public final float f34024w;

    /* renamed from: x, reason: collision with root package name */
    public Behavior f34025x;

    public static class Behavior extends BaseBehavior<AppBarLayout> {
        public Behavior() {
        }

        public Behavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }
    }

    public static class ScrollingViewBehavior extends f {
        public ScrollingViewBehavior() {
        }

        public static AppBarLayout z(ArrayList arrayList) {
            int size = arrayList.size();
            for (int i5 = 0; i5 < size; i5++) {
                View view = (View) arrayList.get(i5);
                if (view instanceof AppBarLayout) {
                    return (AppBarLayout) view;
                }
            }
            return null;
        }

        @Override // l4.b
        public final boolean f(View view, View view2) {
            return view2 instanceof AppBarLayout;
        }

        @Override // l4.b
        public boolean h(CoordinatorLayout coordinatorLayout, View view, View view2) {
            l4.b bVar = ((e) view2.getLayoutParams()).f74696a;
            if (bVar instanceof BaseBehavior) {
                int bottom = (((view2.getBottom() - view.getTop()) + ((BaseBehavior) bVar).f34026j) + this.f49257e) - y(view2);
                WeakHashMap weakHashMap = a1.f250a;
                view.offsetTopAndBottom(bottom);
            }
            if (!(view2 instanceof AppBarLayout)) {
                return false;
            }
            AppBarLayout appBarLayout = (AppBarLayout) view2;
            if (!appBarLayout.f34014k) {
                return false;
            }
            appBarLayout.k(appBarLayout.l(view));
            return false;
        }

        @Override // l4.b
        public final void i(CoordinatorLayout coordinatorLayout, View view) {
            if (view instanceof AppBarLayout) {
                a1.k(coordinatorLayout, null);
            }
        }

        @Override // l4.b
        public final boolean q(CoordinatorLayout coordinatorLayout, View view, Rect rect, boolean z11) {
            AppBarLayout appBarLayoutZ = z(coordinatorLayout.k(view));
            if (appBarLayoutZ != null) {
                Rect rect2 = new Rect(rect);
                rect2.offset(view.getLeft(), view.getTop());
                int width = coordinatorLayout.getWidth();
                int height = coordinatorLayout.getHeight();
                Rect rect3 = this.f49255c;
                rect3.set(0, 0, width, height);
                if (!rect3.contains(rect2)) {
                    appBarLayoutZ.j(false, !z11, true);
                    return true;
                }
            }
            return false;
        }

        public ScrollingViewBehavior(Context context, AttributeSet attributeSet) {
            super(0);
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.F);
            this.f49258f = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    public AppBarLayout(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        final Integer numValueOf;
        super(hk.a.a(context, attributeSet, 2130968693, 2132083755), attributeSet, 2130968693);
        this.f34005b = -1;
        this.f34006c = -1;
        this.f34007d = -1;
        boolean z11 = false;
        this.f34009f = 0;
        this.f34018q = new ArrayList();
        Context context2 = getContext();
        super.setOrientation(1);
        if (getOutlineProvider() == ViewOutlineProvider.BACKGROUND) {
            setOutlineProvider(ViewOutlineProvider.BOUNDS);
        }
        Context context3 = getContext();
        TypedArray typedArrayF = i.f(context3, attributeSet, dj.i.f49265a, 2130968693, 2132083755, new int[0]);
        try {
            if (typedArrayF.hasValue(0)) {
                setStateListAnimator(AnimatorInflater.loadStateListAnimator(context3, typedArrayF.getResourceId(0, 0)));
            }
            typedArrayF.recycle();
            TypedArray typedArrayF2 = i.f(context2, attributeSet, bj.a.f17914a, 2130968693, 2132083755, new int[0]);
            Drawable drawable = typedArrayF2.getDrawable(0);
            WeakHashMap weakHashMap = a1.f250a;
            setBackground(drawable);
            int i5 = 6;
            final ColorStateList colorStateListM = f0.m(context2, typedArrayF2, 6);
            this.n = colorStateListM != null;
            final ColorStateList colorStateListO = k0.o(getBackground());
            Integer numValueOf2 = null;
            int i11 = 3;
            if (colorStateListO != null) {
                final g gVar = new g();
                gVar.l(colorStateListO);
                if (colorStateListM != null) {
                    Context context4 = getContext();
                    TypedValue typedValueU = e0.u(context4, 2130968977);
                    if (typedValueU != null) {
                        int i12 = typedValueU.resourceId;
                        numValueOf = Integer.valueOf(i12 != 0 ? context4.getColor(i12) : typedValueU.data);
                    } else {
                        numValueOf = null;
                    }
                    this.f34017p = new ValueAnimator.AnimatorUpdateListener() { // from class: dj.a
                        @Override // android.animation.ValueAnimator.AnimatorUpdateListener
                        public final void onAnimationUpdate(ValueAnimator valueAnimator) {
                            Integer num;
                            AppBarLayout appBarLayout = this.f49237a;
                            ArrayList arrayList = appBarLayout.f34018q;
                            int iV = k0.v(((Float) valueAnimator.getAnimatedValue()).floatValue(), colorStateListO.getDefaultColor(), colorStateListM.getDefaultColor());
                            ColorStateList colorStateListValueOf = ColorStateList.valueOf(iV);
                            bk.g gVar2 = gVar;
                            gVar2.l(colorStateListValueOf);
                            if (appBarLayout.f34022u != null && (num = appBarLayout.f34023v) != null && num.equals(numValueOf)) {
                                appBarLayout.f34022u.setTint(iV);
                            }
                            if (arrayList.isEmpty()) {
                                return;
                            }
                            Iterator it = arrayList.iterator();
                            while (it.hasNext()) {
                                if (it.next() != null) {
                                    throw new ClassCastException();
                                }
                                if (gVar2.f17980a.f17966c != null) {
                                    throw null;
                                }
                            }
                        }
                    };
                    setBackground(gVar);
                } else {
                    gVar.j(context2);
                    this.f34017p = new g1(i11, this, gVar);
                    setBackground(gVar);
                }
            }
            this.f34019r = l.q(context2, 2130969701, getResources().getInteger(2131492866));
            this.f34020s = l.r(context2, 2130969719, cj.a.f19951a);
            if (typedArrayF2.hasValue(4)) {
                j(typedArrayF2.getBoolean(4, false), false, false);
            }
            if (typedArrayF2.hasValue(3)) {
                dj.i.a(this, typedArrayF2.getDimensionPixelSize(3, 0));
            }
            if (typedArrayF2.hasValue(2)) {
                setKeyboardNavigationCluster(typedArrayF2.getBoolean(2, false));
            }
            if (typedArrayF2.hasValue(1)) {
                setTouchscreenBlocksFocus(typedArrayF2.getBoolean(1, false));
            }
            this.f34024w = getResources().getDimension(2131165371);
            this.f34014k = typedArrayF2.getBoolean(5, false);
            this.f34015l = typedArrayF2.getResourceId(7, -1);
            Drawable drawable2 = typedArrayF2.getDrawable(8);
            Drawable drawable3 = this.f34022u;
            if (drawable3 != drawable2) {
                if (drawable3 != null) {
                    drawable3.setCallback(null);
                }
                Drawable drawableMutate = drawable2 != null ? drawable2.mutate() : null;
                this.f34022u = drawableMutate;
                if (drawableMutate instanceof g) {
                    numValueOf2 = Integer.valueOf(((g) drawableMutate).f17998u);
                } else {
                    ColorStateList colorStateListO2 = k0.o(drawableMutate);
                    if (colorStateListO2 != null) {
                        numValueOf2 = Integer.valueOf(colorStateListO2.getDefaultColor());
                    }
                }
                this.f34023v = numValueOf2;
                Drawable drawable4 = this.f34022u;
                if (drawable4 != null) {
                    if (drawable4.isStateful()) {
                        this.f34022u.setState(getDrawableState());
                    }
                    this.f34022u.setLayoutDirection(getLayoutDirection());
                    this.f34022u.setVisible(getVisibility() == 0, false);
                    this.f34022u.setCallback(this);
                }
                if (this.f34022u != null && f() > 0) {
                    z11 = true;
                }
                setWillNotDraw(!z11);
                postInvalidateOnAnimation();
            }
            typedArrayF2.recycle();
            s0.l(this, new cm.f(this, i5));
        } catch (Throwable th2) {
            typedArrayF.recycle();
            throw th2;
        }
    }

    public static dj.b c(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof LinearLayout.LayoutParams) {
            dj.b bVar = new dj.b((LinearLayout.LayoutParams) layoutParams);
            bVar.f49242a = 1;
            return bVar;
        }
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            dj.b bVar2 = new dj.b((ViewGroup.MarginLayoutParams) layoutParams);
            bVar2.f49242a = 1;
            return bVar2;
        }
        dj.b bVar3 = new dj.b(layoutParams);
        bVar3.f49242a = 1;
        return bVar3;
    }

    @Override // l4.a
    public final l4.b a() {
        Behavior behavior = new Behavior();
        this.f34025x = behavior;
        return behavior;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public final dj.b generateLayoutParams(AttributeSet attributeSet) {
        Context context = getContext();
        dj.b bVar = new dj.b(context, attributeSet);
        bVar.f49242a = 1;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.f17915b);
        bVar.f49242a = typedArrayObtainStyledAttributes.getInt(1, 0);
        bVar.f49243b = typedArrayObtainStyledAttributes.getInt(0, 0) != 1 ? null : new io.sentry.internal.debugmeta.c(10);
        if (typedArrayObtainStyledAttributes.hasValue(2)) {
            bVar.f49244c = AnimationUtils.loadInterpolator(context, typedArrayObtainStyledAttributes.getResourceId(2, 0));
        }
        typedArrayObtainStyledAttributes.recycle();
        return bVar;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof dj.b;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0050  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int d() {
        int iMin;
        int minimumHeight;
        int i5 = this.f34006c;
        if (i5 != -1) {
            return i5;
        }
        int i11 = 0;
        for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
            View childAt = getChildAt(childCount);
            if (childAt.getVisibility() != 8) {
                dj.b bVar = (dj.b) childAt.getLayoutParams();
                int measuredHeight = childAt.getMeasuredHeight();
                int i12 = bVar.f49242a;
                if ((i12 & 5) != 5) {
                    if (i11 > 0) {
                        break;
                    }
                } else {
                    int i13 = ((LinearLayout.LayoutParams) bVar).topMargin + ((LinearLayout.LayoutParams) bVar).bottomMargin;
                    if ((i12 & 8) != 0) {
                        WeakHashMap weakHashMap = a1.f250a;
                        minimumHeight = childAt.getMinimumHeight();
                    } else if ((i12 & 2) != 0) {
                        WeakHashMap weakHashMap2 = a1.f250a;
                        minimumHeight = measuredHeight - childAt.getMinimumHeight();
                    } else {
                        iMin = i13 + measuredHeight;
                        if (childCount == 0) {
                            WeakHashMap weakHashMap3 = a1.f250a;
                            if (childAt.getFitsSystemWindows()) {
                                iMin = Math.min(iMin, measuredHeight - f());
                            }
                        }
                        i11 += iMin;
                    }
                    iMin = minimumHeight + i13;
                    if (childCount == 0) {
                    }
                    i11 += iMin;
                }
            }
        }
        int iMax = Math.max(0, i11);
        this.f34006c = iMax;
        return iMax;
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.f34022u == null || f() <= 0) {
            return;
        }
        int iSave = canvas.save();
        canvas.translate(0.0f, -this.f34004a);
        this.f34022u.draw(canvas);
        canvas.restoreToCount(iSave);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        Drawable drawable = this.f34022u;
        if (drawable != null && drawable.isStateful() && drawable.setState(drawableState)) {
            invalidateDrawable(drawable);
        }
    }

    public final int e() {
        int i5 = this.f34007d;
        if (i5 != -1) {
            return i5;
        }
        int childCount = getChildCount();
        int i11 = 0;
        int minimumHeight = 0;
        while (true) {
            if (i11 >= childCount) {
                break;
            }
            View childAt = getChildAt(i11);
            if (childAt.getVisibility() != 8) {
                dj.b bVar = (dj.b) childAt.getLayoutParams();
                int measuredHeight = ((LinearLayout.LayoutParams) bVar).topMargin + ((LinearLayout.LayoutParams) bVar).bottomMargin + childAt.getMeasuredHeight();
                int i12 = bVar.f49242a;
                if ((i12 & 1) == 0) {
                    break;
                }
                minimumHeight += measuredHeight;
                if ((i12 & 2) != 0) {
                    WeakHashMap weakHashMap = a1.f250a;
                    minimumHeight -= childAt.getMinimumHeight();
                    break;
                }
            }
            i11++;
        }
        int iMax = Math.max(0, minimumHeight);
        this.f34007d = iMax;
        return iMax;
    }

    public final int f() {
        h2 h2Var = this.f34010g;
        if (h2Var != null) {
            return h2Var.d();
        }
        return 0;
    }

    public final int g() {
        int i5 = this.f34005b;
        if (i5 != -1) {
            return i5;
        }
        int childCount = getChildCount();
        int i11 = 0;
        int minimumHeight = 0;
        while (true) {
            if (i11 >= childCount) {
                break;
            }
            View childAt = getChildAt(i11);
            if (childAt.getVisibility() != 8) {
                dj.b bVar = (dj.b) childAt.getLayoutParams();
                int measuredHeight = childAt.getMeasuredHeight();
                int i12 = bVar.f49242a;
                if ((i12 & 1) == 0) {
                    break;
                }
                int iF = measuredHeight + ((LinearLayout.LayoutParams) bVar).topMargin + ((LinearLayout.LayoutParams) bVar).bottomMargin + minimumHeight;
                if (i11 == 0) {
                    WeakHashMap weakHashMap = a1.f250a;
                    if (childAt.getFitsSystemWindows()) {
                        iF -= f();
                    }
                }
                minimumHeight = iF;
                if ((i12 & 2) != 0) {
                    WeakHashMap weakHashMap2 = a1.f250a;
                    minimumHeight -= childAt.getMinimumHeight();
                    break;
                }
            }
            i11++;
        }
        int iMax = Math.max(0, minimumHeight);
        this.f34005b = iMax;
        return iMax;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        dj.b bVar = new dj.b(-1, -2);
        bVar.f49242a = 1;
        return bVar;
    }

    public final void h() {
        Behavior behavior = this.f34025x;
        BaseBehavior.SavedState savedStateF = (behavior == null || this.f34005b == -1 || this.f34009f != 0) ? null : behavior.F(AbsSavedState.f14271b, this);
        this.f34005b = -1;
        this.f34006c = -1;
        this.f34007d = -1;
        if (savedStateF != null) {
            Behavior behavior2 = this.f34025x;
            if (behavior2.f34029m != null) {
                return;
            }
            behavior2.f34029m = savedStateF;
        }
    }

    public final void i(int i5) {
        this.f34004a = i5;
        if (!willNotDraw()) {
            WeakHashMap weakHashMap = a1.f250a;
            postInvalidateOnAnimation();
        }
        ArrayList arrayList = this.f34011h;
        if (arrayList != null) {
            int size = arrayList.size();
            for (int i11 = 0; i11 < size; i11++) {
                d dVar = (d) this.f34011h.get(i11);
                if (dVar != null) {
                    CollapsingToolbarLayout collapsingToolbarLayout = dVar.f49247a;
                    collapsingToolbarLayout.f34056x = i5;
                    tj.b bVar = collapsingToolbarLayout.f34045k;
                    h2 h2Var = collapsingToolbarLayout.f34058z;
                    int iD = h2Var != null ? h2Var.d() : 0;
                    int childCount = collapsingToolbarLayout.getChildCount();
                    for (int i12 = 0; i12 < childCount; i12++) {
                        View childAt = collapsingToolbarLayout.getChildAt(i12);
                        dj.c cVar = (dj.c) childAt.getLayoutParams();
                        h hVarC = CollapsingToolbarLayout.c(childAt);
                        int i13 = cVar.f49245a;
                        if (i13 == 1) {
                            hVarC.b(v4.a.f(-i5, 0, ((collapsingToolbarLayout.getHeight() - CollapsingToolbarLayout.c(childAt).f49262b) - childAt.getHeight()) - ((FrameLayout.LayoutParams) ((dj.c) childAt.getLayoutParams())).bottomMargin));
                        } else if (i13 == 2) {
                            hVarC.b(Math.round((-i5) * cVar.f49246b));
                        }
                    }
                    collapsingToolbarLayout.e();
                    if (collapsingToolbarLayout.o != null && iD > 0) {
                        WeakHashMap weakHashMap2 = a1.f250a;
                        collapsingToolbarLayout.postInvalidateOnAnimation();
                    }
                    int height = collapsingToolbarLayout.getHeight();
                    WeakHashMap weakHashMap3 = a1.f250a;
                    int minimumHeight = (height - collapsingToolbarLayout.getMinimumHeight()) - iD;
                    float fB = height - collapsingToolbarLayout.b();
                    float f11 = minimumHeight;
                    float fMin = Math.min(1.0f, fB / f11);
                    bVar.f89341d = fMin;
                    bVar.f89343e = a2.c.a(1.0f, fMin, 0.5f, fMin);
                    bVar.f89345f = collapsingToolbarLayout.f34056x + minimumHeight;
                    bVar.o(Math.abs(i5) / f11);
                }
            }
        }
    }

    public final void j(boolean z11, boolean z12, boolean z13) {
        this.f34009f = (z11 ? 1 : 2) | (z12 ? 4 : 0) | (z13 ? 8 : 0);
        requestLayout();
    }

    public final boolean k(boolean z11) {
        if (this.f34013j == z11) {
            return false;
        }
        this.f34013j = z11;
        refreshDrawableState();
        if (!(getBackground() instanceof g)) {
            return true;
        }
        if (this.n) {
            m(z11 ? 0.0f : 1.0f, z11 ? 1.0f : 0.0f);
            return true;
        }
        if (!this.f34014k) {
            return true;
        }
        float f11 = this.f34024w;
        m(z11 ? 0.0f : f11, z11 ? f11 : 0.0f);
        return true;
    }

    public final boolean l(View view) {
        int i5;
        if (this.f34016m == null && (i5 = this.f34015l) != -1) {
            View viewFindViewById = view != null ? view.findViewById(i5) : null;
            if (viewFindViewById == null && (getParent() instanceof ViewGroup)) {
                viewFindViewById = ((ViewGroup) getParent()).findViewById(i5);
            }
            if (viewFindViewById != null) {
                this.f34016m = new WeakReference(viewFindViewById);
            }
        }
        WeakReference weakReference = this.f34016m;
        View view2 = weakReference != null ? (View) weakReference.get() : null;
        if (view2 != null) {
            view = view2;
        }
        if (view != null) {
            return view.canScrollVertically(-1) || view.getScrollY() > 0;
        }
        return false;
    }

    public final void m(float f11, float f12) {
        ValueAnimator valueAnimator = this.o;
        if (valueAnimator != null) {
            valueAnimator.cancel();
        }
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(f11, f12);
        this.o = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(this.f34019r);
        this.o.setInterpolator(this.f34020s);
        ValueAnimator.AnimatorUpdateListener animatorUpdateListener = this.f34017p;
        if (animatorUpdateListener != null) {
            this.o.addUpdateListener(animatorUpdateListener);
        }
        this.o.start();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        Drawable background = getBackground();
        if (background instanceof g) {
            k0.E(this, (g) background);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        if (this.f34021t == null) {
            this.f34021t = new int[4];
        }
        int[] iArr = this.f34021t;
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + iArr.length);
        boolean z11 = this.f34012i;
        iArr[0] = z11 ? 2130970040 : -2130970040;
        iArr[1] = (z11 && this.f34013j) ? 2130970041 : -2130970041;
        iArr[2] = z11 ? 2130970035 : -2130970035;
        iArr[3] = (z11 && this.f34013j) ? 2130970034 : -2130970034;
        return View.mergeDrawableStates(iArrOnCreateDrawableState, iArr);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        WeakReference weakReference = this.f34016m;
        if (weakReference != null) {
            weakReference.clear();
        }
        this.f34016m = null;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        WeakHashMap weakHashMap = a1.f250a;
        boolean z12 = true;
        if (getFitsSystemWindows() && getChildCount() > 0) {
            View childAt = getChildAt(0);
            if (childAt.getVisibility() != 8 && !childAt.getFitsSystemWindows()) {
                int iF = f();
                for (int childCount = getChildCount() - 1; childCount >= 0; childCount--) {
                    getChildAt(childCount).offsetTopAndBottom(iF);
                }
            }
        }
        h();
        this.f34008e = false;
        int childCount2 = getChildCount();
        int i14 = 0;
        while (true) {
            if (i14 >= childCount2) {
                break;
            }
            if (((dj.b) getChildAt(i14).getLayoutParams()).f49244c != null) {
                this.f34008e = true;
                break;
            }
            i14++;
        }
        Drawable drawable = this.f34022u;
        if (drawable != null) {
            drawable.setBounds(0, 0, getWidth(), f());
        }
        if (!this.f34014k) {
            int childCount3 = getChildCount();
            int i15 = 0;
            while (true) {
                if (i15 >= childCount3) {
                    z12 = false;
                    break;
                }
                int i16 = ((dj.b) getChildAt(i15).getLayoutParams()).f49242a;
                if ((i16 & 1) == 1 && (i16 & 10) != 0) {
                    break;
                } else {
                    i15++;
                }
            }
        }
        if (this.f34012i != z12) {
            this.f34012i = z12;
            refreshDrawableState();
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        int mode = View.MeasureSpec.getMode(i11);
        if (mode != 1073741824) {
            WeakHashMap weakHashMap = a1.f250a;
            if (getFitsSystemWindows() && getChildCount() > 0) {
                View childAt = getChildAt(0);
                if (childAt.getVisibility() != 8 && !childAt.getFitsSystemWindows()) {
                    int measuredHeight = getMeasuredHeight();
                    if (mode == Integer.MIN_VALUE) {
                        measuredHeight = v4.a.f(f() + getMeasuredHeight(), 0, View.MeasureSpec.getSize(i11));
                    } else if (mode == 0) {
                        measuredHeight += f();
                    }
                    setMeasuredDimension(getMeasuredWidth(), measuredHeight);
                }
            }
        }
        h();
    }

    @Override // android.view.View
    public final void setElevation(float f11) {
        super.setElevation(f11);
        Drawable background = getBackground();
        if (background instanceof g) {
            ((g) background).k(f11);
        }
    }

    @Override // android.widget.LinearLayout
    public final void setOrientation(int i5) {
        if (i5 != 1) {
            throw new IllegalArgumentException("AppBarLayout is always vertical and does not support horizontal orientation");
        }
        super.setOrientation(i5);
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        super.setVisibility(i5);
        boolean z11 = i5 == 0;
        Drawable drawable = this.f34022u;
        if (drawable != null) {
            drawable.setVisible(z11, false);
        }
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.f34022u;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return c(layoutParams);
    }

    public static class BaseBehavior<T extends AppBarLayout> extends dj.e {

        /* renamed from: j, reason: collision with root package name */
        public int f34026j;

        /* renamed from: k, reason: collision with root package name */
        public int f34027k;

        /* renamed from: l, reason: collision with root package name */
        public ValueAnimator f34028l;

        /* renamed from: m, reason: collision with root package name */
        public SavedState f34029m;
        public WeakReference n;

        public static class SavedState extends AbsSavedState {
            public static final Parcelable.Creator<SavedState> CREATOR = new c();

            /* renamed from: c, reason: collision with root package name */
            public boolean f34030c;

            /* renamed from: d, reason: collision with root package name */
            public boolean f34031d;

            /* renamed from: e, reason: collision with root package name */
            public int f34032e;

            /* renamed from: f, reason: collision with root package name */
            public float f34033f;

            /* renamed from: g, reason: collision with root package name */
            public boolean f34034g;

            public SavedState(Parcel parcel, ClassLoader classLoader) {
                super(parcel, classLoader);
                this.f34030c = parcel.readByte() != 0;
                this.f34031d = parcel.readByte() != 0;
                this.f34032e = parcel.readInt();
                this.f34033f = parcel.readFloat();
                this.f34034g = parcel.readByte() != 0;
            }

            @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
            public final void writeToParcel(Parcel parcel, int i5) {
                super.writeToParcel(parcel, i5);
                parcel.writeByte(this.f34030c ? (byte) 1 : (byte) 0);
                parcel.writeByte(this.f34031d ? (byte) 1 : (byte) 0);
                parcel.writeInt(this.f34032e);
                parcel.writeFloat(this.f34033f);
                parcel.writeByte(this.f34034g ? (byte) 1 : (byte) 0);
            }
        }

        public BaseBehavior() {
            this.f49251f = -1;
            this.f49253h = -1;
        }

        public static View B(BaseBehavior baseBehavior, CoordinatorLayout coordinatorLayout) {
            int childCount = coordinatorLayout.getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = coordinatorLayout.getChildAt(i5);
                if (((e) childAt.getLayoutParams()).f74696a instanceof ScrollingViewBehavior) {
                    return childAt;
                }
            }
            return null;
        }

        public static View D(CoordinatorLayout coordinatorLayout) {
            int childCount = coordinatorLayout.getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = coordinatorLayout.getChildAt(i5);
                if ((childAt instanceof v) || (childAt instanceof AbsListView) || (childAt instanceof ScrollView)) {
                    return childAt;
                }
            }
            return null;
        }

        /* JADX WARN: Removed duplicated region for block: B:26:0x005c  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public static void H(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, int i5, int i11, boolean z11) {
            View childAt;
            boolean zL;
            int iAbs = Math.abs(i5);
            int childCount = appBarLayout.getChildCount();
            int i12 = 0;
            while (true) {
                if (i12 >= childCount) {
                    childAt = null;
                    break;
                }
                childAt = appBarLayout.getChildAt(i12);
                if (iAbs >= childAt.getTop() && iAbs <= childAt.getBottom()) {
                    break;
                } else {
                    i12++;
                }
            }
            if (childAt != null) {
                int i13 = ((dj.b) childAt.getLayoutParams()).f49242a;
                if ((i13 & 1) != 0) {
                    WeakHashMap weakHashMap = a1.f250a;
                    int minimumHeight = childAt.getMinimumHeight();
                    zL = true;
                    if (i11 <= 0 || (i13 & 12) == 0 ? (i13 & 2) == 0 || (-i5) < (childAt.getBottom() - minimumHeight) - appBarLayout.f() : (-i5) < (childAt.getBottom() - minimumHeight) - appBarLayout.f()) {
                        zL = false;
                    }
                }
            }
            if (appBarLayout.f34014k) {
                zL = appBarLayout.l(D(coordinatorLayout));
            }
            boolean zK = appBarLayout.k(zL);
            if (!z11) {
                if (zK) {
                    List list = (List) ((c1) coordinatorLayout.f14200b.f73008b).get(appBarLayout);
                    ArrayList arrayList = coordinatorLayout.f14202d;
                    arrayList.clear();
                    if (list != null) {
                        arrayList.addAll(list);
                    }
                    int size = arrayList.size();
                    for (int i14 = 0; i14 < size; i14++) {
                        l4.b bVar = ((e) ((View) arrayList.get(i14)).getLayoutParams()).f74696a;
                        if (bVar instanceof ScrollingViewBehavior) {
                            if (((ScrollingViewBehavior) bVar).f49258f == 0) {
                                return;
                            }
                        }
                    }
                    return;
                }
                return;
            }
            if (appBarLayout.getBackground() != null) {
                appBarLayout.getBackground().jumpToCurrentState();
            }
            if (appBarLayout.getForeground() != null) {
                appBarLayout.getForeground().jumpToCurrentState();
            }
            if (appBarLayout.getStateListAnimator() != null) {
                appBarLayout.getStateListAnimator().jumpToCurrentState();
            }
        }

        public final void C(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, int i5) {
            int iAbs = Math.abs(y() - i5);
            float fAbs = Math.abs(0.0f);
            int iRound = fAbs > 0.0f ? Math.round((iAbs / fAbs) * 1000.0f) * 3 : (int) (((iAbs / appBarLayout.getHeight()) + 1.0f) * 150.0f);
            int iY = y();
            if (iY == i5) {
                ValueAnimator valueAnimator = this.f34028l;
                if (valueAnimator == null || !valueAnimator.isRunning()) {
                    return;
                }
                this.f34028l.cancel();
                return;
            }
            ValueAnimator valueAnimator2 = this.f34028l;
            if (valueAnimator2 == null) {
                ValueAnimator valueAnimator3 = new ValueAnimator();
                this.f34028l = valueAnimator3;
                valueAnimator3.setInterpolator(cj.a.f19955e);
                this.f34028l.addUpdateListener(new a(coordinatorLayout, this, appBarLayout));
            } else {
                valueAnimator2.cancel();
            }
            this.f34028l.setDuration(Math.min(iRound, 600));
            this.f34028l.setIntValues(iY, i5);
            this.f34028l.start();
        }

        /* JADX WARN: Removed duplicated region for block: B:9:0x002b  */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final void E(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, View view, int i5, int[] iArr) {
            AppBarLayout appBarLayout2;
            int i11;
            int iD;
            if (i5 == 0) {
                appBarLayout2 = appBarLayout;
            } else {
                if (i5 < 0) {
                    i11 = -appBarLayout.g();
                    iD = appBarLayout.d() + i11;
                } else {
                    i11 = -appBarLayout.g();
                    iD = 0;
                }
                int i12 = i11;
                int i13 = iD;
                if (i12 != i13) {
                    appBarLayout2 = appBarLayout;
                    iArr[1] = z(coordinatorLayout, appBarLayout2, y() - i5, i12, i13);
                }
            }
            if (appBarLayout2.f34014k) {
                appBarLayout2.k(appBarLayout2.l(view));
            }
        }

        public final SavedState F(Parcelable parcelable, AppBarLayout appBarLayout) {
            int iW = w();
            int childCount = appBarLayout.getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = appBarLayout.getChildAt(i5);
                int bottom = childAt.getBottom() + iW;
                if (childAt.getTop() + iW <= 0 && bottom >= 0) {
                    if (parcelable == null) {
                        parcelable = AbsSavedState.f14271b;
                    }
                    SavedState savedState = new SavedState(parcelable);
                    boolean z11 = iW == 0;
                    savedState.f34031d = z11;
                    savedState.f34030c = !z11 && (-iW) >= appBarLayout.g();
                    savedState.f34032e = i5;
                    WeakHashMap weakHashMap = a1.f250a;
                    savedState.f34034g = bottom == appBarLayout.f() + childAt.getMinimumHeight();
                    savedState.f34033f = bottom / childAt.getHeight();
                    return savedState;
                }
            }
            return null;
        }

        public final void G(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout) {
            int paddingTop = appBarLayout.getPaddingTop() + appBarLayout.f();
            int iY = y() - paddingTop;
            int childCount = appBarLayout.getChildCount();
            int i5 = 0;
            while (true) {
                if (i5 >= childCount) {
                    i5 = -1;
                    break;
                }
                View childAt = appBarLayout.getChildAt(i5);
                int top = childAt.getTop();
                int bottom = childAt.getBottom();
                dj.b bVar = (dj.b) childAt.getLayoutParams();
                if ((bVar.f49242a & 32) == 32) {
                    top -= ((LinearLayout.LayoutParams) bVar).topMargin;
                    bottom += ((LinearLayout.LayoutParams) bVar).bottomMargin;
                }
                int i11 = -iY;
                if (top <= i11 && bottom >= i11) {
                    break;
                } else {
                    i5++;
                }
            }
            if (i5 >= 0) {
                View childAt2 = appBarLayout.getChildAt(i5);
                dj.b bVar2 = (dj.b) childAt2.getLayoutParams();
                int i12 = bVar2.f49242a;
                if ((i12 & 17) == 17) {
                    int iF = -childAt2.getTop();
                    int minimumHeight = -childAt2.getBottom();
                    if (i5 == 0) {
                        WeakHashMap weakHashMap = a1.f250a;
                        if (appBarLayout.getFitsSystemWindows() && childAt2.getFitsSystemWindows()) {
                            iF -= appBarLayout.f();
                        }
                    }
                    if ((i12 & 2) == 2) {
                        WeakHashMap weakHashMap2 = a1.f250a;
                        minimumHeight += childAt2.getMinimumHeight();
                    } else if ((i12 & 5) == 5) {
                        WeakHashMap weakHashMap3 = a1.f250a;
                        int minimumHeight2 = childAt2.getMinimumHeight() + minimumHeight;
                        if (iY < minimumHeight2) {
                            iF = minimumHeight2;
                        } else {
                            minimumHeight = minimumHeight2;
                        }
                    }
                    if ((i12 & 32) == 32) {
                        iF += ((LinearLayout.LayoutParams) bVar2).topMargin;
                        minimumHeight -= ((LinearLayout.LayoutParams) bVar2).bottomMargin;
                    }
                    if (iY < (minimumHeight + iF) / 2) {
                        iF = minimumHeight;
                    }
                    C(coordinatorLayout, appBarLayout, v4.a.f(iF + paddingTop, -appBarLayout.g(), 0));
                }
            }
        }

        @Override // dj.g, l4.b
        public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) {
            int iRound;
            AppBarLayout appBarLayout = (AppBarLayout) view;
            super.l(coordinatorLayout, appBarLayout, i5);
            int i11 = appBarLayout.f34009f;
            SavedState savedState = this.f34029m;
            if (savedState == null || (i11 & 8) != 0) {
                if (i11 != 0) {
                    boolean z11 = (i11 & 4) != 0;
                    if ((i11 & 2) != 0) {
                        int i12 = -appBarLayout.g();
                        if (z11) {
                            C(coordinatorLayout, appBarLayout, i12);
                        } else {
                            A(coordinatorLayout, appBarLayout, i12);
                        }
                    } else if ((i11 & 1) != 0) {
                        if (z11) {
                            C(coordinatorLayout, appBarLayout, 0);
                        } else {
                            A(coordinatorLayout, appBarLayout, 0);
                        }
                    }
                }
            } else if (savedState.f34030c) {
                A(coordinatorLayout, appBarLayout, -appBarLayout.g());
            } else if (savedState.f34031d) {
                A(coordinatorLayout, appBarLayout, 0);
            } else {
                View childAt = appBarLayout.getChildAt(savedState.f34032e);
                int i13 = -childAt.getBottom();
                if (this.f34029m.f34034g) {
                    WeakHashMap weakHashMap = a1.f250a;
                    iRound = appBarLayout.f() + childAt.getMinimumHeight() + i13;
                } else {
                    iRound = Math.round(childAt.getHeight() * this.f34029m.f34033f) + i13;
                }
                A(coordinatorLayout, appBarLayout, iRound);
            }
            appBarLayout.f34009f = 0;
            this.f34029m = null;
            int iF = v4.a.f(w(), -appBarLayout.g(), 0);
            h hVar = this.f49259a;
            if (hVar != null) {
                hVar.b(iF);
            } else {
                this.f49260b = iF;
            }
            H(coordinatorLayout, appBarLayout, w(), 0, true);
            appBarLayout.i(w());
            if (a1.b(coordinatorLayout) != null) {
                return true;
            }
            a1.k(coordinatorLayout, new b(coordinatorLayout, this, appBarLayout));
            return true;
        }

        @Override // l4.b
        public final boolean m(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12) {
            AppBarLayout appBarLayout = (AppBarLayout) view;
            if (((ViewGroup.MarginLayoutParams) ((e) appBarLayout.getLayoutParams())).height != -2) {
                return false;
            }
            coordinatorLayout.s(i5, i11, View.MeasureSpec.makeMeasureSpec(0, 0), appBarLayout);
            return true;
        }

        @Override // l4.b
        public final /* bridge */ /* synthetic */ void o(CoordinatorLayout coordinatorLayout, View view, View view2, int i5, int i11, int[] iArr, int i12) {
            E(coordinatorLayout, (AppBarLayout) view, view2, i11, iArr);
        }

        @Override // l4.b
        public final void p(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12, int[] iArr) {
            CoordinatorLayout coordinatorLayout2;
            AppBarLayout appBarLayout = (AppBarLayout) view;
            if (i12 < 0) {
                coordinatorLayout2 = coordinatorLayout;
                iArr[1] = z(coordinatorLayout2, appBarLayout, y() - i12, -appBarLayout.e(), 0);
            } else {
                coordinatorLayout2 = coordinatorLayout;
            }
            if (i12 == 0 && a1.b(coordinatorLayout2) == null) {
                a1.k(coordinatorLayout2, new b(coordinatorLayout2, this, appBarLayout));
            }
        }

        @Override // l4.b
        public final void r(View view, Parcelable parcelable) {
            if (parcelable instanceof SavedState) {
                this.f34029m = (SavedState) parcelable;
            } else {
                this.f34029m = null;
            }
        }

        @Override // l4.b
        public final Parcelable s(View view) {
            android.view.AbsSavedState absSavedState = View.BaseSavedState.EMPTY_STATE;
            SavedState savedStateF = F(absSavedState, (AppBarLayout) view);
            return savedStateF == null ? absSavedState : savedStateF;
        }

        @Override // l4.b
        public final boolean t(CoordinatorLayout coordinatorLayout, View view, View view2, int i5, int i11) {
            ValueAnimator valueAnimator;
            AppBarLayout appBarLayout = (AppBarLayout) view;
            boolean z11 = (i5 & 2) != 0 && (appBarLayout.f34014k || (appBarLayout.g() != 0 && coordinatorLayout.getHeight() - view2.getHeight() <= appBarLayout.getHeight()));
            if (z11 && (valueAnimator = this.f34028l) != null) {
                valueAnimator.cancel();
            }
            this.n = null;
            this.f34027k = i11;
            return z11;
        }

        @Override // l4.b
        public final void u(CoordinatorLayout coordinatorLayout, View view, View view2, int i5) {
            AppBarLayout appBarLayout = (AppBarLayout) view;
            if (this.f34027k == 0 || i5 == 1) {
                G(coordinatorLayout, appBarLayout);
                if (appBarLayout.f34014k) {
                    appBarLayout.k(appBarLayout.l(view2));
                }
            }
            this.n = new WeakReference(view2);
        }

        @Override // dj.e
        public final int y() {
            return w() + this.f34026j;
        }

        /* JADX WARN: Removed duplicated region for block: B:33:0x0096  */
        /* JADX WARN: Removed duplicated region for block: B:34:0x009b  */
        /* JADX WARN: Removed duplicated region for block: B:37:0x00a7  */
        /* JADX WARN: Removed duplicated region for block: B:59:0x0153  */
        /* JADX WARN: Removed duplicated region for block: B:60:0x0155  */
        @Override // dj.e
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final int z(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12) {
            int top;
            h hVar;
            boolean zB;
            int iF;
            AppBarLayout appBarLayout = (AppBarLayout) view;
            int iY = y();
            int i13 = 0;
            if (i11 == 0 || iY < i11 || iY > i12) {
                this.f34026j = 0;
            } else {
                int iF2 = v4.a.f(i5, i11, i12);
                if (iY != iF2) {
                    if (appBarLayout.f34008e) {
                        int iAbs = Math.abs(iF2);
                        int childCount = appBarLayout.getChildCount();
                        int i14 = 0;
                        while (true) {
                            if (i14 >= childCount) {
                                break;
                            }
                            View childAt = appBarLayout.getChildAt(i14);
                            dj.b bVar = (dj.b) childAt.getLayoutParams();
                            Interpolator interpolator = bVar.f49244c;
                            if (iAbs < childAt.getTop() || iAbs > childAt.getBottom()) {
                                i14++;
                            } else if (interpolator != null) {
                                int i15 = bVar.f49242a;
                                if ((i15 & 1) != 0) {
                                    iF = childAt.getHeight() + ((LinearLayout.LayoutParams) bVar).topMargin + ((LinearLayout.LayoutParams) bVar).bottomMargin;
                                    if ((i15 & 2) != 0) {
                                        WeakHashMap weakHashMap = a1.f250a;
                                        iF -= childAt.getMinimumHeight();
                                    }
                                } else {
                                    iF = 0;
                                }
                                WeakHashMap weakHashMap2 = a1.f250a;
                                if (childAt.getFitsSystemWindows()) {
                                    iF -= appBarLayout.f();
                                }
                                if (iF > 0) {
                                    float f11 = iF;
                                    top = (childAt.getTop() + Math.round(interpolator.getInterpolation((iAbs - childAt.getTop()) / f11) * f11)) * Integer.signum(iF2);
                                }
                            }
                        }
                        top = iF2;
                        hVar = this.f49259a;
                        if (hVar == null) {
                            zB = hVar.b(top);
                        } else {
                            this.f49260b = top;
                            zB = false;
                        }
                        int i16 = iY - iF2;
                        this.f34026j = iF2 - top;
                        int i17 = 1;
                        if (zB) {
                            int i18 = 0;
                            while (i18 < appBarLayout.getChildCount()) {
                                dj.b bVar2 = (dj.b) appBarLayout.getChildAt(i18).getLayoutParams();
                                io.sentry.internal.debugmeta.c cVar = bVar2.f49243b;
                                if (cVar != null && (bVar2.f49242a & i17) != 0) {
                                    View childAt2 = appBarLayout.getChildAt(i18);
                                    float fW = w();
                                    Rect rect = (Rect) cVar.f67328b;
                                    Rect rect2 = (Rect) cVar.f67327a;
                                    childAt2.getDrawingRect(rect2);
                                    appBarLayout.offsetDescendantRectToMyCoords(childAt2, rect2);
                                    rect2.offset(0, -appBarLayout.f());
                                    float fAbs = rect2.top - Math.abs(fW);
                                    if (fAbs <= 0.0f) {
                                        float fE = 1.0f - v4.a.e(Math.abs(fAbs / rect2.height()), 0.0f, 1.0f);
                                        float fHeight = (-fAbs) - ((rect2.height() * 0.3f) * (1.0f - (fE * fE)));
                                        childAt2.setTranslationY(fHeight);
                                        childAt2.getDrawingRect(rect);
                                        rect.offset(0, (int) (-fHeight));
                                        if (fHeight >= rect.height()) {
                                            childAt2.setVisibility(4);
                                        } else {
                                            childAt2.setVisibility(0);
                                        }
                                        WeakHashMap weakHashMap3 = a1.f250a;
                                        childAt2.setClipBounds(rect);
                                    } else {
                                        WeakHashMap weakHashMap4 = a1.f250a;
                                        childAt2.setClipBounds(null);
                                        childAt2.setTranslationY(0.0f);
                                        childAt2.setVisibility(0);
                                    }
                                }
                                i18++;
                                i17 = 1;
                            }
                        }
                        if (!zB && appBarLayout.f34008e) {
                            coordinatorLayout.i(appBarLayout);
                        }
                        appBarLayout.i(w());
                        H(coordinatorLayout, appBarLayout, iF2, iF2 >= iY ? -1 : 1, false);
                        i13 = i16;
                    } else {
                        top = iF2;
                        hVar = this.f49259a;
                        if (hVar == null) {
                        }
                        int i162 = iY - iF2;
                        this.f34026j = iF2 - top;
                        int i172 = 1;
                        if (zB) {
                        }
                        if (!zB) {
                            coordinatorLayout.i(appBarLayout);
                        }
                        appBarLayout.i(w());
                        H(coordinatorLayout, appBarLayout, iF2, iF2 >= iY ? -1 : 1, false);
                        i13 = i162;
                    }
                }
            }
            if (a1.b(coordinatorLayout) != null) {
                return i13;
            }
            a1.k(coordinatorLayout, new b(coordinatorLayout, this, appBarLayout));
            return i13;
        }

        public BaseBehavior(Context context, AttributeSet attributeSet) {
            super(0);
            this.f49251f = -1;
            this.f49253h = -1;
        }
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final LinearLayout.LayoutParams generateDefaultLayoutParams() {
        dj.b bVar = new dj.b(-1, -2);
        bVar.f49242a = 1;
        return bVar;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final /* bridge */ /* synthetic */ LinearLayout.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return c(layoutParams);
    }
}
