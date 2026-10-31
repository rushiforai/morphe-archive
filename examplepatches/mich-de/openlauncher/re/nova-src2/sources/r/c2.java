package r;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.util.AttributeSet;
import android.util.Log;
import android.util.TypedValue;
import android.view.View;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public abstract class c2 {

    /* renamed from: a, reason: collision with root package name */
    public static final ThreadLocal f84687a = new ThreadLocal();

    /* renamed from: b, reason: collision with root package name */
    public static final int[] f84688b = {-16842910};

    /* renamed from: c, reason: collision with root package name */
    public static final int[] f84689c = {16842908};

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f84690d = {16842919};

    /* renamed from: e, reason: collision with root package name */
    public static final int[] f84691e = {16842912};

    /* renamed from: f, reason: collision with root package name */
    public static final int[] f84692f = new int[0];

    /* renamed from: g, reason: collision with root package name */
    public static final int[] f84693g = new int[1];

    public static void a(Context context, View view) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(l.a.f72897j);
        try {
            if (!typedArrayObtainStyledAttributes.hasValue(Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE)) {
                Log.e("ThemeUtils", "View " + view.getClass() + " is an AppCompat widget that can only be used with a Theme.AppCompat theme (or descendant).");
            }
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    public static int b(Context context, int i5) {
        ColorStateList colorStateListD = d(context, i5);
        if (colorStateListD != null && colorStateListD.isStateful()) {
            return colorStateListD.getColorForState(f84688b, colorStateListD.getDefaultColor());
        }
        ThreadLocal threadLocal = f84687a;
        TypedValue typedValue = (TypedValue) threadLocal.get();
        if (typedValue == null) {
            typedValue = new TypedValue();
            threadLocal.set(typedValue);
        }
        context.getTheme().resolveAttribute(16842803, typedValue, true);
        float f11 = typedValue.getFloat();
        return r4.a.n(c(context, i5), Math.round(Color.alpha(r4) * f11));
    }

    public static int c(Context context, int i5) {
        int[] iArr = f84693g;
        iArr[0] = i5;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes((AttributeSet) null, iArr);
        try {
            return typedArrayObtainStyledAttributes.getColor(0, 0);
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    public static ColorStateList d(Context context, int i5) {
        ColorStateList colorStateList;
        int resourceId;
        int[] iArr = f84693g;
        iArr[0] = i5;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes((AttributeSet) null, iArr);
        try {
            if (!typedArrayObtainStyledAttributes.hasValue(0) || (resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0)) == 0 || (colorStateList = o4.a.b(context, resourceId)) == null) {
                colorStateList = typedArrayObtainStyledAttributes.getColorStateList(0);
            }
            return colorStateList;
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }
}
