package androidx.appcompat.widget;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.InputFilter;
import android.util.AttributeSet;
import android.view.ActionMode;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import java.lang.reflect.InvocationTargetException;
import r.c2;
import r.d2;
import r.m;
import r.n0;
import r.p2;
import r.r;
import r.v0;

/* loaded from: classes2.dex */
public class AppCompatButton extends Button implements e5.b {

    /* renamed from: a, reason: collision with root package name */
    public final m f13754a;

    /* renamed from: b, reason: collision with root package name */
    public final n0 f13755b;

    /* renamed from: c, reason: collision with root package name */
    public r f13756c;

    public AppCompatButton(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 2130968804);
    }

    @Override // android.widget.TextView, android.view.View
    public final void drawableStateChanged() {
        super.drawableStateChanged();
        m mVar = this.f13754a;
        if (mVar != null) {
            mVar.a();
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            n0Var.b();
        }
    }

    @Override // android.widget.TextView
    public final int getAutoSizeMaxTextSize() {
        if (p2.f84840c) {
            return super.getAutoSizeMaxTextSize();
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            return Math.round(n0Var.f84822i.f84894e);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public final int getAutoSizeMinTextSize() {
        if (p2.f84840c) {
            return super.getAutoSizeMinTextSize();
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            return Math.round(n0Var.f84822i.f84893d);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public final int getAutoSizeStepGranularity() {
        if (p2.f84840c) {
            return super.getAutoSizeStepGranularity();
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            return Math.round(n0Var.f84822i.f84892c);
        }
        return -1;
    }

    @Override // android.widget.TextView
    public final int[] getAutoSizeTextAvailableSizes() {
        if (p2.f84840c) {
            return super.getAutoSizeTextAvailableSizes();
        }
        n0 n0Var = this.f13755b;
        return n0Var != null ? n0Var.f84822i.f84895f : new int[0];
    }

    @Override // android.widget.TextView
    public final int getAutoSizeTextType() {
        if (p2.f84840c) {
            return super.getAutoSizeTextType() == 1 ? 1 : 0;
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            return n0Var.f84822i.f84890a;
        }
        return 0;
    }

    @Override // android.widget.TextView
    public final ActionMode.Callback getCustomSelectionActionModeCallback() {
        return android.support.v4.media.session.b.p0(super.getCustomSelectionActionModeCallback());
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
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        n0 n0Var = this.f13755b;
        if (n0Var == null || p2.f84840c) {
            return;
        }
        n0Var.f84822i.a();
    }

    @Override // android.widget.TextView
    public void onTextChanged(CharSequence charSequence, int i5, int i11, int i12) {
        super.onTextChanged(charSequence, i5, i11, i12);
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            v0 v0Var = n0Var.f84822i;
            if (p2.f84840c || !v0Var.f()) {
                return;
            }
            v0Var.a();
        }
    }

    @Override // android.widget.TextView
    public final void setAllCaps(boolean z11) {
        super.setAllCaps(z11);
        if (this.f13756c == null) {
            this.f13756c = new r(this);
        }
        this.f13756c.c(z11);
    }

    @Override // android.widget.TextView, e5.b
    public final void setAutoSizeTextTypeUniformWithConfiguration(int i5, int i11, int i12, int i13) {
        if (p2.f84840c) {
            super.setAutoSizeTextTypeUniformWithConfiguration(i5, i11, i12, i13);
            return;
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            n0Var.f(i5, i11, i12, i13);
        }
    }

    @Override // android.widget.TextView
    public final void setAutoSizeTextTypeUniformWithPresetSizes(int[] iArr, int i5) {
        if (p2.f84840c) {
            super.setAutoSizeTextTypeUniformWithPresetSizes(iArr, i5);
            return;
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            n0Var.g(iArr, i5);
        }
    }

    @Override // android.widget.TextView
    public final void setAutoSizeTextTypeWithDefaults(int i5) {
        if (p2.f84840c) {
            super.setAutoSizeTextTypeWithDefaults(i5);
            return;
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            n0Var.h(i5);
        }
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable drawable) {
        super.setBackgroundDrawable(drawable);
        m mVar = this.f13754a;
        if (mVar != null) {
            mVar.e();
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int i5) {
        super.setBackgroundResource(i5);
        m mVar = this.f13754a;
        if (mVar != null) {
            mVar.f(i5);
        }
    }

    @Override // android.widget.TextView
    public final void setCustomSelectionActionModeCallback(ActionMode.Callback callback) {
        super.setCustomSelectionActionModeCallback(android.support.v4.media.session.b.q0(callback, this));
    }

    @Override // android.widget.TextView
    public final void setFilters(InputFilter[] inputFilterArr) {
        if (this.f13756c == null) {
            this.f13756c = new r(this);
        }
        super.setFilters(this.f13756c.a(inputFilterArr));
    }

    @Override // android.widget.TextView
    public final void setTextAppearance(Context context, int i5) {
        super.setTextAppearance(context, i5);
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            n0Var.e(context, i5);
        }
    }

    @Override // android.widget.TextView
    public final void setTextSize(int i5, float f11) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        boolean z11 = p2.f84840c;
        if (z11) {
            super.setTextSize(i5, f11);
            return;
        }
        n0 n0Var = this.f13755b;
        if (n0Var != null) {
            v0 v0Var = n0Var.f84822i;
            if (z11 || v0Var.f()) {
                return;
            }
            v0Var.g(f11, i5);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AppCompatButton(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        d2.a(context);
        c2.a(getContext(), this);
        m mVar = new m(this);
        this.f13754a = mVar;
        mVar.d(attributeSet, i5);
        n0 n0Var = new n0(this);
        this.f13755b = n0Var;
        n0Var.d(attributeSet, i5);
        n0Var.b();
        if (this.f13756c == null) {
            this.f13756c = new r(this);
        }
        this.f13756c.b(attributeSet, i5);
    }
}
