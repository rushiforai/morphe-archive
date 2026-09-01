package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.medium.reader.R;
import defpackage.bwe;
import defpackage.e6;
import defpackage.esa;
import defpackage.guc;
import defpackage.h6;
import defpackage.jve;
import defpackage.l6;
import defpackage.lx7;
import defpackage.oy7;
import defpackage.u;
import defpackage.u5;
import defpackage.ute;
import defpackage.ygf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ActionBarContextView extends ViewGroup {
    public final u a;
    public final Context b;
    public ActionMenuView c;
    public h6 d;
    public int e;
    public jve f;
    public boolean g;
    public boolean h;
    public CharSequence i;
    public CharSequence j;
    public View k;
    public View l;
    public View m;
    public LinearLayout n;
    public TextView o;
    public TextView p;
    public final int q;
    public final int r;
    public boolean s;
    public final int t;

    public ActionBarContextView(Context context, AttributeSet attributeSet) {
        int resourceId;
        super(context, attributeSet, R.attr.actionModeStyle);
        this.a = new u(this);
        TypedValue typedValue = new TypedValue();
        if (!context.getTheme().resolveAttribute(R.attr.actionBarPopupTheme, typedValue, true) || typedValue.resourceId == 0) {
            this.b = context;
        } else {
            this.b = new ContextThemeWrapper(context, typedValue.resourceId);
        }
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, esa.d, R.attr.actionModeStyle, 0);
        setBackground((!typedArrayObtainStyledAttributes.hasValue(0) || (resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0)) == 0) ? typedArrayObtainStyledAttributes.getDrawable(0) : guc.E(context, resourceId));
        this.q = typedArrayObtainStyledAttributes.getResourceId(5, 0);
        this.r = typedArrayObtainStyledAttributes.getResourceId(4, 0);
        this.e = typedArrayObtainStyledAttributes.getLayoutDimension(3, 0);
        this.t = typedArrayObtainStyledAttributes.getResourceId(2, R.layout.abc_action_mode_close_item_material);
        typedArrayObtainStyledAttributes.recycle();
    }

    public static int f(View view, int i, int i2) {
        view.measure(View.MeasureSpec.makeMeasureSpec(i, Integer.MIN_VALUE), i2);
        return Math.max(0, i - view.getMeasuredWidth());
    }

    public static int g(int i, int i2, int i3, View view, boolean z) {
        int measuredWidth = view.getMeasuredWidth();
        int measuredHeight = view.getMeasuredHeight();
        int i4 = ((i3 - measuredHeight) / 2) + i2;
        if (z) {
            view.layout(i - measuredWidth, i4, i, measuredHeight + i4);
        } else {
            view.layout(i, i4, i + measuredWidth, measuredHeight + i4);
        }
        return z ? -measuredWidth : measuredWidth;
    }

    public final void c(l6 l6Var) {
        View view = this.k;
        int i = 0;
        if (view == null) {
            View viewInflate = LayoutInflater.from(getContext()).inflate(this.t, (ViewGroup) this, false);
            this.k = viewInflate;
            addView(viewInflate);
        } else if (view.getParent() == null) {
            addView(this.k);
        }
        View viewFindViewById = this.k.findViewById(R.id.action_mode_close_button);
        this.l = viewFindViewById;
        viewFindViewById.setOnClickListener(new u5(i, l6Var));
        lx7 lx7VarF = l6Var.f();
        h6 h6Var = this.d;
        if (h6Var != null) {
            h6Var.e();
            e6 e6Var = h6Var.t;
            if (e6Var != null && e6Var.b()) {
                e6Var.i.dismiss();
            }
        }
        h6 h6Var2 = new h6(getContext());
        this.d = h6Var2;
        h6Var2.l = true;
        h6Var2.m = true;
        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-2, -1);
        lx7VarF.b(this.d, this.b);
        h6 h6Var3 = this.d;
        oy7 oy7Var = h6Var3.h;
        if (oy7Var == null) {
            oy7 oy7Var2 = (oy7) h6Var3.d.inflate(h6Var3.f, (ViewGroup) this, false);
            h6Var3.h = oy7Var2;
            oy7Var2.b(h6Var3.c);
            h6Var3.i();
        }
        oy7 oy7Var3 = h6Var3.h;
        if (oy7Var != oy7Var3) {
            ((ActionMenuView) oy7Var3).setPresenter(h6Var3);
        }
        ActionMenuView actionMenuView = (ActionMenuView) oy7Var3;
        this.c = actionMenuView;
        actionMenuView.setBackground(null);
        addView(this.c, layoutParams);
    }

    public final void d() {
        if (this.n == null) {
            LayoutInflater.from(getContext()).inflate(R.layout.abc_action_bar_title_item, this);
            LinearLayout linearLayout = (LinearLayout) getChildAt(getChildCount() - 1);
            this.n = linearLayout;
            this.o = (TextView) linearLayout.findViewById(R.id.action_bar_title);
            this.p = (TextView) this.n.findViewById(R.id.action_bar_subtitle);
            int i = this.q;
            if (i != 0) {
                this.o.setTextAppearance(getContext(), i);
            }
            int i2 = this.r;
            if (i2 != 0) {
                this.p.setTextAppearance(getContext(), i2);
            }
        }
        this.o.setText(this.i);
        this.p.setText(this.j);
        boolean zIsEmpty = TextUtils.isEmpty(this.i);
        boolean zIsEmpty2 = TextUtils.isEmpty(this.j);
        this.p.setVisibility(!zIsEmpty2 ? 0 : 8);
        this.n.setVisibility((zIsEmpty && zIsEmpty2) ? 8 : 0);
        if (this.n.getParent() == null) {
            addView(this.n);
        }
    }

    public final void e() {
        removeAllViews();
        this.m = null;
        this.c = null;
        this.d = null;
        View view = this.l;
        if (view != null) {
            view.setOnClickListener(null);
        }
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new ViewGroup.MarginLayoutParams(-1, -2);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new ViewGroup.MarginLayoutParams(getContext(), attributeSet);
    }

    public int getAnimatedVisibility() {
        return this.f != null ? this.a.a : getVisibility();
    }

    public int getContentHeight() {
        return this.e;
    }

    public CharSequence getSubtitle() {
        return this.j;
    }

    public CharSequence getTitle() {
        return this.i;
    }

    @Override // android.view.View
    /* JADX INFO: renamed from: h, reason: merged with bridge method [inline-methods] */
    public final void setVisibility(int i) {
        if (i != getVisibility()) {
            jve jveVar = this.f;
            if (jveVar != null) {
                jveVar.b();
            }
            super.setVisibility(i);
        }
    }

    public final jve i(int i, long j) {
        jve jveVar = this.f;
        if (jveVar != null) {
            jveVar.b();
        }
        u uVar = this.a;
        if (i != 0) {
            jve jveVarA = ute.a(this);
            jveVarA.a(0.0f);
            jveVarA.c(j);
            ((ActionBarContextView) uVar.c).f = jveVarA;
            uVar.a = i;
            jveVarA.d(uVar);
            return jveVarA;
        }
        if (getVisibility() != 0) {
            setAlpha(0.0f);
        }
        jve jveVarA2 = ute.a(this);
        jveVarA2.a(1.0f);
        jveVarA2.c(j);
        ((ActionBarContextView) uVar.c).f = jveVarA2;
        uVar.a = i;
        jveVarA2.d(uVar);
        return jveVarA2;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(null, esa.a, R.attr.actionBarStyle, 0);
        setContentHeight(typedArrayObtainStyledAttributes.getLayoutDimension(13, 0));
        typedArrayObtainStyledAttributes.recycle();
        h6 h6Var = this.d;
        if (h6Var != null) {
            Configuration configuration2 = h6Var.b.getResources().getConfiguration();
            int i = configuration2.screenWidthDp;
            int i2 = configuration2.screenHeightDp;
            h6Var.p = (configuration2.smallestScreenWidthDp > 600 || i > 600 || (i > 960 && i2 > 720) || (i > 720 && i2 > 960)) ? 5 : (i >= 500 || (i > 640 && i2 > 480) || (i > 480 && i2 > 640)) ? 4 : i >= 360 ? 3 : 2;
            lx7 lx7Var = h6Var.c;
            if (lx7Var != null) {
                lx7Var.p(true);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        h6 h6Var = this.d;
        if (h6Var != null) {
            h6Var.e();
            e6 e6Var = this.d.t;
            if (e6Var == null || !e6Var.b()) {
                return;
            }
            e6Var.i.dismiss();
        }
    }

    @Override // android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 9) {
            this.h = false;
        }
        if (!this.h) {
            boolean zOnHoverEvent = super.onHoverEvent(motionEvent);
            if (actionMasked == 9 && !zOnHoverEvent) {
                this.h = true;
            }
        }
        if (actionMasked != 10 && actionMasked != 3) {
            return true;
        }
        this.h = false;
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        boolean z2 = bwe.a;
        boolean z3 = getLayoutDirection() == 1;
        int paddingRight = z3 ? (i3 - i) - getPaddingRight() : getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingTop2 = ((i4 - i2) - getPaddingTop()) - getPaddingBottom();
        View view = this.k;
        if (view != null && view.getVisibility() != 8) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) this.k.getLayoutParams();
            int i5 = z3 ? marginLayoutParams.rightMargin : marginLayoutParams.leftMargin;
            int i6 = z3 ? marginLayoutParams.leftMargin : marginLayoutParams.rightMargin;
            int i7 = z3 ? paddingRight - i5 : paddingRight + i5;
            int iG = g(i7, paddingTop, paddingTop2, this.k, z3) + i7;
            paddingRight = z3 ? iG - i6 : iG + i6;
        }
        LinearLayout linearLayout = this.n;
        if (linearLayout != null && this.m == null && linearLayout.getVisibility() != 8) {
            paddingRight += g(paddingRight, paddingTop, paddingTop2, this.n, z3);
        }
        View view2 = this.m;
        if (view2 != null) {
            g(paddingRight, paddingTop, paddingTop2, view2, z3);
        }
        int paddingLeft = z3 ? getPaddingLeft() : (i3 - i) - getPaddingRight();
        ActionMenuView actionMenuView = this.c;
        if (actionMenuView != null) {
            g(paddingLeft, paddingTop, paddingTop2, actionMenuView, !z3);
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        if (View.MeasureSpec.getMode(i) != 1073741824) {
            ygf.f(getClass().getSimpleName().concat(" can only be used with android:layout_width=\"match_parent\" (or fill_parent)"));
            return;
        }
        if (View.MeasureSpec.getMode(i2) == 0) {
            ygf.f(getClass().getSimpleName().concat(" can only be used with android:layout_height=\"wrap_content\""));
            return;
        }
        int size = View.MeasureSpec.getSize(i);
        int size2 = this.e;
        if (size2 <= 0) {
            size2 = View.MeasureSpec.getSize(i2);
        }
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        int paddingLeft = (size - getPaddingLeft()) - getPaddingRight();
        int iMin = size2 - paddingBottom;
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iMin, Integer.MIN_VALUE);
        View view = this.k;
        if (view != null) {
            int iF = f(view, paddingLeft, iMakeMeasureSpec);
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) this.k.getLayoutParams();
            paddingLeft = iF - (marginLayoutParams.leftMargin + marginLayoutParams.rightMargin);
        }
        ActionMenuView actionMenuView = this.c;
        if (actionMenuView != null && actionMenuView.getParent() == this) {
            paddingLeft = f(this.c, paddingLeft, iMakeMeasureSpec);
        }
        LinearLayout linearLayout = this.n;
        if (linearLayout != null && this.m == null) {
            if (this.s) {
                this.n.measure(View.MeasureSpec.makeMeasureSpec(0, 0), iMakeMeasureSpec);
                int measuredWidth = this.n.getMeasuredWidth();
                boolean z = measuredWidth <= paddingLeft;
                if (z) {
                    paddingLeft -= measuredWidth;
                }
                this.n.setVisibility(z ? 0 : 8);
            } else {
                paddingLeft = f(linearLayout, paddingLeft, iMakeMeasureSpec);
            }
        }
        View view2 = this.m;
        if (view2 != null) {
            ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
            int i3 = layoutParams.width;
            int i4 = i3 != -2 ? 1073741824 : Integer.MIN_VALUE;
            if (i3 >= 0) {
                paddingLeft = Math.min(i3, paddingLeft);
            }
            int i5 = layoutParams.height;
            int i6 = i5 == -2 ? Integer.MIN_VALUE : 1073741824;
            if (i5 >= 0) {
                iMin = Math.min(i5, iMin);
            }
            this.m.measure(View.MeasureSpec.makeMeasureSpec(paddingLeft, i4), View.MeasureSpec.makeMeasureSpec(iMin, i6));
        }
        if (this.e > 0) {
            setMeasuredDimension(size, size2);
            return;
        }
        int childCount = getChildCount();
        int i7 = 0;
        for (int i8 = 0; i8 < childCount; i8++) {
            int measuredHeight = getChildAt(i8).getMeasuredHeight() + paddingBottom;
            if (measuredHeight > i7) {
                i7 = measuredHeight;
            }
        }
        setMeasuredDimension(size, i7);
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.g = false;
        }
        if (!this.g) {
            boolean zOnTouchEvent = super.onTouchEvent(motionEvent);
            if (actionMasked == 0 && !zOnTouchEvent) {
                this.g = true;
            }
        }
        if (actionMasked != 1 && actionMasked != 3) {
            return true;
        }
        this.g = false;
        return true;
    }

    public void setContentHeight(int i) {
        this.e = i;
    }

    public void setCustomView(View view) {
        LinearLayout linearLayout;
        View view2 = this.m;
        if (view2 != null) {
            removeView(view2);
        }
        this.m = view;
        if (view != null && (linearLayout = this.n) != null) {
            removeView(linearLayout);
            this.n = null;
        }
        if (view != null) {
            addView(view);
        }
        requestLayout();
    }

    public void setSubtitle(CharSequence charSequence) {
        this.j = charSequence;
        d();
    }

    public void setTitle(CharSequence charSequence) {
        this.i = charSequence;
        d();
        ute.p(this, charSequence);
    }

    public void setTitleOptional(boolean z) {
        if (z != this.s) {
            requestLayout();
        }
        this.s = z;
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }

    public ActionBarContextView(Context context) {
        this(context, null);
    }
}
