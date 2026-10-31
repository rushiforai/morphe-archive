package com.amplitude.android.sessionreplay.config;

import com.amplitude.A2;
import com.amplitude.B2;
import com.amplitude.C0543y3;
import com.amplitude.C0547z2;
import com.amplitude.H0;
import com.amplitude.K3;
import com.amplitude.N1;
import com.amplitude.O3;
import com.amplitude.P3;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.amplitude.id.FileIdentityStorage;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\r\u0018\u0000 \u00182\u00020\u0001:\u0001\u0018B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J#\u0010\r\u001a\u0004\u0018\u00010\f2\u0006\u0010\t\u001a\u00020\b2\b\u0010\u000b\u001a\u0004\u0018\u00010\nH\u0002¢\u0006\u0004\b\r\u0010\u000eJ3\u0010\u0012\u001a\u0004\u0018\u00010\f2\u0006\u0010\u000f\u001a\u00020\u00022\u0006\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u0011\u001a\u00020\u00022\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\n¢\u0006\u0004\b\u0012\u0010\u0013J\u0017\u0010\u0014\u001a\u0004\u0018\u00010\f2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\u0014\u0010\u0015R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0016R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u0017¨\u0006\u0019"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/RemoteConfigServer;", b.f42142b, b.f42142b, "serverUrl", "Lcom/amplitude/K3;", "logger", "<init>", "(Ljava/lang/String;Lcom/amplitude/K3;)V", "Lcom/amplitude/P3;", "response", "Lcom/amplitude/H0;", PlaceTypes.STORAGE, "Lcom/amplitude/android/sessionreplay/config/RemoteConfig;", "handleResponse", "(Lcom/amplitude/P3;Lcom/amplitude/H0;)Lcom/amplitude/android/sessionreplay/config/RemoteConfig;", "apiKey", "packageName", PlaceTypes.LIBRARY, "fetch", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/amplitude/H0;)Lcom/amplitude/android/sessionreplay/config/RemoteConfig;", "fetchFromStorage", "(Lcom/amplitude/H0;)Lcom/amplitude/android/sessionreplay/config/RemoteConfig;", "Ljava/lang/String;", "Lcom/amplitude/K3;", k.O, "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class RemoteConfigServer {

    /* renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    public static final String EU_SERVER_URL = "https://sr-client-cfg.eu.amplitude.com/config";
    public static final String STORAGE_KEY = "remote-config";
    public static final String US_SERVER_URL = "https://sr-client-cfg.amplitude.com/config";
    private static final Gson gson;
    private final K3 logger;
    private final String serverUrl;

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Lcom/amplitude/android/sessionreplay/config/RemoteConfigServer$Companion;", b.f42142b, "()V", "EU_SERVER_URL", b.f42142b, "STORAGE_KEY", "US_SERVER_URL", "gson", "Lcom/google/gson/Gson;", "getGson", "()Lcom/google/gson/Gson;", "session-replay_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public final Gson getGson() {
            return RemoteConfigServer.gson;
        }

        private Companion() {
        }
    }

    static {
        Gson gsonCreate = new Gson().newBuilder().create();
        Intrinsics.f(gsonCreate, "create(...)");
        gson = gsonCreate;
    }

    public RemoteConfigServer(String serverUrl, K3 logger) {
        Intrinsics.g(serverUrl, "serverUrl");
        Intrinsics.g(logger, "logger");
        this.serverUrl = serverUrl;
        this.logger = logger;
    }

    public static /* synthetic */ RemoteConfig fetch$default(RemoteConfigServer remoteConfigServer, String str, String str2, String str3, H0 h02, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            h02 = null;
        }
        return remoteConfigServer.fetch(str, str2, str3, h02);
    }

    private final RemoteConfig handleResponse(P3 response, H0 storage) {
        if (response.f20359a != 200) {
            this.logger.d(new A2(response));
            return null;
        }
        String str = b.f42142b;
        if (storage != null) {
            String str2 = response.f20360b;
            if (str2 == null) {
                str2 = b.f42142b;
            }
            ((C0543y3) storage).a(STORAGE_KEY, str2);
        }
        try {
            Gson gson2 = gson;
            String str3 = response.f20360b;
            if (str3 != null) {
                str = str3;
            }
            RemoteConfigResponse remoteConfigResponse = (RemoteConfigResponse) gson2.fromJson(str, RemoteConfigResponse.class);
            if (remoteConfigResponse != null) {
                return remoteConfigResponse.getRemoteConfig();
            }
            return null;
        } catch (JsonSyntaxException e3) {
            this.logger.d(new B2(e3));
            return null;
        }
    }

    public final RemoteConfig fetch(String apiKey, String packageName, String library, H0 storage) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(library, "library");
        return handleResponse(new O3("GET", this.serverUrl, null, MapsKt.j0(new Pair("Content-Type", "application/json"), new Pair("Accept", "*/*"), new Pair("Authorization", "Bearer ".concat(apiKey)), new Pair("X-Client-Version", String.valueOf(2)), new Pair("X-Client-Bundle-Id", packageName), new Pair("X-Client-Library", library), new Pair("X-Client-Platform", AndroidContextPlugin.PLATFORM)), ul.b.Q(new N1(FileIdentityStorage.API_KEY, apiKey), new N1("config_keys", "sessionReplay.sr_android_privacy_config"), new N1("config_keys", "sessionReplay.sr_android_sampling_config")), this.logger).a(), storage);
    }

    public final RemoteConfig fetchFromStorage(H0 storage) {
        Intrinsics.g(storage, "storage");
        try {
            RemoteConfigResponse remoteConfigResponse = (RemoteConfigResponse) gson.fromJson(((C0543y3) storage).f20824b.getString(STORAGE_KEY, b.f42142b), RemoteConfigResponse.class);
            if (remoteConfigResponse != null) {
                return remoteConfigResponse.getRemoteConfig();
            }
            return null;
        } catch (JsonSyntaxException e3) {
            this.logger.d(new C0547z2(e3));
            return null;
        }
    }
}
