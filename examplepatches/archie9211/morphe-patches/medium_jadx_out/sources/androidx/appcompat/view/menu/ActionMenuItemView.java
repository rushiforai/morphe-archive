package androidx.appcompat.view.menu;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Button;
import defpackage.c6;
import defpackage.d6;
import defpackage.ep7;
import defpackage.esa;
import defpackage.i6;
import defpackage.kx7;
import defpackage.lx7;
import defpackage.ny7;
import defpackage.r30;
import defpackage.sx7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ActionMenuItemView extends r30 implements ny7, View.OnClickListener, i6 {
    public sx7 h;
    public CharSequence i;
    public Drawable j;
    public kx7 k;
    public c6 l;
    public d6 m;
    public boolean n;
    public boolean o;
    public final int p;
    public int q;
    public final int r;

    public ActionMenuItemView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        Resources resources = context.getResources();
        this.n = g();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, esa.c, 0, 0);
        this.p = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        this.r = (int) ((resources.getDisplayMetrics().density * 32.0f) + 0.5f);
        setOnClickListener(this);
        this.q = -1;
        setSaveEnabled(false);
    }

    @Override // defpackage.ny7
    public final void a(sx7 sx7Var) {
        this.h = sx7Var;
        setIcon(sx7Var.getIcon());
        setTitle(sx7Var.getTitleCondensed());
        setId(sx7Var.a);
        setVisibility(sx7Var.isVisible() ? 0 : 8);
        setEnabled(sx7Var.isEnabled());
        if (sx7Var.hasSubMenu() && this.l == null) {
            this.l = new c6(this);
        }
    }

    @Override // defpackage.i6
    public final boolean b() {
        return !TextUtils.isEmpty(getText());
    }

    @Override // defpackage.i6
    public final boolean c() {
        return !TextUtils.isEmpty(getText()) && this.h.getIcon() == null;
    }

    public final boolean g() {
        Configuration configuration = getContext().getResources().getConfiguration();
        int i = configuration.screenWidthDp;
        int i2 = configuration.screenHeightDp;
        if (i < 480) {
            return (i >= 640 && i2 >= 480) || configuration.orientation == 2;
        }
        return true;
    }

    @Override // android.widget.TextView, android.view.View
    public CharSequence getAccessibilityClassName() {
        return Button.class.getName();
    }

    @Override // defpackage.ny7
    public sx7 getItemData() {
        return this.h;
    }

    public final void h() {
        boolean z = true;
        boolean z2 = !TextUtils.isEmpty(this.i);
        if (this.j != null && ((this.h.y & 4) != 4 || (!this.n && !this.o))) {
            z = false;
        }
        boolean z3 = z2 & z;
        setText(z3 ? this.i : null);
        CharSequence charSequence = this.h.q;
        if (TextUtils.isEmpty(charSequence)) {
            setContentDescription(z3 ? null : this.h.e);
        } else {
            setContentDescription(charSequence);
        }
        CharSequence charSequence2 = this.h.r;
        if (TextUtils.isEmpty(charSequence2)) {
            ep7.A(this, z3 ? null : this.h.e);
        } else {
            ep7.A(this, charSequence2);
        }
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        kx7 kx7Var = this.k;
        if (kx7Var != null) {
            kx7Var.a(this.h);
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.n = g();
        h();
    }

    @Override // defpackage.r30, android.widget.TextView, android.view.View
    public final void onMeasure(int i, int i2) {
        int i3;
        boolean zIsEmpty = TextUtils.isEmpty(getText());
        if (!zIsEmpty && (i3 = this.q) >= 0) {
            super.setPadding(i3, getPaddingTop(), getPaddingRight(), getPaddingBottom());
        }
        super.onMeasure(i, i2);
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        int measuredWidth = getMeasuredWidth();
        int i4 = this.p;
        int iMin = mode == Integer.MIN_VALUE ? Math.min(size, i4) : i4;
        if (mode != 1073741824 && i4 > 0 && measuredWidth < iMin) {
            super.onMeasure(View.MeasureSpec.makeMeasureSpec(iMin, 1073741824), i2);
        }
        if (!zIsEmpty || this.j == null) {
            return;
        }
        super.setPadding((getMeasuredWidth() - this.j.getBounds().width()) / 2, getPaddingTop(), getPaddingRight(), getPaddingBottom());
    }

    @Override // android.widget.TextView, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        super.onRestoreInstanceState(null);
    }

    @Override // android.widget.TextView, android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        c6 c6Var;
        if (this.h.hasSubMenu() && (c6Var = this.l) != null && c6Var.onTouch(this, motionEvent)) {
            return true;
        }
        return super.onTouchEvent(motionEvent);
    }

    public void setExpandedFormat(boolean z) {
        if (this.o != z) {
            this.o = z;
            sx7 sx7Var = this.h;
            if (sx7Var != null) {
                lx7 lx7Var = sx7Var.n;
                lx7Var.k = true;
                lx7Var.p(true);
            }
        }
    }

    public void setIcon(Drawable drawable) {
        this.j = drawable;
        if (drawable != null) {
            int intrinsicWidth = drawable.getIntrinsicWidth();
            int intrinsicHeight = drawable.getIntrinsicHeight();
            int i = this.r;
            if (intrinsicWidth > i) {
                intrinsicHeight = (int) (intrinsicHeight * (i / intrinsicWidth));
                intrinsicWidth = i;
            }
            if (intrinsicHeight > i) {
                intrinsicWidth = (int) (intrinsicWidth * (i / intrinsicHeight));
            } else {
                i = intrinsicHeight;
            }
            drawable.setBounds(0, 0, intrinsicWidth, i);
        }
        setCompoundDrawables(drawable, null, null, null);
        h();
    }

    public void setItemInvoker(kx7 kx7Var) {
        this.k = kx7Var;
    }

    @Override // android.widget.TextView, android.view.View
    public final void setPadding(int i, int i2, int i3, int i4) {
        this.q = i;
        super.setPadding(i, i2, i3, i4);
    }

    public void setPopupCallback(d6 d6Var) {
        this.m = d6Var;
    }

    public void setTitle(CharSequence charSequence) {
        this.i = charSequence;
        h();
    }

    public void setCheckable(boolean z) {
    }

    public void setChecked(boolean z) {
    }

    public ActionMenuItemView(Context context) {
        this(context, null);
    }
}
