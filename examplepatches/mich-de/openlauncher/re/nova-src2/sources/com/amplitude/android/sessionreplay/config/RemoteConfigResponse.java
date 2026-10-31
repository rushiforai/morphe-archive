package com.amplitude.android.sessionreplay.config;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import gn.c;
import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004R\u0018\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/RemoteConfigResponse;", b.f42142b, "remoteConfig", "Lcom/amplitude/android/sessionreplay/config/RemoteConfig;", "(Lcom/amplitude/android/sessionreplay/config/RemoteConfig;)V", "getRemoteConfig", "()Lcom/amplitude/android/sessionreplay/config/RemoteConfig;", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class RemoteConfigResponse {

    @c("configs")
    private final RemoteConfig remoteConfig;

    public RemoteConfigResponse(RemoteConfig remoteConfig) {
        this.remoteConfig = remoteConfig;
    }

    public final RemoteConfig getRemoteConfig() {
        return this.remoteConfig;
    }
}
