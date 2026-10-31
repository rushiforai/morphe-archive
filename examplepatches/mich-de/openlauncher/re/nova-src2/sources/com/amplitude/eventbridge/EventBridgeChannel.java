package com.amplitude.eventbridge;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.concurrent.ArrayBlockingQueue;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\b\u0000\u0018\u0000 \u000f2\u00020\u0001:\u0001\u000fB\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u000e\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\bJ\u0010\u0010\u000e\u001a\u00020\f2\b\u0010\t\u001a\u0004\u0018\u00010\nR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/amplitude/eventbridge/EventBridgeChannel;", b.f42142b, "channel", "Lcom/amplitude/eventbridge/EventChannel;", "(Lcom/amplitude/eventbridge/EventChannel;)V", "lock", "queue", "Ljava/util/concurrent/ArrayBlockingQueue;", "Lcom/amplitude/eventbridge/Event;", "receiver", "Lcom/amplitude/eventbridge/EventReceiver;", "sendEvent", b.f42142b, DatabaseConstants.EVENT_FIELD, "setEventReceiver", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class EventBridgeChannel {
    public static final int QUEUE_CAPACITY = 512;

    @NotNull
    private final EventChannel channel;

    @NotNull
    private final Object lock;

    @NotNull
    private final ArrayBlockingQueue<Event> queue;

    @Nullable
    private EventReceiver receiver;

    public EventBridgeChannel(@NotNull EventChannel channel) {
        Intrinsics.g(channel, "channel");
        this.channel = channel;
        this.lock = new Object();
        this.queue = new ArrayBlockingQueue<>(QUEUE_CAPACITY);
    }

    public final void sendEvent(@NotNull Event event) {
        EventReceiver eventReceiver;
        Intrinsics.g(event, "event");
        synchronized (this.lock) {
            try {
                if (this.receiver == null) {
                    this.queue.offer(event);
                }
                eventReceiver = this.receiver;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        if (eventReceiver != null) {
            eventReceiver.receive(this.channel, event);
        }
    }

    public final void setEventReceiver(@Nullable EventReceiver receiver) {
        synchronized (this.lock) {
            if (this.receiver != null) {
                return;
            }
            this.receiver = receiver;
            ArrayList<Event> arrayList = new ArrayList();
            this.queue.drainTo(arrayList);
            for (Event event : arrayList) {
                if (receiver != null) {
                    receiver.receive(this.channel, event);
                }
            }
        }
    }
}
