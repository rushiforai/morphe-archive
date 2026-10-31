package com.amplitude.id;

import com.amplitude.id.utilities.FileUtilsKt;
import com.amplitude.id.utilities.PropertiesFile;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.io.IOException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\b\b\u0018\u0000 \u00172\u00020\u0001:\u0001\u0017B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\b\u0010\t\u001a\u00020\nH\u0016J\b\u0010\u000b\u001a\u00020\fH\u0016J\u001a\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0010H\u0002J\b\u0010\u0012\u001a\u00020\nH\u0002J\u0012\u0010\u0013\u001a\u00020\n2\b\u0010\u0014\u001a\u0004\u0018\u00010\u0010H\u0016J\u0012\u0010\u0015\u001a\u00020\n2\b\u0010\u0016\u001a\u0004\u0018\u00010\u0010H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"Lcom/amplitude/id/FileIdentityStorage;", "Lcom/amplitude/id/IdentityStorage;", "configuration", "Lcom/amplitude/id/IdentityConfiguration;", "(Lcom/amplitude/id/IdentityConfiguration;)V", "getConfiguration", "()Lcom/amplitude/id/IdentityConfiguration;", "propertiesFile", "Lcom/amplitude/id/utilities/PropertiesFile;", "delete", b.f42142b, "load", "Lcom/amplitude/id/Identity;", "safeForKey", b.f42142b, "apiKey", b.f42142b, "configValue", "safetyCheck", "saveDeviceId", "deviceId", "saveUserId", "userId", k.O, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class FileIdentityStorage implements IdentityStorage {

    @NotNull
    public static final String API_KEY = "api_key";

    @NotNull
    public static final String DEVICE_ID_KEY = "device_id";

    @NotNull
    public static final String EXPERIMENT_API_KEY = "experiment_api_key";

    @NotNull
    public static final String USER_ID_KEY = "user_id";

    @NotNull
    private final IdentityConfiguration configuration;

    @NotNull
    private final PropertiesFile propertiesFile;

    public FileIdentityStorage(@NotNull IdentityConfiguration configuration) throws IOException {
        Intrinsics.g(configuration, "configuration");
        this.configuration = configuration;
        File storageDirectory = configuration.getStorageDirectory();
        FileUtilsKt.createDirectory(storageDirectory);
        PropertiesFile propertiesFile = new PropertiesFile(storageDirectory, configuration.getFileName(), configuration.getLogger());
        this.propertiesFile = propertiesFile;
        propertiesFile.load();
        safetyCheck();
    }

    private final boolean safeForKey(String apiKey, String configValue) {
        String string;
        if (configValue == null || (string = this.propertiesFile.getString(apiKey, null)) == null) {
            return true;
        }
        return string.equals(configValue);
    }

    private final void safetyCheck() {
        if (!safeForKey(API_KEY, this.configuration.getApiKey()) || !safeForKey(EXPERIMENT_API_KEY, this.configuration.getExperimentApiKey())) {
            this.propertiesFile.remove(ul.b.Q("user_id", "device_id", API_KEY, EXPERIMENT_API_KEY));
        }
        String apiKey = this.configuration.getApiKey();
        if (apiKey != null) {
            this.propertiesFile.putString(API_KEY, apiKey);
        }
        String experimentApiKey = this.configuration.getExperimentApiKey();
        if (experimentApiKey != null) {
            this.propertiesFile.putString(EXPERIMENT_API_KEY, experimentApiKey);
        }
    }

    @Override // com.amplitude.id.IdentityStorage
    public void delete() {
        this.propertiesFile.deletePropertiesFile();
    }

    @NotNull
    public final IdentityConfiguration getConfiguration() {
        return this.configuration;
    }

    @Override // com.amplitude.id.IdentityStorage
    @NotNull
    public Identity load() {
        return new Identity(this.propertiesFile.getString("user_id", null), this.propertiesFile.getString("device_id", null));
    }

    @Override // com.amplitude.id.IdentityStorage
    public void saveDeviceId(@Nullable String deviceId) {
        PropertiesFile propertiesFile = this.propertiesFile;
        if (deviceId == null) {
            deviceId = b.f42142b;
        }
        propertiesFile.putString("device_id", deviceId);
    }

    @Override // com.amplitude.id.IdentityStorage
    public void saveUserId(@Nullable String userId) {
        PropertiesFile propertiesFile = this.propertiesFile;
        if (userId == null) {
            userId = b.f42142b;
        }
        propertiesFile.putString("user_id", userId);
    }
}
