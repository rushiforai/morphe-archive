package defpackage;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableWrapper;
import android.graphics.drawable.RippleDrawable;
import android.util.AttributeSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ak7 extends q20 {
    public static final int[][] g = {new int[]{R.attr.state_enabled, R.attr.state_checked}, new int[]{R.attr.state_enabled, -16842912}, new int[]{-16842910, R.attr.state_checked}, new int[]{-16842910, -16842912}};
    public ColorStateList e;
    public boolean f;

    public ak7(Context context, AttributeSet attributeSet) {
        super(yi2.U(context, attributeSet, com.medium.reader.R.attr.radioButtonStyle, com.medium.reader.R.style.Widget_MaterialComponents_CompoundButton_RadioButton, new int[0]), attributeSet);
        Context context2 = getContext();
        kng.h(context2, attributeSet, com.medium.reader.R.attr.radioButtonStyle, com.medium.reader.R.style.Widget_MaterialComponents_CompoundButton_RadioButton);
        int[] iArr = ura.i;
        kng.i(context2, attributeSet, iArr, com.medium.reader.R.attr.radioButtonStyle, com.medium.reader.R.style.Widget_MaterialComponents_CompoundButton_RadioButton, new int[0]);
        TypedArray typedArrayObtainStyledAttributes = context2.obtainStyledAttributes(attributeSet, iArr, com.medium.reader.R.attr.radioButtonStyle, com.medium.reader.R.style.Widget_MaterialComponents_CompoundButton_RadioButton);
        if (typedArrayObtainStyledAttributes.hasValue(0)) {
            setButtonTintList(kng.D(context2, typedArrayObtainStyledAttributes, 0));
        }
        if (typedArrayObtainStyledAttributes.hasValue(1)) {
            setRippleColor(kng.D(context2, typedArrayObtainStyledAttributes, 1));
        }
        this.f = typedArrayObtainStyledAttributes.getBoolean(2, false);
        typedArrayObtainStyledAttributes.recycle();
    }

    private ColorStateList getMaterialThemeColorsTintList() {
        ColorStateList colorStateList = this.e;
        if (colorStateList != null) {
            return colorStateList;
        }
        int iC = hlg.C(this, com.medium.reader.R.attr.colorControlActivated);
        int iC2 = hlg.C(this, com.medium.reader.R.attr.colorOnSurface);
        int iC3 = hlg.C(this, com.medium.reader.R.attr.colorSurface);
        ColorStateList colorStateList2 = new ColorStateList(g, new int[]{hlg.G(1.0f, iC3, iC), hlg.G(0.54f, iC3, iC2), hlg.G(0.38f, iC3, iC2), hlg.G(0.38f, iC3, iC2)});
        this.e = colorStateList2;
        return colorStateList2;
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

    @Override // android.widget.TextView, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.f && getButtonTintList() == null) {
            setUseMaterialThemeColors(true);
        }
    }

    public void setUseMaterialThemeColors(boolean z) {
        this.f = z;
        if (z) {
            setButtonTintList(getMaterialThemeColorsTintList());
        } else {
            setButtonTintList(null);
        }
    }
}
