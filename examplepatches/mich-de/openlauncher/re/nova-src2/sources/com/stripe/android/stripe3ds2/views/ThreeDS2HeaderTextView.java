package com.stripe.android.stripe3ds2.views;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.util.AttributeSet;
import com.stripe.android.stripe3ds2.init.ui.StripeLabelCustomization;
import java.lang.reflect.InvocationTargetException;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/stripe3ds2/views/ThreeDS2HeaderTextView;", "Lcom/stripe/android/stripe3ds2/views/ThreeDS2TextView;", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ThreeDS2HeaderTextView extends ThreeDS2TextView {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public ThreeDS2HeaderTextView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        Intrinsics.g(context, "context");
    }

    @Override // com.stripe.android.stripe3ds2.views.ThreeDS2TextView
    public final void f(String str, StripeLabelCustomization stripeLabelCustomization) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        setText(str);
        if (stripeLabelCustomization != null) {
            String str2 = stripeLabelCustomization.f45037d;
            if (str2 != null) {
                setTextColor(Color.parseColor(str2));
            }
            Integer numValueOf = Integer.valueOf(stripeLabelCustomization.f45039f);
            if (numValueOf.intValue() <= 0) {
                numValueOf = null;
            }
            if (numValueOf != null) {
                setTextSize(2, numValueOf.intValue());
            }
            String str3 = stripeLabelCustomization.f45038e;
            if (str3 != null) {
                setTypeface(Typeface.create(str3, 0));
            }
        }
    }
}
