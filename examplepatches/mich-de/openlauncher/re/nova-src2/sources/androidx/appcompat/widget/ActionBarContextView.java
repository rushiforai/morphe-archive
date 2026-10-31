package androidx.appcompat.widget;

import a5.a1;
import a5.i1;
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
import b.c0;
import com.google.android.material.datepicker.n;
import e10.z2;
import io.branch.requery.android.database.sqlite.y;
import q.k;
import r.e;
import r.i;
import r.p2;

/* loaded from: classes2.dex */
public class ActionBarContextView extends ViewGroup {

    /* renamed from: a, reason: collision with root package name */
    public final y f13700a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f13701b;

    /* renamed from: c, reason: collision with root package name */
    public ActionMenuView f13702c;

    /* renamed from: d, reason: collision with root package name */
    public i f13703d;

    /* renamed from: e, reason: collision with root package name */
    public int f13704e;

    /* renamed from: f, reason: collision with root package name */
    public i1 f13705f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f13706g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f13707h;

    /* renamed from: i, reason: collision with root package name */
    public CharSequence f13708i;

    /* renamed from: j, reason: collision with root package name */
    public CharSequence f13709j;

    /* renamed from: k, reason: collision with root package name */
    public View f13710k;

    /* renamed from: l, reason: collision with root package name */
    public View f13711l;

    /* renamed from: m, reason: collision with root package name */
    public View f13712m;
    public LinearLayout n;
    public TextView o;

    /* renamed from: p, reason: collision with root package name */
    public TextView f13713p;

    /* renamed from: q, reason: collision with root package name */
    public final int f13714q;

    /* renamed from: r, reason: collision with root package name */
    public final int f13715r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f13716s;

    /* renamed from: t, reason: collision with root package name */
    public final int f13717t;

    public ActionBarContextView(Context context, AttributeSet attributeSet) {
        int resourceId;
        super(context, attributeSet, 2130968608);
        y yVar = new y();
        yVar.f61882c = this;
        yVar.f61880a = false;
        this.f13700a = yVar;
        TypedValue typedValue = new TypedValue();
        if (!context.getTheme().resolveAttribute(2130968582, typedValue, true) || typedValue.resourceId == 0) {
            this.f13701b = context;
        } else {
            this.f13701b = new ContextThemeWrapper(context, typedValue.resourceId);
        }
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, l.a.f72891d, 2130968608, 0);
        setBackground((!typedArrayObtainStyledAttributes.hasValue(0) || (resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0)) == 0) ? typedArrayObtainStyledAttributes.getDrawable(0) : z2.b0(context, resourceId));
        this.f13714q = typedArrayObtainStyledAttributes.getResourceId(5, 0);
        this.f13715r = typedArrayObtainStyledAttributes.getResourceId(4, 0);
        this.f13704e = typedArrayObtainStyledAttributes.getLayoutDimension(3, 0);
        this.f13717t = typedArrayObtainStyledAttributes.getResourceId(2, 2131623941);
        typedArrayObtainStyledAttributes.recycle();
    }

    public static int f(View view, int i5, int i11) {
        view.measure(View.MeasureSpec.makeMeasureSpec(i5, Integer.MIN_VALUE), i11);
        return Math.max(0, i5 - view.getMeasuredWidth());
    }

    public static int g(View view, boolean z11, int i5, int i11, int i12) {
        int measuredWidth = view.getMeasuredWidth();
        int measuredHeight = view.getMeasuredHeight();
        int iC = c0.c(i12, measuredHeight, 2, i11);
        if (z11) {
            view.layout(i5 - measuredWidth, iC, i5, measuredHeight + iC);
        } else {
            view.layout(i5, iC, i5 + measuredWidth, measuredHeight + iC);
        }
        return z11 ? -measuredWidth : measuredWidth;
    }

    public final void c(androidx.appcompat.view.b bVar) {
        View view = this.f13710k;
        if (view == null) {
            View viewInflate = LayoutInflater.from(getContext()).inflate(this.f13717t, (ViewGroup) this, false);
            this.f13710k = viewInflate;
            addView(viewInflate);
        } else if (view.getParent() == null) {
            addView(this.f13710k);
        }
        View viewFindViewById = this.f13710k.findViewById(2131427421);
        this.f13711l = viewFindViewById;
        viewFindViewById.setOnClickListener(new n(bVar, 7));
        k kVarE = bVar.e();
        i iVar = this.f13703d;
        if (iVar != null) {
            iVar.j();
            e eVar = iVar.f84740r;
            if (eVar != null && eVar.b()) {
                eVar.f83302i.dismiss();
            }
        }
        i iVar2 = new i(getContext());
        this.f13703d = iVar2;
        iVar2.f84734j = true;
        iVar2.f84735k = true;
        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-2, -1);
        kVarE.b(this.f13703d, this.f13701b);
        i iVar3 = this.f13703d;
        q.y yVar = iVar3.f84732h;
        if (yVar == null) {
            q.y yVar2 = (q.y) iVar3.f84728d.inflate(iVar3.f84730f, (ViewGroup) this, false);
            iVar3.f84732h = yVar2;
            yVar2.b(iVar3.f84727c);
            iVar3.c();
        }
        q.y yVar3 = iVar3.f84732h;
        if (yVar != yVar3) {
            ActionMenuView actionMenuView = (ActionMenuView) yVar3;
            actionMenuView.f13746t = iVar3;
            iVar3.f84732h = actionMenuView;
            actionMenuView.f13742p = iVar3.f84727c;
        }
        ActionMenuView actionMenuView2 = (ActionMenuView) yVar3;
        this.f13702c = actionMenuView2;
        actionMenuView2.setBackground(null);
        addView(this.f13702c, layoutParams);
    }

    public final void d() {
        if (this.n == null) {
            LayoutInflater.from(getContext()).inflate(2131623936, this);
            LinearLayout linearLayout = (LinearLayout) getChildAt(getChildCount() - 1);
            this.n = linearLayout;
            this.o = (TextView) linearLayout.findViewById(2131427404);
            this.f13713p = (TextView) this.n.findViewById(2131427402);
            int i5 = this.f13714q;
            if (i5 != 0) {
                this.o.setTextAppearance(getContext(), i5);
            }
            int i11 = this.f13715r;
            if (i11 != 0) {
                this.f13713p.setTextAppearance(getContext(), i11);
            }
        }
        this.o.setText(this.f13708i);
        this.f13713p.setText(this.f13709j);
        boolean zIsEmpty = TextUtils.isEmpty(this.f13708i);
        boolean zIsEmpty2 = TextUtils.isEmpty(this.f13709j);
        this.f13713p.setVisibility(!zIsEmpty2 ? 0 : 8);
        this.n.setVisibility((zIsEmpty && zIsEmpty2) ? 8 : 0);
        if (this.n.getParent() == null) {
            addView(this.n);
        }
    }

    public final void e() {
        removeAllViews();
        this.f13712m = null;
        this.f13702c = null;
        this.f13703d = null;
        View view = this.f13711l;
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

    public final void h(View view) {
        LinearLayout linearLayout;
        View view2 = this.f13712m;
        if (view2 != null) {
            removeView(view2);
        }
        this.f13712m = view;
        if (view != null && (linearLayout = this.n) != null) {
            removeView(linearLayout);
            this.n = null;
        }
        if (view != null) {
            addView(view);
        }
        requestLayout();
    }

    public final i1 i(int i5, long j11) {
        i1 i1Var = this.f13705f;
        if (i1Var != null) {
            i1Var.b();
        }
        y yVar = this.f13700a;
        if (i5 != 0) {
            i1 i1VarA = a1.a(this);
            i1VarA.a(0.0f);
            i1VarA.c(j11);
            ((ActionBarContextView) yVar.f61882c).f13705f = i1VarA;
            yVar.f61881b = i5;
            i1VarA.d(yVar);
            return i1VarA;
        }
        if (getVisibility() != 0) {
            setAlpha(0.0f);
        }
        i1 i1VarA2 = a1.a(this);
        i1VarA2.a(1.0f);
        i1VarA2.c(j11);
        ((ActionBarContextView) yVar.f61882c).f13705f = i1VarA2;
        yVar.f61881b = i5;
        i1VarA2.d(yVar);
        return i1VarA2;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(null, l.a.f72888a, 2130968585, 0);
        this.f13704e = typedArrayObtainStyledAttributes.getLayoutDimension(13, 0);
        typedArrayObtainStyledAttributes.recycle();
        i iVar = this.f13703d;
        if (iVar != null) {
            Configuration configuration2 = iVar.f84726b.getResources().getConfiguration();
            int i5 = configuration2.screenWidthDp;
            int i11 = configuration2.screenHeightDp;
            iVar.n = (configuration2.smallestScreenWidthDp > 600 || i5 > 600 || (i5 > 960 && i11 > 720) || (i5 > 720 && i11 > 960)) ? 5 : (i5 >= 500 || (i5 > 640 && i11 > 480) || (i5 > 480 && i11 > 640)) ? 4 : i5 >= 360 ? 3 : 2;
            k kVar = iVar.f84727c;
            if (kVar != null) {
                kVar.p(true);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        i iVar = this.f13703d;
        if (iVar != null) {
            iVar.j();
            e eVar = this.f13703d.f84740r;
            if (eVar == null || !eVar.b()) {
                return;
            }
            eVar.f83302i.dismiss();
        }
    }

    @Override // android.view.View
    public final boolean onHoverEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 9) {
            this.f13707h = false;
        }
        if (!this.f13707h) {
            boolean zOnHoverEvent = super.onHoverEvent(motionEvent);
            if (actionMasked == 9 && !zOnHoverEvent) {
                this.f13707h = true;
            }
        }
        if (actionMasked != 10 && actionMasked != 3) {
            return true;
        }
        this.f13707h = false;
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        boolean z12 = p2.f84838a;
        boolean z13 = getLayoutDirection() == 1;
        int paddingRight = z13 ? (i12 - i5) - getPaddingRight() : getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingTop2 = ((i13 - i11) - getPaddingTop()) - getPaddingBottom();
        View view = this.f13710k;
        if (view != null && view.getVisibility() != 8) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) this.f13710k.getLayoutParams();
            int i14 = z13 ? marginLayoutParams.rightMargin : marginLayoutParams.leftMargin;
            int i15 = z13 ? marginLayoutParams.leftMargin : marginLayoutParams.rightMargin;
            int i16 = z13 ? paddingRight - i14 : paddingRight + i14;
            int iG = g(this.f13710k, z13, i16, paddingTop, paddingTop2) + i16;
            paddingRight = z13 ? iG - i15 : iG + i15;
        }
        LinearLayout linearLayout = this.n;
        if (linearLayout != null && this.f13712m == null && linearLayout.getVisibility() != 8) {
            paddingRight += g(this.n, z13, paddingRight, paddingTop, paddingTop2);
        }
        View view2 = this.f13712m;
        if (view2 != null) {
            g(view2, z13, paddingRight, paddingTop, paddingTop2);
        }
        int paddingLeft = z13 ? getPaddingLeft() : (i12 - i5) - getPaddingRight();
        ActionMenuView actionMenuView = this.f13702c;
        if (actionMenuView != null) {
            g(actionMenuView, !z13, paddingLeft, paddingTop, paddingTop2);
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        if (View.MeasureSpec.getMode(i5) != 1073741824) {
            throw new IllegalStateException(getClass().getSimpleName().concat(" can only be used with android:layout_width=\"match_parent\" (or fill_parent)"));
        }
        if (View.MeasureSpec.getMode(i11) == 0) {
            throw new IllegalStateException(getClass().getSimpleName().concat(" can only be used with android:layout_height=\"wrap_content\""));
        }
        int size = View.MeasureSpec.getSize(i5);
        int size2 = this.f13704e;
        if (size2 <= 0) {
            size2 = View.MeasureSpec.getSize(i11);
        }
        int paddingBottom = getPaddingBottom() + getPaddingTop();
        int paddingLeft = (size - getPaddingLeft()) - getPaddingRight();
        int iMin = size2 - paddingBottom;
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iMin, Integer.MIN_VALUE);
        View view = this.f13710k;
        if (view != null) {
            int iF = f(view, paddingLeft, iMakeMeasureSpec);
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) this.f13710k.getLayoutParams();
            paddingLeft = iF - (marginLayoutParams.leftMargin + marginLayoutParams.rightMargin);
        }
        ActionMenuView actionMenuView = this.f13702c;
        if (actionMenuView != null && actionMenuView.getParent() == this) {
            paddingLeft = f(this.f13702c, paddingLeft, iMakeMeasureSpec);
        }
        LinearLayout linearLayout = this.n;
        if (linearLayout != null && this.f13712m == null) {
            if (this.f13716s) {
                this.n.measure(View.MeasureSpec.makeMeasureSpec(0, 0), iMakeMeasureSpec);
                int measuredWidth = this.n.getMeasuredWidth();
                boolean z11 = measuredWidth <= paddingLeft;
                if (z11) {
                    paddingLeft -= measuredWidth;
                }
                this.n.setVisibility(z11 ? 0 : 8);
            } else {
                paddingLeft = f(linearLayout, paddingLeft, iMakeMeasureSpec);
            }
        }
        View view2 = this.f13712m;
        if (view2 != null) {
            ViewGroup.LayoutParams layoutParams = view2.getLayoutParams();
            int i12 = layoutParams.width;
            int i13 = i12 != -2 ? 1073741824 : Integer.MIN_VALUE;
            if (i12 >= 0) {
                paddingLeft = Math.min(i12, paddingLeft);
            }
            int i14 = layoutParams.height;
            int i15 = i14 == -2 ? Integer.MIN_VALUE : 1073741824;
            if (i14 >= 0) {
                iMin = Math.min(i14, iMin);
            }
            this.f13712m.measure(View.MeasureSpec.makeMeasureSpec(paddingLeft, i13), View.MeasureSpec.makeMeasureSpec(iMin, i15));
        }
        if (this.f13704e > 0) {
            setMeasuredDimension(size, size2);
            return;
        }
        int childCount = getChildCount();
        int i16 = 0;
        for (int i17 = 0; i17 < childCount; i17++) {
            int measuredHeight = getChildAt(i17).getMeasuredHeight() + paddingBottom;
            if (measuredHeight > i16) {
                i16 = measuredHeight;
            }
        }
        setMeasuredDimension(size, i16);
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.f13706g = false;
        }
        if (!this.f13706g) {
            boolean zOnTouchEvent = super.onTouchEvent(motionEvent);
            if (actionMasked == 0 && !zOnTouchEvent) {
                this.f13706g = true;
            }
        }
        if (actionMasked != 1 && actionMasked != 3) {
            return true;
        }
        this.f13706g = false;
        return true;
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        if (i5 != getVisibility()) {
            i1 i1Var = this.f13705f;
            if (i1Var != null) {
                i1Var.b();
            }
            super.setVisibility(i5);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }
}
