package com.google.android.material.theme;

import android.R;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import defpackage.a40;
import defpackage.ak7;
import defpackage.ik7;
import defpackage.j10;
import defpackage.k10;
import defpackage.kj7;
import defpackage.m10;
import defpackage.q20;
import defpackage.r30;
import defpackage.sgg;
import defpackage.ura;
import defpackage.vj7;
import defpackage.yi2;
import defpackage.zj7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class MaterialComponentsViewInflater extends a40 {
    @Override // defpackage.a40
    public final j10 a(Context context, AttributeSet attributeSet) {
        return new kj7(context, attributeSet);
    }

    @Override // defpackage.a40
    public final k10 b(Context context, AttributeSet attributeSet) {
        return new vj7(context, attributeSet);
    }

    @Override // defpackage.a40
    public final m10 c(Context context, AttributeSet attributeSet) {
        return new zj7(context, attributeSet);
    }

    @Override // defpackage.a40
    public final q20 d(Context context, AttributeSet attributeSet) {
        return new ak7(context, attributeSet);
    }

    @Override // defpackage.a40
    public final r30 e(Context context, AttributeSet attributeSet) {
        ik7 ik7Var = new ik7(yi2.U(context, attributeSet, R.attr.textViewStyle, 0, new int[0]), attributeSet, R.attr.textViewStyle);
        Context context2 = ik7Var.getContext();
        if (sgg.V(context2.getTheme(), com.medium.reader.R.attr.textAppearanceLineHeightEnabled, true)) {
            Resources.Theme theme = context2.getTheme();
            int[] iArr = ura.m;
            TypedArray typedArrayObtainStyledAttributes = theme.obtainStyledAttributes(attributeSet, iArr, R.attr.textViewStyle, 0);
            int iG = ik7.g(context2, typedArrayObtainStyledAttributes, 1, 2);
            typedArrayObtainStyledAttributes.recycle();
            if (iG == -1) {
                TypedArray typedArrayObtainStyledAttributes2 = theme.obtainStyledAttributes(attributeSet, iArr, R.attr.textViewStyle, 0);
                int resourceId = typedArrayObtainStyledAttributes2.getResourceId(0, -1);
                typedArrayObtainStyledAttributes2.recycle();
                if (resourceId != -1) {
                    TypedArray typedArrayObtainStyledAttributes3 = theme.obtainStyledAttributes(resourceId, ura.l);
                    int iG2 = ik7.g(ik7Var.getContext(), typedArrayObtainStyledAttributes3, 2, 4);
                    typedArrayObtainStyledAttributes3.recycle();
                    if (iG2 >= 0) {
                        ik7Var.setLineHeight(iG2);
                    }
                }
            }
        }
        return ik7Var;
    }
}
