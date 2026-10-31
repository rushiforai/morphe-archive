package com.google.android.material.checkbox;

import aa.i0;
import ai.v0;
import android.animation.AnimatorSet;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.AnimatedStateListDrawable;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.autofill.AutofillManager;
import android.widget.CompoundButton;
import b.u4;
import com.google.android.gms.internal.consent_sdk.k0;
import e10.z2;
import j7.c;
import j7.d;
import j7.e;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import ps.e0;
import ps.f0;
import q4.k;
import r.n;
import tj.i;
import x7.u;

/* loaded from: classes3.dex */
public final class b extends n {

    /* renamed from: e, reason: collision with root package name */
    public final LinkedHashSet f34154e;

    /* renamed from: f, reason: collision with root package name */
    public ColorStateList f34155f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f34156g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f34157h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f34158i;

    /* renamed from: j, reason: collision with root package name */
    public final CharSequence f34159j;

    /* renamed from: k, reason: collision with root package name */
    public Drawable f34160k;

    /* renamed from: l, reason: collision with root package name */
    public Drawable f34161l;

    /* renamed from: m, reason: collision with root package name */
    public boolean f34162m;
    public ColorStateList n;
    public final ColorStateList o;

    /* renamed from: p, reason: collision with root package name */
    public final PorterDuff.Mode f34163p;

    /* renamed from: q, reason: collision with root package name */
    public int f34164q;

    /* renamed from: r, reason: collision with root package name */
    public int[] f34165r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f34166s;

    /* renamed from: t, reason: collision with root package name */
    public CharSequence f34167t;

    /* renamed from: u, reason: collision with root package name */
    public CompoundButton.OnCheckedChangeListener f34168u;

    /* renamed from: v, reason: collision with root package name */
    public final e f34169v;

    /* renamed from: w, reason: collision with root package name */
    public final wj.b f34170w;

    /* renamed from: x, reason: collision with root package name */
    public static final int[] f34151x = {2130970039};

    /* renamed from: y, reason: collision with root package name */
    public static final int[] f34152y = {2130970037};

    /* renamed from: z, reason: collision with root package name */
    public static final int[][] f34153z = {new int[]{16842910, 2130970037}, new int[]{16842910, 16842912}, new int[]{16842910, -16842912}, new int[]{-16842910, 16842912}, new int[]{-16842910, -16842912}};
    public static final int A = Resources.getSystem().getIdentifier("btn_check_material_anim", "drawable", "android");

    public b(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(hk.a.a(context, attributeSet, 2130968863, 2132083982), attributeSet, 2130968863);
        new LinkedHashSet();
        this.f34154e = new LinkedHashSet();
        Context context2 = getContext();
        e eVar = new e(context2, 0);
        Resources resources = context2.getResources();
        Resources.Theme theme = context2.getTheme();
        ThreadLocal threadLocal = k.f83638a;
        Drawable drawable = resources.getDrawable(2131231985, theme);
        eVar.f69087a = drawable;
        drawable.setCallback(eVar.f69086f);
        new d(eVar.f69087a.getConstantState(), 0);
        this.f34169v = eVar;
        this.f34170w = new wj.b(this, 2);
        Context context3 = getContext();
        this.f34160k = this.f34160k;
        ColorStateList colorStateList = this.n;
        this.n = colorStateList == null ? super.getButtonTintList() != null ? super.getButtonTintList() : null : colorStateList;
        v0 v0Var = this.f84810a;
        if (v0Var != null) {
            v0Var.f13372a = true;
            v0Var.a();
        }
        i.a(context3, attributeSet, 2130968863, 2132083982);
        int[] iArr = bj.a.f17935x;
        i.b(context3, attributeSet, iArr, 2130968863, 2132083982, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context3.obtainStyledAttributes(attributeSet, iArr, 2130968863, 2132083982);
        u uVar = new u(context3, typedArrayObtainStyledAttributes);
        this.f34161l = uVar.l(2);
        if (this.f34160k != null && e0.v(false, context3, 2130969381)) {
            int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
            int resourceId2 = typedArrayObtainStyledAttributes.getResourceId(1, 0);
            if (resourceId == A && resourceId2 == 0) {
                super.setButtonDrawable((Drawable) null);
                this.f34160k = z2.b0(context3, 2131231984);
                this.f34162m = true;
                if (this.f34161l == null) {
                    this.f34161l = z2.b0(context3, 2131231986);
                }
            }
        }
        this.o = f0.n(context3, uVar, 3);
        this.f34163p = i.g(typedArrayObtainStyledAttributes.getInt(4, -1), PorterDuff.Mode.SRC_IN);
        this.f34156g = typedArrayObtainStyledAttributes.getBoolean(10, false);
        this.f34157h = typedArrayObtainStyledAttributes.getBoolean(6, true);
        this.f34158i = typedArrayObtainStyledAttributes.getBoolean(9, false);
        this.f34159j = typedArrayObtainStyledAttributes.getText(8);
        if (typedArrayObtainStyledAttributes.hasValue(7)) {
            b(typedArrayObtainStyledAttributes.getInt(7, 0));
        }
        uVar.s();
        a();
    }

    public final void a() {
        ColorStateList colorStateList;
        i0 i0Var;
        Drawable drawableMutate = this.f34160k;
        ColorStateList colorStateList2 = this.n;
        PorterDuff.Mode buttonTintMode = getButtonTintMode();
        if (drawableMutate == null) {
            drawableMutate = null;
        } else if (colorStateList2 != null) {
            drawableMutate = drawableMutate.mutate();
            if (buttonTintMode != null) {
                drawableMutate.setTintMode(buttonTintMode);
            }
        }
        this.f34160k = drawableMutate;
        Drawable drawableMutate2 = this.f34161l;
        ColorStateList colorStateList3 = this.o;
        if (drawableMutate2 == null) {
            drawableMutate2 = null;
        } else if (colorStateList3 != null) {
            drawableMutate2 = drawableMutate2.mutate();
            PorterDuff.Mode mode = this.f34163p;
            if (mode != null) {
                drawableMutate2.setTintMode(mode);
            }
        }
        this.f34161l = drawableMutate2;
        if (this.f34162m) {
            e eVar = this.f34169v;
            if (eVar != null) {
                c cVar = eVar.f69082b;
                Drawable drawable = eVar.f69087a;
                wj.b bVar = this.f34170w;
                if (drawable != null) {
                    AnimatedVectorDrawable animatedVectorDrawable = (AnimatedVectorDrawable) drawable;
                    if (bVar.f94399a == null) {
                        bVar.f94399a = new j7.b(bVar);
                    }
                    animatedVectorDrawable.unregisterAnimationCallback(bVar.f94399a);
                }
                ArrayList arrayList = eVar.f69085e;
                if (arrayList != null && bVar != null) {
                    arrayList.remove(bVar);
                    if (eVar.f69085e.size() == 0 && (i0Var = eVar.f69084d) != null) {
                        ((AnimatorSet) cVar.f69077c).removeListener(i0Var);
                        eVar.f69084d = null;
                    }
                }
                Drawable drawable2 = eVar.f69087a;
                if (drawable2 != null) {
                    AnimatedVectorDrawable animatedVectorDrawable2 = (AnimatedVectorDrawable) drawable2;
                    if (bVar.f94399a == null) {
                        bVar.f94399a = new j7.b(bVar);
                    }
                    animatedVectorDrawable2.registerAnimationCallback(bVar.f94399a);
                } else if (bVar != null) {
                    if (eVar.f69085e == null) {
                        eVar.f69085e = new ArrayList();
                    }
                    if (!eVar.f69085e.contains(bVar)) {
                        eVar.f69085e.add(bVar);
                        if (eVar.f69084d == null) {
                            eVar.f69084d = new i0(eVar, 10);
                        }
                        ((AnimatorSet) cVar.f69077c).addListener(eVar.f69084d);
                    }
                }
            }
            Drawable drawable3 = this.f34160k;
            if ((drawable3 instanceof AnimatedStateListDrawable) && eVar != null) {
                ((AnimatedStateListDrawable) drawable3).addTransition(2131427668, 2131429084, eVar, false);
                ((AnimatedStateListDrawable) this.f34160k).addTransition(2131428226, 2131429084, eVar, false);
            }
        }
        Drawable drawable4 = this.f34160k;
        if (drawable4 != null && (colorStateList = this.n) != null) {
            drawable4.setTintList(colorStateList);
        }
        Drawable drawable5 = this.f34161l;
        if (drawable5 != null && colorStateList3 != null) {
            drawable5.setTintList(colorStateList3);
        }
        Drawable drawable6 = this.f34160k;
        Drawable drawable7 = this.f34161l;
        if (drawable6 == null) {
            drawable6 = drawable7;
        } else if (drawable7 != null) {
            int intrinsicWidth = drawable7.getIntrinsicWidth();
            if (intrinsicWidth == -1) {
                intrinsicWidth = drawable6.getIntrinsicWidth();
            }
            int intrinsicHeight = drawable7.getIntrinsicHeight();
            if (intrinsicHeight == -1) {
                intrinsicHeight = drawable6.getIntrinsicHeight();
            }
            if (intrinsicWidth > drawable6.getIntrinsicWidth() || intrinsicHeight > drawable6.getIntrinsicHeight()) {
                float f11 = intrinsicWidth / intrinsicHeight;
                if (f11 >= drawable6.getIntrinsicWidth() / drawable6.getIntrinsicHeight()) {
                    int intrinsicWidth2 = drawable6.getIntrinsicWidth();
                    intrinsicHeight = (int) (intrinsicWidth2 / f11);
                    intrinsicWidth = intrinsicWidth2;
                } else {
                    intrinsicHeight = drawable6.getIntrinsicHeight();
                    intrinsicWidth = (int) (f11 * intrinsicHeight);
                }
            }
            LayerDrawable layerDrawable = new LayerDrawable(new Drawable[]{drawable6, drawable7});
            layerDrawable.setLayerSize(1, intrinsicWidth, intrinsicHeight);
            layerDrawable.setLayerGravity(1, 17);
            drawable6 = layerDrawable;
        }
        super.setButtonDrawable(drawable6);
        refreshDrawableState();
    }

    public final void b(int i5) {
        CompoundButton.OnCheckedChangeListener onCheckedChangeListener;
        if (this.f34164q != i5) {
            this.f34164q = i5;
            super.setChecked(i5 == 1);
            refreshDrawableState();
            d();
            if (this.f34166s) {
                return;
            }
            this.f34166s = true;
            LinkedHashSet linkedHashSet = this.f34154e;
            if (linkedHashSet != null) {
                Iterator it = linkedHashSet.iterator();
                if (it.hasNext()) {
                    throw u4.e(it);
                }
            }
            if (this.f34164q != 2 && (onCheckedChangeListener = this.f34168u) != null) {
                onCheckedChangeListener.onCheckedChanged(this, isChecked());
            }
            AutofillManager autofillManager = (AutofillManager) getContext().getSystemService(AutofillManager.class);
            if (autofillManager != null) {
                autofillManager.notifyValueChanged(this);
            }
            this.f34166s = false;
        }
    }

    public final void d() {
        if (Build.VERSION.SDK_INT < 30 || this.f34167t != null) {
            return;
        }
        int i5 = this.f34164q;
        super.setStateDescription(i5 == 1 ? getResources().getString(2132018664) : i5 == 0 ? getResources().getString(2132018666) : getResources().getString(2132018665));
    }

    @Override // android.widget.CompoundButton
    public final Drawable getButtonDrawable() {
        return this.f34160k;
    }

    @Override // android.widget.CompoundButton
    public final ColorStateList getButtonTintList() {
        return this.n;
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final boolean isChecked() {
        return this.f34164q == 1;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.f34156g && this.n == null && this.o == null) {
            this.f34156g = true;
            if (this.f34155f == null) {
                int iM = k0.m(2130968934, this);
                int iM2 = k0.m(2130968938, this);
                int iM3 = k0.m(2130968977, this);
                int iM4 = k0.m(2130968954, this);
                this.f34155f = new ColorStateList(f34153z, new int[]{k0.v(1.0f, iM3, iM2), k0.v(1.0f, iM3, iM), k0.v(0.54f, iM3, iM4), k0.v(0.38f, iM3, iM4), k0.v(0.38f, iM3, iM4)});
            }
            setButtonTintList(this.f34155f);
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i5) {
        int[] iArrCopyOf;
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i5 + 2);
        if (this.f34164q == 2) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, f34151x);
        }
        if (this.f34158i) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, f34152y);
        }
        int i11 = 0;
        while (true) {
            if (i11 >= iArrOnCreateDrawableState.length) {
                iArrCopyOf = Arrays.copyOf(iArrOnCreateDrawableState, iArrOnCreateDrawableState.length + 1);
                iArrCopyOf[iArrOnCreateDrawableState.length] = 16842912;
                break;
            }
            int i12 = iArrOnCreateDrawableState[i11];
            if (i12 == 16842912) {
                iArrCopyOf = iArrOnCreateDrawableState;
                break;
            }
            if (i12 == 0) {
                iArrCopyOf = (int[]) iArrOnCreateDrawableState.clone();
                iArrCopyOf[i11] = 16842912;
                break;
            }
            i11++;
        }
        this.f34165r = iArrCopyOf;
        return iArrOnCreateDrawableState;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        Drawable buttonDrawable;
        if (!this.f34157h || !TextUtils.isEmpty(getText()) || (buttonDrawable = getButtonDrawable()) == null) {
            super.onDraw(canvas);
            return;
        }
        int width = ((getWidth() - buttonDrawable.getIntrinsicWidth()) / 2) * (i.e(this) ? -1 : 1);
        int iSave = canvas.save();
        canvas.translate(width, 0.0f);
        super.onDraw(canvas);
        canvas.restoreToCount(iSave);
        if (getBackground() != null) {
            Rect bounds = buttonDrawable.getBounds();
            getBackground().setHotspotBounds(bounds.left + width, bounds.top, bounds.right + width, bounds.bottom);
        }
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        if (accessibilityNodeInfo != null && this.f34158i) {
            accessibilityNodeInfo.setText(((Object) accessibilityNodeInfo.getText()) + ", " + ((Object) this.f34159j));
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof MaterialCheckBox$SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        MaterialCheckBox$SavedState materialCheckBox$SavedState = (MaterialCheckBox$SavedState) parcelable;
        super.onRestoreInstanceState(materialCheckBox$SavedState.getSuperState());
        b(materialCheckBox$SavedState.f34150a);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final Parcelable onSaveInstanceState() {
        MaterialCheckBox$SavedState materialCheckBox$SavedState = new MaterialCheckBox$SavedState(super.onSaveInstanceState());
        materialCheckBox$SavedState.f34150a = this.f34164q;
        return materialCheckBox$SavedState;
    }

    @Override // r.n, android.widget.CompoundButton
    public final void setButtonDrawable(int i5) {
        setButtonDrawable(z2.b0(getContext(), i5));
    }

    @Override // android.widget.CompoundButton
    public final void setButtonTintList(ColorStateList colorStateList) {
        if (this.n == colorStateList) {
            return;
        }
        this.n = colorStateList;
        a();
    }

    @Override // android.widget.CompoundButton
    public final void setButtonTintMode(PorterDuff.Mode mode) {
        v0 v0Var = this.f84810a;
        if (v0Var != null) {
            v0Var.f13376e = mode;
            v0Var.f13373b = true;
            v0Var.a();
        }
        a();
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void setChecked(boolean z11) {
        b(z11 ? 1 : 0);
    }

    @Override // android.widget.CompoundButton
    public final void setOnCheckedChangeListener(CompoundButton.OnCheckedChangeListener onCheckedChangeListener) {
        this.f34168u = onCheckedChangeListener;
    }

    @Override // android.widget.CompoundButton, android.view.View
    public final void setStateDescription(CharSequence charSequence) {
        this.f34167t = charSequence;
        if (charSequence == null) {
            d();
        } else {
            super.setStateDescription(charSequence);
        }
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void toggle() {
        b(!isChecked() ? 1 : 0);
    }

    @Override // r.n, android.widget.CompoundButton
    public final void setButtonDrawable(Drawable drawable) {
        this.f34160k = drawable;
        this.f34162m = false;
        a();
    }
}
