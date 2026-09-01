package defpackage;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import com.google.android.material.focus.FocusRingDrawable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jj7 extends ArrayAdapter {
    public ColorStateList a;
    public ColorStateList b;
    public final /* synthetic */ kj7 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jj7(kj7 kj7Var, Context context, int i, String[] strArr) {
        super(context, i, strArr);
        this.c = kj7Var;
        a();
    }

    public final void a() {
        ColorStateList colorStateList;
        kj7 kj7Var = this.c;
        ColorStateList colorStateList2 = kj7Var.l;
        ColorStateList colorStateList3 = null;
        if (colorStateList2 != null) {
            int[] iArr = {R.attr.state_pressed};
            colorStateList = new ColorStateList(new int[][]{iArr, new int[0]}, new int[]{colorStateList2.getColorForState(iArr, 0), 0});
        } else {
            colorStateList = null;
        }
        this.b = colorStateList;
        if (kj7Var.k != 0 && kj7Var.l != null) {
            int[] iArr2 = {R.attr.state_hovered, -16842919};
            int[] iArr3 = {R.attr.state_selected, -16842919};
            colorStateList3 = new ColorStateList(new int[][]{iArr3, iArr2, new int[0]}, new int[]{rv1.b(kj7Var.l.getColorForState(iArr3, 0), kj7Var.k), rv1.b(kj7Var.l.getColorForState(iArr2, 0), kj7Var.k), kj7Var.k});
        }
        this.a = colorStateList3;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public final View getView(int i, View view, ViewGroup viewGroup) {
        View view2 = super.getView(i, view, viewGroup);
        if (view2 instanceof TextView) {
            TextView textView = (TextView) view2;
            kj7 kj7Var = this.c;
            Drawable drawable = null;
            if (kj7Var.getText().toString().contentEquals(textView.getText()) && kj7Var.k != 0) {
                ColorDrawable colorDrawable = new ColorDrawable(kj7Var.k);
                if (this.b != null) {
                    colorDrawable.setTintList(this.a);
                    RippleDrawable rippleDrawable = new RippleDrawable(this.b, colorDrawable, null);
                    FocusRingDrawable focusRingDrawableE = FocusRingDrawable.e(getContext(), rippleDrawable);
                    if (focusRingDrawableE != null) {
                        focusRingDrawableE.o.x = kj7Var.g;
                    }
                    drawable = rippleDrawable;
                } else {
                    drawable = colorDrawable;
                }
            }
            textView.setBackground(drawable);
        }
        return view2;
    }
}
