package fk;

import android.accessibilityservice.AccessibilityServiceInfo;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityManager;
import android.widget.AdapterView;
import android.widget.ListAdapter;
import com.google.android.material.textfield.TextInputLayout;
import java.util.List;
import java.util.Locale;
import ps.f0;
import r.t1;

/* loaded from: classes3.dex */
public final class s extends r.l {

    /* renamed from: e, reason: collision with root package name */
    public final t1 f55258e;

    /* renamed from: f, reason: collision with root package name */
    public final AccessibilityManager f55259f;

    /* renamed from: g, reason: collision with root package name */
    public final Rect f55260g;

    /* renamed from: h, reason: collision with root package name */
    public final float f55261h;

    /* renamed from: i, reason: collision with root package name */
    public final ColorStateList f55262i;

    /* renamed from: j, reason: collision with root package name */
    public final int f55263j;

    /* renamed from: k, reason: collision with root package name */
    public final ColorStateList f55264k;

    public s(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(hk.a.a(context, attributeSet, 2130968704, 0), attributeSet);
        this.f55260g = new Rect();
        Context context2 = getContext();
        TypedArray typedArrayF = tj.i.f(context2, attributeSet, bj.a.f17929r, 2130968704, 2132083690, new int[0]);
        if (typedArrayF.hasValue(0) && typedArrayF.getInt(0, 0) == 0) {
            setKeyListener(null);
        }
        int resourceId = typedArrayF.getResourceId(3, 2131624238);
        this.f55261h = typedArrayF.getDimensionPixelOffset(1, 2131166171);
        if (typedArrayF.hasValue(2)) {
            this.f55262i = ColorStateList.valueOf(typedArrayF.getColor(2, 0));
        }
        this.f55263j = typedArrayF.getColor(4, 0);
        this.f55264k = f0.m(context2, typedArrayF, 5);
        this.f55259f = (AccessibilityManager) context2.getSystemService("accessibility");
        t1 t1Var = new t1(context2, null, 2130969542, 0);
        this.f55258e = t1Var;
        t1Var.p();
        t1Var.o = this;
        t1Var.o();
        t1Var.j(getAdapter());
        t1Var.f84873p = new q(this, 0);
        if (typedArrayF.hasValue(6)) {
            setAdapter(new r(this, getContext(), resourceId, getResources().getStringArray(typedArrayF.getResourceId(6, 0))));
        }
        typedArrayF.recycle();
    }

    public static void a(s sVar, Object obj) {
        sVar.setText(sVar.convertSelectionToString(obj), false);
    }

    public final TextInputLayout b() {
        for (ViewParent parent = getParent(); parent != null; parent = parent.getParent()) {
            if (parent instanceof TextInputLayout) {
                return (TextInputLayout) parent;
            }
        }
        return null;
    }

    public final boolean c() {
        List<AccessibilityServiceInfo> enabledAccessibilityServiceList;
        AccessibilityManager accessibilityManager = this.f55259f;
        if (accessibilityManager != null && accessibilityManager.isTouchExplorationEnabled()) {
            return true;
        }
        if (accessibilityManager == null || !accessibilityManager.isEnabled() || (enabledAccessibilityServiceList = accessibilityManager.getEnabledAccessibilityServiceList(16)) == null) {
            return false;
        }
        for (AccessibilityServiceInfo accessibilityServiceInfo : enabledAccessibilityServiceList) {
            if (accessibilityServiceInfo.getSettingsActivityName() != null && accessibilityServiceInfo.getSettingsActivityName().contains("SwitchAccess")) {
                return true;
            }
        }
        return false;
    }

    @Override // android.widget.AutoCompleteTextView
    public final void dismissDropDown() {
        if (c()) {
            this.f55258e.dismiss();
        } else {
            super.dismissDropDown();
        }
    }

    @Override // android.widget.TextView
    public final CharSequence getHint() {
        TextInputLayout textInputLayoutB = b();
        if (textInputLayoutB == null || !textInputLayoutB.E) {
            return super.getHint();
        }
        if (textInputLayoutB.C) {
            return textInputLayoutB.D;
        }
        return null;
    }

    @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        TextInputLayout textInputLayoutB = b();
        if (textInputLayoutB != null && textInputLayoutB.E && super.getHint() == null) {
            String str = Build.MANUFACTURER;
            if ((str != null ? str.toLowerCase(Locale.ENGLISH) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).equals("meizu")) {
                setHint(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
            }
        }
    }

    @Override // android.widget.AutoCompleteTextView, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.f55258e.dismiss();
    }

    @Override // android.widget.TextView, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        if (View.MeasureSpec.getMode(i5) == Integer.MIN_VALUE) {
            int measuredWidth = getMeasuredWidth();
            ListAdapter adapter = getAdapter();
            TextInputLayout textInputLayoutB = b();
            int measuredWidth2 = 0;
            if (adapter != null && textInputLayoutB != null) {
                int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 0);
                int iMakeMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 0);
                t1 t1Var = this.f55258e;
                int iMin = Math.min(adapter.getCount(), Math.max(0, !t1Var.f84883z.isShowing() ? -1 : t1Var.f84862c.getSelectedItemPosition()) + 15);
                View view = null;
                int iMax = 0;
                for (int iMax2 = Math.max(0, iMin - 15); iMax2 < iMin; iMax2++) {
                    int itemViewType = adapter.getItemViewType(iMax2);
                    if (itemViewType != measuredWidth2) {
                        view = null;
                        measuredWidth2 = itemViewType;
                    }
                    view = adapter.getView(iMax2, view, textInputLayoutB);
                    if (view.getLayoutParams() == null) {
                        view.setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
                    }
                    view.measure(iMakeMeasureSpec, iMakeMeasureSpec2);
                    iMax = Math.max(iMax, view.getMeasuredWidth());
                }
                Drawable background = t1Var.f84883z.getBackground();
                if (background != null) {
                    Rect rect = this.f55260g;
                    background.getPadding(rect);
                    iMax += rect.left + rect.right;
                }
                measuredWidth2 = textInputLayoutB.f34367c.f55208f.getMeasuredWidth() + iMax;
            }
            setMeasuredDimension(Math.min(Math.max(measuredWidth, measuredWidth2), View.MeasureSpec.getSize(i5)), getMeasuredHeight());
        }
    }

    @Override // android.widget.AutoCompleteTextView, android.widget.TextView, android.view.View
    public final void onWindowFocusChanged(boolean z11) {
        if (c()) {
            return;
        }
        super.onWindowFocusChanged(z11);
    }

    @Override // android.widget.AutoCompleteTextView
    public final void setAdapter(ListAdapter listAdapter) {
        super.setAdapter(listAdapter);
        this.f55258e.j(getAdapter());
    }

    @Override // android.widget.AutoCompleteTextView
    public final void setDropDownBackgroundDrawable(Drawable drawable) {
        super.setDropDownBackgroundDrawable(drawable);
        t1 t1Var = this.f55258e;
        if (t1Var != null) {
            t1Var.l(drawable);
        }
    }

    @Override // android.widget.AutoCompleteTextView
    public final void setOnItemSelectedListener(AdapterView.OnItemSelectedListener onItemSelectedListener) {
        super.setOnItemSelectedListener(onItemSelectedListener);
        this.f55258e.f84874q = getOnItemSelectedListener();
    }

    @Override // android.widget.TextView
    public final void setRawInputType(int i5) {
        super.setRawInputType(i5);
        TextInputLayout textInputLayoutB = b();
        if (textInputLayoutB != null) {
            textInputLayoutB.B();
        }
    }

    @Override // android.widget.AutoCompleteTextView
    public final void showDropDown() {
        if (c()) {
            this.f55258e.show();
        } else {
            super.showDropDown();
        }
    }
}
