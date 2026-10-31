package com.amplitude.core;

import com.amplitude.core.utilities.ConsoleLoggerProvider;
import com.amplitude.core.utilities.InMemoryStorageProvider;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0006\u0010\u0011\u001a\u00020\u0001R\u001a\u0010\u0005\u001a\u00020\u0006X\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\nR\u001a\u0010\u000b\u001a\u00020\fX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010¨\u0006\u0012"}, d2 = {"Lcom/amplitude/core/ConfigurationBuilder;", "Lcom/amplitude/core/Configuration;", "apiKey", b.f42142b, "(Ljava/lang/String;)V", "loggerProvider", "Lcom/amplitude/core/LoggerProvider;", "getLoggerProvider", "()Lcom/amplitude/core/LoggerProvider;", "setLoggerProvider", "(Lcom/amplitude/core/LoggerProvider;)V", "storageProvider", "Lcom/amplitude/core/StorageProvider;", "getStorageProvider", "()Lcom/amplitude/core/StorageProvider;", "setStorageProvider", "(Lcom/amplitude/core/StorageProvider;)V", "build", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ConfigurationBuilder extends Configuration {

    @NotNull
    private LoggerProvider loggerProvider;

    @NotNull
    private StorageProvider storageProvider;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ConfigurationBuilder(@NotNull String apiKey) {
        super(apiKey, 0, 0, null, false, null, null, null, null, null, 0, false, null, null, null, null, 0L, null, null, null, null, null, null, false, false, 33554430, null);
        Intrinsics.g(apiKey, "apiKey");
        this.storageProvider = new InMemoryStorageProvider();
        this.loggerProvider = new ConsoleLoggerProvider();
    }

    @NotNull
    public final Configuration build() {
        return new Configuration(getApiKey(), getFlushQueueSize(), getFlushIntervalMillis(), getInstanceName(), getOptOut(), getStorageProvider(), getLoggerProvider(), getMinIdLength(), getPartnerId(), getCallback(), getFlushMaxRetries(), getUseBatch(), getServerZone(), getServerUrl(), getPlan(), getIngestionMetadata(), getIdentifyBatchIntervalMillis(), getIdentifyInterceptStorageProvider(), getIdentityStorageProvider(), getOffline(), getDeviceId(), getSessionId(), getHttpClient(), getEnableDiagnostics(), getEnableRequestBodyCompression());
    }

    @Override // com.amplitude.core.Configuration
    @NotNull
    public LoggerProvider getLoggerProvider() {
        return this.loggerProvider;
    }

    @Override // com.amplitude.core.Configuration
    @NotNull
    public StorageProvider getStorageProvider() {
        return this.storageProvider;
    }

    public void setLoggerProvider(@NotNull LoggerProvider loggerProvider) {
        Intrinsics.g(loggerProvider, "<set-?>");
        this.loggerProvider = loggerProvider;
    }

    public void setStorageProvider(@NotNull StorageProvider storageProvider) {
        Intrinsics.g(storageProvider, "<set-?>");
        this.storageProvider = storageProvider;
    }
}
