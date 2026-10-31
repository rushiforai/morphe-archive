package com.amplitude.analytics.connector;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u0000 \u000b2\u00020\u0001:\u0001\u000bB\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\f"}, d2 = {"Lcom/amplitude/analytics/connector/AnalyticsConnector;", b.f42142b, "()V", "eventBridge", "Lcom/amplitude/analytics/connector/EventBridge;", "getEventBridge", "()Lcom/amplitude/analytics/connector/EventBridge;", "identityStore", "Lcom/amplitude/analytics/connector/IdentityStore;", "getIdentityStore", "()Lcom/amplitude/analytics/connector/IdentityStore;", k.O, "analytics-connector_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
/* loaded from: classes2.dex */
public final class AnalyticsConnector {

    @NotNull
    private final EventBridge eventBridge;

    @NotNull
    private final IdentityStore identityStore;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final Object instancesLock = new Object();

    @NotNull
    private static final Map<String, AnalyticsConnector> instances = new LinkedHashMap();

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\b\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\u0005H\u0007R\u001a\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/amplitude/analytics/connector/AnalyticsConnector$Companion;", b.f42142b, "()V", "instances", b.f42142b, b.f42142b, "Lcom/amplitude/analytics/connector/AnalyticsConnector;", "instancesLock", "getInstance", "instanceName", "analytics-connector_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @JvmStatic
        @NotNull
        public final AnalyticsConnector getInstance(@NotNull String instanceName) {
            AnalyticsConnector analyticsConnector;
            Intrinsics.g(instanceName, "instanceName");
            synchronized (AnalyticsConnector.instancesLock) {
                try {
                    Map map = AnalyticsConnector.instances;
                    Object analyticsConnector2 = map.get(instanceName);
                    if (analyticsConnector2 == null) {
                        analyticsConnector2 = new AnalyticsConnector(null);
                        map.put(instanceName, analyticsConnector2);
                    }
                    analyticsConnector = (AnalyticsConnector) analyticsConnector2;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return analyticsConnector;
        }

        private Companion() {
        }
    }

    public /* synthetic */ AnalyticsConnector(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    @JvmStatic
    @NotNull
    public static final AnalyticsConnector getInstance(@NotNull String str) {
        return INSTANCE.getInstance(str);
    }

    @NotNull
    public final EventBridge getEventBridge() {
        return this.eventBridge;
    }

    @NotNull
    public final IdentityStore getIdentityStore() {
        return this.identityStore;
    }

    private AnalyticsConnector() {
        this.identityStore = new IdentityStoreImpl();
        this.eventBridge = new EventBridgeImpl();
    }
}
