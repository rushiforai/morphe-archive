package gk;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import androidx.appcompat.widget.AppCompatTextView;
import ps.e0;
import ps.f0;

/* loaded from: classes3.dex */
public class a extends AppCompatTextView {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(Context context, AttributeSet attributeSet, int i5) throws Resources.NotFoundException {
        super(hk.a.a(context, attributeSet, i5, 0), attributeSet, i5);
        Context context2 = getContext();
        if (e0.v(true, context2, 2130970148)) {
            Resources.Theme theme = context2.getTheme();
            int[] iArr = bj.a.B;
            TypedArray typedArrayObtainStyledAttributes = theme.obtainStyledAttributes(attributeSet, iArr, i5, 0);
            int[] iArr2 = {1, 2};
            int iO = -1;
            for (int i11 = 0; i11 < 2 && iO < 0; i11++) {
                iO = f0.o(context2, typedArrayObtainStyledAttributes, iArr2[i11], -1);
            }
            typedArrayObtainStyledAttributes.recycle();
            if (iO != -1) {
                return;
            }
            TypedArray typedArrayObtainStyledAttributes2 = theme.obtainStyledAttributes(attributeSet, iArr, i5, 0);
            int resourceId = typedArrayObtainStyledAttributes2.getResourceId(0, -1);
            typedArrayObtainStyledAttributes2.recycle();
            if (resourceId != -1) {
                TypedArray typedArrayObtainStyledAttributes3 = theme.obtainStyledAttributes(resourceId, bj.a.A);
                Context context3 = getContext();
                int[] iArr3 = {1, 2};
                int iO2 = -1;
                for (int i12 = 0; i12 < 2 && iO2 < 0; i12++) {
                    iO2 = f0.o(context3, typedArrayObtainStyledAttributes3, iArr3[i12], -1);
                }
                typedArrayObtainStyledAttributes3.recycle();
                if (iO2 >= 0) {
                    setLineHeight(iO2);
                }
            }
        }
    }

    @Override // androidx.appcompat.widget.AppCompatTextView, android.widget.TextView
    public final void setTextAppearance(Context context, int i5) throws Resources.NotFoundException {
        super.setTextAppearance(context, i5);
        if (e0.v(true, context, 2130970148)) {
            TypedArray typedArrayObtainStyledAttributes = context.getTheme().obtainStyledAttributes(i5, bj.a.A);
            Context context2 = getContext();
            int[] iArr = {1, 2};
            int iO = -1;
            for (int i11 = 0; i11 < 2 && iO < 0; i11++) {
                iO = f0.o(context2, typedArrayObtainStyledAttributes, iArr[i11], -1);
            }
            typedArrayObtainStyledAttributes.recycle();
            if (iO >= 0) {
                setLineHeight(iO);
            }
        }
    }
}
