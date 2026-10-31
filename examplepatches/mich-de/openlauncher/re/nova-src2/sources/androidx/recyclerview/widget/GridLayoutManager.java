package androidx.recyclerview.widget;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.GridView;
import java.util.Arrays;

/* loaded from: classes.dex */
public class GridLayoutManager extends LinearLayoutManager {

    /* renamed from: a, reason: collision with root package name */
    public boolean f14827a;

    /* renamed from: b, reason: collision with root package name */
    public int f14828b;

    /* renamed from: c, reason: collision with root package name */
    public int[] f14829c;

    /* renamed from: d, reason: collision with root package name */
    public View[] f14830d;

    /* renamed from: e, reason: collision with root package name */
    public final SparseIntArray f14831e;

    /* renamed from: f, reason: collision with root package name */
    public final SparseIntArray f14832f;

    /* renamed from: g, reason: collision with root package name */
    public i0 f14833g;

    /* renamed from: h, reason: collision with root package name */
    public final Rect f14834h;

    public GridLayoutManager(Context context, AttributeSet attributeSet, int i5, int i11) {
        super(context, attributeSet, i5, i11);
        this.f14827a = false;
        this.f14828b = -1;
        this.f14831e = new SparseIntArray();
        this.f14832f = new SparseIntArray();
        this.f14833g = new g0();
        this.f14834h = new Rect();
        J(z1.getProperties(context, attributeSet, i5, i11).f15184b);
    }

    public final void C(int i5) {
        int i11;
        int[] iArr = this.f14829c;
        int i12 = this.f14828b;
        if (iArr == null || iArr.length != i12 + 1 || iArr[iArr.length - 1] != i5) {
            iArr = new int[i12 + 1];
        }
        int i13 = 0;
        iArr[0] = 0;
        int i14 = i5 / i12;
        int i15 = i5 % i12;
        int i16 = 0;
        for (int i17 = 1; i17 <= i12; i17++) {
            i13 += i15;
            if (i13 <= 0 || i12 - i13 >= i15) {
                i11 = i14;
            } else {
                i11 = i14 + 1;
                i13 -= i12;
            }
            i16 += i11;
            iArr[i17] = i16;
        }
        this.f14829c = iArr;
    }

    public final void D() {
        View[] viewArr = this.f14830d;
        if (viewArr == null || viewArr.length != this.f14828b) {
            this.f14830d = new View[this.f14828b];
        }
    }

    public final int E(int i5, int i11) {
        if (this.mOrientation != 1 || !isLayoutRTL()) {
            int[] iArr = this.f14829c;
            return iArr[i11 + i5] - iArr[i5];
        }
        int[] iArr2 = this.f14829c;
        int i12 = this.f14828b;
        return iArr2[i12 - i5] - iArr2[(i12 - i5) - i11];
    }

    public final int F(int i5, h2 h2Var, o2 o2Var) {
        if (!o2Var.f15075g) {
            return this.f14833g.a(i5, this.f14828b);
        }
        int iB = h2Var.b(i5);
        if (iB != -1) {
            return this.f14833g.a(iB, this.f14828b);
        }
        Log.w("GridLayoutManager", "Cannot find span size for pre layout position. " + i5);
        return 0;
    }

    public final int G(int i5, h2 h2Var, o2 o2Var) {
        if (!o2Var.f15075g) {
            i0 i0Var = this.f14833g;
            int i11 = this.f14828b;
            SparseIntArray sparseIntArray = i0Var.f14998a;
            if (!i0Var.f15000c) {
                return i0Var.b(i5, i11);
            }
            int i12 = sparseIntArray.get(i5, -1);
            if (i12 != -1) {
                return i12;
            }
            int iB = i0Var.b(i5, i11);
            sparseIntArray.put(i5, iB);
            return iB;
        }
        int i13 = this.f14832f.get(i5, -1);
        if (i13 != -1) {
            return i13;
        }
        int iB2 = h2Var.b(i5);
        if (iB2 == -1) {
            Log.w("GridLayoutManager", "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:" + i5);
            return 0;
        }
        i0 i0Var2 = this.f14833g;
        int i14 = this.f14828b;
        SparseIntArray sparseIntArray2 = i0Var2.f14998a;
        if (!i0Var2.f15000c) {
            return i0Var2.b(iB2, i14);
        }
        int i15 = sparseIntArray2.get(iB2, -1);
        if (i15 != -1) {
            return i15;
        }
        int iB3 = i0Var2.b(iB2, i14);
        sparseIntArray2.put(iB2, iB3);
        return iB3;
    }

    public final int H(int i5, h2 h2Var, o2 o2Var) {
        if (!o2Var.f15075g) {
            return this.f14833g.c(i5);
        }
        int i11 = this.f14831e.get(i5, -1);
        if (i11 != -1) {
            return i11;
        }
        int iB = h2Var.b(i5);
        if (iB != -1) {
            return this.f14833g.c(iB);
        }
        Log.w("GridLayoutManager", "Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:" + i5);
        return 1;
    }

    public final void I(View view, int i5, boolean z11) {
        int childMeasureSpec;
        int childMeasureSpec2;
        h0 h0Var = (h0) view.getLayoutParams();
        Rect rect = h0Var.f14881b;
        int i11 = rect.top + rect.bottom + ((ViewGroup.MarginLayoutParams) h0Var).topMargin + ((ViewGroup.MarginLayoutParams) h0Var).bottomMargin;
        int i12 = rect.left + rect.right + ((ViewGroup.MarginLayoutParams) h0Var).leftMargin + ((ViewGroup.MarginLayoutParams) h0Var).rightMargin;
        int iE = E(h0Var.f14977e, h0Var.f14978f);
        if (this.mOrientation == 1) {
            childMeasureSpec2 = z1.getChildMeasureSpec(iE, i5, i12, ((ViewGroup.MarginLayoutParams) h0Var).width, false);
            childMeasureSpec = z1.getChildMeasureSpec(this.mOrientationHelper.l(), getHeightMode(), i11, ((ViewGroup.MarginLayoutParams) h0Var).height, true);
        } else {
            int childMeasureSpec3 = z1.getChildMeasureSpec(iE, i5, i11, ((ViewGroup.MarginLayoutParams) h0Var).height, false);
            int childMeasureSpec4 = z1.getChildMeasureSpec(this.mOrientationHelper.l(), getWidthMode(), i12, ((ViewGroup.MarginLayoutParams) h0Var).width, true);
            childMeasureSpec = childMeasureSpec3;
            childMeasureSpec2 = childMeasureSpec4;
        }
        a2 a2Var = (a2) view.getLayoutParams();
        if (z11 ? shouldReMeasureChild(view, childMeasureSpec2, childMeasureSpec, a2Var) : shouldMeasureChild(view, childMeasureSpec2, childMeasureSpec, a2Var)) {
            view.measure(childMeasureSpec2, childMeasureSpec);
        }
    }

    public final void J(int i5) {
        if (i5 == this.f14828b) {
            return;
        }
        this.f14827a = true;
        if (i5 < 1) {
            throw new IllegalArgumentException(b.c0.h(i5, "Span count should be at least 1. Provided "));
        }
        this.f14828b = i5;
        this.f14833g.d();
        requestLayout();
    }

    public final void K() {
        int height;
        int paddingTop;
        if (getOrientation() == 1) {
            height = getWidth() - getPaddingRight();
            paddingTop = getPaddingLeft();
        } else {
            height = getHeight() - getPaddingBottom();
            paddingTop = getPaddingTop();
        }
        C(height - paddingTop);
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean checkLayoutParams(a2 a2Var) {
        return a2Var instanceof h0;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void collectPrefetchPositionsForLayoutState(o2 o2Var, x0 x0Var, x1 x1Var) {
        int i5;
        int iC = this.f14828b;
        for (int i11 = 0; i11 < this.f14828b && (i5 = x0Var.f15172d) >= 0 && i5 < o2Var.b() && iC > 0; i11++) {
            int i12 = x0Var.f15172d;
            ((d0) x1Var).a(i12, Math.max(0, x0Var.f15175g));
            iC -= this.f14833g.c(i12);
            x0Var.f15172d += x0Var.f15173e;
        }
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final View findReferenceChild(h2 h2Var, o2 o2Var, boolean z11, boolean z12) {
        int i5;
        int childCount;
        int childCount2 = getChildCount();
        int i11 = 1;
        if (z12) {
            childCount = getChildCount() - 1;
            i5 = -1;
            i11 = -1;
        } else {
            i5 = childCount2;
            childCount = 0;
        }
        int iB = o2Var.b();
        ensureLayoutState();
        int iK = this.mOrientationHelper.k();
        int iG = this.mOrientationHelper.g();
        View view = null;
        View view2 = null;
        while (childCount != i5) {
            View childAt = getChildAt(childCount);
            int position = getPosition(childAt);
            if (position >= 0 && position < iB && G(position, h2Var, o2Var) == 0) {
                if (((a2) childAt.getLayoutParams()).f14880a.isRemoved()) {
                    if (view2 == null) {
                        view2 = childAt;
                    }
                } else {
                    if (this.mOrientationHelper.e(childAt) < iG && this.mOrientationHelper.b(childAt) >= iK) {
                        return childAt;
                    }
                    if (view == null) {
                        view = childAt;
                    }
                }
            }
            childCount += i11;
        }
        return view != null ? view : view2;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    public final a2 generateDefaultLayoutParams() {
        return this.mOrientation == 0 ? new h0(-2, -1) : new h0(-1, -2);
    }

    @Override // androidx.recyclerview.widget.z1
    public final a2 generateLayoutParams(Context context, AttributeSet attributeSet) {
        h0 h0Var = new h0(context, attributeSet);
        h0Var.f14977e = -1;
        h0Var.f14978f = 0;
        return h0Var;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int getColumnCountForAccessibility(h2 h2Var, o2 o2Var) {
        if (this.mOrientation == 1) {
            return this.f14828b;
        }
        if (o2Var.b() < 1) {
            return 0;
        }
        return F(o2Var.b() - 1, h2Var, o2Var) + 1;
    }

    @Override // androidx.recyclerview.widget.z1
    public int getRowCountForAccessibility(h2 h2Var, o2 o2Var) {
        if (this.mOrientation == 0) {
            return this.f14828b;
        }
        if (o2Var.b() < 1) {
            return 0;
        }
        return F(o2Var.b() - 1, h2Var, o2Var) + 1;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void layoutChunk(h2 h2Var, o2 o2Var, x0 x0Var, w0 w0Var) {
        int i5;
        int i11;
        int i12;
        int iD;
        int paddingLeft;
        int paddingTop;
        int iD2;
        int childMeasureSpec;
        int childMeasureSpec2;
        boolean z11;
        int i13;
        View viewB;
        int iJ = this.mOrientationHelper.j();
        boolean z12 = iJ != 1073741824;
        int i14 = getChildCount() > 0 ? this.f14829c[this.f14828b] : 0;
        if (z12) {
            K();
        }
        boolean z13 = x0Var.f15173e == 1;
        int iG = this.f14828b;
        if (!z13) {
            iG = G(x0Var.f15172d, h2Var, o2Var) + H(x0Var.f15172d, h2Var, o2Var);
        }
        int i15 = 0;
        while (i15 < this.f14828b && (i13 = x0Var.f15172d) >= 0 && i13 < o2Var.b() && iG > 0) {
            int i16 = x0Var.f15172d;
            int iH = H(i16, h2Var, o2Var);
            if (iH > this.f14828b) {
                throw new IllegalArgumentException(b.c0.o(b.c0.t(i16, "Item at position ", " requires ", iH, " spans but GridLayoutManager has only "), this.f14828b, " spans."));
            }
            iG -= iH;
            if (iG < 0 || (viewB = x0Var.b(h2Var)) == null) {
                break;
            }
            this.f14830d[i15] = viewB;
            i15++;
        }
        if (i15 == 0) {
            w0Var.f15158b = true;
            return;
        }
        if (z13) {
            i12 = 1;
            i11 = i15;
            i5 = 0;
        } else {
            i5 = i15 - 1;
            i11 = -1;
            i12 = -1;
        }
        int i17 = 0;
        while (i5 != i11) {
            View view = this.f14830d[i5];
            h0 h0Var = (h0) view.getLayoutParams();
            int iH2 = H(getPosition(view), h2Var, o2Var);
            h0Var.f14978f = iH2;
            h0Var.f14977e = i17;
            i17 += iH2;
            i5 += i12;
        }
        float f11 = 0.0f;
        int i18 = 0;
        for (int i19 = 0; i19 < i15; i19++) {
            View view2 = this.f14830d[i19];
            if (x0Var.f15179k != null) {
                z11 = false;
                if (z13) {
                    addDisappearingView(view2);
                } else {
                    addDisappearingView(view2, 0);
                }
            } else if (z13) {
                addView(view2);
                z11 = false;
            } else {
                z11 = false;
                addView(view2, 0);
            }
            calculateItemDecorationsForChild(view2, this.f14834h);
            I(view2, iJ, z11);
            int iC = this.mOrientationHelper.c(view2);
            if (iC > i18) {
                i18 = iC;
            }
            float fD = (this.mOrientationHelper.d(view2) * 1.0f) / ((h0) view2.getLayoutParams()).f14978f;
            if (fD > f11) {
                f11 = fD;
            }
        }
        if (z12) {
            C(Math.max(Math.round(f11 * this.f14828b), i14));
            i18 = 0;
            for (int i21 = 0; i21 < i15; i21++) {
                View view3 = this.f14830d[i21];
                I(view3, 1073741824, true);
                int iC2 = this.mOrientationHelper.c(view3);
                if (iC2 > i18) {
                    i18 = iC2;
                }
            }
        }
        for (int i22 = 0; i22 < i15; i22++) {
            View view4 = this.f14830d[i22];
            if (this.mOrientationHelper.c(view4) != i18) {
                h0 h0Var2 = (h0) view4.getLayoutParams();
                Rect rect = h0Var2.f14881b;
                int i23 = rect.top + rect.bottom + ((ViewGroup.MarginLayoutParams) h0Var2).topMargin + ((ViewGroup.MarginLayoutParams) h0Var2).bottomMargin;
                int i24 = rect.left + rect.right + ((ViewGroup.MarginLayoutParams) h0Var2).leftMargin + ((ViewGroup.MarginLayoutParams) h0Var2).rightMargin;
                int iE = E(h0Var2.f14977e, h0Var2.f14978f);
                if (this.mOrientation == 1) {
                    childMeasureSpec2 = z1.getChildMeasureSpec(iE, 1073741824, i24, ((ViewGroup.MarginLayoutParams) h0Var2).width, false);
                    childMeasureSpec = View.MeasureSpec.makeMeasureSpec(i18 - i23, 1073741824);
                } else {
                    int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(i18 - i24, 1073741824);
                    childMeasureSpec = z1.getChildMeasureSpec(iE, 1073741824, i23, ((ViewGroup.MarginLayoutParams) h0Var2).height, false);
                    childMeasureSpec2 = iMakeMeasureSpec;
                }
                if (shouldReMeasureChild(view4, childMeasureSpec2, childMeasureSpec, (a2) view4.getLayoutParams())) {
                    view4.measure(childMeasureSpec2, childMeasureSpec);
                }
            }
        }
        w0Var.f15157a = i18;
        if (this.mOrientation != 1) {
            if (x0Var.f15174f == -1) {
                int i25 = x0Var.f15170b;
                paddingLeft = i25 - i18;
                iD = i25;
            } else {
                int i26 = x0Var.f15170b;
                iD = i26 + i18;
                paddingLeft = i26;
            }
            paddingTop = 0;
            iD2 = 0;
        } else if (x0Var.f15174f == -1) {
            iD2 = x0Var.f15170b;
            paddingTop = iD2 - i18;
            paddingLeft = 0;
            iD = 0;
        } else {
            int i27 = x0Var.f15170b;
            paddingTop = i27;
            iD = 0;
            iD2 = i27 + i18;
            paddingLeft = 0;
        }
        for (int i28 = 0; i28 < i15; i28++) {
            View view5 = this.f14830d[i28];
            h0 h0Var3 = (h0) view5.getLayoutParams();
            if (this.mOrientation != 1) {
                paddingTop = getPaddingTop() + this.f14829c[h0Var3.f14977e];
                iD2 = this.mOrientationHelper.d(view5) + paddingTop;
            } else if (isLayoutRTL()) {
                iD = this.f14829c[this.f14828b - h0Var3.f14977e] + getPaddingLeft();
                paddingLeft = iD - this.mOrientationHelper.d(view5);
            } else {
                paddingLeft = getPaddingLeft() + this.f14829c[h0Var3.f14977e];
                iD = this.mOrientationHelper.d(view5) + paddingLeft;
            }
            int i29 = iD;
            int i31 = paddingLeft;
            int i32 = iD2;
            layoutDecoratedWithMargins(view5, i31, paddingTop, i29, i32);
            paddingLeft = i31;
            iD = i29;
            iD2 = i32;
            if (h0Var3.f14880a.isRemoved() || h0Var3.f14880a.isUpdated()) {
                w0Var.f15159c = true;
            }
            w0Var.f15160d = view5.hasFocusable() | w0Var.f15160d;
        }
        Arrays.fill(this.f14830d, (Object) null);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void onAnchorReady(h2 h2Var, o2 o2Var, v0 v0Var, int i5) {
        super.onAnchorReady(h2Var, o2Var, v0Var, i5);
        K();
        if (o2Var.b() > 0 && !o2Var.f15075g) {
            boolean z11 = i5 == 1;
            int iG = G(v0Var.f15148b, h2Var, o2Var);
            if (z11) {
                while (iG > 0) {
                    int i11 = v0Var.f15148b;
                    if (i11 <= 0) {
                        break;
                    }
                    int i12 = i11 - 1;
                    v0Var.f15148b = i12;
                    iG = G(i12, h2Var, o2Var);
                }
            } else {
                int iB = o2Var.b() - 1;
                int i13 = v0Var.f15148b;
                while (i13 < iB) {
                    int i14 = i13 + 1;
                    int iG2 = G(i14, h2Var, o2Var);
                    if (iG2 <= iG) {
                        break;
                    }
                    i13 = i14;
                    iG = iG2;
                }
                v0Var.f15148b = i13;
            }
        }
        D();
    }

    /* JADX WARN: Code restructure failed: missing block: B:56:0x00d3, code lost:
    
        if (r13 == (r2 > r15)) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:72:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0111  */
    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View onFocusSearchFailed(View view, int i5, h2 h2Var, o2 o2Var) {
        int childCount;
        int i11;
        int childCount2;
        View view2;
        View view3;
        View view4;
        int i12;
        int i13;
        int i14;
        h2 h2Var2 = h2Var;
        o2 o2Var2 = o2Var;
        View viewFindContainingItemView = findContainingItemView(view);
        View view5 = null;
        if (viewFindContainingItemView == null) {
            return null;
        }
        h0 h0Var = (h0) viewFindContainingItemView.getLayoutParams();
        int i15 = h0Var.f14977e;
        int i16 = h0Var.f14978f + i15;
        if (super.onFocusSearchFailed(view, i5, h2Var, o2Var) == null) {
            return null;
        }
        if ((convertFocusDirectionToLayoutDirection(i5) == 1) != this.mShouldReverseLayout) {
            childCount2 = getChildCount() - 1;
            childCount = -1;
            i11 = -1;
        } else {
            childCount = getChildCount();
            i11 = 1;
            childCount2 = 0;
        }
        boolean z11 = this.mOrientation == 1 && isLayoutRTL();
        int iF = F(childCount2, h2Var2, o2Var2);
        int i17 = -1;
        int i18 = -1;
        int iMin = 0;
        int iMin2 = 0;
        int i19 = childCount2;
        View view6 = null;
        while (i19 != childCount) {
            int iF2 = F(i19, h2Var2, o2Var2);
            View childAt = getChildAt(i19);
            if (childAt == viewFindContainingItemView) {
                break;
            }
            if (!childAt.hasFocusable() || iF2 == iF) {
                h0 h0Var2 = (h0) childAt.getLayoutParams();
                int i21 = h0Var2.f14977e;
                view2 = viewFindContainingItemView;
                int i22 = h0Var2.f14978f + i21;
                if (childAt.hasFocusable() && i21 == i15 && i22 == i16) {
                    return childAt;
                }
                if (!(childAt.hasFocusable() && view5 == null) && (childAt.hasFocusable() || view6 != null)) {
                    view3 = view5;
                    int iMin3 = Math.min(i22, i16) - Math.max(i21, i15);
                    if (!childAt.hasFocusable()) {
                        if (view3 == null) {
                            view4 = view6;
                            i12 = iMin;
                            if (isViewPartiallyVisible(childAt, false, true)) {
                                i13 = iMin2;
                                if (iMin3 > i13) {
                                    i14 = i18;
                                } else if (iMin3 == i13) {
                                    i14 = i18;
                                    if (z11 == (i21 > i14)) {
                                    }
                                    iMin = i12;
                                    view5 = view3;
                                    i19 += i11;
                                    h2Var2 = h2Var;
                                    o2Var2 = o2Var;
                                    viewFindContainingItemView = view2;
                                } else {
                                    i14 = i18;
                                }
                                if (childAt.hasFocusable()) {
                                    int i23 = h0Var2.f14977e;
                                    iMin2 = Math.min(i22, i16) - Math.max(i21, i15);
                                    view6 = childAt;
                                    i18 = i23;
                                    iMin = i12;
                                    view5 = view3;
                                    i19 += i11;
                                    h2Var2 = h2Var;
                                    o2Var2 = o2Var;
                                    viewFindContainingItemView = view2;
                                } else {
                                    i18 = i14;
                                    iMin2 = i13;
                                    i17 = h0Var2.f14977e;
                                    view6 = view4;
                                    view5 = childAt;
                                    iMin = Math.min(i22, i16) - Math.max(i21, i15);
                                    i19 += i11;
                                    h2Var2 = h2Var;
                                    o2Var2 = o2Var;
                                    viewFindContainingItemView = view2;
                                }
                            }
                            i18 = i14;
                            iMin2 = i13;
                            view6 = view4;
                            iMin = i12;
                            view5 = view3;
                            i19 += i11;
                            h2Var2 = h2Var;
                            o2Var2 = o2Var;
                            viewFindContainingItemView = view2;
                        }
                        i14 = i18;
                        i13 = iMin2;
                        i18 = i14;
                        iMin2 = i13;
                        view6 = view4;
                        iMin = i12;
                        view5 = view3;
                        i19 += i11;
                        h2Var2 = h2Var;
                        o2Var2 = o2Var;
                        viewFindContainingItemView = view2;
                    } else if (iMin3 <= iMin) {
                        if (iMin3 == iMin) {
                        }
                    }
                } else {
                    view3 = view5;
                }
                view4 = view6;
                i12 = iMin;
                i14 = i18;
                i13 = iMin2;
                if (childAt.hasFocusable()) {
                }
            } else {
                if (view5 != null) {
                    break;
                }
                view2 = viewFindContainingItemView;
                view3 = view5;
            }
            view4 = view6;
            i12 = iMin;
            i14 = i18;
            i13 = iMin2;
            i18 = i14;
            iMin2 = i13;
            view6 = view4;
            iMin = i12;
            view5 = view3;
            i19 += i11;
            h2Var2 = h2Var;
            o2Var2 = o2Var;
            viewFindContainingItemView = view2;
        }
        View view7 = view5;
        return view7 != null ? view7 : view6;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onInitializeAccessibilityNodeInfo(h2 h2Var, o2 o2Var, b5.g gVar) {
        super.onInitializeAccessibilityNodeInfo(h2Var, o2Var, gVar);
        gVar.y(GridView.class.getName());
    }

    @Override // androidx.recyclerview.widget.z1
    public void onInitializeAccessibilityNodeInfoForItem(h2 h2Var, o2 o2Var, View view, b5.g gVar) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (!(layoutParams instanceof h0)) {
            super.onInitializeAccessibilityNodeInfoForItem(view, gVar);
            return;
        }
        h0 h0Var = (h0) layoutParams;
        int iF = F(h0Var.f14880a.getLayoutPosition(), h2Var, o2Var);
        if (this.mOrientation == 0) {
            gVar.B(b5.f.k(false, false, h0Var.f14977e, h0Var.f14978f, iF, 1));
        } else {
            gVar.B(b5.f.k(false, false, iF, 1, h0Var.f14977e, h0Var.f14978f));
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsAdded(RecyclerView recyclerView, int i5, int i11) {
        this.f14833g.d();
        this.f14833g.f14999b.clear();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsChanged(RecyclerView recyclerView) {
        this.f14833g.d();
        this.f14833g.f14999b.clear();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsMoved(RecyclerView recyclerView, int i5, int i11, int i12) {
        this.f14833g.d();
        this.f14833g.f14999b.clear();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsRemoved(RecyclerView recyclerView, int i5, int i11) {
        this.f14833g.d();
        this.f14833g.f14999b.clear();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsUpdated(RecyclerView recyclerView, int i5, int i11, Object obj) {
        this.f14833g.d();
        this.f14833g.f14999b.clear();
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    public final void onLayoutChildren(h2 h2Var, o2 o2Var) {
        boolean z11 = o2Var.f15075g;
        SparseIntArray sparseIntArray = this.f14832f;
        SparseIntArray sparseIntArray2 = this.f14831e;
        if (z11) {
            int childCount = getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                h0 h0Var = (h0) getChildAt(i5).getLayoutParams();
                int layoutPosition = h0Var.f14880a.getLayoutPosition();
                sparseIntArray2.put(layoutPosition, h0Var.f14978f);
                sparseIntArray.put(layoutPosition, h0Var.f14977e);
            }
        }
        super.onLayoutChildren(h2Var, o2Var);
        sparseIntArray2.clear();
        sparseIntArray.clear();
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    public final void onLayoutCompleted(o2 o2Var) {
        super.onLayoutCompleted(o2Var);
        this.f14827a = false;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    public final int scrollHorizontallyBy(int i5, h2 h2Var, o2 o2Var) {
        K();
        D();
        return super.scrollHorizontallyBy(i5, h2Var, o2Var);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    public final int scrollVerticallyBy(int i5, h2 h2Var, o2 o2Var) {
        K();
        D();
        return super.scrollVerticallyBy(i5, h2Var, o2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void setMeasuredDimension(Rect rect, int i5, int i11) {
        int iChooseSize;
        int iChooseSize2;
        if (this.f14829c == null) {
            super.setMeasuredDimension(rect, i5, i11);
        }
        int paddingRight = getPaddingRight() + getPaddingLeft();
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        if (this.mOrientation == 1) {
            iChooseSize2 = z1.chooseSize(i11, rect.height() + paddingBottom, getMinimumHeight());
            int[] iArr = this.f14829c;
            iChooseSize = z1.chooseSize(i5, iArr[iArr.length - 1] + paddingRight, getMinimumWidth());
        } else {
            iChooseSize = z1.chooseSize(i5, rect.width() + paddingRight, getMinimumWidth());
            int[] iArr2 = this.f14829c;
            iChooseSize2 = z1.chooseSize(i11, iArr2[iArr2.length - 1] + paddingBottom, getMinimumHeight());
        }
        setMeasuredDimension(iChooseSize, iChooseSize2);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager
    public final void setStackFromEnd(boolean z11) {
        if (z11) {
            throw new UnsupportedOperationException("GridLayoutManager does not support stack from end. Consider using reverse layout");
        }
        super.setStackFromEnd(false);
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.z1
    public final boolean supportsPredictiveItemAnimations() {
        return this.mPendingSavedState == null && !this.f14827a;
    }

    @Override // androidx.recyclerview.widget.z1
    public final a2 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof ViewGroup.MarginLayoutParams) {
            h0 h0Var = new h0((ViewGroup.MarginLayoutParams) layoutParams);
            h0Var.f14977e = -1;
            h0Var.f14978f = 0;
            return h0Var;
        }
        h0 h0Var2 = new h0(layoutParams);
        h0Var2.f14977e = -1;
        h0Var2.f14978f = 0;
        return h0Var2;
    }

    public GridLayoutManager(int i5) {
        super(1, false);
        this.f14827a = false;
        this.f14828b = -1;
        this.f14831e = new SparseIntArray();
        this.f14832f = new SparseIntArray();
        this.f14833g = new g0();
        this.f14834h = new Rect();
        J(i5);
    }
}
