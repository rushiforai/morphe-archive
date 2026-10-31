package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.util.AttributeSet;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefDisabledSegmentSeekBarView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSeekBarView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FancyPrefDisabledSegmentSeekBarView extends FancyPrefSeekBarView {
    public int U;

    @JvmOverloads
    public FancyPrefDisabledSegmentSeekBarView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        this.U = -1;
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSeekBarView
    public final void P(int i5) {
        if (i5 < 0 || i5 >= this.U) {
            super.P(this.U);
        } else {
            super.P(i5);
        }
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSeekBarView, com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final int o(AttributeSet attributeSet) {
        return 2131624124;
    }
}
