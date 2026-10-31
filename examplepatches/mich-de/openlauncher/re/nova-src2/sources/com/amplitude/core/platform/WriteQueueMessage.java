package com.amplitude.core.platform;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\f\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\r\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000e\u001a\u00020\u000f2\b\u0010\u0010\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u0015"}, d2 = {"Lcom/amplitude/core/platform/WriteQueueMessage;", b.f42142b, TTConst.TRACK_TYPE, "Lcom/amplitude/core/platform/WriteQueueMessageType;", DatabaseConstants.EVENT_FIELD, "Lcom/amplitude/core/events/BaseEvent;", "(Lcom/amplitude/core/platform/WriteQueueMessageType;Lcom/amplitude/core/events/BaseEvent;)V", "getEvent", "()Lcom/amplitude/core/events/BaseEvent;", "getType", "()Lcom/amplitude/core/platform/WriteQueueMessageType;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class WriteQueueMessage {

    @Nullable
    private final BaseEvent event;

    @NotNull
    private final WriteQueueMessageType type;

    public WriteQueueMessage(@NotNull WriteQueueMessageType type, @Nullable BaseEvent baseEvent) {
        Intrinsics.g(type, "type");
        this.type = type;
        this.event = baseEvent;
    }

    public static /* synthetic */ WriteQueueMessage copy$default(WriteQueueMessage writeQueueMessage, WriteQueueMessageType writeQueueMessageType, BaseEvent baseEvent, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            writeQueueMessageType = writeQueueMessage.type;
        }
        if ((i5 & 2) != 0) {
            baseEvent = writeQueueMessage.event;
        }
        return writeQueueMessage.copy(writeQueueMessageType, baseEvent);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final WriteQueueMessageType getType() {
        return this.type;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final BaseEvent getEvent() {
        return this.event;
    }

    @NotNull
    public final WriteQueueMessage copy(@NotNull WriteQueueMessageType type, @Nullable BaseEvent event) {
        Intrinsics.g(type, "type");
        return new WriteQueueMessage(type, event);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof WriteQueueMessage)) {
            return false;
        }
        WriteQueueMessage writeQueueMessage = (WriteQueueMessage) other;
        return this.type == writeQueueMessage.type && Intrinsics.b(this.event, writeQueueMessage.event);
    }

    @Nullable
    public final BaseEvent getEvent() {
        return this.event;
    }

    @NotNull
    public final WriteQueueMessageType getType() {
        return this.type;
    }

    public int hashCode() {
        int iHashCode = this.type.hashCode() * 31;
        BaseEvent baseEvent = this.event;
        return iHashCode + (baseEvent == null ? 0 : baseEvent.hashCode());
    }

    @NotNull
    public String toString() {
        return "WriteQueueMessage(type=" + this.type + ", event=" + this.event + ')';
    }
}
