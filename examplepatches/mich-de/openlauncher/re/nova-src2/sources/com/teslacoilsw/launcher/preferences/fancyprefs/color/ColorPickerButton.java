package com.teslacoilsw.launcher.preferences.fancyprefs.color;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.Button;
import g10.f;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/color/ColorPickerButton;", "Landroid/widget/Button;", "Landroid/content/Context;", "context", "Landroid/util/AttributeSet;", "attrs", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ColorPickerButton extends Button {

    /* renamed from: a, reason: collision with root package name */
    public final f f46045a;

    public ColorPickerButton(@NotNull Context context, @NotNull AttributeSet attributeSet) {
        super(context, attributeSet);
        f fVar = new f(context, -16777216, 0.0f, 0, 28);
        this.f46045a = fVar;
        setBackground(fVar);
    }
}
