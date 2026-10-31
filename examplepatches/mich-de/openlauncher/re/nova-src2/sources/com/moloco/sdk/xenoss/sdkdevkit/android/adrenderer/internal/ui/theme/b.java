package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.theme;

import android.content.Context;
import android.content.res.TypedArray;
import com.moloco.sdk.R;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class b {
    public static final int a(@NotNull Context context) {
        Intrinsics.g(context, "<this>");
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(new int[]{R.attr.mlcColorPrimary});
        Intrinsics.f(typedArrayObtainStyledAttributes, "obtainStyledAttributes(...)");
        boolean zHasValue = typedArrayObtainStyledAttributes.hasValue(0);
        int color = typedArrayObtainStyledAttributes.getColor(0, 0);
        typedArrayObtainStyledAttributes.recycle();
        if (zHasValue) {
            return color;
        }
        TypedArray typedArrayObtainStyledAttributes2 = new androidx.appcompat.view.d(context, R.style.Theme_Moloco).obtainStyledAttributes(new int[]{R.attr.mlcColorPrimary});
        Intrinsics.f(typedArrayObtainStyledAttributes2, "obtainStyledAttributes(...)");
        boolean zHasValue2 = typedArrayObtainStyledAttributes2.hasValue(0);
        int color2 = typedArrayObtainStyledAttributes2.getColor(0, 0);
        typedArrayObtainStyledAttributes2.recycle();
        return zHasValue2 ? color2 : context.getColor(R.color.moloco_primary);
    }
}
