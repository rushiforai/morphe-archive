package androidx.coordinatorlayout.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;
import defpackage.aec;
import defpackage.da2;
import defpackage.ea2;
import defpackage.fa2;
import defpackage.fue;
import defpackage.ga2;
import defpackage.ha2;
import defpackage.ia2;
import defpackage.js4;
import defpackage.mte;
import defpackage.n0c;
import defpackage.od8;
import defpackage.pd8;
import defpackage.qd8;
import defpackage.ute;
import defpackage.xc9;
import defpackage.ygf;
import defpackage.yra;
import defpackage.z4f;
import defpackage.zg7;
import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CoordinatorLayout extends ViewGroup implements od8, pd8 {
    public static final String t;
    public static final Class[] u;
    public static final ThreadLocal v;
    public static final js4 w;
    public static final xc9 x;
    public final ArrayList a;
    public final n0c b;
    public final ArrayList c;
    public final ArrayList d;
    public final int[] e;
    public final int[] f;
    public boolean g;
    public boolean h;
    public final int[] i;
    public View j;
    public View k;
    public ha2 l;
    public boolean m;
    public z4f n;
    public boolean o;
    public Drawable p;
    public ViewGroup.OnHierarchyChangeListener q;
    public zg7 r;
    public final qd8 s;

    static {
        Package r0 = CoordinatorLayout.class.getPackage();
        t = r0 != null ? r0.getName() : null;
        w = new js4(13);
        u = new Class[]{Context.class, AttributeSet.class};
        v = new ThreadLocal();
        x = new xc9();
    }

    public CoordinatorLayout(Context context, AttributeSet attributeSet) {
        CoordinatorLayout coordinatorLayout;
        Context context2;
        super(context, attributeSet, R.attr.coordinatorLayoutStyle);
        this.a = new ArrayList();
        this.b = new n0c(14);
        this.c = new ArrayList();
        this.d = new ArrayList();
        this.e = new int[2];
        this.f = new int[2];
        this.s = new qd8();
        int[] iArr = yra.a;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, R.attr.coordinatorLayoutStyle, 0);
        if (Build.VERSION.SDK_INT >= 29) {
            coordinatorLayout = this;
            context2 = context;
            coordinatorLayout.saveAttributeDataForStyleable(context2, iArr, attributeSet, typedArrayObtainStyledAttributes, R.attr.coordinatorLayoutStyle, 0);
        } else {
            coordinatorLayout = this;
            context2 = context;
        }
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        if (resourceId != 0) {
            Resources resources = context2.getResources();
            int[] intArray = resources.getIntArray(resourceId);
            coordinatorLayout.i = intArray;
            float f = resources.getDisplayMetrics().density;
            int length = intArray.length;
            for (int i = 0; i < length; i++) {
                coordinatorLayout.i[i] = (int) (r10[i] * f);
            }
        }
        coordinatorLayout.p = typedArrayObtainStyledAttributes.getDrawable(1);
        typedArrayObtainStyledAttributes.recycle();
        coordinatorLayout.p();
        super.setOnHierarchyChangeListener(new fa2(coordinatorLayout));
        WeakHashMap weakHashMap = ute.a;
        if (coordinatorLayout.getImportantForAccessibility() == 0) {
            coordinatorLayout.setImportantForAccessibility(1);
        }
    }

    public static Rect a() {
        Rect rect = (Rect) x.a();
        return rect == null ? new Rect() : rect;
    }

    public static void e(int i, Rect rect, Rect rect2, ga2 ga2Var, int i2, int i3) {
        int i4 = ga2Var.c;
        if (i4 == 0) {
            i4 = 17;
        }
        int absoluteGravity = Gravity.getAbsoluteGravity(i4, i);
        int i5 = ga2Var.d;
        if ((i5 & 7) == 0) {
            i5 |= 8388611;
        }
        if ((i5 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 0) {
            i5 |= 48;
        }
        int absoluteGravity2 = Gravity.getAbsoluteGravity(i5, i);
        int i6 = absoluteGravity & 7;
        int i7 = absoluteGravity & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
        int i8 = absoluteGravity2 & 7;
        int i9 = absoluteGravity2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
        int iWidth = i8 != 1 ? i8 != 5 ? rect.left : rect.right : rect.left + (rect.width() / 2);
        int iHeight = i9 != 16 ? i9 != 80 ? rect.top : rect.bottom : rect.top + (rect.height() / 2);
        if (i6 == 1) {
            iWidth -= i2 / 2;
        } else if (i6 != 5) {
            iWidth -= i2;
        }
        if (i7 == 16) {
            iHeight -= i3 / 2;
        } else if (i7 != 80) {
            iHeight -= i3;
        }
        rect2.set(iWidth, iHeight, i2 + iWidth, i3 + iHeight);
    }

    public static ga2 g(View view) {
        ga2 ga2Var = (ga2) view.getLayoutParams();
        if (!ga2Var.b) {
            ea2 ea2Var = null;
            for (Class<?> superclass = view.getClass(); superclass != null; superclass = superclass.getSuperclass()) {
                ea2Var = (ea2) superclass.getAnnotation(ea2.class);
                if (ea2Var != null) {
                    break;
                }
            }
            if (ea2Var != null) {
                try {
                    da2 da2Var = (da2) ea2Var.value().getDeclaredConstructor(null).newInstance(null);
                    da2 da2Var2 = ga2Var.a;
                    if (da2Var2 != da2Var) {
                        if (da2Var2 != null) {
                            da2Var2.i();
                        }
                        ga2Var.a = da2Var;
                        ga2Var.b = true;
                        if (da2Var != null) {
                            da2Var.g(ga2Var);
                        }
                    }
                } catch (Exception e) {
                    Log.e("CoordinatorLayout", "Default behavior class " + ea2Var.value().getName() + " could not be instantiated. Did you forget a default constructor?", e);
                }
            }
            ga2Var.b = true;
        }
        return ga2Var;
    }

    public static void n(View view, int i) {
        ga2 ga2Var = (ga2) view.getLayoutParams();
        int i2 = ga2Var.i;
        if (i2 != i) {
            WeakHashMap weakHashMap = ute.a;
            view.offsetLeftAndRight(i - i2);
            ga2Var.i = i;
        }
    }

    public static void o(View view, int i) {
        ga2 ga2Var = (ga2) view.getLayoutParams();
        int i2 = ga2Var.j;
        if (i2 != i) {
            WeakHashMap weakHashMap = ute.a;
            view.offsetTopAndBottom(i - i2);
            ga2Var.j = i;
        }
    }

    public final void b(ga2 ga2Var, Rect rect, int i, int i2) {
        int width = getWidth();
        int height = getHeight();
        int iMax = Math.max(getPaddingLeft() + ((ViewGroup.MarginLayoutParams) ga2Var).leftMargin, Math.min(rect.left, ((width - getPaddingRight()) - i) - ((ViewGroup.MarginLayoutParams) ga2Var).rightMargin));
        int iMax2 = Math.max(getPaddingTop() + ((ViewGroup.MarginLayoutParams) ga2Var).topMargin, Math.min(rect.top, ((height - getPaddingBottom()) - i2) - ((ViewGroup.MarginLayoutParams) ga2Var).bottomMargin));
        rect.set(iMax, iMax2, i + iMax, i2 + iMax2);
    }

    public final void c(View view, Rect rect, boolean z) {
        if (view.isLayoutRequested() || view.getVisibility() == 8) {
            rect.setEmpty();
        } else if (z) {
            fue.a(this, view, rect);
        } else {
            rect.set(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        }
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof ga2) && super.checkLayoutParams(layoutParams);
    }

    public final ArrayList d(View view) {
        aec aecVar = (aec) this.b.c;
        int i = aecVar.c;
        ArrayList arrayList = null;
        for (int i2 = 0; i2 < i; i2++) {
            ArrayList arrayList2 = (ArrayList) aecVar.i(i2);
            if (arrayList2 != null && arrayList2.contains(view)) {
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                arrayList.add(aecVar.f(i2));
            }
        }
        ArrayList arrayList3 = this.d;
        arrayList3.clear();
        if (arrayList != null) {
            arrayList3.addAll(arrayList);
        }
        return arrayList3;
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j) {
        da2 da2Var = ((ga2) view.getLayoutParams()).a;
        if (da2Var != null) {
            da2Var.getClass();
        }
        return super.drawChild(canvas, view, j);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        Drawable drawable = this.p;
        if ((drawable == null || !drawable.isStateful()) ? false : drawable.setState(drawableState)) {
            invalidate();
        }
    }

    public final int f(int i) {
        int[] iArr = this.i;
        if (iArr == null) {
            Log.e("CoordinatorLayout", "No keylines defined for " + this + " - attempted index lookup " + i);
            return 0;
        }
        if (i >= 0 && i < iArr.length) {
            return iArr[i];
        }
        Log.e("CoordinatorLayout", "Keyline index " + i + " out of range for " + this);
        return 0;
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new ga2();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof ga2 ? new ga2((ga2) layoutParams) : layoutParams instanceof ViewGroup.MarginLayoutParams ? new ga2((ViewGroup.MarginLayoutParams) layoutParams) : new ga2(layoutParams);
    }

    public final List<View> getDependencySortedChildren() {
        l();
        return DesugarCollections.unmodifiableList(this.a);
    }

    public final z4f getLastWindowInsets() {
        return this.n;
    }

    @Override // android.view.ViewGroup
    public int getNestedScrollAxes() {
        qd8 qd8Var = this.s;
        return qd8Var.b | qd8Var.a;
    }

    public Drawable getStatusBarBackground() {
        return this.p;
    }

    @Override // android.view.View
    public int getSuggestedMinimumHeight() {
        return Math.max(super.getSuggestedMinimumHeight(), getPaddingBottom() + getPaddingTop());
    }

    @Override // android.view.View
    public int getSuggestedMinimumWidth() {
        return Math.max(super.getSuggestedMinimumWidth(), getPaddingRight() + getPaddingLeft());
    }

    public final boolean h(View view, int i, int i2) {
        xc9 xc9Var = x;
        Rect rectA = a();
        fue.a(this, view, rectA);
        try {
            return rectA.contains(i, i2);
        } finally {
            rectA.setEmpty();
            xc9Var.c(rectA);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00de  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void i(int r23) {
        /*
            Method dump skipped, instruction units count: 732
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.coordinatorlayout.widget.CoordinatorLayout.i(int):void");
    }

    public final void j(View view, int i) {
        Rect rectA;
        Rect rectA2;
        ga2 ga2Var = (ga2) view.getLayoutParams();
        View view2 = ga2Var.k;
        if (view2 == null && ga2Var.f != -1) {
            ygf.f("An anchor may not be changed after CoordinatorLayout measurement begins before layout is complete.");
            return;
        }
        xc9 xc9Var = x;
        if (view2 != null) {
            rectA = a();
            rectA2 = a();
            try {
                fue.a(this, view2, rectA);
                ga2 ga2Var2 = (ga2) view.getLayoutParams();
                int measuredWidth = view.getMeasuredWidth();
                int measuredHeight = view.getMeasuredHeight();
                e(i, rectA, rectA2, ga2Var2, measuredWidth, measuredHeight);
                b(ga2Var2, rectA2, measuredWidth, measuredHeight);
                view.layout(rectA2.left, rectA2.top, rectA2.right, rectA2.bottom);
                return;
            } finally {
                rectA.setEmpty();
                xc9Var.c(rectA);
                rectA2.setEmpty();
                xc9Var.c(rectA2);
            }
        }
        int i2 = ga2Var.e;
        if (i2 < 0) {
            ga2 ga2Var3 = (ga2) view.getLayoutParams();
            rectA = a();
            rectA.set(getPaddingLeft() + ((ViewGroup.MarginLayoutParams) ga2Var3).leftMargin, getPaddingTop() + ((ViewGroup.MarginLayoutParams) ga2Var3).topMargin, (getWidth() - getPaddingRight()) - ((ViewGroup.MarginLayoutParams) ga2Var3).rightMargin, (getHeight() - getPaddingBottom()) - ((ViewGroup.MarginLayoutParams) ga2Var3).bottomMargin);
            if (this.n != null) {
                WeakHashMap weakHashMap = ute.a;
                if (getFitsSystemWindows() && !view.getFitsSystemWindows()) {
                    rectA.left = this.n.b() + rectA.left;
                    rectA.top = this.n.d() + rectA.top;
                    rectA.right -= this.n.c();
                    rectA.bottom -= this.n.a();
                }
            }
            rectA2 = a();
            int i3 = ga2Var3.c;
            if ((i3 & 7) == 0) {
                i3 |= 8388611;
            }
            if ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 0) {
                i3 |= 48;
            }
            Gravity.apply(i3, view.getMeasuredWidth(), view.getMeasuredHeight(), rectA, rectA2, i);
            view.layout(rectA2.left, rectA2.top, rectA2.right, rectA2.bottom);
            return;
        }
        ga2 ga2Var4 = (ga2) view.getLayoutParams();
        int i4 = ga2Var4.c;
        if (i4 == 0) {
            i4 = 8388661;
        }
        int absoluteGravity = Gravity.getAbsoluteGravity(i4, i);
        int i5 = absoluteGravity & 7;
        int i6 = absoluteGravity & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
        int width = getWidth();
        int height = getHeight();
        int measuredWidth2 = view.getMeasuredWidth();
        int measuredHeight2 = view.getMeasuredHeight();
        if (i == 1) {
            i2 = width - i2;
        }
        int iF = f(i2) - measuredWidth2;
        if (i5 == 1) {
            iF += measuredWidth2 / 2;
        } else if (i5 == 5) {
            iF += measuredWidth2;
        }
        int i7 = i6 != 16 ? i6 != 80 ? 0 : measuredHeight2 : measuredHeight2 / 2;
        int iMax = Math.max(getPaddingLeft() + ((ViewGroup.MarginLayoutParams) ga2Var4).leftMargin, Math.min(iF, ((width - getPaddingRight()) - measuredWidth2) - ((ViewGroup.MarginLayoutParams) ga2Var4).rightMargin));
        int iMax2 = Math.max(getPaddingTop() + ((ViewGroup.MarginLayoutParams) ga2Var4).topMargin, Math.min(i7, ((height - getPaddingBottom()) - measuredHeight2) - ((ViewGroup.MarginLayoutParams) ga2Var4).bottomMargin));
        view.layout(iMax, iMax2, measuredWidth2 + iMax, measuredHeight2 + iMax2);
    }

    public final boolean k(MotionEvent motionEvent, int i) {
        int actionMasked = motionEvent.getActionMasked();
        ArrayList arrayList = this.c;
        arrayList.clear();
        boolean zIsChildrenDrawingOrderEnabled = isChildrenDrawingOrderEnabled();
        int childCount = getChildCount();
        for (int i2 = childCount - 1; i2 >= 0; i2--) {
            arrayList.add(getChildAt(zIsChildrenDrawingOrderEnabled ? getChildDrawingOrder(childCount, i2) : i2));
        }
        js4 js4Var = w;
        if (js4Var != null) {
            Collections.sort(arrayList, js4Var);
        }
        int size = arrayList.size();
        MotionEvent motionEventObtain = null;
        boolean zJ = false;
        for (int i3 = 0; i3 < size; i3++) {
            View view = (View) arrayList.get(i3);
            da2 da2Var = ((ga2) view.getLayoutParams()).a;
            if (zJ && actionMasked != 0) {
                if (da2Var != null) {
                    if (motionEventObtain == null) {
                        long jUptimeMillis = SystemClock.uptimeMillis();
                        motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                    }
                    if (i == 0) {
                        da2Var.j(this, view, motionEventObtain);
                    } else if (i == 1) {
                        da2Var.u(view, motionEventObtain);
                    }
                }
            } else if (!zJ && da2Var != null) {
                if (i == 0) {
                    zJ = da2Var.j(this, view, motionEvent);
                } else if (i == 1) {
                    zJ = da2Var.u(view, motionEvent);
                }
                if (zJ) {
                    this.j = view;
                }
            }
        }
        arrayList.clear();
        return zJ;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00b9  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0102  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void l() {
        /*
            Method dump skipped, instruction units count: 376
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.coordinatorlayout.widget.CoordinatorLayout.l():void");
    }

    public final void m(boolean z) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            da2 da2Var = ((ga2) childAt.getLayoutParams()).a;
            if (da2Var != null) {
                long jUptimeMillis = SystemClock.uptimeMillis();
                MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                if (z) {
                    da2Var.j(this, childAt, motionEventObtain);
                } else {
                    da2Var.u(childAt, motionEventObtain);
                }
                motionEventObtain.recycle();
            }
        }
        for (int i2 = 0; i2 < childCount; i2++) {
            ((ga2) getChildAt(i2).getLayoutParams()).getClass();
        }
        this.j = null;
        this.g = false;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        m(false);
        if (this.m) {
            if (this.l == null) {
                this.l = new ha2(this);
            }
            getViewTreeObserver().addOnPreDrawListener(this.l);
        }
        if (this.n == null) {
            WeakHashMap weakHashMap = ute.a;
            if (getFitsSystemWindows()) {
                requestApplyInsets();
            }
        }
        this.h = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        m(false);
        if (this.m && this.l != null) {
            getViewTreeObserver().removeOnPreDrawListener(this.l);
        }
        View view = this.k;
        if (view != null) {
            onStopNestedScroll(view, 0);
        }
        this.h = false;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (!this.o || this.p == null) {
            return;
        }
        z4f z4fVar = this.n;
        int iD = z4fVar != null ? z4fVar.d() : 0;
        if (iD > 0) {
            this.p.setBounds(0, 0, getWidth(), iD);
            this.p.draw(canvas);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            m(true);
        }
        boolean zK = k(motionEvent, 0);
        if (actionMasked != 1 && actionMasked != 3) {
            return zK;
        }
        m(true);
        return zK;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        da2 da2Var;
        WeakHashMap weakHashMap = ute.a;
        int layoutDirection = getLayoutDirection();
        ArrayList arrayList = this.a;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            View view = (View) arrayList.get(i5);
            if (view.getVisibility() != 8 && ((da2Var = ((ga2) view.getLayoutParams()).a) == null || !da2Var.k(this, view, layoutDirection))) {
                j(view, layoutDirection);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:72:0x015d  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0167  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x0189  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onMeasure(int r27, int r28) {
        /*
            Method dump skipped, instruction units count: 499
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.coordinatorlayout.widget.CoordinatorLayout.onMeasure(int, int):void");
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedFling(View view, float f, float f2, boolean z) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() != 8) {
                ga2 ga2Var = (ga2) childAt.getLayoutParams();
                if (ga2Var.a(0)) {
                    da2 da2Var = ga2Var.a;
                }
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedPreFling(View view, float f, float f2) {
        da2 da2Var;
        int childCount = getChildCount();
        boolean zM = false;
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() != 8) {
                ga2 ga2Var = (ga2) childAt.getLayoutParams();
                if (ga2Var.a(0) && (da2Var = ga2Var.a) != null) {
                    zM |= da2Var.m(view);
                }
            }
        }
        return zM;
    }

    @Override // defpackage.od8
    public final void onNestedPreScroll(View view, int i, int i2, int[] iArr, int i3) {
        da2 da2Var;
        int childCount = getChildCount();
        boolean z = false;
        int iMax = 0;
        int iMax2 = 0;
        for (int i4 = 0; i4 < childCount; i4++) {
            View childAt = getChildAt(i4);
            if (childAt.getVisibility() != 8) {
                ga2 ga2Var = (ga2) childAt.getLayoutParams();
                if (ga2Var.a(i3) && (da2Var = ga2Var.a) != null) {
                    int[] iArr2 = this.e;
                    iArr2[0] = 0;
                    iArr2[1] = 0;
                    da2Var.n(this, childAt, view, i2, iArr2, i3);
                    iMax = i > 0 ? Math.max(iMax, iArr2[0]) : Math.min(iMax, iArr2[0]);
                    iMax2 = i2 > 0 ? Math.max(iMax2, iArr2[1]) : Math.min(iMax2, iArr2[1]);
                    z = true;
                }
            }
        }
        iArr[0] = iMax;
        iArr[1] = iMax2;
        if (z) {
            i(1);
        }
    }

    @Override // defpackage.pd8
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4, int i5, int[] iArr) {
        da2 da2Var;
        int childCount = getChildCount();
        int iMax = 0;
        int iMax2 = 0;
        boolean z = false;
        for (int i6 = 0; i6 < childCount; i6++) {
            View childAt = getChildAt(i6);
            if (childAt.getVisibility() != 8) {
                ga2 ga2Var = (ga2) childAt.getLayoutParams();
                if (ga2Var.a(i5) && (da2Var = ga2Var.a) != null) {
                    int[] iArr2 = this.e;
                    iArr2[0] = 0;
                    iArr2[1] = 0;
                    da2Var.o(this, childAt, i2, i3, i4, iArr2);
                    iMax = i3 > 0 ? Math.max(iMax, iArr2[0]) : Math.min(iMax, iArr2[0]);
                    iMax2 = i4 > 0 ? Math.max(iMax2, iArr2[1]) : Math.min(iMax2, iArr2[1]);
                    z = true;
                }
            }
        }
        iArr[0] = iArr[0] + iMax;
        iArr[1] = iArr[1] + iMax2;
        if (z) {
            i(1);
        }
    }

    @Override // defpackage.od8
    public final void onNestedScrollAccepted(View view, View view2, int i, int i2) {
        qd8 qd8Var = this.s;
        if (i2 == 1) {
            qd8Var.b = i;
        } else {
            qd8Var.a = i;
        }
        this.k = view2;
        int childCount = getChildCount();
        for (int i3 = 0; i3 < childCount; i3++) {
            ((ga2) getChildAt(i3).getLayoutParams()).getClass();
        }
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        Parcelable parcelable2;
        if (!(parcelable instanceof ia2)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        ia2 ia2Var = (ia2) parcelable;
        super.onRestoreInstanceState(ia2Var.a);
        SparseArray sparseArray = ia2Var.c;
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            int id = childAt.getId();
            da2 da2Var = g(childAt).a;
            if (id != -1 && da2Var != null && (parcelable2 = (Parcelable) sparseArray.get(id)) != null) {
                da2Var.q(childAt, parcelable2);
            }
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        Parcelable parcelableR;
        ia2 ia2Var = new ia2(super.onSaveInstanceState());
        SparseArray sparseArray = new SparseArray();
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            int id = childAt.getId();
            da2 da2Var = ((ga2) childAt.getLayoutParams()).a;
            if (id != -1 && da2Var != null && (parcelableR = da2Var.r(childAt)) != null) {
                sparseArray.append(id, parcelableR);
            }
        }
        ia2Var.c = sparseArray;
        return ia2Var;
    }

    @Override // defpackage.od8
    public final boolean onStartNestedScroll(View view, View view2, int i, int i2) {
        int childCount = getChildCount();
        boolean z = false;
        for (int i3 = 0; i3 < childCount; i3++) {
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() != 8) {
                ga2 ga2Var = (ga2) childAt.getLayoutParams();
                da2 da2Var = ga2Var.a;
                if (da2Var != null) {
                    boolean zS = da2Var.s(this, childAt, view, view2, i, i2);
                    z |= zS;
                    if (i2 == 0) {
                        ga2Var.m = zS;
                    } else if (i2 == 1) {
                        ga2Var.n = zS;
                    }
                } else if (i2 == 0) {
                    ga2Var.m = false;
                } else if (i2 == 1) {
                    ga2Var.n = false;
                }
            }
        }
        return z;
    }

    @Override // defpackage.od8
    public final void onStopNestedScroll(View view, int i) {
        qd8 qd8Var = this.s;
        if (i == 1) {
            qd8Var.b = 0;
        } else {
            qd8Var.a = 0;
        }
        int childCount = getChildCount();
        for (int i2 = 0; i2 < childCount; i2++) {
            View childAt = getChildAt(i2);
            ga2 ga2Var = (ga2) childAt.getLayoutParams();
            if (ga2Var.a(i)) {
                da2 da2Var = ga2Var.a;
                if (da2Var != null) {
                    da2Var.t(childAt, view, i);
                }
                if (i == 0) {
                    ga2Var.m = false;
                } else if (i == 1) {
                    ga2Var.n = false;
                }
                ga2Var.o = false;
            }
        }
        this.k = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002f  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015 A[PHI: r3
      0x0015: PHI (r3v4 boolean) = (r3v2 boolean), (r3v5 boolean) binds: [B:10:0x0022, B:5:0x0012] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onTouchEvent(android.view.MotionEvent r18) {
        /*
            r17 = this;
            r0 = r17
            r1 = r18
            int r2 = r1.getActionMasked()
            android.view.View r3 = r0.j
            r4 = 1
            r5 = 0
            if (r3 != 0) goto L17
            boolean r3 = r0.k(r1, r4)
            if (r3 == 0) goto L15
            goto L18
        L15:
            r6 = r5
            goto L2a
        L17:
            r3 = r5
        L18:
            android.view.View r6 = r0.j
            android.view.ViewGroup$LayoutParams r6 = r6.getLayoutParams()
            ga2 r6 = (defpackage.ga2) r6
            da2 r6 = r6.a
            if (r6 == 0) goto L15
            android.view.View r7 = r0.j
            boolean r6 = r6.u(r7, r1)
        L2a:
            android.view.View r7 = r0.j
            r8 = 0
            if (r7 != 0) goto L35
            boolean r1 = super.onTouchEvent(r18)
            r6 = r6 | r1
            goto L48
        L35:
            if (r3 == 0) goto L48
            long r9 = android.os.SystemClock.uptimeMillis()
            r15 = 0
            r16 = 0
            r13 = 3
            r14 = 0
            r11 = r9
            android.view.MotionEvent r8 = android.view.MotionEvent.obtain(r9, r11, r13, r14, r15, r16)
            super.onTouchEvent(r8)
        L48:
            if (r8 == 0) goto L4d
            r8.recycle()
        L4d:
            if (r2 == r4) goto L54
            r1 = 3
            if (r2 != r1) goto L53
            goto L54
        L53:
            return r6
        L54:
            r0.m(r5)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.coordinatorlayout.widget.CoordinatorLayout.onTouchEvent(android.view.MotionEvent):boolean");
    }

    public final void p() {
        WeakHashMap weakHashMap = ute.a;
        if (!getFitsSystemWindows()) {
            mte.c(this, null);
            return;
        }
        zg7 zg7Var = this.r;
        if (zg7Var == null) {
            zg7Var = new zg7(22, this);
            this.r = zg7Var;
        }
        mte.c(this, zg7Var);
        setSystemUiVisibility(1280);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z) {
        da2 da2Var = ((ga2) view.getLayoutParams()).a;
        if (da2Var == null || !da2Var.p(this, view, rect)) {
            return super.requestChildRectangleOnScreen(view, rect, z);
        }
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z) {
        super.requestDisallowInterceptTouchEvent(z);
        if (!z || this.g) {
            return;
        }
        m(false);
        this.g = true;
    }

    @Override // android.view.View
    public void setFitsSystemWindows(boolean z) {
        super.setFitsSystemWindows(z);
        p();
    }

    @Override // android.view.ViewGroup
    public void setOnHierarchyChangeListener(ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener) {
        this.q = onHierarchyChangeListener;
    }

    public void setStatusBarBackground(Drawable drawable) {
        Drawable drawable2 = this.p;
        if (drawable2 != drawable) {
            if (drawable2 != null) {
                drawable2.setCallback(null);
            }
            Drawable drawableMutate = drawable != null ? drawable.mutate() : null;
            this.p = drawableMutate;
            if (drawableMutate != null) {
                if (drawableMutate.isStateful()) {
                    this.p.setState(getDrawableState());
                }
                Drawable drawable3 = this.p;
                WeakHashMap weakHashMap = ute.a;
                drawable3.setLayoutDirection(getLayoutDirection());
                this.p.setVisible(getVisibility() == 0, false);
                this.p.setCallback(this);
            }
            WeakHashMap weakHashMap2 = ute.a;
            postInvalidateOnAnimation();
        }
    }

    public void setStatusBarBackgroundColor(int i) {
        setStatusBarBackground(new ColorDrawable(i));
    }

    public void setStatusBarBackgroundResource(int i) {
        setStatusBarBackground(i != 0 ? getContext().getDrawable(i) : null);
    }

    @Override // android.view.View
    public void setVisibility(int i) {
        super.setVisibility(i);
        boolean z = i == 0;
        Drawable drawable = this.p;
        if (drawable == null || drawable.isVisible() == z) {
            return;
        }
        this.p.setVisible(z, false);
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.p;
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new ga2(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScrollAccepted(View view, View view2, int i) {
        onNestedScrollAccepted(view, view2, i, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onStopNestedScroll(View view) {
        onStopNestedScroll(view, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onStartNestedScroll(View view, View view2, int i) {
        return onStartNestedScroll(view, view2, i, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedPreScroll(View view, int i, int i2, int[] iArr) {
        onNestedPreScroll(view, i, i2, iArr, 0);
    }

    @Override // defpackage.od8
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4, int i5) {
        onNestedScroll(view, i, i2, i3, i4, 0, this.f);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4) {
        onNestedScroll(view, i, i2, i3, i4, 0);
    }

    public CoordinatorLayout(Context context) {
        this(context, null);
    }
}
