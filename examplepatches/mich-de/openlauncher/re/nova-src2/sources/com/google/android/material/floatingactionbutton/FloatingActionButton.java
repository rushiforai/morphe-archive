package com.google.android.material.floatingactionbutton;

import a5.a1;
import android.animation.Animator;
import android.animation.AnimatorSet;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Matrix;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ImageView;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.z;
import bk.g;
import bk.u;
import cj.e;
import com.google.android.gms.internal.consent_sdk.k0;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.stateful.ExtendableSavedState;
import io.branch.requery.android.database.sqlite.y;
import java.util.ArrayList;
import java.util.WeakHashMap;
import l4.b;
import ps.f0;
import q.c;
import qj.a;
import tj.i;
import tj.j;

/* loaded from: classes3.dex */
public class FloatingActionButton extends j implements a, u, l4.a {

    /* renamed from: b, reason: collision with root package name */
    public ColorStateList f34282b;

    /* renamed from: c, reason: collision with root package name */
    public PorterDuff.Mode f34283c;

    /* renamed from: d, reason: collision with root package name */
    public final int f34284d;

    /* renamed from: e, reason: collision with root package name */
    public final int f34285e;

    /* renamed from: f, reason: collision with root package name */
    public int f34286f;

    /* renamed from: g, reason: collision with root package name */
    public final int f34287g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f34288h;

    /* renamed from: i, reason: collision with root package name */
    public final Rect f34289i;

    /* renamed from: j, reason: collision with root package name */
    public final Rect f34290j;

    /* renamed from: k, reason: collision with root package name */
    public final ag f34291k;

    /* renamed from: l, reason: collision with root package name */
    public final y f34292l;

    /* renamed from: m, reason: collision with root package name */
    public rj.j f34293m;

    public static class Behavior extends BaseBehavior<FloatingActionButton> {
        public Behavior() {
        }

        public Behavior(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }
    }

    public FloatingActionButton(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        Drawable drawable;
        Drawable layerDrawable;
        super(hk.a.a(context, attributeSet, 2130969227, 2132083759), attributeSet, 2130969227);
        this.f89397a = getVisibility();
        this.f34289i = new Rect();
        this.f34290j = new Rect();
        Context context2 = getContext();
        TypedArray typedArrayF = i.f(context2, attributeSet, bj.a.n, 2130969227, 2132083759, new int[0]);
        this.f34282b = f0.m(context2, typedArrayF, 1);
        this.f34283c = i.g(typedArrayF.getInt(2, -1), null);
        ColorStateList colorStateListM = f0.m(context2, typedArrayF, 12);
        this.f34284d = typedArrayF.getInt(7, -1);
        this.f34285e = typedArrayF.getDimensionPixelSize(6, 0);
        int dimensionPixelSize = typedArrayF.getDimensionPixelSize(3, 0);
        float dimension = typedArrayF.getDimension(4, 0.0f);
        float dimension2 = typedArrayF.getDimension(9, 0.0f);
        float dimension3 = typedArrayF.getDimension(11, 0.0f);
        this.f34288h = typedArrayF.getBoolean(16, false);
        int dimensionPixelSize2 = getResources().getDimensionPixelSize(2131166191);
        int dimensionPixelSize3 = typedArrayF.getDimensionPixelSize(10, 0);
        this.f34287g = dimensionPixelSize3;
        rj.j jVarE = e();
        if (jVarE.o != dimensionPixelSize3) {
            jVarE.o = dimensionPixelSize3;
            float f11 = jVarE.n;
            jVarE.n = f11;
            Matrix matrix = jVarE.f86011v;
            jVarE.a(f11, matrix);
            jVarE.f86006q.setImageMatrix(matrix);
        }
        e eVarA = e.a(context2, typedArrayF, 15);
        e eVarA2 = e.a(context2, typedArrayF, 8);
        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, bj.a.f17937z, 2130969227, 2132083759);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(1, 0);
        typedArrayObtainStyledAttributes.recycle();
        bk.j jVarA = bk.j.b(context2, resourceId, resourceId2, bk.j.f18002m).a();
        boolean z11 = typedArrayF.getBoolean(5, false);
        setEnabled(typedArrayF.getBoolean(0, true));
        typedArrayF.recycle();
        ag agVar = new ag(this);
        this.f34291k = agVar;
        agVar.k(attributeSet, 2130969227);
        y yVar = new y();
        yVar.f61880a = false;
        yVar.f61881b = 0;
        yVar.f61882c = this;
        this.f34292l = yVar;
        e().g(jVarA);
        rj.j jVarE2 = e();
        ColorStateList colorStateList = this.f34282b;
        PorterDuff.Mode mode = this.f34283c;
        FloatingActionButton floatingActionButton = jVarE2.f86006q;
        bk.j jVar = jVarE2.f85992a;
        jVar.getClass();
        rj.i iVar = new rj.i(jVar);
        jVarE2.f85993b = iVar;
        iVar.setTintList(colorStateList);
        if (mode != null) {
            jVarE2.f85993b.setTintMode(mode);
        }
        jVarE2.f85993b.j(floatingActionButton.getContext());
        if (dimensionPixelSize > 0) {
            Context context3 = floatingActionButton.getContext();
            bk.j jVar2 = jVarE2.f85992a;
            jVar2.getClass();
            rj.a aVar = new rj.a(jVar2);
            int color = context3.getColor(2131099899);
            int color2 = context3.getColor(2131099898);
            int color3 = context3.getColor(2131099896);
            int color4 = context3.getColor(2131099897);
            aVar.f85959i = color;
            aVar.f85960j = color2;
            aVar.f85961k = color3;
            aVar.f85962l = color4;
            float f12 = dimensionPixelSize;
            if (aVar.f85958h != f12) {
                aVar.f85958h = f12;
                aVar.f85952b.setStrokeWidth(f12 * 1.3333f);
                aVar.n = true;
                aVar.invalidateSelf();
            }
            if (colorStateList != null) {
                aVar.f85963m = colorStateList.getColorForState(aVar.getState(), aVar.f85963m);
            }
            aVar.f85964p = colorStateList;
            aVar.n = true;
            aVar.invalidateSelf();
            jVarE2.f85995d = aVar;
            rj.a aVar2 = jVarE2.f85995d;
            aVar2.getClass();
            g gVar = jVarE2.f85993b;
            gVar.getClass();
            layerDrawable = new LayerDrawable(new Drawable[]{aVar2, gVar});
            drawable = null;
        } else {
            drawable = null;
            jVarE2.f85995d = null;
            layerDrawable = jVarE2.f85993b;
        }
        RippleDrawable rippleDrawable = new RippleDrawable(zj.a.a(colorStateListM), layerDrawable, drawable);
        jVarE2.f85994c = rippleDrawable;
        jVarE2.f85996e = rippleDrawable;
        e().f86001j = dimensionPixelSize2;
        rj.j jVarE3 = e();
        if (jVarE3.f85998g != dimension) {
            jVarE3.f85998g = dimension;
            jVarE3.f(dimension, jVarE3.f85999h, jVarE3.f86000i);
        }
        rj.j jVarE4 = e();
        if (jVarE4.f85999h != dimension2) {
            jVarE4.f85999h = dimension2;
            jVarE4.f(jVarE4.f85998g, dimension2, jVarE4.f86000i);
        }
        rj.j jVarE5 = e();
        if (jVarE5.f86000i != dimension3) {
            jVarE5.f86000i = dimension3;
            jVarE5.f(jVarE5.f85998g, jVarE5.f85999h, dimension3);
        }
        e().f86003l = eVarA;
        e().f86004m = eVarA2;
        e().f85997f = z11;
        setScaleType(ImageView.ScaleType.MATRIX);
    }

    @Override // l4.a
    public final b a() {
        return new Behavior();
    }

    @Override // bk.u
    public final void c(bk.j jVar) {
        e().g(jVar);
    }

    @Override // android.widget.ImageView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        rj.j jVarE = e();
        getDrawableState();
        jVarE.getClass();
    }

    public final rj.j e() {
        if (this.f34293m == null) {
            this.f34293m = new rj.j(this, new c(this, 19));
        }
        return this.f34293m;
    }

    public final int f(int i5) {
        int i11 = this.f34285e;
        if (i11 != 0) {
            return i11;
        }
        Resources resources = getResources();
        return i5 != -1 ? i5 != 1 ? resources.getDimensionPixelSize(2131165391) : resources.getDimensionPixelSize(2131165390) : Math.max(resources.getConfiguration().screenWidthDp, resources.getConfiguration().screenHeightDp) < 470 ? f(1) : f(0);
    }

    public final void g(boolean z11) {
        rj.j jVarE = e();
        FloatingActionButton floatingActionButton = jVarE.f86006q;
        if (floatingActionButton.getVisibility() == 0) {
            if (jVarE.f86005p == 1) {
                return;
            }
        } else if (jVarE.f86005p != 2) {
            return;
        }
        Animator animator = jVarE.f86002k;
        if (animator != null) {
            animator.cancel();
        }
        FloatingActionButton floatingActionButton2 = jVarE.f86006q;
        WeakHashMap weakHashMap = a1.f250a;
        if (!floatingActionButton2.isLaidOut() || floatingActionButton2.isInEditMode()) {
            floatingActionButton.b(z11 ? 8 : 4, z11);
            return;
        }
        e eVar = jVarE.f86004m;
        AnimatorSet animatorSetB = eVar != null ? jVarE.b(eVar, 0.0f, 0.0f, 0.0f) : jVarE.c(0.0f, 0.4f, 0.4f, rj.j.A, rj.j.B);
        animatorSetB.addListener(new rj.b(jVarE, z11));
        animatorSetB.start();
    }

    @Override // android.view.View
    public final ColorStateList getBackgroundTintList() {
        return this.f34282b;
    }

    @Override // android.view.View
    public final PorterDuff.Mode getBackgroundTintMode() {
        return this.f34283c;
    }

    public final void h(boolean z11) {
        rj.j jVarE = e();
        FloatingActionButton floatingActionButton = jVarE.f86006q;
        Matrix matrix = jVarE.f86011v;
        FloatingActionButton floatingActionButton2 = jVarE.f86006q;
        if (floatingActionButton.getVisibility() != 0) {
            if (jVarE.f86005p == 2) {
                return;
            }
        } else if (jVarE.f86005p != 1) {
            return;
        }
        Animator animator = jVarE.f86002k;
        if (animator != null) {
            animator.cancel();
        }
        boolean z12 = jVarE.f86003l == null;
        WeakHashMap weakHashMap = a1.f250a;
        if (!floatingActionButton2.isLaidOut() || floatingActionButton2.isInEditMode()) {
            floatingActionButton.b(0, z11);
            floatingActionButton.setAlpha(1.0f);
            floatingActionButton.setScaleY(1.0f);
            floatingActionButton.setScaleX(1.0f);
            jVarE.n = 1.0f;
            jVarE.a(1.0f, matrix);
            floatingActionButton2.setImageMatrix(matrix);
            return;
        }
        if (floatingActionButton.getVisibility() != 0) {
            floatingActionButton.setAlpha(0.0f);
            floatingActionButton.setScaleY(z12 ? 0.4f : 0.0f);
            floatingActionButton.setScaleX(z12 ? 0.4f : 0.0f);
            float f11 = z12 ? 0.4f : 0.0f;
            jVarE.n = f11;
            jVarE.a(f11, matrix);
            floatingActionButton2.setImageMatrix(matrix);
        }
        e eVar = jVarE.f86003l;
        AnimatorSet animatorSetB = eVar != null ? jVarE.b(eVar, 1.0f, 1.0f, 1.0f) : jVarE.c(1.0f, 1.0f, 1.0f, rj.j.f85990y, rj.j.f85991z);
        animatorSetB.addListener(new z(jVarE, z11, 4));
        animatorSetB.start();
    }

    @Override // android.widget.ImageView, android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        e().getClass();
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        rj.j jVarE = e();
        FloatingActionButton floatingActionButton = jVarE.f86006q;
        g gVar = jVarE.f85993b;
        if (gVar != null) {
            k0.E(floatingActionButton, gVar);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        e().f86006q.getViewTreeObserver();
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onMeasure(int i5, int i11) {
        int iF = f(this.f34284d);
        this.f34286f = (iF - this.f34287g) / 2;
        e().i();
        int iMin = Math.min(View.resolveSize(iF, i5), View.resolveSize(iF, i11));
        Rect rect = this.f34289i;
        setMeasuredDimension(rect.left + iMin + rect.right, iMin + rect.top + rect.bottom);
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof ExtendableSavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        ExtendableSavedState extendableSavedState = (ExtendableSavedState) parcelable;
        super.onRestoreInstanceState(extendableSavedState.f14272a);
        Bundle bundle = (Bundle) extendableSavedState.f34360c.get("expandableWidgetHelper");
        bundle.getClass();
        y yVar = this.f34292l;
        yVar.getClass();
        yVar.f61880a = bundle.getBoolean("expanded", false);
        yVar.f61881b = bundle.getInt("expandedComponentIdHint", 0);
        if (yVar.f61880a) {
            FloatingActionButton floatingActionButton = (FloatingActionButton) yVar.f61882c;
            ViewParent parent = floatingActionButton.getParent();
            if (parent instanceof CoordinatorLayout) {
                ((CoordinatorLayout) parent).i(floatingActionButton);
            }
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        Parcelable parcelableOnSaveInstanceState = super.onSaveInstanceState();
        if (parcelableOnSaveInstanceState == null) {
            parcelableOnSaveInstanceState = new Bundle();
        }
        ExtendableSavedState extendableSavedState = new ExtendableSavedState(parcelableOnSaveInstanceState);
        y yVar = this.f34292l;
        yVar.getClass();
        Bundle bundle = new Bundle();
        bundle.putBoolean("expanded", yVar.f61880a);
        bundle.putInt("expandedComponentIdHint", yVar.f61881b);
        extendableSavedState.f34360c.put("expandableWidgetHelper", bundle);
        return extendableSavedState;
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        int iMax;
        if (motionEvent.getAction() == 0) {
            int measuredWidth = getMeasuredWidth();
            int measuredHeight = getMeasuredHeight();
            Rect rect = this.f34290j;
            rect.set(0, 0, measuredWidth, measuredHeight);
            int i5 = rect.left;
            Rect rect2 = this.f34289i;
            rect.left = i5 + rect2.left;
            rect.top += rect2.top;
            rect.right -= rect2.right;
            rect.bottom -= rect2.bottom;
            rj.j jVar = this.f34293m;
            if (jVar.f85997f) {
                int i11 = jVar.f86001j;
                FloatingActionButton floatingActionButton = jVar.f86006q;
                iMax = Math.max((i11 - floatingActionButton.f(floatingActionButton.f34284d)) / 2, 0);
            } else {
                iMax = 0;
            }
            int i12 = -iMax;
            rect.inset(i12, i12);
            if (!rect.contains((int) motionEvent.getX(), (int) motionEvent.getY())) {
                return false;
            }
        }
        return super.onTouchEvent(motionEvent);
    }

    @Override // android.view.View
    public final void setBackgroundColor(int i5) {
        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
    }

    @Override // android.view.View
    public final void setBackgroundDrawable(Drawable drawable) {
        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
    }

    @Override // android.view.View
    public final void setBackgroundResource(int i5) {
        Log.i("FloatingActionButton", "Setting a custom background is not supported.");
    }

    @Override // android.view.View
    public final void setBackgroundTintList(ColorStateList colorStateList) {
        if (this.f34282b != colorStateList) {
            this.f34282b = colorStateList;
            rj.j jVarE = e();
            g gVar = jVarE.f85993b;
            if (gVar != null) {
                gVar.setTintList(colorStateList);
            }
            rj.a aVar = jVarE.f85995d;
            if (aVar != null) {
                if (colorStateList != null) {
                    aVar.f85963m = colorStateList.getColorForState(aVar.getState(), aVar.f85963m);
                }
                aVar.f85964p = colorStateList;
                aVar.n = true;
                aVar.invalidateSelf();
            }
        }
    }

    @Override // android.view.View
    public final void setBackgroundTintMode(PorterDuff.Mode mode) {
        if (this.f34283c != mode) {
            this.f34283c = mode;
            g gVar = e().f85993b;
            if (gVar != null) {
                gVar.setTintMode(mode);
            }
        }
    }

    @Override // android.view.View
    public final void setElevation(float f11) {
        super.setElevation(f11);
        g gVar = e().f85993b;
        if (gVar != null) {
            gVar.k(f11);
        }
    }

    @Override // android.widget.ImageView
    public final void setImageDrawable(Drawable drawable) {
        if (getDrawable() != drawable) {
            super.setImageDrawable(drawable);
            rj.j jVarE = e();
            float f11 = jVarE.n;
            jVarE.n = f11;
            Matrix matrix = jVarE.f86011v;
            jVarE.a(f11, matrix);
            jVarE.f86006q.setImageMatrix(matrix);
        }
    }

    @Override // android.widget.ImageView
    public final void setImageResource(int i5) {
        this.f34291k.t(i5);
        Drawable drawable = getDrawable();
        if (drawable == null) {
            return;
        }
        drawable.clearColorFilter();
    }

    @Override // android.view.View
    public final void setScaleX(float f11) {
        super.setScaleX(f11);
        e().getClass();
    }

    @Override // android.view.View
    public final void setScaleY(float f11) {
        super.setScaleY(f11);
        e().getClass();
    }

    @Override // android.view.View
    public final void setTranslationX(float f11) {
        super.setTranslationX(f11);
        e().getClass();
    }

    @Override // android.view.View
    public final void setTranslationY(float f11) {
        super.setTranslationY(f11);
        e().getClass();
    }

    @Override // android.view.View
    public final void setTranslationZ(float f11) {
        super.setTranslationZ(f11);
        e().getClass();
    }

    @Override // android.widget.ImageView, android.view.View
    public final void setVisibility(int i5) {
        b(i5, true);
    }

    public static class BaseBehavior<T extends FloatingActionButton> extends b {

        /* renamed from: a, reason: collision with root package name */
        public Rect f34294a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f34295b;

        public BaseBehavior() {
            this.f34295b = true;
        }

        @Override // l4.b
        public final boolean e(View view, Rect rect) {
            FloatingActionButton floatingActionButton = (FloatingActionButton) view;
            Rect rect2 = floatingActionButton.f34289i;
            rect.set(floatingActionButton.getLeft() + rect2.left, floatingActionButton.getTop() + rect2.top, floatingActionButton.getRight() - rect2.right, floatingActionButton.getBottom() - rect2.bottom);
            return true;
        }

        @Override // l4.b
        public final void g(l4.e eVar) {
            if (eVar.f74703h == 0) {
                eVar.f74703h = 80;
            }
        }

        @Override // l4.b
        public final boolean h(CoordinatorLayout coordinatorLayout, View view, View view2) {
            FloatingActionButton floatingActionButton = (FloatingActionButton) view;
            if (view2 instanceof AppBarLayout) {
                w(coordinatorLayout, (AppBarLayout) view2, floatingActionButton);
            } else {
                ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                if (layoutParams instanceof l4.e ? ((l4.e) layoutParams).f74696a instanceof BottomSheetBehavior : false) {
                    x(view2, floatingActionButton);
                }
            }
            return false;
        }

        @Override // l4.b
        public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) {
            FloatingActionButton floatingActionButton = (FloatingActionButton) view;
            ArrayList arrayListK = coordinatorLayout.k(floatingActionButton);
            int size = arrayListK.size();
            int i11 = 0;
            for (int i12 = 0; i12 < size; i12++) {
                View view2 = (View) arrayListK.get(i12);
                if (!(view2 instanceof AppBarLayout)) {
                    ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
                    if ((layoutParams instanceof l4.e ? ((l4.e) layoutParams).f74696a instanceof BottomSheetBehavior : false) && x(view2, floatingActionButton)) {
                        break;
                    }
                } else {
                    if (w(coordinatorLayout, (AppBarLayout) view2, floatingActionButton)) {
                        break;
                    }
                }
            }
            coordinatorLayout.r(i5, floatingActionButton);
            Rect rect = floatingActionButton.f34289i;
            if (rect != null && rect.centerX() > 0 && rect.centerY() > 0) {
                l4.e eVar = (l4.e) floatingActionButton.getLayoutParams();
                int i13 = floatingActionButton.getRight() >= coordinatorLayout.getWidth() - ((ViewGroup.MarginLayoutParams) eVar).rightMargin ? rect.right : floatingActionButton.getLeft() <= ((ViewGroup.MarginLayoutParams) eVar).leftMargin ? -rect.left : 0;
                if (floatingActionButton.getBottom() >= coordinatorLayout.getHeight() - ((ViewGroup.MarginLayoutParams) eVar).bottomMargin) {
                    i11 = rect.bottom;
                } else if (floatingActionButton.getTop() <= ((ViewGroup.MarginLayoutParams) eVar).topMargin) {
                    i11 = -rect.top;
                }
                if (i11 != 0) {
                    WeakHashMap weakHashMap = a1.f250a;
                    floatingActionButton.offsetTopAndBottom(i11);
                }
                if (i13 != 0) {
                    WeakHashMap weakHashMap2 = a1.f250a;
                    floatingActionButton.offsetLeftAndRight(i13);
                }
            }
            return true;
        }

        /* JADX WARN: Removed duplicated region for block: B:16:0x0039 A[PHI: r1
          0x0039: PHI (r1v12 int) = (r1v3 int), (r1v6 int) binds: [B:15:0x0037, B:21:0x004e] A[DONT_GENERATE, DONT_INLINE]] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final boolean w(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, FloatingActionButton floatingActionButton) {
            int height;
            l4.e eVar = (l4.e) floatingActionButton.getLayoutParams();
            if (!this.f34295b || eVar.f74701f != appBarLayout.getId() || floatingActionButton.f89397a != 0) {
                return false;
            }
            if (this.f34294a == null) {
                this.f34294a = new Rect();
            }
            Rect rect = this.f34294a;
            tj.c.a(coordinatorLayout, appBarLayout, rect);
            int i5 = rect.bottom;
            int iF = appBarLayout.f();
            WeakHashMap weakHashMap = a1.f250a;
            int minimumHeight = appBarLayout.getMinimumHeight();
            if (minimumHeight == 0) {
                int childCount = appBarLayout.getChildCount();
                minimumHeight = childCount >= 1 ? appBarLayout.getChildAt(childCount - 1).getMinimumHeight() : 0;
                height = minimumHeight != 0 ? (minimumHeight * 2) + iF : appBarLayout.getHeight() / 3;
            }
            if (i5 <= height) {
                floatingActionButton.g(false);
            } else {
                floatingActionButton.h(false);
            }
            return true;
        }

        public final boolean x(View view, FloatingActionButton floatingActionButton) {
            l4.e eVar = (l4.e) floatingActionButton.getLayoutParams();
            if (!this.f34295b || eVar.f74701f != view.getId() || floatingActionButton.f89397a != 0) {
                return false;
            }
            if (view.getTop() < (floatingActionButton.getHeight() / 2) + ((ViewGroup.MarginLayoutParams) ((l4.e) floatingActionButton.getLayoutParams())).topMargin) {
                floatingActionButton.g(false);
                return true;
            }
            floatingActionButton.h(false);
            return true;
        }

        public BaseBehavior(Context context, AttributeSet attributeSet) {
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.o);
            this.f34295b = typedArrayObtainStyledAttributes.getBoolean(0, true);
            typedArrayObtainStyledAttributes.recycle();
        }
    }
}
