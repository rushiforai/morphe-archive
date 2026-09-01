package defpackage;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Parcelable;
import android.text.Layout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.Checkable;
import android.widget.CompoundButton;
import android.widget.TextView;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class vj7 extends k10 implements Checkable, v4c {
    public static final int[] I = {R.attr.state_checkable};
    public static final int[] J = {R.attr.state_checked};
    public int A;
    public boolean B;
    public int C;
    public int D;
    public int E;
    public uj7 F;
    public float G;
    public float H;
    public final wj7 d;
    public final LinkedHashSet e;
    public PorterDuff.Mode f;
    public ColorStateList g;
    public Drawable h;
    public PorterDuff.Mode i;
    public ColorStateList j;
    public Drawable k;
    public boolean l;
    public String m;
    public int n;
    public int o;
    public int p;
    public int q;
    public int r;
    public int s;
    public boolean t;
    public boolean u;
    public int v;
    public int w;
    public int x;
    public float y;
    public int z;

    /* JADX WARN: Removed duplicated region for block: B:28:0x00f9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public vj7(android.content.Context r17, android.util.AttributeSet r18) {
        /*
            Method dump skipped, instruction units count: 626
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vj7.<init>(android.content.Context, android.util.AttributeSet):void");
    }

    private Layout.Alignment getActualTextAlignment() {
        int textAlignment = getTextAlignment();
        return textAlignment != 1 ? (textAlignment == 6 || textAlignment == 3) ? Layout.Alignment.ALIGN_OPPOSITE : textAlignment != 4 ? Layout.Alignment.ALIGN_NORMAL : Layout.Alignment.ALIGN_CENTER : getGravityTextAlignment();
    }

    private float getDisplayedWidthIncrease() {
        return this.G;
    }

    private Layout.Alignment getGravityTextAlignment() {
        int gravity = getGravity() & 8388615;
        return gravity != 1 ? (gravity == 5 || gravity == 8388613) ? Layout.Alignment.ALIGN_OPPOSITE : Layout.Alignment.ALIGN_NORMAL : Layout.Alignment.ALIGN_CENTER;
    }

    private int getOpticalCenterShift() {
        return 0;
    }

    private int getTextHeight() {
        if (getLineCount() > 1) {
            return getLayout().getHeight();
        }
        TextPaint paint = getPaint();
        String string = getText().toString();
        if (getTransformationMethod() != null) {
            string = getTransformationMethod().getTransformation(string, this).toString();
        }
        Rect rect = new Rect();
        paint.getTextBounds(string, 0, string.length(), rect);
        return Math.min(rect.height(), getLayout().getHeight());
    }

    private int getTextLayoutWidth() {
        int lineCount = getLineCount();
        float fMax = 0.0f;
        for (int i = 0; i < lineCount; i++) {
            fMax = Math.max(fMax, getLayout().getLineWidth(i));
        }
        return (int) Math.ceil(fMax);
    }

    private void setCheckedInternal(boolean z) {
        wj7 wj7Var = this.d;
        if (wj7Var == null || !wj7Var.s || this.t == z) {
            return;
        }
        this.t = z;
        refreshDrawableState();
        getParent();
        if (this.u) {
            return;
        }
        this.u = true;
        Iterator it2 = this.e.iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
        this.u = false;
    }

    private void setDisplayedWidthIncrease(float f) {
        if (this.G != f) {
            this.G = f;
            r();
            invalidate();
            getParent();
        }
    }

    public final boolean a() {
        if (i() && l()) {
            return true;
        }
        if (h() && k()) {
            return true;
        }
        return j() && m();
    }

    public final boolean b(int i) {
        Layout.Alignment actualTextAlignment = getActualTextAlignment();
        return i == 1 || i == 3 || (i == 2 && actualTextAlignment == Layout.Alignment.ALIGN_NORMAL) || (i == 4 && actualTextAlignment == Layout.Alignment.ALIGN_OPPOSITE);
    }

    public final ulc c() {
        Context context = getContext();
        TypedValue typedValueU = sgg.U(context.getTheme(), com.medium.reader.R.attr.motionSpringFastSpatial);
        int[] iArr = ura.k;
        TypedArray typedArrayObtainStyledAttributes = typedValueU == null ? context.obtainStyledAttributes(null, iArr, 0, com.medium.reader.R.style.Motion_Material3_Spring_Standard_Fast_Spatial) : context.obtainStyledAttributes(typedValueU.resourceId, iArr);
        ulc ulcVar = new ulc();
        try {
            float f = typedArrayObtainStyledAttributes.getFloat(1, Float.MIN_VALUE);
            if (f == Float.MIN_VALUE) {
                throw new IllegalArgumentException("A MaterialSpring style must have stiffness value.");
            }
            float f2 = typedArrayObtainStyledAttributes.getFloat(0, Float.MIN_VALUE);
            if (f2 == Float.MIN_VALUE) {
                throw new IllegalArgumentException("A MaterialSpring style must have a damping value.");
            }
            if (f <= 0.0f) {
                throw new IllegalArgumentException("Spring stiffness constant must be positive.");
            }
            ulcVar.a = Math.sqrt(f);
            ulcVar.c = false;
            if (f2 < 0.0f) {
                throw new IllegalArgumentException("Damping ratio must be non-negative");
            }
            ulcVar.b = f2;
            ulcVar.c = false;
            typedArrayObtainStyledAttributes.recycle();
            return ulcVar;
        } catch (Throwable th) {
            typedArrayObtainStyledAttributes.recycle();
            throw th;
        }
    }

    public final int d(int i, int i2) {
        int intrinsicWidth;
        int intrinsicWidth2;
        Drawable drawable = this.h;
        if (drawable != null) {
            intrinsicWidth = this.n;
            if (intrinsicWidth == 0) {
                intrinsicWidth = drawable.getIntrinsicWidth();
            }
        } else {
            intrinsicWidth = 0;
        }
        Drawable drawable2 = this.k;
        if (drawable2 != null) {
            intrinsicWidth2 = this.n;
            if (intrinsicWidth2 == 0) {
                intrinsicWidth2 = drawable2.getIntrinsicWidth();
            }
        } else {
            intrinsicWidth2 = 0;
        }
        int textLayoutWidth = (((((i - getTextLayoutWidth()) - getPaddingEnd()) - intrinsicWidth) - intrinsicWidth2) - this.q) - getPaddingStart();
        if (getActualTextAlignment() == Layout.Alignment.ALIGN_CENTER) {
            textLayoutWidth /= 2;
        }
        return (getLayoutDirection() == 1) != (i2 == 4) ? -textLayoutWidth : textLayoutWidth;
    }

    public final int e(int i, int i2) {
        return Math.max(0, (((((i - getTextHeight()) - getPaddingTop()) - i2) - this.q) - getPaddingBottom()) / 2);
    }

    public final Drawable f(int i) {
        if (i == 0) {
            if (this.k == null || !l()) {
                return null;
            }
            return this.k;
        }
        if (i == 1) {
            if (this.k == null || !m()) {
                return null;
            }
            return this.k;
        }
        if (i == 2 && this.k != null && k()) {
            return this.k;
        }
        return null;
    }

    public final Drawable g(int i) {
        if (i == 0) {
            if (this.h == null || !i()) {
                return null;
            }
            return this.h;
        }
        if (i == 1) {
            if (this.h == null || !h()) {
                return null;
            }
            return this.h;
        }
        if (i == 2 && this.h != null && h()) {
            return this.h;
        }
        return null;
    }

    public String getA11yClassName() {
        if (!TextUtils.isEmpty(this.m)) {
            return this.m;
        }
        wj7 wj7Var = this.d;
        return ((wj7Var == null || !wj7Var.s) ? Button.class : CompoundButton.class).getName();
    }

    public int getAllowedWidthDecrease() {
        return this.D;
    }

    @Override // android.view.View
    public ColorStateList getBackgroundTintList() {
        return getSupportBackgroundTintList();
    }

    @Override // android.view.View
    public PorterDuff.Mode getBackgroundTintMode() {
        return getSupportBackgroundTintMode();
    }

    public int getCornerRadius() {
        if (n()) {
            return this.d.i;
        }
        return 0;
    }

    public ulc getCornerSpringForce() {
        return this.d.c;
    }

    public Drawable getIcon() {
        return this.h;
    }

    public int getIconGravity() {
        return this.v;
    }

    public int getIconPadding() {
        return this.q;
    }

    public int getIconSize() {
        return this.n;
    }

    public ColorStateList getIconTint() {
        return this.g;
    }

    public PorterDuff.Mode getIconTintMode() {
        return this.f;
    }

    public int getInsetBottom() {
        return this.d.h;
    }

    public int getInsetLeft() {
        return this.d.e;
    }

    public int getInsetRight() {
        return this.d.f;
    }

    public int getInsetTop() {
        return this.d.g;
    }

    public ColorStateList getRippleColor() {
        if (n()) {
            return this.d.n;
        }
        return null;
    }

    public Drawable getSecondaryIcon() {
        return this.k;
    }

    public int getSecondaryIconGravity() {
        return this.w;
    }

    public ColorStateList getSecondaryIconTint() {
        return this.j;
    }

    public PorterDuff.Mode getSecondaryIconTintMode() {
        return this.i;
    }

    public n3c getShapeAppearance() {
        if (n()) {
            return this.d.b;
        }
        ygf.f("Attempted to get ShapeAppearance from a MaterialButton which has an overwritten background.");
        return null;
    }

    public p3c getShapeAppearanceModel() {
        if (n()) {
            return this.d.b.c();
        }
        ygf.f("Attempted to get ShapeAppearanceModel from a MaterialButton which has an overwritten background.");
        return null;
    }

    public ColorStateList getStrokeColor() {
        if (n()) {
            return this.d.m;
        }
        return null;
    }

    public int getStrokeWidth() {
        if (n()) {
            return this.d.j;
        }
        return 0;
    }

    @Override // defpackage.k10
    public ColorStateList getSupportBackgroundTintList() {
        return n() ? this.d.l : super.getSupportBackgroundTintList();
    }

    @Override // defpackage.k10
    public PorterDuff.Mode getSupportBackgroundTintMode() {
        return n() ? this.d.k : super.getSupportBackgroundTintMode();
    }

    public final boolean h() {
        int i = this.v;
        return i == 3 || i == 4;
    }

    public final boolean i() {
        int i = this.v;
        return i == 1 || i == 2;
    }

    @Override // android.widget.Checkable
    public final boolean isChecked() {
        return this.t;
    }

    public final boolean j() {
        int i = this.v;
        return i == 16 || i == 32;
    }

    public final boolean k() {
        int i = this.w;
        return i == 3 || i == 4;
    }

    public final boolean l() {
        int i = this.w;
        return i == 1 || i == 2;
    }

    public final boolean m() {
        int i = this.w;
        return i == 16 || i == 32;
    }

    public final boolean n() {
        wj7 wj7Var = this.d;
        return (wj7Var == null || wj7Var.q) ? false : true;
    }

    public final /* synthetic */ void o() {
        this.C = getOpticalCenterShift();
        r();
        invalidate();
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (n()) {
            dk7 dk7VarA = this.d.a(false);
            ow3 ow3Var = dk7VarA.b.b;
            if (ow3Var == null || !ow3Var.a) {
                return;
            }
            float elevation = 0.0f;
            for (ViewParent parent = getParent(); parent instanceof View; parent = parent.getParent()) {
                elevation += ((View) parent).getElevation();
            }
            bk7 bk7Var = dk7VarA.b;
            if (bk7Var.l != elevation) {
                bk7Var.l = elevation;
                dk7VarA.q();
            }
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i) {
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i + 2);
        wj7 wj7Var = this.d;
        if (wj7Var != null && wj7Var.s) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, I);
        }
        if (this.t) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, J);
        }
        return iArrOnCreateDrawableState;
    }

    @Override // defpackage.k10, android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName(getA11yClassName());
        accessibilityEvent.setChecked(this.t);
    }

    @Override // defpackage.k10, android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName(getA11yClassName());
        wj7 wj7Var = this.d;
        accessibilityNodeInfo.setCheckable(wj7Var != null && wj7Var.s);
        accessibilityNodeInfo.setChecked(this.t);
        accessibilityNodeInfo.setClickable(isClickable());
    }

    @Override // defpackage.k10, android.widget.TextView, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        super.onLayout(z, i, i2, i3, i4);
        q(getMeasuredWidth(), getMeasuredHeight());
        t(getMeasuredWidth(), getMeasuredHeight());
        int i6 = getResources().getConfiguration().orientation;
        if (this.x != i6) {
            this.x = i6;
            this.y = -2.1474836E9f;
        }
        if (this.y == -2.1474836E9f) {
            this.y = getMeasuredWidth();
            getParent();
        }
        if (this.D == Integer.MIN_VALUE) {
            if (this.h == null) {
                i5 = 0;
            } else {
                int iconPadding = getIconPadding();
                int intrinsicWidth = this.n;
                if (intrinsicWidth == 0) {
                    intrinsicWidth = this.h.getIntrinsicWidth();
                }
                i5 = iconPadding + intrinsicWidth;
            }
            this.D = (getMeasuredWidth() - getTextLayoutWidth()) - i5;
        }
        if (this.z == Integer.MIN_VALUE) {
            this.z = getPaddingStart();
        }
        if (this.A == Integer.MIN_VALUE) {
            this.A = getPaddingEnd();
        }
        getParent();
    }

    @Override // android.widget.TextView, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof tj7)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        tj7 tj7Var = (tj7) parcelable;
        super.onRestoreInstanceState(tj7Var.a);
        setChecked(tj7Var.c);
    }

    @Override // android.widget.TextView, android.view.View
    public final Parcelable onSaveInstanceState() {
        tj7 tj7Var = new tj7(super.onSaveInstanceState());
        tj7Var.c = this.t;
        return tj7Var;
    }

    @Override // defpackage.k10, android.widget.TextView
    public final void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        super.onTextChanged(charSequence, i, i2, i3);
        q(getMeasuredWidth(), getMeasuredHeight());
        t(getMeasuredWidth(), getMeasuredHeight());
    }

    public final void p(boolean z) {
        Drawable drawable = this.h;
        if (drawable != null) {
            Drawable drawableMutate = drawable.mutate();
            this.h = drawableMutate;
            drawableMutate.setTintList(this.g);
            PorterDuff.Mode mode = this.f;
            if (mode != null) {
                this.h.setTintMode(mode);
            }
            int intrinsicWidth = this.n;
            if (intrinsicWidth == 0) {
                intrinsicWidth = this.h.getIntrinsicWidth();
            }
            int intrinsicHeight = this.n;
            if (intrinsicHeight == 0) {
                intrinsicHeight = this.h.getIntrinsicHeight();
            }
            Drawable drawable2 = this.h;
            int i = this.o;
            int i2 = this.p;
            drawable2.setBounds(i, i2, intrinsicWidth + i, intrinsicHeight + i2);
            this.h.setVisible(true, z);
        }
        if (this.h != null && this.k != null && a()) {
            ay0.e("iconGravity cannot have the same alignment as secondaryIconGravity");
            return;
        }
        if (this.h == null && this.k != null && a()) {
            return;
        }
        Drawable[] compoundDrawablesRelative = getCompoundDrawablesRelative();
        boolean z2 = (i() && compoundDrawablesRelative[0] != this.h) || (h() && compoundDrawablesRelative[2] != this.h) || (j() && compoundDrawablesRelative[1] != this.h);
        if (z || z2) {
            if (i()) {
                setCompoundDrawablesRelative(this.h, f(1), f(2), null);
            } else if (h()) {
                setCompoundDrawablesRelative(f(0), f(1), this.h, null);
            } else if (j()) {
                setCompoundDrawablesRelative(f(0), this.h, f(2), null);
            }
        }
    }

    @Override // android.view.View
    public final boolean performClick() {
        boolean z;
        if (isEnabled() && this.d.t) {
            toggle();
            z = true;
        } else {
            z = false;
        }
        boolean zPerformClick = super.performClick();
        if (z && !zPerformClick) {
            playSoundEffect(0);
        }
        return zPerformClick;
    }

    public final void q(int i, int i2) {
        if (this.h == null || getLayout() == null) {
            return;
        }
        if (i() || h()) {
            this.p = 0;
            if (b(this.v)) {
                this.o = 0;
                p(false);
                return;
            }
            int iD = d(i, this.v);
            if (this.o != iD) {
                this.o = iD;
                p(false);
                return;
            }
            return;
        }
        if (j()) {
            this.o = 0;
            if (this.v == 16) {
                this.p = 0;
                p(false);
                return;
            }
            int intrinsicHeight = this.n;
            if (intrinsicHeight == 0) {
                intrinsicHeight = this.h.getIntrinsicHeight();
            }
            int iE = e(i2, intrinsicHeight);
            if (this.p != iE) {
                this.p = iE;
                p(false);
            }
        }
    }

    public final void r() {
        int i = (int) (this.G - this.H);
        boolean z = getLayoutDirection() == 1;
        int i2 = this.C;
        if (z) {
            i2 = -i2;
        }
        int i3 = (i / 2) + i2;
        if (getLayoutParams() != null) {
            getLayoutParams().width = (int) (this.y + i);
        }
        setPaddingRelative(this.z + i3, getPaddingTop(), (this.A + i) - i3, getPaddingBottom());
    }

    @Override // android.view.View
    public final void refreshDrawableState() {
        super.refreshDrawableState();
        if (this.h != null) {
            if (this.h.setState(getDrawableState())) {
                invalidate();
            }
        }
    }

    public final void s(boolean z) {
        Drawable drawable = this.k;
        if (drawable != null) {
            Drawable drawableMutate = drawable.mutate();
            this.k = drawableMutate;
            drawableMutate.setTintList(this.j);
            PorterDuff.Mode mode = this.i;
            if (mode != null) {
                this.k.setTintMode(mode);
            }
            int intrinsicWidth = this.n;
            if (intrinsicWidth == 0) {
                intrinsicWidth = this.k.getIntrinsicWidth();
            }
            int intrinsicHeight = this.n;
            if (intrinsicHeight == 0) {
                intrinsicHeight = this.k.getIntrinsicHeight();
            }
            Drawable drawable2 = this.k;
            int i = this.r;
            int i2 = this.s;
            drawable2.setBounds(i, i2, intrinsicWidth + i, intrinsicHeight + i2);
            this.k.setVisible(true, z);
        }
        if (this.k != null && this.h != null && a()) {
            ay0.e("secondaryIconGravity cannot have the same alignment as iconGravity");
            return;
        }
        if (this.k == null) {
            if (this.l) {
                return;
            }
            if (this.h != null && a()) {
                return;
            }
        }
        Drawable[] compoundDrawablesRelative = getCompoundDrawablesRelative();
        boolean z2 = (l() && compoundDrawablesRelative[0] != this.k) || (k() && compoundDrawablesRelative[2] != this.k) || (m() && compoundDrawablesRelative[1] != this.k);
        if (z || z2) {
            if (l()) {
                setCompoundDrawablesRelative(this.k, g(1), g(2), null);
            } else if (k()) {
                setCompoundDrawablesRelative(g(0), g(1), this.k, null);
            } else if (m()) {
                setCompoundDrawablesRelative(g(0), this.k, g(2), null);
            }
        }
    }

    public void setA11yClassName(String str) {
        this.m = str;
    }

    @Override // android.view.View
    public void setBackground(Drawable drawable) {
        setBackgroundDrawable(drawable);
    }

    @Override // android.view.View
    public void setBackgroundColor(int i) {
        if (!n()) {
            super.setBackgroundColor(i);
            return;
        }
        wj7 wj7Var = this.d;
        if (wj7Var.a(false) != null) {
            wj7Var.a(false).setTint(i);
        }
    }

    @Override // defpackage.k10, android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        if (!n()) {
            super.setBackgroundDrawable(drawable);
            return;
        }
        if (drawable == getBackground()) {
            getBackground().setState(drawable.getState());
            return;
        }
        Log.w("MaterialButton", "MaterialButton manages its own background to control elevation, shape, color and states. Consider using backgroundTint, shapeAppearance and other attributes where available. A custom background will ignore these attributes and you should consider handling interaction states such as pressed, focused and disabled");
        wj7 wj7Var = this.d;
        wj7Var.q = true;
        vj7 vj7Var = wj7Var.a;
        vj7Var.setSupportBackgroundTintList(wj7Var.l);
        vj7Var.setSupportBackgroundTintMode(wj7Var.k);
        super.setBackgroundDrawable(drawable);
    }

    @Override // defpackage.k10, android.view.View
    public void setBackgroundResource(int i) {
        setBackgroundDrawable(i != 0 ? guc.E(getContext(), i) : null);
    }

    @Override // android.view.View
    public void setBackgroundTintList(ColorStateList colorStateList) {
        setSupportBackgroundTintList(colorStateList);
    }

    @Override // android.view.View
    public void setBackgroundTintMode(PorterDuff.Mode mode) {
        setSupportBackgroundTintMode(mode);
    }

    public void setCheckable(boolean z) {
        if (n()) {
            this.d.s = z;
        }
    }

    @Override // android.widget.Checkable
    public void setChecked(boolean z) {
        setCheckedInternal(z);
    }

    @Override // android.widget.TextView
    public void setCompoundDrawablePadding(int i) {
        if (getCompoundDrawablePadding() != i) {
            this.y = -2.1474836E9f;
        }
        super.setCompoundDrawablePadding(i);
    }

    public void setCornerRadius(int i) {
        if (n()) {
            wj7 wj7Var = this.d;
            if (wj7Var.r && wj7Var.i == i) {
                return;
            }
            wj7Var.i = i;
            wj7Var.r = true;
            wj7Var.b = wj7Var.b.a(i);
            wj7Var.d();
        }
    }

    public void setCornerRadiusResource(int i) {
        if (n()) {
            setCornerRadius(getResources().getDimensionPixelSize(i));
        }
    }

    public void setCornerSpringForce(ulc ulcVar) {
        wj7 wj7Var = this.d;
        wj7Var.c = ulcVar;
        if (wj7Var.b instanceof zpc) {
            wj7Var.d();
        }
    }

    public void setDisplayedWidthDecrease(int i) {
        this.H = Math.min(i, this.D);
        r();
        invalidate();
    }

    @Override // android.view.View
    public void setElevation(float f) {
        super.setElevation(f);
        if (n()) {
            this.d.a(false).k(f);
        }
    }

    public void setIcon(Drawable drawable) {
        if (this.h != drawable) {
            this.y = -2.1474836E9f;
            this.h = drawable;
            p(true);
            q(getMeasuredWidth(), getMeasuredHeight());
        }
    }

    public void setIconGravity(int i) {
        if (this.v != i) {
            if (this.h != null && this.k != null && a()) {
                ay0.e("iconGravity cannot have the same alignment as secondaryIconGravity");
            } else {
                this.v = i;
                q(getMeasuredWidth(), getMeasuredHeight());
            }
        }
    }

    public void setIconPadding(int i) {
        if (this.q != i) {
            this.q = i;
            setCompoundDrawablePadding(i);
        }
    }

    public void setIconResource(int i) {
        setIcon(i != 0 ? guc.E(getContext(), i) : null);
    }

    public void setIconSize(int i) {
        if (i < 0) {
            ay0.e("iconSize cannot be less than 0");
        } else if (this.n != i) {
            this.y = -2.1474836E9f;
            this.n = i;
            p(true);
            s(true);
        }
    }

    public void setIconTint(ColorStateList colorStateList) {
        if (this.g != colorStateList) {
            this.g = colorStateList;
            p(false);
        }
    }

    public void setIconTintMode(PorterDuff.Mode mode) {
        if (this.f != mode) {
            this.f = mode;
            p(false);
        }
    }

    public void setIconTintResource(int i) {
        setIconTint(nm.l(getContext(), i));
    }

    public void setInsetBottom(int i) {
        wj7 wj7Var = this.d;
        wj7Var.b(wj7Var.e, wj7Var.g, wj7Var.f, i);
    }

    public void setInsetLeft(int i) {
        wj7 wj7Var = this.d;
        wj7Var.b(i, wj7Var.g, wj7Var.f, wj7Var.h);
    }

    public void setInsetRight(int i) {
        wj7 wj7Var = this.d;
        wj7Var.b(wj7Var.e, wj7Var.g, i, wj7Var.h);
    }

    public void setInsetTop(int i) {
        wj7 wj7Var = this.d;
        wj7Var.b(wj7Var.e, i, wj7Var.f, wj7Var.h);
    }

    public void setInternalBackground(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
    }

    public void setOpticalCenterEnabled(boolean z) {
        if (this.B != z) {
            this.B = z;
            wj7 wj7Var = this.d;
            if (z) {
                f70 f70Var = new f70(27, this);
                wj7Var.d = f70Var;
                dk7 dk7VarA = wj7Var.a(false);
                if (dk7VarA != null) {
                    dk7VarA.D = f70Var;
                }
            } else {
                wj7Var.d = null;
                dk7 dk7VarA2 = wj7Var.a(false);
                if (dk7VarA2 != null) {
                    dk7VarA2.D = null;
                }
            }
            post(new v0(29, this));
        }
    }

    @Override // android.view.View
    public void setPressed(boolean z) {
        super.setPressed(z);
    }

    public void setRippleColor(ColorStateList colorStateList) {
        if (n()) {
            wj7 wj7Var = this.d;
            vj7 vj7Var = wj7Var.a;
            if (wj7Var.n != colorStateList) {
                wj7Var.n = colorStateList;
                if (vj7Var.getBackground() instanceof RippleDrawable) {
                    ((RippleDrawable) vj7Var.getBackground()).setColor(ukb.a(colorStateList));
                }
            }
        }
    }

    public void setRippleColorResource(int i) {
        if (n()) {
            setRippleColor(nm.l(getContext(), i));
        }
    }

    public void setSecondaryIcon(Drawable drawable) {
        if (this.k != drawable) {
            this.y = -2.1474836E9f;
            this.k = drawable;
            this.l = false;
            s(true);
            t(getMeasuredWidth(), getMeasuredHeight());
        }
    }

    public void setSecondaryIconGravity(int i) {
        if (this.w != i) {
            if (this.k != null && this.h != null && a()) {
                ay0.e("secondaryIconGravity cannot have the same alignment as iconGravity");
            } else {
                this.w = i;
                t(getMeasuredWidth(), getMeasuredHeight());
            }
        }
    }

    public void setSecondaryIconResource(int i) {
        setSecondaryIcon(i != 0 ? guc.E(getContext(), i) : null);
    }

    public void setSecondaryIconTint(ColorStateList colorStateList) {
        if (this.j != colorStateList) {
            this.j = colorStateList;
            s(false);
        }
    }

    public void setSecondaryIconTintMode(PorterDuff.Mode mode) {
        if (this.i != mode) {
            this.i = mode;
            s(false);
        }
    }

    public void setSecondaryIconTintResource(int i) {
        setSecondaryIconTint(nm.l(getContext(), i));
    }

    public void setShapeAppearance(n3c n3cVar) {
        if (!n()) {
            ygf.f("Attempted to set ShapeAppearance on a MaterialButton which has an overwritten background.");
            return;
        }
        wj7 wj7Var = this.d;
        if (wj7Var.c == null && n3cVar.d()) {
            wj7Var.c = c();
            if (wj7Var.b instanceof zpc) {
                wj7Var.d();
            }
        }
        wj7Var.b = n3cVar;
        wj7Var.d();
    }

    @Override // defpackage.v4c
    public void setShapeAppearanceModel(p3c p3cVar) {
        if (!n()) {
            ygf.f("Attempted to set ShapeAppearanceModel on a MaterialButton which has an overwritten background.");
            return;
        }
        wj7 wj7Var = this.d;
        wj7Var.b = p3cVar;
        wj7Var.d();
    }

    public void setShouldDrawSurfaceColorStroke(boolean z) {
        if (n()) {
            wj7 wj7Var = this.d;
            wj7Var.p = z;
            wj7Var.e();
        }
    }

    public void setStrokeColor(ColorStateList colorStateList) {
        if (n()) {
            wj7 wj7Var = this.d;
            if (wj7Var.m != colorStateList) {
                wj7Var.m = colorStateList;
                wj7Var.e();
            }
        }
    }

    public void setStrokeColorResource(int i) {
        if (n()) {
            setStrokeColor(nm.l(getContext(), i));
        }
    }

    public void setStrokeWidth(int i) {
        if (n()) {
            wj7 wj7Var = this.d;
            if (wj7Var.j != i) {
                wj7Var.j = i;
                wj7Var.e();
            }
        }
    }

    public void setStrokeWidthResource(int i) {
        if (n()) {
            setStrokeWidth(getResources().getDimensionPixelSize(i));
        }
    }

    @Override // defpackage.k10
    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        if (!n()) {
            super.setSupportBackgroundTintList(colorStateList);
            return;
        }
        wj7 wj7Var = this.d;
        if (wj7Var.l != colorStateList) {
            wj7Var.l = colorStateList;
            if (wj7Var.a(false) != null) {
                wj7Var.a(false).setTintList(wj7Var.l);
            }
        }
    }

    @Override // defpackage.k10
    public void setSupportBackgroundTintMode(PorterDuff.Mode mode) {
        if (!n()) {
            super.setSupportBackgroundTintMode(mode);
            return;
        }
        wj7 wj7Var = this.d;
        if (wj7Var.k != mode) {
            wj7Var.k = mode;
            if (wj7Var.a(false) == null || wj7Var.k == null) {
                return;
            }
            wj7Var.a(false).setTintMode(wj7Var.k);
        }
    }

    @Override // android.widget.TextView
    public final void setText(CharSequence charSequence, TextView.BufferType bufferType) {
        this.y = -2.1474836E9f;
        super.setText(charSequence, bufferType);
    }

    @Override // android.view.View
    public void setTextAlignment(int i) {
        super.setTextAlignment(i);
        q(getMeasuredWidth(), getMeasuredHeight());
        t(getMeasuredWidth(), getMeasuredHeight());
    }

    @Override // defpackage.k10, android.widget.TextView
    public final void setTextAppearance(Context context, int i) {
        this.y = -2.1474836E9f;
        super.setTextAppearance(context, i);
    }

    @Override // defpackage.k10, android.widget.TextView
    public final void setTextSize(int i, float f) {
        this.y = -2.1474836E9f;
        super.setTextSize(i, f);
    }

    public void setToggleCheckedStateOnClick(boolean z) {
        this.d.t = z;
    }

    @Override // android.widget.TextView
    public void setWidth(int i) {
        this.y = -2.1474836E9f;
        super.setWidth(i);
    }

    public void setWidthChangeDirection(uj7 uj7Var) {
        if (this.F != uj7Var) {
            this.F = uj7Var;
        }
    }

    public void setWidthChangeMax(int i) {
        if (this.E != i) {
            this.E = i;
        }
    }

    public final void t(int i, int i2) {
        if (this.k == null || getLayout() == null) {
            return;
        }
        if (l() || k()) {
            this.s = 0;
            if (b(this.w)) {
                this.r = 0;
                s(false);
                return;
            }
            int iD = d(i, this.w);
            if (this.r != iD) {
                this.r = iD;
                s(false);
                return;
            }
            return;
        }
        if (m()) {
            this.r = 0;
            if (this.w == 16) {
                this.s = 0;
                s(false);
                return;
            }
            int intrinsicHeight = this.n;
            if (intrinsicHeight == 0) {
                intrinsicHeight = this.k.getIntrinsicHeight();
            }
            int iE = e(i2, intrinsicHeight);
            if (this.s != iE) {
                this.s = iE;
                s(false);
            }
        }
    }

    @Override // android.widget.Checkable
    public final void toggle() {
        setChecked(!this.t);
    }

    public void setOnPressedChangeListenerInternal(sj7 sj7Var) {
    }

    public void setSizeChange(aqc aqcVar) {
    }
}
