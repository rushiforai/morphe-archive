package com.amplitude.id;

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

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u0000 \u000b2\u00020\u0001:\u0001\u000bB\u000f\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\f"}, d2 = {"Lcom/amplitude/id/IdentityContainer;", b.f42142b, "configuration", "Lcom/amplitude/id/IdentityConfiguration;", "(Lcom/amplitude/id/IdentityConfiguration;)V", "getConfiguration", "()Lcom/amplitude/id/IdentityConfiguration;", "identityManager", "Lcom/amplitude/id/IdentityManager;", "getIdentityManager", "()Lcom/amplitude/id/IdentityManager;", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class IdentityContainer {

    @NotNull
    private final IdentityConfiguration configuration;

    @NotNull
    private final IdentityManager identityManager;

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final Object instancesLock = new Object();

    @NotNull
    private static final Map<String, IdentityContainer> instances = new LinkedHashMap();

    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\b\u0010\b\u001a\u00020\tH\u0007J\u0010\u0010\n\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\fH\u0007R\u001a\u0010\u0003\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\r"}, d2 = {"Lcom/amplitude/id/IdentityContainer$Companion;", b.f42142b, "()V", "instances", b.f42142b, b.f42142b, "Lcom/amplitude/id/IdentityContainer;", "instancesLock", "clearInstanceCache", b.f42142b, "getInstance", "configuration", "Lcom/amplitude/id/IdentityConfiguration;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    @SourceDebugExtension
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @JvmStatic
        public final void clearInstanceCache() {
            IdentityContainer.instances.clear();
        }

        @JvmStatic
        @NotNull
        public final IdentityContainer getInstance(@NotNull IdentityConfiguration configuration) {
            IdentityContainer identityContainer;
            Intrinsics.g(configuration, "configuration");
            synchronized (IdentityContainer.instancesLock) {
                try {
                    Map map = IdentityContainer.instances;
                    String instanceName = configuration.getInstanceName();
                    Object identityContainer2 = map.get(instanceName);
                    if (identityContainer2 == null) {
                        identityContainer2 = new IdentityContainer(configuration, null);
                        map.put(instanceName, identityContainer2);
                    }
                    identityContainer = (IdentityContainer) identityContainer2;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return identityContainer;
        }

        private Companion() {
        }
    }

    public /* synthetic */ IdentityContainer(IdentityConfiguration identityConfiguration, DefaultConstructorMarker defaultConstructorMarker) {
        this(identityConfiguration);
    }

    @JvmStatic
    public static final void clearInstanceCache() {
        INSTANCE.clearInstanceCache();
    }

    @JvmStatic
    @NotNull
    public static final IdentityContainer getInstance(@NotNull IdentityConfiguration identityConfiguration) {
        return INSTANCE.getInstance(identityConfiguration);
    }

    @NotNull
    public final IdentityConfiguration getConfiguration() {
        return this.configuration;
    }

    @NotNull
    public final IdentityManager getIdentityManager() {
        return this.identityManager;
    }

    private IdentityContainer(IdentityConfiguration identityConfiguration) {
        this.configuration = identityConfiguration;
        this.identityManager = new IdentityManagerImpl(identityConfiguration.getIdentityStorageProvider().getIdentityStorage(identityConfiguration), null, 2, null);
    }
}
