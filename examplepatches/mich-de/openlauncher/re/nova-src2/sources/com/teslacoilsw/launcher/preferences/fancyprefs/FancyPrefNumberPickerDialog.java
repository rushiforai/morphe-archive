package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import bh.g;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.widget.NumberPicker;
import d00.t;
import f10.d;
import j4.e;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function0;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefNumberPickerDialog;", "Lf10/d;", b.f42142b, "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SuppressLint({"CustomViewStyleable"})
/* loaded from: classes4.dex */
public final class FancyPrefNumberPickerDialog extends d {
    public static final /* synthetic */ int V = 0;
    public final int S;
    public final int T;
    public final int U;

    @JvmOverloads
    public FancyPrefNumberPickerDialog(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80169t);
        try {
            this.S = typedArrayObtainStyledAttributes.getInt(1, 0);
            this.T = typedArrayObtainStyledAttributes.getInt(5, 0);
            this.U = typedArrayObtainStyledAttributes.getInt(4, 1);
            typedArrayObtainStyledAttributes.getString(3);
        } finally {
            typedArrayObtainStyledAttributes.recycle();
        }
    }

    @Override // f10.d
    public final Function0 K(View view) {
        NumberPicker numberPicker = new NumberPicker(getContext(), null);
        numberPicker.o(this.T);
        numberPicker.n(this.U);
        numberPicker.p(((Number) r()).intValue(), false);
        int i5 = this.S;
        numberPicker.setOrientation(i5);
        view.setPaddingRelative(g.M(getContext(), 24), g.M(getContext(), 48), g.M(getContext(), 24), g.M(getContext(), 48));
        ((ViewGroup) view).addView(numberPicker, i5 == 1 ? new e(g.M(getContext(), 48), -1) : new e(-1, g.M(getContext(), 48)));
        return new t(numberPicker, 24);
    }
}
