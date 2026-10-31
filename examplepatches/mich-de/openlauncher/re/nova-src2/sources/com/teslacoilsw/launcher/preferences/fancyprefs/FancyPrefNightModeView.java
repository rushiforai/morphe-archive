package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.AttributeSet;
import bu.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.teslacoilsw.launcher.preferences.fancyprefs.color.ColorSwatchRadioButton;
import com.teslacoilsw.launcher.widget.DumbRadioGrid;
import e10.z2;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefNightModeView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefView;", b.f42142b, "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SuppressLint({"CustomViewStyleable"})
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FancyPrefNightModeView extends FancyPrefView<Integer> {
    public static final /* synthetic */ int L = 0;
    public final DumbRadioGrid K;

    @JvmOverloads
    public FancyPrefNightModeView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        DumbRadioGrid dumbRadioGrid = (DumbRadioGrid) findViewById(2131428519);
        this.K = dumbRadioGrid;
        dumbRadioGrid.m(new k(this, 20));
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final int o(AttributeSet attributeSet) {
        return 2131624127;
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void t(Object obj) {
        int iIntValue = ((Number) obj).intValue();
        super.t(Integer.valueOf(iIntValue));
        DumbRadioGrid dumbRadioGrid = this.K;
        int childCount = dumbRadioGrid.getChildCount();
        if (childCount < 0) {
            return;
        }
        int i5 = 0;
        while (true) {
            ColorSwatchRadioButton colorSwatchRadioButton = (ColorSwatchRadioButton) z2.V(dumbRadioGrid, i5);
            if (colorSwatchRadioButton.f46046a.f56840c == iIntValue) {
                colorSwatchRadioButton.setChecked(true);
                return;
            } else if (i5 == childCount) {
                return;
            } else {
                i5++;
            }
        }
    }
}
