package com.amplitude.eventbridge;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u0000 \u00072\u00020\u0001:\u0001\u0007B\u0005¢\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\b"}, d2 = {"Lcom/amplitude/eventbridge/EventBridgeContainer;", b.f42142b, "()V", "eventBridge", "Lcom/amplitude/eventbridge/EventBridge;", "getEventBridge", "()Lcom/amplitude/eventbridge/EventBridge;", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class EventBridgeContainer {

    @NotNull
    private final EventBridge eventBridge = new EventBridgeImpl();

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final Object instancesLock = new Object();

    @NotNull
    private static final Map<String, EventBridgeContainer> instances = new LinkedHashMap();

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\b\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0005H\u0007R\u001a\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/amplitude/eventbridge/EventBridgeContainer$Companion;", b.f42142b, "()V", "instances", b.f42142b, b.f42142b, "Lcom/amplitude/eventbridge/EventBridgeContainer;", "instancesLock", "getInstance", "instanceName", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @JvmStatic
        @NotNull
        public final EventBridgeContainer getInstance(@NotNull String instanceName) {
            EventBridgeContainer eventBridgeContainer;
            Intrinsics.g(instanceName, "instanceName");
            synchronized (EventBridgeContainer.instancesLock) {
                try {
                    Map map = EventBridgeContainer.instances;
                    Object eventBridgeContainer2 = map.get(instanceName);
                    if (eventBridgeContainer2 == null) {
                        eventBridgeContainer2 = new EventBridgeContainer();
                        map.put(instanceName, eventBridgeContainer2);
                    }
                    eventBridgeContainer = (EventBridgeContainer) eventBridgeContainer2;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return eventBridgeContainer;
        }

        private Companion() {
        }
    }

    @JvmStatic
    @NotNull
    public static final EventBridgeContainer getInstance(@NotNull String str) {
        return INSTANCE.getInstance(str);
    }

    @NotNull
    public final EventBridge getEventBridge() {
        return this.eventBridge;
    }
}
