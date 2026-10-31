package com.google.android.material.internal;

import a5.a1;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.widget.CheckedTextView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.google.android.material.datepicker.l;
import com.vungle.ads.internal.protos.Sdk;
import java.util.WeakHashMap;
import q.m;
import q.x;
import r.j1;
import r.k1;
import r.m2;
import tj.i;

/* loaded from: classes3.dex */
public class NavigationMenuItemView extends k1 implements x {
    public static final int[] C = {16842912};
    public m A;
    public final l B;

    /* renamed from: p, reason: collision with root package name */
    public Drawable f34318p;

    /* renamed from: q, reason: collision with root package name */
    public final Rect f34319q;

    /* renamed from: r, reason: collision with root package name */
    public final Rect f34320r;

    /* renamed from: s, reason: collision with root package name */
    public int f34321s;

    /* renamed from: t, reason: collision with root package name */
    public final boolean f34322t;

    /* renamed from: u, reason: collision with root package name */
    public boolean f34323u;

    /* renamed from: v, reason: collision with root package name */
    public final int f34324v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f34325w;

    /* renamed from: x, reason: collision with root package name */
    public final boolean f34326x;

    /* renamed from: y, reason: collision with root package name */
    public final CheckedTextView f34327y;

    /* renamed from: z, reason: collision with root package name */
    public FrameLayout f34328z;

    public NavigationMenuItemView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f34319q = new Rect();
        this.f34320r = new Rect();
        this.f34321s = Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE;
        this.f34322t = true;
        this.f34323u = false;
        i.a(context, attributeSet, 0, 0);
        int[] iArr = bj.a.f17927p;
        i.b(context, attributeSet, iArr, 0, 0, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, 0, 0);
        this.f34321s = typedArrayObtainStyledAttributes.getInt(1, this.f34321s);
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(0);
        if (drawable != null) {
            setForeground(drawable);
        }
        this.f34322t = typedArrayObtainStyledAttributes.getBoolean(2, true);
        typedArrayObtainStyledAttributes.recycle();
        this.f34326x = true;
        l lVar = new l(this, 6);
        this.B = lVar;
        if (this.f84772d != 0) {
            this.f84772d = 0;
            requestLayout();
        }
        LayoutInflater.from(context).inflate(2131624086, (ViewGroup) this, true);
        this.f34324v = context.getResources().getDimensionPixelSize(2131165396);
        CheckedTextView checkedTextView = (CheckedTextView) findViewById(2131427854);
        this.f34327y = checkedTextView;
        checkedTextView.setDuplicateParentStateEnabled(true);
        a1.k(checkedTextView, lVar);
    }

    @Override // q.x
    public final m c() {
        return this.A;
    }

    @Override // q.x
    public final void d(m mVar) {
        StateListDrawable stateListDrawable;
        this.A = mVar;
        int i5 = mVar.f83257a;
        if (i5 > 0) {
            setId(i5);
        }
        setVisibility(mVar.isVisible() ? 0 : 8);
        if (getBackground() == null) {
            TypedValue typedValue = new TypedValue();
            if (getContext().getTheme().resolveAttribute(2130968935, typedValue, true)) {
                stateListDrawable = new StateListDrawable();
                stateListDrawable.addState(C, new ColorDrawable(typedValue.data));
                stateListDrawable.addState(ViewGroup.EMPTY_STATE_SET, new ColorDrawable(0));
            } else {
                stateListDrawable = null;
            }
            WeakHashMap weakHashMap = a1.f250a;
            setBackground(stateListDrawable);
        }
        boolean zIsCheckable = mVar.isCheckable();
        refreshDrawableState();
        boolean z11 = this.f34325w;
        CheckedTextView checkedTextView = this.f34327y;
        if (z11 != zIsCheckable) {
            this.f34325w = zIsCheckable;
            this.B.h(checkedTextView, 2048);
        }
        boolean zIsChecked = mVar.isChecked();
        refreshDrawableState();
        checkedTextView.setChecked(zIsChecked);
        checkedTextView.setTypeface(checkedTextView.getTypeface(), (zIsChecked && this.f34326x) ? 1 : 0);
        setEnabled(mVar.isEnabled());
        checkedTextView.setText(mVar.f83261e);
        Drawable icon = mVar.getIcon();
        if (icon != null) {
            int i11 = this.f34324v;
            icon.setBounds(0, 0, i11, i11);
        }
        checkedTextView.setCompoundDrawablesRelative(icon, null, null, null);
        View actionView = mVar.getActionView();
        if (actionView != null) {
            if (this.f34328z == null) {
                this.f34328z = (FrameLayout) ((ViewStub) findViewById(2131427853)).inflate();
            }
            if (actionView.getParent() != null) {
                ((ViewGroup) actionView.getParent()).removeView(actionView);
            }
            this.f34328z.removeAllViews();
            this.f34328z.addView(actionView);
        }
        setContentDescription(mVar.f83271q);
        m2.a(this, mVar.f83272r);
        m mVar2 = this.A;
        if (mVar2.f83261e == null && mVar2.getIcon() == null && this.A.getActionView() != null) {
            checkedTextView.setVisibility(8);
            FrameLayout frameLayout = this.f34328z;
            if (frameLayout != null) {
                j1 j1Var = (j1) frameLayout.getLayoutParams();
                ((LinearLayout.LayoutParams) j1Var).width = -1;
                this.f34328z.setLayoutParams(j1Var);
                return;
            }
            return;
        }
        checkedTextView.setVisibility(0);
        FrameLayout frameLayout2 = this.f34328z;
        if (frameLayout2 != null) {
            j1 j1Var2 = (j1) frameLayout2.getLayoutParams();
            ((LinearLayout.LayoutParams) j1Var2).width = -2;
            this.f34328z.setLayoutParams(j1Var2);
        }
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        Drawable drawable = this.f34318p;
        if (drawable != null) {
            if (this.f34323u) {
                this.f34323u = false;
                int right = getRight() - getLeft();
                int bottom = getBottom() - getTop();
                boolean z11 = this.f34322t;
                Rect rect = this.f34319q;
                if (z11) {
                    rect.set(0, 0, right, bottom);
                } else {
                    rect.set(getPaddingLeft(), getPaddingTop(), right - getPaddingRight(), bottom - getPaddingBottom());
                }
                int i5 = this.f34321s;
                int intrinsicWidth = drawable.getIntrinsicWidth();
                int intrinsicHeight = drawable.getIntrinsicHeight();
                Rect rect2 = this.f34320r;
                Gravity.apply(i5, intrinsicWidth, intrinsicHeight, rect, rect2);
                drawable.setBounds(rect2);
            }
            drawable.draw(canvas);
        }
    }

    @Override // android.view.View
    public final void drawableHotspotChanged(float f11, float f12) {
        super.drawableHotspotChanged(f11, f12);
        Drawable drawable = this.f34318p;
        if (drawable != null) {
            drawable.setHotspot(f11, f12);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.f34318p;
        if (drawable == null || !drawable.isStateful()) {
            return;
        }
        this.f34318p.setState(getDrawableState());
    }

    @Override // android.view.View
    public final Drawable getForeground() {
        return this.f34318p;
    }

    @Override // android.view.View
    public final int getForegroundGravity() {
        return this.f34321s;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        Drawable drawable = this.f34318p;
        if (drawable != null) {
            drawable.jumpToCurrentState();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + 1);
        m mVar = this.A;
        if (mVar != null && mVar.isCheckable() && this.A.isChecked()) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, C);
        }
        return iArrOnCreateDrawableState;
    }

    @Override // r.k1, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        this.f34323u = z11 | this.f34323u;
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        this.f34323u = true;
    }

    @Override // android.view.View
    public final void setForeground(Drawable drawable) {
        Drawable drawable2 = this.f34318p;
        if (drawable2 != drawable) {
            if (drawable2 != null) {
                drawable2.setCallback(null);
                unscheduleDrawable(this.f34318p);
            }
            this.f34318p = drawable;
            this.f34323u = true;
            if (drawable != null) {
                setWillNotDraw(false);
                drawable.setCallback(this);
                if (drawable.isStateful()) {
                    drawable.setState(getDrawableState());
                }
                if (this.f34321s == 119) {
                    drawable.getPadding(new Rect());
                }
            } else {
                setWillNotDraw(true);
            }
            requestLayout();
            invalidate();
        }
    }

    @Override // android.view.View
    public final void setForegroundGravity(int i5) {
        if (this.f34321s != i5) {
            if ((8388615 & i5) == 0) {
                i5 |= 8388611;
            }
            if ((i5 & 112) == 0) {
                i5 |= 48;
            }
            this.f34321s = i5;
            if (i5 == 119 && this.f34318p != null) {
                this.f34318p.getPadding(new Rect());
            }
            requestLayout();
        }
    }

    @Override // android.view.View
    public final boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.f34318p;
    }
}
