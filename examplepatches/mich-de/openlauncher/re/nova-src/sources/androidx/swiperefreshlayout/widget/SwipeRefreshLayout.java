package androidx.swiperefreshlayout.widget;

import a5.a1;
import a5.s0;
import a5.v;
import a5.w;
import a5.x;
import a5.y;
import a5.z;
import ae.i;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.OvalShape;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.DecelerateInterpolator;
import android.widget.ListView;
import h7.d;
import h7.e;
import h7.f;
import h7.g;
import h7.h;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public class SwipeRefreshLayout extends ViewGroup implements y, x, v {
    public static final int[] I = {16842766};
    public g A;
    public h B;
    public h C;
    public boolean D;
    public final int E;
    public final f F;
    public final g G;
    public final g H;

    /* renamed from: a, reason: collision with root package name */
    public View f15283a;

    /* renamed from: b, reason: collision with root package name */
    public i f15284b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f15285c;

    /* renamed from: d, reason: collision with root package name */
    public final int f15286d;

    /* renamed from: e, reason: collision with root package name */
    public final float f15287e;

    /* renamed from: f, reason: collision with root package name */
    public float f15288f;

    /* renamed from: g, reason: collision with root package name */
    public final z f15289g;

    /* renamed from: h, reason: collision with root package name */
    public final w f15290h;

    /* renamed from: i, reason: collision with root package name */
    public final int[] f15291i;

    /* renamed from: j, reason: collision with root package name */
    public final int[] f15292j;

    /* renamed from: k, reason: collision with root package name */
    public final int[] f15293k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f15294l;

    /* renamed from: m, reason: collision with root package name */
    public final int f15295m;
    public int n;
    public float o;

    /* renamed from: p, reason: collision with root package name */
    public float f15296p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f15297q;

    /* renamed from: r, reason: collision with root package name */
    public int f15298r;

    /* renamed from: s, reason: collision with root package name */
    public final DecelerateInterpolator f15299s;

    /* renamed from: t, reason: collision with root package name */
    public final h7.a f15300t;

    /* renamed from: u, reason: collision with root package name */
    public int f15301u;

    /* renamed from: v, reason: collision with root package name */
    public int f15302v;

    /* renamed from: w, reason: collision with root package name */
    public final int f15303w;

    /* renamed from: x, reason: collision with root package name */
    public final int f15304x;

    /* renamed from: y, reason: collision with root package name */
    public final e f15305y;

    /* renamed from: z, reason: collision with root package name */
    public g f15306z;

    public SwipeRefreshLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f15285c = false;
        this.f15287e = -1.0f;
        this.f15291i = new int[2];
        this.f15292j = new int[2];
        this.f15293k = new int[2];
        this.f15298r = -1;
        this.f15301u = -1;
        this.F = new f(this, 0);
        this.G = new g(this, 2);
        this.H = new g(this, 3);
        this.f15286d = ViewConfiguration.get(context).getScaledTouchSlop();
        this.f15295m = getResources().getInteger(17694721);
        setWillNotDraw(false);
        this.f15299s = new DecelerateInterpolator(2.0f);
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        int i5 = (int) (displayMetrics.density * 40.0f);
        this.E = i5;
        h7.a aVar = new h7.a(getContext());
        float f11 = aVar.getContext().getResources().getDisplayMetrics().density;
        TypedArray typedArrayObtainStyledAttributes = aVar.getContext().obtainStyledAttributes(g7.a.f57196a);
        aVar.f59496b = typedArrayObtainStyledAttributes.getColor(0, -328966);
        typedArrayObtainStyledAttributes.recycle();
        ShapeDrawable shapeDrawable = new ShapeDrawable(new OvalShape());
        WeakHashMap weakHashMap = a1.f250a;
        s0.k(aVar, f11 * 4.0f);
        shapeDrawable.getPaint().setColor(aVar.f59496b);
        aVar.setBackground(shapeDrawable);
        this.f15300t = aVar;
        e eVar = new e(getContext());
        this.f15305y = eVar;
        float f12 = eVar.f59525c.getDisplayMetrics().density;
        float f13 = 2.5f * f12;
        d dVar = eVar.f59523a;
        dVar.f59508h = f13;
        dVar.f59502b.setStrokeWidth(f13);
        dVar.f59515q = 7.5f * f12;
        dVar.f59510j = 0;
        dVar.f59519u = dVar.f59509i[0];
        dVar.f59516r = (int) (10.0f * f12);
        dVar.f59517s = (int) (5.0f * f12);
        eVar.invalidateSelf();
        this.f15300t.setImageDrawable(this.f15305y);
        this.f15300t.setVisibility(8);
        addView(this.f15300t);
        setChildrenDrawingOrderEnabled(true);
        int i11 = (int) (displayMetrics.density * 64.0f);
        this.f15304x = i11;
        this.f15287e = i11;
        this.f15289g = new z();
        this.f15290h = new w(this);
        setNestedScrollingEnabled(true);
        int i12 = -i5;
        this.n = i12;
        this.f15303w = i12;
        k(1.0f);
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, I);
        setEnabled(typedArrayObtainStyledAttributes2.getBoolean(0, true));
        typedArrayObtainStyledAttributes2.recycle();
    }

    @Override // a5.x
    public final void a(int i5, View view) {
        if (i5 == 0) {
            onStopNestedScroll(view);
        }
    }

    @Override // a5.x
    public final void b(View view, View view2, int i5, int i11) {
        if (i11 == 0) {
            onNestedScrollAccepted(view, view2, i5);
        }
    }

    @Override // a5.x
    public final void c(View view, int i5, int i11, int[] iArr, int i12) {
        if (i12 == 0) {
            onNestedPreScroll(view, i5, i11, iArr);
        }
    }

    public final boolean d() {
        View view = this.f15283a;
        return view instanceof ListView ? ((ListView) view).canScrollList(-1) : view.canScrollVertically(-1);
    }

    @Override // android.view.View
    public final boolean dispatchNestedFling(float f11, float f12, boolean z11) {
        return this.f15290h.a(f11, f12, z11);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreFling(float f11, float f12) {
        return this.f15290h.b(f11, f12);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreScroll(int i5, int i11, int[] iArr, int[] iArr2) {
        return this.f15290h.c(i5, i11, iArr, iArr2, 0);
    }

    @Override // android.view.View
    public final boolean dispatchNestedScroll(int i5, int i11, int i12, int i13, int[] iArr) {
        return this.f15290h.d(i5, i11, i12, i13, iArr, 0, null);
    }

    @Override // a5.y
    public final void e(View view, int i5, int i11, int i12, int i13, int i14, int[] iArr) {
        if (i14 != 0) {
            return;
        }
        int i15 = iArr[1];
        if (i14 == 0) {
            this.f15290h.d(i5, i11, i12, i13, this.f15292j, i14, iArr);
        }
        int i16 = i13 - (iArr[1] - i15);
        if ((i16 == 0 ? i13 + this.f15292j[1] : i16) >= 0 || d()) {
            return;
        }
        float fAbs = this.f15288f + Math.abs(r14);
        this.f15288f = fAbs;
        j(fAbs);
        iArr[1] = iArr[1] + i16;
    }

    @Override // a5.x
    public final void f(View view, int i5, int i11, int i12, int i13, int i14) {
        e(view, i5, i11, i12, i13, i14, this.f15293k);
    }

    @Override // a5.x
    public final boolean g(View view, View view2, int i5, int i11) {
        if (i11 == 0) {
            return onStartNestedScroll(view, view2, i5);
        }
        return false;
    }

    @Override // android.view.ViewGroup
    public final int getChildDrawingOrder(int i5, int i11) {
        int i12 = this.f15301u;
        return i12 < 0 ? i11 : i11 == i5 + (-1) ? i12 : i11 >= i12 ? i11 + 1 : i11;
    }

    @Override // android.view.ViewGroup
    public final int getNestedScrollAxes() {
        return this.f15289g.a();
    }

    public final void h() {
        if (this.f15283a == null) {
            for (int i5 = 0; i5 < getChildCount(); i5++) {
                View childAt = getChildAt(i5);
                if (!childAt.equals(this.f15300t)) {
                    this.f15283a = childAt;
                    return;
                }
            }
        }
    }

    @Override // android.view.View
    public final boolean hasNestedScrollingParent() {
        return this.f15290h.f(0);
    }

    public final void i(float f11) {
        if (f11 > this.f15287e) {
            m(true, true);
            return;
        }
        this.f15285c = false;
        e eVar = this.f15305y;
        d dVar = eVar.f59523a;
        dVar.f59505e = 0.0f;
        dVar.f59506f = 0.0f;
        eVar.invalidateSelf();
        f fVar = new f(this, 1);
        this.f15302v = this.n;
        g gVar = this.H;
        gVar.reset();
        gVar.setDuration(200L);
        gVar.setInterpolator(this.f15299s);
        h7.a aVar = this.f15300t;
        aVar.f59495a = fVar;
        aVar.clearAnimation();
        this.f15300t.startAnimation(gVar);
        e eVar2 = this.f15305y;
        d dVar2 = eVar2.f59523a;
        if (dVar2.n) {
            dVar2.n = false;
        }
        eVar2.invalidateSelf();
    }

    @Override // android.view.View
    public final boolean isNestedScrollingEnabled() {
        return this.f15290h.f379d;
    }

    public final void j(float f11) {
        h hVar;
        h hVar2;
        e eVar = this.f15305y;
        d dVar = eVar.f59523a;
        if (!dVar.n) {
            dVar.n = true;
        }
        eVar.invalidateSelf();
        float f12 = this.f15287e;
        float fMin = Math.min(1.0f, Math.abs(f11 / f12));
        float fMax = (((float) Math.max(fMin - 0.4d, 0.0d)) * 5.0f) / 3.0f;
        float fAbs = Math.abs(f11) - f12;
        float f13 = this.f15304x;
        double dMax = Math.max(0.0f, Math.min(fAbs, f13 * 2.0f) / f13) / 4.0f;
        float fPow = ((float) (dMax - Math.pow(dMax, 2.0d))) * 2.0f;
        int i5 = this.f15303w + ((int) ((f13 * fMin) + (f13 * fPow * 2.0f)));
        if (this.f15300t.getVisibility() != 0) {
            this.f15300t.setVisibility(0);
        }
        this.f15300t.setScaleX(1.0f);
        this.f15300t.setScaleY(1.0f);
        if (f11 < f12) {
            if (this.f15305y.f59523a.f59518t > 76 && ((hVar2 = this.B) == null || !hVar2.hasStarted() || hVar2.hasEnded())) {
                h hVar3 = new h(this, this.f15305y.f59523a.f59518t, 76);
                hVar3.setDuration(300L);
                h7.a aVar = this.f15300t;
                aVar.f59495a = null;
                aVar.clearAnimation();
                this.f15300t.startAnimation(hVar3);
                this.B = hVar3;
            }
        } else if (this.f15305y.f59523a.f59518t < 255 && ((hVar = this.C) == null || !hVar.hasStarted() || hVar.hasEnded())) {
            h hVar4 = new h(this, this.f15305y.f59523a.f59518t, 255);
            hVar4.setDuration(300L);
            h7.a aVar2 = this.f15300t;
            aVar2.f59495a = null;
            aVar2.clearAnimation();
            this.f15300t.startAnimation(hVar4);
            this.C = hVar4;
        }
        float fMin2 = Math.min(0.8f, fMax * 0.8f);
        e eVar2 = this.f15305y;
        d dVar2 = eVar2.f59523a;
        dVar2.f59505e = 0.0f;
        dVar2.f59506f = fMin2;
        eVar2.invalidateSelf();
        float fMin3 = Math.min(1.0f, fMax);
        e eVar3 = this.f15305y;
        d dVar3 = eVar3.f59523a;
        if (fMin3 != dVar3.f59514p) {
            dVar3.f59514p = fMin3;
        }
        eVar3.invalidateSelf();
        e eVar4 = this.f15305y;
        eVar4.f59523a.f59507g = ((fPow * 2.0f) + ((fMax * 0.4f) - 0.25f)) * 0.5f;
        eVar4.invalidateSelf();
        n(i5 - this.n);
    }

    public final void k(float f11) {
        n((this.f15302v + ((int) ((this.f15303w - r0) * f11))) - this.f15300t.getTop());
    }

    public final void l() {
        this.f15300t.clearAnimation();
        this.f15305y.stop();
        this.f15300t.setVisibility(8);
        this.f15300t.getBackground().setAlpha(255);
        this.f15305y.setAlpha(255);
        n(this.f15303w - this.n);
        this.n = this.f15300t.getTop();
    }

    public final void m(boolean z11, boolean z12) {
        if (this.f15285c != z11) {
            this.D = z12;
            h();
            this.f15285c = z11;
            f fVar = this.F;
            if (!z11) {
                g gVar = new g(this, 1);
                this.A = gVar;
                gVar.setDuration(150L);
                h7.a aVar = this.f15300t;
                aVar.f59495a = fVar;
                aVar.clearAnimation();
                this.f15300t.startAnimation(this.A);
                return;
            }
            this.f15302v = this.n;
            g gVar2 = this.G;
            gVar2.reset();
            gVar2.setDuration(200L);
            gVar2.setInterpolator(this.f15299s);
            if (fVar != null) {
                this.f15300t.f59495a = fVar;
            }
            this.f15300t.clearAnimation();
            this.f15300t.startAnimation(gVar2);
        }
    }

    public final void n(int i5) {
        h7.a aVar = this.f15300t;
        aVar.bringToFront();
        WeakHashMap weakHashMap = a1.f250a;
        aVar.offsetTopAndBottom(i5);
        this.n = aVar.getTop();
    }

    public final void o(float f11) {
        float f12 = this.f15296p;
        float f13 = f11 - f12;
        float f14 = this.f15286d;
        if (f13 <= f14 || this.f15297q) {
            return;
        }
        this.o = f12 + f14;
        this.f15297q = true;
        this.f15305y.setAlpha(76);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        l();
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x005f  */
    @Override // android.view.ViewGroup
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        h();
        int actionMasked = motionEvent.getActionMasked();
        if (isEnabled() && !d() && !this.f15285c && !this.f15294l) {
            if (actionMasked != 0) {
                if (actionMasked == 1) {
                    this.f15297q = false;
                    this.f15298r = -1;
                } else if (actionMasked == 2) {
                    int i5 = this.f15298r;
                    if (i5 == -1) {
                        Log.e("SwipeRefreshLayout", "Got ACTION_MOVE event but don't have an active pointer id.");
                        return false;
                    }
                    int iFindPointerIndex = motionEvent.findPointerIndex(i5);
                    if (iFindPointerIndex >= 0) {
                        o(motionEvent.getY(iFindPointerIndex));
                    }
                } else if (actionMasked != 3) {
                    if (actionMasked == 6) {
                        int actionIndex = motionEvent.getActionIndex();
                        if (motionEvent.getPointerId(actionIndex) == this.f15298r) {
                            this.f15298r = motionEvent.getPointerId(actionIndex == 0 ? 1 : 0);
                        }
                    }
                }
                return this.f15297q;
            }
            n(this.f15303w - this.f15300t.getTop());
            int pointerId = motionEvent.getPointerId(0);
            this.f15298r = pointerId;
            this.f15297q = false;
            int iFindPointerIndex2 = motionEvent.findPointerIndex(pointerId);
            if (iFindPointerIndex2 >= 0) {
                this.f15296p = motionEvent.getY(iFindPointerIndex2);
                return this.f15297q;
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int measuredWidth = getMeasuredWidth();
        int measuredHeight = getMeasuredHeight();
        if (getChildCount() == 0) {
            return;
        }
        if (this.f15283a == null) {
            h();
        }
        View view = this.f15283a;
        if (view == null) {
            return;
        }
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        view.layout(paddingLeft, paddingTop, ((measuredWidth - getPaddingLeft()) - getPaddingRight()) + paddingLeft, ((measuredHeight - getPaddingTop()) - getPaddingBottom()) + paddingTop);
        int measuredWidth2 = this.f15300t.getMeasuredWidth();
        int measuredHeight2 = this.f15300t.getMeasuredHeight();
        int i14 = measuredWidth / 2;
        int i15 = measuredWidth2 / 2;
        int i16 = this.n;
        this.f15300t.layout(i14 - i15, i16, i14 + i15, measuredHeight2 + i16);
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (this.f15283a == null) {
            h();
        }
        View view = this.f15283a;
        if (view == null) {
            return;
        }
        view.measure(View.MeasureSpec.makeMeasureSpec((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), 1073741824), View.MeasureSpec.makeMeasureSpec((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), 1073741824));
        int i12 = this.E;
        this.f15300t.measure(View.MeasureSpec.makeMeasureSpec(i12, 1073741824), View.MeasureSpec.makeMeasureSpec(i12, 1073741824));
        this.f15301u = -1;
        for (int i13 = 0; i13 < getChildCount(); i13++) {
            if (getChildAt(i13) == this.f15300t) {
                this.f15301u = i13;
                return;
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedFling(View view, float f11, float f12, boolean z11) {
        return this.f15290h.a(f11, f12, z11);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedPreFling(View view, float f11, float f12) {
        return this.f15290h.b(f11, f12);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedPreScroll(View view, int i5, int i11, int[] iArr) {
        if (i11 > 0) {
            float f11 = this.f15288f;
            if (f11 > 0.0f) {
                float f12 = i11;
                if (f12 > f11) {
                    iArr[1] = (int) f11;
                    this.f15288f = 0.0f;
                } else {
                    this.f15288f = f11 - f12;
                    iArr[1] = i11;
                }
                j(this.f15288f);
            }
        }
        int i12 = i5 - iArr[0];
        int i13 = i11 - iArr[1];
        int[] iArr2 = this.f15291i;
        if (dispatchNestedPreScroll(i12, i13, iArr2, null)) {
            iArr[0] = iArr[0] + iArr2[0];
            iArr[1] = iArr[1] + iArr2[1];
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScroll(View view, int i5, int i11, int i12, int i13) {
        e(view, i5, i11, i12, i13, 0, this.f15293k);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScrollAccepted(View view, View view2, int i5) {
        this.f15289g.f384a = i5;
        startNestedScroll(i5 & 2);
        this.f15288f = 0.0f;
        this.f15294l = true;
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        boolean z11 = savedState.f15307a;
        if (!z11 || this.f15285c == z11) {
            m(z11, false);
            return;
        }
        this.f15285c = z11;
        n((this.f15304x + this.f15303w) - this.n);
        this.D = false;
        this.f15300t.setVisibility(0);
        this.f15305y.setAlpha(255);
        g gVar = new g(this, 0);
        this.f15306z = gVar;
        gVar.setDuration(this.f15295m);
        f fVar = this.F;
        if (fVar != null) {
            this.f15300t.f59495a = fVar;
        }
        this.f15300t.clearAnimation();
        this.f15300t.startAnimation(this.f15306z);
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        return new SavedState(super.onSaveInstanceState(), this.f15285c);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onStartNestedScroll(View view, View view2, int i5) {
        return (!isEnabled() || this.f15285c || (i5 & 2) == 0) ? false : true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onStopNestedScroll(View view) {
        this.f15289g.f384a = 0;
        this.f15294l = false;
        float f11 = this.f15288f;
        if (f11 > 0.0f) {
            i(f11);
            this.f15288f = 0.0f;
        }
        stopNestedScroll();
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (isEnabled() && !d() && !this.f15285c && !this.f15294l) {
            if (actionMasked == 0) {
                this.f15298r = motionEvent.getPointerId(0);
                this.f15297q = false;
                return true;
            }
            if (actionMasked == 1) {
                int iFindPointerIndex = motionEvent.findPointerIndex(this.f15298r);
                if (iFindPointerIndex < 0) {
                    Log.e("SwipeRefreshLayout", "Got ACTION_UP event but don't have an active pointer id.");
                    return false;
                }
                if (this.f15297q) {
                    float y11 = (motionEvent.getY(iFindPointerIndex) - this.o) * 0.5f;
                    this.f15297q = false;
                    i(y11);
                }
                this.f15298r = -1;
                return false;
            }
            if (actionMasked == 2) {
                int iFindPointerIndex2 = motionEvent.findPointerIndex(this.f15298r);
                if (iFindPointerIndex2 < 0) {
                    Log.e("SwipeRefreshLayout", "Got ACTION_MOVE event but have an invalid active pointer id.");
                    return false;
                }
                float y12 = motionEvent.getY(iFindPointerIndex2);
                o(y12);
                if (this.f15297q) {
                    float f11 = (y12 - this.o) * 0.5f;
                    if (f11 > 0.0f) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                        j(f11);
                    }
                }
                return true;
            }
            if (actionMasked != 3) {
                if (actionMasked != 5) {
                    if (actionMasked == 6) {
                        int actionIndex = motionEvent.getActionIndex();
                        if (motionEvent.getPointerId(actionIndex) == this.f15298r) {
                            this.f15298r = motionEvent.getPointerId(actionIndex == 0 ? 1 : 0);
                            return true;
                        }
                    }
                    return true;
                }
                int actionIndex2 = motionEvent.getActionIndex();
                if (actionIndex2 < 0) {
                    Log.e("SwipeRefreshLayout", "Got ACTION_POINTER_DOWN event but have an invalid action index.");
                    return false;
                }
                this.f15298r = motionEvent.getPointerId(actionIndex2);
                return true;
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z11) {
        View view = this.f15283a;
        if (view != null) {
            WeakHashMap weakHashMap = a1.f250a;
            if (!s0.h(view)) {
                ViewParent parent = getParent();
                if (parent != null) {
                    parent.requestDisallowInterceptTouchEvent(z11);
                    return;
                }
                return;
            }
        }
        super.requestDisallowInterceptTouchEvent(z11);
    }

    @Override // android.view.View
    public final void setEnabled(boolean z11) {
        super.setEnabled(z11);
        if (z11) {
            return;
        }
        l();
    }

    @Override // android.view.View
    public final void setNestedScrollingEnabled(boolean z11) {
        w wVar = this.f15290h;
        if (wVar.f379d) {
            ViewGroup viewGroup = wVar.f378c;
            WeakHashMap weakHashMap = a1.f250a;
            s0.n(viewGroup);
        }
        wVar.f379d = z11;
    }

    @Override // android.view.View
    public final boolean startNestedScroll(int i5) {
        return this.f15290h.g(i5, 0);
    }

    @Override // android.view.View
    public final void stopNestedScroll() {
        this.f15290h.h(0);
    }

    public static class SavedState extends View.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final boolean f15307a;

        public SavedState(Parcelable parcelable, boolean z11) {
            super(parcelable);
            this.f15307a = z11;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeByte(this.f15307a ? (byte) 1 : (byte) 0);
        }

        public SavedState(Parcel parcel) {
            super(parcel);
            this.f15307a = parcel.readByte() != 0;
        }
    }
}
