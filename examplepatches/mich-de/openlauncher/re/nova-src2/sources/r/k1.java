package r;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.LinearLayout;

/* loaded from: classes2.dex */
public abstract class k1 extends ViewGroup {

    /* renamed from: a, reason: collision with root package name */
    public boolean f84769a;

    /* renamed from: b, reason: collision with root package name */
    public final int f84770b;

    /* renamed from: c, reason: collision with root package name */
    public int f84771c;

    /* renamed from: d, reason: collision with root package name */
    public int f84772d;

    /* renamed from: e, reason: collision with root package name */
    public final int f84773e;

    /* renamed from: f, reason: collision with root package name */
    public int f84774f;

    /* renamed from: g, reason: collision with root package name */
    public final float f84775g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f84776h;

    /* renamed from: i, reason: collision with root package name */
    public int[] f84777i;

    /* renamed from: j, reason: collision with root package name */
    public int[] f84778j;

    /* renamed from: k, reason: collision with root package name */
    public final Drawable f84779k;

    /* renamed from: l, reason: collision with root package name */
    public final int f84780l;

    /* renamed from: m, reason: collision with root package name */
    public final int f84781m;
    public final int n;
    public final int o;

    public k1(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0);
        this.f84769a = true;
        this.f84770b = -1;
        this.f84771c = 0;
        this.f84773e = 8388659;
        int[] iArr = l.a.n;
        x7.u uVarR = x7.u.r(context, attributeSet, iArr, 0);
        a5.a1.j(this, context, iArr, attributeSet, (TypedArray) uVarR.f95209b, 0);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        int i11 = typedArray.getInt(1, -1);
        if (i11 >= 0 && this.f84772d != i11) {
            this.f84772d = i11;
            requestLayout();
        }
        int i12 = typedArray.getInt(0, -1);
        if (i12 >= 0 && this.f84773e != i12) {
            i12 = (8388615 & i12) == 0 ? i12 | 8388611 : i12;
            this.f84773e = (i12 & 112) == 0 ? i12 | 48 : i12;
            requestLayout();
        }
        boolean z11 = typedArray.getBoolean(2, true);
        if (!z11) {
            this.f84769a = z11;
        }
        this.f84775g = typedArray.getFloat(4, -1.0f);
        this.f84770b = typedArray.getInt(3, -1);
        this.f84776h = typedArray.getBoolean(7, false);
        Drawable drawableL = uVarR.l(5);
        if (drawableL != this.f84779k) {
            this.f84779k = drawableL;
            if (drawableL != null) {
                this.f84780l = drawableL.getIntrinsicWidth();
                this.f84781m = drawableL.getIntrinsicHeight();
            } else {
                this.f84780l = 0;
                this.f84781m = 0;
            }
            setWillNotDraw(drawableL == null);
            requestLayout();
        }
        this.n = typedArray.getInt(8, 0);
        this.o = typedArray.getDimensionPixelSize(6, 0);
        uVarR.s();
    }

    @Override // android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof j1;
    }

    public final void e(Canvas canvas, int i5) {
        int paddingLeft = getPaddingLeft();
        int i11 = this.o;
        this.f84779k.setBounds(paddingLeft + i11, i5, (getWidth() - getPaddingRight()) - i11, this.f84781m + i5);
        this.f84779k.draw(canvas);
    }

    public final void f(Canvas canvas, int i5) {
        int paddingTop = getPaddingTop();
        int i11 = this.o;
        this.f84779k.setBounds(i5, paddingTop + i11, this.f84780l + i5, (getHeight() - getPaddingBottom()) - i11);
        this.f84779k.draw(canvas);
    }

    @Override // android.view.ViewGroup
    /* renamed from: g, reason: merged with bridge method [inline-methods] */
    public j1 generateDefaultLayoutParams() {
        int i5 = this.f84772d;
        if (i5 == 0) {
            return new j1(-2, -2);
        }
        if (i5 == 1) {
            return new j1(-1, -2);
        }
        return null;
    }

    @Override // android.view.View
    public final int getBaseline() {
        int i5;
        int i11 = this.f84770b;
        if (i11 < 0) {
            return super.getBaseline();
        }
        if (getChildCount() <= i11) {
            throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout set to an index that is out of bounds.");
        }
        View childAt = getChildAt(i11);
        int baseline = childAt.getBaseline();
        if (baseline == -1) {
            if (i11 == 0) {
                return -1;
            }
            throw new RuntimeException("mBaselineAlignedChildIndex of LinearLayout points to a View that doesn't know how to get its baseline.");
        }
        int iC = this.f84771c;
        if (this.f84772d == 1 && (i5 = this.f84773e & 112) != 48) {
            if (i5 == 16) {
                iC = b.c0.c(((getBottom() - getTop()) - getPaddingTop()) - getPaddingBottom(), this.f84774f, 2, iC);
            } else if (i5 == 80) {
                iC = ((getBottom() - getTop()) - getPaddingBottom()) - this.f84774f;
            }
        }
        return iC + ((LinearLayout.LayoutParams) ((j1) childAt.getLayoutParams())).topMargin + baseline;
    }

    @Override // android.view.ViewGroup
    /* renamed from: h, reason: merged with bridge method [inline-methods] */
    public j1 generateLayoutParams(AttributeSet attributeSet) {
        return new j1(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    /* renamed from: i, reason: merged with bridge method [inline-methods] */
    public j1 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof j1 ? new j1((j1) layoutParams) : layoutParams instanceof ViewGroup.MarginLayoutParams ? new j1((ViewGroup.MarginLayoutParams) layoutParams) : new j1(layoutParams);
    }

    public final boolean j(int i5) {
        int i11 = this.n;
        if (i5 == 0) {
            return (i11 & 1) != 0;
        }
        if (i5 == getChildCount()) {
            return (i11 & 4) != 0;
        }
        if ((i11 & 2) != 0) {
            for (int i12 = i5 - 1; i12 >= 0; i12--) {
                if (getChildAt(i12).getVisibility() != 8) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        int i5;
        int right;
        int left;
        int paddingRight;
        int i11;
        if (this.f84779k == null) {
            return;
        }
        int i12 = 0;
        if (this.f84772d == 1) {
            int childCount = getChildCount();
            while (true) {
                i11 = this.f84781m;
                if (i12 >= childCount) {
                    break;
                }
                View childAt = getChildAt(i12);
                if (childAt != null && childAt.getVisibility() != 8 && j(i12)) {
                    e(canvas, (childAt.getTop() - ((LinearLayout.LayoutParams) ((j1) childAt.getLayoutParams())).topMargin) - i11);
                }
                i12++;
            }
            if (j(childCount)) {
                View childAt2 = getChildAt(childCount - 1);
                e(canvas, childAt2 == null ? (getHeight() - getPaddingBottom()) - i11 : childAt2.getBottom() + ((LinearLayout.LayoutParams) ((j1) childAt2.getLayoutParams())).bottomMargin);
                return;
            }
            return;
        }
        int childCount2 = getChildCount();
        boolean z11 = p2.f84838a;
        boolean z12 = getLayoutDirection() == 1;
        while (true) {
            i5 = this.f84780l;
            if (i12 >= childCount2) {
                break;
            }
            View childAt3 = getChildAt(i12);
            if (childAt3 != null && childAt3.getVisibility() != 8 && j(i12)) {
                j1 j1Var = (j1) childAt3.getLayoutParams();
                f(canvas, z12 ? childAt3.getRight() + ((LinearLayout.LayoutParams) j1Var).rightMargin : (childAt3.getLeft() - ((LinearLayout.LayoutParams) j1Var).leftMargin) - i5);
            }
            i12++;
        }
        if (j(childCount2)) {
            View childAt4 = getChildAt(childCount2 - 1);
            if (childAt4 != null) {
                j1 j1Var2 = (j1) childAt4.getLayoutParams();
                if (z12) {
                    left = childAt4.getLeft();
                    paddingRight = ((LinearLayout.LayoutParams) j1Var2).leftMargin;
                    right = (left - paddingRight) - i5;
                } else {
                    right = childAt4.getRight() + ((LinearLayout.LayoutParams) j1Var2).rightMargin;
                }
            } else if (z12) {
                right = getPaddingLeft();
            } else {
                left = getWidth();
                paddingRight = getPaddingRight();
                right = (left - paddingRight) - i5;
            }
            f(canvas, right);
        }
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName("androidx.appcompat.widget.LinearLayoutCompat");
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName("androidx.appcompat.widget.LinearLayoutCompat");
    }

    /* JADX WARN: Removed duplicated region for block: B:62:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0194  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x01a7  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01ac  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int i14;
        int iC;
        int i15;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        int i23;
        int iC2;
        int i24 = this.f84772d;
        int i25 = this.f84773e;
        int i26 = 8;
        if (i24 == 1) {
            int paddingLeft = getPaddingLeft();
            int i27 = i12 - i5;
            int paddingRight = i27 - getPaddingRight();
            int paddingRight2 = (i27 - paddingLeft) - getPaddingRight();
            int childCount = getChildCount();
            int i28 = i25 & 112;
            int i29 = i25 & 8388615;
            int paddingTop = i28 != 16 ? i28 != 80 ? getPaddingTop() : ((getPaddingTop() + i13) - i11) - this.f84774f : b.c0.c(i13 - i11, this.f84774f, 2, getPaddingTop());
            int i31 = 0;
            while (i31 < childCount) {
                View childAt = getChildAt(i31);
                if (childAt != null && childAt.getVisibility() != i26) {
                    int measuredWidth = childAt.getMeasuredWidth();
                    int measuredHeight = childAt.getMeasuredHeight();
                    j1 j1Var = (j1) childAt.getLayoutParams();
                    int i32 = ((LinearLayout.LayoutParams) j1Var).gravity;
                    if (i32 < 0) {
                        i32 = i29;
                    }
                    int absoluteGravity = Gravity.getAbsoluteGravity(i32, getLayoutDirection()) & 7;
                    int iC3 = absoluteGravity != 1 ? absoluteGravity != 5 ? ((LinearLayout.LayoutParams) j1Var).leftMargin + paddingLeft : (paddingRight - measuredWidth) - ((LinearLayout.LayoutParams) j1Var).rightMargin : (b.c0.c(paddingRight2, measuredWidth, 2, paddingLeft) + ((LinearLayout.LayoutParams) j1Var).leftMargin) - ((LinearLayout.LayoutParams) j1Var).rightMargin;
                    if (j(i31)) {
                        paddingTop += this.f84781m;
                    }
                    int i33 = paddingTop + ((LinearLayout.LayoutParams) j1Var).topMargin;
                    childAt.layout(iC3, i33, measuredWidth + iC3, i33 + measuredHeight);
                    paddingTop = measuredHeight + ((LinearLayout.LayoutParams) j1Var).bottomMargin + i33;
                }
                i31++;
                i26 = 8;
            }
            return;
        }
        boolean z12 = p2.f84838a;
        boolean z13 = getLayoutDirection() == 1;
        int paddingTop2 = getPaddingTop();
        int i34 = i13 - i11;
        int paddingBottom = i34 - getPaddingBottom();
        int paddingBottom2 = (i34 - paddingTop2) - getPaddingBottom();
        int childCount2 = getChildCount();
        int i35 = 8388615 & i25;
        int i36 = i25 & 112;
        boolean z14 = this.f84769a;
        int[] iArr = this.f84777i;
        int[] iArr2 = this.f84778j;
        int absoluteGravity2 = Gravity.getAbsoluteGravity(i35, getLayoutDirection());
        if (absoluteGravity2 != 1) {
            iC = absoluteGravity2 != 5 ? getPaddingLeft() : ((getPaddingLeft() + i12) - i5) - this.f84774f;
            i14 = 1;
        } else {
            i14 = 1;
            iC = b.c0.c(i12 - i5, this.f84774f, 2, getPaddingLeft());
        }
        if (z13) {
            i16 = childCount2 - 1;
            i15 = -1;
        } else {
            i15 = i14;
            i16 = 0;
        }
        int i37 = 0;
        while (i37 < childCount2) {
            int i38 = (i15 * i37) + i16;
            View childAt2 = getChildAt(i38);
            if (childAt2 == null) {
                i17 = i16;
                i18 = i36;
            } else {
                i17 = i16;
                if (childAt2.getVisibility() != 8) {
                    int measuredWidth2 = childAt2.getMeasuredWidth();
                    int measuredHeight2 = childAt2.getMeasuredHeight();
                    i18 = i36;
                    j1 j1Var2 = (j1) childAt2.getLayoutParams();
                    int i39 = iC;
                    if (z14) {
                        i19 = measuredWidth2;
                        int baseline = ((LinearLayout.LayoutParams) j1Var2).height != -1 ? childAt2.getBaseline() : -1;
                        i21 = ((LinearLayout.LayoutParams) j1Var2).gravity;
                        if (i21 < 0) {
                            i21 = i18;
                        }
                        i22 = i21 & 112;
                        i23 = i15;
                        if (i22 != 16) {
                            iC2 = (b.c0.c(paddingBottom2, measuredHeight2, 2, paddingTop2) + ((LinearLayout.LayoutParams) j1Var2).topMargin) - ((LinearLayout.LayoutParams) j1Var2).bottomMargin;
                        } else if (i22 == 48) {
                            iC2 = ((LinearLayout.LayoutParams) j1Var2).topMargin + paddingTop2;
                            if (baseline != -1) {
                                iC2 = (iArr[i14] - baseline) + iC2;
                            }
                        } else if (i22 != 80) {
                            iC2 = paddingTop2;
                        } else {
                            iC2 = (paddingBottom - measuredHeight2) - ((LinearLayout.LayoutParams) j1Var2).bottomMargin;
                            if (baseline != -1) {
                                iC2 -= iArr2[2] - (childAt2.getMeasuredHeight() - baseline);
                            }
                        }
                        int i40 = (!j(i38) ? i39 + this.f84780l : i39) + ((LinearLayout.LayoutParams) j1Var2).leftMargin;
                        childAt2.layout(i40, iC2, i40 + i19, measuredHeight2 + iC2);
                        iC = i19 + ((LinearLayout.LayoutParams) j1Var2).rightMargin + i40;
                        i37++;
                        i16 = i17;
                        i36 = i18;
                        i15 = i23;
                    } else {
                        i19 = measuredWidth2;
                    }
                    i21 = ((LinearLayout.LayoutParams) j1Var2).gravity;
                    if (i21 < 0) {
                    }
                    i22 = i21 & 112;
                    i23 = i15;
                    if (i22 != 16) {
                    }
                    int i402 = (!j(i38) ? i39 + this.f84780l : i39) + ((LinearLayout.LayoutParams) j1Var2).leftMargin;
                    childAt2.layout(i402, iC2, i402 + i19, measuredHeight2 + iC2);
                    iC = i19 + ((LinearLayout.LayoutParams) j1Var2).rightMargin + i402;
                    i37++;
                    i16 = i17;
                    i36 = i18;
                    i15 = i23;
                } else {
                    i18 = i36;
                }
            }
            i23 = i15;
            i37++;
            i16 = i17;
            i36 = i18;
            i15 = i23;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:230:0x050a  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x051f  */
    /* JADX WARN: Removed duplicated region for block: B:239:0x054d  */
    /* JADX WARN: Removed duplicated region for block: B:245:0x055d  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x0564  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x056e  */
    /* JADX WARN: Removed duplicated region for block: B:369:0x07c3  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0151  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x015a  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onMeasure(int i5, int i11) {
        int i12;
        int i13;
        int i14;
        int iMax;
        int i15;
        int i16;
        int baseline;
        int i17;
        int i18;
        int[] iArr;
        int i19;
        int i21;
        boolean z11;
        boolean z12;
        j1 j1Var;
        int i22;
        int[] iArr2;
        int i23;
        View view;
        int i24;
        boolean z13;
        boolean z14;
        int iMax2;
        int i25;
        int iMax3;
        int i26;
        int i27;
        int i28;
        int i29;
        int i31;
        int i32;
        float f11;
        boolean z15;
        int i33;
        int i34;
        boolean z16;
        int i35;
        int i36;
        boolean z17;
        k1 k1Var = this;
        int i37 = k1Var.f84772d;
        float f12 = k1Var.f84775g;
        int i38 = -2;
        boolean z18 = k1Var.f84776h;
        int iMax4 = 0;
        int i39 = 1073741824;
        int i40 = 8;
        int i41 = Integer.MIN_VALUE;
        boolean z19 = true;
        if (i37 == 1) {
            k1Var.f84774f = 0;
            int childCount = k1Var.getChildCount();
            int mode = View.MeasureSpec.getMode(i5);
            int mode2 = View.MeasureSpec.getMode(i11);
            boolean z21 = true;
            int i42 = 0;
            int iMax5 = 0;
            int iMax6 = 0;
            boolean z22 = false;
            int i43 = 0;
            int i44 = 0;
            boolean z23 = false;
            float f13 = 0.0f;
            while (i42 < childCount) {
                int i45 = childCount;
                View childAt = k1Var.getChildAt(i42);
                if (childAt == null) {
                    k1Var.f84774f = k1Var.f84774f;
                    z16 = z19;
                    i33 = mode;
                    f11 = f12;
                    z15 = z18;
                    i34 = i45;
                } else if (childAt.getVisibility() == i40) {
                    i33 = mode;
                    f11 = f12;
                    z15 = z18;
                    i34 = i45;
                    z16 = true;
                } else {
                    if (k1Var.j(i42)) {
                        k1Var.f84774f += k1Var.f84781m;
                    }
                    j1 j1Var2 = (j1) childAt.getLayoutParams();
                    float f14 = ((LinearLayout.LayoutParams) j1Var2).weight;
                    f13 += f14;
                    if (mode2 == i39 && ((LinearLayout.LayoutParams) j1Var2).height == 0 && f14 > 0.0f) {
                        int i46 = k1Var.f84774f;
                        k1Var.f84774f = Math.max(i46, ((LinearLayout.LayoutParams) j1Var2).topMargin + i46 + ((LinearLayout.LayoutParams) j1Var2).bottomMargin);
                        i33 = mode;
                        f11 = f12;
                        z15 = z18;
                        i34 = i45;
                        z22 = true;
                        z16 = true;
                        i36 = mode2;
                        i35 = i42;
                    } else {
                        if (((LinearLayout.LayoutParams) j1Var2).height != 0 || f14 <= 0.0f) {
                            i29 = i41;
                        } else {
                            ((LinearLayout.LayoutParams) j1Var2).height = i38;
                            i29 = 0;
                        }
                        if (f13 == 0.0f) {
                            int i47 = i42;
                            i32 = k1Var.f84774f;
                            i31 = i47;
                        } else {
                            i31 = i42;
                            i32 = 0;
                        }
                        f11 = f12;
                        z15 = z18;
                        i33 = mode;
                        i34 = i45;
                        z16 = true;
                        i35 = i31;
                        i36 = mode2;
                        k1Var.measureChildWithMargins(childAt, i5, 0, i11, i32);
                        if (i29 != i41) {
                            ((LinearLayout.LayoutParams) j1Var2).height = i29;
                        }
                        int measuredHeight = childAt.getMeasuredHeight();
                        int i48 = k1Var.f84774f;
                        k1Var.f84774f = Math.max(i48, i48 + measuredHeight + ((LinearLayout.LayoutParams) j1Var2).topMargin + ((LinearLayout.LayoutParams) j1Var2).bottomMargin);
                        if (z15) {
                            iMax4 = Math.max(measuredHeight, iMax4);
                        }
                    }
                    int i49 = k1Var.f84770b;
                    if (i49 >= 0 && i49 == i35 + 1) {
                        k1Var.f84771c = k1Var.f84774f;
                    }
                    if (i35 < i49 && ((LinearLayout.LayoutParams) j1Var2).weight > 0.0f) {
                        throw new RuntimeException("A child of LinearLayout with index less than mBaselineAlignedChildIndex has weight > 0, which won't work.  Either remove the weight, or don't set mBaselineAlignedChildIndex.");
                    }
                    if (i33 == 1073741824 || ((LinearLayout.LayoutParams) j1Var2).width != -1) {
                        z17 = false;
                    } else {
                        z17 = z16;
                        z23 = z17;
                    }
                    int i51 = ((LinearLayout.LayoutParams) j1Var2).leftMargin + ((LinearLayout.LayoutParams) j1Var2).rightMargin;
                    int measuredWidth = childAt.getMeasuredWidth() + i51;
                    int iMax7 = Math.max(i43, measuredWidth);
                    boolean z24 = z17;
                    int iCombineMeasuredStates = View.combineMeasuredStates(i44, childAt.getMeasuredState());
                    if (z21) {
                        i44 = iCombineMeasuredStates;
                        boolean z25 = ((LinearLayout.LayoutParams) j1Var2).width == -1 ? z16 : false;
                        if (((LinearLayout.LayoutParams) j1Var2).weight <= 0.0f) {
                            if (!z24) {
                                i51 = measuredWidth;
                            }
                            iMax6 = Math.max(iMax6, i51);
                        } else {
                            if (!z24) {
                                i51 = measuredWidth;
                            }
                            iMax5 = Math.max(iMax5, i51);
                        }
                        z21 = z25;
                        i43 = iMax7;
                        i42 = i35 + 1;
                        mode2 = i36;
                        mode = i33;
                        childCount = i34;
                        z19 = z16;
                        f12 = f11;
                        z18 = z15;
                        i38 = -2;
                        i39 = 1073741824;
                        i40 = 8;
                        i41 = Integer.MIN_VALUE;
                    } else {
                        i44 = iCombineMeasuredStates;
                    }
                    if (((LinearLayout.LayoutParams) j1Var2).weight <= 0.0f) {
                    }
                    z21 = z25;
                    i43 = iMax7;
                    i42 = i35 + 1;
                    mode2 = i36;
                    mode = i33;
                    childCount = i34;
                    z19 = z16;
                    f12 = f11;
                    z18 = z15;
                    i38 = -2;
                    i39 = 1073741824;
                    i40 = 8;
                    i41 = Integer.MIN_VALUE;
                }
                i36 = mode2;
                i35 = i42;
                i42 = i35 + 1;
                mode2 = i36;
                mode = i33;
                childCount = i34;
                z19 = z16;
                f12 = f11;
                z18 = z15;
                i38 = -2;
                i39 = 1073741824;
                i40 = 8;
                i41 = Integer.MIN_VALUE;
            }
            int i52 = childCount;
            boolean z26 = z19;
            int i53 = mode;
            float f15 = f12;
            boolean z27 = z18;
            int i54 = i43;
            int i55 = i44;
            int i56 = mode2;
            int i57 = i11;
            if (k1Var.f84774f > 0 && k1Var.j(i52)) {
                k1Var.f84774f += k1Var.f84781m;
            }
            if (z27 && (i56 == Integer.MIN_VALUE || i56 == 0)) {
                k1Var.f84774f = 0;
                for (int i58 = 0; i58 < i52; i58++) {
                    View childAt2 = k1Var.getChildAt(i58);
                    if (childAt2 == null) {
                        k1Var.f84774f = k1Var.f84774f;
                    } else if (childAt2.getVisibility() != 8) {
                        j1 j1Var3 = (j1) childAt2.getLayoutParams();
                        int i59 = k1Var.f84774f;
                        k1Var.f84774f = Math.max(i59, i59 + iMax4 + ((LinearLayout.LayoutParams) j1Var3).topMargin + ((LinearLayout.LayoutParams) j1Var3).bottomMargin);
                    }
                }
            }
            int paddingBottom = k1Var.getPaddingBottom() + k1Var.getPaddingTop() + k1Var.f84774f;
            k1Var.f84774f = paddingBottom;
            int iResolveSizeAndState = View.resolveSizeAndState(Math.max(paddingBottom, k1Var.getSuggestedMinimumHeight()), i57, 0);
            int i61 = (iResolveSizeAndState & 16777215) - k1Var.f84774f;
            if (z22 || (i61 != 0 && f13 > 0.0f)) {
                if (f15 <= 0.0f) {
                    f15 = f13;
                }
                k1Var.f84774f = 0;
                int iCombineMeasuredStates2 = i55;
                int i62 = 0;
                while (i62 < i52) {
                    View childAt3 = k1Var.getChildAt(i62);
                    if (childAt3.getVisibility() == 8) {
                        i26 = i62;
                    } else {
                        j1 j1Var4 = (j1) childAt3.getLayoutParams();
                        float f16 = ((LinearLayout.LayoutParams) j1Var4).weight;
                        if (f16 > 0.0f) {
                            int i63 = (int) ((i61 * f16) / f15);
                            f15 -= f16;
                            i61 -= i63;
                            i26 = i62;
                            int childMeasureSpec = ViewGroup.getChildMeasureSpec(i5, k1Var.getPaddingRight() + k1Var.getPaddingLeft() + ((LinearLayout.LayoutParams) j1Var4).leftMargin + ((LinearLayout.LayoutParams) j1Var4).rightMargin, ((LinearLayout.LayoutParams) j1Var4).width);
                            if (((LinearLayout.LayoutParams) j1Var4).height == 0) {
                                i28 = 1073741824;
                                if (i56 == 1073741824) {
                                    if (i63 <= 0) {
                                        i63 = 0;
                                    }
                                    childAt3.measure(childMeasureSpec, View.MeasureSpec.makeMeasureSpec(i63, 1073741824));
                                }
                                iCombineMeasuredStates2 = View.combineMeasuredStates(iCombineMeasuredStates2, childAt3.getMeasuredState() & (-256));
                            } else {
                                i28 = 1073741824;
                            }
                            int measuredHeight2 = childAt3.getMeasuredHeight() + i63;
                            if (measuredHeight2 < 0) {
                                measuredHeight2 = 0;
                            }
                            childAt3.measure(childMeasureSpec, View.MeasureSpec.makeMeasureSpec(measuredHeight2, i28));
                            iCombineMeasuredStates2 = View.combineMeasuredStates(iCombineMeasuredStates2, childAt3.getMeasuredState() & (-256));
                        } else {
                            i26 = i62;
                        }
                        int i64 = ((LinearLayout.LayoutParams) j1Var4).leftMargin + ((LinearLayout.LayoutParams) j1Var4).rightMargin;
                        int measuredWidth2 = childAt3.getMeasuredWidth() + i64;
                        int iMax8 = Math.max(i54, measuredWidth2);
                        if (i53 != 1073741824) {
                            i27 = -1;
                            if (((LinearLayout.LayoutParams) j1Var4).width == -1) {
                                measuredWidth2 = i64;
                            }
                        } else {
                            i27 = -1;
                        }
                        iMax5 = Math.max(iMax5, measuredWidth2);
                        boolean z28 = (z21 && ((LinearLayout.LayoutParams) j1Var4).width == i27) ? z26 : false;
                        int i65 = k1Var.f84774f;
                        k1Var.f84774f = Math.max(i65, childAt3.getMeasuredHeight() + i65 + ((LinearLayout.LayoutParams) j1Var4).topMargin + ((LinearLayout.LayoutParams) j1Var4).bottomMargin);
                        z21 = z28;
                        i54 = iMax8;
                    }
                    i62 = i26 + 1;
                }
                k1Var.f84774f = k1Var.getPaddingBottom() + k1Var.getPaddingTop() + k1Var.f84774f;
                iMax3 = iMax5;
                i55 = iCombineMeasuredStates2;
            } else {
                iMax3 = Math.max(iMax5, iMax6);
                if (z27 && i56 != 1073741824) {
                    for (int i66 = 0; i66 < i52; i66++) {
                        View childAt4 = k1Var.getChildAt(i66);
                        if (childAt4 != null && childAt4.getVisibility() != 8 && ((LinearLayout.LayoutParams) ((j1) childAt4.getLayoutParams())).weight > 0.0f) {
                            childAt4.measure(View.MeasureSpec.makeMeasureSpec(childAt4.getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(iMax4, 1073741824));
                        }
                    }
                }
            }
            int i67 = i54;
            if (z21 || i53 == 1073741824) {
                iMax3 = i67;
            }
            k1Var.setMeasuredDimension(View.resolveSizeAndState(Math.max(k1Var.getPaddingRight() + k1Var.getPaddingLeft() + iMax3, k1Var.getSuggestedMinimumWidth()), i5, i55), iResolveSizeAndState);
            if (z23) {
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(k1Var.getMeasuredWidth(), 1073741824);
                int i68 = 0;
                while (i68 < i52) {
                    View childAt5 = k1Var.getChildAt(i68);
                    if (childAt5.getVisibility() != 8) {
                        j1 j1Var5 = (j1) childAt5.getLayoutParams();
                        if (((LinearLayout.LayoutParams) j1Var5).width == -1) {
                            int i69 = ((LinearLayout.LayoutParams) j1Var5).height;
                            ((LinearLayout.LayoutParams) j1Var5).height = childAt5.getMeasuredHeight();
                            k1Var.measureChildWithMargins(childAt5, iMakeMeasureSpec, 0, i57, 0);
                            ((LinearLayout.LayoutParams) j1Var5).height = i69;
                        }
                    }
                    i68++;
                    i57 = i11;
                }
                return;
            }
            return;
        }
        float f17 = f12;
        int i71 = i5;
        k1Var.f84774f = 0;
        int childCount2 = k1Var.getChildCount();
        int mode3 = View.MeasureSpec.getMode(i71);
        int mode4 = View.MeasureSpec.getMode(i11);
        if (k1Var.f84777i == null || k1Var.f84778j == null) {
            k1Var.f84777i = new int[4];
            k1Var.f84778j = new int[4];
        }
        int[] iArr3 = k1Var.f84777i;
        int[] iArr4 = k1Var.f84778j;
        iArr3[3] = -1;
        char c11 = 2;
        iArr3[2] = -1;
        iArr3[1] = -1;
        iArr3[0] = -1;
        iArr4[3] = -1;
        iArr4[2] = -1;
        iArr4[1] = -1;
        iArr4[0] = -1;
        boolean z29 = k1Var.f84769a;
        boolean z31 = mode3 == 1073741824;
        float f18 = 0.0f;
        boolean z32 = true;
        int i72 = 0;
        int i73 = 0;
        int i74 = 0;
        int iMax9 = 0;
        int iMax10 = 0;
        int iCombineMeasuredStates3 = 0;
        boolean z33 = false;
        boolean z34 = false;
        while (i72 < childCount2) {
            char c12 = c11;
            View childAt6 = k1Var.getChildAt(i72);
            if (childAt6 == null) {
                k1Var.f84774f = k1Var.f84774f;
                i21 = i72;
                i25 = i74;
                iArr2 = iArr3;
                iArr = iArr4;
                z11 = z29;
                z12 = z31;
            } else {
                int i75 = i73;
                if (childAt6.getVisibility() == 8) {
                    i71 = i5;
                    i21 = i72;
                    i25 = i74;
                    iArr = iArr4;
                    z11 = z29;
                    z12 = z31;
                    i73 = i75;
                    iArr2 = iArr3;
                } else {
                    if (k1Var.j(i72)) {
                        k1Var.f84774f += k1Var.f84780l;
                    }
                    j1 j1Var6 = (j1) childAt6.getLayoutParams();
                    float f19 = ((LinearLayout.LayoutParams) j1Var6).weight;
                    f18 += f19;
                    int i76 = i72;
                    if (mode3 == 1073741824 && ((LinearLayout.LayoutParams) j1Var6).width == 0 && f19 > 0.0f) {
                        if (z31) {
                            k1Var.f84774f = ((LinearLayout.LayoutParams) j1Var6).leftMargin + ((LinearLayout.LayoutParams) j1Var6).rightMargin + k1Var.f84774f;
                        } else {
                            int i77 = k1Var.f84774f;
                            k1Var.f84774f = Math.max(i77, ((LinearLayout.LayoutParams) j1Var6).leftMargin + i77 + ((LinearLayout.LayoutParams) j1Var6).rightMargin);
                        }
                        if (z29) {
                            int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(0, 0);
                            childAt6.measure(iMakeMeasureSpec2, iMakeMeasureSpec2);
                            view = childAt6;
                            z11 = z29;
                            z12 = z31;
                            i22 = i75;
                            i21 = i76;
                            j1Var = j1Var6;
                            iArr2 = iArr3;
                            iArr = iArr4;
                            i71 = i5;
                            i23 = i74;
                            i19 = iMax9;
                        } else {
                            view = childAt6;
                            z11 = z29;
                            z12 = z31;
                            z33 = true;
                            i22 = i75;
                            i21 = i76;
                            i24 = 1073741824;
                            j1Var = j1Var6;
                            iArr2 = iArr3;
                            iArr = iArr4;
                            i71 = i5;
                            i23 = i74;
                            i19 = iMax9;
                            if (mode4 == i24 && ((LinearLayout.LayoutParams) j1Var).height == -1) {
                                z13 = true;
                                z34 = true;
                            } else {
                                z13 = false;
                            }
                            int i78 = ((LinearLayout.LayoutParams) j1Var).topMargin + ((LinearLayout.LayoutParams) j1Var).bottomMargin;
                            int measuredHeight3 = view.getMeasuredHeight() + i78;
                            iCombineMeasuredStates3 = View.combineMeasuredStates(iCombineMeasuredStates3, view.getMeasuredState());
                            if (z11) {
                                z14 = z13;
                            } else {
                                int baseline2 = view.getBaseline();
                                z14 = z13;
                                if (baseline2 != -1) {
                                    int i79 = ((LinearLayout.LayoutParams) j1Var).gravity;
                                    if (i79 < 0) {
                                        i79 = k1Var.f84773e;
                                    }
                                    int i81 = (((i79 & 112) >> 4) & (-2)) >> 1;
                                    iArr2[i81] = Math.max(iArr2[i81], baseline2);
                                    iArr[i81] = Math.max(iArr[i81], measuredHeight3 - baseline2);
                                }
                            }
                            int iMax11 = Math.max(i22, measuredHeight3);
                            boolean z35 = !z32 && ((LinearLayout.LayoutParams) j1Var).height == -1;
                            if (((LinearLayout.LayoutParams) j1Var).weight <= 0.0f) {
                                if (!z14) {
                                    i78 = measuredHeight3;
                                }
                                iMax9 = Math.max(i19, i78);
                                iMax2 = i23;
                            } else {
                                if (!z14) {
                                    i78 = measuredHeight3;
                                }
                                iMax2 = Math.max(i23, i78);
                                iMax9 = i19;
                            }
                            int i82 = iMax2;
                            i73 = iMax11;
                            i25 = i82;
                            z32 = z35;
                        }
                    } else {
                        if (((LinearLayout.LayoutParams) j1Var6).width != 0 || f19 <= 0.0f) {
                            i18 = Integer.MIN_VALUE;
                        } else {
                            ((LinearLayout.LayoutParams) j1Var6).width = -2;
                            i18 = 0;
                        }
                        iArr = iArr4;
                        i19 = iMax9;
                        i21 = i76;
                        z11 = z29;
                        z12 = z31;
                        int i83 = i18;
                        j1Var = j1Var6;
                        i22 = i75;
                        i71 = i5;
                        iArr2 = iArr3;
                        i23 = i74;
                        k1Var.measureChildWithMargins(childAt6, i71, f18 == 0.0f ? k1Var.f84774f : 0, i11, 0);
                        if (i83 != Integer.MIN_VALUE) {
                            ((LinearLayout.LayoutParams) j1Var).width = i83;
                        }
                        int measuredWidth3 = childAt6.getMeasuredWidth();
                        if (z12) {
                            view = childAt6;
                            k1Var.f84774f = ((LinearLayout.LayoutParams) j1Var).leftMargin + measuredWidth3 + ((LinearLayout.LayoutParams) j1Var).rightMargin + k1Var.f84774f;
                        } else {
                            view = childAt6;
                            int i84 = k1Var.f84774f;
                            k1Var.f84774f = Math.max(i84, i84 + measuredWidth3 + ((LinearLayout.LayoutParams) j1Var).leftMargin + ((LinearLayout.LayoutParams) j1Var).rightMargin);
                        }
                        if (z18) {
                            iMax10 = Math.max(measuredWidth3, iMax10);
                        }
                    }
                    i24 = 1073741824;
                    if (mode4 == i24) {
                        z13 = false;
                        int i782 = ((LinearLayout.LayoutParams) j1Var).topMargin + ((LinearLayout.LayoutParams) j1Var).bottomMargin;
                        int measuredHeight32 = view.getMeasuredHeight() + i782;
                        iCombineMeasuredStates3 = View.combineMeasuredStates(iCombineMeasuredStates3, view.getMeasuredState());
                        if (z11) {
                        }
                        int iMax112 = Math.max(i22, measuredHeight32);
                        if (z32) {
                            if (((LinearLayout.LayoutParams) j1Var).weight <= 0.0f) {
                            }
                            int i822 = iMax2;
                            i73 = iMax112;
                            i25 = i822;
                            z32 = z35;
                        }
                    }
                }
            }
            i74 = i25;
            i72 = i21 + 1;
            c11 = c12;
            iArr3 = iArr2;
            iArr4 = iArr;
            z29 = z11;
            z31 = z12;
        }
        int[] iArr5 = iArr3;
        int[] iArr6 = iArr4;
        char c13 = c11;
        boolean z36 = z29;
        boolean z37 = z31;
        int i85 = i73;
        int i86 = i74;
        int i87 = iMax9;
        if (k1Var.f84774f > 0 && k1Var.j(childCount2)) {
            k1Var.f84774f += k1Var.f84780l;
        }
        int i88 = iArr5[1];
        int iMax12 = (i88 == -1 && iArr5[0] == -1 && iArr5[c13] == -1 && iArr5[3] == -1) ? i85 : Math.max(i85, Math.max(iArr6[3], Math.max(iArr6[0], Math.max(iArr6[1], iArr6[c13]))) + Math.max(iArr5[3], Math.max(iArr5[0], Math.max(i88, iArr5[c13]))));
        if (z18 && (mode3 == Integer.MIN_VALUE || mode3 == 0)) {
            k1Var.f84774f = 0;
            for (int i89 = 0; i89 < childCount2; i89++) {
                View childAt7 = k1Var.getChildAt(i89);
                if (childAt7 == null) {
                    k1Var.f84774f = k1Var.f84774f;
                } else if (childAt7.getVisibility() != 8) {
                    j1 j1Var7 = (j1) childAt7.getLayoutParams();
                    if (z37) {
                        k1Var.f84774f = ((LinearLayout.LayoutParams) j1Var7).leftMargin + iMax10 + ((LinearLayout.LayoutParams) j1Var7).rightMargin + k1Var.f84774f;
                    } else {
                        int i91 = k1Var.f84774f;
                        k1Var.f84774f = Math.max(i91, i91 + iMax10 + ((LinearLayout.LayoutParams) j1Var7).leftMargin + ((LinearLayout.LayoutParams) j1Var7).rightMargin);
                    }
                }
            }
        }
        int paddingRight = k1Var.getPaddingRight() + k1Var.getPaddingLeft() + k1Var.f84774f;
        k1Var.f84774f = paddingRight;
        int iResolveSizeAndState2 = View.resolveSizeAndState(Math.max(paddingRight, k1Var.getSuggestedMinimumWidth()), i71, 0);
        int i92 = (iResolveSizeAndState2 & 16777215) - k1Var.f84774f;
        if (z33 || (i92 != 0 && f18 > 0.0f)) {
            if (f17 <= 0.0f) {
                f17 = f18;
            }
            iArr5[3] = -1;
            iArr5[c13] = -1;
            iArr5[1] = -1;
            iArr5[0] = -1;
            iArr6[3] = -1;
            iArr6[c13] = -1;
            iArr6[1] = -1;
            iArr6[0] = -1;
            k1Var.f84774f = 0;
            iMax12 = -1;
            int i93 = 0;
            while (i93 < childCount2) {
                View childAt8 = k1Var.getChildAt(i93);
                if (childAt8 == null || childAt8.getVisibility() == 8) {
                    i15 = iResolveSizeAndState2;
                } else {
                    j1 j1Var8 = (j1) childAt8.getLayoutParams();
                    float f21 = ((LinearLayout.LayoutParams) j1Var8).weight;
                    if (f21 > 0.0f) {
                        int i94 = (int) ((i92 * f21) / f17);
                        f17 -= f21;
                        i92 -= i94;
                        i15 = iResolveSizeAndState2;
                        int childMeasureSpec2 = ViewGroup.getChildMeasureSpec(i11, k1Var.getPaddingBottom() + k1Var.getPaddingTop() + ((LinearLayout.LayoutParams) j1Var8).topMargin + ((LinearLayout.LayoutParams) j1Var8).bottomMargin, ((LinearLayout.LayoutParams) j1Var8).height);
                        if (((LinearLayout.LayoutParams) j1Var8).width == 0) {
                            i17 = 1073741824;
                            if (mode3 == 1073741824) {
                                if (i94 <= 0) {
                                    i94 = 0;
                                }
                                childAt8.measure(View.MeasureSpec.makeMeasureSpec(i94, 1073741824), childMeasureSpec2);
                            }
                            iCombineMeasuredStates3 = View.combineMeasuredStates(iCombineMeasuredStates3, childAt8.getMeasuredState() & (-16777216));
                        } else {
                            i17 = 1073741824;
                        }
                        int measuredWidth4 = childAt8.getMeasuredWidth() + i94;
                        if (measuredWidth4 < 0) {
                            measuredWidth4 = 0;
                        }
                        childAt8.measure(View.MeasureSpec.makeMeasureSpec(measuredWidth4, i17), childMeasureSpec2);
                        iCombineMeasuredStates3 = View.combineMeasuredStates(iCombineMeasuredStates3, childAt8.getMeasuredState() & (-16777216));
                    } else {
                        i15 = iResolveSizeAndState2;
                    }
                    if (z37) {
                        k1Var.f84774f = childAt8.getMeasuredWidth() + ((LinearLayout.LayoutParams) j1Var8).leftMargin + ((LinearLayout.LayoutParams) j1Var8).rightMargin + k1Var.f84774f;
                    } else {
                        int i95 = k1Var.f84774f;
                        k1Var.f84774f = Math.max(i95, childAt8.getMeasuredWidth() + i95 + ((LinearLayout.LayoutParams) j1Var8).leftMargin + ((LinearLayout.LayoutParams) j1Var8).rightMargin);
                    }
                    boolean z38 = mode4 != 1073741824 && ((LinearLayout.LayoutParams) j1Var8).height == -1;
                    int i96 = ((LinearLayout.LayoutParams) j1Var8).topMargin + ((LinearLayout.LayoutParams) j1Var8).bottomMargin;
                    int measuredHeight4 = childAt8.getMeasuredHeight() + i96;
                    iMax12 = Math.max(iMax12, measuredHeight4);
                    if (!z38) {
                        i96 = measuredHeight4;
                    }
                    int iMax13 = Math.max(i86, i96);
                    if (z32) {
                        i16 = -1;
                        boolean z39 = ((LinearLayout.LayoutParams) j1Var8).height == -1;
                        if (!z36 && (baseline = childAt8.getBaseline()) != i16) {
                            int i97 = ((LinearLayout.LayoutParams) j1Var8).gravity;
                            if (i97 < 0) {
                                i97 = k1Var.f84773e;
                            }
                            int i98 = (((i97 & 112) >> 4) & (-2)) >> 1;
                            iArr5[i98] = Math.max(iArr5[i98], baseline);
                            iArr6[i98] = Math.max(iArr6[i98], measuredHeight4 - baseline);
                        }
                        z32 = z39;
                        i86 = iMax13;
                    } else {
                        i16 = -1;
                    }
                    if (!z36) {
                        z32 = z39;
                        i86 = iMax13;
                    }
                }
                i93++;
                iResolveSizeAndState2 = i15;
            }
            i12 = iResolveSizeAndState2;
            i13 = -16777216;
            k1Var.f84774f = k1Var.getPaddingRight() + k1Var.getPaddingLeft() + k1Var.f84774f;
            int i99 = iArr5[1];
            if (i99 == -1 && iArr5[0] == -1 && iArr5[c13] == -1 && iArr5[3] == -1) {
                i14 = 0;
            } else {
                i14 = 0;
                iMax12 = Math.max(iMax12, Math.max(iArr6[3], Math.max(iArr6[0], Math.max(iArr6[1], iArr6[c13]))) + Math.max(iArr5[3], Math.max(iArr5[0], Math.max(i99, iArr5[c13]))));
            }
            iMax = i86;
        } else {
            iMax = Math.max(i86, i87);
            if (z18 && mode3 != 1073741824) {
                for (int i100 = 0; i100 < childCount2; i100++) {
                    View childAt9 = k1Var.getChildAt(i100);
                    if (childAt9 != null && childAt9.getVisibility() != 8 && ((LinearLayout.LayoutParams) ((j1) childAt9.getLayoutParams())).weight > 0.0f) {
                        childAt9.measure(View.MeasureSpec.makeMeasureSpec(iMax10, 1073741824), View.MeasureSpec.makeMeasureSpec(childAt9.getMeasuredHeight(), 1073741824));
                    }
                }
            }
            i12 = iResolveSizeAndState2;
            i13 = -16777216;
            i14 = 0;
        }
        if (!z32 && mode4 != 1073741824) {
            iMax12 = iMax;
        }
        k1Var.setMeasuredDimension(i12 | (iCombineMeasuredStates3 & i13), View.resolveSizeAndState(Math.max(k1Var.getPaddingBottom() + k1Var.getPaddingTop() + iMax12, k1Var.getSuggestedMinimumHeight()), i11, iCombineMeasuredStates3 << 16));
        if (z34) {
            int iMakeMeasureSpec3 = View.MeasureSpec.makeMeasureSpec(k1Var.getMeasuredHeight(), 1073741824);
            int i101 = i14;
            while (i101 < childCount2) {
                View childAt10 = k1Var.getChildAt(i101);
                if (childAt10.getVisibility() != 8) {
                    j1 j1Var9 = (j1) childAt10.getLayoutParams();
                    if (((LinearLayout.LayoutParams) j1Var9).height == -1) {
                        int i102 = ((LinearLayout.LayoutParams) j1Var9).width;
                        ((LinearLayout.LayoutParams) j1Var9).width = childAt10.getMeasuredWidth();
                        k1Var.measureChildWithMargins(childAt10, i71, 0, iMakeMeasureSpec3, 0);
                        ((LinearLayout.LayoutParams) j1Var9).width = i102;
                    }
                }
                i101++;
                k1Var = this;
                i71 = i5;
            }
        }
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }
}
