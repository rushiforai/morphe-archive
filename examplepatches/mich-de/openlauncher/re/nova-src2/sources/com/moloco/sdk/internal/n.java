package com.moloco.sdk.internal;

import com.moloco.sdk.publisher.MediationInfo;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes.dex */
public final class n {
    public static /* synthetic */ void a(o50.n nVar, String str, String str2, MediationInfo mediationInfo, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            mediationInfo = null;
        }
        a(nVar, str, str2, mediationInfo);
    }

    public static final void a(@NotNull o50.n nVar, @Nullable String str, @Nullable String str2, @Nullable MediationInfo mediationInfo) {
        Intrinsics.g(nVar, "<this>");
        StringBuilder sb2 = new StringBuilder();
        if (str != null) {
            sb2.append("MolocoSDK/" + str + ';');
        }
        if (mediationInfo != null) {
            sb2.append("Mediator/" + mediationInfo.getName() + ';');
        }
        if (str2 != null) {
            sb2.append("Android/" + str2 + ';');
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        nVar.d("X-Moloco-User-Agent", string);
    }
}
