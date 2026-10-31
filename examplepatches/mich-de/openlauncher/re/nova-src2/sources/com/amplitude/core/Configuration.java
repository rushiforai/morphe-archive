package com.amplitude.core;

import androidx.recyclerview.widget.u1;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.IngestionMetadata;
import com.amplitude.core.events.Plan;
import com.amplitude.core.utilities.ConsoleLoggerProvider;
import com.amplitude.core.utilities.InMemoryStorageProvider;
import com.amplitude.core.utilities.http.HttpClientInterface;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.amplitude.id.IMIdentityStorageProvider;
import com.amplitude.id.IdentityStorageProvider;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.JvmOverloads;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000t\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\bX\b\u0016\u0018\u0000 \u0082\u00012\u00020\u0001:\u0002\u0082\u0001BÏ\u0002\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0003\u0012\b\b\u0002\u0010\b\u001a\u00020\t\u0012\b\b\u0002\u0010\n\u001a\u00020\u000b\u0012\b\b\u0002\u0010\f\u001a\u00020\r\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0005\u0012\n\b\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0003\u0012F\b\u0002\u0010\u0010\u001a@\u0012\u0004\u0012\u00020\u0012\u0012\u0013\u0012\u00110\u0005¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(\u0015\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(\u0016\u0012\u0004\u0012\u00020\u0017\u0018\u00010\u0011j\u0004\u0018\u0001`\u0018\u0012\b\b\u0002\u0010\u0019\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u001a\u001a\u00020\t\u0012\b\b\u0002\u0010\u001b\u001a\u00020\u001c\u0012\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u001e\u001a\u0004\u0018\u00010\u001f\u0012\n\b\u0002\u0010 \u001a\u0004\u0018\u00010!\u0012\b\b\u0002\u0010\"\u001a\u00020#\u0012\b\b\u0002\u0010$\u001a\u00020\u000b\u0012\b\b\u0002\u0010%\u001a\u00020&\u0012\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\t\u0012\n\b\u0002\u0010(\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010)\u001a\u0004\u0018\u00010#\u0012\n\b\u0002\u0010*\u001a\u0004\u0018\u00010+\u0012\b\b\u0002\u0010,\u001a\u00020\t\u0012\b\b\u0002\u0010-\u001a\u00020\t¢\u0006\u0002\u0010.J\u0006\u0010~\u001a\u00020\u0003J\b\u0010\u007f\u001a\u00020\tH\u0002J\u0007\u0010\u0080\u0001\u001a\u00020\tJ\u0007\u0010\u0081\u0001\u001a\u00020\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b/\u00100RX\u0010\u0010\u001a@\u0012\u0004\u0012\u00020\u0012\u0012\u0013\u0012\u00110\u0005¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(\u0015\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b\u0013\u0012\b\b\u0014\u0012\u0004\b\b(\u0016\u0012\u0004\u0012\u00020\u0017\u0018\u00010\u0011j\u0004\u0018\u0001`\u0018X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b1\u00102\"\u0004\b3\u00104R\u001c\u0010(\u001a\u0004\u0018\u00010\u0003X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b5\u00100\"\u0004\b6\u00107R\u001a\u0010,\u001a\u00020\tX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b8\u00109\"\u0004\b:\u0010;R\u001a\u0010-\u001a\u00020\tX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b<\u00109\"\u0004\b=\u0010;R\u001a\u0010\u0006\u001a\u00020\u0005X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b>\u0010?\"\u0004\b@\u0010AR\u001a\u0010\u0019\u001a\u00020\u0005X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bB\u0010?\"\u0004\bC\u0010AR\u001a\u0010\u0004\u001a\u00020\u0005X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bD\u0010?\"\u0004\bE\u0010AR\u001c\u0010*\u001a\u0004\u0018\u00010+X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bF\u0010G\"\u0004\bH\u0010IR\u001a\u0010\"\u001a\u00020#X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bJ\u0010K\"\u0004\bL\u0010MR\u001a\u0010$\u001a\u00020\u000bX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bN\u0010O\"\u0004\bP\u0010QR\u001a\u0010%\u001a\u00020&X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bR\u0010S\"\u0004\bT\u0010UR\u001c\u0010 \u001a\u0004\u0018\u00010!X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bV\u0010W\"\u0004\bX\u0010YR\u001a\u0010\u0007\u001a\u00020\u0003X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bZ\u00100\"\u0004\b[\u00107R\u0014\u0010\f\u001a\u00020\rX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\\\u0010]R\u001e\u0010\u000e\u001a\u0004\u0018\u00010\u0005X\u0096\u000e¢\u0006\u0010\n\u0002\u0010b\u001a\u0004\b^\u0010_\"\u0004\b`\u0010aR\u001e\u0010'\u001a\u0004\u0018\u00010\tX\u0096\u000e¢\u0006\u0010\n\u0002\u0010g\u001a\u0004\bc\u0010d\"\u0004\be\u0010fR\u001a\u0010\b\u001a\u00020\tX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bh\u00109\"\u0004\bi\u0010;R\u001c\u0010\u000f\u001a\u0004\u0018\u00010\u0003X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bj\u00100\"\u0004\bk\u00107R\u001c\u0010\u001e\u001a\u0004\u0018\u00010\u001fX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bl\u0010m\"\u0004\bn\u0010oR\u001c\u0010\u001d\u001a\u0004\u0018\u00010\u0003X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bp\u00100\"\u0004\bq\u00107R\u001a\u0010\u001b\u001a\u00020\u001cX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\br\u0010s\"\u0004\bt\u0010uR\u001e\u0010)\u001a\u0004\u0018\u00010#X\u0096\u000e¢\u0006\u0010\n\u0002\u0010z\u001a\u0004\bv\u0010w\"\u0004\bx\u0010yR\u0014\u0010\n\u001a\u00020\u000bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b{\u0010OR\u001a\u0010\u001a\u001a\u00020\tX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b|\u00109\"\u0004\b}\u0010;¨\u0006\u0083\u0001"}, d2 = {"Lcom/amplitude/core/Configuration;", b.f42142b, "apiKey", b.f42142b, "flushQueueSize", b.f42142b, "flushIntervalMillis", "instanceName", "optOut", b.f42142b, "storageProvider", "Lcom/amplitude/core/StorageProvider;", "loggerProvider", "Lcom/amplitude/core/LoggerProvider;", "minIdLength", "partnerId", "callback", "Lkotlin/Function3;", "Lcom/amplitude/core/events/BaseEvent;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "status", PglCryptUtils.KEY_MESSAGE, b.f42142b, "Lcom/amplitude/core/EventCallBack;", "flushMaxRetries", "useBatch", "serverZone", "Lcom/amplitude/core/ServerZone;", "serverUrl", "plan", "Lcom/amplitude/core/events/Plan;", "ingestionMetadata", "Lcom/amplitude/core/events/IngestionMetadata;", "identifyBatchIntervalMillis", b.f42142b, "identifyInterceptStorageProvider", "identityStorageProvider", "Lcom/amplitude/id/IdentityStorageProvider;", "offline", "deviceId", "sessionId", "httpClient", "Lcom/amplitude/core/utilities/http/HttpClientInterface;", "enableDiagnostics", "enableRequestBodyCompression", "(Ljava/lang/String;IILjava/lang/String;ZLcom/amplitude/core/StorageProvider;Lcom/amplitude/core/LoggerProvider;Ljava/lang/Integer;Ljava/lang/String;Lkotlin/jvm/functions/Function3;IZLcom/amplitude/core/ServerZone;Ljava/lang/String;Lcom/amplitude/core/events/Plan;Lcom/amplitude/core/events/IngestionMetadata;JLcom/amplitude/core/StorageProvider;Lcom/amplitude/id/IdentityStorageProvider;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Long;Lcom/amplitude/core/utilities/http/HttpClientInterface;ZZ)V", "getApiKey", "()Ljava/lang/String;", "getCallback", "()Lkotlin/jvm/functions/Function3;", "setCallback", "(Lkotlin/jvm/functions/Function3;)V", "getDeviceId", "setDeviceId", "(Ljava/lang/String;)V", "getEnableDiagnostics", "()Z", "setEnableDiagnostics", "(Z)V", "getEnableRequestBodyCompression", "setEnableRequestBodyCompression", "getFlushIntervalMillis", "()I", "setFlushIntervalMillis", "(I)V", "getFlushMaxRetries", "setFlushMaxRetries", "getFlushQueueSize", "setFlushQueueSize", "getHttpClient", "()Lcom/amplitude/core/utilities/http/HttpClientInterface;", "setHttpClient", "(Lcom/amplitude/core/utilities/http/HttpClientInterface;)V", "getIdentifyBatchIntervalMillis", "()J", "setIdentifyBatchIntervalMillis", "(J)V", "getIdentifyInterceptStorageProvider", "()Lcom/amplitude/core/StorageProvider;", "setIdentifyInterceptStorageProvider", "(Lcom/amplitude/core/StorageProvider;)V", "getIdentityStorageProvider", "()Lcom/amplitude/id/IdentityStorageProvider;", "setIdentityStorageProvider", "(Lcom/amplitude/id/IdentityStorageProvider;)V", "getIngestionMetadata", "()Lcom/amplitude/core/events/IngestionMetadata;", "setIngestionMetadata", "(Lcom/amplitude/core/events/IngestionMetadata;)V", "getInstanceName", "setInstanceName", "getLoggerProvider", "()Lcom/amplitude/core/LoggerProvider;", "getMinIdLength", "()Ljava/lang/Integer;", "setMinIdLength", "(Ljava/lang/Integer;)V", "Ljava/lang/Integer;", "getOffline", "()Ljava/lang/Boolean;", "setOffline", "(Ljava/lang/Boolean;)V", "Ljava/lang/Boolean;", "getOptOut", "setOptOut", "getPartnerId", "setPartnerId", "getPlan", "()Lcom/amplitude/core/events/Plan;", "setPlan", "(Lcom/amplitude/core/events/Plan;)V", "getServerUrl", "setServerUrl", "getServerZone", "()Lcom/amplitude/core/ServerZone;", "setServerZone", "(Lcom/amplitude/core/ServerZone;)V", "getSessionId", "()Ljava/lang/Long;", "setSessionId", "(Ljava/lang/Long;)V", "Ljava/lang/Long;", "getStorageProvider", "getUseBatch", "setUseBatch", "getApiHost", "isMinIdLengthValid", "isValid", "shouldCompressUploadBody", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public class Configuration {

    @NotNull
    public static final String DEFAULT_INSTANCE = "$default_instance";
    public static final int FLUSH_INTERVAL_MILLIS = 30000;
    public static final int FLUSH_MAX_RETRIES = 5;
    public static final int FLUSH_QUEUE_SIZE = 30;
    public static final long IDENTIFY_BATCH_INTERVAL_MILLIS = 30000;

    @NotNull
    private final String apiKey;

    @Nullable
    private Function3<? super BaseEvent, ? super Integer, ? super String, Unit> callback;

    @Nullable
    private String deviceId;
    private boolean enableDiagnostics;
    private boolean enableRequestBodyCompression;
    private int flushIntervalMillis;
    private int flushMaxRetries;
    private int flushQueueSize;

    @Nullable
    private HttpClientInterface httpClient;
    private long identifyBatchIntervalMillis;

    @NotNull
    private StorageProvider identifyInterceptStorageProvider;

    @NotNull
    private IdentityStorageProvider identityStorageProvider;

    @Nullable
    private IngestionMetadata ingestionMetadata;

    @NotNull
    private String instanceName;

    @NotNull
    private final LoggerProvider loggerProvider;

    @Nullable
    private Integer minIdLength;

    @Nullable
    private Boolean offline;
    private boolean optOut;

    @Nullable
    private String partnerId;

    @Nullable
    private Plan plan;

    @Nullable
    private String serverUrl;

    @NotNull
    private ServerZone serverZone;

    @Nullable
    private Long sessionId;

    @NotNull
    private final StorageProvider storageProvider;
    private boolean useBatch;

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey) {
        this(apiKey, 0, 0, null, false, null, null, null, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554430, null);
        Intrinsics.g(apiKey, "apiKey");
    }

    private final boolean isMinIdLengthValid() {
        Integer minIdLength = getMinIdLength();
        return minIdLength == null || minIdLength.intValue() > 0;
    }

    @NotNull
    public final String getApiHost() {
        String serverUrl = getServerUrl();
        if (serverUrl != null) {
            if (r70.k.U0(serverUrl)) {
                serverUrl = null;
            }
            if (serverUrl != null) {
                return serverUrl;
            }
        }
        ServerZone serverZone = getServerZone();
        ServerZone serverZone2 = ServerZone.EU;
        return (serverZone == serverZone2 && getUseBatch()) ? Constants.EU_BATCH_API_HOST : getServerZone() == serverZone2 ? Constants.EU_DEFAULT_API_HOST : getUseBatch() ? Constants.BATCH_API_HOST : Constants.DEFAULT_API_HOST;
    }

    @NotNull
    public final String getApiKey() {
        return this.apiKey;
    }

    @Nullable
    public Function3<BaseEvent, Integer, String, Unit> getCallback() {
        return this.callback;
    }

    @Nullable
    public String getDeviceId() {
        return this.deviceId;
    }

    public boolean getEnableDiagnostics() {
        return this.enableDiagnostics;
    }

    public boolean getEnableRequestBodyCompression() {
        return this.enableRequestBodyCompression;
    }

    public int getFlushIntervalMillis() {
        return this.flushIntervalMillis;
    }

    public int getFlushMaxRetries() {
        return this.flushMaxRetries;
    }

    public int getFlushQueueSize() {
        return this.flushQueueSize;
    }

    @Nullable
    public HttpClientInterface getHttpClient() {
        return this.httpClient;
    }

    public long getIdentifyBatchIntervalMillis() {
        return this.identifyBatchIntervalMillis;
    }

    @NotNull
    public StorageProvider getIdentifyInterceptStorageProvider() {
        return this.identifyInterceptStorageProvider;
    }

    @NotNull
    public IdentityStorageProvider getIdentityStorageProvider() {
        return this.identityStorageProvider;
    }

    @Nullable
    public IngestionMetadata getIngestionMetadata() {
        return this.ingestionMetadata;
    }

    @NotNull
    public String getInstanceName() {
        return this.instanceName;
    }

    @NotNull
    public LoggerProvider getLoggerProvider() {
        return this.loggerProvider;
    }

    @Nullable
    public Integer getMinIdLength() {
        return this.minIdLength;
    }

    @Nullable
    public Boolean getOffline() {
        return this.offline;
    }

    public boolean getOptOut() {
        return this.optOut;
    }

    @Nullable
    public String getPartnerId() {
        return this.partnerId;
    }

    @Nullable
    public Plan getPlan() {
        return this.plan;
    }

    @Nullable
    public String getServerUrl() {
        return this.serverUrl;
    }

    @NotNull
    public ServerZone getServerZone() {
        return this.serverZone;
    }

    @Nullable
    public Long getSessionId() {
        return this.sessionId;
    }

    @NotNull
    public StorageProvider getStorageProvider() {
        return this.storageProvider;
    }

    public boolean getUseBatch() {
        return this.useBatch;
    }

    public final boolean isValid() {
        return !r70.k.U0(this.apiKey) && getFlushQueueSize() > 0 && getFlushIntervalMillis() > 0 && isMinIdLengthValid();
    }

    public void setCallback(@Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3) {
        this.callback = function3;
    }

    public void setDeviceId(@Nullable String str) {
        this.deviceId = str;
    }

    public void setEnableDiagnostics(boolean z11) {
        this.enableDiagnostics = z11;
    }

    public void setEnableRequestBodyCompression(boolean z11) {
        this.enableRequestBodyCompression = z11;
    }

    public void setFlushIntervalMillis(int i5) {
        this.flushIntervalMillis = i5;
    }

    public void setFlushMaxRetries(int i5) {
        this.flushMaxRetries = i5;
    }

    public void setFlushQueueSize(int i5) {
        this.flushQueueSize = i5;
    }

    public void setHttpClient(@Nullable HttpClientInterface httpClientInterface) {
        this.httpClient = httpClientInterface;
    }

    public void setIdentifyBatchIntervalMillis(long j11) {
        this.identifyBatchIntervalMillis = j11;
    }

    public void setIdentifyInterceptStorageProvider(@NotNull StorageProvider storageProvider) {
        Intrinsics.g(storageProvider, "<set-?>");
        this.identifyInterceptStorageProvider = storageProvider;
    }

    public void setIdentityStorageProvider(@NotNull IdentityStorageProvider identityStorageProvider) {
        Intrinsics.g(identityStorageProvider, "<set-?>");
        this.identityStorageProvider = identityStorageProvider;
    }

    public void setIngestionMetadata(@Nullable IngestionMetadata ingestionMetadata) {
        this.ingestionMetadata = ingestionMetadata;
    }

    public void setInstanceName(@NotNull String str) {
        Intrinsics.g(str, "<set-?>");
        this.instanceName = str;
    }

    public void setMinIdLength(@Nullable Integer num) {
        this.minIdLength = num;
    }

    public void setOffline(@Nullable Boolean bool) {
        this.offline = bool;
    }

    public void setOptOut(boolean z11) {
        this.optOut = z11;
    }

    public void setPartnerId(@Nullable String str) {
        this.partnerId = str;
    }

    public void setPlan(@Nullable Plan plan) {
        this.plan = plan;
    }

    public void setServerUrl(@Nullable String str) {
        this.serverUrl = str;
    }

    public void setServerZone(@NotNull ServerZone serverZone) {
        Intrinsics.g(serverZone, "<set-?>");
        this.serverZone = serverZone;
    }

    public void setSessionId(@Nullable Long l9) {
        this.sessionId = l9;
    }

    public void setUseBatch(boolean z11) {
        this.useBatch = z11;
    }

    public final boolean shouldCompressUploadBody() {
        String serverUrl = getServerUrl();
        if (serverUrl == null || r70.k.U0(serverUrl)) {
            return true;
        }
        return getEnableRequestBodyCompression();
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5) {
        this(apiKey, i5, 0, null, false, null, null, null, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554428, null);
        Intrinsics.g(apiKey, "apiKey");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11) {
        this(apiKey, i5, i11, null, false, null, null, null, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554424, null);
        Intrinsics.g(apiKey, "apiKey");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName) {
        this(apiKey, i5, i11, instanceName, false, null, null, null, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554416, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11) {
        this(apiKey, i5, i11, instanceName, z11, null, null, null, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554400, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, null, null, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554368, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, null, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554304, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554176, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33553920, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33553408, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33552384, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33550336, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, null, null, null, 0L, null, null, null, null, null, null, false, false, 33546240, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, null, null, 0L, null, null, null, null, null, null, false, false, 33538048, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, null, 0L, null, null, null, null, null, null, false, false, 33521664, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, 0L, null, null, null, null, null, null, false, false, 33488896, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j11, null, null, null, null, null, null, false, false, 33423360, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11, @NotNull StorageProvider identifyInterceptStorageProvider) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j11, identifyInterceptStorageProvider, null, null, null, null, null, false, false, 33292288, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j11, identifyInterceptStorageProvider, identityStorageProvider, null, null, null, null, false, false, 33030144, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, @Nullable Boolean bool) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j11, identifyInterceptStorageProvider, identityStorageProvider, bool, null, null, null, false, false, 32505856, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, @Nullable Boolean bool, @Nullable String str3) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j11, identifyInterceptStorageProvider, identityStorageProvider, bool, str3, null, null, false, false, 31457280, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, @Nullable Boolean bool, @Nullable String str3, @Nullable Long l9) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j11, identifyInterceptStorageProvider, identityStorageProvider, bool, str3, l9, null, false, false, 29360128, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, @Nullable Boolean bool, @Nullable String str3, @Nullable Long l9, @Nullable HttpClientInterface httpClientInterface) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j11, identifyInterceptStorageProvider, identityStorageProvider, bool, str3, l9, httpClientInterface, false, false, 25165824, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, @Nullable Boolean bool, @Nullable String str3, @Nullable Long l9, @Nullable HttpClientInterface httpClientInterface, boolean z13) {
        this(apiKey, i5, i11, instanceName, z11, storageProvider, loggerProvider, num, str, function3, i12, z12, serverZone, str2, plan, ingestionMetadata, j11, identifyInterceptStorageProvider, identityStorageProvider, bool, str3, l9, httpClientInterface, z13, false, 16777216, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
    }

    @JvmOverloads
    public Configuration(@NotNull String apiKey, int i5, int i11, @NotNull String instanceName, boolean z11, @NotNull StorageProvider storageProvider, @NotNull LoggerProvider loggerProvider, @Nullable Integer num, @Nullable String str, @Nullable Function3<? super BaseEvent, ? super Integer, ? super String, Unit> function3, int i12, boolean z12, @NotNull ServerZone serverZone, @Nullable String str2, @Nullable Plan plan, @Nullable IngestionMetadata ingestionMetadata, long j11, @NotNull StorageProvider identifyInterceptStorageProvider, @NotNull IdentityStorageProvider identityStorageProvider, @Nullable Boolean bool, @Nullable String str3, @Nullable Long l9, @Nullable HttpClientInterface httpClientInterface, boolean z13, boolean z14) {
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(storageProvider, "storageProvider");
        Intrinsics.g(loggerProvider, "loggerProvider");
        Intrinsics.g(serverZone, "serverZone");
        Intrinsics.g(identifyInterceptStorageProvider, "identifyInterceptStorageProvider");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
        this.apiKey = apiKey;
        this.flushQueueSize = i5;
        this.flushIntervalMillis = i11;
        this.instanceName = instanceName;
        this.optOut = z11;
        this.storageProvider = storageProvider;
        this.loggerProvider = loggerProvider;
        this.minIdLength = num;
        this.partnerId = str;
        this.callback = function3;
        this.flushMaxRetries = i12;
        this.useBatch = z12;
        this.serverZone = serverZone;
        this.serverUrl = str2;
        this.plan = plan;
        this.ingestionMetadata = ingestionMetadata;
        this.identifyBatchIntervalMillis = j11;
        this.identifyInterceptStorageProvider = identifyInterceptStorageProvider;
        this.identityStorageProvider = identityStorageProvider;
        this.offline = bool;
        this.deviceId = str3;
        this.sessionId = l9;
        this.httpClient = httpClientInterface;
        this.enableDiagnostics = z13;
        this.enableRequestBodyCompression = z14;
    }

    public /* synthetic */ Configuration(String str, int i5, int i11, String str2, boolean z11, StorageProvider storageProvider, LoggerProvider loggerProvider, Integer num, String str3, Function3 function3, int i12, boolean z12, ServerZone serverZone, String str4, Plan plan, IngestionMetadata ingestionMetadata, long j11, StorageProvider storageProvider2, IdentityStorageProvider identityStorageProvider, Boolean bool, String str5, Long l9, HttpClientInterface httpClientInterface, boolean z13, boolean z14, int i13, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i13 & 2) != 0 ? 30 : i5, (i13 & 4) != 0 ? FLUSH_INTERVAL_MILLIS : i11, (i13 & 8) != 0 ? DEFAULT_INSTANCE : str2, (i13 & 16) != 0 ? false : z11, (i13 & 32) != 0 ? new InMemoryStorageProvider() : storageProvider, (i13 & 64) != 0 ? new ConsoleLoggerProvider() : loggerProvider, (i13 & 128) != 0 ? null : num, (i13 & 256) != 0 ? null : str3, (i13 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : function3, (i13 & 1024) != 0 ? 5 : i12, (i13 & 2048) != 0 ? false : z12, (i13 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? ServerZone.US : serverZone, (i13 & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? null : str4, (i13 & ReaderJsonLexerKt.BATCH_SIZE) != 0 ? null : plan, (i13 & SQLiteDatabase.OPEN_NOMUTEX) != 0 ? null : ingestionMetadata, (i13 & SQLiteDatabase.OPEN_FULLMUTEX) != 0 ? 30000L : j11, (i13 & SQLiteDatabase.OPEN_SHAREDCACHE) != 0 ? new InMemoryStorageProvider() : storageProvider2, (i13 & SQLiteDatabase.OPEN_PRIVATECACHE) != 0 ? new IMIdentityStorageProvider() : identityStorageProvider, (i13 & 524288) != 0 ? Boolean.FALSE : bool, (i13 & 1048576) != 0 ? null : str5, (i13 & 2097152) != 0 ? null : l9, (i13 & 4194304) == 0 ? httpClientInterface : null, (i13 & 8388608) != 0 ? true : z13, (i13 & 16777216) != 0 ? false : z14);
    }
}
