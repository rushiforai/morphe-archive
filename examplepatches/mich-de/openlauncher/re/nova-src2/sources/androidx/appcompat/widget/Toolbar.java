package androidx.appcompat.widget;

import a5.a1;
import a5.p;
import a5.t;
import a5.u;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import androidx.customview.view.AbsSavedState;
import e30.j;
import java.util.ArrayList;
import java.util.WeakHashMap;
import m.m0;
import o7.g0;
import q.k;
import q.m;
import r.b2;
import r.f2;
import r.g2;
import r.h2;
import r.i;
import r.i2;
import r.j2;
import r.l2;
import r.m2;
import r.p2;
import r.s;

/* loaded from: classes2.dex */
public class Toolbar extends ViewGroup implements p {
    public final ColorStateList A;
    public boolean B;
    public boolean C;
    public final ArrayList D;
    public final ArrayList E;
    public final int[] F;
    public final t G;
    public ArrayList H;
    public m0 I;
    public final g2 J;
    public l2 K;
    public i L;
    public i2 M;
    public j N;
    public m0 O;
    public OnBackInvokedCallback P;
    public OnBackInvokedDispatcher Q;
    public boolean R;
    public final g0 S;

    /* renamed from: a, reason: collision with root package name */
    public ActionMenuView f13800a;

    /* renamed from: b, reason: collision with root package name */
    public AppCompatTextView f13801b;

    /* renamed from: c, reason: collision with root package name */
    public AppCompatTextView f13802c;

    /* renamed from: d, reason: collision with root package name */
    public s f13803d;

    /* renamed from: e, reason: collision with root package name */
    public AppCompatImageView f13804e;

    /* renamed from: f, reason: collision with root package name */
    public final Drawable f13805f;

    /* renamed from: g, reason: collision with root package name */
    public final CharSequence f13806g;

    /* renamed from: h, reason: collision with root package name */
    public s f13807h;

    /* renamed from: i, reason: collision with root package name */
    public View f13808i;

    /* renamed from: j, reason: collision with root package name */
    public Context f13809j;

    /* renamed from: k, reason: collision with root package name */
    public int f13810k;

    /* renamed from: l, reason: collision with root package name */
    public int f13811l;

    /* renamed from: m, reason: collision with root package name */
    public int f13812m;
    public final int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f13813p;

    /* renamed from: q, reason: collision with root package name */
    public final int f13814q;

    /* renamed from: r, reason: collision with root package name */
    public final int f13815r;

    /* renamed from: s, reason: collision with root package name */
    public final int f13816s;

    /* renamed from: t, reason: collision with root package name */
    public b2 f13817t;

    /* renamed from: u, reason: collision with root package name */
    public final int f13818u;

    /* renamed from: v, reason: collision with root package name */
    public final int f13819v;

    /* renamed from: w, reason: collision with root package name */
    public final int f13820w;

    /* renamed from: x, reason: collision with root package name */
    public CharSequence f13821x;

    /* renamed from: y, reason: collision with root package name */
    public CharSequence f13822y;

    /* renamed from: z, reason: collision with root package name */
    public final ColorStateList f13823z;

    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new c();

        /* renamed from: c, reason: collision with root package name */
        public int f13824c;

        /* renamed from: d, reason: collision with root package name */
        public boolean f13825d;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f13824c = parcel.readInt();
            this.f13825d = parcel.readInt() != 0;
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f13824c);
            parcel.writeInt(this.f13825d ? 1 : 0);
        }
    }

    public Toolbar(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public static j2 f() {
        return new j2(-2, -2);
    }

    public static j2 g(ViewGroup.LayoutParams layoutParams) {
        if (layoutParams instanceof j2) {
            j2 j2Var = (j2) layoutParams;
            j2 j2Var2 = new j2(j2Var);
            j2Var2.f84762b = 0;
            j2Var2.f84762b = j2Var.f84762b;
            return j2Var2;
        }
        if (layoutParams instanceof m.a) {
            j2 j2Var3 = new j2((m.a) layoutParams);
            j2Var3.f84762b = 0;
            return j2Var3;
        }
        if (!(layoutParams instanceof ViewGroup.MarginLayoutParams)) {
            j2 j2Var4 = new j2(layoutParams);
            j2Var4.f84762b = 0;
            return j2Var4;
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        j2 j2Var5 = new j2(marginLayoutParams);
        j2Var5.f84762b = 0;
        ((ViewGroup.MarginLayoutParams) j2Var5).leftMargin = marginLayoutParams.leftMargin;
        ((ViewGroup.MarginLayoutParams) j2Var5).topMargin = marginLayoutParams.topMargin;
        ((ViewGroup.MarginLayoutParams) j2Var5).rightMargin = marginLayoutParams.rightMargin;
        ((ViewGroup.MarginLayoutParams) j2Var5).bottomMargin = marginLayoutParams.bottomMargin;
        return j2Var5;
    }

    public static int l(View view) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        return marginLayoutParams.getMarginEnd() + marginLayoutParams.getMarginStart();
    }

    public static int n(View view) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        return marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
    }

    public void A(CharSequence charSequence) {
        if (TextUtils.isEmpty(charSequence)) {
            AppCompatTextView appCompatTextView = this.f13801b;
            if (appCompatTextView != null && p(appCompatTextView)) {
                removeView(this.f13801b);
                this.E.remove(this.f13801b);
            }
        } else {
            if (this.f13801b == null) {
                Context context = getContext();
                AppCompatTextView appCompatTextView2 = new AppCompatTextView(context, null);
                this.f13801b = appCompatTextView2;
                appCompatTextView2.setSingleLine();
                this.f13801b.setEllipsize(TextUtils.TruncateAt.END);
                int i5 = this.f13811l;
                if (i5 != 0) {
                    this.f13801b.setTextAppearance(context, i5);
                }
                ColorStateList colorStateList = this.f13823z;
                if (colorStateList != null) {
                    this.f13801b.setTextColor(colorStateList);
                }
            }
            if (!p(this.f13801b)) {
                b(this.f13801b, true);
            }
        }
        AppCompatTextView appCompatTextView3 = this.f13801b;
        if (appCompatTextView3 != null) {
            appCompatTextView3.setText(charSequence);
        }
        this.f13821x = charSequence;
    }

    public final boolean B(View view) {
        return (view == null || view.getParent() != this || view.getVisibility() == 8) ? false : true;
    }

    public final boolean C() {
        i iVar;
        ActionMenuView actionMenuView = this.f13800a;
        return (actionMenuView == null || (iVar = actionMenuView.f13746t) == null || !iVar.l()) ? false : true;
    }

    public final void D() {
        OnBackInvokedDispatcher onBackInvokedDispatcher;
        if (Build.VERSION.SDK_INT >= 33) {
            OnBackInvokedDispatcher onBackInvokedDispatcherA = h2.a(this);
            i2 i2Var = this.M;
            boolean z11 = (i2Var == null || i2Var.f84756b == null || onBackInvokedDispatcherA == null || !isAttachedToWindow() || !this.R) ? false : true;
            if (z11 && this.Q == null) {
                if (this.P == null) {
                    this.P = h2.b(new f2(this, 0));
                }
                h2.c(onBackInvokedDispatcherA, this.P);
                this.Q = onBackInvokedDispatcherA;
                return;
            }
            if (z11 || (onBackInvokedDispatcher = this.Q) == null) {
                return;
            }
            h2.d(onBackInvokedDispatcher, this.P);
            this.Q = null;
        }
    }

    public final void a(ArrayList arrayList, int i5) {
        boolean z11 = getLayoutDirection() == 1;
        int childCount = getChildCount();
        int absoluteGravity = Gravity.getAbsoluteGravity(i5, getLayoutDirection());
        arrayList.clear();
        if (!z11) {
            for (int i11 = 0; i11 < childCount; i11++) {
                View childAt = getChildAt(i11);
                j2 j2Var = (j2) childAt.getLayoutParams();
                if (j2Var.f84762b == 0 && B(childAt)) {
                    int i12 = j2Var.f75187a;
                    int layoutDirection = getLayoutDirection();
                    int absoluteGravity2 = Gravity.getAbsoluteGravity(i12, layoutDirection) & 7;
                    if (absoluteGravity2 != 1 && absoluteGravity2 != 3 && absoluteGravity2 != 5) {
                        absoluteGravity2 = layoutDirection == 1 ? 5 : 3;
                    }
                    if (absoluteGravity2 == absoluteGravity) {
                        arrayList.add(childAt);
                    }
                }
            }
            return;
        }
        for (int i13 = childCount - 1; i13 >= 0; i13--) {
            View childAt2 = getChildAt(i13);
            j2 j2Var2 = (j2) childAt2.getLayoutParams();
            if (j2Var2.f84762b == 0 && B(childAt2)) {
                int i14 = j2Var2.f75187a;
                int layoutDirection2 = getLayoutDirection();
                int absoluteGravity3 = Gravity.getAbsoluteGravity(i14, layoutDirection2) & 7;
                if (absoluteGravity3 != 1 && absoluteGravity3 != 3 && absoluteGravity3 != 5) {
                    absoluteGravity3 = layoutDirection2 == 1 ? 5 : 3;
                }
                if (absoluteGravity3 == absoluteGravity) {
                    arrayList.add(childAt2);
                }
            }
        }
    }

    @Override // a5.p
    public final void addMenuProvider(u uVar) {
        t tVar = this.G;
        tVar.f367b.add(uVar);
        tVar.f366a.run();
    }

    public final void b(View view, boolean z11) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        j2 j2VarF = layoutParams == null ? f() : !checkLayoutParams(layoutParams) ? g(layoutParams) : (j2) layoutParams;
        j2VarF.f84762b = 1;
        if (!z11 || this.f13808i == null) {
            addView(view, j2VarF);
        } else {
            view.setLayoutParams(j2VarF);
            this.E.add(view);
        }
    }

    public final void c() {
        if (this.f13817t == null) {
            b2 b2Var = new b2();
            b2Var.f84671a = 0;
            b2Var.f84672b = 0;
            b2Var.f84673c = Integer.MIN_VALUE;
            b2Var.f84674d = Integer.MIN_VALUE;
            b2Var.f84675e = 0;
            b2Var.f84676f = 0;
            b2Var.f84677g = false;
            b2Var.f84678h = false;
            this.f13817t = b2Var;
        }
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return super.checkLayoutParams(layoutParams) && (layoutParams instanceof j2);
    }

    public final void d() {
        if (this.f13800a == null) {
            ActionMenuView actionMenuView = new ActionMenuView(getContext(), null);
            this.f13800a = actionMenuView;
            int i5 = this.f13810k;
            if (actionMenuView.f13744r != i5) {
                actionMenuView.f13744r = i5;
                if (i5 == 0) {
                    actionMenuView.f13743q = actionMenuView.getContext();
                } else {
                    actionMenuView.f13743q = new ContextThemeWrapper(actionMenuView.getContext(), i5);
                }
            }
            ActionMenuView actionMenuView2 = this.f13800a;
            actionMenuView2.A = this.J;
            j jVar = this.N;
            g2 g2Var = new g2(this);
            actionMenuView2.f13747u = jVar;
            actionMenuView2.f13748v = g2Var;
            j2 j2VarF = f();
            j2VarF.f75187a = (this.n & 112) | 8388613;
            this.f13800a.setLayoutParams(j2VarF);
            b(this.f13800a, false);
        }
    }

    public final void e() {
        if (this.f13803d == null) {
            this.f13803d = new s(getContext(), null, 2130970239);
            j2 j2VarF = f();
            j2VarF.f75187a = (this.n & 112) | 8388611;
            this.f13803d.setLayoutParams(j2VarF);
        }
    }

    @Override // android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return f();
    }

    @Override // android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return g(layoutParams);
    }

    public final int h(int i5, View view) {
        j2 j2Var = (j2) view.getLayoutParams();
        int measuredHeight = view.getMeasuredHeight();
        int i11 = i5 > 0 ? (measuredHeight - i5) / 2 : 0;
        int i12 = j2Var.f75187a & 112;
        if (i12 != 16 && i12 != 48 && i12 != 80) {
            i12 = this.f13820w & 112;
        }
        if (i12 == 48) {
            return getPaddingTop() - i11;
        }
        if (i12 == 80) {
            return (((getHeight() - getPaddingBottom()) - measuredHeight) - ((ViewGroup.MarginLayoutParams) j2Var).bottomMargin) - i11;
        }
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int height = getHeight();
        int iMax = (((height - paddingTop) - paddingBottom) - measuredHeight) / 2;
        int i13 = ((ViewGroup.MarginLayoutParams) j2Var).topMargin;
        if (iMax < i13) {
            iMax = i13;
        } else {
            int i14 = (((height - paddingBottom) - measuredHeight) - iMax) - paddingTop;
            int i15 = ((ViewGroup.MarginLayoutParams) j2Var).bottomMargin;
            if (i14 < i15) {
                iMax = Math.max(0, iMax - (i15 - i14));
            }
        }
        return paddingTop + iMax;
    }

    public final int i() {
        k kVar;
        ActionMenuView actionMenuView = this.f13800a;
        if (actionMenuView != null && (kVar = actionMenuView.f13742p) != null && kVar.hasVisibleItems()) {
            b2 b2Var = this.f13817t;
            return Math.max(b2Var != null ? b2Var.f84677g ? b2Var.f84671a : b2Var.f84672b : 0, Math.max(this.f13819v, 0));
        }
        b2 b2Var2 = this.f13817t;
        if (b2Var2 != null) {
            return b2Var2.f84677g ? b2Var2.f84671a : b2Var2.f84672b;
        }
        return 0;
    }

    public final int j() {
        s sVar = this.f13803d;
        if ((sVar != null ? sVar.getDrawable() : null) != null) {
            b2 b2Var = this.f13817t;
            return Math.max(b2Var != null ? b2Var.f84677g ? b2Var.f84672b : b2Var.f84671a : 0, Math.max(this.f13818u, 0));
        }
        b2 b2Var2 = this.f13817t;
        if (b2Var2 != null) {
            return b2Var2.f84677g ? b2Var2.f84672b : b2Var2.f84671a;
        }
        return 0;
    }

    public final ArrayList k() {
        ArrayList arrayList = new ArrayList();
        k kVarM = m();
        for (int i5 = 0; i5 < kVarM.f83237f.size(); i5++) {
            arrayList.add(kVarM.getItem(i5));
        }
        return arrayList;
    }

    public final k m() {
        d();
        ActionMenuView actionMenuView = this.f13800a;
        if (actionMenuView.f13742p == null) {
            k kVarM = actionMenuView.m();
            if (this.M == null) {
                this.M = new i2(this);
            }
            this.f13800a.f13746t.o = true;
            kVarM.b(this.M, this.f13809j);
            D();
        }
        return this.f13800a.m();
    }

    public void o(int i5) {
        new androidx.appcompat.view.i(getContext()).inflate(i5, m());
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        D();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(this.S);
        D();
    }

    @Override // android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 9) {
            this.C = false;
        }
        if (!this.C) {
            boolean zOnHoverEvent = super.onHoverEvent(motionEvent);
            if (actionMasked == 9 && !zOnHoverEvent) {
                this.C = true;
            }
        }
        if (actionMasked != 10 && actionMasked != 3) {
            return true;
        }
        this.C = false;
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0233  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x02aa A[LOOP:0: B:116:0x02a8->B:117:0x02aa, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:120:0x02c3 A[LOOP:1: B:119:0x02c1->B:120:0x02c3, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x02e4 A[LOOP:2: B:122:0x02e2->B:123:0x02e4, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:127:0x0324  */
    /* JADX WARN: Removed duplicated region for block: B:132:0x0332 A[LOOP:3: B:131:0x0330->B:132:0x0332, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x009d  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0140  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0142  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0145  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x014c  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x0183  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x01b6  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x01c7  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int iR;
        int iS;
        boolean z12;
        int iMin;
        boolean zB;
        boolean zB2;
        int measuredHeight;
        int i14;
        int i15;
        int i16;
        int paddingTop;
        int i17;
        int i18;
        int iMax;
        int i19;
        int i21;
        int size;
        int iR2;
        int i22;
        int size2;
        int i23;
        int size3;
        int i24;
        int i25;
        int size4;
        int i26;
        boolean z13 = getLayoutDirection() == 1;
        int width = getWidth();
        int height = getHeight();
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop2 = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int i27 = width - paddingRight;
        int[] iArr = this.F;
        iArr[1] = 0;
        iArr[0] = 0;
        WeakHashMap weakHashMap = a1.f250a;
        int minimumHeight = getMinimumHeight();
        int iMin2 = minimumHeight >= 0 ? Math.min(minimumHeight, i13 - i11) : 0;
        if (!B(this.f13803d)) {
            iR = paddingLeft;
        } else {
            if (z13) {
                iS = s(this.f13803d, i27, iMin2, iArr);
                iR = paddingLeft;
                if (B(this.f13807h)) {
                    if (z13) {
                        iS = s(this.f13807h, iS, iMin2, iArr);
                    } else {
                        iR = r(this.f13807h, iR, iMin2, iArr);
                    }
                }
                if (B(this.f13800a)) {
                    if (z13) {
                        iR = r(this.f13800a, iR, iMin2, iArr);
                    } else {
                        iS = s(this.f13800a, iS, iMin2, iArr);
                    }
                }
                int i28 = getLayoutDirection() != 1 ? i() : j();
                int iJ = getLayoutDirection() != 1 ? j() : i();
                z12 = z13;
                iArr[0] = Math.max(0, i28 - iR);
                iArr[1] = Math.max(0, iJ - (i27 - iS));
                int iMax2 = Math.max(iR, i28);
                iMin = Math.min(iS, i27 - iJ);
                if (B(this.f13808i)) {
                    if (z12) {
                        iMin = s(this.f13808i, iMin, iMin2, iArr);
                    } else {
                        iMax2 = r(this.f13808i, iMax2, iMin2, iArr);
                    }
                }
                if (B(this.f13804e)) {
                    if (z12) {
                        iMin = s(this.f13804e, iMin, iMin2, iArr);
                    } else {
                        iMax2 = r(this.f13804e, iMax2, iMin2, iArr);
                    }
                }
                zB = B(this.f13801b);
                zB2 = B(this.f13802c);
                if (zB) {
                    measuredHeight = 0;
                } else {
                    j2 j2Var = (j2) this.f13801b.getLayoutParams();
                    measuredHeight = ((ViewGroup.MarginLayoutParams) j2Var).bottomMargin + this.f13801b.getMeasuredHeight() + ((ViewGroup.MarginLayoutParams) j2Var).topMargin;
                }
                if (zB2) {
                    i14 = iMax2;
                } else {
                    j2 j2Var2 = (j2) this.f13802c.getLayoutParams();
                    i14 = iMax2;
                    measuredHeight += this.f13802c.getMeasuredHeight() + ((ViewGroup.MarginLayoutParams) j2Var2).topMargin + ((ViewGroup.MarginLayoutParams) j2Var2).bottomMargin;
                }
                if (!zB || zB2) {
                    AppCompatTextView appCompatTextView = !zB ? this.f13801b : this.f13802c;
                    AppCompatTextView appCompatTextView2 = !zB2 ? this.f13802c : this.f13801b;
                    j2 j2Var3 = (j2) appCompatTextView.getLayoutParams();
                    j2 j2Var4 = (j2) appCompatTextView2.getLayoutParams();
                    boolean z14 = (zB && this.f13801b.getMeasuredWidth() > 0) || (zB2 && this.f13802c.getMeasuredWidth() > 0);
                    int i29 = iMin;
                    i15 = this.f13820w & 112;
                    i16 = width;
                    int i31 = this.f13815r;
                    if (i15 != 48) {
                        int i32 = this.f13816s;
                        if (i15 != 80) {
                            int iMax3 = (((height - paddingTop2) - paddingBottom) - measuredHeight) / 2;
                            int i33 = ((ViewGroup.MarginLayoutParams) j2Var3).topMargin + i31;
                            if (iMax3 < i33) {
                                iMax3 = i33;
                            } else {
                                int i34 = (((height - paddingBottom) - measuredHeight) - iMax3) - paddingTop2;
                                if (i34 < ((ViewGroup.MarginLayoutParams) j2Var3).bottomMargin + i32) {
                                    iMax3 = Math.max(0, iMax3 - ((((ViewGroup.MarginLayoutParams) j2Var4).bottomMargin + i32) - i34));
                                }
                            }
                            paddingTop = paddingTop2 + iMax3;
                        } else {
                            paddingTop = (((height - paddingBottom) - ((ViewGroup.MarginLayoutParams) j2Var4).bottomMargin) - i32) - measuredHeight;
                        }
                    } else {
                        paddingTop = getPaddingTop() + ((ViewGroup.MarginLayoutParams) j2Var3).topMargin + i31;
                    }
                    int i35 = this.f13813p;
                    int i36 = this.f13814q;
                    if (z12) {
                        if (!z14) {
                            i35 = 0;
                        }
                        int i37 = i35 - iArr[1];
                        int iMax4 = i29 - Math.max(0, i37);
                        iArr[1] = Math.max(0, -i37);
                        if (zB) {
                            j2 j2Var5 = (j2) this.f13801b.getLayoutParams();
                            int measuredWidth = iMax4 - this.f13801b.getMeasuredWidth();
                            int measuredHeight2 = this.f13801b.getMeasuredHeight() + paddingTop;
                            this.f13801b.layout(measuredWidth, paddingTop, iMax4, measuredHeight2);
                            i19 = measuredWidth - i36;
                            paddingTop = measuredHeight2 + ((ViewGroup.MarginLayoutParams) j2Var5).bottomMargin;
                        } else {
                            i19 = iMax4;
                        }
                        if (zB2) {
                            int i38 = paddingTop + ((ViewGroup.MarginLayoutParams) ((j2) this.f13802c.getLayoutParams())).topMargin;
                            this.f13802c.layout(iMax4 - this.f13802c.getMeasuredWidth(), i38, iMax4, this.f13802c.getMeasuredHeight() + i38);
                            i21 = iMax4 - i36;
                        } else {
                            i21 = iMax4;
                        }
                        iMin = z14 ? Math.min(i19, i21) : iMax4;
                        iMax = i14;
                    } else {
                        if (!z14) {
                            i35 = 0;
                        }
                        int i39 = i35 - iArr[0];
                        int iMax5 = Math.max(0, i39) + i14;
                        iArr[0] = Math.max(0, -i39);
                        if (zB) {
                            j2 j2Var6 = (j2) this.f13801b.getLayoutParams();
                            int measuredWidth2 = this.f13801b.getMeasuredWidth() + iMax5;
                            int measuredHeight3 = this.f13801b.getMeasuredHeight() + paddingTop;
                            this.f13801b.layout(iMax5, paddingTop, measuredWidth2, measuredHeight3);
                            i17 = measuredWidth2 + i36;
                            paddingTop = measuredHeight3 + ((ViewGroup.MarginLayoutParams) j2Var6).bottomMargin;
                        } else {
                            i17 = iMax5;
                        }
                        if (zB2) {
                            int i40 = paddingTop + ((ViewGroup.MarginLayoutParams) ((j2) this.f13802c.getLayoutParams())).topMargin;
                            int measuredWidth3 = this.f13802c.getMeasuredWidth() + iMax5;
                            this.f13802c.layout(iMax5, i40, measuredWidth3, this.f13802c.getMeasuredHeight() + i40);
                            i18 = measuredWidth3 + i36;
                        } else {
                            i18 = iMax5;
                        }
                        if (z14) {
                            iMax = Math.max(i17, i18);
                            iMin = i29;
                        } else {
                            iMin = i29;
                            iMax = iMax5;
                        }
                    }
                } else {
                    iMax = i14;
                    i16 = width;
                }
                ArrayList arrayList = this.D;
                a(arrayList, 3);
                size = arrayList.size();
                iR2 = iMax;
                for (i22 = 0; i22 < size; i22++) {
                    iR2 = r((View) arrayList.get(i22), iR2, iMin2, iArr);
                }
                a(arrayList, 5);
                size2 = arrayList.size();
                int iS2 = iMin;
                for (i23 = 0; i23 < size2; i23++) {
                    iS2 = s((View) arrayList.get(i23), iS2, iMin2, iArr);
                }
                a(arrayList, 1);
                int i41 = iArr[0];
                int i42 = iArr[1];
                size3 = arrayList.size();
                int i43 = i42;
                int i44 = i41;
                i24 = 0;
                int measuredWidth4 = 0;
                while (i24 < size3) {
                    View view = (View) arrayList.get(i24);
                    j2 j2Var7 = (j2) view.getLayoutParams();
                    int i45 = ((ViewGroup.MarginLayoutParams) j2Var7).leftMargin - i44;
                    int i46 = ((ViewGroup.MarginLayoutParams) j2Var7).rightMargin - i43;
                    int iMax6 = Math.max(0, i45);
                    int iMax7 = Math.max(0, i46);
                    int iMax8 = Math.max(0, -i45);
                    int iMax9 = Math.max(0, -i46);
                    measuredWidth4 += view.getMeasuredWidth() + iMax6 + iMax7;
                    i24++;
                    i43 = iMax9;
                    i44 = iMax8;
                }
                i25 = ((((i16 - paddingLeft) - paddingRight) / 2) + paddingLeft) - (measuredWidth4 / 2);
                int i47 = measuredWidth4 + i25;
                if (i25 >= iR2) {
                    iR2 = i47 > iS2 ? i25 - (i47 - iS2) : i25;
                }
                size4 = arrayList.size();
                for (i26 = 0; i26 < size4; i26++) {
                    iR2 = r((View) arrayList.get(i26), iR2, iMin2, iArr);
                }
                arrayList.clear();
            }
            iR = r(this.f13803d, paddingLeft, iMin2, iArr);
        }
        iS = i27;
        if (B(this.f13807h)) {
        }
        if (B(this.f13800a)) {
        }
        if (getLayoutDirection() != 1) {
        }
        if (getLayoutDirection() != 1) {
        }
        z12 = z13;
        iArr[0] = Math.max(0, i28 - iR);
        iArr[1] = Math.max(0, iJ - (i27 - iS));
        int iMax22 = Math.max(iR, i28);
        iMin = Math.min(iS, i27 - iJ);
        if (B(this.f13808i)) {
        }
        if (B(this.f13804e)) {
        }
        zB = B(this.f13801b);
        zB2 = B(this.f13802c);
        if (zB) {
        }
        if (zB2) {
        }
        if (zB) {
            if (!zB) {
            }
            if (!zB2) {
            }
            j2 j2Var32 = (j2) appCompatTextView.getLayoutParams();
            j2 j2Var42 = (j2) appCompatTextView2.getLayoutParams();
            if (zB) {
                int i292 = iMin;
                i15 = this.f13820w & 112;
                i16 = width;
                int i312 = this.f13815r;
                if (i15 != 48) {
                }
                int i352 = this.f13813p;
                int i362 = this.f13814q;
                if (z12) {
                }
            } else {
                int i2922 = iMin;
                i15 = this.f13820w & 112;
                i16 = width;
                int i3122 = this.f13815r;
                if (i15 != 48) {
                }
                int i3522 = this.f13813p;
                int i3622 = this.f13814q;
                if (z12) {
                }
            }
        }
        ArrayList arrayList2 = this.D;
        a(arrayList2, 3);
        size = arrayList2.size();
        iR2 = iMax;
        while (i22 < size) {
        }
        a(arrayList2, 5);
        size2 = arrayList2.size();
        int iS22 = iMin;
        while (i23 < size2) {
        }
        a(arrayList2, 1);
        int i412 = iArr[0];
        int i422 = iArr[1];
        size3 = arrayList2.size();
        int i432 = i422;
        int i442 = i412;
        i24 = 0;
        int measuredWidth42 = 0;
        while (i24 < size3) {
        }
        i25 = ((((i16 - paddingLeft) - paddingRight) / 2) + paddingLeft) - (measuredWidth42 / 2);
        int i472 = measuredWidth42 + i25;
        if (i25 >= iR2) {
        }
        size4 = arrayList2.size();
        while (i26 < size4) {
        }
        arrayList2.clear();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        char c11;
        Object[] objArr;
        int iL;
        int iMax;
        int iCombineMeasuredStates;
        int iL2;
        int iCombineMeasuredStates2;
        int iN;
        boolean z11 = p2.f84838a;
        int iMax2 = 0;
        if (getLayoutDirection() == 1) {
            objArr = true;
            c11 = 0;
        } else {
            c11 = 1;
            objArr = false;
        }
        if (B(this.f13803d)) {
            u(this.f13803d, i5, 0, i11, this.o);
            iL = l(this.f13803d) + this.f13803d.getMeasuredWidth();
            iMax = Math.max(0, n(this.f13803d) + this.f13803d.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(0, this.f13803d.getMeasuredState());
        } else {
            iL = 0;
            iMax = 0;
            iCombineMeasuredStates = 0;
        }
        if (B(this.f13807h)) {
            u(this.f13807h, i5, 0, i11, this.o);
            iL = l(this.f13807h) + this.f13807h.getMeasuredWidth();
            iMax = Math.max(iMax, n(this.f13807h) + this.f13807h.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, this.f13807h.getMeasuredState());
        }
        int iJ = j();
        int iMax3 = Math.max(iJ, iL);
        int iMax4 = Math.max(0, iJ - iL);
        Object[] objArr2 = objArr;
        int[] iArr = this.F;
        iArr[objArr2 == true ? 1 : 0] = iMax4;
        if (B(this.f13800a)) {
            u(this.f13800a, i5, iMax3, i11, this.o);
            iL2 = l(this.f13800a) + this.f13800a.getMeasuredWidth();
            iMax = Math.max(iMax, n(this.f13800a) + this.f13800a.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, this.f13800a.getMeasuredState());
        } else {
            iL2 = 0;
        }
        int i12 = i();
        int iMax5 = iMax3 + Math.max(i12, iL2);
        iArr[c11] = Math.max(0, i12 - iL2);
        if (B(this.f13808i)) {
            iMax5 += t(this.f13808i, i5, iMax5, i11, 0, iArr);
            iMax = Math.max(iMax, n(this.f13808i) + this.f13808i.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, this.f13808i.getMeasuredState());
        }
        if (B(this.f13804e)) {
            iMax5 += t(this.f13804e, i5, iMax5, i11, 0, iArr);
            iMax = Math.max(iMax, n(this.f13804e) + this.f13804e.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, this.f13804e.getMeasuredState());
        }
        int childCount = getChildCount();
        for (int i13 = 0; i13 < childCount; i13++) {
            View childAt = getChildAt(i13);
            if (((j2) childAt.getLayoutParams()).f84762b == 0 && B(childAt)) {
                iMax5 += t(childAt, i5, iMax5, i11, 0, iArr);
                int iMax6 = Math.max(iMax, n(childAt) + childAt.getMeasuredHeight());
                iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, childAt.getMeasuredState());
                iMax = iMax6;
            } else {
                iMax5 = iMax5;
            }
        }
        int i14 = iMax5;
        int i15 = this.f13815r + this.f13816s;
        int i16 = this.f13813p + this.f13814q;
        if (B(this.f13801b)) {
            t(this.f13801b, i5, i14 + i16, i11, i15, iArr);
            iMax2 = l(this.f13801b) + this.f13801b.getMeasuredWidth();
            int measuredHeight = this.f13801b.getMeasuredHeight() + n(this.f13801b);
            iCombineMeasuredStates2 = View.combineMeasuredStates(iCombineMeasuredStates, this.f13801b.getMeasuredState());
            iN = measuredHeight;
        } else {
            iCombineMeasuredStates2 = iCombineMeasuredStates;
            iN = 0;
        }
        if (B(this.f13802c)) {
            iMax2 = Math.max(iMax2, t(this.f13802c, i5, i14 + i16, i11, i15 + iN, iArr));
            iN += n(this.f13802c) + this.f13802c.getMeasuredHeight();
            iCombineMeasuredStates2 = View.combineMeasuredStates(iCombineMeasuredStates2, this.f13802c.getMeasuredState());
        }
        setMeasuredDimension(View.resolveSizeAndState(Math.max(getPaddingRight() + getPaddingLeft() + i14 + iMax2, getSuggestedMinimumWidth()), i5, (-16777216) & iCombineMeasuredStates2), View.resolveSizeAndState(Math.max(getPaddingBottom() + getPaddingTop() + Math.max(iMax, iN), getSuggestedMinimumHeight()), i11, iCombineMeasuredStates2 << 16));
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        MenuItem menuItemFindItem;
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.f14272a);
        ActionMenuView actionMenuView = this.f13800a;
        k kVar = actionMenuView != null ? actionMenuView.f13742p : null;
        int i5 = savedState.f13824c;
        if (i5 != 0 && this.M != null && kVar != null && (menuItemFindItem = kVar.findItem(i5)) != null) {
            menuItemFindItem.expandActionView();
        }
        if (savedState.f13825d) {
            g0 g0Var = this.S;
            removeCallbacks(g0Var);
            post(g0Var);
        }
    }

    @Override // android.view.View
    public final void onRtlPropertiesChanged(int i5) {
        super.onRtlPropertiesChanged(i5);
        c();
        b2 b2Var = this.f13817t;
        boolean z11 = i5 == 1;
        if (z11 == b2Var.f84677g) {
            return;
        }
        b2Var.f84677g = z11;
        if (!b2Var.f84678h) {
            b2Var.f84671a = b2Var.f84675e;
            b2Var.f84672b = b2Var.f84676f;
            return;
        }
        if (z11) {
            int i11 = b2Var.f84674d;
            if (i11 == Integer.MIN_VALUE) {
                i11 = b2Var.f84675e;
            }
            b2Var.f84671a = i11;
            int i12 = b2Var.f84673c;
            if (i12 == Integer.MIN_VALUE) {
                i12 = b2Var.f84676f;
            }
            b2Var.f84672b = i12;
            return;
        }
        int i13 = b2Var.f84673c;
        if (i13 == Integer.MIN_VALUE) {
            i13 = b2Var.f84675e;
        }
        b2Var.f84671a = i13;
        int i14 = b2Var.f84674d;
        if (i14 == Integer.MIN_VALUE) {
            i14 = b2Var.f84676f;
        }
        b2Var.f84672b = i14;
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        m mVar;
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        i2 i2Var = this.M;
        if (i2Var != null && (mVar = i2Var.f84756b) != null) {
            savedState.f13824c = mVar.f83257a;
        }
        savedState.f13825d = q();
        return savedState;
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.B = false;
        }
        if (!this.B) {
            boolean zOnTouchEvent = super.onTouchEvent(motionEvent);
            if (actionMasked == 0 && !zOnTouchEvent) {
                this.B = true;
            }
        }
        if (actionMasked != 1 && actionMasked != 3) {
            return true;
        }
        this.B = false;
        return true;
    }

    public final boolean p(View view) {
        return view.getParent() == this || this.E.contains(view);
    }

    public final boolean q() {
        i iVar;
        ActionMenuView actionMenuView = this.f13800a;
        return (actionMenuView == null || (iVar = actionMenuView.f13746t) == null || !iVar.k()) ? false : true;
    }

    public final int r(View view, int i5, int i11, int[] iArr) {
        j2 j2Var = (j2) view.getLayoutParams();
        int i12 = ((ViewGroup.MarginLayoutParams) j2Var).leftMargin - iArr[0];
        int iMax = Math.max(0, i12) + i5;
        iArr[0] = Math.max(0, -i12);
        int iH = h(i11, view);
        int measuredWidth = view.getMeasuredWidth();
        view.layout(iMax, iH, iMax + measuredWidth, view.getMeasuredHeight() + iH);
        return measuredWidth + ((ViewGroup.MarginLayoutParams) j2Var).rightMargin + iMax;
    }

    @Override // a5.p
    public final void removeMenuProvider(u uVar) {
        this.G.b(uVar);
    }

    public final int s(View view, int i5, int i11, int[] iArr) {
        j2 j2Var = (j2) view.getLayoutParams();
        int i12 = ((ViewGroup.MarginLayoutParams) j2Var).rightMargin - iArr[1];
        int iMax = i5 - Math.max(0, i12);
        iArr[1] = Math.max(0, -i12);
        int iH = h(i11, view);
        int measuredWidth = view.getMeasuredWidth();
        view.layout(iMax - measuredWidth, iH, iMax, view.getMeasuredHeight() + iH);
        return iMax - (measuredWidth + ((ViewGroup.MarginLayoutParams) j2Var).leftMargin);
    }

    public final int t(View view, int i5, int i11, int i12, int i13, int[] iArr) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        int i14 = marginLayoutParams.leftMargin - iArr[0];
        int i15 = marginLayoutParams.rightMargin - iArr[1];
        int iMax = Math.max(0, i15) + Math.max(0, i14);
        iArr[0] = Math.max(0, -i14);
        iArr[1] = Math.max(0, -i15);
        view.measure(ViewGroup.getChildMeasureSpec(i5, getPaddingRight() + getPaddingLeft() + iMax + i11, marginLayoutParams.width), ViewGroup.getChildMeasureSpec(i12, getPaddingBottom() + getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin + i13, marginLayoutParams.height));
        return view.getMeasuredWidth() + iMax;
    }

    public final void u(View view, int i5, int i11, int i12, int i13) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        int childMeasureSpec = ViewGroup.getChildMeasureSpec(i5, getPaddingRight() + getPaddingLeft() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i11, marginLayoutParams.width);
        int childMeasureSpec2 = ViewGroup.getChildMeasureSpec(i12, getPaddingBottom() + getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin, marginLayoutParams.height);
        int mode = View.MeasureSpec.getMode(childMeasureSpec2);
        if (mode != 1073741824 && i13 >= 0) {
            if (mode != 0) {
                i13 = Math.min(View.MeasureSpec.getSize(childMeasureSpec2), i13);
            }
            childMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(i13, 1073741824);
        }
        view.measure(childMeasureSpec, childMeasureSpec2);
    }

    public final void v(Drawable drawable) {
        if (drawable != null) {
            if (this.f13804e == null) {
                this.f13804e = new AppCompatImageView(getContext(), null);
            }
            if (!p(this.f13804e)) {
                b(this.f13804e, true);
            }
        } else {
            AppCompatImageView appCompatImageView = this.f13804e;
            if (appCompatImageView != null && p(appCompatImageView)) {
                removeView(this.f13804e);
                this.E.remove(this.f13804e);
            }
        }
        AppCompatImageView appCompatImageView2 = this.f13804e;
        if (appCompatImageView2 != null) {
            appCompatImageView2.setImageDrawable(drawable);
        }
    }

    public final void w(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            e();
        }
        s sVar = this.f13803d;
        if (sVar != null) {
            sVar.setContentDescription(charSequence);
            m2.a(this.f13803d, charSequence);
        }
    }

    public void x(Drawable drawable) {
        if (drawable != null) {
            e();
            if (!p(this.f13803d)) {
                b(this.f13803d, true);
            }
        } else {
            s sVar = this.f13803d;
            if (sVar != null && p(sVar)) {
                removeView(this.f13803d);
                this.E.remove(this.f13803d);
            }
        }
        s sVar2 = this.f13803d;
        if (sVar2 != null) {
            sVar2.setImageDrawable(drawable);
        }
    }

    public final void y(View.OnClickListener onClickListener) {
        e();
        this.f13803d.setOnClickListener(onClickListener);
    }

    public final void z(CharSequence charSequence) {
        if (TextUtils.isEmpty(charSequence)) {
            AppCompatTextView appCompatTextView = this.f13802c;
            if (appCompatTextView != null && p(appCompatTextView)) {
                removeView(this.f13802c);
                this.E.remove(this.f13802c);
            }
        } else {
            if (this.f13802c == null) {
                Context context = getContext();
                AppCompatTextView appCompatTextView2 = new AppCompatTextView(context, null);
                this.f13802c = appCompatTextView2;
                appCompatTextView2.setSingleLine();
                this.f13802c.setEllipsize(TextUtils.TruncateAt.END);
                int i5 = this.f13812m;
                if (i5 != 0) {
                    this.f13802c.setTextAppearance(context, i5);
                }
                ColorStateList colorStateList = this.A;
                if (colorStateList != null) {
                    this.f13802c.setTextColor(colorStateList);
                }
            }
            if (!p(this.f13802c)) {
                b(this.f13802c, true);
            }
        }
        AppCompatTextView appCompatTextView3 = this.f13802c;
        if (appCompatTextView3 != null) {
            appCompatTextView3.setText(charSequence);
        }
        this.f13822y = charSequence;
    }

    public Toolbar(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 2130970240);
        this.f13820w = 8388627;
        this.D = new ArrayList();
        this.E = new ArrayList();
        this.F = new int[2];
        this.G = new t(new f2(this, 1));
        this.H = new ArrayList();
        this.J = new g2(this);
        this.S = new g0(this, 10);
        Context context2 = getContext();
        int[] iArr = l.a.f72909x;
        x7.u uVarR = x7.u.r(context2, attributeSet, iArr, 2130970240);
        a1.j(this, context, iArr, attributeSet, (TypedArray) uVarR.f95209b, 2130970240);
        TypedArray typedArray = (TypedArray) uVarR.f95209b;
        this.f13811l = typedArray.getResourceId(28, 0);
        this.f13812m = typedArray.getResourceId(19, 0);
        this.f13820w = typedArray.getInteger(0, 8388627);
        this.n = typedArray.getInteger(2, 48);
        int dimensionPixelOffset = typedArray.getDimensionPixelOffset(22, 0);
        dimensionPixelOffset = typedArray.hasValue(27) ? typedArray.getDimensionPixelOffset(27, dimensionPixelOffset) : dimensionPixelOffset;
        this.f13816s = dimensionPixelOffset;
        this.f13815r = dimensionPixelOffset;
        this.f13814q = dimensionPixelOffset;
        this.f13813p = dimensionPixelOffset;
        int dimensionPixelOffset2 = typedArray.getDimensionPixelOffset(25, -1);
        if (dimensionPixelOffset2 >= 0) {
            this.f13813p = dimensionPixelOffset2;
        }
        int dimensionPixelOffset3 = typedArray.getDimensionPixelOffset(24, -1);
        if (dimensionPixelOffset3 >= 0) {
            this.f13814q = dimensionPixelOffset3;
        }
        int dimensionPixelOffset4 = typedArray.getDimensionPixelOffset(26, -1);
        if (dimensionPixelOffset4 >= 0) {
            this.f13815r = dimensionPixelOffset4;
        }
        int dimensionPixelOffset5 = typedArray.getDimensionPixelOffset(23, -1);
        if (dimensionPixelOffset5 >= 0) {
            this.f13816s = dimensionPixelOffset5;
        }
        this.o = typedArray.getDimensionPixelSize(13, -1);
        int dimensionPixelOffset6 = typedArray.getDimensionPixelOffset(9, Integer.MIN_VALUE);
        int dimensionPixelOffset7 = typedArray.getDimensionPixelOffset(5, Integer.MIN_VALUE);
        int dimensionPixelSize = typedArray.getDimensionPixelSize(7, 0);
        int dimensionPixelSize2 = typedArray.getDimensionPixelSize(8, 0);
        c();
        b2 b2Var = this.f13817t;
        b2Var.f84678h = false;
        if (dimensionPixelSize != Integer.MIN_VALUE) {
            b2Var.f84675e = dimensionPixelSize;
            b2Var.f84671a = dimensionPixelSize;
        }
        if (dimensionPixelSize2 != Integer.MIN_VALUE) {
            b2Var.f84676f = dimensionPixelSize2;
            b2Var.f84672b = dimensionPixelSize2;
        }
        if (dimensionPixelOffset6 != Integer.MIN_VALUE || dimensionPixelOffset7 != Integer.MIN_VALUE) {
            b2Var.a(dimensionPixelOffset6, dimensionPixelOffset7);
        }
        this.f13818u = typedArray.getDimensionPixelOffset(10, Integer.MIN_VALUE);
        this.f13819v = typedArray.getDimensionPixelOffset(6, Integer.MIN_VALUE);
        this.f13805f = uVarR.l(4);
        this.f13806g = typedArray.getText(3);
        CharSequence text = typedArray.getText(21);
        if (!TextUtils.isEmpty(text)) {
            A(text);
        }
        CharSequence text2 = typedArray.getText(18);
        if (!TextUtils.isEmpty(text2)) {
            z(text2);
        }
        this.f13809j = getContext();
        int resourceId = typedArray.getResourceId(17, 0);
        if (this.f13810k != resourceId) {
            this.f13810k = resourceId;
            if (resourceId == 0) {
                this.f13809j = getContext();
            } else {
                this.f13809j = new ContextThemeWrapper(getContext(), resourceId);
            }
        }
        Drawable drawableL = uVarR.l(16);
        if (drawableL != null) {
            x(drawableL);
        }
        CharSequence text3 = typedArray.getText(15);
        if (!TextUtils.isEmpty(text3)) {
            w(text3);
        }
        Drawable drawableL2 = uVarR.l(11);
        if (drawableL2 != null) {
            v(drawableL2);
        }
        CharSequence text4 = typedArray.getText(12);
        if (!TextUtils.isEmpty(text4)) {
            if (!TextUtils.isEmpty(text4) && this.f13804e == null) {
                this.f13804e = new AppCompatImageView(getContext(), null);
            }
            AppCompatImageView appCompatImageView = this.f13804e;
            if (appCompatImageView != null) {
                appCompatImageView.setContentDescription(text4);
            }
        }
        if (typedArray.hasValue(29)) {
            ColorStateList colorStateListK = uVarR.k(29);
            this.f13823z = colorStateListK;
            AppCompatTextView appCompatTextView = this.f13801b;
            if (appCompatTextView != null) {
                appCompatTextView.setTextColor(colorStateListK);
            }
        }
        if (typedArray.hasValue(20)) {
            ColorStateList colorStateListK2 = uVarR.k(20);
            this.A = colorStateListK2;
            AppCompatTextView appCompatTextView2 = this.f13802c;
            if (appCompatTextView2 != null) {
                appCompatTextView2.setTextColor(colorStateListK2);
            }
        }
        if (typedArray.hasValue(14)) {
            o(typedArray.getResourceId(14, 0));
        }
        uVarR.s();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        Context context = getContext();
        j2 j2Var = new j2(context, attributeSet);
        j2Var.f75187a = 0;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, l.a.f72889b);
        j2Var.f75187a = typedArrayObtainStyledAttributes.getInt(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        j2Var.f84762b = 0;
        return j2Var;
    }
}
