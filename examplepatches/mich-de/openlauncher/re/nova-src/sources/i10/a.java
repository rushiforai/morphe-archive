package i10;

import android.content.res.TypedArray;
import android.widget.LinearLayout;

/* loaded from: classes4.dex */
public final class a extends LinearLayout.LayoutParams {
    @Override // android.view.ViewGroup.LayoutParams
    public final void setBaseAttributes(TypedArray typedArray, int i5, int i11) {
        if (typedArray.hasValue(i5)) {
            ((LinearLayout.LayoutParams) this).width = typedArray.getLayoutDimension(i5, "layout_width");
        } else {
            ((LinearLayout.LayoutParams) this).width = -1;
        }
        if (typedArray.hasValue(i11)) {
            ((LinearLayout.LayoutParams) this).height = typedArray.getLayoutDimension(i11, "layout_height");
        } else {
            ((LinearLayout.LayoutParams) this).height = -2;
        }
    }
}
