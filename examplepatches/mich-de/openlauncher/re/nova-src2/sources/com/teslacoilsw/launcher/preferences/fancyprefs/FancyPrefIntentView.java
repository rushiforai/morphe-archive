package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import com.teslacoilsw.launcher.util.NamedIntent;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.StringCompanionObject;
import mx.c0;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefIntentView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefView;", "Lcom/teslacoilsw/launcher/util/NamedIntent;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class FancyPrefIntentView extends FancyPrefView<NamedIntent> {
    @JvmOverloads
    public FancyPrefIntentView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        if (this.B == null) {
            C("%s");
        }
        F(2131624145);
        FrameLayout frameLayout = this.f46013u;
        if (frameLayout != null) {
            frameLayout.setVisibility(8);
        }
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final String G(Object obj, String str) {
        NamedIntent namedIntent = (NamedIntent) obj;
        c0 c0VarC = c0.c(namedIntent.f46369b);
        if (c0VarC == null || c0VarC == c0.GOTO_SCREEN) {
            StringCompanionObject stringCompanionObject = StringCompanionObject.f71868a;
            return String.format(str, Arrays.copyOf(new Object[]{namedIntent.a(getContext())}, 1));
        }
        StringCompanionObject stringCompanionObject2 = StringCompanionObject.f71868a;
        return String.format(str, Arrays.copyOf(new Object[]{getContext().getString(c0VarC.f77040a)}, 1));
    }
}
