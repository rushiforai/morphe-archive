package androidx.preference.internal;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import androidx.compose.ui.node.LayoutNode;
import r6.h;

@SuppressLint({"AppCompatCustomView"})
/* loaded from: classes2.dex */
public class PreferenceImageView extends ImageView {

    /* renamed from: a, reason: collision with root package name */
    public int f14825a;

    /* renamed from: b, reason: collision with root package name */
    public int f14826b;

    public PreferenceImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.f14825a = LayoutNode.NotPlacedPlaceOrder;
        this.f14826b = LayoutNode.NotPlacedPlaceOrder;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, h.f85548j, 0, 0);
        setMaxWidth(typedArrayObtainStyledAttributes.getDimensionPixelSize(3, LayoutNode.NotPlacedPlaceOrder));
        setMaxHeight(typedArrayObtainStyledAttributes.getDimensionPixelSize(2, LayoutNode.NotPlacedPlaceOrder));
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // android.widget.ImageView
    public final int getMaxHeight() {
        return this.f14826b;
    }

    @Override // android.widget.ImageView
    public final int getMaxWidth() {
        return this.f14825a;
    }

    @Override // android.widget.ImageView, android.view.View
    public final void onMeasure(int i5, int i11) {
        int mode = View.MeasureSpec.getMode(i5);
        if (mode == Integer.MIN_VALUE || mode == 0) {
            int size = View.MeasureSpec.getSize(i5);
            int i12 = this.f14825a;
            if (i12 != Integer.MAX_VALUE && (i12 < size || mode == 0)) {
                i5 = View.MeasureSpec.makeMeasureSpec(i12, Integer.MIN_VALUE);
            }
        }
        int mode2 = View.MeasureSpec.getMode(i11);
        if (mode2 == Integer.MIN_VALUE || mode2 == 0) {
            int size2 = View.MeasureSpec.getSize(i11);
            int i13 = this.f14826b;
            if (i13 != Integer.MAX_VALUE && (i13 < size2 || mode2 == 0)) {
                i11 = View.MeasureSpec.makeMeasureSpec(i13, Integer.MIN_VALUE);
            }
        }
        super.onMeasure(i5, i11);
    }

    @Override // android.widget.ImageView
    public final void setMaxHeight(int i5) {
        this.f14826b = i5;
        super.setMaxHeight(i5);
    }

    @Override // android.widget.ImageView
    public final void setMaxWidth(int i5) {
        this.f14825a = i5;
        super.setMaxWidth(i5);
    }
}
