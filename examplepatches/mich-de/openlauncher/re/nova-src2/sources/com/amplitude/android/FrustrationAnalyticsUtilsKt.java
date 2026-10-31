package com.amplitude.android;

import b2.t;
import com.amplitude.android.internal.compose.AmpFrustrationIgnoreElement;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0005\u001a%\u0010\u0004\u001a\u00020\u0000*\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00012\b\b\u0002\u0010\u0003\u001a\u00020\u0001¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lb2/t;", b.f42142b, "rageClick", "deadClick", "ignoreFrustrationAnalytics", "(Lb2/t;ZZ)Lb2/t;", "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class FrustrationAnalyticsUtilsKt {
    @NotNull
    public static final t ignoreFrustrationAnalytics(@NotNull t tVar, boolean z11, boolean z12) {
        Intrinsics.g(tVar, "<this>");
        return (z11 || z12) ? tVar.then(new AmpFrustrationIgnoreElement(z11, z12)) : tVar;
    }

    public static /* synthetic */ t ignoreFrustrationAnalytics$default(t tVar, boolean z11, boolean z12, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = true;
        }
        if ((i5 & 2) != 0) {
            z12 = true;
        }
        return ignoreFrustrationAnalytics(tVar, z11, z12);
    }
}
