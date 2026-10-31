package com.amplitude.android.sessionreplay.config;

import android.content.Context;
import com.amplitude.C0361a0;
import com.amplitude.F2;
import com.amplitude.H0;
import com.amplitude.I2;
import com.amplitude.K3;
import com.amplitude.S;
import com.amplitude.W;
import com.amplitude.X;
import com.amplitude.Y;
import com.amplitude.Z;
import com.amplitude.common.Logger;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.m0;

@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0011\b\u0000\u0018\u00002\u00020\u0001BG\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0011\u0010\u0012JW\u0010\u001f\u001a\u00020\u001b2\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u000226\u0010\u001c\u001a2\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u001a\u0012\u0004\u0012\u00020\u001b0\u0016H\u0000¢\u0006\u0004\b\u001d\u0010\u001eJO\u0010$\u001a\u00020\u001b2\u0006\u0010!\u001a\u00020 26\u0010\u001c\u001a2\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0013\u0012\u00110\u0007¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u001a\u0012\u0004\u0012\u00020\u001b0\u0016H\u0000¢\u0006\u0004\b\"\u0010#J\u0019\u0010(\u001a\u00020\u001b2\b\b\u0002\u0010%\u001a\u00020\u0002H\u0000¢\u0006\u0004\b&\u0010'R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010)R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010*R\u0014\u0010\u0006\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010*R\u0016\u0010\b\u001a\u00020\u00078\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\b\u0010+R\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u0010,R\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010-R\u0014\u0010\u000e\u001a\u00020\r8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010.R\u0014\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010/R\u0016\u00100\u001a\u00020\u00028\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b0\u0010)¨\u00061"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/ConfigManager;", b.f42142b, b.f42142b, "apiKey", b.f42142b, "optOut", "enableRemoteConfig", "Lcom/amplitude/android/sessionreplay/config/SessionReplayConfig;", "sessionReplayConfig", "Lcom/amplitude/android/sessionreplay/config/RemoteConfigServer;", "remoteConfigServer", "Lcom/amplitude/H0;", PlaceTypes.STORAGE, "Lcom/amplitude/I2;", "sessionReplayDispatchers", "Lcom/amplitude/K3;", "sessionReplayLogger", "<init>", "(Ljava/lang/String;ZZLcom/amplitude/android/sessionreplay/config/SessionReplayConfig;Lcom/amplitude/android/sessionreplay/config/RemoteConfigServer;Lcom/amplitude/H0;Lcom/amplitude/I2;Lcom/amplitude/K3;)V", "Landroid/content/Context;", "context", PlaceTypes.LIBRARY, "Lkotlin/Function2;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "oldConfig", "newConfig", b.f42142b, "onConfigChangedHandler", "fetchRemoteConfig$session_replay_release", "(Landroid/content/Context;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V", "fetchRemoteConfig", "Lcom/amplitude/android/sessionreplay/config/RemoteConfig;", "remoteConfig", "updateConfigWithRemoteConfig$session_replay_release", "(Lcom/amplitude/android/sessionreplay/config/RemoteConfig;Lkotlin/jvm/functions/Function2;)V", "updateConfigWithRemoteConfig", "title", "logConfig$session_replay_release", "(Ljava/lang/String;)V", "logConfig", "Ljava/lang/String;", "Z", "Lcom/amplitude/android/sessionreplay/config/SessionReplayConfig;", "Lcom/amplitude/android/sessionreplay/config/RemoteConfigServer;", "Lcom/amplitude/H0;", "Lcom/amplitude/I2;", "Lcom/amplitude/K3;", "configSource", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ConfigManager {
    private final String apiKey;
    private String configSource;
    private final boolean enableRemoteConfig;
    private final boolean optOut;
    private final RemoteConfigServer remoteConfigServer;
    private SessionReplayConfig sessionReplayConfig;
    private final I2 sessionReplayDispatchers;
    private final K3 sessionReplayLogger;
    private final H0 storage;

    public ConfigManager(String apiKey, boolean z11, boolean z12, SessionReplayConfig sessionReplayConfig, RemoteConfigServer remoteConfigServer, H0 storage, I2 sessionReplayDispatchers, K3 sessionReplayLogger) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(sessionReplayConfig, "sessionReplayConfig");
        Intrinsics.g(remoteConfigServer, "remoteConfigServer");
        Intrinsics.g(storage, "storage");
        Intrinsics.g(sessionReplayDispatchers, "sessionReplayDispatchers");
        Intrinsics.g(sessionReplayLogger, "sessionReplayLogger");
        this.apiKey = apiKey;
        this.optOut = z11;
        this.enableRemoteConfig = z12;
        this.sessionReplayConfig = sessionReplayConfig;
        this.remoteConfigServer = remoteConfigServer;
        this.storage = storage;
        this.sessionReplayDispatchers = sessionReplayDispatchers;
        this.sessionReplayLogger = sessionReplayLogger;
        this.configSource = "local";
    }

    public static /* synthetic */ void logConfig$session_replay_release$default(ConfigManager configManager, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = "Current Configuration:";
        }
        configManager.logConfig$session_replay_release(str);
    }

    public final void fetchRemoteConfig$session_replay_release(Context context, String library, Function2<? super SessionReplayConfig, ? super SessionReplayConfig, Unit> onConfigChangedHandler) {
        Intrinsics.g(context, "context");
        Intrinsics.g(library, "library");
        Intrinsics.g(onConfigChangedHandler, "onConfigChangedHandler");
        if (!this.enableRemoteConfig) {
            K3 k32 = this.sessionReplayLogger;
            k32.getClass();
            Logger logger = k32.f20306a;
            if (logger != null) {
                logger.info("Remote config disabled, using local config");
            }
            logConfig$session_replay_release$default(this, null, 1, null);
            return;
        }
        try {
            RemoteConfig remoteConfigFetchFromStorage = this.remoteConfigServer.fetchFromStorage(this.storage);
            if (remoteConfigFetchFromStorage == null) {
                this.configSource = "local";
                K3 k33 = this.sessionReplayLogger;
                k33.getClass();
                Logger logger2 = k33.f20306a;
                if (logger2 != null) {
                    logger2.warn("Missing stored config, using local config");
                }
            } else {
                this.configSource = PlaceTypes.STORAGE;
                updateConfigWithRemoteConfig$session_replay_release(remoteConfigFetchFromStorage, onConfigChangedHandler);
            }
        } catch (Exception e3) {
            this.sessionReplayLogger.a(e3, new S(e3));
        }
        I2 i22 = this.sessionReplayDispatchers;
        W w10 = new W(this, context, library, onConfigChangedHandler, null);
        i22.getClass();
        m0.t(i22.f20272a, i22.f20273b, null, new F2(w10, null), 2);
        logConfig$session_replay_release$default(this, null, 1, null);
    }

    public final void logConfig$session_replay_release(String title) {
        Intrinsics.g(title, "title");
        this.sessionReplayLogger.c(new X(this, title));
    }

    public final void updateConfigWithRemoteConfig$session_replay_release(RemoteConfig remoteConfig, Function2<? super SessionReplayConfig, ? super SessionReplayConfig, Unit> onConfigChangedHandler) {
        Intrinsics.g(remoteConfig, "remoteConfig");
        Intrinsics.g(onConfigChangedHandler, "onConfigChangedHandler");
        SessionReplayConfig sessionReplayConfig = remoteConfig.getSessionReplayConfig();
        if (sessionReplayConfig == null) {
            this.sessionReplayLogger.d(Y.f20433a);
            return;
        }
        SessionReplayConfig sessionReplayConfig2 = this.sessionReplayConfig;
        PrivacyConfig privacyConfig = sessionReplayConfig.getPrivacyConfig();
        SamplingConfig samplingConfig = sessionReplayConfig.getSamplingConfig();
        PrivacyConfig privacyConfig2 = this.sessionReplayConfig.getPrivacyConfig();
        if (privacyConfig != null) {
            privacyConfig2 = new PrivacyConfig(privacyConfig.getMaskLevel());
        } else {
            this.sessionReplayLogger.d(Z.f20449a);
        }
        SamplingConfig samplingConfig2 = this.sessionReplayConfig.getSamplingConfig();
        if (samplingConfig != null) {
            Boolean captureEnabled = samplingConfig.getCaptureEnabled();
            Double sampleRate = null;
            if (captureEnabled == null) {
                captureEnabled = samplingConfig2 != null ? samplingConfig2.getCaptureEnabled() : null;
            }
            Double sampleRate2 = samplingConfig.getSampleRate();
            if (sampleRate2 != null) {
                sampleRate = sampleRate2;
            } else if (samplingConfig2 != null) {
                sampleRate = samplingConfig2.getSampleRate();
            }
            samplingConfig2 = new SamplingConfig(captureEnabled, sampleRate);
        } else {
            this.sessionReplayLogger.d(C0361a0.f20463a);
        }
        SessionReplayConfig sessionReplayConfig3 = new SessionReplayConfig(privacyConfig2, samplingConfig2);
        this.sessionReplayConfig = sessionReplayConfig3;
        onConfigChangedHandler.invoke(sessionReplayConfig2, sessionReplayConfig3);
    }
}
