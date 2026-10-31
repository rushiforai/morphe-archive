package com.instabridge.mobilesdk.internal.data.api;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;

@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0000¨\u0006\u0004"}, d2 = {"devSuffixed", b.f42142b, "debug", b.f42142b, "mobile-sdk_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ApiClientKt {
    @NotNull
    public static final String devSuffixed(@NotNull String str, boolean z11) {
        Intrinsics.g(str, "<this>");
        return (!z11 || j.A0(str, ".dev", false)) ? str : str.concat(".dev");
    }
}
