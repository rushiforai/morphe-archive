package com.amplitude.android.sessionreplay.config;

import com.amplitude.K3;
import com.amplitude.core.ServerZone;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u001d\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0001\u001a\u00020\u00002\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Lcom/amplitude/core/ServerZone;", "serverZone", "Lcom/amplitude/K3;", "logger", "Lcom/amplitude/android/sessionreplay/config/RemoteConfigServer;", "RemoteConfigServer", "(Lcom/amplitude/core/ServerZone;Lcom/amplitude/K3;)Lcom/amplitude/android/sessionreplay/config/RemoteConfigServer;", "session-replay_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class RemoteConfigServerKt {

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[ServerZone.values().length];
            try {
                iArr[ServerZone.US.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            try {
                iArr[ServerZone.EU.ordinal()] = 2;
            } catch (NoSuchFieldError unused2) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public static final RemoteConfigServer RemoteConfigServer(ServerZone serverZone, K3 logger) {
        String str;
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(logger, "logger");
        int i5 = WhenMappings.$EnumSwitchMapping$0[serverZone.ordinal()];
        if (i5 == 1) {
            str = RemoteConfigServer.US_SERVER_URL;
        } else {
            if (i5 != 2) {
                throw new NoWhenBranchMatchedException();
            }
            str = RemoteConfigServer.EU_SERVER_URL;
        }
        return new RemoteConfigServer(str, logger);
    }
}
