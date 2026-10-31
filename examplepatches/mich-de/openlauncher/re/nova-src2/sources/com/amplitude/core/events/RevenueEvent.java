package com.amplitude.core.events;

import com.amplitude.core.Constants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\b\u0016\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002R\u001a\u0010\u0003\u001a\u00020\u0004X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/amplitude/core/events/RevenueEvent;", "Lcom/amplitude/core/events/BaseEvent;", "()V", "eventType", b.f42142b, "getEventType", "()Ljava/lang/String;", "setEventType", "(Ljava/lang/String;)V", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public class RevenueEvent extends BaseEvent {

    @NotNull
    private String eventType = Constants.AMP_REVENUE_EVENT;

    @Override // com.amplitude.core.events.BaseEvent
    @NotNull
    public String getEventType() {
        return this.eventType;
    }

    @Override // com.amplitude.core.events.BaseEvent
    public void setEventType(@NotNull String str) {
        Intrinsics.g(str, "<set-?>");
        this.eventType = str;
    }
}
