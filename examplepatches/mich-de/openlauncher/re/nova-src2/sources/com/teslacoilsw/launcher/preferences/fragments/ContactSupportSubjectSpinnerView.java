package com.teslacoilsw.launcher.preferences.fragments;

import android.content.Context;
import android.util.AttributeSet;
import com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fragments/ContactSupportSubjectSpinnerView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefSpinnerView;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class ContactSupportSubjectSpinnerView extends FancyPrefSpinnerView {
    @JvmOverloads
    public ContactSupportSubjectSpinnerView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefSpinnerView
    public final CharSequence S(String str) {
        return String.valueOf(str);
    }
}
