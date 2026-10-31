package com.instabridge.ai.context;

import a2.c;
import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001:\u0001\bJ\u0018\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006H&J\u0018\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006H&¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/context/AppUsageProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getRecentApps", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/context/AppUsageProvider$AppUsageEntry;", "limit", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getFrequentApps", "AppUsageEntry", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface AppUsageProvider {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class DefaultImpls {
        public static /* synthetic */ List getFrequentApps$default(AppUsageProvider appUsageProvider, int i5, int i11, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getFrequentApps");
            }
            if ((i11 & 1) != 0) {
                i5 = 10;
            }
            return appUsageProvider.getFrequentApps(i5);
        }

        public static /* synthetic */ List getRecentApps$default(AppUsageProvider appUsageProvider, int i5, int i11, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getRecentApps");
            }
            if ((i11 & 1) != 0) {
                i5 = 10;
            }
            return appUsageProvider.getRecentApps(i5);
        }
    }

    @NotNull
    List<AppUsageEntry> getFrequentApps(int limit);

    @NotNull
    List<AppUsageEntry> getRecentApps(int limit);

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u000f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\t\u0010\u0012\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0013\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0014\u001a\u00020\u0006HÆ\u0003J\t\u0010\u0015\u001a\u00020\bHÆ\u0003J1\u0010\u0016\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\bHÆ\u0001J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0006HÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\fR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/context/AppUsageProvider$AppUsageEntry;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appLabel", "launchCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lastUsedMs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;IJ)V", "getPackageName", "()Ljava/lang/String;", "getAppLabel", "getLaunchCount", "()I", "getLastUsedMs", "()J", "component1", "component2", "component3", "component4", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class AppUsageEntry {
        public static final int $stable = 0;

        @NotNull
        private final String appLabel;
        private final long lastUsedMs;
        private final int launchCount;

        @NotNull
        private final String packageName;

        public AppUsageEntry(@NotNull String packageName, @NotNull String appLabel, int i5, long j11) {
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(appLabel, "appLabel");
            this.packageName = packageName;
            this.appLabel = appLabel;
            this.launchCount = i5;
            this.lastUsedMs = j11;
        }

        public static /* synthetic */ AppUsageEntry copy$default(AppUsageEntry appUsageEntry, String str, String str2, int i5, long j11, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                str = appUsageEntry.packageName;
            }
            if ((i11 & 2) != 0) {
                str2 = appUsageEntry.appLabel;
            }
            if ((i11 & 4) != 0) {
                i5 = appUsageEntry.launchCount;
            }
            if ((i11 & 8) != 0) {
                j11 = appUsageEntry.lastUsedMs;
            }
            int i12 = i5;
            return appUsageEntry.copy(str, str2, i12, j11);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getPackageName() {
            return this.packageName;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getAppLabel() {
            return this.appLabel;
        }

        /* renamed from: component3, reason: from getter */
        public final int getLaunchCount() {
            return this.launchCount;
        }

        /* renamed from: component4, reason: from getter */
        public final long getLastUsedMs() {
            return this.lastUsedMs;
        }

        @NotNull
        public final AppUsageEntry copy(@NotNull String packageName, @NotNull String appLabel, int launchCount, long lastUsedMs) {
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(appLabel, "appLabel");
            return new AppUsageEntry(packageName, appLabel, launchCount, lastUsedMs);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof AppUsageEntry)) {
                return false;
            }
            AppUsageEntry appUsageEntry = (AppUsageEntry) other;
            return Intrinsics.b(this.packageName, appUsageEntry.packageName) && Intrinsics.b(this.appLabel, appUsageEntry.appLabel) && this.launchCount == appUsageEntry.launchCount && this.lastUsedMs == appUsageEntry.lastUsedMs;
        }

        @NotNull
        public final String getAppLabel() {
            return this.appLabel;
        }

        public final long getLastUsedMs() {
            return this.lastUsedMs;
        }

        public final int getLaunchCount() {
            return this.launchCount;
        }

        @NotNull
        public final String getPackageName() {
            return this.packageName;
        }

        public int hashCode() {
            return Long.hashCode(this.lastUsedMs) + u4.a(this.launchCount, c0.e(this.packageName.hashCode() * 31, 31, this.appLabel), 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("AppUsageEntry(packageName=");
            sb2.append(this.packageName);
            sb2.append(", appLabel=");
            sb2.append(this.appLabel);
            sb2.append(", launchCount=");
            sb2.append(this.launchCount);
            sb2.append(", lastUsedMs=");
            return c.n(sb2, this.lastUsedMs, ')');
        }

        public /* synthetic */ AppUsageEntry(String str, String str2, int i5, long j11, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, (i11 & 4) != 0 ? 0 : i5, (i11 & 8) != 0 ? 0L : j11);
        }
    }
}
