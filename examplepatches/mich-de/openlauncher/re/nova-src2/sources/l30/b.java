package l30;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.GridLayout;

/* loaded from: classes4.dex */
public final class b extends GridLayout.LayoutParams {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74635a;

    @Override // android.widget.GridLayout.LayoutParams, android.view.ViewGroup.LayoutParams
    public final void setBaseAttributes(TypedArray typedArray, int i5, int i11) {
        switch (this.f74635a) {
            case 0:
                if (typedArray.hasValue(i5)) {
                    ((GridLayout.LayoutParams) this).width = typedArray.getLayoutDimension(i5, "layout_width");
                } else {
                    ((GridLayout.LayoutParams) this).width = -2;
                }
                if (!typedArray.hasValue(i11)) {
                    ((GridLayout.LayoutParams) this).height = -2;
                    break;
                } else {
                    ((GridLayout.LayoutParams) this).height = typedArray.getLayoutDimension(i11, "layout_height");
                    break;
                }
            default:
                if (typedArray.hasValue(i5)) {
                    ((GridLayout.LayoutParams) this).width = typedArray.getLayoutDimension(i5, "layout_width");
                } else {
                    ((GridLayout.LayoutParams) this).width = -2;
                }
                if (!typedArray.hasValue(i11)) {
                    ((GridLayout.LayoutParams) this).height = -2;
                    break;
                } else {
                    ((GridLayout.LayoutParams) this).height = typedArray.getLayoutDimension(i11, "layout_height");
                    break;
                }
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet);
        this.f74635a = i5;
    }
}
