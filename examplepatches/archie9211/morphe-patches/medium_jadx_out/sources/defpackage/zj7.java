package defpackage;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Canvas;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.AnimatedStateListDrawable;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Xml;
import android.view.View;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.autofill.AutofillManager;
import android.widget.CompoundButton;
import com.medium.reader.R;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedHashSet;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zj7 extends m10 {
    public final LinkedHashSet e;
    public final LinkedHashSet f;
    public ColorStateList g;
    public boolean h;
    public boolean i;
    public boolean j;
    public CharSequence k;
    public Drawable l;
    public Drawable m;
    public boolean n;
    public ColorStateList o;
    public ColorStateList p;
    public PorterDuff.Mode q;
    public int r;
    public int[] s;
    public boolean t;
    public CharSequence u;
    public CompoundButton.OnCheckedChangeListener v;
    public final fw w;
    public final xj7 x;
    public static final int[] y = {R.attr.state_indeterminate};
    public static final int[] z = {R.attr.state_error};
    public static final int[][] A = {new int[]{android.R.attr.state_enabled, R.attr.state_error}, new int[]{android.R.attr.state_enabled, android.R.attr.state_checked}, new int[]{android.R.attr.state_enabled, -16842912}, new int[]{-16842910, android.R.attr.state_checked}, new int[]{-16842910, -16842912}};
    public static final int B = Resources.getSystem().getIdentifier("btn_check_material_anim", "drawable", "android");

    public zj7(Context context, AttributeSet attributeSet) throws Throwable {
        fw fwVar;
        int next;
        ColorStateList colorStateList;
        int resourceId;
        ColorStateList colorStateList2;
        int resourceId2;
        int resourceId3;
        int resourceId4;
        int resourceId5;
        super(yi2.U(context, attributeSet, R.attr.checkboxStyle, R.style.Widget_MaterialComponents_CompoundButton_CheckBox, new int[0]), attributeSet);
        this.e = new LinkedHashSet();
        this.f = new LinkedHashSet();
        Context context2 = getContext();
        if (Build.VERSION.SDK_INT >= 24) {
            fwVar = new fw(context2, 0);
            Resources resources = context2.getResources();
            Resources.Theme theme = context2.getTheme();
            ThreadLocal threadLocal = wcb.a;
            Drawable drawable = resources.getDrawable(R.drawable.mtrl_checkbox_button_checked_unchecked, theme);
            drawable.setCallback(fwVar.f);
            new dw(drawable.getConstantState());
            fwVar.a = drawable;
        } else {
            int i = fw.g;
            try {
                XmlResourceParser xml = context2.getResources().getXml(R.drawable.mtrl_checkbox_button_checked_unchecked);
                AttributeSet attributeSetAsAttributeSet = Xml.asAttributeSet(xml);
                do {
                    next = xml.next();
                    if (next == 2) {
                        break;
                    }
                } while (next != 1);
                if (next != 2) {
                    throw new XmlPullParserException("No start tag found");
                }
                Resources resources2 = context2.getResources();
                Resources.Theme theme2 = context2.getTheme();
                fw fwVar2 = new fw(context2, 0);
                fwVar2.inflate(resources2, xml, attributeSetAsAttributeSet, theme2);
                fwVar = fwVar2;
            } catch (IOException e) {
                Log.e("AnimatedVDCompat", "parser error", e);
                fwVar = null;
            } catch (XmlPullParserException e2) {
                Log.e("AnimatedVDCompat", "parser error", e2);
                fwVar = null;
            }
        }
        this.w = fwVar;
        this.x = new xj7(this);
        Context context3 = getContext();
        this.l = getButtonDrawable();
        this.o = getSuperButtonTintList();
        setSupportButtonTintList(null);
        kng.h(context3, attributeSet, R.attr.checkboxStyle, R.style.Widget_MaterialComponents_CompoundButton_CheckBox);
        int[] iArr = ura.h;
        kng.i(context3, attributeSet, iArr, R.attr.checkboxStyle, R.style.Widget_MaterialComponents_CompoundButton_CheckBox, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context3.obtainStyledAttributes(attributeSet, iArr, R.attr.checkboxStyle, R.style.Widget_MaterialComponents_CompoundButton_CheckBox);
        this.m = (!typedArrayObtainStyledAttributes.hasValue(2) || (resourceId5 = typedArrayObtainStyledAttributes.getResourceId(2, 0)) == 0) ? typedArrayObtainStyledAttributes.getDrawable(2) : guc.E(context3, resourceId5);
        if (this.l != null && sgg.V(context3.getTheme(), R.attr.isMaterial3Theme, false)) {
            int resourceId6 = typedArrayObtainStyledAttributes.getResourceId(0, 0);
            int resourceId7 = typedArrayObtainStyledAttributes.getResourceId(1, 0);
            if (resourceId6 == B && resourceId7 == 0) {
                super.setButtonDrawable((Drawable) null);
                this.l = guc.E(context3, R.drawable.mtrl_checkbox_button);
                this.n = true;
                if (this.m == null) {
                    this.m = guc.E(context3, R.drawable.mtrl_checkbox_button_icon);
                }
            }
        }
        if ((!typedArrayObtainStyledAttributes.hasValue(3) || (resourceId4 = typedArrayObtainStyledAttributes.getResourceId(3, 0)) == 0 || (colorStateList = nm.l(context3, resourceId4)) == null) && (!typedArrayObtainStyledAttributes.hasValue(3) || (resourceId = typedArrayObtainStyledAttributes.getResourceId(3, 0)) == 0 || (colorStateList = nm.l(context3, resourceId)) == null)) {
            colorStateList = typedArrayObtainStyledAttributes.getColorStateList(3);
        }
        this.p = colorStateList;
        int i2 = typedArrayObtainStyledAttributes.getInt(4, -1);
        PorterDuff.Mode mode = PorterDuff.Mode.SRC_IN;
        this.q = kp7.r(i2);
        this.h = typedArrayObtainStyledAttributes.getBoolean(11, false);
        this.i = typedArrayObtainStyledAttributes.getBoolean(6, true);
        this.j = typedArrayObtainStyledAttributes.getBoolean(9, false);
        this.k = typedArrayObtainStyledAttributes.getText(8);
        if (typedArrayObtainStyledAttributes.hasValue(7)) {
            setCheckedState(typedArrayObtainStyledAttributes.getInt(7, 0));
        }
        if (typedArrayObtainStyledAttributes.hasValue(10)) {
            if ((!typedArrayObtainStyledAttributes.hasValue(10) || (resourceId3 = typedArrayObtainStyledAttributes.getResourceId(10, 0)) == 0 || (colorStateList2 = nm.l(context3, resourceId3)) == null) && (!typedArrayObtainStyledAttributes.hasValue(10) || (resourceId2 = typedArrayObtainStyledAttributes.getResourceId(10, 0)) == 0 || (colorStateList2 = nm.l(context3, resourceId2)) == null)) {
                colorStateList2 = typedArrayObtainStyledAttributes.getColorStateList(10);
            }
            setRippleColor(colorStateList2);
        }
        typedArrayObtainStyledAttributes.recycle();
        a();
    }

    private String getButtonStateDescription() {
        int i = this.r;
        return i == 1 ? getResources().getString(R.string.mtrl_checkbox_state_description_checked) : i == 0 ? getResources().getString(R.string.mtrl_checkbox_state_description_unchecked) : getResources().getString(R.string.mtrl_checkbox_state_description_indeterminate);
    }

    private ColorStateList getMaterialThemeColorsTintList() {
        ColorStateList colorStateList = this.g;
        if (colorStateList != null) {
            return colorStateList;
        }
        int iC = hlg.C(this, R.attr.colorControlActivated);
        int iC2 = hlg.C(this, R.attr.colorError);
        int iC3 = hlg.C(this, R.attr.colorSurface);
        int iC4 = hlg.C(this, R.attr.colorOnSurface);
        ColorStateList colorStateList2 = new ColorStateList(A, new int[]{hlg.G(1.0f, iC3, iC2), hlg.G(1.0f, iC3, iC), hlg.G(0.54f, iC3, iC4), hlg.G(0.38f, iC3, iC4), hlg.G(0.38f, iC3, iC4)});
        this.g = colorStateList2;
        return colorStateList2;
    }

    private ColorStateList getSuperButtonTintList() {
        ColorStateList colorStateList = this.o;
        return colorStateList != null ? colorStateList : super.getButtonTintList() != null ? super.getButtonTintList() : getSupportButtonTintList();
    }

    private void setRippleColor(ColorStateList colorStateList) {
        if (colorStateList == null) {
            return;
        }
        Drawable background = getBackground();
        if (background instanceof DrawableWrapper) {
            background = ((DrawableWrapper) background).getDrawable();
        }
        if (background instanceof RippleDrawable) {
            ((RippleDrawable) background).setColor(colorStateList);
        }
    }

    public final void a() {
        ColorStateList colorStateList;
        ColorStateList colorStateList2;
        v5 v5Var;
        Drawable drawableMutate = this.l;
        ColorStateList colorStateList3 = this.o;
        PorterDuff.Mode buttonTintMode = getButtonTintMode();
        if (drawableMutate == null) {
            drawableMutate = null;
        } else if (colorStateList3 != null) {
            drawableMutate = drawableMutate.mutate();
            if (buttonTintMode != null) {
                drawableMutate.setTintMode(buttonTintMode);
            }
        }
        this.l = drawableMutate;
        Drawable drawableMutate2 = this.m;
        ColorStateList colorStateList4 = this.p;
        PorterDuff.Mode mode = this.q;
        if (drawableMutate2 == null) {
            drawableMutate2 = null;
        } else if (colorStateList4 != null) {
            drawableMutate2 = drawableMutate2.mutate();
            if (mode != null) {
                drawableMutate2.setTintMode(mode);
            }
        }
        this.m = drawableMutate2;
        if (this.n) {
            fw fwVar = this.w;
            if (fwVar != null) {
                cw cwVar = fwVar.b;
                xj7 xj7Var = this.x;
                if (xj7Var != null) {
                    Drawable drawable = fwVar.a;
                    if (drawable != null) {
                        AnimatedVectorDrawable animatedVectorDrawable = (AnimatedVectorDrawable) drawable;
                        mu muVar = xj7Var.a;
                        if (muVar == null) {
                            muVar = new mu(xj7Var);
                            xj7Var.a = muVar;
                        }
                        ew.c(animatedVectorDrawable, muVar);
                    }
                    ArrayList arrayList = fwVar.e;
                    if (arrayList != null) {
                        arrayList.remove(xj7Var);
                        if (fwVar.e.size() == 0 && (v5Var = fwVar.d) != null) {
                            cwVar.b.removeListener(v5Var);
                            fwVar.d = null;
                        }
                    }
                }
                if (xj7Var != null) {
                    Drawable drawable2 = fwVar.a;
                    if (drawable2 != null) {
                        AnimatedVectorDrawable animatedVectorDrawable2 = (AnimatedVectorDrawable) drawable2;
                        mu muVar2 = xj7Var.a;
                        if (muVar2 == null) {
                            muVar2 = new mu(xj7Var);
                            xj7Var.a = muVar2;
                        }
                        ew.b(animatedVectorDrawable2, muVar2);
                    } else {
                        ArrayList arrayList2 = fwVar.e;
                        if (arrayList2 == null) {
                            arrayList2 = new ArrayList();
                            fwVar.e = arrayList2;
                        }
                        if (!arrayList2.contains(xj7Var)) {
                            fwVar.e.add(xj7Var);
                            v5 v5Var2 = fwVar.d;
                            if (v5Var2 == null) {
                                v5Var2 = new v5(1, fwVar);
                                fwVar.d = v5Var2;
                            }
                            cwVar.b.addListener(v5Var2);
                        }
                    }
                }
            }
            if (Build.VERSION.SDK_INT >= 24) {
                Drawable drawable3 = this.l;
                if ((drawable3 instanceof AnimatedStateListDrawable) && fwVar != null) {
                    ((AnimatedStateListDrawable) drawable3).addTransition(R.id.checked, R.id.unchecked, fwVar, false);
                    ((AnimatedStateListDrawable) this.l).addTransition(R.id.indeterminate, R.id.unchecked, fwVar, false);
                }
            }
        }
        Drawable drawable4 = this.l;
        if (drawable4 != null && (colorStateList2 = this.o) != null) {
            drawable4.setTintList(colorStateList2);
        }
        Drawable drawable5 = this.m;
        if (drawable5 != null && (colorStateList = this.p) != null) {
            drawable5.setTintList(colorStateList);
        }
        Drawable drawable6 = this.l;
        Drawable drawable7 = this.m;
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
                float f = intrinsicWidth / intrinsicHeight;
                if (f >= drawable6.getIntrinsicWidth() / drawable6.getIntrinsicHeight()) {
                    int intrinsicWidth2 = drawable6.getIntrinsicWidth();
                    intrinsicHeight = (int) (intrinsicWidth2 / f);
                    intrinsicWidth = intrinsicWidth2;
                } else {
                    intrinsicHeight = drawable6.getIntrinsicHeight();
                    intrinsicWidth = (int) (f * intrinsicHeight);
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

    @Override // android.widget.CompoundButton
    public Drawable getButtonDrawable() {
        return this.l;
    }

    public Drawable getButtonIconDrawable() {
        return this.m;
    }

    public ColorStateList getButtonIconTintList() {
        return this.p;
    }

    public PorterDuff.Mode getButtonIconTintMode() {
        return this.q;
    }

    @Override // android.widget.CompoundButton
    public ColorStateList getButtonTintList() {
        return this.o;
    }

    public int getCheckedState() {
        return this.r;
    }

    public CharSequence getErrorAccessibilityLabel() {
        return this.k;
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final boolean isChecked() {
        return this.r == 1;
    }

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.h && this.o == null && this.p == null) {
            setUseMaterialThemeColors(true);
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final int[] onCreateDrawableState(int i) {
        int[] iArrCopyOf;
        int[] iArrOnCreateDrawableState = super.onCreateDrawableState(i + 2);
        if (getCheckedState() == 2) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, y);
        }
        if (this.j) {
            View.mergeDrawableStates(iArrOnCreateDrawableState, z);
        }
        int i2 = 0;
        while (true) {
            if (i2 >= iArrOnCreateDrawableState.length) {
                iArrCopyOf = Arrays.copyOf(iArrOnCreateDrawableState, iArrOnCreateDrawableState.length + 1);
                iArrCopyOf[iArrOnCreateDrawableState.length] = 16842912;
                break;
            }
            int i3 = iArrOnCreateDrawableState[i2];
            if (i3 == 16842912) {
                iArrCopyOf = iArrOnCreateDrawableState;
                break;
            }
            if (i3 == 0) {
                iArrCopyOf = (int[]) iArrOnCreateDrawableState.clone();
                iArrCopyOf[i2] = 16842912;
                break;
            }
            i2++;
        }
        this.s = iArrCopyOf;
        return iArrOnCreateDrawableState;
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        Drawable buttonDrawable;
        if (!this.i || !TextUtils.isEmpty(getText()) || (buttonDrawable = getButtonDrawable()) == null) {
            super.onDraw(canvas);
            return;
        }
        int width = ((getWidth() - buttonDrawable.getIntrinsicWidth()) / 2) * (getLayoutDirection() == 1 ? -1 : 1);
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
        if (accessibilityNodeInfo != null && this.j) {
            accessibilityNodeInfo.setText(((Object) accessibilityNodeInfo.getText()) + ", " + ((Object) this.k));
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof yj7)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        yj7 yj7Var = (yj7) parcelable;
        super.onRestoreInstanceState(yj7Var.getSuperState());
        setCheckedState(yj7Var.a);
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final Parcelable onSaveInstanceState() {
        yj7 yj7Var = new yj7(super.onSaveInstanceState());
        yj7Var.a = getCheckedState();
        return yj7Var;
    }

    @Override // defpackage.m10, android.widget.CompoundButton
    public void setButtonDrawable(int i) {
        setButtonDrawable(guc.E(getContext(), i));
    }

    public void setButtonIconDrawable(Drawable drawable) {
        this.m = drawable;
        a();
    }

    public void setButtonIconDrawableResource(int i) {
        setButtonIconDrawable(guc.E(getContext(), i));
    }

    public void setButtonIconTintList(ColorStateList colorStateList) {
        if (this.p == colorStateList) {
            return;
        }
        this.p = colorStateList;
        a();
    }

    public void setButtonIconTintMode(PorterDuff.Mode mode) {
        if (this.q == mode) {
            return;
        }
        this.q = mode;
        a();
    }

    @Override // android.widget.CompoundButton
    public void setButtonTintList(ColorStateList colorStateList) {
        if (this.o == colorStateList) {
            return;
        }
        this.o = colorStateList;
        a();
    }

    @Override // android.widget.CompoundButton
    public void setButtonTintMode(PorterDuff.Mode mode) {
        setSupportButtonTintMode(mode);
        a();
    }

    public void setCenterIfNoTextEnabled(boolean z2) {
        this.i = z2;
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public void setChecked(boolean z2) {
        setCheckedState(z2 ? 1 : 0);
    }

    public void setCheckedState(int i) {
        AutofillManager autofillManagerE;
        CompoundButton.OnCheckedChangeListener onCheckedChangeListener;
        if (this.r != i) {
            this.r = i;
            super.setChecked(i == 1);
            refreshDrawableState();
            int i2 = Build.VERSION.SDK_INT;
            if (i2 >= 30 && this.u == null) {
                super.setStateDescription(getButtonStateDescription());
            }
            if (this.t) {
                return;
            }
            this.t = true;
            LinkedHashSet linkedHashSet = this.f;
            if (linkedHashSet != null) {
                Iterator it2 = linkedHashSet.iterator();
                if (it2.hasNext()) {
                    throw ev6.q(it2);
                }
            }
            if (this.r != 2 && (onCheckedChangeListener = this.v) != null) {
                onCheckedChangeListener.onCheckedChanged(this, isChecked());
            }
            if (i2 >= 26 && (autofillManagerE = mm.e(getContext().getSystemService(mm.f()))) != null) {
                autofillManagerE.notifyValueChanged(this);
            }
            this.t = false;
        }
    }

    public void setErrorAccessibilityLabel(CharSequence charSequence) {
        this.k = charSequence;
    }

    public void setErrorAccessibilityLabelResource(int i) {
        setErrorAccessibilityLabel(i != 0 ? getResources().getText(i) : null);
    }

    public void setErrorShown(boolean z2) {
        if (this.j == z2) {
            return;
        }
        this.j = z2;
        refreshDrawableState();
        Iterator it2 = this.e.iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
    }

    @Override // android.widget.CompoundButton
    public void setOnCheckedChangeListener(CompoundButton.OnCheckedChangeListener onCheckedChangeListener) {
        this.v = onCheckedChangeListener;
    }

    @Override // android.widget.CompoundButton, android.view.View
    public void setStateDescription(CharSequence charSequence) {
        this.u = charSequence;
        if (charSequence != null) {
            super.setStateDescription(charSequence);
        } else {
            if (Build.VERSION.SDK_INT < 30 || charSequence != null) {
                return;
            }
            super.setStateDescription(getButtonStateDescription());
        }
    }

    public void setUseMaterialThemeColors(boolean z2) {
        this.h = z2;
        if (z2) {
            setButtonTintList(getMaterialThemeColorsTintList());
        } else {
            setButtonTintList(null);
        }
    }

    @Override // android.widget.CompoundButton, android.widget.Checkable
    public final void toggle() {
        setChecked(!isChecked());
    }

    @Override // defpackage.m10, android.widget.CompoundButton
    public void setButtonDrawable(Drawable drawable) {
        this.l = drawable;
        this.n = false;
        a();
    }
}
