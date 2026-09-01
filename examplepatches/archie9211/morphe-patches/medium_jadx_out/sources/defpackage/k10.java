package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class k10 extends Button implements lmd {
    public final e8 a;
    public final n30 b;
    public m20 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k10(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        imd.a(context);
        wkd.a(this, getContext());
        e8 e8Var = new e8(this);
        this.a = e8Var;
        e8Var.k(attributeSet, i);
        n30 n30Var = new n30(this);
        this.b = n30Var;
        n30Var.f(attributeSet, i);
        n30Var.b();
        getEmojiTextViewHelper().a(attributeSet, i);
    }

    private m20 getEmojiTextViewHelper() {
        m20 m20Var = this.c;
        if (m20Var != null) {
            return m20Var;
        }
        m20 m20Var2 = new m20(this);
        this.c = m20Var2;
        return m20Var2;
    }

    @Override // android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.a();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.b();
        }
    }

    @Override // android.widget.TextView
    public int getAutoSizeMaxTextSize() {
        if (bwe.c) {
            return super.getAutoSizeMaxTextSize();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            return Math.round(n30Var.i.e);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int getAutoSizeMinTextSize() {
        if (bwe.c) {
            return super.getAutoSizeMinTextSize();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            return Math.round(n30Var.i.d);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int getAutoSizeStepGranularity() {
        if (bwe.c) {
            return super.getAutoSizeStepGranularity();
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            return Math.round(n30Var.i.c);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public int[] getAutoSizeTextAvailableSizes() {
        if (bwe.c) {
            return super.getAutoSizeTextAvailableSizes();
        }
        n30 n30Var = this.b;
        return n30Var != null ? n30Var.i.f : new int[0];
    }

    @Override // android.widget.TextView
    public int getAutoSizeTextType() {
        if (bwe.c) {
            return super.getAutoSizeTextType() == 1 ? 1 : 0;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            return n30Var.i.a;
        }
        return 0;
    }

    @Override // android.widget.TextView
    public ActionMode.Callback getCustomSelectionActionModeCallback() {
        return vn7.h0(super.getCustomSelectionActionModeCallback());
    }

    public ColorStateList getSupportBackgroundTintList() {
        e8 e8Var = this.a;
        if (e8Var != null) {
            return e8Var.h();
        }
        return null;
    }

    public PorterDuff.Mode getSupportBackgroundTintMode() {
        e8 e8Var = this.a;
        if (e8Var != null) {
            return e8Var.i();
        }
        return null;
    }

    public ColorStateList getSupportCompoundDrawablesTintList() {
        return this.b.d();
    }

    public PorterDuff.Mode getSupportCompoundDrawablesTintMode() {
        return this.b.e();
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        accessibilityEvent.setClassName(Button.class.getName());
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setClassName(Button.class.getName());
    }

    @Override // android.widget.TextView, android.view.View
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        n30 n30Var = this.b;
        if (n30Var == null || bwe.c) {
            return;
        }
        n30Var.i.a();
    }

    @Override // android.widget.TextView
    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        super.onTextChanged(charSequence, i, i2, i3);
        n30 n30Var = this.b;
        if (n30Var != null) {
            w30 w30Var = n30Var.i;
            if (bwe.c || !w30Var.f()) {
                return;
            }
            w30Var.a();
        }
    }

    @Override // android.widget.TextView
    public void setAllCaps(boolean z) {
        super.setAllCaps(z);
        getEmojiTextViewHelper().b(z);
    }

    @Override // android.widget.TextView
    public final void setAutoSizeTextTypeUniformWithConfiguration(int i, int i2, int i3, int i4) {
        if (bwe.c) {
            super.setAutoSizeTextTypeUniformWithConfiguration(i, i2, i3, i4);
            return;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.h(i, i2, i3, i4);
        }
    }

    @Override // android.widget.TextView
    public final void setAutoSizeTextTypeUniformWithPresetSizes(int[] iArr, int i) {
        if (bwe.c) {
            super.setAutoSizeTextTypeUniformWithPresetSizes(iArr, i);
            return;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.i(iArr, i);
        }
    }

    @Override // android.widget.TextView
    public void setAutoSizeTextTypeWithDefaults(int i) {
        if (bwe.c) {
            super.setAutoSizeTextTypeWithDefaults(i);
            return;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.j(i);
        }
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.m();
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int i) {
        super.setBackgroundResource(i);
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.n(i);
        }
    }

    @Override // android.widget.TextView
    public void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(vn7.k0(callback, this));
    }

    public void setEmojiCompatEnabled(boolean z) {
        getEmojiTextViewHelper().c(z);
    }

    @Override // android.widget.TextView
    public void setFilters(InputFilter[] inputFilterArr) {
        super.setFilters(((xz5) getEmojiTextViewHelper().b.b).T(inputFilterArr));
    }

    public void setSupportAllCaps(boolean z) {
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.a.setAllCaps(z);
        }
    }

    public void setSupportBackgroundTintList(ColorStateList colorStateList) {
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.s(colorStateList);
        }
    }

    public void setSupportBackgroundTintMode(PorterDuff.Mode mode) {
        e8 e8Var = this.a;
        if (e8Var != null) {
            e8Var.t(mode);
        }
    }

    @Override // defpackage.lmd
    public void setSupportCompoundDrawablesTintList(ColorStateList colorStateList) {
        n30 n30Var = this.b;
        n30Var.k(colorStateList);
        n30Var.b();
    }

    @Override // defpackage.lmd
    public void setSupportCompoundDrawablesTintMode(PorterDuff.Mode mode) {
        n30 n30Var = this.b;
        n30Var.l(mode);
        n30Var.b();
    }

    @Override // android.widget.TextView
    public void setTextAppearance(Context context, int i) {
        super.setTextAppearance(context, i);
        n30 n30Var = this.b;
        if (n30Var != null) {
            n30Var.g(context, i);
        }
    }

    @Override // android.widget.TextView
    public void setTextSize(int i, float f) {
        boolean z = bwe.c;
        if (z) {
            super.setTextSize(i, f);
            return;
        }
        n30 n30Var = this.b;
        if (n30Var != null) {
            w30 w30Var = n30Var.i;
            if (z || w30Var.f()) {
                return;
            }
            w30Var.g(i, f);
        }
    }
}
