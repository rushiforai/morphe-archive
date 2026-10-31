package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.CheckBox;
import android.widget.TextView;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import l30.j;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002B\u001d\b\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/teslacoilsw/launcher/widget/NovaCheckBox;", "Landroid/widget/CheckBox;", "Ll30/j;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class NovaCheckBox extends CheckBox implements j {

    /* renamed from: a, reason: collision with root package name */
    public boolean f46424a;

    @JvmOverloads
    public NovaCheckBox(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46424a = true;
    }

    @Override // android.view.View
    public final Drawable getBackground() {
        if (this.f46424a) {
            return super.getBackground();
        }
        return null;
    }

    @Override // l30.j
    public final void h(boolean z11, boolean z12) {
        Drawable buttonDrawable = getButtonDrawable();
        super.setChecked(z11);
        if (buttonDrawable != null) {
            buttonDrawable.jumpToCurrentState();
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView, android.view.View
    public final void onDraw(Canvas canvas) {
        this.f46424a = TextUtils.isEmpty(getText());
        super.onDraw(canvas);
        this.f46424a = true;
    }

    @Override // android.widget.TextView
    public final void setText(CharSequence charSequence, TextView.BufferType bufferType) {
        super.setText(charSequence, bufferType);
        if (TextUtils.isEmpty(charSequence)) {
            setBackgroundResource(2131231244);
            return;
        }
        TypedArray typedArrayObtainStyledAttributes = getContext().obtainStyledAttributes(new int[]{2130969920});
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(0);
        typedArrayObtainStyledAttributes.recycle();
        setBackground(drawable);
    }
}
