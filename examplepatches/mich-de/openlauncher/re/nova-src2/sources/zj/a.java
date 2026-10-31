package zj;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.os.Build;
import android.util.Log;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f98535a = {16842910, 16842919};

    /* renamed from: b, reason: collision with root package name */
    public static final String f98536b = a.class.getSimpleName();

    public static ColorStateList a(ColorStateList colorStateList) {
        if (colorStateList == null) {
            return ColorStateList.valueOf(0);
        }
        if (Build.VERSION.SDK_INT <= 27 && Color.alpha(colorStateList.getDefaultColor()) == 0 && Color.alpha(colorStateList.getColorForState(f98535a, 0)) != 0) {
            Log.w(f98536b, "Use a non-transparent color for the default color as it will be used to finish ripple animations.");
        }
        return colorStateList;
    }

    public static boolean b(int[] iArr) {
        boolean z11 = false;
        boolean z12 = false;
        for (int i5 : iArr) {
            if (i5 == 16842910) {
                z11 = true;
            } else if (i5 == 16842908 || i5 == 16842919 || i5 == 16843623) {
                z12 = true;
            }
        }
        return z11 && z12;
    }
}
