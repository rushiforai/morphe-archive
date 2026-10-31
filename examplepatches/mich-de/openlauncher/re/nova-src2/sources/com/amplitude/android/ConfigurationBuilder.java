package com.amplitude.android;

import ab.e0;
import android.content.Context;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u0006\u0010\u0007\u001a\u00020\u0001¨\u0006\b"}, d2 = {"Lcom/amplitude/android/ConfigurationBuilder;", "Lcom/amplitude/android/Configuration;", "apiKey", b.f42142b, "context", "Landroid/content/Context;", "(Ljava/lang/String;Landroid/content/Context;)V", "build", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ConfigurationBuilder extends Configuration {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ConfigurationBuilder(@NotNull String apiKey, @NotNull Context context) {
        super(apiKey, context, 0, 0, null, false, null, null, null, null, null, 0, false, null, null, null, null, false, false, false, null, false, false, false, 0L, e0.U(AutocaptureOption.SESSIONS), 0L, null, null, false, null, null, null, null, null, false, false, false, -33554436, 63, null);
        Intrinsics.g(apiKey, "apiKey");
        Intrinsics.g(context, "context");
    }

    @NotNull
    public final Configuration build() {
        return new Configuration(getApiKey(), getContext(), getFlushQueueSize(), getFlushIntervalMillis(), getInstanceName(), getOptOut(), getStorageProvider(), getLoggerProvider(), getMinIdLength(), getPartnerId(), getCallback(), getFlushMaxRetries(), getUseBatch(), getServerZone(), getServerUrl(), getPlan(), getIngestionMetadata(), getUseAdvertisingIdForDeviceId(), getUseAppSetIdForDeviceId(), getNewDeviceIdPerInstall(), getTrackingOptions(), getEnableCoppaControl(), getLocationListening(), getFlushEventsOnClose(), getMinTimeBetweenSessionsMillis(), getAutocapture(), getIdentifyBatchIntervalMillis(), getIdentifyInterceptStorageProvider(), getIdentityStorageProvider(), getMigrateLegacyData(), getOffline(), getDeviceId(), getSessionId(), getHttpClient(), getInteractionsOptions(), getEnableDiagnostics(), getEnableRequestBodyCompression(), getEnableAutocaptureRemoteConfig());
    }
}
