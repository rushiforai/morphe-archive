package com.amplitude.id;

import b.c0;
import com.amplitude.common.Logger;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\b\u0018\u00002\u00020\u0001BI\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u0003\u0012\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\u0002\u0010\rJ\t\u0010\u0019\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001a\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u001b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0007HÆ\u0003J\t\u0010\u001d\u001a\u00020\tHÆ\u0003J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u001f\u001a\u0004\u0018\u00010\fHÆ\u0003JU\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u00032\n\b\u0002\u0010\u000b\u001a\u0004\u0018\u00010\fHÆ\u0001J\u0013\u0010!\u001a\u00020\"2\b\u0010#\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010$\u001a\u00020%HÖ\u0001J\t\u0010&\u001a\u00020\u0003HÖ\u0001R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000fR\u0011\u0010\n\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u000fR\u0013\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018¨\u0006'"}, d2 = {"Lcom/amplitude/id/IdentityConfiguration;", b.f42142b, "instanceName", b.f42142b, "apiKey", "experimentApiKey", "identityStorageProvider", "Lcom/amplitude/id/IdentityStorageProvider;", "storageDirectory", "Ljava/io/File;", "fileName", "logger", "Lcom/amplitude/common/Logger;", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/amplitude/id/IdentityStorageProvider;Ljava/io/File;Ljava/lang/String;Lcom/amplitude/common/Logger;)V", "getApiKey", "()Ljava/lang/String;", "getExperimentApiKey", "getFileName", "getIdentityStorageProvider", "()Lcom/amplitude/id/IdentityStorageProvider;", "getInstanceName", "getLogger", "()Lcom/amplitude/common/Logger;", "getStorageDirectory", "()Ljava/io/File;", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final /* data */ class IdentityConfiguration {

    @Nullable
    private final String apiKey;

    @Nullable
    private final String experimentApiKey;

    @NotNull
    private final String fileName;

    @NotNull
    private final IdentityStorageProvider identityStorageProvider;

    @NotNull
    private final String instanceName;

    @Nullable
    private final Logger logger;

    @NotNull
    private final File storageDirectory;

    public IdentityConfiguration(@NotNull String instanceName, @Nullable String str, @Nullable String str2, @NotNull IdentityStorageProvider identityStorageProvider, @NotNull File storageDirectory, @NotNull String fileName, @Nullable Logger logger) {
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
        Intrinsics.g(storageDirectory, "storageDirectory");
        Intrinsics.g(fileName, "fileName");
        this.instanceName = instanceName;
        this.apiKey = str;
        this.experimentApiKey = str2;
        this.identityStorageProvider = identityStorageProvider;
        this.storageDirectory = storageDirectory;
        this.fileName = fileName;
        this.logger = logger;
    }

    public static /* synthetic */ IdentityConfiguration copy$default(IdentityConfiguration identityConfiguration, String str, String str2, String str3, IdentityStorageProvider identityStorageProvider, File file, String str4, Logger logger, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = identityConfiguration.instanceName;
        }
        if ((i5 & 2) != 0) {
            str2 = identityConfiguration.apiKey;
        }
        if ((i5 & 4) != 0) {
            str3 = identityConfiguration.experimentApiKey;
        }
        if ((i5 & 8) != 0) {
            identityStorageProvider = identityConfiguration.identityStorageProvider;
        }
        if ((i5 & 16) != 0) {
            file = identityConfiguration.storageDirectory;
        }
        if ((i5 & 32) != 0) {
            str4 = identityConfiguration.fileName;
        }
        if ((i5 & 64) != 0) {
            logger = identityConfiguration.logger;
        }
        String str5 = str4;
        Logger logger2 = logger;
        File file2 = file;
        String str6 = str3;
        return identityConfiguration.copy(str, str2, str6, identityStorageProvider, file2, str5, logger2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getInstanceName() {
        return this.instanceName;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getApiKey() {
        return this.apiKey;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getExperimentApiKey() {
        return this.experimentApiKey;
    }

    @NotNull
    /* renamed from: component4, reason: from getter */
    public final IdentityStorageProvider getIdentityStorageProvider() {
        return this.identityStorageProvider;
    }

    @NotNull
    /* renamed from: component5, reason: from getter */
    public final File getStorageDirectory() {
        return this.storageDirectory;
    }

    @NotNull
    /* renamed from: component6, reason: from getter */
    public final String getFileName() {
        return this.fileName;
    }

    @Nullable
    /* renamed from: component7, reason: from getter */
    public final Logger getLogger() {
        return this.logger;
    }

    @NotNull
    public final IdentityConfiguration copy(@NotNull String instanceName, @Nullable String apiKey, @Nullable String experimentApiKey, @NotNull IdentityStorageProvider identityStorageProvider, @NotNull File storageDirectory, @NotNull String fileName, @Nullable Logger logger) {
        Intrinsics.g(instanceName, "instanceName");
        Intrinsics.g(identityStorageProvider, "identityStorageProvider");
        Intrinsics.g(storageDirectory, "storageDirectory");
        Intrinsics.g(fileName, "fileName");
        return new IdentityConfiguration(instanceName, apiKey, experimentApiKey, identityStorageProvider, storageDirectory, fileName, logger);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof IdentityConfiguration)) {
            return false;
        }
        IdentityConfiguration identityConfiguration = (IdentityConfiguration) other;
        return Intrinsics.b(this.instanceName, identityConfiguration.instanceName) && Intrinsics.b(this.apiKey, identityConfiguration.apiKey) && Intrinsics.b(this.experimentApiKey, identityConfiguration.experimentApiKey) && Intrinsics.b(this.identityStorageProvider, identityConfiguration.identityStorageProvider) && Intrinsics.b(this.storageDirectory, identityConfiguration.storageDirectory) && Intrinsics.b(this.fileName, identityConfiguration.fileName) && Intrinsics.b(this.logger, identityConfiguration.logger);
    }

    @Nullable
    public final String getApiKey() {
        return this.apiKey;
    }

    @Nullable
    public final String getExperimentApiKey() {
        return this.experimentApiKey;
    }

    @NotNull
    public final String getFileName() {
        return this.fileName;
    }

    @NotNull
    public final IdentityStorageProvider getIdentityStorageProvider() {
        return this.identityStorageProvider;
    }

    @NotNull
    public final String getInstanceName() {
        return this.instanceName;
    }

    @Nullable
    public final Logger getLogger() {
        return this.logger;
    }

    @NotNull
    public final File getStorageDirectory() {
        return this.storageDirectory;
    }

    public int hashCode() {
        int iHashCode = this.instanceName.hashCode() * 31;
        String str = this.apiKey;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.experimentApiKey;
        int iE = c0.e((this.storageDirectory.hashCode() + ((this.identityStorageProvider.hashCode() + ((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31)) * 31, 31, this.fileName);
        Logger logger = this.logger;
        return iE + (logger != null ? logger.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        return "IdentityConfiguration(instanceName=" + this.instanceName + ", apiKey=" + this.apiKey + ", experimentApiKey=" + this.experimentApiKey + ", identityStorageProvider=" + this.identityStorageProvider + ", storageDirectory=" + this.storageDirectory + ", fileName=" + this.fileName + ", logger=" + this.logger + ')';
    }

    public /* synthetic */ IdentityConfiguration(String str, String str2, String str3, IdentityStorageProvider identityStorageProvider, File file, String str4, Logger logger, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : str3, identityStorageProvider, file, str4, (i5 & 64) != 0 ? null : logger);
    }
}
