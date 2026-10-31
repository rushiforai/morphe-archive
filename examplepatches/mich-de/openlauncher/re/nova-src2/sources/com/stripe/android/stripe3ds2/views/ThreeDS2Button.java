package com.stripe.android.stripe3ds2.views;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.util.AttributeSet;
import bk.j;
import com.google.android.material.button.MaterialButton;
import com.stripe.android.stripe3ds2.init.ui.StripeButtonCustomization;
import hj.a;
import java.lang.reflect.InvocationTargetException;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0010\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/views/ThreeDS2Button;", "Lcom/google/android/material/button/MaterialButton;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public class ThreeDS2Button extends MaterialButton {
    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ThreeDS2Button(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 4);
        Intrinsics.g(context, "context");
    }

    public final void i(StripeButtonCustomization stripeButtonCustomization) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        if (stripeButtonCustomization == null) {
            return;
        }
        StripeButtonCustomization stripeButtonCustomization2 = stripeButtonCustomization;
        String str = stripeButtonCustomization2.f45033b;
        if (str != null) {
            setTextColor(Color.parseColor(str));
        }
        String str2 = stripeButtonCustomization.f45035d;
        if (str2 != null) {
            d(ColorStateList.valueOf(Color.parseColor(str2)));
        }
        int i5 = stripeButtonCustomization.f45036e;
        Integer numValueOf = Integer.valueOf(i5);
        if (i5 < 0) {
            numValueOf = null;
        }
        if (numValueOf != null) {
            int iIntValue = numValueOf.intValue();
            if (a()) {
                a aVar = this.f34118d;
                if (!aVar.f59876p || aVar.f59869g != iIntValue) {
                    aVar.f59869g = iIntValue;
                    aVar.f59876p = true;
                    float f11 = iIntValue;
                    j jVarF = aVar.f59864b.f();
                    jVarF.f18007e = new bk.a(f11);
                    jVarF.f18008f = new bk.a(f11);
                    jVarF.f18009g = new bk.a(f11);
                    jVarF.f18010h = new bk.a(f11);
                    aVar.c(jVarF.a());
                }
            }
        }
        int i11 = stripeButtonCustomization2.f45034c;
        if ((i11 > 0 ? Integer.valueOf(i11) : null) != null) {
            setTextSize(2, r2.intValue());
        }
        String str3 = stripeButtonCustomization2.f45032a;
        if (str3 != null) {
            setTypeface(Typeface.create(str3, 0));
        }
    }

    public ThreeDS2Button(Context context, AttributeSet attributeSet, int i5) {
        super(context, (i5 & 2) != 0 ? null : attributeSet, 0);
    }
}
