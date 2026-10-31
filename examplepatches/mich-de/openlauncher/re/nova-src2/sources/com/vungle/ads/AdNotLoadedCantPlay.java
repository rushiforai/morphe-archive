package com.vungle.ads;

import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.iab.omid.library.vungle.d;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0011\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"Lcom/vungle/ads/AdNotLoadedCantPlay;", "Lcom/vungle/ads/VungleError;", PglCryptUtils.KEY_MESSAGE, b.f42142b, "(Ljava/lang/String;)V", "vungle-ads_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class AdNotLoadedCantPlay extends VungleError {
    /* JADX WARN: Multi-variable type inference failed */
    public AdNotLoadedCantPlay() {
        this(null, 1, 0 == true ? 1 : 0);
    }

    public /* synthetic */ AdNotLoadedCantPlay(String str, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : str);
    }

    public AdNotLoadedCantPlay(@Nullable String str) {
        super(Sdk.SDKError.Reason.AD_NOT_LOADED, d.a("Failed to retrieve the ad object: ", str), null);
    }
}
