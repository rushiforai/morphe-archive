package com.amplitude.id.utilities;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.common.Logger;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import kotlin.ExceptionsKt;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.i;

@Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0010\t\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0002\u0010\bJ\r\u0010\u0011\u001a\u00020\u0012H\u0000¢\u0006\u0002\b\u0013J\u0010\u0010\u0014\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0005H\u0016J\u0006\u0010\u0016\u001a\u00020\u0012J\u0018\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u0019\u001a\u00020\u0018H\u0016J\u001a\u0010\u001a\u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0015\u001a\u00020\u00052\b\u0010\u0019\u001a\u0004\u0018\u00010\u0005J\u0006\u0010\u001b\u001a\u00020\u0012J\u0018\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u001e\u001a\u00020\u0018H\u0016J\u0016\u0010\u001f\u001a\u00020\u001d2\u0006\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u001e\u001a\u00020\u0005J\u000e\u0010 \u001a\u00020\u001d2\u0006\u0010\u0015\u001a\u00020\u0005J\u0014\u0010 \u001a\u00020\u001d2\f\u0010!\u001a\b\u0012\u0004\u0012\u00020\u00050\"J\b\u0010#\u001a\u00020\u0012H\u0002R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u00020\fX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010¨\u0006$"}, d2 = {"Lcom/amplitude/id/utilities/PropertiesFile;", "Lcom/amplitude/id/utilities/KeyValueStore;", "directory", "Ljava/io/File;", "fileNameWithoutExtension", b.f42142b, "logger", "Lcom/amplitude/common/Logger;", "(Ljava/io/File;Ljava/lang/String;Lcom/amplitude/common/Logger;)V", "propertiesFile", "propertiesFileName", "underlyingProperties", "Ljava/util/Properties;", "getUnderlyingProperties$core", "()Ljava/util/Properties;", "setUnderlyingProperties$core", "(Ljava/util/Properties;)V", "createPropertiesFile", b.f42142b, "createPropertiesFile$core", "deleteKey", DatabaseConstants.KEY_FIELD, "deletePropertiesFile", "getLong", b.f42142b, "defaultVal", "getString", "load", "putLong", b.f42142b, "value", "putString", "remove", UserMetadata.KEYDATA_FILENAME, b.f42142b, ActionCategory.SAVE, "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class PropertiesFile implements KeyValueStore {

    @Nullable
    private final Logger logger;

    @NotNull
    private final File propertiesFile;

    @NotNull
    private final String propertiesFileName;

    @NotNull
    private Properties underlyingProperties;

    public PropertiesFile(@NotNull File directory, @NotNull String fileNameWithoutExtension, @Nullable Logger logger) {
        Intrinsics.g(directory, "directory");
        Intrinsics.g(fileNameWithoutExtension, "fileNameWithoutExtension");
        this.logger = logger;
        this.underlyingProperties = new Properties();
        String strConcat = fileNameWithoutExtension.concat(".properties");
        this.propertiesFileName = strConcat;
        this.propertiesFile = new File(directory, strConcat);
    }

    private final void save() {
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(this.propertiesFile);
            try {
                this.underlyingProperties.store(fileOutputStream, (String) null);
                Unit unit = Unit.f71706a;
                fileOutputStream.close();
            } finally {
            }
        } catch (Throwable th2) {
            Logger logger = this.logger;
            if (logger != null) {
                logger.error("Failed to save property file with path " + this.propertiesFile.getAbsolutePath() + ", error stacktrace: " + ExceptionsKt.b(th2));
            }
        }
    }

    public final void createPropertiesFile$core() throws IOException {
        this.propertiesFile.getParentFile().mkdirs();
        this.propertiesFile.createNewFile();
    }

    @Override // com.amplitude.id.utilities.KeyValueStore
    public void deleteKey(@NotNull String key) {
        Intrinsics.g(key, "key");
        this.underlyingProperties.remove(key);
        save();
    }

    public final void deletePropertiesFile() {
        this.propertiesFile.delete();
    }

    @Override // com.amplitude.id.utilities.KeyValueStore
    public long getLong(@NotNull String key, long defaultVal) {
        Intrinsics.g(key, "key");
        String property = this.underlyingProperties.getProperty(key, b.f42142b);
        Intrinsics.f(property, "getProperty(...)");
        Long lV0 = i.v0(property);
        return lV0 != null ? lV0.longValue() : defaultVal;
    }

    @Nullable
    public final String getString(@NotNull String key, @Nullable String defaultVal) {
        Intrinsics.g(key, "key");
        return this.underlyingProperties.getProperty(key, defaultVal);
    }

    @NotNull
    /* renamed from: getUnderlyingProperties$core, reason: from getter */
    public final Properties getUnderlyingProperties() {
        return this.underlyingProperties;
    }

    public final void load() throws IOException {
        if (this.propertiesFile.exists()) {
            try {
                FileInputStream fileInputStream = new FileInputStream(this.propertiesFile);
                try {
                    this.underlyingProperties.load(fileInputStream);
                    Unit unit = Unit.f71706a;
                    fileInputStream.close();
                    return;
                } finally {
                }
            } catch (Throwable th2) {
                this.propertiesFile.delete();
                Logger logger = this.logger;
                if (logger != null) {
                    logger.error("Failed to load property file with path " + this.propertiesFile.getAbsolutePath() + ", error stacktrace: " + ExceptionsKt.b(th2));
                }
            }
        }
        createPropertiesFile$core();
    }

    @Override // com.amplitude.id.utilities.KeyValueStore
    public boolean putLong(@NotNull String key, long value) {
        Intrinsics.g(key, "key");
        this.underlyingProperties.setProperty(key, String.valueOf(value));
        save();
        return true;
    }

    public final boolean putString(@NotNull String key, @NotNull String value) {
        Intrinsics.g(key, "key");
        Intrinsics.g(value, "value");
        this.underlyingProperties.setProperty(key, value);
        save();
        return true;
    }

    public final boolean remove(@NotNull String key) {
        Intrinsics.g(key, "key");
        this.underlyingProperties.remove(key);
        save();
        return true;
    }

    public final void setUnderlyingProperties$core(@NotNull Properties properties) {
        Intrinsics.g(properties, "<set-?>");
        this.underlyingProperties = properties;
    }

    public final boolean remove(@NotNull List<String> keys) {
        Intrinsics.g(keys, "keys");
        Iterator<T> it = keys.iterator();
        while (it.hasNext()) {
            this.underlyingProperties.remove((String) it.next());
        }
        save();
        return true;
    }
}
