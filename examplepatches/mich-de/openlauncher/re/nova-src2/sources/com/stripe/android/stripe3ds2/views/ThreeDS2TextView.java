package com.stripe.android.stripe3ds2.views;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.util.AttributeSet;
import com.stripe.android.stripe3ds2.init.ui.StripeLabelCustomization;
import gk.a;
import java.lang.reflect.InvocationTargetException;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0010\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/views/ThreeDS2TextView;", "Lgk/a;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public class ThreeDS2TextView extends a {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ThreeDS2TextView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        Intrinsics.g(context, "context");
    }

    public void f(String str, StripeLabelCustomization stripeLabelCustomization) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        String str2;
        String str3;
        setText(str);
        if (stripeLabelCustomization != null && (str3 = stripeLabelCustomization.f45033b) != null) {
            setTextColor(Color.parseColor(str3));
        }
        if (stripeLabelCustomization != null) {
            int i5 = stripeLabelCustomization.f45034c;
            Integer numValueOf = Integer.valueOf(i5);
            if (i5 <= 0) {
                numValueOf = null;
            }
            if (numValueOf != null) {
                setTextSize(2, numValueOf.intValue());
            }
        }
        if (stripeLabelCustomization == null || (str2 = stripeLabelCustomization.f45032a) == null) {
            return;
        }
        setTypeface(Typeface.create(str2, 0));
    }
}
