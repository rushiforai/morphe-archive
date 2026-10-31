package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import h6.c1;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import lx.d;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\u001d\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefCardBorderView;", "Landroid/widget/FrameLayout;", "context", "Landroid/content/Context;", "attrs", "Landroid/util/AttributeSet;", "<init>", "(Landroid/content/Context;Landroid/util/AttributeSet;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FancyPrefCardBorderView extends FrameLayout {
    @JvmOverloads
    public FancyPrefCardBorderView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        setBackgroundColor(d.b(context, 2130969845));
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80162k);
        if (typedArrayObtainStyledAttributes.getBoolean(2, true)) {
            View view = new View(context);
            view.setBackgroundResource(2131232110);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, c1.h(context, 12));
            layoutParams.gravity = 48;
            addView(view, layoutParams);
        }
        if (typedArrayObtainStyledAttributes.getBoolean(1, true)) {
            View view2 = new View(context);
            view2.setBackgroundResource(2131232111);
            FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-1, c1.h(context, 8));
            layoutParams2.gravity = 80;
            addView(view2, layoutParams2);
        }
        Unit unit = Unit.f71706a;
        typedArrayObtainStyledAttributes.recycle();
    }
}
