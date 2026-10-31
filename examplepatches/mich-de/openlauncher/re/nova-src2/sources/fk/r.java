package fk;

import a5.a1;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.RippleDrawable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class r extends ArrayAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final ColorStateList f55255a;

    /* renamed from: b, reason: collision with root package name */
    public final ColorStateList f55256b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ s f55257c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(s sVar, Context context, int i5, String[] strArr) {
        ColorStateList colorStateList;
        super(context, i5, strArr);
        this.f55257c = sVar;
        ColorStateList colorStateList2 = sVar.f55264k;
        ColorStateList colorStateList3 = null;
        if (colorStateList2 != null) {
            int[] iArr = {16842919};
            colorStateList = new ColorStateList(new int[][]{iArr, new int[0]}, new int[]{colorStateList2.getColorForState(iArr, 0), 0});
        } else {
            colorStateList = null;
        }
        this.f55256b = colorStateList;
        int i11 = sVar.f55263j;
        if (i11 != 0 && colorStateList2 != null) {
            int[] iArr2 = {16843623, -16842919};
            int[] iArr3 = {16842913, -16842919};
            colorStateList3 = new ColorStateList(new int[][]{iArr3, iArr2, new int[0]}, new int[]{r4.a.j(colorStateList2.getColorForState(iArr3, 0), i11), r4.a.j(colorStateList2.getColorForState(iArr2, 0), i11), i11});
        }
        this.f55255a = colorStateList3;
    }

    @Override // android.widget.ArrayAdapter, android.widget.Adapter
    public final View getView(int i5, View view, ViewGroup viewGroup) {
        View view2 = super.getView(i5, view, viewGroup);
        if (view2 instanceof TextView) {
            TextView textView = (TextView) view2;
            s sVar = this.f55257c;
            Drawable rippleDrawable = null;
            if (sVar.getText().toString().contentEquals(textView.getText()) && sVar.f55263j != 0) {
                ColorDrawable colorDrawable = new ColorDrawable(sVar.f55263j);
                ColorStateList colorStateList = this.f55256b;
                if (colorStateList != null) {
                    colorDrawable.setTintList(this.f55255a);
                    rippleDrawable = new RippleDrawable(colorStateList, colorDrawable, null);
                } else {
                    rippleDrawable = colorDrawable;
                }
            }
            WeakHashMap weakHashMap = a1.f250a;
            textView.setBackground(rippleDrawable);
        }
        return view2;
    }
}
