package com.teslacoilsw.launcher.preferences.fancyprefs.color;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.widget.RadioButton;
import g10.f;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import w20.e;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/color/ColorSwatchRadioButton;", "Landroid/widget/RadioButton;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ColorSwatchRadioButton extends RadioButton {

    /* renamed from: a, reason: collision with root package name */
    public final f f46046a;

    @JvmOverloads
    public ColorSwatchRadioButton(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public final void a(int i5) {
        this.f46046a.b(i5);
    }

    public ColorSwatchRadioButton(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0, 2132083011);
        f fVar = new f(context, -1, 0.0f, 0, 28);
        this.f46046a = fVar;
        setWillNotDraw(false);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80156e, 0, 2132083011);
        try {
            a(typedArrayObtainStyledAttributes.getColor(0, -1));
            int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(1, e.k(20));
            typedArrayObtainStyledAttributes.recycle();
            fVar.setBounds(0, 0, dimensionPixelSize, dimensionPixelSize);
            setCompoundDrawables(null, fVar, null, null);
            if (getText().length() == 0) {
                setTextSize(0.0f);
                setCompoundDrawablePadding(0);
            }
        } catch (Throwable th2) {
            typedArrayObtainStyledAttributes.recycle();
            throw th2;
        }
    }
}
