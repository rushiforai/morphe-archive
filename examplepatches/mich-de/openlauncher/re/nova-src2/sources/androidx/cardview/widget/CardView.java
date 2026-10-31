package androidx.cardview.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import og.i;
import vf.u;
import y.a;

/* loaded from: classes2.dex */
public class CardView extends FrameLayout {

    /* renamed from: f, reason: collision with root package name */
    public static final int[] f13850f = {16842801};

    /* renamed from: g, reason: collision with root package name */
    public static final u f13851g = new u();

    /* renamed from: a, reason: collision with root package name */
    public final boolean f13852a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f13853b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f13854c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f13855d;

    /* renamed from: e, reason: collision with root package name */
    public final i f13856e;

    public CardView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 2130968838);
    }

    public void b(int i5) {
        ColorStateList colorStateListValueOf = ColorStateList.valueOf(i5);
        a aVar = (a) ((Drawable) this.f13856e.f80412b);
        if (colorStateListValueOf == null) {
            aVar.getClass();
            colorStateListValueOf = ColorStateList.valueOf(0);
        }
        aVar.f96494h = colorStateListValueOf;
        aVar.f96488b.setColor(colorStateListValueOf.getColorForState(aVar.getState(), aVar.f96494h.getDefaultColor()));
        aVar.invalidateSelf();
    }

    public void d(float f11) {
        ((CardView) this.f13856e.f80413c).setElevation(f11);
    }

    public void e(float f11) {
        f13851g.h(this.f13856e, f11);
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
    }

    @Override // android.view.View
    public final void setPadding(int i5, int i11, int i12, int i13) {
    }

    @Override // android.view.View
    public final void setPaddingRelative(int i5, int i11, int i12, int i13) {
    }

    public CardView(Context context, AttributeSet attributeSet, int i5) {
        ColorStateList colorStateListValueOf;
        super(context, attributeSet, i5);
        Rect rect = new Rect();
        this.f13854c = rect;
        this.f13855d = new Rect();
        i iVar = new i(this);
        this.f13856e = iVar;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, x.a.f94901a, i5, 2132083007);
        if (typedArrayObtainStyledAttributes.hasValue(2)) {
            colorStateListValueOf = typedArrayObtainStyledAttributes.getColorStateList(2);
        } else {
            TypedArray typedArrayObtainStyledAttributes2 = getContext().obtainStyledAttributes(f13850f);
            int color = typedArrayObtainStyledAttributes2.getColor(0, 0);
            typedArrayObtainStyledAttributes2.recycle();
            float[] fArr = new float[3];
            Color.colorToHSV(color, fArr);
            colorStateListValueOf = ColorStateList.valueOf(fArr[2] > 0.5f ? getResources().getColor(2131099846) : getResources().getColor(2131099845));
        }
        float dimension = typedArrayObtainStyledAttributes.getDimension(3, 0.0f);
        float dimension2 = typedArrayObtainStyledAttributes.getDimension(4, 0.0f);
        float dimension3 = typedArrayObtainStyledAttributes.getDimension(5, 0.0f);
        this.f13852a = typedArrayObtainStyledAttributes.getBoolean(7, false);
        this.f13853b = typedArrayObtainStyledAttributes.getBoolean(6, true);
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(8, 0);
        rect.left = typedArrayObtainStyledAttributes.getDimensionPixelSize(10, dimensionPixelSize);
        rect.top = typedArrayObtainStyledAttributes.getDimensionPixelSize(12, dimensionPixelSize);
        rect.right = typedArrayObtainStyledAttributes.getDimensionPixelSize(11, dimensionPixelSize);
        rect.bottom = typedArrayObtainStyledAttributes.getDimensionPixelSize(9, dimensionPixelSize);
        dimension3 = dimension2 > dimension3 ? dimension2 : dimension3;
        typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        typedArrayObtainStyledAttributes.getDimensionPixelSize(1, 0);
        typedArrayObtainStyledAttributes.recycle();
        a aVar = new a(colorStateListValueOf, dimension);
        iVar.f80412b = aVar;
        setBackgroundDrawable(aVar);
        setClipToOutline(true);
        setElevation(dimension2);
        f13851g.h(iVar, dimension3);
    }
}
