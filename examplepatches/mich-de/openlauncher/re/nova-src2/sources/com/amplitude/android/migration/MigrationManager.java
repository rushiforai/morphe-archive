package com.amplitude.android.migration;

import android.content.SharedPreferences;
import com.amplitude.android.Amplitude;
import com.amplitude.android.Configuration;
import com.amplitude.android.storage.AndroidStorageContextV1;
import com.amplitude.android.storage.AndroidStorageContextV2;
import com.amplitude.android.storage.LegacySdkStorageContext;
import com.amplitude.android.storage.StorageVersion;
import com.amplitude.common.Logger;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u000e\u0010\r\u001a\u00020\u000eH\u0086@¢\u0006\u0002\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u000eH\u0080@¢\u0006\u0004\b\u0011\u0010\u000fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Lcom/amplitude/android/migration/MigrationManager;", b.f42142b, "amplitude", "Lcom/amplitude/android/Amplitude;", "(Lcom/amplitude/android/Amplitude;)V", "config", "Lcom/amplitude/android/Configuration;", "currentStorageVersion", b.f42142b, "logger", "Lcom/amplitude/common/Logger;", "sharedPreferences", "Landroid/content/SharedPreferences;", "migrateOldStorage", b.f42142b, "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "safePerformMigration", "safePerformMigration$android_release", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class MigrationManager {

    @NotNull
    private final Amplitude amplitude;

    @NotNull
    private final Configuration config;
    private final int currentStorageVersion;

    @NotNull
    private final Logger logger;

    @NotNull
    private final SharedPreferences sharedPreferences;

    public MigrationManager(@NotNull Amplitude amplitude) {
        Intrinsics.g(amplitude, "amplitude");
        this.amplitude = amplitude;
        com.amplitude.core.Configuration configuration = amplitude.getConfiguration();
        Intrinsics.e(configuration, "null cannot be cast to non-null type com.amplitude.android.Configuration");
        Configuration configuration2 = (Configuration) configuration;
        this.config = configuration2;
        this.logger = amplitude.getLogger();
        SharedPreferences sharedPreferences = configuration2.getContext().getSharedPreferences("amplitude-android-" + configuration2.getInstanceName(), 0);
        Intrinsics.f(sharedPreferences, "getSharedPreferences(...)");
        this.sharedPreferences = sharedPreferences;
        this.currentStorageVersion = sharedPreferences.getInt("storage_version", 0);
    }

    @Nullable
    public final Object migrateOldStorage(@NotNull Continuation<? super Unit> continuation) {
        int i5 = this.currentStorageVersion;
        StorageVersion storageVersion = StorageVersion.V3;
        if (i5 >= storageVersion.getRawValue()) {
            this.amplitude.getLogger().debug("Storage already at version " + storageVersion.getRawValue());
            return Unit.f71706a;
        }
        this.logger.debug("Migrating storage to version " + storageVersion.getRawValue());
        Object objSafePerformMigration$android_release = safePerformMigration$android_release(continuation);
        return objSafePerformMigration$android_release == CoroutineSingletons.f71806a ? objSafePerformMigration$android_release : Unit.f71706a;
    }

    /* JADX WARN: Code restructure failed: missing block: B:34:0x0085, code lost:
    
        if (r8.migrateToLatestVersion(r0) == r1) goto L45;
     */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object safePerformMigration$android_release(@NotNull Continuation<? super Unit> continuation) {
        MigrationManager$safePerformMigration$1 migrationManager$safePerformMigration$1;
        MigrationManager migrationManager;
        Configuration configuration;
        MigrationManager migrationManager2;
        MigrationManager migrationManager3;
        AndroidStorageContextV2 androidStorageContextV2;
        if (continuation instanceof MigrationManager$safePerformMigration$1) {
            migrationManager$safePerformMigration$1 = (MigrationManager$safePerformMigration$1) continuation;
            int i5 = migrationManager$safePerformMigration$1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                migrationManager$safePerformMigration$1.label = i5 - Integer.MIN_VALUE;
            } else {
                migrationManager$safePerformMigration$1 = new MigrationManager$safePerformMigration$1(this, continuation);
            }
        }
        Object obj = migrationManager$safePerformMigration$1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = migrationManager$safePerformMigration$1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                com.amplitude.core.Configuration configuration2 = this.amplitude.getConfiguration();
                Intrinsics.e(configuration2, "null cannot be cast to non-null type com.amplitude.android.Configuration");
                configuration = (Configuration) configuration2;
                if (configuration.getMigrateLegacyData()) {
                    LegacySdkStorageContext legacySdkStorageContext = new LegacySdkStorageContext(this.amplitude);
                    migrationManager$safePerformMigration$1.L$0 = this;
                    migrationManager$safePerformMigration$1.L$1 = configuration;
                    migrationManager$safePerformMigration$1.label = 1;
                }
                migrationManager2 = this;
            } catch (Throwable th2) {
                th = th2;
                migrationManager = this;
                migrationManager.logger.error("Failed to migrate storage: " + th.getMessage());
                return Unit.f71706a;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 != 3) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    migrationManager = (MigrationManager) migrationManager$safePerformMigration$1.L$0;
                    try {
                        ResultKt.b(obj);
                        migrationManager.sharedPreferences.edit().putInt("storage_version", StorageVersion.V3.getRawValue()).apply();
                    } catch (Throwable th3) {
                        th = th3;
                        migrationManager.logger.error("Failed to migrate storage: " + th.getMessage());
                        return Unit.f71706a;
                    }
                    return Unit.f71706a;
                }
                configuration = (Configuration) migrationManager$safePerformMigration$1.L$1;
                migrationManager3 = (MigrationManager) migrationManager$safePerformMigration$1.L$0;
                try {
                    ResultKt.b(obj);
                    androidStorageContextV2 = new AndroidStorageContextV2(migrationManager3.amplitude, configuration);
                    migrationManager$safePerformMigration$1.L$0 = migrationManager3;
                    migrationManager$safePerformMigration$1.L$1 = null;
                    migrationManager$safePerformMigration$1.label = 3;
                } catch (Throwable th4) {
                    th = th4;
                    migrationManager = migrationManager3;
                    migrationManager.logger.error("Failed to migrate storage: " + th.getMessage());
                    return Unit.f71706a;
                }
                if (androidStorageContextV2.migrateToLatestVersion(migrationManager$safePerformMigration$1) != coroutineSingletons) {
                    migrationManager = migrationManager3;
                    migrationManager.sharedPreferences.edit().putInt("storage_version", StorageVersion.V3.getRawValue()).apply();
                    return Unit.f71706a;
                }
                return coroutineSingletons;
            }
            configuration = (Configuration) migrationManager$safePerformMigration$1.L$1;
            migrationManager2 = (MigrationManager) migrationManager$safePerformMigration$1.L$0;
            try {
                ResultKt.b(obj);
            } catch (Throwable th5) {
                th = th5;
                migrationManager = migrationManager2;
                migrationManager.logger.error("Failed to migrate storage: " + th.getMessage());
                return Unit.f71706a;
            }
        }
        AndroidStorageContextV1 androidStorageContextV1 = new AndroidStorageContextV1(migrationManager2.amplitude, configuration);
        migrationManager$safePerformMigration$1.L$0 = migrationManager2;
        migrationManager$safePerformMigration$1.L$1 = configuration;
        migrationManager$safePerformMigration$1.label = 2;
        if (androidStorageContextV1.migrateToLatestVersion(migrationManager$safePerformMigration$1) != coroutineSingletons) {
            migrationManager3 = migrationManager2;
            androidStorageContextV2 = new AndroidStorageContextV2(migrationManager3.amplitude, configuration);
            migrationManager$safePerformMigration$1.L$0 = migrationManager3;
            migrationManager$safePerformMigration$1.L$1 = null;
            migrationManager$safePerformMigration$1.label = 3;
            if (androidStorageContextV2.migrateToLatestVersion(migrationManager$safePerformMigration$1) != coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }
}
