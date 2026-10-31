package com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport;

import com.moloco.sdk.internal.MolocoLogger;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* loaded from: classes4.dex */
public final class k {
    @Nullable
    public static final o7.g a(@NotNull String str) {
        Intrinsics.g(str, "<this>");
        try {
            Pair[] pairArr = {new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str)};
            vm.c cVar = new vm.c(19);
            Pair pair = pairArr[0];
            cVar.s(pair.f71684b, (String) pair.f71683a);
            return cVar.d();
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, j.f42231d, e3.getMessage() + ". Url: " + str, null, false, 12, null);
            return null;
        }
    }
}
