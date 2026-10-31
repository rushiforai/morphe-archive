package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import java.util.Locale;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@SourceDebugExtension
/* renamed from: com.moloco.sdk.internal.publisher.h, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2946h {
    public static final String a(Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> function0) {
        String strName;
        if (function0 == null) {
            return null;
        }
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j jVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j) function0.invoke();
        String lowerCase = (jVar == null || (strName = jVar.name()) == null) ? "UNKNOWN".toLowerCase(Locale.ROOT) : strName.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return lowerCase;
    }

    @NotNull
    public static final CountEvent a(@NotNull CountEvent countEvent, @Nullable Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> function0) {
        CountEvent countEventWithTag;
        Intrinsics.g(countEvent, "<this>");
        String strA = a(function0);
        return (strA == null || (countEventWithTag = countEvent.withTag(com.moloco.sdk.internal.client_metrics_data.d.f36300h.c(), strA)) == null) ? countEvent : countEventWithTag;
    }

    @NotNull
    public static final TimerEvent a(@NotNull TimerEvent timerEvent, @Nullable Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> function0) {
        TimerEvent timerEventWithTag;
        Intrinsics.g(timerEvent, "<this>");
        String strA = a(function0);
        return (strA == null || (timerEventWithTag = timerEvent.withTag(com.moloco.sdk.internal.client_metrics_data.d.f36300h.c(), strA)) == null) ? timerEvent : timerEventWithTag;
    }
}
