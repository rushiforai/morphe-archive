package com.amplitude.android.storage;

import com.amplitude.android.Configuration;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.StorageProvider;
import com.amplitude.id.FileIdentityStorageProvider;
import com.amplitude.id.IdentityStorageProvider;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\bÀ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u000e\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010J\u000e\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010J\u000e\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010J\u0006\u0010\u0013\u001a\u00020\u0014R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u0011\u0010\u0007\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0006R\u0011\u0010\t\u001a\u00020\n¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\f¨\u0006\u0015"}, d2 = {"Lcom/amplitude/android/storage/AndroidStorageContextV3;", b.f42142b, "()V", "eventsStorageProvider", "Lcom/amplitude/core/StorageProvider;", "getEventsStorageProvider", "()Lcom/amplitude/core/StorageProvider;", "identifyInterceptStorageProvider", "getIdentifyInterceptStorageProvider", "identityStorageProvider", "Lcom/amplitude/id/IdentityStorageProvider;", "getIdentityStorageProvider", "()Lcom/amplitude/id/IdentityStorageProvider;", "getEventsStorageDirectory", "Ljava/io/File;", "configuration", "Lcom/amplitude/android/Configuration;", "getIdentifyInterceptStorageDirectory", "getIdentityStorageDirectory", "getIdentityStorageFileName", b.f42142b, "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class AndroidStorageContextV3 {

    @NotNull
    public static final AndroidStorageContextV3 INSTANCE = new AndroidStorageContextV3();

    @NotNull
    private static final StorageProvider eventsStorageProvider = new AndroidEventsStorageProviderV2();

    @NotNull
    private static final IdentityStorageProvider identityStorageProvider = new FileIdentityStorageProvider();

    @NotNull
    private static final StorageProvider identifyInterceptStorageProvider = new AndroidIdentifyInterceptStorageProviderV2();

    private AndroidStorageContextV3() {
    }

    @NotNull
    public final File getEventsStorageDirectory(@NotNull Configuration configuration) {
        Intrinsics.g(configuration, "configuration");
        return new File(configuration.getStorageDirectory$android_release(), DatabaseConstants.EVENT_TABLE_NAME);
    }

    @NotNull
    public final StorageProvider getEventsStorageProvider() {
        return eventsStorageProvider;
    }

    @NotNull
    public final File getIdentifyInterceptStorageDirectory(@NotNull Configuration configuration) {
        Intrinsics.g(configuration, "configuration");
        return new File(configuration.getStorageDirectory$android_release(), "identify-intercept");
    }

    @NotNull
    public final StorageProvider getIdentifyInterceptStorageProvider() {
        return identifyInterceptStorageProvider;
    }

    @NotNull
    public final File getIdentityStorageDirectory(@NotNull Configuration configuration) {
        Intrinsics.g(configuration, "configuration");
        return configuration.getStorageDirectory$android_release();
    }

    @NotNull
    public final String getIdentityStorageFileName() {
        return "identity";
    }

    @NotNull
    public final IdentityStorageProvider getIdentityStorageProvider() {
        return identityStorageProvider;
    }
}
