package androidx.cardview.widget;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import defpackage.k40;
import defpackage.lig;
import defpackage.wra;
import defpackage.xlb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class CardView extends FrameLayout {
    public static final int[] f = {R.attr.colorBackground};
    public boolean a;
    public boolean b;
    public final Rect c;
    public final Rect d;
    public final lig e;

    public CardView(Context context, AttributeSet attributeSet) {
        ColorStateList colorStateListValueOf;
        super(context, attributeSet, com.medium.reader.R.attr.cardViewStyle);
        Rect rect = new Rect();
        this.c = rect;
        this.d = new Rect();
        lig ligVar = new lig(this);
        this.e = ligVar;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, wra.a, com.medium.reader.R.attr.cardViewStyle, com.medium.reader.R.style.CardView);
        if (typedArrayObtainStyledAttributes.hasValue(2)) {
            colorStateListValueOf = typedArrayObtainStyledAttributes.getColorStateList(2);
        } else {
            TypedArray typedArrayObtainStyledAttributes2 = getContext().obtainStyledAttributes(f);
            int color = typedArrayObtainStyledAttributes2.getColor(0, 0);
            typedArrayObtainStyledAttributes2.recycle();
            float[] fArr = new float[3];
            Color.colorToHSV(color, fArr);
            colorStateListValueOf = ColorStateList.valueOf(fArr[2] > 0.5f ? getResources().getColor(com.medium.reader.R.color.cardview_light_background) : getResources().getColor(com.medium.reader.R.color.cardview_dark_background));
        }
        float dimension = typedArrayObtainStyledAttributes.getDimension(3, 0.0f);
        float dimension2 = typedArrayObtainStyledAttributes.getDimension(4, 0.0f);
        float dimension3 = typedArrayObtainStyledAttributes.getDimension(5, 0.0f);
        this.a = typedArrayObtainStyledAttributes.getBoolean(7, false);
        this.b = typedArrayObtainStyledAttributes.getBoolean(6, true);
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(8, 0);
        rect.left = typedArrayObtainStyledAttributes.getDimensionPixelSize(10, dimensionPixelSize);
        rect.top = typedArrayObtainStyledAttributes.getDimensionPixelSize(12, dimensionPixelSize);
        rect.right = typedArrayObtainStyledAttributes.getDimensionPixelSize(11, dimensionPixelSize);
        rect.bottom = typedArrayObtainStyledAttributes.getDimensionPixelSize(9, dimensionPixelSize);
        dimension3 = dimension2 > dimension3 ? dimension2 : dimension3;
        typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        typedArrayObtainStyledAttributes.getDimensionPixelSize(1, 0);
        typedArrayObtainStyledAttributes.recycle();
        xlb xlbVar = new xlb(colorStateListValueOf, dimension);
        ligVar.b = xlbVar;
        setBackgroundDrawable(xlbVar);
        setClipToOutline(true);
        setElevation(dimension2);
        k40.O0(ligVar, dimension3);
    }

    public ColorStateList getCardBackgroundColor() {
        return ((xlb) this.e.b).h;
    }

    public float getCardElevation() {
        return ((CardView) this.e.c).getElevation();
    }

    public int getContentPaddingBottom() {
        return this.c.bottom;
    }

    public int getContentPaddingLeft() {
        return this.c.left;
    }

    public int getContentPaddingRight() {
        return this.c.right;
    }

    public int getContentPaddingTop() {
        return this.c.top;
    }

    public float getMaxCardElevation() {
        return ((xlb) this.e.b).e;
    }

    public boolean getPreventCornerOverlap() {
        return this.b;
    }

    public float getRadius() {
        return ((xlb) this.e.b).a;
    }

    public boolean getUseCompatPadding() {
        return this.a;
    }

    @Override // android.widget.FrameLayout, android.view.View
    public final void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
    }

    public void setCardBackgroundColor(int i) {
        ColorStateList colorStateListValueOf = ColorStateList.valueOf(i);
        xlb xlbVar = (xlb) this.e.b;
        if (colorStateListValueOf == null) {
            xlbVar.getClass();
            colorStateListValueOf = ColorStateList.valueOf(0);
        }
        xlbVar.h = colorStateListValueOf;
        xlbVar.b.setColor(colorStateListValueOf.getColorForState(xlbVar.getState(), xlbVar.h.getDefaultColor()));
        xlbVar.invalidateSelf();
    }

    public void setCardElevation(float f2) {
        ((CardView) this.e.c).setElevation(f2);
    }

    public void setMaxCardElevation(float f2) {
        k40.O0(this.e, f2);
    }

    @Override // android.view.View
    public void setMinimumHeight(int i) {
        super.setMinimumHeight(i);
    }

    @Override // android.view.View
    public void setMinimumWidth(int i) {
        super.setMinimumWidth(i);
    }

    public void setPreventCornerOverlap(boolean z) {
        if (z != this.b) {
            this.b = z;
            lig ligVar = this.e;
            k40.O0(ligVar, ((xlb) ligVar.b).e);
        }
    }

    public void setRadius(float f2) {
        xlb xlbVar = (xlb) this.e.b;
        if (f2 == xlbVar.a) {
            return;
        }
        xlbVar.a = f2;
        xlbVar.b(null);
        xlbVar.invalidateSelf();
    }

    public void setUseCompatPadding(boolean z) {
        if (this.a != z) {
            this.a = z;
            lig ligVar = this.e;
            k40.O0(ligVar, ((xlb) ligVar.b).e);
        }
    }

    public void setCardBackgroundColor(ColorStateList colorStateList) {
        xlb xlbVar = (xlb) this.e.b;
        if (colorStateList == null) {
            xlbVar.getClass();
            colorStateList = ColorStateList.valueOf(0);
        }
        xlbVar.h = colorStateList;
        xlbVar.b.setColor(colorStateList.getColorForState(xlbVar.getState(), xlbVar.h.getDefaultColor()));
        xlbVar.invalidateSelf();
    }

    @Override // android.view.View
    public final void setPadding(int i, int i2, int i3, int i4) {
    }

    @Override // android.view.View
    public final void setPaddingRelative(int i, int i2, int i3, int i4) {
    }

    public CardView(Context context) {
        this(context, null);
    }
}
