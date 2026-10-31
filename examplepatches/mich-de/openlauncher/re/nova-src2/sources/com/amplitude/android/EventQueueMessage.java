package com.amplitude.android;

import a2.c;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001:\u0003\u0003\u0004\u0005B\u0007\b\u0004¢\u0006\u0002\u0010\u0002\u0082\u0001\u0003\u0006\u0007\b¨\u0006\t"}, d2 = {"Lcom/amplitude/android/EventQueueMessage;", b.f42142b, "()V", "EnterForeground", "Event", "ExitForeground", "Lcom/amplitude/android/EventQueueMessage$EnterForeground;", "Lcom/amplitude/android/EventQueueMessage$Event;", "Lcom/amplitude/android/EventQueueMessage$ExitForeground;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public abstract class EventQueueMessage {

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lcom/amplitude/android/EventQueueMessage$EnterForeground;", "Lcom/amplitude/android/EventQueueMessage;", "timestamp", b.f42142b, "(J)V", "getTimestamp", "()J", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class EnterForeground extends EventQueueMessage {
        private final long timestamp;

        public EnterForeground(long j11) {
            super(null);
            this.timestamp = j11;
        }

        public static /* synthetic */ EnterForeground copy$default(EnterForeground enterForeground, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = enterForeground.timestamp;
            }
            return enterForeground.copy(j11);
        }

        /* renamed from: component1, reason: from getter */
        public final long getTimestamp() {
            return this.timestamp;
        }

        @NotNull
        public final EnterForeground copy(long timestamp) {
            return new EnterForeground(timestamp);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof EnterForeground) && this.timestamp == ((EnterForeground) other).timestamp;
        }

        public final long getTimestamp() {
            return this.timestamp;
        }

        public int hashCode() {
            return Long.hashCode(this.timestamp);
        }

        @NotNull
        public String toString() {
            return c.n(new StringBuilder("EnterForeground(timestamp="), this.timestamp, ')');
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lcom/amplitude/android/EventQueueMessage$Event;", "Lcom/amplitude/android/EventQueueMessage;", DatabaseConstants.EVENT_FIELD, "Lcom/amplitude/core/events/BaseEvent;", "(Lcom/amplitude/core/events/BaseEvent;)V", "getEvent", "()Lcom/amplitude/core/events/BaseEvent;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class Event extends EventQueueMessage {

        @NotNull
        private final BaseEvent event;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public Event(@NotNull BaseEvent event) {
            super(null);
            Intrinsics.g(event, "event");
            this.event = event;
        }

        public static /* synthetic */ Event copy$default(Event event, BaseEvent baseEvent, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                baseEvent = event.event;
            }
            return event.copy(baseEvent);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final BaseEvent getEvent() {
            return this.event;
        }

        @NotNull
        public final Event copy(@NotNull BaseEvent event) {
            Intrinsics.g(event, "event");
            return new Event(event);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Event) && Intrinsics.b(this.event, ((Event) other).event);
        }

        @NotNull
        public final BaseEvent getEvent() {
            return this.event;
        }

        public int hashCode() {
            return this.event.hashCode();
        }

        @NotNull
        public String toString() {
            return "Event(event=" + this.event + ')';
        }
    }

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\t\u0010\u0007\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\b\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\fHÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lcom/amplitude/android/EventQueueMessage$ExitForeground;", "Lcom/amplitude/android/EventQueueMessage;", "timestamp", b.f42142b, "(J)V", "getTimestamp", "()J", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class ExitForeground extends EventQueueMessage {
        private final long timestamp;

        public ExitForeground(long j11) {
            super(null);
            this.timestamp = j11;
        }

        public static /* synthetic */ ExitForeground copy$default(ExitForeground exitForeground, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = exitForeground.timestamp;
            }
            return exitForeground.copy(j11);
        }

        /* renamed from: component1, reason: from getter */
        public final long getTimestamp() {
            return this.timestamp;
        }

        @NotNull
        public final ExitForeground copy(long timestamp) {
            return new ExitForeground(timestamp);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof ExitForeground) && this.timestamp == ((ExitForeground) other).timestamp;
        }

        public final long getTimestamp() {
            return this.timestamp;
        }

        public int hashCode() {
            return Long.hashCode(this.timestamp);
        }

        @NotNull
        public String toString() {
            return c.n(new StringBuilder("ExitForeground(timestamp="), this.timestamp, ')');
        }
    }

    public /* synthetic */ EventQueueMessage(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    private EventQueueMessage() {
    }
}
