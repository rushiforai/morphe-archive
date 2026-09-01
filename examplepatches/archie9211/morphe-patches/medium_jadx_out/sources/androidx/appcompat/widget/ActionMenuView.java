package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.widget.LinearLayout;
import androidx.appcompat.view.menu.ActionMenuItemView;
import defpackage.bwe;
import defpackage.e6;
import defpackage.g6;
import defpackage.h6;
import defpackage.hpe;
import defpackage.i6;
import defpackage.j6;
import defpackage.k6;
import defpackage.kx7;
import defpackage.lx7;
import defpackage.nec;
import defpackage.oy7;
import defpackage.pz6;
import defpackage.qz6;
import defpackage.sx7;
import defpackage.zg7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ActionMenuView extends qz6 implements kx7, oy7 {
    public lx7 p;
    public Context q;
    public int r;
    public boolean s;
    public h6 t;
    public nec u;
    public boolean v;
    public int w;
    public final int x;
    public final int y;
    public k6 z;

    public ActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        setBaselineAligned(false);
        float f = context.getResources().getDisplayMetrics().density;
        this.x = (int) (56.0f * f);
        this.y = (int) (f * 4.0f);
        this.q = context;
        this.r = 0;
    }

    public static j6 i() {
        j6 j6Var = new j6(-2, -2);
        j6Var.a = false;
        ((LinearLayout.LayoutParams) j6Var).gravity = 16;
        return j6Var;
    }

    public static j6 j(ViewGroup.LayoutParams layoutParams) {
        j6 j6Var;
        if (layoutParams == null) {
            return i();
        }
        if (layoutParams instanceof j6) {
            j6 j6Var2 = (j6) layoutParams;
            j6Var = new j6(j6Var2);
            j6Var.a = j6Var2.a;
        } else {
            j6Var = new j6(layoutParams);
        }
        if (((LinearLayout.LayoutParams) j6Var).gravity <= 0) {
            ((LinearLayout.LayoutParams) j6Var).gravity = 16;
        }
        return j6Var;
    }

    @Override // defpackage.kx7
    public final boolean a(sx7 sx7Var) {
        return this.p.q(sx7Var, null, 0);
    }

    @Override // defpackage.oy7
    public final void b(lx7 lx7Var) {
        this.p = lx7Var;
    }

    @Override // defpackage.qz6, android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof j6;
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return false;
    }

    @Override // defpackage.qz6
    /* JADX INFO: renamed from: e */
    public final /* bridge */ /* synthetic */ pz6 generateDefaultLayoutParams() {
        return i();
    }

    @Override // defpackage.qz6
    /* JADX INFO: renamed from: f */
    public final pz6 generateLayoutParams(AttributeSet attributeSet) {
        return new j6(getContext(), attributeSet);
    }

    @Override // defpackage.qz6
    /* JADX INFO: renamed from: g */
    public final /* bridge */ /* synthetic */ pz6 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return j(layoutParams);
    }

    @Override // defpackage.qz6, android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return i();
    }

    @Override // defpackage.qz6, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new j6(getContext(), attributeSet);
    }

    public Menu getMenu() {
        lx7 lx7Var = this.p;
        if (lx7Var != null) {
            return lx7Var;
        }
        Context context = getContext();
        lx7 lx7Var2 = new lx7(context);
        this.p = lx7Var2;
        lx7Var2.e = new zg7(5, this);
        h6 h6Var = new h6(context);
        this.t = h6Var;
        h6Var.l = true;
        h6Var.m = true;
        h6Var.e = new hpe(10);
        this.p.b(h6Var, this.q);
        h6 h6Var2 = this.t;
        h6Var2.h = this;
        lx7 lx7Var3 = h6Var2.c;
        this.p = lx7Var3;
        return lx7Var3;
    }

    public Drawable getOverflowIcon() {
        getMenu();
        h6 h6Var = this.t;
        g6 g6Var = h6Var.i;
        if (g6Var != null) {
            return g6Var.getDrawable();
        }
        if (h6Var.k) {
            return h6Var.j;
        }
        return null;
    }

    public int getPopupTheme() {
        return this.r;
    }

    public int getWindowAnimations() {
        return 0;
    }

    public final boolean k(int i) {
        boolean zB = false;
        if (i == 0) {
            return false;
        }
        KeyEvent.Callback childAt = getChildAt(i - 1);
        KeyEvent.Callback childAt2 = getChildAt(i);
        if (i < getChildCount() && (childAt instanceof i6)) {
            zB = ((i6) childAt).b();
        }
        return (i <= 0 || !(childAt2 instanceof i6)) ? zB : ((i6) childAt2).c() | zB;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        h6 h6Var = this.t;
        if (h6Var != null) {
            h6Var.i();
            if (this.t.j()) {
                this.t.e();
                this.t.l();
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        h6 h6Var = this.t;
        if (h6Var != null) {
            h6Var.e();
            e6 e6Var = h6Var.t;
            if (e6Var == null || !e6Var.b()) {
                return;
            }
            e6Var.i.dismiss();
        }
    }

    @Override // defpackage.qz6, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int width;
        int paddingLeft;
        if (!this.v) {
            super.onLayout(z, i, i2, i3, i4);
            return;
        }
        int childCount = getChildCount();
        int i5 = (i4 - i2) / 2;
        int dividerWidth = getDividerWidth();
        int i6 = i3 - i;
        int paddingRight = (i6 - getPaddingRight()) - getPaddingLeft();
        boolean z2 = bwe.a;
        boolean z3 = getLayoutDirection() == 1;
        int i7 = 0;
        int i8 = 0;
        for (int i9 = 0; i9 < childCount; i9++) {
            View childAt = getChildAt(i9);
            if (childAt.getVisibility() != 8) {
                j6 j6Var = (j6) childAt.getLayoutParams();
                if (j6Var.a) {
                    int measuredWidth = childAt.getMeasuredWidth();
                    if (k(i9)) {
                        measuredWidth += dividerWidth;
                    }
                    int measuredHeight = childAt.getMeasuredHeight();
                    if (z3) {
                        paddingLeft = getPaddingLeft() + ((LinearLayout.LayoutParams) j6Var).leftMargin;
                        width = paddingLeft + measuredWidth;
                    } else {
                        width = (getWidth() - getPaddingRight()) - ((LinearLayout.LayoutParams) j6Var).rightMargin;
                        paddingLeft = width - measuredWidth;
                    }
                    int i10 = i5 - (measuredHeight / 2);
                    childAt.layout(paddingLeft, i10, width, measuredHeight + i10);
                    paddingRight -= measuredWidth;
                    i7 = 1;
                } else {
                    paddingRight -= (childAt.getMeasuredWidth() + ((LinearLayout.LayoutParams) j6Var).leftMargin) + ((LinearLayout.LayoutParams) j6Var).rightMargin;
                    k(i9);
                    i8++;
                }
            }
        }
        if (childCount == 1 && i7 == 0) {
            View childAt2 = getChildAt(0);
            int measuredWidth2 = childAt2.getMeasuredWidth();
            int measuredHeight2 = childAt2.getMeasuredHeight();
            int i11 = (i6 / 2) - (measuredWidth2 / 2);
            int i12 = i5 - (measuredHeight2 / 2);
            childAt2.layout(i11, i12, measuredWidth2 + i11, measuredHeight2 + i12);
            return;
        }
        int i13 = i8 - (i7 ^ 1);
        int iMax = Math.max(0, i13 > 0 ? paddingRight / i13 : 0);
        if (z3) {
            int width2 = getWidth() - getPaddingRight();
            for (int i14 = 0; i14 < childCount; i14++) {
                View childAt3 = getChildAt(i14);
                j6 j6Var2 = (j6) childAt3.getLayoutParams();
                if (childAt3.getVisibility() != 8 && !j6Var2.a) {
                    int i15 = width2 - ((LinearLayout.LayoutParams) j6Var2).rightMargin;
                    int measuredWidth3 = childAt3.getMeasuredWidth();
                    int measuredHeight3 = childAt3.getMeasuredHeight();
                    int i16 = i5 - (measuredHeight3 / 2);
                    childAt3.layout(i15 - measuredWidth3, i16, i15, measuredHeight3 + i16);
                    width2 = i15 - ((measuredWidth3 + ((LinearLayout.LayoutParams) j6Var2).leftMargin) + iMax);
                }
            }
            return;
        }
        int paddingLeft2 = getPaddingLeft();
        for (int i17 = 0; i17 < childCount; i17++) {
            View childAt4 = getChildAt(i17);
            j6 j6Var3 = (j6) childAt4.getLayoutParams();
            if (childAt4.getVisibility() != 8 && !j6Var3.a) {
                int i18 = paddingLeft2 + ((LinearLayout.LayoutParams) j6Var3).leftMargin;
                int measuredWidth4 = childAt4.getMeasuredWidth();
                int measuredHeight4 = childAt4.getMeasuredHeight();
                int i19 = i5 - (measuredHeight4 / 2);
                childAt4.layout(i18, i19, i18 + measuredWidth4, measuredHeight4 + i19);
                paddingLeft2 = measuredWidth4 + ((LinearLayout.LayoutParams) j6Var3).rightMargin + iMax + i18;
            }
        }
    }

    /* JADX WARN: Type inference failed for: r11v15 */
    /* JADX WARN: Type inference failed for: r11v16, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r11v18 */
    /* JADX WARN: Type inference failed for: r11v41 */
    @Override // defpackage.qz6, android.view.View
    public final void onMeasure(int i, int i2) {
        int i3;
        int i4;
        ?? r11;
        int i5;
        int i6;
        lx7 lx7Var;
        boolean z = this.v;
        boolean z2 = View.MeasureSpec.getMode(i) == 1073741824;
        this.v = z2;
        if (z != z2) {
            this.w = 0;
        }
        int size = View.MeasureSpec.getSize(i);
        if (this.v && (lx7Var = this.p) != null && size != this.w) {
            this.w = size;
            lx7Var.p(true);
        }
        int childCount = getChildCount();
        if (!this.v || childCount <= 0) {
            for (int i7 = 0; i7 < childCount; i7++) {
                j6 j6Var = (j6) getChildAt(i7).getLayoutParams();
                ((LinearLayout.LayoutParams) j6Var).rightMargin = 0;
                ((LinearLayout.LayoutParams) j6Var).leftMargin = 0;
            }
            super.onMeasure(i, i2);
            return;
        }
        int mode = View.MeasureSpec.getMode(i2);
        int size2 = View.MeasureSpec.getSize(i);
        int size3 = View.MeasureSpec.getSize(i2);
        int paddingRight = getPaddingRight() + getPaddingLeft();
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        int childMeasureSpec = ViewGroup.getChildMeasureSpec(i2, paddingBottom, -2);
        int i8 = size2 - paddingRight;
        int i9 = this.x;
        int i10 = i8 / i9;
        int i11 = i8 % i9;
        if (i10 == 0) {
            setMeasuredDimension(i8, 0);
            return;
        }
        int i12 = (i11 / i10) + i9;
        int childCount2 = getChildCount();
        int iMax = 0;
        int i13 = 0;
        int iMax2 = 0;
        int i14 = 0;
        boolean z3 = false;
        int i15 = 0;
        long j = 0;
        while (true) {
            i3 = this.y;
            if (i14 >= childCount2) {
                break;
            }
            View childAt = getChildAt(i14);
            int i16 = size3;
            int i17 = paddingBottom;
            if (childAt.getVisibility() == 8) {
                i5 = i12;
            } else {
                boolean z4 = childAt instanceof ActionMenuItemView;
                i13++;
                if (z4) {
                    childAt.setPadding(i3, 0, i3, 0);
                }
                j6 j6Var2 = (j6) childAt.getLayoutParams();
                j6Var2.f = false;
                j6Var2.c = 0;
                j6Var2.b = 0;
                j6Var2.d = false;
                ((LinearLayout.LayoutParams) j6Var2).leftMargin = 0;
                ((LinearLayout.LayoutParams) j6Var2).rightMargin = 0;
                j6Var2.e = z4 && !TextUtils.isEmpty(((ActionMenuItemView) childAt).getText());
                int i18 = j6Var2.a ? 1 : i10;
                j6 j6Var3 = (j6) childAt.getLayoutParams();
                int i19 = i10;
                i5 = i12;
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(childMeasureSpec) - i17, View.MeasureSpec.getMode(childMeasureSpec));
                ActionMenuItemView actionMenuItemView = z4 ? (ActionMenuItemView) childAt : null;
                boolean z5 = (actionMenuItemView == null || TextUtils.isEmpty(actionMenuItemView.getText())) ? false : true;
                boolean z6 = z5;
                if (i18 <= 0 || (z5 && i18 < 2)) {
                    i6 = 0;
                } else {
                    childAt.measure(View.MeasureSpec.makeMeasureSpec(i5 * i18, Integer.MIN_VALUE), iMakeMeasureSpec);
                    int measuredWidth = childAt.getMeasuredWidth();
                    i6 = measuredWidth / i5;
                    if (measuredWidth % i5 != 0) {
                        i6++;
                    }
                    if (z6 && i6 < 2) {
                        i6 = 2;
                    }
                }
                j6Var3.d = !j6Var3.a && z6;
                j6Var3.b = i6;
                childAt.measure(View.MeasureSpec.makeMeasureSpec(i6 * i5, 1073741824), iMakeMeasureSpec);
                iMax2 = Math.max(iMax2, i6);
                if (j6Var2.d) {
                    i15++;
                }
                if (j6Var2.a) {
                    z3 = true;
                }
                i10 = i19 - i6;
                iMax = Math.max(iMax, childAt.getMeasuredHeight());
                if (i6 == 1) {
                    j |= (long) (1 << i14);
                }
            }
            i14++;
            size3 = i16;
            paddingBottom = i17;
            i12 = i5;
        }
        int i20 = size3;
        int i21 = i10;
        int i22 = i12;
        boolean z7 = z3 && i13 == 2;
        int i23 = i21;
        boolean z8 = false;
        while (i15 > 0 && i23 > 0) {
            int i24 = Integer.MAX_VALUE;
            long j2 = 0;
            int i25 = 0;
            int i26 = 0;
            while (i26 < childCount2) {
                int i27 = iMax;
                j6 j6Var4 = (j6) getChildAt(i26).getLayoutParams();
                boolean z9 = z7;
                if (j6Var4.d) {
                    int i28 = j6Var4.b;
                    if (i28 < i24) {
                        j2 = 1 << i26;
                        i24 = i28;
                        i25 = 1;
                    } else if (i28 == i24) {
                        j2 |= 1 << i26;
                        i25++;
                    }
                }
                i26++;
                z7 = z9;
                iMax = i27;
            }
            i4 = iMax;
            boolean z10 = z7;
            j |= j2;
            if (i25 > i23) {
                break;
            }
            int i29 = i24 + 1;
            int i30 = 0;
            while (i30 < childCount2) {
                View childAt2 = getChildAt(i30);
                j6 j6Var5 = (j6) childAt2.getLayoutParams();
                boolean z11 = z3;
                long j3 = 1 << i30;
                if ((j2 & j3) != 0) {
                    if (z10 && j6Var5.e) {
                        r11 = 1;
                        r11 = 1;
                        if (i23 == 1) {
                            childAt2.setPadding(i3 + i22, 0, i3, 0);
                        }
                    } else {
                        r11 = 1;
                    }
                    j6Var5.b += r11;
                    j6Var5.f = r11;
                    i23--;
                } else if (j6Var5.b == i29) {
                    j |= j3;
                }
                i30++;
                z3 = z11;
            }
            z7 = z10;
            iMax = i4;
            z8 = true;
        }
        i4 = iMax;
        boolean z12 = !z3 && i13 == 1;
        if (i23 > 0 && j != 0 && (i23 < i13 - 1 || z12 || iMax2 > 1)) {
            float fBitCount = Long.bitCount(j);
            if (!z12) {
                if ((j & 1) != 0 && !((j6) getChildAt(0).getLayoutParams()).e) {
                    fBitCount -= 0.5f;
                }
                int i31 = childCount2 - 1;
                if ((j & ((long) (1 << i31))) != 0 && !((j6) getChildAt(i31).getLayoutParams()).e) {
                    fBitCount -= 0.5f;
                }
            }
            int i32 = fBitCount > 0.0f ? (int) ((i23 * i22) / fBitCount) : 0;
            boolean z13 = z8;
            for (int i33 = 0; i33 < childCount2; i33++) {
                if ((j & ((long) (1 << i33))) != 0) {
                    View childAt3 = getChildAt(i33);
                    j6 j6Var6 = (j6) childAt3.getLayoutParams();
                    if (childAt3 instanceof ActionMenuItemView) {
                        j6Var6.c = i32;
                        j6Var6.f = true;
                        if (i33 == 0 && !j6Var6.e) {
                            ((LinearLayout.LayoutParams) j6Var6).leftMargin = (-i32) / 2;
                        }
                        z13 = true;
                    } else if (j6Var6.a) {
                        j6Var6.c = i32;
                        j6Var6.f = true;
                        ((LinearLayout.LayoutParams) j6Var6).rightMargin = (-i32) / 2;
                        z13 = true;
                    } else {
                        if (i33 != 0) {
                            ((LinearLayout.LayoutParams) j6Var6).leftMargin = i32 / 2;
                        }
                        if (i33 != childCount2 - 1) {
                            ((LinearLayout.LayoutParams) j6Var6).rightMargin = i32 / 2;
                        }
                    }
                }
            }
            z8 = z13;
        }
        if (z8) {
            for (int i34 = 0; i34 < childCount2; i34++) {
                View childAt4 = getChildAt(i34);
                j6 j6Var7 = (j6) childAt4.getLayoutParams();
                if (j6Var7.f) {
                    childAt4.measure(View.MeasureSpec.makeMeasureSpec((j6Var7.b * i22) + j6Var7.c, 1073741824), childMeasureSpec);
                }
            }
        }
        setMeasuredDimension(i8, mode != 1073741824 ? i4 : i20);
    }

    public void setExpandedActionViewsExclusive(boolean z) {
        this.t.q = z;
    }

    public void setOnMenuItemClickListener(k6 k6Var) {
        this.z = k6Var;
    }

    public void setOverflowIcon(Drawable drawable) {
        getMenu();
        h6 h6Var = this.t;
        g6 g6Var = h6Var.i;
        if (g6Var != null) {
            g6Var.setImageDrawable(drawable);
        } else {
            h6Var.k = true;
            h6Var.j = drawable;
        }
    }

    public void setOverflowReserved(boolean z) {
        this.s = z;
    }

    public void setPopupTheme(int i) {
        if (this.r != i) {
            this.r = i;
            if (i == 0) {
                this.q = getContext();
            } else {
                this.q = new ContextThemeWrapper(getContext(), i);
            }
        }
    }

    public void setPresenter(h6 h6Var) {
        this.t = h6Var;
        h6Var.h = this;
        this.p = h6Var.c;
    }

    @Override // defpackage.qz6, android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return j(layoutParams);
    }

    public ActionMenuView(Context context) {
        this(context, null);
    }
}
