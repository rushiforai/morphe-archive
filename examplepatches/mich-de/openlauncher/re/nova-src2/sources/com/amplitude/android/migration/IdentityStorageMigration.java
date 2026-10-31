package com.amplitude.android.migration;

import com.amplitude.common.Logger;
import com.amplitude.core.events.Plan;
import com.amplitude.id.Identity;
import com.amplitude.id.IdentityStorage;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J\u0006\u0010\b\u001a\u00020\tR\u000e\u0010\u0004\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/amplitude/android/migration/IdentityStorageMigration;", b.f42142b, Plan.AMP_PLAN_SOURCE, "Lcom/amplitude/id/IdentityStorage;", "destination", "logger", "Lcom/amplitude/common/Logger;", "(Lcom/amplitude/id/IdentityStorage;Lcom/amplitude/id/IdentityStorage;Lcom/amplitude/common/Logger;)V", "execute", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class IdentityStorageMigration {

    @NotNull
    private final IdentityStorage destination;

    @NotNull
    private final Logger logger;

    @NotNull
    private final IdentityStorage source;

    public IdentityStorageMigration(@NotNull IdentityStorage source, @NotNull IdentityStorage destination, @NotNull Logger logger) {
        Intrinsics.g(source, "source");
        Intrinsics.g(destination, "destination");
        Intrinsics.g(logger, "logger");
        this.source = source;
        this.destination = destination;
        this.logger = logger;
    }

    public final void execute() {
        try {
            Identity identityLoad = this.source.load();
            this.logger.debug("Loaded old identity: " + identityLoad);
            if (identityLoad.getUserId() != null) {
                this.destination.saveUserId(identityLoad.getUserId());
            }
            if (identityLoad.getDeviceId() != null) {
                this.destination.saveDeviceId(identityLoad.getDeviceId());
            }
        } catch (Exception e3) {
            this.logger.error("Unable to migrate file identity storage: " + e3.getMessage());
        }
    }
}
