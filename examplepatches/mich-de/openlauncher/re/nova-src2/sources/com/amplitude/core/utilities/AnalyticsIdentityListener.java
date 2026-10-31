package com.amplitude.core.utilities;

import com.amplitude.core.State;
import com.amplitude.id.Identity;
import com.amplitude.id.IdentityListener;
import com.amplitude.id.IdentityUpdateType;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Deprecated
@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0012\u0010\u0005\u001a\u00020\u00062\b\u0010\u0007\u001a\u0004\u0018\u00010\bH\u0016J\u0018\u0010\t\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rH\u0016J\u0012\u0010\u000e\u001a\u00020\u00062\b\u0010\u000f\u001a\u0004\u0018\u00010\bH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/amplitude/core/utilities/AnalyticsIdentityListener;", "Lcom/amplitude/id/IdentityListener;", "state", "Lcom/amplitude/core/State;", "(Lcom/amplitude/core/State;)V", "onDeviceIdChange", b.f42142b, "deviceId", b.f42142b, "onIdentityChanged", "identity", "Lcom/amplitude/id/Identity;", "updateType", "Lcom/amplitude/id/IdentityUpdateType;", "onUserIdChange", "userId", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AnalyticsIdentityListener implements IdentityListener {

    @NotNull
    private final State state;

    public AnalyticsIdentityListener(@NotNull State state) {
        Intrinsics.g(state, "state");
        this.state = state;
    }

    @Override // com.amplitude.id.IdentityListener
    public void onDeviceIdChange(@Nullable String deviceId) {
    }

    @Override // com.amplitude.id.IdentityListener
    public void onIdentityChanged(@NotNull Identity identity, @NotNull IdentityUpdateType updateType) {
        Intrinsics.g(identity, "identity");
        Intrinsics.g(updateType, "updateType");
    }

    @Override // com.amplitude.id.IdentityListener
    public void onUserIdChange(@Nullable String userId) {
    }
}
