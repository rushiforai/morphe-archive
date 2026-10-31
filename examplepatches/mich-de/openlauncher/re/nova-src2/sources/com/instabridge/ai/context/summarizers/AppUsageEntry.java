package com.instabridge.ai.context.summarizers;

import a2.c;
import b.c0;
import b.u4;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.measurement.k2;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.a;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\r\n\u0002\u0010\u0006\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001BA\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u0012\b\b\u0002\u0010\u0007\u001a\u00020\u0006\u0012\b\b\u0002\u0010\b\u001a\u00020\t\u0012\b\b\u0002\u0010\n\u001a\u00020\u0006¢\u0006\u0004\b\u000b\u0010\fJ\u000e\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\tJ\u0010\u0010\u0019\u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0018\u001a\u00020\tJ\t\u0010\u001a\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0006HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0006HÆ\u0003J\t\u0010\u001e\u001a\u00020\tHÆ\u0003J\t\u0010\u001f\u001a\u00020\u0006HÆ\u0003JE\u0010 \u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00062\b\b\u0002\u0010\u0007\u001a\u00020\u00062\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u0006HÆ\u0001J\u0013\u0010!\u001a\u00020\"2\b\u0010#\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010$\u001a\u00020\u0006HÖ\u0001J\t\u0010%\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\n\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0011¨\u0006&"}, d2 = {"Lcom/instabridge/ai/context/summarizers/AppUsageEntry;", b.f42142b, "appLabel", b.f42142b, "packageName", "launchesPerWeek", b.f42142b, "foregroundMinutes", "lastUsedMs", b.f42142b, "recentRank", "<init>", "(Ljava/lang/String;Ljava/lang/String;IIJI)V", "getAppLabel", "()Ljava/lang/String;", "getPackageName", "getLaunchesPerWeek", "()I", "getForegroundMinutes", "getLastUsedMs", "()J", "getRecentRank", "combinedScore", b.f42142b, "nowMs", "recencyLabel", "component1", "component2", "component3", "component4", "component5", "component6", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class AppUsageEntry {
    public static final int $stable = 0;

    @NotNull
    private final String appLabel;
    private final int foregroundMinutes;
    private final long lastUsedMs;
    private final int launchesPerWeek;

    @NotNull
    private final String packageName;
    private final int recentRank;

    public AppUsageEntry(@NotNull String appLabel, @NotNull String packageName, int i5, int i11, long j11, int i12) {
        Intrinsics.g(appLabel, "appLabel");
        Intrinsics.g(packageName, "packageName");
        this.appLabel = appLabel;
        this.packageName = packageName;
        this.launchesPerWeek = i5;
        this.foregroundMinutes = i11;
        this.lastUsedMs = j11;
        this.recentRank = i12;
    }

    public static /* synthetic */ AppUsageEntry copy$default(AppUsageEntry appUsageEntry, String str, String str2, int i5, int i11, long j11, int i12, int i13, Object obj) {
        if ((i13 & 1) != 0) {
            str = appUsageEntry.appLabel;
        }
        if ((i13 & 2) != 0) {
            str2 = appUsageEntry.packageName;
        }
        if ((i13 & 4) != 0) {
            i5 = appUsageEntry.launchesPerWeek;
        }
        if ((i13 & 8) != 0) {
            i11 = appUsageEntry.foregroundMinutes;
        }
        if ((i13 & 16) != 0) {
            j11 = appUsageEntry.lastUsedMs;
        }
        if ((i13 & 32) != 0) {
            i12 = appUsageEntry.recentRank;
        }
        int i14 = i12;
        long j12 = j11;
        return appUsageEntry.copy(str, str2, i5, i11, j12, i14);
    }

    public final double combinedScore(long nowMs) {
        return ((1.0d - a.c0((this.lastUsedMs > 0 ? (nowMs - r2) / 3600000 : 168.0d) / 24.0d, 0.0d, 1.0d)) * 20.0d) + this.launchesPerWeek;
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getAppLabel() {
        return this.appLabel;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    /* renamed from: component3, reason: from getter */
    public final int getLaunchesPerWeek() {
        return this.launchesPerWeek;
    }

    /* renamed from: component4, reason: from getter */
    public final int getForegroundMinutes() {
        return this.foregroundMinutes;
    }

    /* renamed from: component5, reason: from getter */
    public final long getLastUsedMs() {
        return this.lastUsedMs;
    }

    /* renamed from: component6, reason: from getter */
    public final int getRecentRank() {
        return this.recentRank;
    }

    @NotNull
    public final AppUsageEntry copy(@NotNull String appLabel, @NotNull String packageName, int launchesPerWeek, int foregroundMinutes, long lastUsedMs, int recentRank) {
        Intrinsics.g(appLabel, "appLabel");
        Intrinsics.g(packageName, "packageName");
        return new AppUsageEntry(appLabel, packageName, launchesPerWeek, foregroundMinutes, lastUsedMs, recentRank);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof AppUsageEntry)) {
            return false;
        }
        AppUsageEntry appUsageEntry = (AppUsageEntry) other;
        return Intrinsics.b(this.appLabel, appUsageEntry.appLabel) && Intrinsics.b(this.packageName, appUsageEntry.packageName) && this.launchesPerWeek == appUsageEntry.launchesPerWeek && this.foregroundMinutes == appUsageEntry.foregroundMinutes && this.lastUsedMs == appUsageEntry.lastUsedMs && this.recentRank == appUsageEntry.recentRank;
    }

    @NotNull
    public final String getAppLabel() {
        return this.appLabel;
    }

    public final int getForegroundMinutes() {
        return this.foregroundMinutes;
    }

    public final long getLastUsedMs() {
        return this.lastUsedMs;
    }

    public final int getLaunchesPerWeek() {
        return this.launchesPerWeek;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    public final int getRecentRank() {
        return this.recentRank;
    }

    public int hashCode() {
        return Integer.hashCode(this.recentRank) + c0.d(u4.a(this.foregroundMinutes, u4.a(this.launchesPerWeek, c0.e(this.appLabel.hashCode() * 31, 31, this.packageName), 31), 31), 31, this.lastUsedMs);
    }

    @Nullable
    public final String recencyLabel(long nowMs) {
        long j11 = this.lastUsedMs;
        if (j11 <= 0) {
            return null;
        }
        long j12 = (nowMs - j11) / 60000;
        if (j12 < 5) {
            return "just now";
        }
        if (j12 < 60) {
            return k2.i(j12, "min ago");
        }
        if (j12 < 1440) {
            return c.i(j12 / 60, "h ago", new StringBuilder());
        }
        return c.i(j12 / 1440, "d ago", new StringBuilder());
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("AppUsageEntry(appLabel=");
        sb2.append(this.appLabel);
        sb2.append(", packageName=");
        sb2.append(this.packageName);
        sb2.append(", launchesPerWeek=");
        sb2.append(this.launchesPerWeek);
        sb2.append(", foregroundMinutes=");
        sb2.append(this.foregroundMinutes);
        sb2.append(", lastUsedMs=");
        sb2.append(this.lastUsedMs);
        sb2.append(", recentRank=");
        return c.m(sb2, this.recentRank, ')');
    }

    public /* synthetic */ AppUsageEntry(String str, String str2, int i5, int i11, long j11, int i12, int i13, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i13 & 2) != 0 ? b.f42142b : str2, (i13 & 4) != 0 ? 0 : i5, (i13 & 8) != 0 ? 0 : i11, (i13 & 16) != 0 ? 0L : j11, (i13 & 32) != 0 ? 0 : i12);
    }
}
