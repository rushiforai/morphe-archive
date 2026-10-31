package com.teslacoilsw.launcher.preferences.fancyprefs;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import ay.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Scanner;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.internal.Intrinsics;
import o9.u2;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\b\u0007\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefLicenseView;", "Lcom/teslacoilsw/launcher/preferences/fancyprefs/FancyPrefView;", b.f42142b, "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FancyPrefLicenseView extends FancyPrefView<Unit> {
    public static final /* synthetic */ int M = 0;
    public final String K;
    public final String L;

    @JvmOverloads
    public FancyPrefLicenseView(@NotNull Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet, 0);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.f80167r, 0, 0);
        int resourceId = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        String string = typedArrayObtainStyledAttributes.getString(1);
        Intrinsics.d(string);
        this.L = string;
        typedArrayObtainStyledAttributes.recycle();
        this.K = resourceId != 0 ? new Scanner(context.getResources().openRawResource(resourceId), "UTF-8").useDelimiter("\\A").next() : null;
        setOnClickListener(new k(this, 22));
        I();
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final void I() {
        CharSequence charSequence = this.B;
        String str = this.K;
        if (str != null && !r70.k.U0(str)) {
            if (charSequence == null || r70.k.U0(charSequence)) {
                charSequence = str;
            } else {
                charSequence = ((Object) charSequence) + "\n\n" + str;
            }
        }
        J(charSequence);
    }

    @Override // com.teslacoilsw.launcher.preferences.fancyprefs.FancyPrefView
    public final int o(AttributeSet attributeSet) {
        int iO = super.o(attributeSet);
        if (iO == 2131624129) {
            return 2131624126;
        }
        return iO;
    }
}
