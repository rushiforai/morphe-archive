package com.amplitude.android.sessionreplay.config;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.gson.Gson;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import gn.c;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0086\b\u0018\u0000 \u00102\u00020\u0001:\u0001\u0010B\u000f\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004J\u000b\u0010\u0007\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\b\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\t\u001a\u00020\n2\b\u0010\u000b\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\f\u001a\u00020\rHÖ\u0001J\b\u0010\u000e\u001a\u00020\u000fH\u0016R\u0018\u0010\u0002\u001a\u0004\u0018\u00010\u00038\u0006X\u0087\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0011"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/RemoteConfig;", b.f42142b, "sessionReplayConfig", "Lcom/amplitude/android/sessionreplay/config/SessionReplayConfig;", "(Lcom/amplitude/android/sessionreplay/config/SessionReplayConfig;)V", "getSessionReplayConfig", "()Lcom/amplitude/android/sessionreplay/config/SessionReplayConfig;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, k.O, "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class RemoteConfig {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final Gson gson;

    @c("sessionReplay")
    private final SessionReplayConfig sessionReplayConfig;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/RemoteConfig$Companion;", b.f42142b, "()V", "gson", "Lcom/google/gson/Gson;", "getGson", "()Lcom/google/gson/Gson;", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public final Gson getGson() {
            return RemoteConfig.gson;
        }

        private Companion() {
        }
    }

    static {
        Gson gsonCreate = new Gson().newBuilder().create();
        Intrinsics.f(gsonCreate, "create(...)");
        gson = gsonCreate;
    }

    public RemoteConfig(SessionReplayConfig sessionReplayConfig) {
        this.sessionReplayConfig = sessionReplayConfig;
    }

    public static /* synthetic */ RemoteConfig copy$default(RemoteConfig remoteConfig, SessionReplayConfig sessionReplayConfig, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            sessionReplayConfig = remoteConfig.sessionReplayConfig;
        }
        return remoteConfig.copy(sessionReplayConfig);
    }

    /* renamed from: component1, reason: from getter */
    public final SessionReplayConfig getSessionReplayConfig() {
        return this.sessionReplayConfig;
    }

    public final RemoteConfig copy(SessionReplayConfig sessionReplayConfig) {
        return new RemoteConfig(sessionReplayConfig);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof RemoteConfig) && Intrinsics.b(this.sessionReplayConfig, ((RemoteConfig) other).sessionReplayConfig);
    }

    public final SessionReplayConfig getSessionReplayConfig() {
        return this.sessionReplayConfig;
    }

    public int hashCode() {
        SessionReplayConfig sessionReplayConfig = this.sessionReplayConfig;
        if (sessionReplayConfig == null) {
            return 0;
        }
        return sessionReplayConfig.hashCode();
    }

    public String toString() {
        String json = gson.toJson(this);
        Intrinsics.f(json, "toJson(...)");
        return json;
    }
}
