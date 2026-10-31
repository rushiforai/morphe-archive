package androidx.coordinatorlayout.widget;

import a5.a1;
import a5.h2;
import a5.q0;
import a5.s0;
import a5.x;
import a5.y;
import a5.z;
import ai.r2;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import androidx.customview.view.AbsSavedState;
import fa.t;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.WeakHashMap;
import l1.a2;
import l4.b;
import l4.d;
import l4.e;
import l4.f;
import l4.g;
import z.c1;
import z4.c;

/* loaded from: classes2.dex */
public class CoordinatorLayout extends ViewGroup implements x, y {

    /* renamed from: t, reason: collision with root package name */
    public static final String f14194t;

    /* renamed from: u, reason: collision with root package name */
    public static final Class[] f14195u;

    /* renamed from: v, reason: collision with root package name */
    public static final ThreadLocal f14196v;

    /* renamed from: w, reason: collision with root package name */
    public static final r2 f14197w;

    /* renamed from: x, reason: collision with root package name */
    public static final c f14198x;

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f14199a;

    /* renamed from: b, reason: collision with root package name */
    public final a2 f14200b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f14201c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f14202d;

    /* renamed from: e, reason: collision with root package name */
    public final int[] f14203e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f14204f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f14205g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f14206h;

    /* renamed from: i, reason: collision with root package name */
    public final int[] f14207i;

    /* renamed from: j, reason: collision with root package name */
    public View f14208j;

    /* renamed from: k, reason: collision with root package name */
    public View f14209k;

    /* renamed from: l, reason: collision with root package name */
    public f f14210l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f14211m;
    public h2 n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final Drawable f14212p;

    /* renamed from: q, reason: collision with root package name */
    public ViewGroup.OnHierarchyChangeListener f14213q;

    /* renamed from: r, reason: collision with root package name */
    public je.f f14214r;

    /* renamed from: s, reason: collision with root package name */
    public final z f14215s;

    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public SparseArray f14216c;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            int i5 = parcel.readInt();
            int[] iArr = new int[i5];
            parcel.readIntArray(iArr);
            Parcelable[] parcelableArray = parcel.readParcelableArray(classLoader);
            this.f14216c = new SparseArray(i5);
            for (int i11 = 0; i11 < i5; i11++) {
                this.f14216c.append(iArr[i11], parcelableArray[i11]);
            }
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            SparseArray sparseArray = this.f14216c;
            int size = sparseArray != null ? sparseArray.size() : 0;
            parcel.writeInt(size);
            int[] iArr = new int[size];
            Parcelable[] parcelableArr = new Parcelable[size];
            for (int i11 = 0; i11 < size; i11++) {
                iArr[i11] = this.f14216c.keyAt(i11);
                parcelableArr[i11] = (Parcelable) this.f14216c.valueAt(i11);
            }
            parcel.writeIntArray(iArr);
            parcel.writeParcelableArray(parcelableArr, i5);
        }
    }

    static {
        Package r02 = CoordinatorLayout.class.getPackage();
        f14194t = r02 != null ? r02.getName() : null;
        f14197w = new r2(18);
        f14195u = new Class[]{Context.class, AttributeSet.class};
        f14196v = new ThreadLocal();
        f14198x = new c(12);
    }

    public CoordinatorLayout(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 2130969023);
        this.f14199a = new ArrayList();
        this.f14200b = new a2(1);
        this.f14201c = new ArrayList();
        this.f14202d = new ArrayList();
        this.f14203e = new int[2];
        this.f14204f = new int[2];
        this.f14215s = new z();
        int[] iArr = k4.a.f71096a;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, 2130969023, 0);
        if (Build.VERSION.SDK_INT >= 29) {
            saveAttributeDataForStyleable(context, iArr, attributeSet, typedArrayObtainStyledAttributes, 2130969023, 0);
        }
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        if (resourceId != 0) {
            Resources resources = context.getResources();
            int[] intArray = resources.getIntArray(resourceId);
            this.f14207i = intArray;
            float f11 = resources.getDisplayMetrics().density;
            int length = intArray.length;
            for (int i5 = 0; i5 < length; i5++) {
                this.f14207i[i5] = (int) (r1[i5] * f11);
            }
        }
        this.f14212p = typedArrayObtainStyledAttributes.getDrawable(1);
        typedArrayObtainStyledAttributes.recycle();
        x();
        super.setOnHierarchyChangeListener(new d(this));
        WeakHashMap weakHashMap = a1.f250a;
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
    }

    public static Rect d() {
        Rect rect = (Rect) f14198x.a();
        return rect == null ? new Rect() : rect;
    }

    public static void m(int i5, Rect rect, Rect rect2, e eVar, int i11, int i12) {
        int i13 = eVar.f74698c;
        if (i13 == 0) {
            i13 = 17;
        }
        int absoluteGravity = Gravity.getAbsoluteGravity(i13, i5);
        int i14 = eVar.f74699d;
        if ((i14 & 7) == 0) {
            i14 |= 8388611;
        }
        if ((i14 & 112) == 0) {
            i14 |= 48;
        }
        int absoluteGravity2 = Gravity.getAbsoluteGravity(i14, i5);
        int i15 = absoluteGravity & 7;
        int i16 = absoluteGravity & 112;
        int i17 = absoluteGravity2 & 7;
        int i18 = absoluteGravity2 & 112;
        int iWidth = i17 != 1 ? i17 != 5 ? rect.left : rect.right : rect.left + (rect.width() / 2);
        int iHeight = i18 != 16 ? i18 != 80 ? rect.top : rect.bottom : rect.top + (rect.height() / 2);
        if (i15 == 1) {
            iWidth -= i11 / 2;
        } else if (i15 != 5) {
            iWidth -= i11;
        }
        if (i16 == 16) {
            iHeight -= i12 / 2;
        } else if (i16 != 80) {
            iHeight -= i12;
        }
        rect2.set(iWidth, iHeight, i11 + iWidth, i12 + iHeight);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static e o(View view) {
        e eVar = (e) view.getLayoutParams();
        if (!eVar.f74697b) {
            if (view instanceof l4.a) {
                eVar.b(((l4.a) view).a());
                eVar.f74697b = true;
                return eVar;
            }
            l4.c cVar = null;
            for (Class<?> superclass = view.getClass(); superclass != null; superclass = superclass.getSuperclass()) {
                cVar = (l4.c) superclass.getAnnotation(l4.c.class);
                if (cVar != null) {
                    break;
                }
            }
            if (cVar != null) {
                try {
                    eVar.b((b) cVar.value().getDeclaredConstructor(null).newInstance(null));
                } catch (Exception e3) {
                    Log.e("CoordinatorLayout", "Default behavior class " + cVar.value().getName() + " could not be instantiated. Did you forget a default constructor?", e3);
                }
            }
            eVar.f74697b = true;
        }
        return eVar;
    }

    public static void v(int i5, View view) {
        e eVar = (e) view.getLayoutParams();
        int i11 = eVar.f74704i;
        if (i11 != i5) {
            WeakHashMap weakHashMap = a1.f250a;
            view.offsetLeftAndRight(i5 - i11);
            eVar.f74704i = i5;
        }
    }

    public static void w(int i5, View view) {
        e eVar = (e) view.getLayoutParams();
        int i11 = eVar.f74705j;
        if (i11 != i5) {
            WeakHashMap weakHashMap = a1.f250a;
            view.offsetTopAndBottom(i5 - i11);
            eVar.f74705j = i5;
        }
    }

    @Override // a5.x
    public final void a(int i5, View view) {
        z zVar = this.f14215s;
        if (i5 == 1) {
            zVar.f385b = 0;
        } else {
            zVar.f384a = 0;
        }
        int childCount = getChildCount();
        for (int i11 = 0; i11 < childCount; i11++) {
            View childAt = getChildAt(i11);
            e eVar = (e) childAt.getLayoutParams();
            if (eVar.a(i5)) {
                b bVar = eVar.f74696a;
                if (bVar != null) {
                    bVar.u(this, childAt, view, i5);
                }
                if (i5 == 0) {
                    eVar.f74708m = false;
                } else if (i5 == 1) {
                    eVar.n = false;
                }
                eVar.o = false;
            }
        }
        this.f14209k = null;
    }

    @Override // a5.x
    public final void b(View view, View view2, int i5, int i11) {
        z zVar = this.f14215s;
        if (i11 == 1) {
            zVar.f385b = i5;
        } else {
            zVar.f384a = i5;
        }
        this.f14209k = view2;
        int childCount = getChildCount();
        for (int i12 = 0; i12 < childCount; i12++) {
            ((e) getChildAt(i12).getLayoutParams()).getClass();
        }
    }

    @Override // a5.x
    public final void c(View view, int i5, int i11, int[] iArr, int i12) {
        b bVar;
        int childCount = getChildCount();
        boolean z11 = false;
        int iMax = 0;
        int iMax2 = 0;
        for (int i13 = 0; i13 < childCount; i13++) {
            View childAt = getChildAt(i13);
            if (childAt.getVisibility() != 8) {
                e eVar = (e) childAt.getLayoutParams();
                if (eVar.a(i12) && (bVar = eVar.f74696a) != null) {
                    int[] iArr2 = this.f14203e;
                    iArr2[0] = 0;
                    iArr2[1] = 0;
                    bVar.o(this, childAt, view, i5, i11, iArr2, i12);
                    iMax = i5 > 0 ? Math.max(iMax, iArr2[0]) : Math.min(iMax, iArr2[0]);
                    iMax2 = i11 > 0 ? Math.max(iMax2, iArr2[1]) : Math.min(iMax2, iArr2[1]);
                    z11 = true;
                }
            }
        }
        iArr[0] = iMax;
        iArr[1] = iMax2;
        if (z11) {
            q(1);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof e) && super.checkLayoutParams(layoutParams);
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j11) {
        b bVar = ((e) view.getLayoutParams()).f74696a;
        if (bVar != null) {
            bVar.getClass();
        }
        return super.drawChild(canvas, view, j11);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        Drawable drawable = this.f14212p;
        if ((drawable == null || !drawable.isStateful()) ? false : drawable.setState(drawableState)) {
            invalidate();
        }
    }

    @Override // a5.y
    public final void e(View view, int i5, int i11, int i12, int i13, int i14, int[] iArr) {
        b bVar;
        int childCount = getChildCount();
        int iMax = 0;
        int iMax2 = 0;
        boolean z11 = false;
        for (int i15 = 0; i15 < childCount; i15++) {
            View childAt = getChildAt(i15);
            if (childAt.getVisibility() != 8) {
                e eVar = (e) childAt.getLayoutParams();
                if (eVar.a(i14) && (bVar = eVar.f74696a) != null) {
                    int[] iArr2 = this.f14203e;
                    iArr2[0] = 0;
                    iArr2[1] = 0;
                    bVar.p(this, childAt, i11, i12, i13, iArr2);
                    iMax = i12 > 0 ? Math.max(iMax, iArr2[0]) : Math.min(iMax, iArr2[0]);
                    iMax2 = i13 > 0 ? Math.max(iMax2, iArr2[1]) : Math.min(iMax2, iArr2[1]);
                    z11 = true;
                }
            }
        }
        iArr[0] = iArr[0] + iMax;
        iArr[1] = iArr[1] + iMax2;
        if (z11) {
            q(1);
        }
    }

    @Override // a5.x
    public final void f(View view, int i5, int i11, int i12, int i13, int i14) {
        e(view, i5, i11, i12, i13, 0, this.f14204f);
    }

    @Override // a5.x
    public final boolean g(View view, View view2, int i5, int i11) {
        View view3;
        int i12;
        int i13;
        int childCount = getChildCount();
        int i14 = 0;
        boolean z11 = false;
        while (i14 < childCount) {
            View childAt = getChildAt(i14);
            if (childAt.getVisibility() == 8) {
                view3 = view;
                i12 = i5;
                i13 = i11;
            } else {
                e eVar = (e) childAt.getLayoutParams();
                b bVar = eVar.f74696a;
                if (bVar != null) {
                    view3 = view;
                    i12 = i5;
                    i13 = i11;
                    boolean zT = bVar.t(this, childAt, view3, i12, i13);
                    z11 |= zT;
                    if (i13 == 0) {
                        eVar.f74708m = zT;
                    } else if (i13 == 1) {
                        eVar.n = zT;
                    }
                } else {
                    view3 = view;
                    i12 = i5;
                    i13 = i11;
                    if (i13 == 0) {
                        eVar.f74708m = false;
                    } else if (i13 == 1) {
                        eVar.n = false;
                    }
                }
            }
            i14++;
            view = view3;
            i5 = i12;
            i11 = i13;
        }
        return z11;
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new e(-2, -2);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new e(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    public final int getNestedScrollAxes() {
        return this.f14215s.a();
    }

    @Override // android.view.View
    public final int getSuggestedMinimumHeight() {
        return Math.max(super.getSuggestedMinimumHeight(), getPaddingBottom() + getPaddingTop());
    }

    @Override // android.view.View
    public final int getSuggestedMinimumWidth() {
        return Math.max(super.getSuggestedMinimumWidth(), getPaddingRight() + getPaddingLeft());
    }

    public final void h(e eVar, Rect rect, int i5, int i11) {
        int width = getWidth();
        int height = getHeight();
        int iMax = Math.max(getPaddingLeft() + ((ViewGroup.MarginLayoutParams) eVar).leftMargin, Math.min(rect.left, ((width - getPaddingRight()) - i5) - ((ViewGroup.MarginLayoutParams) eVar).rightMargin));
        int iMax2 = Math.max(getPaddingTop() + ((ViewGroup.MarginLayoutParams) eVar).topMargin, Math.min(rect.top, ((height - getPaddingBottom()) - i11) - ((ViewGroup.MarginLayoutParams) eVar).bottomMargin));
        rect.set(iMax, iMax2, i5 + iMax, i11 + iMax2);
    }

    public final void i(View view) {
        List list = (List) ((c1) this.f14200b.f73008b).get(view);
        if (list == null || list.isEmpty()) {
            return;
        }
        for (int i5 = 0; i5 < list.size(); i5++) {
            View view2 = (View) list.get(i5);
            b bVar = ((e) view2.getLayoutParams()).f74696a;
            if (bVar != null) {
                bVar.h(this, view2, view);
            }
        }
    }

    public final void j(View view, Rect rect, boolean z11) {
        if (view.isLayoutRequested() || view.getVisibility() == 8) {
            rect.setEmpty();
        } else if (z11) {
            l(view, rect);
        } else {
            rect.set(view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        }
    }

    public final ArrayList k(View view) {
        c1 c1Var = (c1) this.f14200b.f73008b;
        int i5 = c1Var.f97753c;
        ArrayList arrayList = null;
        for (int i11 = 0; i11 < i5; i11++) {
            ArrayList arrayList2 = (ArrayList) c1Var.j(i11);
            if (arrayList2 != null && arrayList2.contains(view)) {
                if (arrayList == null) {
                    arrayList = new ArrayList();
                }
                arrayList.add(c1Var.f(i11));
            }
        }
        ArrayList arrayList3 = this.f14202d;
        arrayList3.clear();
        if (arrayList != null) {
            arrayList3.addAll(arrayList);
        }
        return arrayList3;
    }

    public final void l(View view, Rect rect) {
        ThreadLocal threadLocal = g.f74711a;
        rect.set(0, 0, view.getWidth(), view.getHeight());
        ThreadLocal threadLocal2 = g.f74711a;
        Matrix matrix = (Matrix) threadLocal2.get();
        if (matrix == null) {
            matrix = new Matrix();
            threadLocal2.set(matrix);
        } else {
            matrix.reset();
        }
        g.a(this, view, matrix);
        ThreadLocal threadLocal3 = g.f74712b;
        RectF rectF = (RectF) threadLocal3.get();
        if (rectF == null) {
            rectF = new RectF();
            threadLocal3.set(rectF);
        }
        rectF.set(rect);
        matrix.mapRect(rectF);
        rect.set((int) (rectF.left + 0.5f), (int) (rectF.top + 0.5f), (int) (rectF.right + 0.5f), (int) (rectF.bottom + 0.5f));
    }

    public final int n(int i5) {
        int[] iArr = this.f14207i;
        if (iArr == null) {
            Log.e("CoordinatorLayout", "No keylines defined for " + this + " - attempted index lookup " + i5);
            return 0;
        }
        if (i5 >= 0 && i5 < iArr.length) {
            return iArr[i5];
        }
        Log.e("CoordinatorLayout", "Keyline index " + i5 + " out of range for " + this);
        return 0;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        u(false);
        if (this.f14211m) {
            if (this.f14210l == null) {
                this.f14210l = new f(this);
            }
            getViewTreeObserver().addOnPreDrawListener(this.f14210l);
        }
        if (this.n == null) {
            WeakHashMap weakHashMap = a1.f250a;
            if (getFitsSystemWindows()) {
                q0.c(this);
            }
        }
        this.f14206h = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        u(false);
        if (this.f14211m && this.f14210l != null) {
            getViewTreeObserver().removeOnPreDrawListener(this.f14210l);
        }
        View view = this.f14209k;
        if (view != null) {
            a(0, view);
        }
        this.f14206h = false;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        Drawable drawable;
        super.onDraw(canvas);
        if (!this.o || (drawable = this.f14212p) == null) {
            return;
        }
        h2 h2Var = this.n;
        int iD = h2Var != null ? h2Var.d() : 0;
        if (iD > 0) {
            drawable.setBounds(0, 0, getWidth(), iD);
            drawable.draw(canvas);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            u(true);
        }
        boolean zT = t(motionEvent, 0);
        if (actionMasked != 1 && actionMasked != 3) {
            return zT;
        }
        u(true);
        return zT;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        b bVar;
        WeakHashMap weakHashMap = a1.f250a;
        int layoutDirection = getLayoutDirection();
        ArrayList arrayList = this.f14199a;
        int size = arrayList.size();
        for (int i14 = 0; i14 < size; i14++) {
            View view = (View) arrayList.get(i14);
            if (view.getVisibility() != 8 && ((bVar = ((e) view.getLayoutParams()).f74696a) == null || !bVar.l(this, view, layoutDirection))) {
                r(layoutDirection, view);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:168:0x02e5  */
    /* JADX WARN: Removed duplicated region for block: B:171:0x02ed  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x0313  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x007d  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00be  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0107  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onMeasure(int i5, int i11) {
        boolean z11;
        int i12;
        int i13;
        int i14;
        int iMakeMeasureSpec;
        int iMakeMeasureSpec2;
        b bVar;
        int i15;
        int i16;
        int i17;
        int i18;
        e eVar;
        View view;
        int i19;
        int i21;
        ArrayList arrayList;
        int i22;
        int i23;
        int i24;
        int iMax;
        View viewFindViewById;
        b bVar2;
        CoordinatorLayout coordinatorLayout = this;
        ArrayList arrayList2 = coordinatorLayout.f14199a;
        arrayList2.clear();
        a2 a2Var = coordinatorLayout.f14200b;
        c1 c1Var = (c1) a2Var.f73008b;
        c1 c1Var2 = (c1) a2Var.f73008b;
        t tVar = (t) a2Var.f73007a;
        int i25 = c1Var.f97753c;
        for (int i26 = 0; i26 < i25; i26++) {
            ArrayList arrayList3 = (ArrayList) c1Var.j(i26);
            if (arrayList3 != null) {
                arrayList3.clear();
                tVar.n(arrayList3);
            }
        }
        c1Var.clear();
        int childCount = coordinatorLayout.getChildCount();
        for (int i27 = 0; i27 < childCount; i27++) {
            View childAt = coordinatorLayout.getChildAt(i27);
            e eVarO = o(childAt);
            int i28 = eVarO.f74701f;
            if (i28 == -1) {
                eVarO.f74707l = null;
                eVarO.f74706k = null;
            } else {
                View view2 = eVarO.f74706k;
                if (view2 == null || view2.getId() != i28) {
                    viewFindViewById = coordinatorLayout.findViewById(i28);
                    eVarO.f74706k = viewFindViewById;
                    if (viewFindViewById != null) {
                        if (!coordinatorLayout.isInEditMode()) {
                            throw new IllegalStateException("Could not find CoordinatorLayout descendant view with id " + coordinatorLayout.getResources().getResourceName(i28) + " to anchor view " + childAt);
                        }
                        eVarO.f74707l = null;
                        eVarO.f74706k = null;
                    } else if (viewFindViewById != coordinatorLayout) {
                        for (ViewParent parent = viewFindViewById.getParent(); parent != coordinatorLayout && parent != null; parent = parent.getParent()) {
                            if (parent != childAt) {
                                if (parent instanceof View) {
                                    viewFindViewById = parent;
                                }
                            } else {
                                if (!coordinatorLayout.isInEditMode()) {
                                    throw new IllegalStateException("Anchor must not be a descendant of the anchored view");
                                }
                                eVarO.f74707l = null;
                                eVarO.f74706k = null;
                            }
                        }
                        eVarO.f74707l = viewFindViewById;
                    } else {
                        if (!coordinatorLayout.isInEditMode()) {
                            throw new IllegalStateException("View can not be anchored to the the parent CoordinatorLayout");
                        }
                        eVarO.f74707l = null;
                        eVarO.f74706k = null;
                    }
                } else {
                    View view3 = eVarO.f74706k;
                    for (ViewParent parent2 = view3.getParent(); parent2 != coordinatorLayout; parent2 = parent2.getParent()) {
                        if (parent2 == null || parent2 == childAt) {
                            eVarO.f74707l = null;
                            eVarO.f74706k = null;
                            viewFindViewById = coordinatorLayout.findViewById(i28);
                            eVarO.f74706k = viewFindViewById;
                            if (viewFindViewById != null) {
                            }
                        } else {
                            if (parent2 instanceof View) {
                                view3 = parent2;
                            }
                        }
                    }
                    eVarO.f74707l = view3;
                }
            }
            if (!c1Var2.containsKey(childAt)) {
                c1Var2.put(childAt, null);
            }
            for (int i29 = 0; i29 < childCount; i29++) {
                if (i29 != i27) {
                    View childAt2 = coordinatorLayout.getChildAt(i29);
                    if (childAt2 != eVarO.f74707l) {
                        WeakHashMap weakHashMap = a1.f250a;
                        int layoutDirection = coordinatorLayout.getLayoutDirection();
                        int absoluteGravity = Gravity.getAbsoluteGravity(((e) childAt2.getLayoutParams()).f74702g, layoutDirection);
                        if ((absoluteGravity != 0 && (Gravity.getAbsoluteGravity(eVarO.f74703h, layoutDirection) & absoluteGravity) == absoluteGravity) || ((bVar2 = eVarO.f74696a) != null && bVar2.f(childAt, childAt2))) {
                            if (!c1Var.containsKey(childAt2) && !c1Var2.containsKey(childAt2)) {
                                c1Var2.put(childAt2, null);
                            }
                            if (!c1Var.containsKey(childAt2) || !c1Var.containsKey(childAt)) {
                                throw new IllegalArgumentException("All nodes must be present in the graph before being added as an edge");
                            }
                            ArrayList arrayList4 = (ArrayList) c1Var.get(childAt2);
                            if (arrayList4 == null) {
                                arrayList4 = (ArrayList) tVar.a();
                                if (arrayList4 == null) {
                                    arrayList4 = new ArrayList();
                                }
                                c1Var.put(childAt2, arrayList4);
                            }
                            arrayList4.add(childAt);
                        }
                    }
                }
            }
        }
        ArrayList arrayList5 = (ArrayList) a2Var.f73009c;
        arrayList5.clear();
        HashSet hashSet = (HashSet) a2Var.f73010d;
        hashSet.clear();
        int i31 = c1Var.f97753c;
        for (int i32 = 0; i32 < i31; i32++) {
            a2Var.f(c1Var.f(i32), arrayList5, hashSet);
        }
        arrayList2.addAll(arrayList5);
        Collections.reverse(arrayList2);
        int childCount2 = coordinatorLayout.getChildCount();
        int i33 = 0;
        loop6: while (true) {
            if (i33 >= childCount2) {
                z11 = false;
                break;
            }
            View childAt3 = coordinatorLayout.getChildAt(i33);
            int i34 = c1Var2.f97753c;
            for (int i35 = 0; i35 < i34; i35++) {
                ArrayList arrayList6 = (ArrayList) c1Var2.j(i35);
                if (arrayList6 != null && arrayList6.contains(childAt3)) {
                    z11 = true;
                    break loop6;
                }
            }
            i33++;
        }
        if (z11 != coordinatorLayout.f14211m) {
            if (z11) {
                if (coordinatorLayout.f14206h) {
                    if (coordinatorLayout.f14210l == null) {
                        coordinatorLayout.f14210l = new f(coordinatorLayout);
                    }
                    coordinatorLayout.getViewTreeObserver().addOnPreDrawListener(coordinatorLayout.f14210l);
                }
                coordinatorLayout.f14211m = true;
            } else {
                if (coordinatorLayout.f14206h && coordinatorLayout.f14210l != null) {
                    coordinatorLayout.getViewTreeObserver().removeOnPreDrawListener(coordinatorLayout.f14210l);
                }
                coordinatorLayout.f14211m = false;
            }
        }
        int paddingLeft = coordinatorLayout.getPaddingLeft();
        int paddingTop = coordinatorLayout.getPaddingTop();
        int paddingRight = coordinatorLayout.getPaddingRight();
        int paddingBottom = coordinatorLayout.getPaddingBottom();
        WeakHashMap weakHashMap2 = a1.f250a;
        int layoutDirection2 = coordinatorLayout.getLayoutDirection();
        boolean z12 = layoutDirection2 == 1;
        int mode = View.MeasureSpec.getMode(i5);
        int size = View.MeasureSpec.getSize(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        int size2 = View.MeasureSpec.getSize(i11);
        int i36 = paddingLeft + paddingRight;
        int i37 = paddingTop + paddingBottom;
        int suggestedMinimumWidth = coordinatorLayout.getSuggestedMinimumWidth();
        int suggestedMinimumHeight = coordinatorLayout.getSuggestedMinimumHeight();
        boolean z13 = coordinatorLayout.n != null && coordinatorLayout.getFitsSystemWindows();
        int i38 = suggestedMinimumHeight;
        int iCombineMeasuredStates = 0;
        int iMax2 = suggestedMinimumWidth;
        int i39 = 0;
        for (int size3 = arrayList2.size(); i39 < size3; size3 = i12) {
            View view4 = (View) arrayList2.get(i39);
            int i40 = i39;
            int i41 = iMax2;
            if (view4.getVisibility() == 8) {
                i12 = size3;
                arrayList = arrayList2;
                i19 = paddingLeft;
                i18 = layoutDirection2;
                iMax2 = i41;
                i23 = paddingRight;
            } else {
                e eVar2 = (e) view4.getLayoutParams();
                int i42 = eVar2.f74700e;
                if (i42 < 0 || mode == 0) {
                    i12 = size3;
                } else {
                    int iN = coordinatorLayout.n(i42);
                    int i43 = eVar2.f74698c;
                    if (i43 == 0) {
                        i43 = 8388661;
                    }
                    int absoluteGravity2 = Gravity.getAbsoluteGravity(i43, layoutDirection2) & 7;
                    i12 = size3;
                    if ((absoluteGravity2 == 3 && !z12) || (absoluteGravity2 == 5 && z12)) {
                        iMax = Math.max(0, (size - paddingRight) - iN);
                    } else if ((absoluteGravity2 == 5 && !z12) || (absoluteGravity2 == 3 && z12)) {
                        iMax = Math.max(0, iN - paddingLeft);
                    }
                    i13 = iCombineMeasuredStates;
                    i14 = iMax;
                    if (z13 || view4.getFitsSystemWindows()) {
                        iMakeMeasureSpec = i5;
                        iMakeMeasureSpec2 = i11;
                    } else {
                        int iC = coordinatorLayout.n.c() + coordinatorLayout.n.b();
                        int iA = coordinatorLayout.n.a() + coordinatorLayout.n.d();
                        iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(size - iC, mode);
                        iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(size2 - iA, mode2);
                    }
                    bVar = eVar2.f74696a;
                    if (bVar == null) {
                        int i44 = i38;
                        int i45 = iMakeMeasureSpec2;
                        i19 = paddingLeft;
                        i21 = i13;
                        arrayList = arrayList2;
                        i22 = i41;
                        i23 = paddingRight;
                        i24 = i44;
                        i18 = layoutDirection2;
                        eVar = eVar2;
                        boolean zM = bVar.m(this, view4, iMakeMeasureSpec, i14, i45);
                        view = view4;
                        i16 = iMakeMeasureSpec;
                        i17 = i14;
                        i15 = i45;
                        if (zM) {
                            coordinatorLayout = this;
                        }
                        iMax2 = Math.max(i22, view.getMeasuredWidth() + i36 + ((ViewGroup.MarginLayoutParams) eVar).leftMargin + ((ViewGroup.MarginLayoutParams) eVar).rightMargin);
                        int iMax3 = Math.max(i24, view.getMeasuredHeight() + i37 + ((ViewGroup.MarginLayoutParams) eVar).topMargin + ((ViewGroup.MarginLayoutParams) eVar).bottomMargin);
                        iCombineMeasuredStates = View.combineMeasuredStates(i21, view.getMeasuredState());
                        i38 = iMax3;
                    } else {
                        int i46 = i14;
                        i15 = iMakeMeasureSpec2;
                        i16 = iMakeMeasureSpec;
                        i17 = i46;
                        i18 = layoutDirection2;
                        eVar = eVar2;
                        view = view4;
                        i19 = paddingLeft;
                        i21 = i13;
                        arrayList = arrayList2;
                        i22 = i41;
                        i23 = paddingRight;
                        i24 = i38;
                    }
                    coordinatorLayout = this;
                    coordinatorLayout.measureChildWithMargins(view, i16, i17, i15, 0);
                    iMax2 = Math.max(i22, view.getMeasuredWidth() + i36 + ((ViewGroup.MarginLayoutParams) eVar).leftMargin + ((ViewGroup.MarginLayoutParams) eVar).rightMargin);
                    int iMax32 = Math.max(i24, view.getMeasuredHeight() + i37 + ((ViewGroup.MarginLayoutParams) eVar).topMargin + ((ViewGroup.MarginLayoutParams) eVar).bottomMargin);
                    iCombineMeasuredStates = View.combineMeasuredStates(i21, view.getMeasuredState());
                    i38 = iMax32;
                }
                i13 = iCombineMeasuredStates;
                i14 = 0;
                if (z13) {
                    iMakeMeasureSpec = i5;
                    iMakeMeasureSpec2 = i11;
                    bVar = eVar2.f74696a;
                    if (bVar == null) {
                    }
                    coordinatorLayout = this;
                    coordinatorLayout.measureChildWithMargins(view, i16, i17, i15, 0);
                    iMax2 = Math.max(i22, view.getMeasuredWidth() + i36 + ((ViewGroup.MarginLayoutParams) eVar).leftMargin + ((ViewGroup.MarginLayoutParams) eVar).rightMargin);
                    int iMax322 = Math.max(i24, view.getMeasuredHeight() + i37 + ((ViewGroup.MarginLayoutParams) eVar).topMargin + ((ViewGroup.MarginLayoutParams) eVar).bottomMargin);
                    iCombineMeasuredStates = View.combineMeasuredStates(i21, view.getMeasuredState());
                    i38 = iMax322;
                }
            }
            i39 = i40 + 1;
            arrayList2 = arrayList;
            paddingLeft = i19;
            paddingRight = i23;
            layoutDirection2 = i18;
        }
        int i47 = iCombineMeasuredStates;
        coordinatorLayout.setMeasuredDimension(View.resolveSizeAndState(iMax2, i5, (-16777216) & i47), View.resolveSizeAndState(i38, i11, i47 << 16));
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedFling(View view, float f11, float f12, boolean z11) {
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() != 8) {
                e eVar = (e) childAt.getLayoutParams();
                if (eVar.a(0)) {
                    b bVar = eVar.f74696a;
                }
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedPreFling(View view, float f11, float f12) {
        b bVar;
        int childCount = getChildCount();
        boolean zN = false;
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() != 8) {
                e eVar = (e) childAt.getLayoutParams();
                if (eVar.a(0) && (bVar = eVar.f74696a) != null) {
                    zN |= bVar.n(view);
                }
            }
        }
        return zN;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedPreScroll(View view, int i5, int i11, int[] iArr) {
        c(view, i5, i11, iArr, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScroll(View view, int i5, int i11, int i12, int i13) {
        f(view, i5, i11, i12, i13, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScrollAccepted(View view, View view2, int i5) {
        b(view, view2, i5, 0);
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        Parcelable parcelable2;
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.f14272a);
        SparseArray sparseArray = savedState.f14216c;
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            int id2 = childAt.getId();
            b bVar = o(childAt).f74696a;
            if (id2 != -1 && bVar != null && (parcelable2 = (Parcelable) sparseArray.get(id2)) != null) {
                bVar.r(childAt, parcelable2);
            }
        }
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        Parcelable parcelableS;
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        SparseArray sparseArray = new SparseArray();
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            int id2 = childAt.getId();
            b bVar = ((e) childAt.getLayoutParams()).f74696a;
            if (id2 != -1 && bVar != null && (parcelableS = bVar.s(childAt)) != null) {
                sparseArray.append(id2, parcelableS);
            }
        }
        savedState.f14216c = sparseArray;
        return savedState;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onStartNestedScroll(View view, View view2, int i5) {
        return g(view, view2, i5, 0);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onStopNestedScroll(View view) {
        a(0, view);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x002f  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0035  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x004a  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0015 A[PHI: r3
      0x0015: PHI (r3v4 boolean) = (r3v2 boolean), (r3v5 boolean) binds: [B:10:0x0022, B:5:0x0012] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        boolean zT;
        boolean zV;
        MotionEvent motionEventObtain;
        int actionMasked = motionEvent.getActionMasked();
        if (this.f14208j == null) {
            zT = t(motionEvent, 1);
            if (!zT) {
                zV = false;
            }
            motionEventObtain = null;
            if (this.f14208j != null) {
                zV |= super.onTouchEvent(motionEvent);
            } else if (zT) {
                long jUptimeMillis = SystemClock.uptimeMillis();
                motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                super.onTouchEvent(motionEventObtain);
            }
            if (motionEventObtain != null) {
                motionEventObtain.recycle();
            }
            if (actionMasked == 1 && actionMasked != 3) {
                return zV;
            }
            u(false);
            return zV;
        }
        zT = false;
        b bVar = ((e) this.f14208j.getLayoutParams()).f74696a;
        if (bVar != null) {
            zV = bVar.v(this, this.f14208j, motionEvent);
        }
        motionEventObtain = null;
        if (this.f14208j != null) {
        }
        if (motionEventObtain != null) {
        }
        if (actionMasked == 1) {
        }
        u(false);
        return zV;
    }

    public final boolean p(View view, int i5, int i11) {
        c cVar = f14198x;
        Rect rectD = d();
        l(view, rectD);
        try {
            return rectD.contains(i5, i11);
        } finally {
            rectD.setEmpty();
            cVar.n(rectD);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00de  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void q(int i5) {
        int i11;
        Rect rect;
        int i12;
        ArrayList arrayList;
        boolean zH;
        boolean z11;
        boolean z12;
        int width;
        int i13;
        int i14;
        int i15;
        int height;
        int i16;
        int i17;
        int i18;
        ArrayList arrayList2;
        e eVar;
        int i19;
        int i21;
        Rect rect2;
        int i22;
        View view;
        b bVar;
        WeakHashMap weakHashMap = a1.f250a;
        int layoutDirection = getLayoutDirection();
        ArrayList arrayList3 = this.f14199a;
        int size = arrayList3.size();
        Rect rectD = d();
        Rect rectD2 = d();
        Rect rectD3 = d();
        int i23 = 0;
        while (true) {
            c cVar = f14198x;
            if (i23 >= size) {
                Rect rect3 = rectD3;
                rectD.setEmpty();
                cVar.n(rectD);
                rectD2.setEmpty();
                cVar.n(rectD2);
                rect3.setEmpty();
                cVar.n(rect3);
                return;
            }
            View view2 = (View) arrayList3.get(i23);
            e eVar2 = (e) view2.getLayoutParams();
            if (i5 != 0 || view2.getVisibility() != 8) {
                int i24 = 0;
                while (i24 < i23) {
                    if (eVar2.f74707l == ((View) arrayList3.get(i24))) {
                        e eVar3 = (e) view2.getLayoutParams();
                        if (eVar3.f74706k != null) {
                            Rect rectD4 = d();
                            Rect rectD5 = d();
                            e eVar4 = eVar2;
                            Rect rectD6 = d();
                            l(eVar3.f74706k, rectD4);
                            j(view2, rectD5, false);
                            int measuredWidth = view2.getMeasuredWidth();
                            View view3 = view2;
                            int measuredHeight = view3.getMeasuredHeight();
                            arrayList2 = arrayList3;
                            eVar = eVar4;
                            i19 = i24;
                            layoutDirection = layoutDirection;
                            i22 = i23;
                            view = view3;
                            m(layoutDirection, rectD4, rectD6, eVar3, measuredWidth, measuredHeight);
                            i21 = size;
                            rect2 = rectD3;
                            boolean z13 = (rectD6.left == rectD5.left && rectD6.top == rectD5.top) ? false : true;
                            h(eVar3, rectD6, measuredWidth, measuredHeight);
                            int i25 = rectD6.left - rectD5.left;
                            int i26 = rectD6.top - rectD5.top;
                            if (i25 != 0) {
                                WeakHashMap weakHashMap2 = a1.f250a;
                                view.offsetLeftAndRight(i25);
                            }
                            if (i26 != 0) {
                                WeakHashMap weakHashMap3 = a1.f250a;
                                view.offsetTopAndBottom(i26);
                            }
                            if (z13 && (bVar = eVar3.f74696a) != null) {
                                bVar.h(this, view, eVar3.f74706k);
                            }
                            rectD4.setEmpty();
                            cVar.n(rectD4);
                            rectD5.setEmpty();
                            cVar.n(rectD5);
                            rectD6.setEmpty();
                            cVar.n(rectD6);
                        } else {
                            arrayList2 = arrayList3;
                            eVar = eVar2;
                            i19 = i24;
                            i21 = size;
                            rect2 = rectD3;
                            i22 = i23;
                            view = view2;
                        }
                    }
                    i24 = i19 + 1;
                    eVar2 = eVar;
                    view2 = view;
                    arrayList3 = arrayList2;
                    size = i21;
                    i23 = i22;
                    rectD3 = rect2;
                }
                ArrayList arrayList4 = arrayList3;
                e eVar5 = eVar2;
                int i27 = size;
                Rect rect4 = rectD3;
                i11 = i23;
                View view4 = view2;
                j(view4, rectD2, true);
                if (eVar5.f74702g != 0 && !rectD2.isEmpty()) {
                    int absoluteGravity = Gravity.getAbsoluteGravity(eVar5.f74702g, layoutDirection);
                    int i28 = absoluteGravity & 112;
                    if (i28 == 48) {
                        rectD.top = Math.max(rectD.top, rectD2.bottom);
                    } else if (i28 == 80) {
                        rectD.bottom = Math.max(rectD.bottom, getHeight() - rectD2.top);
                    }
                    int i29 = absoluteGravity & 7;
                    if (i29 == 3) {
                        rectD.left = Math.max(rectD.left, rectD2.right);
                    } else if (i29 == 5) {
                        rectD.right = Math.max(rectD.right, getWidth() - rectD2.left);
                    }
                }
                if (eVar5.f74703h != 0 && view4.getVisibility() == 0) {
                    WeakHashMap weakHashMap4 = a1.f250a;
                    if (view4.isLaidOut() && view4.getWidth() > 0 && view4.getHeight() > 0) {
                        e eVar6 = (e) view4.getLayoutParams();
                        b bVar2 = eVar6.f74696a;
                        Rect rectD7 = d();
                        Rect rectD8 = d();
                        rectD8.set(view4.getLeft(), view4.getTop(), view4.getRight(), view4.getBottom());
                        if (bVar2 == null || !bVar2.e(view4, rectD7)) {
                            rectD7.set(rectD8);
                        } else if (!rectD8.contains(rectD7)) {
                            throw new IllegalArgumentException("Rect should be within the child's bounds. Rect:" + rectD7.toShortString() + " | Bounds:" + rectD8.toShortString());
                        }
                        rectD8.setEmpty();
                        cVar.n(rectD8);
                        if (rectD7.isEmpty()) {
                            rectD7.setEmpty();
                            cVar.n(rectD7);
                        } else {
                            int absoluteGravity2 = Gravity.getAbsoluteGravity(eVar6.f74703h, layoutDirection);
                            if ((absoluteGravity2 & 48) != 48 || (i17 = (rectD7.top - ((ViewGroup.MarginLayoutParams) eVar6).topMargin) - eVar6.f74705j) >= (i18 = rectD.top)) {
                                z11 = false;
                            } else {
                                w(i18 - i17, view4);
                                z11 = true;
                            }
                            if ((absoluteGravity2 & 80) == 80 && (height = ((getHeight() - rectD7.bottom) - ((ViewGroup.MarginLayoutParams) eVar6).bottomMargin) + eVar6.f74705j) < (i16 = rectD.bottom)) {
                                w(height - i16, view4);
                                z11 = true;
                            }
                            if (!z11) {
                                w(0, view4);
                            }
                            if ((absoluteGravity2 & 3) != 3 || (i14 = (rectD7.left - ((ViewGroup.MarginLayoutParams) eVar6).leftMargin) - eVar6.f74704i) >= (i15 = rectD.left)) {
                                z12 = false;
                            } else {
                                v(i15 - i14, view4);
                                z12 = true;
                            }
                            if ((absoluteGravity2 & 5) == 5 && (width = ((getWidth() - rectD7.right) - ((ViewGroup.MarginLayoutParams) eVar6).rightMargin) + eVar6.f74704i) < (i13 = rectD.right)) {
                                v(width - i13, view4);
                                z12 = true;
                            }
                            if (!z12) {
                                v(0, view4);
                            }
                            rectD7.setEmpty();
                            cVar.n(rectD7);
                        }
                    }
                }
                if (i5 != 2) {
                    rect = rect4;
                    rect.set(((e) view4.getLayoutParams()).f74709p);
                    if (rect.equals(rectD2)) {
                        arrayList = arrayList4;
                        i12 = i27;
                    } else {
                        ((e) view4.getLayoutParams()).f74709p.set(rectD2);
                    }
                } else {
                    rect = rect4;
                }
                int i31 = i11 + 1;
                i12 = i27;
                while (true) {
                    arrayList = arrayList4;
                    if (i31 >= i12) {
                        break;
                    }
                    View view5 = (View) arrayList.get(i31);
                    e eVar7 = (e) view5.getLayoutParams();
                    b bVar3 = eVar7.f74696a;
                    if (bVar3 != null && bVar3.f(view5, view4)) {
                        if (i5 == 0 && eVar7.o) {
                            eVar7.o = false;
                        } else {
                            if (i5 != 2) {
                                zH = bVar3.h(this, view5, view4);
                            } else {
                                bVar3.i(this, view4);
                                zH = true;
                            }
                            if (i5 == 1) {
                                eVar7.o = zH;
                            }
                        }
                    }
                    i31++;
                    arrayList4 = arrayList;
                }
            } else {
                arrayList = arrayList3;
                i12 = size;
                rect = rectD3;
                i11 = i23;
            }
            i23 = i11 + 1;
            rectD3 = rect;
            size = i12;
            arrayList3 = arrayList;
        }
    }

    public final void r(int i5, View view) {
        Rect rectD;
        Rect rectD2;
        e eVar = (e) view.getLayoutParams();
        View view2 = eVar.f74706k;
        if (view2 == null && eVar.f74701f != -1) {
            throw new IllegalStateException("An anchor may not be changed after CoordinatorLayout measurement begins before layout is complete.");
        }
        c cVar = f14198x;
        if (view2 != null) {
            rectD = d();
            rectD2 = d();
            try {
                l(view2, rectD);
                e eVar2 = (e) view.getLayoutParams();
                int measuredWidth = view.getMeasuredWidth();
                int measuredHeight = view.getMeasuredHeight();
                m(i5, rectD, rectD2, eVar2, measuredWidth, measuredHeight);
                h(eVar2, rectD2, measuredWidth, measuredHeight);
                view.layout(rectD2.left, rectD2.top, rectD2.right, rectD2.bottom);
                return;
            } finally {
                rectD.setEmpty();
                cVar.n(rectD);
                rectD2.setEmpty();
                cVar.n(rectD2);
            }
        }
        int i11 = eVar.f74700e;
        if (i11 < 0) {
            e eVar3 = (e) view.getLayoutParams();
            rectD = d();
            rectD.set(getPaddingLeft() + ((ViewGroup.MarginLayoutParams) eVar3).leftMargin, getPaddingTop() + ((ViewGroup.MarginLayoutParams) eVar3).topMargin, (getWidth() - getPaddingRight()) - ((ViewGroup.MarginLayoutParams) eVar3).rightMargin, (getHeight() - getPaddingBottom()) - ((ViewGroup.MarginLayoutParams) eVar3).bottomMargin);
            if (this.n != null) {
                WeakHashMap weakHashMap = a1.f250a;
                if (getFitsSystemWindows() && !view.getFitsSystemWindows()) {
                    rectD.left = this.n.b() + rectD.left;
                    rectD.top = this.n.d() + rectD.top;
                    rectD.right -= this.n.c();
                    rectD.bottom -= this.n.a();
                }
            }
            rectD2 = d();
            int i12 = eVar3.f74698c;
            if ((i12 & 7) == 0) {
                i12 |= 8388611;
            }
            if ((i12 & 112) == 0) {
                i12 |= 48;
            }
            Gravity.apply(i12, view.getMeasuredWidth(), view.getMeasuredHeight(), rectD, rectD2, i5);
            view.layout(rectD2.left, rectD2.top, rectD2.right, rectD2.bottom);
            return;
        }
        e eVar4 = (e) view.getLayoutParams();
        int i13 = eVar4.f74698c;
        if (i13 == 0) {
            i13 = 8388661;
        }
        int absoluteGravity = Gravity.getAbsoluteGravity(i13, i5);
        int i14 = absoluteGravity & 7;
        int i15 = absoluteGravity & 112;
        int width = getWidth();
        int height = getHeight();
        int measuredWidth2 = view.getMeasuredWidth();
        int measuredHeight2 = view.getMeasuredHeight();
        if (i5 == 1) {
            i11 = width - i11;
        }
        int iN = n(i11) - measuredWidth2;
        if (i14 == 1) {
            iN += measuredWidth2 / 2;
        } else if (i14 == 5) {
            iN += measuredWidth2;
        }
        int i16 = i15 != 16 ? i15 != 80 ? 0 : measuredHeight2 : measuredHeight2 / 2;
        int iMax = Math.max(getPaddingLeft() + ((ViewGroup.MarginLayoutParams) eVar4).leftMargin, Math.min(iN, ((width - getPaddingRight()) - measuredWidth2) - ((ViewGroup.MarginLayoutParams) eVar4).rightMargin));
        int iMax2 = Math.max(getPaddingTop() + ((ViewGroup.MarginLayoutParams) eVar4).topMargin, Math.min(i16, ((height - getPaddingBottom()) - measuredHeight2) - ((ViewGroup.MarginLayoutParams) eVar4).bottomMargin));
        view.layout(iMax, iMax2, measuredWidth2 + iMax, measuredHeight2 + iMax2);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z11) {
        b bVar = ((e) view.getLayoutParams()).f74696a;
        if (bVar == null || !bVar.q(this, view, rect, z11)) {
            return super.requestChildRectangleOnScreen(view, rect, z11);
        }
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z11) {
        super.requestDisallowInterceptTouchEvent(z11);
        if (!z11 || this.f14205g) {
            return;
        }
        u(false);
        this.f14205g = true;
    }

    public final void s(int i5, int i11, int i12, View view) {
        measureChildWithMargins(view, i5, i11, i12, 0);
    }

    @Override // android.view.View
    public final void setFitsSystemWindows(boolean z11) {
        super.setFitsSystemWindows(z11);
        x();
    }

    @Override // android.view.ViewGroup
    public final void setOnHierarchyChangeListener(ViewGroup.OnHierarchyChangeListener onHierarchyChangeListener) {
        this.f14213q = onHierarchyChangeListener;
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        super.setVisibility(i5);
        boolean z11 = i5 == 0;
        Drawable drawable = this.f14212p;
        if (drawable == null || drawable.isVisible() == z11) {
            return;
        }
        drawable.setVisible(z11, false);
    }

    public final boolean t(MotionEvent motionEvent, int i5) {
        int actionMasked = motionEvent.getActionMasked();
        ArrayList arrayList = this.f14201c;
        arrayList.clear();
        boolean zIsChildrenDrawingOrderEnabled = isChildrenDrawingOrderEnabled();
        int childCount = getChildCount();
        for (int i11 = childCount - 1; i11 >= 0; i11--) {
            arrayList.add(getChildAt(zIsChildrenDrawingOrderEnabled ? getChildDrawingOrder(childCount, i11) : i11));
        }
        r2 r2Var = f14197w;
        if (r2Var != null) {
            Collections.sort(arrayList, r2Var);
        }
        int size = arrayList.size();
        MotionEvent motionEventObtain = null;
        boolean zK = false;
        for (int i12 = 0; i12 < size; i12++) {
            View view = (View) arrayList.get(i12);
            b bVar = ((e) view.getLayoutParams()).f74696a;
            if (zK && actionMasked != 0) {
                if (bVar != null) {
                    if (motionEventObtain == null) {
                        long jUptimeMillis = SystemClock.uptimeMillis();
                        motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                    }
                    if (i5 == 0) {
                        bVar.k(this, view, motionEventObtain);
                    } else if (i5 == 1) {
                        bVar.v(this, view, motionEventObtain);
                    }
                }
            } else if (!zK && bVar != null) {
                if (i5 == 0) {
                    zK = bVar.k(this, view, motionEvent);
                } else if (i5 == 1) {
                    zK = bVar.v(this, view, motionEvent);
                }
                if (zK) {
                    this.f14208j = view;
                }
            }
        }
        arrayList.clear();
        return zK;
    }

    public final void u(boolean z11) {
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            b bVar = ((e) childAt.getLayoutParams()).f74696a;
            if (bVar != null) {
                long jUptimeMillis = SystemClock.uptimeMillis();
                MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                if (z11) {
                    bVar.k(this, childAt, motionEventObtain);
                } else {
                    bVar.v(this, childAt, motionEventObtain);
                }
                motionEventObtain.recycle();
            }
        }
        for (int i11 = 0; i11 < childCount; i11++) {
            ((e) getChildAt(i11).getLayoutParams()).getClass();
        }
        this.f14208j = null;
        this.f14205g = false;
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.f14212p;
    }

    public final void x() {
        WeakHashMap weakHashMap = a1.f250a;
        if (!getFitsSystemWindows()) {
            s0.l(this, null);
            return;
        }
        if (this.f14214r == null) {
            this.f14214r = new je.f(this, 12);
        }
        s0.l(this, this.f14214r);
        setSystemUiVisibility(1280);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof e ? new e((e) layoutParams) : layoutParams instanceof ViewGroup.MarginLayoutParams ? new e((ViewGroup.MarginLayoutParams) layoutParams) : new e(layoutParams);
    }
}
