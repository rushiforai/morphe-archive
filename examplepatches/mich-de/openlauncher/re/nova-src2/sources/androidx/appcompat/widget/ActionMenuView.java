package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.widget.LinearLayout;
import androidx.appcompat.view.menu.ActionMenuItemView;
import androidx.compose.ui.node.LayoutNode;
import q.j;
import q.k;
import q.m;
import q.v;
import q.y;
import r.e;
import r.g2;
import r.i;
import r.j1;
import r.k1;
import r.p2;

/* loaded from: classes2.dex */
public class ActionMenuView extends k1 implements j, y {
    public g2 A;

    /* renamed from: p, reason: collision with root package name */
    public k f13742p;

    /* renamed from: q, reason: collision with root package name */
    public Context f13743q;

    /* renamed from: r, reason: collision with root package name */
    public int f13744r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f13745s;

    /* renamed from: t, reason: collision with root package name */
    public i f13746t;

    /* renamed from: u, reason: collision with root package name */
    public e30.j f13747u;

    /* renamed from: v, reason: collision with root package name */
    public q.i f13748v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f13749w;

    /* renamed from: x, reason: collision with root package name */
    public int f13750x;

    /* renamed from: y, reason: collision with root package name */
    public final int f13751y;

    /* renamed from: z, reason: collision with root package name */
    public final int f13752z;

    public ActionMenuView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f84769a = false;
        float f11 = context.getResources().getDisplayMetrics().density;
        this.f13751y = (int) (56.0f * f11);
        this.f13752z = (int) (f11 * 4.0f);
        this.f13743q = context;
        this.f13744r = 0;
    }

    public static r.k k() {
        r.k kVar = new r.k(-2, -2);
        kVar.f84763a = false;
        ((LinearLayout.LayoutParams) kVar).gravity = 16;
        return kVar;
    }

    public static r.k l(ViewGroup.LayoutParams layoutParams) {
        r.k kVar;
        if (layoutParams == null) {
            return k();
        }
        if (layoutParams instanceof r.k) {
            r.k kVar2 = (r.k) layoutParams;
            kVar = new r.k(kVar2);
            kVar.f84763a = kVar2.f84763a;
        } else {
            kVar = new r.k(layoutParams);
        }
        if (((LinearLayout.LayoutParams) kVar).gravity <= 0) {
            ((LinearLayout.LayoutParams) kVar).gravity = 16;
        }
        return kVar;
    }

    @Override // q.j
    public final boolean a(m mVar) {
        return this.f13742p.q(mVar, null, 0);
    }

    @Override // q.y
    public final void b(k kVar) {
        this.f13742p = kVar;
    }

    @Override // r.k1, android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof r.k;
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        return false;
    }

    @Override // r.k1
    /* renamed from: g */
    public final /* bridge */ /* synthetic */ j1 generateDefaultLayoutParams() {
        return k();
    }

    @Override // r.k1, android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return k();
    }

    @Override // r.k1, android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return l(layoutParams);
    }

    @Override // r.k1
    /* renamed from: h */
    public final j1 generateLayoutParams(AttributeSet attributeSet) {
        return new r.k(getContext(), attributeSet);
    }

    @Override // r.k1
    /* renamed from: i */
    public final /* bridge */ /* synthetic */ j1 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return l(layoutParams);
    }

    public final k m() {
        if (this.f13742p == null) {
            Context context = getContext();
            k kVar = new k(context);
            this.f13742p = kVar;
            kVar.f83236e = new q.c(this, 7);
            i iVar = new i(context);
            this.f13746t = iVar;
            iVar.f84734j = true;
            iVar.f84735k = true;
            v aVar = this.f13747u;
            if (aVar == null) {
                aVar = new br.a(21);
            }
            iVar.f84729e = aVar;
            this.f13742p.b(iVar, this.f13743q);
            i iVar2 = this.f13746t;
            iVar2.f84732h = this;
            this.f13742p = iVar2.f84727c;
        }
        return this.f13742p;
    }

    public final boolean n(int i5) {
        boolean zA = false;
        if (i5 == 0) {
            return false;
        }
        KeyEvent.Callback childAt = getChildAt(i5 - 1);
        KeyEvent.Callback childAt2 = getChildAt(i5);
        if (i5 < getChildCount() && (childAt instanceof r.j)) {
            zA = ((r.j) childAt).a();
        }
        return (i5 <= 0 || !(childAt2 instanceof r.j)) ? zA : ((r.j) childAt2).b() | zA;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        i iVar = this.f13746t;
        if (iVar != null) {
            iVar.c();
            if (this.f13746t.k()) {
                this.f13746t.j();
                this.f13746t.l();
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        i iVar = this.f13746t;
        if (iVar != null) {
            iVar.j();
            e eVar = iVar.f84740r;
            if (eVar == null || !eVar.b()) {
                return;
            }
            eVar.f83302i.dismiss();
        }
    }

    @Override // r.k1, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int width;
        int paddingLeft;
        if (!this.f13749w) {
            super.onLayout(z11, i5, i11, i12, i13);
            return;
        }
        int childCount = getChildCount();
        int i14 = (i13 - i11) / 2;
        int i15 = i12 - i5;
        int paddingRight = (i15 - getPaddingRight()) - getPaddingLeft();
        boolean z12 = p2.f84838a;
        int i16 = 0;
        boolean z13 = getLayoutDirection() == 1;
        int i17 = 0;
        int i18 = 0;
        for (int i19 = 0; i19 < childCount; i19++) {
            View childAt = getChildAt(i19);
            if (childAt.getVisibility() != 8) {
                r.k kVar = (r.k) childAt.getLayoutParams();
                if (kVar.f84763a) {
                    int measuredWidth = childAt.getMeasuredWidth();
                    if (n(i19)) {
                        measuredWidth += this.f84780l;
                    }
                    int measuredHeight = childAt.getMeasuredHeight();
                    if (z13) {
                        paddingLeft = getPaddingLeft() + ((LinearLayout.LayoutParams) kVar).leftMargin;
                        width = paddingLeft + measuredWidth;
                    } else {
                        width = (getWidth() - getPaddingRight()) - ((LinearLayout.LayoutParams) kVar).rightMargin;
                        paddingLeft = width - measuredWidth;
                    }
                    int i21 = i14 - (measuredHeight / 2);
                    childAt.layout(paddingLeft, i21, width, measuredHeight + i21);
                    paddingRight -= measuredWidth;
                    i17 = 1;
                } else {
                    paddingRight -= (childAt.getMeasuredWidth() + ((LinearLayout.LayoutParams) kVar).leftMargin) + ((LinearLayout.LayoutParams) kVar).rightMargin;
                    n(i19);
                    i18++;
                }
            }
        }
        if (childCount == 1 && i17 == 0) {
            View childAt2 = getChildAt(0);
            int measuredWidth2 = childAt2.getMeasuredWidth();
            int measuredHeight2 = childAt2.getMeasuredHeight();
            int i22 = (i15 / 2) - (measuredWidth2 / 2);
            int i23 = i14 - (measuredHeight2 / 2);
            childAt2.layout(i22, i23, measuredWidth2 + i22, measuredHeight2 + i23);
            return;
        }
        int i24 = i18 - (i17 ^ 1);
        int iMax = Math.max(0, i24 > 0 ? paddingRight / i24 : 0);
        if (z13) {
            int width2 = getWidth() - getPaddingRight();
            while (i16 < childCount) {
                View childAt3 = getChildAt(i16);
                r.k kVar2 = (r.k) childAt3.getLayoutParams();
                if (childAt3.getVisibility() != 8 && !kVar2.f84763a) {
                    int i25 = width2 - ((LinearLayout.LayoutParams) kVar2).rightMargin;
                    int measuredWidth3 = childAt3.getMeasuredWidth();
                    int measuredHeight3 = childAt3.getMeasuredHeight();
                    int i26 = i14 - (measuredHeight3 / 2);
                    childAt3.layout(i25 - measuredWidth3, i26, i25, measuredHeight3 + i26);
                    width2 = i25 - ((measuredWidth3 + ((LinearLayout.LayoutParams) kVar2).leftMargin) + iMax);
                }
                i16++;
            }
            return;
        }
        int paddingLeft2 = getPaddingLeft();
        while (i16 < childCount) {
            View childAt4 = getChildAt(i16);
            r.k kVar3 = (r.k) childAt4.getLayoutParams();
            if (childAt4.getVisibility() != 8 && !kVar3.f84763a) {
                int i27 = paddingLeft2 + ((LinearLayout.LayoutParams) kVar3).leftMargin;
                int measuredWidth4 = childAt4.getMeasuredWidth();
                int measuredHeight4 = childAt4.getMeasuredHeight();
                int i28 = i14 - (measuredHeight4 / 2);
                childAt4.layout(i27, i28, i27 + measuredWidth4, measuredHeight4 + i28);
                paddingLeft2 = measuredWidth4 + ((LinearLayout.LayoutParams) kVar3).rightMargin + iMax + i27;
            }
            i16++;
        }
    }

    /* JADX WARN: Type inference failed for: r11v15 */
    /* JADX WARN: Type inference failed for: r11v16, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r11v18 */
    /* JADX WARN: Type inference failed for: r11v41 */
    @Override // r.k1, android.view.View
    public final void onMeasure(int i5, int i11) {
        int i12;
        int i13;
        ?? r11;
        int i14;
        int i15;
        k kVar;
        boolean z11 = this.f13749w;
        boolean z12 = View.MeasureSpec.getMode(i5) == 1073741824;
        this.f13749w = z12;
        if (z11 != z12) {
            this.f13750x = 0;
        }
        int size = View.MeasureSpec.getSize(i5);
        if (this.f13749w && (kVar = this.f13742p) != null && size != this.f13750x) {
            this.f13750x = size;
            kVar.p(true);
        }
        int childCount = getChildCount();
        if (!this.f13749w || childCount <= 0) {
            for (int i16 = 0; i16 < childCount; i16++) {
                r.k kVar2 = (r.k) getChildAt(i16).getLayoutParams();
                ((LinearLayout.LayoutParams) kVar2).rightMargin = 0;
                ((LinearLayout.LayoutParams) kVar2).leftMargin = 0;
            }
            super.onMeasure(i5, i11);
            return;
        }
        int mode = View.MeasureSpec.getMode(i11);
        int size2 = View.MeasureSpec.getSize(i5);
        int size3 = View.MeasureSpec.getSize(i11);
        int paddingRight = getPaddingRight() + getPaddingLeft();
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        int childMeasureSpec = ViewGroup.getChildMeasureSpec(i11, paddingBottom, -2);
        int i17 = size2 - paddingRight;
        int i18 = this.f13751y;
        int i19 = i17 / i18;
        int i21 = i17 % i18;
        if (i19 == 0) {
            setMeasuredDimension(i17, 0);
            return;
        }
        int i22 = (i21 / i19) + i18;
        int childCount2 = getChildCount();
        int iMax = 0;
        int i23 = 0;
        int iMax2 = 0;
        int i24 = 0;
        boolean z13 = false;
        int i25 = 0;
        long j11 = 0;
        while (true) {
            i12 = this.f13752z;
            if (i24 >= childCount2) {
                break;
            }
            View childAt = getChildAt(i24);
            int i26 = size3;
            int i27 = paddingBottom;
            if (childAt.getVisibility() == 8) {
                i14 = i22;
            } else {
                boolean z14 = childAt instanceof ActionMenuItemView;
                i23++;
                if (z14) {
                    childAt.setPadding(i12, 0, i12, 0);
                }
                r.k kVar3 = (r.k) childAt.getLayoutParams();
                kVar3.f84768f = false;
                kVar3.f84765c = 0;
                kVar3.f84764b = 0;
                kVar3.f84766d = false;
                ((LinearLayout.LayoutParams) kVar3).leftMargin = 0;
                ((LinearLayout.LayoutParams) kVar3).rightMargin = 0;
                kVar3.f84767e = z14 && !TextUtils.isEmpty(((ActionMenuItemView) childAt).getText());
                int i28 = kVar3.f84763a ? 1 : i19;
                r.k kVar4 = (r.k) childAt.getLayoutParams();
                int i29 = i19;
                i14 = i22;
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(childMeasureSpec) - i27, View.MeasureSpec.getMode(childMeasureSpec));
                ActionMenuItemView actionMenuItemView = z14 ? (ActionMenuItemView) childAt : null;
                boolean z15 = (actionMenuItemView == null || TextUtils.isEmpty(actionMenuItemView.getText())) ? false : true;
                boolean z16 = z15;
                if (i28 <= 0 || (z15 && i28 < 2)) {
                    i15 = 0;
                } else {
                    childAt.measure(View.MeasureSpec.makeMeasureSpec(i14 * i28, Integer.MIN_VALUE), iMakeMeasureSpec);
                    int measuredWidth = childAt.getMeasuredWidth();
                    i15 = measuredWidth / i14;
                    if (measuredWidth % i14 != 0) {
                        i15++;
                    }
                    if (z16 && i15 < 2) {
                        i15 = 2;
                    }
                }
                kVar4.f84766d = !kVar4.f84763a && z16;
                kVar4.f84764b = i15;
                childAt.measure(View.MeasureSpec.makeMeasureSpec(i15 * i14, 1073741824), iMakeMeasureSpec);
                iMax2 = Math.max(iMax2, i15);
                if (kVar3.f84766d) {
                    i25++;
                }
                if (kVar3.f84763a) {
                    z13 = true;
                }
                i19 = i29 - i15;
                iMax = Math.max(iMax, childAt.getMeasuredHeight());
                if (i15 == 1) {
                    j11 |= 1 << i24;
                }
            }
            i24++;
            size3 = i26;
            paddingBottom = i27;
            i22 = i14;
        }
        int i31 = size3;
        int i32 = i19;
        int i33 = i22;
        boolean z17 = z13 && i23 == 2;
        int i34 = i32;
        boolean z18 = false;
        while (i25 > 0 && i34 > 0) {
            int i35 = LayoutNode.NotPlacedPlaceOrder;
            long j12 = 0;
            int i36 = 0;
            int i37 = 0;
            while (i37 < childCount2) {
                int i38 = iMax;
                r.k kVar5 = (r.k) getChildAt(i37).getLayoutParams();
                boolean z19 = z17;
                if (kVar5.f84766d) {
                    int i39 = kVar5.f84764b;
                    if (i39 < i35) {
                        j12 = 1 << i37;
                        i35 = i39;
                        i36 = 1;
                    } else if (i39 == i35) {
                        j12 |= 1 << i37;
                        i36++;
                    }
                }
                i37++;
                z17 = z19;
                iMax = i38;
            }
            i13 = iMax;
            boolean z21 = z17;
            j11 |= j12;
            if (i36 > i34) {
                break;
            }
            int i40 = i35 + 1;
            int i41 = 0;
            while (i41 < childCount2) {
                View childAt2 = getChildAt(i41);
                r.k kVar6 = (r.k) childAt2.getLayoutParams();
                boolean z22 = z13;
                long j13 = 1 << i41;
                if ((j12 & j13) != 0) {
                    if (z21 && kVar6.f84767e) {
                        r11 = 1;
                        r11 = 1;
                        if (i34 == 1) {
                            childAt2.setPadding(i12 + i33, 0, i12, 0);
                        }
                    } else {
                        r11 = 1;
                    }
                    kVar6.f84764b += r11;
                    kVar6.f84768f = r11;
                    i34--;
                } else if (kVar6.f84764b == i40) {
                    j11 |= j13;
                }
                i41++;
                z13 = z22;
            }
            z17 = z21;
            iMax = i13;
            z18 = true;
        }
        i13 = iMax;
        boolean z23 = !z13 && i23 == 1;
        if (i34 > 0 && j11 != 0 && (i34 < i23 - 1 || z23 || iMax2 > 1)) {
            float fBitCount = Long.bitCount(j11);
            if (!z23) {
                if ((j11 & 1) != 0 && !((r.k) getChildAt(0).getLayoutParams()).f84767e) {
                    fBitCount -= 0.5f;
                }
                int i42 = childCount2 - 1;
                if ((j11 & (1 << i42)) != 0 && !((r.k) getChildAt(i42).getLayoutParams()).f84767e) {
                    fBitCount -= 0.5f;
                }
            }
            int i43 = fBitCount > 0.0f ? (int) ((i34 * i33) / fBitCount) : 0;
            boolean z24 = z18;
            for (int i44 = 0; i44 < childCount2; i44++) {
                if ((j11 & (1 << i44)) != 0) {
                    View childAt3 = getChildAt(i44);
                    r.k kVar7 = (r.k) childAt3.getLayoutParams();
                    if (childAt3 instanceof ActionMenuItemView) {
                        kVar7.f84765c = i43;
                        kVar7.f84768f = true;
                        if (i44 == 0 && !kVar7.f84767e) {
                            ((LinearLayout.LayoutParams) kVar7).leftMargin = (-i43) / 2;
                        }
                        z24 = true;
                    } else if (kVar7.f84763a) {
                        kVar7.f84765c = i43;
                        kVar7.f84768f = true;
                        ((LinearLayout.LayoutParams) kVar7).rightMargin = (-i43) / 2;
                        z24 = true;
                    } else {
                        if (i44 != 0) {
                            ((LinearLayout.LayoutParams) kVar7).leftMargin = i43 / 2;
                        }
                        if (i44 != childCount2 - 1) {
                            ((LinearLayout.LayoutParams) kVar7).rightMargin = i43 / 2;
                        }
                    }
                }
            }
            z18 = z24;
        }
        if (z18) {
            for (int i45 = 0; i45 < childCount2; i45++) {
                View childAt4 = getChildAt(i45);
                r.k kVar8 = (r.k) childAt4.getLayoutParams();
                if (kVar8.f84768f) {
                    childAt4.measure(View.MeasureSpec.makeMeasureSpec((kVar8.f84764b * i33) + kVar8.f84765c, 1073741824), childMeasureSpec);
                }
            }
        }
        setMeasuredDimension(i17, mode != 1073741824 ? i13 : i31);
    }

    @Override // r.k1, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new r.k(getContext(), attributeSet);
    }
}
