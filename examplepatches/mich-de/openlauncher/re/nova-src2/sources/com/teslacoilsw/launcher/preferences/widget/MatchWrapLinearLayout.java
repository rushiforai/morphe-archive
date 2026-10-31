package com.teslacoilsw.launcher.preferences.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.LinearLayout;
import i10.a;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0017\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/widget/MatchWrapLinearLayout;", "Landroid/widget/LinearLayout;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public class MatchWrapLinearLayout extends LinearLayout {
    @JvmOverloads
    public MatchWrapLinearLayout(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        this(context, attributeSet, 12);
    }

    public MatchWrapLinearLayout(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, 0, 0);
        setOrientation(1);
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public final LinearLayout.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new a(getContext(), attributeSet);
    }
}
