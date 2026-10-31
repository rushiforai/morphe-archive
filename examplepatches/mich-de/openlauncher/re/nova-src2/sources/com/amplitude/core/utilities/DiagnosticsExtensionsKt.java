package com.amplitude.core.utilities;

import b70.c;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.diagnostics.DiagnosticsClient;
import com.amplitude.core.events.BaseEvent;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\u001a*\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u00020\u00050\u00042\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH\u0000¨\u0006\n"}, d2 = {"recordEventOutcome", b.f42142b, "Lcom/amplitude/core/diagnostics/DiagnosticsClient;", DatabaseConstants.EVENT_TABLE_NAME, b.f42142b, "Lcom/amplitude/core/events/BaseEvent;", "status", b.f42142b, PglCryptUtils.KEY_MESSAGE, b.f42142b, "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class DiagnosticsExtensionsKt {
    public static final void recordEventOutcome(@NotNull DiagnosticsClient diagnosticsClient, @NotNull List<? extends BaseEvent> events, int i5, @NotNull String message) {
        Intrinsics.g(diagnosticsClient, "<this>");
        Intrinsics.g(events, "events");
        Intrinsics.g(message, "message");
        if (events.isEmpty()) {
            return;
        }
        if (200 <= i5 && i5 < 300) {
            diagnosticsClient.increment("analytics.events.sent", events.size());
            return;
        }
        diagnosticsClient.increment("analytics.events.dropped", events.size());
        List<? extends BaseEvent> list = events;
        ArrayList arrayList = new ArrayList(c.u0(list, 10));
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((BaseEvent) it.next()).getEventType());
        }
        diagnosticsClient.recordEvent("analytics.events.dropped", MapsKt.j0(new Pair(DatabaseConstants.EVENT_TABLE_NAME, arrayList), new Pair("count", Integer.valueOf(events.size())), new Pair(TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, Integer.valueOf(i5)), new Pair(PglCryptUtils.KEY_MESSAGE, message)));
    }
}
