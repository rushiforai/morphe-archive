package com.amplitude.core.remoteconfig;

import a2.c;
import b.u4;
import b70.d;
import b70.g;
import b70.h;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.amplitude.common.Logger;
import com.amplitude.core.ServerZone;
import com.amplitude.core.Storage;
import com.amplitude.core.remoteconfig.RemoteConfigClient;
import com.amplitude.core.remoteconfig.RemoteConfigClientImpl;
import com.amplitude.core.utilities.JSONKt;
import com.amplitude.core.utilities.http.HttpClient;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.dynamite.descriptors.com.google.android.gms.measurement.dynamite.ModuleDescriptor;
import com.google.android.gms.internal.measurement.k2;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.enums.EnumEntries;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;
import r70.i;
import t70.c0;
import t70.j0;
import t70.m0;

@Metadata(d1 = {"\u0000\u0084\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\b\b\u0000\u0018\u0000 C2\u00020\u0001:\u0003CDEBG\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\n\u001a\u00020\b\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u0010\u001a\u00020\u000f¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0014\u001a\u00020\u0013H\u0082@¢\u0006\u0004\b\u0014\u0010\u0015J\u0019\u0010\u0018\u001a\u0004\u0018\u00010\u00172\u0006\u0010\u0016\u001a\u00020\u0002H\u0002¢\u0006\u0004\b\u0018\u0010\u0019J+\u0010\u001d\u001a\u001e\u0012\u0004\u0012\u00020\u0002\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u001b0\u001aj\u0002`\u001c0\u001aH\u0002¢\u0006\u0004\b\u001d\u0010\u001eJ-\u0010\u001f\u001a \u0012\u0004\u0012\u00020\u0002\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u001b0\u001aj\u0002`\u001c\u0018\u00010\u001aH\u0002¢\u0006\u0004\b\u001f\u0010\u001eJ\u000f\u0010!\u001a\u00020 H\u0002¢\u0006\u0004\b!\u0010\"J\u000f\u0010#\u001a\u00020\u0002H\u0002¢\u0006\u0004\b#\u0010$J%\u0010'\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u001a2\b\b\u0002\u0010&\u001a\u00020%H\u0002¢\u0006\u0004\b'\u0010(J7\u0010*\u001a \u0012\u0004\u0012\u00020\u0002\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u001b0\u001aj\u0002`\u001c\u0018\u00010\u001a2\b\u0010)\u001a\u0004\u0018\u00010\u0002H\u0002¢\u0006\u0004\b*\u0010+J1\u0010,\u001a\u0012\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u001b0\u001aj\u0002`\u001c*\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u001b0\u001aH\u0002¢\u0006\u0004\b,\u0010-J\u001f\u00102\u001a\u00020 2\u0006\u0010/\u001a\u00020.2\u0006\u00101\u001a\u000200H\u0016¢\u0006\u0004\b2\u00103J\u000f\u00104\u001a\u00020 H\u0016¢\u0006\u0004\b4\u0010\"R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u00105R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u00106R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u00107R\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u00108R\u0014\u0010\n\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\n\u00108R\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u00109R\u0014\u0010\u000e\u001a\u00020\r8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010:R\u0014\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0010\u0010;R*\u0010?\u001a\u0018\u0012\u0004\u0012\u00020\u0002\u0012\u000e\u0012\f\u0012\b\u0012\u00060>R\u00020\u00000=0<8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b?\u0010@R\u0016\u0010A\u001a\u00020\u00138\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bA\u0010B¨\u0006F"}, d2 = {"Lcom/amplitude/core/remoteconfig/RemoteConfigClientImpl;", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient;", b.f42142b, "apiKey", "Lcom/amplitude/core/ServerZone;", "serverZone", "Lt70/j0;", "coroutineScope", "Lt70/c0;", "networkIODispatcher", "storageIODispatcher", "Lcom/amplitude/core/Storage;", PlaceTypes.STORAGE, "Lcom/amplitude/core/utilities/http/HttpClient;", "httpClient", "Lcom/amplitude/common/Logger;", "logger", "<init>", "(Ljava/lang/String;Lcom/amplitude/core/ServerZone;Lt70/j0;Lt70/c0;Lt70/c0;Lcom/amplitude/core/Storage;Lcom/amplitude/core/utilities/http/HttpClient;Lcom/amplitude/common/Logger;)V", b.f42142b, "shouldRateLimit", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "configKey", "Lcom/amplitude/core/remoteconfig/RemoteConfigClientImpl$ConfigData;", "getStoredConfigData", "(Ljava/lang/String;)Lcom/amplitude/core/remoteconfig/RemoteConfigClientImpl$ConfigData;", b.f42142b, b.f42142b, "Lcom/amplitude/core/remoteconfig/ConfigMap;", "getAllStoredConfigs", "()Ljava/util/Map;", "fetchRemoteConfig", b.f42142b, "cleanupDeadReferences", "()V", "buildRemoteConfigUrl", "()Ljava/lang/String;", b.f42142b, "apiVersion", "buildRequestHeaders", "(I)Ljava/util/Map;", "responseBody", "parseConfigsFromResponse", "(Ljava/lang/String;)Ljava/util/Map;", "filterNotNullValues", "(Ljava/util/Map;)Ljava/util/Map;", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient$Key;", DatabaseConstants.KEY_FIELD, "Lcom/amplitude/core/remoteconfig/RemoteConfigClient$RemoteConfigCallback;", "callback", "subscribe", "(Lcom/amplitude/core/remoteconfig/RemoteConfigClient$Key;Lcom/amplitude/core/remoteconfig/RemoteConfigClient$RemoteConfigCallback;)V", "updateConfigs", "Ljava/lang/String;", "Lcom/amplitude/core/ServerZone;", "Lt70/j0;", "Lt70/c0;", "Lcom/amplitude/core/Storage;", "Lcom/amplitude/core/utilities/http/HttpClient;", "Lcom/amplitude/common/Logger;", "Ljava/util/concurrent/ConcurrentHashMap;", "Ljava/util/concurrent/CopyOnWriteArrayList;", "Lcom/amplitude/core/remoteconfig/RemoteConfigClientImpl$WeakCallback;", "keySpecificSubscribers", "Ljava/util/concurrent/ConcurrentHashMap;", "isFetching", "Z", k.O, "ConfigData", "WeakCallback", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class RemoteConfigClientImpl implements RemoteConfigClient {

    @NotNull
    private static final String EU_REMOTE_CONFIG_URL = "https://sr-client-cfg.eu.amplitude.com";
    private static final long MIN_FETCH_INTERVAL_MS = 300000;

    @NotNull
    private static final String US_REMOTE_CONFIG_URL = "https://sr-client-cfg.amplitude.com";

    @NotNull
    private final String apiKey;

    @NotNull
    private final j0 coroutineScope;

    @NotNull
    private final HttpClient httpClient;
    private boolean isFetching;

    @NotNull
    private final ConcurrentHashMap<String, CopyOnWriteArrayList<WeakCallback>> keySpecificSubscribers;

    @NotNull
    private final Logger logger;

    @NotNull
    private final c0 networkIODispatcher;

    @NotNull
    private final ServerZone serverZone;

    @NotNull
    private final Storage storage;

    @NotNull
    private final c0 storageIODispatcher;

    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\t\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0082\b\u0018\u00002\u00020\u0001B%\u0012\u0016\u0010\u0002\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00010\u0003j\u0002`\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\u0019\u0010\r\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00010\u0003j\u0002`\u0005HÆ\u0003J\t\u0010\u000e\u001a\u00020\u0007HÆ\u0003J-\u0010\u000f\u001a\u00020\u00002\u0018\b\u0002\u0010\u0002\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00010\u0003j\u0002`\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0010\u001a\u00020\u00112\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0004HÖ\u0001R!\u0010\u0002\u001a\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00010\u0003j\u0002`\u0005¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0016"}, d2 = {"Lcom/amplitude/core/remoteconfig/RemoteConfigClientImpl$ConfigData;", b.f42142b, "config", b.f42142b, b.f42142b, "Lcom/amplitude/core/remoteconfig/ConfigMap;", "timestamp", b.f42142b, "(Ljava/util/Map;J)V", "getConfig", "()Ljava/util/Map;", "getTimestamp", "()J", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final /* data */ class ConfigData {

        @NotNull
        private final Map<String, Object> config;
        private final long timestamp;

        public ConfigData(@NotNull Map<String, ? extends Object> config, long j11) {
            Intrinsics.g(config, "config");
            this.config = config;
            this.timestamp = j11;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public static /* synthetic */ ConfigData copy$default(ConfigData configData, Map map, long j11, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                map = configData.config;
            }
            if ((i5 & 2) != 0) {
                j11 = configData.timestamp;
            }
            return configData.copy(map, j11);
        }

        @NotNull
        public final Map<String, Object> component1() {
            return this.config;
        }

        /* renamed from: component2, reason: from getter */
        public final long getTimestamp() {
            return this.timestamp;
        }

        @NotNull
        public final ConfigData copy(@NotNull Map<String, ? extends Object> config, long timestamp) {
            Intrinsics.g(config, "config");
            return new ConfigData(config, timestamp);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ConfigData)) {
                return false;
            }
            ConfigData configData = (ConfigData) other;
            return Intrinsics.b(this.config, configData.config) && this.timestamp == configData.timestamp;
        }

        @NotNull
        public final Map<String, Object> getConfig() {
            return this.config;
        }

        public final long getTimestamp() {
            return this.timestamp;
        }

        public int hashCode() {
            return Long.hashCode(this.timestamp) + (this.config.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ConfigData(config=");
            sb2.append(this.config);
            sb2.append(", timestamp=");
            return c.n(sb2, this.timestamp, ')');
        }
    }

    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\u0004\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0006\u0010\b\u001a\u00020\tJ\u001f\u0010\n\u001a\u00020\u000b2\u0017\u0010\f\u001a\u0013\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u000b0\r¢\u0006\u0002\b\u000eR\u001c\u0010\u0005\u001a\u0010\u0012\f\u0012\n \u0007*\u0004\u0018\u00010\u00030\u00030\u0006X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000f"}, d2 = {"Lcom/amplitude/core/remoteconfig/RemoteConfigClientImpl$WeakCallback;", b.f42142b, "callback", "Lcom/amplitude/core/remoteconfig/RemoteConfigClient$RemoteConfigCallback;", "(Lcom/amplitude/core/remoteconfig/RemoteConfigClientImpl;Lcom/amplitude/core/remoteconfig/RemoteConfigClient$RemoteConfigCallback;)V", "weakRef", "Ljava/lang/ref/WeakReference;", "kotlin.jvm.PlatformType", "isAlive", b.f42142b, "runSafely", b.f42142b, "action", "Lkotlin/Function1;", "Lkotlin/ExtensionFunctionType;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public final class WeakCallback {
        final /* synthetic */ RemoteConfigClientImpl this$0;

        @NotNull
        private final WeakReference<RemoteConfigClient.RemoteConfigCallback> weakRef;

        public WeakCallback(@NotNull RemoteConfigClientImpl remoteConfigClientImpl, RemoteConfigClient.RemoteConfigCallback callback) {
            Intrinsics.g(callback, "callback");
            this.this$0 = remoteConfigClientImpl;
            this.weakRef = new WeakReference<>(callback);
        }

        public final boolean isAlive() {
            return this.weakRef.get() != null;
        }

        public final void runSafely(@NotNull Function1<? super RemoteConfigClient.RemoteConfigCallback, Unit> action) {
            Intrinsics.g(action, "action");
            RemoteConfigClient.RemoteConfigCallback remoteConfigCallback = this.weakRef.get();
            if (remoteConfigCallback == null) {
                return;
            }
            try {
                action.invoke(remoteConfigCallback);
            } catch (Exception e3) {
                this.this$0.logger.error("Exception in subscriber callback: " + e3.getMessage());
            }
        }
    }

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[ServerZone.values().length];
            try {
                iArr[ServerZone.EU.ordinal()] = 1;
            } catch (NoSuchFieldError unused) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.remoteconfig.RemoteConfigClientImpl$getStoredConfigData$1", f = "RemoteConfigClient.kt", l = {240, 241}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.remoteconfig.RemoteConfigClientImpl$getStoredConfigData$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return RemoteConfigClientImpl.this.new AnonymousClass1(continuation);
        }

        /* JADX WARN: Code restructure failed: missing block: B:19:0x0040, code lost:
        
            if (r5.remove(r1, r4) == r0) goto L20;
         */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            try {
            } catch (Exception e3) {
                RemoteConfigClientImpl.this.logger.error("Failed to clear inconsistent storage: " + e3.getMessage());
            }
            if (i5 == 0) {
                ResultKt.b(obj);
                Storage storage = RemoteConfigClientImpl.this.storage;
                Storage.Constants constants = Storage.Constants.REMOTE_CONFIG;
                this.label = 1;
                if (storage.remove(constants, this) == coroutineSingletons) {
                }
                return coroutineSingletons;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                RemoteConfigClientImpl.this.logger.debug("Cleared storage due to hard inconsistency (no expected keys present)");
                return Unit.f71706a;
            }
            ResultKt.b(obj);
            Storage storage2 = RemoteConfigClientImpl.this.storage;
            Storage.Constants constants2 = Storage.Constants.REMOTE_CONFIG_TIMESTAMP;
            this.label = 2;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.core.remoteconfig.RemoteConfigClientImpl", f = "RemoteConfigClient.kt", l = {Sdk.SDKError.Reason.INVALID_BID_PAYLOAD_VALUE}, m = "shouldRateLimit")
    /* renamed from: com.amplitude.core.remoteconfig.RemoteConfigClientImpl$shouldRateLimit$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04071 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public C04071(Continuation<? super C04071> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return RemoteConfigClientImpl.this.shouldRateLimit(this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.remoteconfig.RemoteConfigClientImpl$updateConfigs$1", f = "RemoteConfigClient.kt", l = {175, 184}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.amplitude.core.remoteconfig.RemoteConfigClientImpl$updateConfigs$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04091 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        long J$0;
        Object L$0;
        int label;

        @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
        @DebugMetadata(c = "com.amplitude.core.remoteconfig.RemoteConfigClientImpl$updateConfigs$1$1", f = "RemoteConfigClient.kt", l = {ModuleDescriptor.MODULE_VERSION, 186}, m = "invokeSuspend")
        /* renamed from: com.amplitude.core.remoteconfig.RemoteConfigClientImpl$updateConfigs$1$1, reason: invalid class name and collision with other inner class name */
        public static final class C00051 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
            final /* synthetic */ Map<String, Map<String, Object>> $configs;
            final /* synthetic */ long $timestamp;
            int label;
            final /* synthetic */ RemoteConfigClientImpl this$0;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            public C00051(RemoteConfigClientImpl remoteConfigClientImpl, Map<String, ? extends Map<String, ? extends Object>> map, long j11, Continuation<? super C00051> continuation) {
                super(2, continuation);
                this.this$0 = remoteConfigClientImpl;
                this.$configs = map;
                this.$timestamp = j11;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @NotNull
            public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
                return new C00051(this.this$0, this.$configs, this.$timestamp, continuation);
            }

            /* JADX WARN: Code restructure failed: missing block: B:14:0x004e, code lost:
            
                if (r6.write(r1, r3, r5) == r0) goto L15;
             */
            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            @Nullable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
            */
            public final Object invokeSuspend(@NotNull Object obj) {
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.label;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    Storage storage = this.this$0.storage;
                    Storage.Constants constants = Storage.Constants.REMOTE_CONFIG;
                    String strValueOf = String.valueOf(JSONKt.toJSONObject(this.$configs));
                    this.label = 1;
                    if (storage.write(constants, strValueOf, this) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    this.this$0.logger.debug("Successfully stored remote configs to storage");
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                Storage storage2 = this.this$0.storage;
                Storage.Constants constants2 = Storage.Constants.REMOTE_CONFIG_TIMESTAMP;
                String strValueOf2 = String.valueOf(this.$timestamp);
                this.label = 2;
            }

            @Override // kotlin.jvm.functions.Function2
            @Nullable
            public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
                return ((C00051) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
            }
        }

        public C04091(Continuation<? super C04091> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return RemoteConfigClientImpl.this.new C04091(continuation);
        }

        /* JADX WARN: Removed duplicated region for block: B:39:0x00ac A[Catch: all -> 0x0018, Exception -> 0x001c, TryCatch #0 {Exception -> 0x001c, blocks: (B:7:0x0013, B:36:0x009c, B:37:0x00a6, B:39:0x00ac, B:41:0x00ca, B:42:0x00ce, B:44:0x00d4, B:15:0x0028, B:26:0x0055, B:28:0x005d, B:29:0x006b, B:31:0x0078, B:32:0x007b, B:18:0x002f, B:20:0x0037, B:23:0x004a), top: B:53:0x0007, outer: #1 }] */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(@NotNull Object obj) {
            Unit unit;
            Map map;
            final long j11;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            try {
                try {
                } catch (Exception e3) {
                    RemoteConfigClientImpl.this.logger.error("Error updating remote configs: " + e3.getMessage());
                }
                if (i5 == 0) {
                    ResultKt.b(obj);
                    if (RemoteConfigClientImpl.this.isFetching) {
                        RemoteConfigClientImpl.this.logger.debug("RemoteConfig update skipped: fetch already in progress");
                        unit = Unit.f71706a;
                        RemoteConfigClientImpl.this.isFetching = false;
                        return unit;
                    }
                    RemoteConfigClientImpl remoteConfigClientImpl = RemoteConfigClientImpl.this;
                    this.label = 1;
                    obj = remoteConfigClientImpl.shouldRateLimit(this);
                    if (obj == coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    j11 = this.J$0;
                    map = (Map) this.L$0;
                    ResultKt.b(obj);
                    RemoteConfigClientImpl remoteConfigClientImpl2 = RemoteConfigClientImpl.this;
                    for (Map.Entry entry : map.entrySet()) {
                        String str = (String) entry.getKey();
                        final Map map2 = (Map) entry.getValue();
                        CopyOnWriteArrayList copyOnWriteArrayList = (CopyOnWriteArrayList) remoteConfigClientImpl2.keySpecificSubscribers.get(str);
                        if (copyOnWriteArrayList != null) {
                            Iterator it = copyOnWriteArrayList.iterator();
                            while (it.hasNext()) {
                                ((WeakCallback) it.next()).runSafely(new Function1<RemoteConfigClient.RemoteConfigCallback, Unit>() { // from class: com.amplitude.core.remoteconfig.RemoteConfigClientImpl$updateConfigs$1$2$1$1
                                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                                    {
                                        super(1);
                                    }

                                    @Override // kotlin.jvm.functions.Function1
                                    public /* bridge */ /* synthetic */ Object invoke(Object obj2) {
                                        invoke((RemoteConfigClient.RemoteConfigCallback) obj2);
                                        return Unit.f71706a;
                                    }

                                    public final void invoke(@NotNull RemoteConfigClient.RemoteConfigCallback runSafely) {
                                        Intrinsics.g(runSafely, "$this$runSafely");
                                        runSafely.onUpdate(map2, RemoteConfigClient.Source.REMOTE, j11);
                                    }
                                });
                            }
                        }
                    }
                    RemoteConfigClientImpl.this.isFetching = false;
                    return Unit.f71706a;
                }
                ResultKt.b(obj);
                if (((Boolean) obj).booleanValue()) {
                    RemoteConfigClientImpl.this.logger.debug("RemoteConfig update skipped: within 5-minute window");
                    unit = Unit.f71706a;
                } else {
                    RemoteConfigClientImpl.this.isFetching = true;
                    Map mapFetchRemoteConfig = RemoteConfigClientImpl.this.fetchRemoteConfig();
                    if (mapFetchRemoteConfig != null) {
                        long jCurrentTimeMillis = System.currentTimeMillis();
                        c0 c0Var = RemoteConfigClientImpl.this.storageIODispatcher;
                        C00051 c00051 = new C00051(RemoteConfigClientImpl.this, mapFetchRemoteConfig, jCurrentTimeMillis, null);
                        this.L$0 = mapFetchRemoteConfig;
                        this.J$0 = jCurrentTimeMillis;
                        this.label = 2;
                        if (m0.y(c0Var, c00051, this) != coroutineSingletons) {
                            map = mapFetchRemoteConfig;
                            j11 = jCurrentTimeMillis;
                            RemoteConfigClientImpl remoteConfigClientImpl22 = RemoteConfigClientImpl.this;
                            while (r2.hasNext()) {
                            }
                            RemoteConfigClientImpl.this.isFetching = false;
                            return Unit.f71706a;
                        }
                        return coroutineSingletons;
                    }
                    unit = Unit.f71706a;
                }
                RemoteConfigClientImpl.this.isFetching = false;
                return unit;
            } catch (Throwable th2) {
                RemoteConfigClientImpl.this.isFetching = false;
                throw th2;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04091) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public RemoteConfigClientImpl(@NotNull String apiKey, @NotNull ServerZone serverZone, @NotNull j0 coroutineScope, @NotNull c0 networkIODispatcher, @NotNull c0 storageIODispatcher, @NotNull Storage storage, @NotNull HttpClient httpClient, @NotNull Logger logger) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(coroutineScope, "coroutineScope");
        Intrinsics.g(networkIODispatcher, "networkIODispatcher");
        Intrinsics.g(storageIODispatcher, "storageIODispatcher");
        Intrinsics.g(storage, "storage");
        Intrinsics.g(httpClient, "httpClient");
        Intrinsics.g(logger, "logger");
        this.apiKey = apiKey;
        this.serverZone = serverZone;
        this.coroutineScope = coroutineScope;
        this.networkIODispatcher = networkIODispatcher;
        this.storageIODispatcher = storageIODispatcher;
        this.storage = storage;
        this.httpClient = httpClient;
        this.logger = logger;
        this.keySpecificSubscribers = new ConcurrentHashMap<>();
    }

    private final String buildRemoteConfigUrl() throws IOException {
        String str = WhenMappings.$EnumSwitchMapping$0[this.serverZone.ordinal()] == 1 ? EU_REMOTE_CONFIG_URL : US_REMOTE_CONFIG_URL;
        String strF1 = g.f1(RemoteConfigClient.Key.getEntries(), "&", null, null, 0, new Function1<RemoteConfigClient.Key, CharSequence>() { // from class: com.amplitude.core.remoteconfig.RemoteConfigClientImpl$buildRemoteConfigUrl$configKeysParam$1
            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final CharSequence invoke(@NotNull RemoteConfigClient.Key it) {
                Intrinsics.g(it, "it");
                return "config_keys=" + it.getValue();
            }
        }, 30);
        StringBuilder sbK = k2.k(str, "/config?api_key=");
        sbK.append(this.apiKey);
        sbK.append('&');
        sbK.append(strF1);
        return sbK.toString();
    }

    private final Map<String, String> buildRequestHeaders(int apiVersion) {
        return MapsKt.j0(new Pair("Authorization", "Bearer " + this.apiKey), new Pair("X-Client-Platform", AndroidContextPlugin.PLATFORM), new Pair("X-Client-Version", String.valueOf(apiVersion)), new Pair("X-Client-Library", "amplitude-kotlin/0.0.1"));
    }

    public static /* synthetic */ Map buildRequestHeaders$default(RemoteConfigClientImpl remoteConfigClientImpl, int i5, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            i5 = 2;
        }
        return remoteConfigClientImpl.buildRequestHeaders(i5);
    }

    private final void cleanupDeadReferences() {
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        int size = 0;
        for (Map.Entry<String, CopyOnWriteArrayList<WeakCallback>> entry : this.keySpecificSubscribers.entrySet()) {
            String key = entry.getKey();
            CopyOnWriteArrayList<WeakCallback> value = entry.getValue();
            int size2 = value.size();
            d.E0(value, new Function1<WeakCallback, Boolean>() { // from class: com.amplitude.core.remoteconfig.RemoteConfigClientImpl$cleanupDeadReferences$1$1
                @Override // kotlin.jvm.functions.Function1
                @NotNull
                public final Boolean invoke(RemoteConfigClientImpl.WeakCallback weakCallback) {
                    return Boolean.valueOf(!weakCallback.isAlive());
                }
            });
            size += size2 - value.size();
            if (value.isEmpty()) {
                linkedHashSet.add(key);
            }
        }
        Iterator it = linkedHashSet.iterator();
        while (it.hasNext()) {
            this.keySpecificSubscribers.remove((String) it.next());
        }
        if (size > 0) {
            Logger logger = this.logger;
            StringBuilder sbJ = u4.j(size, "Removed ", " dead references and ");
            sbJ.append(linkedHashSet.size());
            sbJ.append(" empty lists");
            logger.debug(sbJ.toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Map<String, Map<String, Object>> fetchRemoteConfig() {
        cleanupDeadReferences();
        HttpClient.Response responseRequest$core = this.httpClient.request$core(new HttpClient.Request(buildRemoteConfigUrl(), HttpClient.Request.Method.GET, buildRequestHeaders$default(this, 0, 1, null), null, false, 0, 0, 120, null));
        if (responseRequest$core.isSuccessful()) {
            return parseConfigsFromResponse(responseRequest$core.getBody());
        }
        if (responseRequest$core.isClientError()) {
            this.logger.error("Client error on fetch remote config: " + responseRequest$core.getStatusCode() + ": " + responseRequest$core.getStatusMessage());
            return null;
        }
        this.logger.warn("Failed to fetch remote config: " + responseRequest$core.getStatusCode() + ": " + responseRequest$core.getStatusMessage());
        return null;
    }

    private final Map<String, Object> filterNotNullValues(Map<String, ? extends Object> map) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<String, ? extends Object> entry : map.entrySet()) {
            if (entry.getValue() != null) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return linkedHashMap;
    }

    private final Map<String, Map<String, Object>> getAllStoredConfigs() {
        h hVar = h.f17594a;
        try {
            String str = this.storage.read(Storage.Constants.REMOTE_CONFIG);
            if (str != null && !r70.k.U0(str)) {
                Map<String, Object> mapObj = JSONKt.toMapObj(new JSONObject(str));
                MapBuilder mapBuilder = new MapBuilder();
                for (Map.Entry<String, Object> entry : mapObj.entrySet()) {
                    String key = entry.getKey();
                    Object value = entry.getValue();
                    if (value instanceof Map) {
                        Map<String, Object> mapFilterNotNullValues = filterNotNullValues((Map) value);
                        if (mapFilterNotNullValues == null) {
                            mapFilterNotNullValues = hVar;
                        }
                        if (!mapFilterNotNullValues.isEmpty()) {
                            mapBuilder.put(key, mapFilterNotNullValues);
                            this.logger.debug("Successfully loaded stored config for key: " + key);
                        }
                    } else {
                        Logger logger = this.logger;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Skipping non-map value for key ");
                        sb2.append(key);
                        sb2.append(": ");
                        sb2.append(value != null ? value.getClass().getSimpleName() : null);
                        logger.debug(sb2.toString());
                    }
                }
                MapBuilder mapBuilderB = mapBuilder.b();
                this.logger.debug("Successfully loaded " + mapBuilderB.f71769i + " stored configs from storage");
                return mapBuilderB;
            }
            this.logger.debug("No stored config found in storage");
            return hVar;
        } catch (Exception e3) {
            this.logger.error("Failed to parse all stored configs: " + e3.getMessage());
            return hVar;
        }
    }

    private final ConfigData getStoredConfigData(String configKey) {
        Long lV0;
        try {
            Map<String, Map<String, Object>> allStoredConfigs = getAllStoredConfigs();
            if (allStoredConfigs.isEmpty()) {
                return null;
            }
            EnumEntries<RemoteConfigClient.Key> entries = RemoteConfigClient.Key.getEntries();
            ArrayList arrayList = new ArrayList(b70.c.u0(entries, 10));
            Iterator<RemoteConfigClient.Key> it = entries.iterator();
            while (it.hasNext()) {
                arrayList.add(it.next().getValue());
            }
            Set setN1 = g.N1(arrayList);
            Set<String> setKeySet = allStoredConfigs.keySet();
            if (!setKeySet.containsAll(setN1)) {
                this.logger.debug("Storage inconsistent keys. Expected: " + setN1 + ", Found: " + setKeySet);
                Set<String> set = setKeySet;
                if (!(set instanceof Collection) || !set.isEmpty()) {
                    Iterator<T> it2 = set.iterator();
                    while (it2.hasNext()) {
                        if (setN1.contains((String) it2.next())) {
                        }
                    }
                }
                m0.t(this.coroutineScope, this.storageIODispatcher, null, new AnonymousClass1(null), 2);
                return null;
            }
            Map<String, Object> map = allStoredConfigs.get(configKey);
            if (map == null) {
                map = h.f17594a;
            }
            String str = this.storage.read(Storage.Constants.REMOTE_CONFIG_TIMESTAMP);
            long jLongValue = (str == null || (lV0 = i.v0(str)) == null) ? 0L : lV0.longValue();
            this.logger.debug("Retrieved stored config for " + configKey + " with " + map.size() + " properties");
            return new ConfigData(map, jLongValue);
        } catch (Exception e3) {
            Logger logger = this.logger;
            StringBuilder sbK = u4.k("Failed to retrieve stored config data for ", configKey, ": ");
            sbK.append(e3.getMessage());
            logger.error(sbK.toString());
            return null;
        }
    }

    private final Map<String, Map<String, Object>> parseConfigsFromResponse(String responseBody) {
        MapBuilder mapBuilderB;
        MapBuilder mapBuilder;
        JSONObject jSONObjectOptJSONObject;
        if (responseBody != null) {
            try {
                JSONObject jSONObject = new JSONObject(responseBody);
                mapBuilder = new MapBuilder();
                jSONObjectOptJSONObject = jSONObject.optJSONObject("configs");
            } catch (Exception e3) {
                this.logger.error("Failed to parse configs from response: " + e3.getMessage());
                mapBuilderB = null;
            }
            if (jSONObjectOptJSONObject == null) {
                this.logger.warn("No 'configs' key found in response");
                return null;
            }
            Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
            Intrinsics.f(itKeys, "keys(...)");
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                JSONObject jSONObjectOptJSONObject2 = jSONObjectOptJSONObject.optJSONObject(next);
                if (jSONObjectOptJSONObject2 != null) {
                    Iterator<String> itKeys2 = jSONObjectOptJSONObject2.keys();
                    Intrinsics.f(itKeys2, "keys(...)");
                    while (itKeys2.hasNext()) {
                        String next2 = itKeys2.next();
                        String str = next + '.' + next2;
                        JSONObject jSONObjectOptJSONObject3 = jSONObjectOptJSONObject2.optJSONObject(next2);
                        if (jSONObjectOptJSONObject3 != null) {
                            mapBuilder.put(str, filterNotNullValues(JSONKt.toMapObj(jSONObjectOptJSONObject3)));
                            this.logger.debug("Successfully parsed config: " + str);
                        } else {
                            this.logger.debug("Config " + str + " has no nested object, using empty map");
                            mapBuilder.put(str, h.f17594a);
                        }
                    }
                } else {
                    this.logger.debug("Skipping non-object top-level key: " + next);
                }
            }
            mapBuilderB = mapBuilder.b();
            if (!mapBuilderB.isEmpty()) {
                Collection collectionValues = mapBuilderB.values();
                if (!collectionValues.isEmpty()) {
                    Iterator it = collectionValues.iterator();
                    while (it.hasNext()) {
                        if (!((Map) it.next()).isEmpty()) {
                            this.logger.debug("Successfully parsed " + mapBuilderB.f71769i + " config entries");
                            if (mapBuilderB != null) {
                                return mapBuilderB;
                            }
                        }
                    }
                }
            }
            this.logger.warn("No valid configs found in response");
            return null;
        }
        this.logger.warn("Response body is null, returning null config map");
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object shouldRateLimit(Continuation<? super Boolean> continuation) throws Throwable {
        C04071 c04071;
        Long lV0;
        if (continuation instanceof C04071) {
            c04071 = (C04071) continuation;
            int i5 = c04071.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c04071.label = i5 - Integer.MIN_VALUE;
            } else {
                c04071 = new C04071(continuation);
            }
        }
        Object objY = c04071.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c04071.label;
        if (i11 == 0) {
            ResultKt.b(objY);
            c0 c0Var = this.storageIODispatcher;
            RemoteConfigClientImpl$shouldRateLimit$lastTsStr$1 remoteConfigClientImpl$shouldRateLimit$lastTsStr$1 = new RemoteConfigClientImpl$shouldRateLimit$lastTsStr$1(this, null);
            c04071.label = 1;
            objY = m0.y(c0Var, remoteConfigClientImpl$shouldRateLimit$lastTsStr$1, c04071);
            if (objY == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objY);
        }
        String str = (String) objY;
        long jLongValue = (str == null || (lV0 = i.v0(str)) == null) ? 0L : lV0.longValue();
        if (jLongValue <= 0) {
            return Boolean.FALSE;
        }
        return Boolean.valueOf(System.currentTimeMillis() - jLongValue < 300000);
    }

    @Override // com.amplitude.core.remoteconfig.RemoteConfigClient
    public void subscribe(@NotNull RemoteConfigClient.Key key, @NotNull RemoteConfigClient.RemoteConfigCallback callback) {
        CopyOnWriteArrayList<WeakCallback> copyOnWriteArrayListPutIfAbsent;
        Intrinsics.g(key, "key");
        Intrinsics.g(callback, "callback");
        cleanupDeadReferences();
        ConcurrentHashMap<String, CopyOnWriteArrayList<WeakCallback>> concurrentHashMap = this.keySpecificSubscribers;
        String value = key.getValue();
        CopyOnWriteArrayList<WeakCallback> copyOnWriteArrayList = concurrentHashMap.get(value);
        if (copyOnWriteArrayList == null && (copyOnWriteArrayListPutIfAbsent = concurrentHashMap.putIfAbsent(value, (copyOnWriteArrayList = new CopyOnWriteArrayList<>()))) != null) {
            copyOnWriteArrayList = copyOnWriteArrayListPutIfAbsent;
        }
        CopyOnWriteArrayList<WeakCallback> copyOnWriteArrayList2 = copyOnWriteArrayList;
        WeakCallback weakCallback = new WeakCallback(this, callback);
        copyOnWriteArrayList2.add(weakCallback);
        this.keySpecificSubscribers.put(key.getValue(), copyOnWriteArrayList2);
        Logger logger = this.logger;
        StringBuilder sb2 = new StringBuilder("Added subscriber for key: ");
        sb2.append(key.getValue());
        sb2.append(". Total subscribers: ");
        CopyOnWriteArrayList<WeakCallback> copyOnWriteArrayList3 = this.keySpecificSubscribers.get(key.getValue());
        sb2.append(copyOnWriteArrayList3 != null ? Integer.valueOf(copyOnWriteArrayList3.size()) : null);
        logger.debug(sb2.toString());
        final ConfigData storedConfigData = getStoredConfigData(key.getValue());
        if (storedConfigData != null) {
            weakCallback.runSafely(new Function1<RemoteConfigClient.RemoteConfigCallback, Unit>() { // from class: com.amplitude.core.remoteconfig.RemoteConfigClientImpl.subscribe.1
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object obj) {
                    invoke((RemoteConfigClient.RemoteConfigCallback) obj);
                    return Unit.f71706a;
                }

                public final void invoke(@NotNull RemoteConfigClient.RemoteConfigCallback runSafely) {
                    Intrinsics.g(runSafely, "$this$runSafely");
                    runSafely.onUpdate(storedConfigData.getConfig(), RemoteConfigClient.Source.CACHE, storedConfigData.getTimestamp());
                }
            });
        }
        updateConfigs();
    }

    @Override // com.amplitude.core.remoteconfig.RemoteConfigClient
    public void updateConfigs() {
        m0.t(this.coroutineScope, this.networkIODispatcher, null, new C04091(null), 2);
    }
}
