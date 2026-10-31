package l10;

import android.net.Uri;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class m {
    public static Uri a(int i5, boolean z11) {
        Uri.Builder builderAppendPath = new Uri.Builder().scheme("android.resource").authority("com.teslacoilsw.launcher").appendPath(String.valueOf(i5));
        if (z11) {
            builderAppendPath.appendQueryParameter("monochrome", InneractiveMediationDefs.SHOW_HOUSE_AD_YES);
        }
        return builderAppendPath.build();
    }

    @NotNull
    public final KSerializer<n> serializer() {
        return l.f74432a;
    }
}
