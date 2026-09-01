package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.window.OnBackInvokedCallback;
import android.window.OnBackInvokedDispatcher;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;
import defpackage.bod;
import defpackage.bwe;
import defpackage.ep7;
import defpackage.esa;
import defpackage.guc;
import defpackage.h6;
import defpackage.jn;
import defpackage.lx7;
import defpackage.ly7;
import defpackage.mw2;
import defpackage.n20;
import defpackage.nec;
import defpackage.px7;
import defpackage.qlb;
import defpackage.r2d;
import defpackage.r30;
import defpackage.smb;
import defpackage.snd;
import defpackage.sx7;
import defpackage.tnd;
import defpackage.u5;
import defpackage.und;
import defpackage.ute;
import defpackage.v15;
import defpackage.vnd;
import defpackage.vwa;
import defpackage.wnd;
import defpackage.xnd;
import defpackage.znd;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class Toolbar extends ViewGroup {
    public ColorStateList A;
    public boolean B;
    public boolean C;
    public final ArrayList D;
    public final ArrayList E;
    public final int[] F;
    public final px7 G;
    public ArrayList H;
    public final qlb I;
    public bod J;
    public h6 K;
    public und L;
    public boolean M;
    public OnBackInvokedCallback N;
    public OnBackInvokedDispatcher O;
    public boolean P;
    public final jn Q;
    public ActionMenuView a;
    public r30 b;
    public r30 c;
    public n20 d;
    public AppCompatImageView e;
    public final Drawable f;
    public final CharSequence g;
    public n20 h;
    public View i;
    public Context j;
    public int k;
    public int l;
    public int m;
    public final int n;
    public final int o;
    public int p;
    public int q;
    public int r;
    public int s;
    public smb t;
    public int u;
    public int v;
    public final int w;
    public CharSequence x;
    public CharSequence y;
    public ColorStateList z;

    public Toolbar(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, R.attr.toolbarStyle);
        this.w = 8388627;
        this.D = new ArrayList();
        this.E = new ArrayList();
        this.F = new int[2];
        this.G = new px7(new snd(this, 1));
        this.H = new ArrayList();
        this.I = new qlb(this);
        this.Q = new jn(16, this);
        Context context2 = getContext();
        int[] iArr = esa.w;
        vwa vwaVarX = vwa.x(context2, attributeSet, iArr, R.attr.toolbarStyle);
        ute.n(this, context, iArr, attributeSet, (TypedArray) vwaVarX.c, R.attr.toolbarStyle);
        TypedArray typedArray = (TypedArray) vwaVarX.c;
        this.l = typedArray.getResourceId(28, 0);
        this.m = typedArray.getResourceId(19, 0);
        this.w = typedArray.getInteger(0, 8388627);
        this.n = typedArray.getInteger(2, 48);
        int dimensionPixelOffset = typedArray.getDimensionPixelOffset(22, 0);
        dimensionPixelOffset = typedArray.hasValue(27) ? typedArray.getDimensionPixelOffset(27, dimensionPixelOffset) : dimensionPixelOffset;
        this.s = dimensionPixelOffset;
        this.r = dimensionPixelOffset;
        this.q = dimensionPixelOffset;
        this.p = dimensionPixelOffset;
        int dimensionPixelOffset2 = typedArray.getDimensionPixelOffset(25, -1);
        if (dimensionPixelOffset2 >= 0) {
            this.p = dimensionPixelOffset2;
        }
        int dimensionPixelOffset3 = typedArray.getDimensionPixelOffset(24, -1);
        if (dimensionPixelOffset3 >= 0) {
            this.q = dimensionPixelOffset3;
        }
        int dimensionPixelOffset4 = typedArray.getDimensionPixelOffset(26, -1);
        if (dimensionPixelOffset4 >= 0) {
            this.r = dimensionPixelOffset4;
        }
        int dimensionPixelOffset5 = typedArray.getDimensionPixelOffset(23, -1);
        if (dimensionPixelOffset5 >= 0) {
            this.s = dimensionPixelOffset5;
        }
        this.o = typedArray.getDimensionPixelSize(13, -1);
        int dimensionPixelOffset6 = typedArray.getDimensionPixelOffset(9, Integer.MIN_VALUE);
        int dimensionPixelOffset7 = typedArray.getDimensionPixelOffset(5, Integer.MIN_VALUE);
        int dimensionPixelSize = typedArray.getDimensionPixelSize(7, 0);
        int dimensionPixelSize2 = typedArray.getDimensionPixelSize(8, 0);
        d();
        smb smbVar = this.t;
        smbVar.h = false;
        if (dimensionPixelSize != Integer.MIN_VALUE) {
            smbVar.e = dimensionPixelSize;
            smbVar.a = dimensionPixelSize;
        }
        if (dimensionPixelSize2 != Integer.MIN_VALUE) {
            smbVar.f = dimensionPixelSize2;
            smbVar.b = dimensionPixelSize2;
        }
        if (dimensionPixelOffset6 != Integer.MIN_VALUE || dimensionPixelOffset7 != Integer.MIN_VALUE) {
            smbVar.a(dimensionPixelOffset6, dimensionPixelOffset7);
        }
        this.u = typedArray.getDimensionPixelOffset(10, Integer.MIN_VALUE);
        this.v = typedArray.getDimensionPixelOffset(6, Integer.MIN_VALUE);
        this.f = vwaVarX.q(4);
        this.g = typedArray.getText(3);
        CharSequence text = typedArray.getText(21);
        if (!TextUtils.isEmpty(text)) {
            setTitle(text);
        }
        CharSequence text2 = typedArray.getText(18);
        if (!TextUtils.isEmpty(text2)) {
            setSubtitle(text2);
        }
        this.j = getContext();
        setPopupTheme(typedArray.getResourceId(17, 0));
        Drawable drawableQ = vwaVarX.q(16);
        if (drawableQ != null) {
            setNavigationIcon(drawableQ);
        }
        CharSequence text3 = typedArray.getText(15);
        if (!TextUtils.isEmpty(text3)) {
            setNavigationContentDescription(text3);
        }
        Drawable drawableQ2 = vwaVarX.q(11);
        if (drawableQ2 != null) {
            setLogo(drawableQ2);
        }
        CharSequence text4 = typedArray.getText(12);
        if (!TextUtils.isEmpty(text4)) {
            setLogoDescription(text4);
        }
        if (typedArray.hasValue(29)) {
            setTitleTextColor(vwaVarX.o(29));
        }
        if (typedArray.hasValue(20)) {
            setSubtitleTextColor(vwaVarX.o(20));
        }
        if (typedArray.hasValue(14)) {
            getMenuInflater().inflate(typedArray.getResourceId(14, 0), getMenu());
        }
        vwaVarX.C();
    }

    private ArrayList<MenuItem> getCurrentMenuItems() {
        ArrayList<MenuItem> arrayList = new ArrayList<>();
        Menu menu = getMenu();
        for (int i = 0; i < menu.size(); i++) {
            arrayList.add(menu.getItem(i));
        }
        return arrayList;
    }

    private MenuInflater getMenuInflater() {
        return new r2d(getContext());
    }

    public static vnd h() {
        vnd vndVar = new vnd(-2, -2);
        vndVar.b = 0;
        vndVar.a = 8388627;
        return vndVar;
    }

    public static vnd i(ViewGroup.LayoutParams layoutParams) {
        boolean z = layoutParams instanceof vnd;
        if (z) {
            vnd vndVar = (vnd) layoutParams;
            vnd vndVar2 = new vnd(vndVar);
            vndVar2.b = 0;
            vndVar2.b = vndVar.b;
            return vndVar2;
        }
        if (z) {
            vnd vndVar3 = new vnd((vnd) layoutParams);
            vndVar3.b = 0;
            return vndVar3;
        }
        if (!(layoutParams instanceof ViewGroup.MarginLayoutParams)) {
            vnd vndVar4 = new vnd(layoutParams);
            vndVar4.b = 0;
            return vndVar4;
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
        vnd vndVar5 = new vnd(marginLayoutParams);
        vndVar5.b = 0;
        ((ViewGroup.MarginLayoutParams) vndVar5).leftMargin = marginLayoutParams.leftMargin;
        ((ViewGroup.MarginLayoutParams) vndVar5).topMargin = marginLayoutParams.topMargin;
        ((ViewGroup.MarginLayoutParams) vndVar5).rightMargin = marginLayoutParams.rightMargin;
        ((ViewGroup.MarginLayoutParams) vndVar5).bottomMargin = marginLayoutParams.bottomMargin;
        return vndVar5;
    }

    public static int k(View view) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        return marginLayoutParams.getMarginEnd() + marginLayoutParams.getMarginStart();
    }

    public static int l(View view) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        return marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
    }

    public final void a(int i, ArrayList arrayList) {
        boolean z = getLayoutDirection() == 1;
        int childCount = getChildCount();
        int absoluteGravity = Gravity.getAbsoluteGravity(i, getLayoutDirection());
        arrayList.clear();
        if (!z) {
            for (int i2 = 0; i2 < childCount; i2++) {
                View childAt = getChildAt(i2);
                vnd vndVar = (vnd) childAt.getLayoutParams();
                if (vndVar.b == 0 && s(childAt)) {
                    int i3 = vndVar.a;
                    int layoutDirection = getLayoutDirection();
                    int absoluteGravity2 = Gravity.getAbsoluteGravity(i3, layoutDirection) & 7;
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
        for (int i4 = childCount - 1; i4 >= 0; i4--) {
            View childAt2 = getChildAt(i4);
            vnd vndVar2 = (vnd) childAt2.getLayoutParams();
            if (vndVar2.b == 0 && s(childAt2)) {
                int i5 = vndVar2.a;
                int layoutDirection2 = getLayoutDirection();
                int absoluteGravity3 = Gravity.getAbsoluteGravity(i5, layoutDirection2) & 7;
                if (absoluteGravity3 != 1 && absoluteGravity3 != 3 && absoluteGravity3 != 5) {
                    absoluteGravity3 = layoutDirection2 == 1 ? 5 : 3;
                }
                if (absoluteGravity3 == absoluteGravity) {
                    arrayList.add(childAt2);
                }
            }
        }
    }

    public final void b(View view, boolean z) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        vnd vndVarH = layoutParams == null ? h() : !checkLayoutParams(layoutParams) ? i(layoutParams) : (vnd) layoutParams;
        vndVarH.b = 1;
        if (!z || this.i == null) {
            addView(view, vndVarH);
        } else {
            view.setLayoutParams(vndVarH);
            this.E.add(view);
        }
    }

    public final void c() {
        if (this.h == null) {
            n20 n20Var = new n20(getContext(), null, R.attr.toolbarNavigationButtonStyle);
            this.h = n20Var;
            n20Var.setImageDrawable(this.f);
            this.h.setContentDescription(this.g);
            vnd vndVarH = h();
            vndVarH.a = (this.n & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8388611;
            vndVarH.b = 2;
            this.h.setLayoutParams(vndVarH);
            this.h.setOnClickListener(new u5(3, this));
        }
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return super.checkLayoutParams(layoutParams) && (layoutParams instanceof vnd);
    }

    public final void d() {
        if (this.t == null) {
            smb smbVar = new smb();
            smbVar.a = 0;
            smbVar.b = 0;
            smbVar.c = Integer.MIN_VALUE;
            smbVar.d = Integer.MIN_VALUE;
            smbVar.e = 0;
            smbVar.f = 0;
            smbVar.g = false;
            smbVar.h = false;
            this.t = smbVar;
        }
    }

    public final void e() {
        f();
        ActionMenuView actionMenuView = this.a;
        if (actionMenuView.p == null) {
            lx7 lx7Var = (lx7) actionMenuView.getMenu();
            if (this.L == null) {
                this.L = new und(this);
            }
            this.a.setExpandedActionViewsExclusive(true);
            lx7Var.b(this.L, this.j);
            t();
        }
    }

    public final void f() {
        if (this.a == null) {
            ActionMenuView actionMenuView = new ActionMenuView(getContext());
            this.a = actionMenuView;
            actionMenuView.setPopupTheme(this.k);
            this.a.setOnMenuItemClickListener(this.I);
            ActionMenuView actionMenuView2 = this.a;
            nec necVar = new nec(3, this);
            actionMenuView2.getClass();
            actionMenuView2.u = necVar;
            vnd vndVarH = h();
            vndVarH.a = (this.n & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8388613;
            this.a.setLayoutParams(vndVarH);
            b(this.a, false);
        }
    }

    public final void g() {
        if (this.d == null) {
            this.d = new n20(getContext(), null, R.attr.toolbarNavigationButtonStyle);
            vnd vndVarH = h();
            vndVarH.a = (this.n & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 8388611;
            this.d.setLayoutParams(vndVarH);
        }
    }

    @Override // android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return h();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        Context context = getContext();
        vnd vndVar = new vnd(context, attributeSet);
        vndVar.a = 0;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, esa.b);
        vndVar.a = typedArrayObtainStyledAttributes.getInt(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        vndVar.b = 0;
        return vndVar;
    }

    public CharSequence getCollapseContentDescription() {
        n20 n20Var = this.h;
        if (n20Var != null) {
            return n20Var.getContentDescription();
        }
        return null;
    }

    public Drawable getCollapseIcon() {
        n20 n20Var = this.h;
        if (n20Var != null) {
            return n20Var.getDrawable();
        }
        return null;
    }

    public int getContentInsetEnd() {
        smb smbVar = this.t;
        if (smbVar != null) {
            return smbVar.g ? smbVar.a : smbVar.b;
        }
        return 0;
    }

    public int getContentInsetEndWithActions() {
        int i = this.v;
        return i != Integer.MIN_VALUE ? i : getContentInsetEnd();
    }

    public int getContentInsetLeft() {
        smb smbVar = this.t;
        if (smbVar != null) {
            return smbVar.a;
        }
        return 0;
    }

    public int getContentInsetRight() {
        smb smbVar = this.t;
        if (smbVar != null) {
            return smbVar.b;
        }
        return 0;
    }

    public int getContentInsetStart() {
        smb smbVar = this.t;
        if (smbVar != null) {
            return smbVar.g ? smbVar.b : smbVar.a;
        }
        return 0;
    }

    public int getContentInsetStartWithNavigation() {
        int i = this.u;
        return i != Integer.MIN_VALUE ? i : getContentInsetStart();
    }

    public int getCurrentContentInsetEnd() {
        lx7 lx7Var;
        ActionMenuView actionMenuView = this.a;
        return (actionMenuView == null || (lx7Var = actionMenuView.p) == null || !lx7Var.hasVisibleItems()) ? getContentInsetEnd() : Math.max(getContentInsetEnd(), Math.max(this.v, 0));
    }

    public int getCurrentContentInsetLeft() {
        return getLayoutDirection() == 1 ? getCurrentContentInsetEnd() : getCurrentContentInsetStart();
    }

    public int getCurrentContentInsetRight() {
        return getLayoutDirection() == 1 ? getCurrentContentInsetStart() : getCurrentContentInsetEnd();
    }

    public int getCurrentContentInsetStart() {
        return getNavigationIcon() != null ? Math.max(getContentInsetStart(), Math.max(this.u, 0)) : getContentInsetStart();
    }

    public Drawable getLogo() {
        AppCompatImageView appCompatImageView = this.e;
        if (appCompatImageView != null) {
            return appCompatImageView.getDrawable();
        }
        return null;
    }

    public CharSequence getLogoDescription() {
        AppCompatImageView appCompatImageView = this.e;
        if (appCompatImageView != null) {
            return appCompatImageView.getContentDescription();
        }
        return null;
    }

    public Menu getMenu() {
        e();
        return this.a.getMenu();
    }

    public View getNavButtonView() {
        return this.d;
    }

    public CharSequence getNavigationContentDescription() {
        n20 n20Var = this.d;
        if (n20Var != null) {
            return n20Var.getContentDescription();
        }
        return null;
    }

    public Drawable getNavigationIcon() {
        n20 n20Var = this.d;
        if (n20Var != null) {
            return n20Var.getDrawable();
        }
        return null;
    }

    public h6 getOuterActionMenuPresenter() {
        return this.K;
    }

    public Drawable getOverflowIcon() {
        e();
        return this.a.getOverflowIcon();
    }

    public Context getPopupContext() {
        return this.j;
    }

    public int getPopupTheme() {
        return this.k;
    }

    public CharSequence getSubtitle() {
        return this.y;
    }

    public final TextView getSubtitleTextView() {
        return this.c;
    }

    public CharSequence getTitle() {
        return this.x;
    }

    public int getTitleMarginBottom() {
        return this.s;
    }

    public int getTitleMarginEnd() {
        return this.q;
    }

    public int getTitleMarginStart() {
        return this.p;
    }

    public int getTitleMarginTop() {
        return this.r;
    }

    public final TextView getTitleTextView() {
        return this.b;
    }

    public mw2 getWrapper() {
        Drawable drawable;
        bod bodVar = this.J;
        if (bodVar == null) {
            bodVar = new bod();
            bodVar.n = 0;
            bodVar.a = this;
            bodVar.h = getTitle();
            bodVar.i = getSubtitle();
            bodVar.g = bodVar.h != null;
            bodVar.f = getNavigationIcon();
            vwa vwaVarX = vwa.x(getContext(), null, esa.a, R.attr.actionBarStyle);
            TypedArray typedArray = (TypedArray) vwaVarX.c;
            bodVar.o = vwaVarX.q(15);
            CharSequence text = typedArray.getText(27);
            if (!TextUtils.isEmpty(text)) {
                bodVar.g = true;
                bodVar.h = text;
                if ((bodVar.b & 8) != 0) {
                    setTitle(text);
                    if (bodVar.g) {
                        ute.p(getRootView(), text);
                    }
                }
            }
            CharSequence text2 = typedArray.getText(25);
            if (!TextUtils.isEmpty(text2)) {
                bodVar.i = text2;
                if ((bodVar.b & 8) != 0) {
                    setSubtitle(text2);
                }
            }
            Drawable drawableQ = vwaVarX.q(20);
            if (drawableQ != null) {
                bodVar.e = drawableQ;
                bodVar.c();
            }
            Drawable drawableQ2 = vwaVarX.q(17);
            if (drawableQ2 != null) {
                bodVar.d = drawableQ2;
                bodVar.c();
            }
            if (bodVar.f == null && (drawable = bodVar.o) != null) {
                bodVar.f = drawable;
                if ((bodVar.b & 4) != 0) {
                    setNavigationIcon(drawable);
                } else {
                    setNavigationIcon((Drawable) null);
                }
            }
            bodVar.a(typedArray.getInt(10, 0));
            int resourceId = typedArray.getResourceId(9, 0);
            if (resourceId != 0) {
                View viewInflate = LayoutInflater.from(getContext()).inflate(resourceId, (ViewGroup) this, false);
                View view = bodVar.c;
                if (view != null && (bodVar.b & 16) != 0) {
                    removeView(view);
                }
                bodVar.c = viewInflate;
                if (viewInflate != null && (bodVar.b & 16) != 0) {
                    addView(viewInflate);
                }
                bodVar.a(bodVar.b | 16);
            }
            int layoutDimension = typedArray.getLayoutDimension(13, 0);
            if (layoutDimension > 0) {
                ViewGroup.LayoutParams layoutParams = getLayoutParams();
                layoutParams.height = layoutDimension;
                setLayoutParams(layoutParams);
            }
            int dimensionPixelOffset = typedArray.getDimensionPixelOffset(7, -1);
            int dimensionPixelOffset2 = typedArray.getDimensionPixelOffset(3, -1);
            if (dimensionPixelOffset >= 0 || dimensionPixelOffset2 >= 0) {
                int iMax = Math.max(dimensionPixelOffset, 0);
                int iMax2 = Math.max(dimensionPixelOffset2, 0);
                d();
                this.t.a(iMax, iMax2);
            }
            int resourceId2 = typedArray.getResourceId(28, 0);
            if (resourceId2 != 0) {
                Context context = getContext();
                this.l = resourceId2;
                r30 r30Var = this.b;
                if (r30Var != null) {
                    r30Var.setTextAppearance(context, resourceId2);
                }
            }
            int resourceId3 = typedArray.getResourceId(26, 0);
            if (resourceId3 != 0) {
                Context context2 = getContext();
                this.m = resourceId3;
                r30 r30Var2 = this.c;
                if (r30Var2 != null) {
                    r30Var2.setTextAppearance(context2, resourceId3);
                }
            }
            int resourceId4 = typedArray.getResourceId(22, 0);
            if (resourceId4 != 0) {
                setPopupTheme(resourceId4);
            }
            vwaVarX.C();
            if (R.string.abc_action_bar_up_description != bodVar.n) {
                bodVar.n = R.string.abc_action_bar_up_description;
                if (TextUtils.isEmpty(getNavigationContentDescription())) {
                    int i = bodVar.n;
                    bodVar.j = i != 0 ? getContext().getString(i) : null;
                    bodVar.b();
                }
            }
            bodVar.j = getNavigationContentDescription();
            setNavigationOnClickListener(new znd(bodVar));
            this.J = bodVar;
        }
        return bodVar;
    }

    public final int j(View view, int i) {
        vnd vndVar = (vnd) view.getLayoutParams();
        int measuredHeight = view.getMeasuredHeight();
        int i2 = i > 0 ? (measuredHeight - i) / 2 : 0;
        int i3 = vndVar.a & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
        if (i3 != 16 && i3 != 48 && i3 != 80) {
            i3 = this.w & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
        }
        if (i3 == 48) {
            return getPaddingTop() - i2;
        }
        if (i3 == 80) {
            return (((getHeight() - getPaddingBottom()) - measuredHeight) - ((ViewGroup.MarginLayoutParams) vndVar).bottomMargin) - i2;
        }
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int height = getHeight();
        int iMax = (((height - paddingTop) - paddingBottom) - measuredHeight) / 2;
        int i4 = ((ViewGroup.MarginLayoutParams) vndVar).topMargin;
        if (iMax < i4) {
            iMax = i4;
        } else {
            int i5 = (((height - paddingBottom) - measuredHeight) - iMax) - paddingTop;
            int i6 = ((ViewGroup.MarginLayoutParams) vndVar).bottomMargin;
            if (i5 < i6) {
                iMax = Math.max(0, iMax - (i6 - i5));
            }
        }
        return paddingTop + iMax;
    }

    public final void m() {
        Iterator it2 = this.H.iterator();
        while (it2.hasNext()) {
            getMenu().removeItem(((MenuItem) it2.next()).getItemId());
        }
        getMenu();
        ArrayList<MenuItem> currentMenuItems = getCurrentMenuItems();
        getMenuInflater();
        Iterator it3 = this.G.b.iterator();
        while (it3.hasNext()) {
            ((v15) ((ly7) it3.next())).a.j();
        }
        ArrayList<MenuItem> currentMenuItems2 = getCurrentMenuItems();
        currentMenuItems2.removeAll(currentMenuItems);
        this.H = currentMenuItems2;
    }

    public final boolean n(View view) {
        return view.getParent() == this || this.E.contains(view);
    }

    public final int o(View view, int i, int i2, int[] iArr) {
        vnd vndVar = (vnd) view.getLayoutParams();
        int i3 = ((ViewGroup.MarginLayoutParams) vndVar).leftMargin - iArr[0];
        int iMax = Math.max(0, i3) + i;
        iArr[0] = Math.max(0, -i3);
        int iJ = j(view, i2);
        int measuredWidth = view.getMeasuredWidth();
        view.layout(iMax, iJ, iMax + measuredWidth, view.getMeasuredHeight() + iJ);
        return measuredWidth + ((ViewGroup.MarginLayoutParams) vndVar).rightMargin + iMax;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        t();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(this.Q);
        t();
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

    /* JADX WARN: Removed duplicated region for block: B:108:0x0285 A[LOOP:0: B:107:0x0283->B:108:0x0285, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:111:0x029d A[LOOP:1: B:110:0x029b->B:111:0x029d, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:114:0x02bd A[LOOP:2: B:113:0x02bb->B:114:0x02bd, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0303  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0310 A[LOOP:3: B:122:0x030e->B:123:0x0310, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0060  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00b0  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00c5  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00e0  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00fc  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x011b  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0120  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0127  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x015a  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0193  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x020e  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onLayout(boolean r20, int r21, int r22, int r23, int r24) {
        /*
            Method dump skipped, instruction units count: 801
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.widget.Toolbar.onLayout(boolean, int, int, int, int):void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        char c;
        Object[] objArr;
        int iK;
        int iMax;
        int iCombineMeasuredStates;
        int iK2;
        int iL;
        int iCombineMeasuredStates2;
        int iMax2;
        boolean z = bwe.a;
        int i3 = 0;
        if (getLayoutDirection() == 1) {
            objArr = true;
            c = 0;
        } else {
            c = 1;
            objArr = false;
        }
        if (s(this.d)) {
            r(this.d, i, 0, i2, this.o);
            iK = k(this.d) + this.d.getMeasuredWidth();
            iMax = Math.max(0, l(this.d) + this.d.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(0, this.d.getMeasuredState());
        } else {
            iK = 0;
            iMax = 0;
            iCombineMeasuredStates = 0;
        }
        if (s(this.h)) {
            r(this.h, i, 0, i2, this.o);
            iK = k(this.h) + this.h.getMeasuredWidth();
            iMax = Math.max(iMax, l(this.h) + this.h.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, this.h.getMeasuredState());
        }
        int currentContentInsetStart = getCurrentContentInsetStart();
        int iMax3 = Math.max(currentContentInsetStart, iK);
        int iMax4 = Math.max(0, currentContentInsetStart - iK);
        Object[] objArr2 = objArr;
        int[] iArr = this.F;
        iArr[objArr2 == true ? 1 : 0] = iMax4;
        if (s(this.a)) {
            r(this.a, i, iMax3, i2, this.o);
            iK2 = k(this.a) + this.a.getMeasuredWidth();
            iMax = Math.max(iMax, l(this.a) + this.a.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, this.a.getMeasuredState());
        } else {
            iK2 = 0;
        }
        int currentContentInsetEnd = getCurrentContentInsetEnd();
        int iMax5 = iMax3 + Math.max(currentContentInsetEnd, iK2);
        iArr[c] = Math.max(0, currentContentInsetEnd - iK2);
        if (s(this.i)) {
            iMax5 += q(this.i, i, iMax5, i2, 0, iArr);
            iMax = Math.max(iMax, l(this.i) + this.i.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, this.i.getMeasuredState());
        }
        if (s(this.e)) {
            iMax5 += q(this.e, i, iMax5, i2, 0, iArr);
            iMax = Math.max(iMax, l(this.e) + this.e.getMeasuredHeight());
            iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, this.e.getMeasuredState());
        }
        int childCount = getChildCount();
        for (int i4 = 0; i4 < childCount; i4++) {
            View childAt = getChildAt(i4);
            if (((vnd) childAt.getLayoutParams()).b == 0 && s(childAt)) {
                iMax5 += q(childAt, i, iMax5, i2, 0, iArr);
                int iMax6 = Math.max(iMax, l(childAt) + childAt.getMeasuredHeight());
                iCombineMeasuredStates = View.combineMeasuredStates(iCombineMeasuredStates, childAt.getMeasuredState());
                iMax = iMax6;
            } else {
                iMax5 = iMax5;
            }
        }
        int i5 = iMax5;
        int i6 = this.r + this.s;
        int i7 = this.p + this.q;
        if (s(this.b)) {
            q(this.b, i, i5 + i7, i2, i6, iArr);
            int iK3 = k(this.b) + this.b.getMeasuredWidth();
            iL = l(this.b) + this.b.getMeasuredHeight();
            iCombineMeasuredStates2 = View.combineMeasuredStates(iCombineMeasuredStates, this.b.getMeasuredState());
            iMax2 = iK3;
        } else {
            iL = 0;
            iCombineMeasuredStates2 = iCombineMeasuredStates;
            iMax2 = 0;
        }
        if (s(this.c)) {
            iMax2 = Math.max(iMax2, q(this.c, i, i5 + i7, i2, i6 + iL, iArr));
            iL += l(this.c) + this.c.getMeasuredHeight();
            iCombineMeasuredStates2 = View.combineMeasuredStates(iCombineMeasuredStates2, this.c.getMeasuredState());
        }
        int iMax7 = Math.max(iMax, iL);
        int paddingRight = getPaddingRight() + getPaddingLeft() + i5 + iMax2;
        int paddingBottom = getPaddingBottom() + getPaddingTop() + iMax7;
        int iResolveSizeAndState = View.resolveSizeAndState(Math.max(paddingRight, getSuggestedMinimumWidth()), i, (-16777216) & iCombineMeasuredStates2);
        int iResolveSizeAndState2 = View.resolveSizeAndState(Math.max(paddingBottom, getSuggestedMinimumHeight()), i2, iCombineMeasuredStates2 << 16);
        if (!this.M) {
            i3 = iResolveSizeAndState2;
            break;
        }
        int childCount2 = getChildCount();
        for (int i8 = 0; i8 < childCount2; i8++) {
            View childAt2 = getChildAt(i8);
            if (s(childAt2) && childAt2.getMeasuredWidth() > 0 && childAt2.getMeasuredHeight() > 0) {
                i3 = iResolveSizeAndState2;
                break;
            }
        }
        setMeasuredDimension(iResolveSizeAndState, i3);
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        MenuItem menuItemFindItem;
        if (!(parcelable instanceof xnd)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        xnd xndVar = (xnd) parcelable;
        super.onRestoreInstanceState(xndVar.a);
        ActionMenuView actionMenuView = this.a;
        lx7 lx7Var = actionMenuView != null ? actionMenuView.p : null;
        int i = xndVar.c;
        if (i != 0 && this.L != null && lx7Var != null && (menuItemFindItem = lx7Var.findItem(i)) != null) {
            menuItemFindItem.expandActionView();
        }
        if (xndVar.d) {
            jn jnVar = this.Q;
            removeCallbacks(jnVar);
            post(jnVar);
        }
    }

    @Override // android.view.View
    public final void onRtlPropertiesChanged(int i) {
        super.onRtlPropertiesChanged(i);
        d();
        smb smbVar = this.t;
        boolean z = i == 1;
        if (z == smbVar.g) {
            return;
        }
        smbVar.g = z;
        if (!smbVar.h) {
            smbVar.a = smbVar.e;
            smbVar.b = smbVar.f;
            return;
        }
        if (z) {
            int i2 = smbVar.d;
            if (i2 == Integer.MIN_VALUE) {
                i2 = smbVar.e;
            }
            smbVar.a = i2;
            int i3 = smbVar.c;
            if (i3 == Integer.MIN_VALUE) {
                i3 = smbVar.f;
            }
            smbVar.b = i3;
            return;
        }
        int i4 = smbVar.c;
        if (i4 == Integer.MIN_VALUE) {
            i4 = smbVar.e;
        }
        smbVar.a = i4;
        int i5 = smbVar.d;
        if (i5 == Integer.MIN_VALUE) {
            i5 = smbVar.f;
        }
        smbVar.b = i5;
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        h6 h6Var;
        sx7 sx7Var;
        xnd xndVar = new xnd(super.onSaveInstanceState());
        und undVar = this.L;
        if (undVar != null && (sx7Var = undVar.b) != null) {
            xndVar.c = sx7Var.a;
        }
        ActionMenuView actionMenuView = this.a;
        xndVar.d = (actionMenuView == null || (h6Var = actionMenuView.t) == null || !h6Var.j()) ? false : true;
        return xndVar;
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

    public final int p(View view, int i, int i2, int[] iArr) {
        vnd vndVar = (vnd) view.getLayoutParams();
        int i3 = ((ViewGroup.MarginLayoutParams) vndVar).rightMargin - iArr[1];
        int iMax = i - Math.max(0, i3);
        iArr[1] = Math.max(0, -i3);
        int iJ = j(view, i2);
        int measuredWidth = view.getMeasuredWidth();
        view.layout(iMax - measuredWidth, iJ, iMax, view.getMeasuredHeight() + iJ);
        return iMax - (measuredWidth + ((ViewGroup.MarginLayoutParams) vndVar).leftMargin);
    }

    public final int q(View view, int i, int i2, int i3, int i4, int[] iArr) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        int i5 = marginLayoutParams.leftMargin - iArr[0];
        int i6 = marginLayoutParams.rightMargin - iArr[1];
        int iMax = Math.max(0, i6) + Math.max(0, i5);
        iArr[0] = Math.max(0, -i5);
        iArr[1] = Math.max(0, -i6);
        view.measure(ViewGroup.getChildMeasureSpec(i, getPaddingRight() + getPaddingLeft() + iMax + i2, marginLayoutParams.width), ViewGroup.getChildMeasureSpec(i3, getPaddingBottom() + getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin + i4, marginLayoutParams.height));
        return view.getMeasuredWidth() + iMax;
    }

    public final void r(View view, int i, int i2, int i3, int i4) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        int childMeasureSpec = ViewGroup.getChildMeasureSpec(i, getPaddingRight() + getPaddingLeft() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i2, marginLayoutParams.width);
        int childMeasureSpec2 = ViewGroup.getChildMeasureSpec(i3, getPaddingBottom() + getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin, marginLayoutParams.height);
        int mode = View.MeasureSpec.getMode(childMeasureSpec2);
        if (mode != 1073741824 && i4 >= 0) {
            if (mode != 0) {
                i4 = Math.min(View.MeasureSpec.getSize(childMeasureSpec2), i4);
            }
            childMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(i4, 1073741824);
        }
        view.measure(childMeasureSpec, childMeasureSpec2);
    }

    public final boolean s(View view) {
        return (view == null || view.getParent() != this || view.getVisibility() == 8) ? false : true;
    }

    public void setBackInvokedCallbackEnabled(boolean z) {
        if (this.P != z) {
            this.P = z;
            t();
        }
    }

    public void setCollapseContentDescription(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            c();
        }
        n20 n20Var = this.h;
        if (n20Var != null) {
            n20Var.setContentDescription(charSequence);
        }
    }

    public void setCollapseIcon(Drawable drawable) {
        if (drawable != null) {
            c();
            this.h.setImageDrawable(drawable);
        } else {
            n20 n20Var = this.h;
            if (n20Var != null) {
                n20Var.setImageDrawable(this.f);
            }
        }
    }

    public void setCollapsible(boolean z) {
        this.M = z;
        requestLayout();
    }

    public void setContentInsetEndWithActions(int i) {
        if (i < 0) {
            i = Integer.MIN_VALUE;
        }
        if (i != this.v) {
            this.v = i;
            if (getNavigationIcon() != null) {
                requestLayout();
            }
        }
    }

    public void setContentInsetStartWithNavigation(int i) {
        if (i < 0) {
            i = Integer.MIN_VALUE;
        }
        if (i != this.u) {
            this.u = i;
            if (getNavigationIcon() != null) {
                requestLayout();
            }
        }
    }

    public void setLogo(Drawable drawable) {
        AppCompatImageView appCompatImageView = this.e;
        if (drawable != null) {
            if (appCompatImageView == null) {
                appCompatImageView = new AppCompatImageView(getContext());
                this.e = appCompatImageView;
            }
            if (!n(appCompatImageView)) {
                b(this.e, true);
            }
        } else if (appCompatImageView != null && n(appCompatImageView)) {
            removeView(this.e);
            this.E.remove(this.e);
        }
        AppCompatImageView appCompatImageView2 = this.e;
        if (appCompatImageView2 != null) {
            appCompatImageView2.setImageDrawable(drawable);
        }
    }

    public void setLogoDescription(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence) && this.e == null) {
            this.e = new AppCompatImageView(getContext());
        }
        AppCompatImageView appCompatImageView = this.e;
        if (appCompatImageView != null) {
            appCompatImageView.setContentDescription(charSequence);
        }
    }

    public void setNavigationContentDescription(CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            g();
        }
        n20 n20Var = this.d;
        if (n20Var != null) {
            n20Var.setContentDescription(charSequence);
            ep7.A(this.d, charSequence);
        }
    }

    public void setNavigationIcon(Drawable drawable) {
        if (drawable != null) {
            g();
            if (!n(this.d)) {
                b(this.d, true);
            }
        } else {
            n20 n20Var = this.d;
            if (n20Var != null && n(n20Var)) {
                removeView(this.d);
                this.E.remove(this.d);
            }
        }
        n20 n20Var2 = this.d;
        if (n20Var2 != null) {
            n20Var2.setImageDrawable(drawable);
        }
    }

    public void setNavigationOnClickListener(View.OnClickListener onClickListener) {
        g();
        this.d.setOnClickListener(onClickListener);
    }

    public void setOverflowIcon(Drawable drawable) {
        e();
        this.a.setOverflowIcon(drawable);
    }

    public void setPopupTheme(int i) {
        if (this.k != i) {
            this.k = i;
            if (i == 0) {
                this.j = getContext();
            } else {
                this.j = new ContextThemeWrapper(getContext(), i);
            }
        }
    }

    public void setSubtitle(CharSequence charSequence) {
        boolean zIsEmpty = TextUtils.isEmpty(charSequence);
        r30 r30Var = this.c;
        if (!zIsEmpty) {
            if (r30Var == null) {
                Context context = getContext();
                r30 r30Var2 = new r30(context, null);
                this.c = r30Var2;
                r30Var2.setSingleLine();
                this.c.setEllipsize(TextUtils.TruncateAt.END);
                int i = this.m;
                if (i != 0) {
                    this.c.setTextAppearance(context, i);
                }
                ColorStateList colorStateList = this.A;
                if (colorStateList != null) {
                    this.c.setTextColor(colorStateList);
                }
            }
            if (!n(this.c)) {
                b(this.c, true);
            }
        } else if (r30Var != null && n(r30Var)) {
            removeView(this.c);
            this.E.remove(this.c);
        }
        r30 r30Var3 = this.c;
        if (r30Var3 != null) {
            r30Var3.setText(charSequence);
        }
        this.y = charSequence;
    }

    public void setSubtitleTextColor(ColorStateList colorStateList) {
        this.A = colorStateList;
        r30 r30Var = this.c;
        if (r30Var != null) {
            r30Var.setTextColor(colorStateList);
        }
    }

    public void setTitle(CharSequence charSequence) {
        boolean zIsEmpty = TextUtils.isEmpty(charSequence);
        r30 r30Var = this.b;
        if (!zIsEmpty) {
            if (r30Var == null) {
                Context context = getContext();
                r30 r30Var2 = new r30(context, null);
                this.b = r30Var2;
                r30Var2.setSingleLine();
                this.b.setEllipsize(TextUtils.TruncateAt.END);
                int i = this.l;
                if (i != 0) {
                    this.b.setTextAppearance(context, i);
                }
                ColorStateList colorStateList = this.z;
                if (colorStateList != null) {
                    this.b.setTextColor(colorStateList);
                }
            }
            if (!n(this.b)) {
                b(this.b, true);
            }
        } else if (r30Var != null && n(r30Var)) {
            removeView(this.b);
            this.E.remove(this.b);
        }
        r30 r30Var3 = this.b;
        if (r30Var3 != null) {
            r30Var3.setText(charSequence);
        }
        this.x = charSequence;
    }

    public void setTitleMarginBottom(int i) {
        this.s = i;
        requestLayout();
    }

    public void setTitleMarginEnd(int i) {
        this.q = i;
        requestLayout();
    }

    public void setTitleMarginStart(int i) {
        this.p = i;
        requestLayout();
    }

    public void setTitleMarginTop(int i) {
        this.r = i;
        requestLayout();
    }

    public void setTitleTextColor(ColorStateList colorStateList) {
        this.z = colorStateList;
        r30 r30Var = this.b;
        if (r30Var != null) {
            r30Var.setTextColor(colorStateList);
        }
    }

    public final void t() {
        OnBackInvokedDispatcher onBackInvokedDispatcher;
        if (Build.VERSION.SDK_INT >= 33) {
            OnBackInvokedDispatcher onBackInvokedDispatcherA = tnd.a(this);
            und undVar = this.L;
            int i = 0;
            boolean z = (undVar == null || undVar.b == null || onBackInvokedDispatcherA == null || !isAttachedToWindow() || !this.P) ? false : true;
            if (!z || this.O != null) {
                if (z || (onBackInvokedDispatcher = this.O) == null) {
                    return;
                }
                tnd.d(onBackInvokedDispatcher, this.N);
                this.O = null;
                return;
            }
            OnBackInvokedCallback onBackInvokedCallbackB = this.N;
            if (onBackInvokedCallbackB == null) {
                onBackInvokedCallbackB = tnd.b(new snd(this, i));
                this.N = onBackInvokedCallbackB;
            }
            tnd.c(onBackInvokedDispatcherA, onBackInvokedCallbackB);
            this.O = onBackInvokedDispatcherA;
        }
    }

    public void setSubtitleTextColor(int i) {
        setSubtitleTextColor(ColorStateList.valueOf(i));
    }

    public void setTitleTextColor(int i) {
        setTitleTextColor(ColorStateList.valueOf(i));
    }

    public void setCollapseContentDescription(int i) {
        setCollapseContentDescription(i != 0 ? getContext().getText(i) : null);
    }

    public void setCollapseIcon(int i) {
        setCollapseIcon(guc.E(getContext(), i));
    }

    public void setNavigationContentDescription(int i) {
        setNavigationContentDescription(i != 0 ? getContext().getText(i) : null);
    }

    public void setOnMenuItemClickListener(wnd wndVar) {
    }

    public void setLogoDescription(int i) {
        setLogoDescription(getContext().getText(i));
    }

    @Override // android.view.ViewGroup
    public final /* bridge */ /* synthetic */ ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return i(layoutParams);
    }

    public void setNavigationIcon(int i) {
        setNavigationIcon(guc.E(getContext(), i));
    }

    public void setLogo(int i) {
        setLogo(guc.E(getContext(), i));
    }

    public void setSubtitle(int i) {
        setSubtitle(getContext().getText(i));
    }

    public void setTitle(int i) {
        setTitle(getContext().getText(i));
    }

    public Toolbar(Context context) {
        this(context, null);
    }
}
