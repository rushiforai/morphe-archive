package com.teslacoilsw.launcher.launcher3.allapps;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.TextView;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import kotlin.math.MathKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/launcher3/allapps/NovaFastScrollerPopupView;", "Landroid/widget/TextView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class NovaFastScrollerPopupView extends TextView {

    /* renamed from: a, reason: collision with root package name */
    public Drawable f45814a;

    @JvmOverloads
    public NovaFastScrollerPopupView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    public final void a() {
        int iB = MathKt.b(getTextSize());
        float f11 = iB / 2.0f;
        int iB2 = MathKt.b(((getWidth() - getPaddingRight()) / 2.0f) - f11);
        int iB3 = MathKt.b(((getHeight() - getPaddingBottom()) / 2.0f) - f11);
        Drawable drawable = this.f45814a;
        if (drawable != null) {
            drawable.setBounds(iB2, iB3, iB2 + iB, iB + iB3);
        }
        Drawable drawable2 = this.f45814a;
        if (drawable2 != null) {
            drawable2.setTint(getCurrentTextColor());
        }
    }

    @Override // android.view.View
    public final void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        Drawable drawable = this.f45814a;
        if (drawable != null) {
            drawable.draw(canvas);
        }
    }

    @Override // android.widget.TextView, android.view.View
    public final void onMeasure(int i5, int i11) {
        super.onMeasure(i5, i11);
        a();
    }

    @Override // android.widget.TextView
    public final void setText(CharSequence charSequence, TextView.BufferType bufferType) {
        if (Intrinsics.b(charSequence, ":NOVA:")) {
            this.f45814a = getContext().getDrawable(2131231724);
            a();
            super.setText((CharSequence) null, TextView.BufferType.NORMAL);
        } else if (!Intrinsics.b(charSequence, ":FOLDER:")) {
            this.f45814a = null;
            super.setText(charSequence, bufferType);
        } else {
            this.f45814a = getContext().getDrawable(2131231827);
            a();
            super.setText((CharSequence) null, TextView.BufferType.NORMAL);
        }
    }
}
