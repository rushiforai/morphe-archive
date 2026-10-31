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

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001:\u0001\bJ\u0018\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006H&J\u0018\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00040\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006H&¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/context/ShortcutUsageProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getRecentShortcuts", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/context/ShortcutUsageProvider$ShortcutUsageEntry;", "limit", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getFrequentShortcuts", "ShortcutUsageEntry", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface ShortcutUsageProvider {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class DefaultImpls {
        public static /* synthetic */ List getFrequentShortcuts$default(ShortcutUsageProvider shortcutUsageProvider, int i5, int i11, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getFrequentShortcuts");
            }
            if ((i11 & 1) != 0) {
                i5 = 10;
            }
            return shortcutUsageProvider.getFrequentShortcuts(i5);
        }

        public static /* synthetic */ List getRecentShortcuts$default(ShortcutUsageProvider shortcutUsageProvider, int i5, int i11, Object obj) {
            if (obj != null) {
                throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getRecentShortcuts");
            }
            if ((i11 & 1) != 0) {
                i5 = 10;
            }
            return shortcutUsageProvider.getRecentShortcuts(i5);
        }
    }

    @NotNull
    List<ShortcutUsageEntry> getFrequentShortcuts(int limit);

    @NotNull
    List<ShortcutUsageEntry> getRecentShortcuts(int limit);

    @Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u0012\b\b\u0002\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0007HÆ\u0003J\t\u0010\u0018\u001a\u00020\tHÆ\u0003J;\u0010\u0019\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\tHÆ\u0001J\u0013\u0010\u001a\u001a\u00020\u001b2\b\u0010\u001c\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001d\u001a\u00020\u0007HÖ\u0001J\t\u0010\u001e\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\rR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\rR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u001f"}, d2 = {"Lcom/instabridge/ai/context/ShortcutUsageProvider$ShortcutUsageEntry;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "appLabel", "shortcutLabel", "launchCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "lastUsedMs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IJ)V", "getPackageName", "()Ljava/lang/String;", "getAppLabel", "getShortcutLabel", "getLaunchCount", "()I", "getLastUsedMs", "()J", "component1", "component2", "component3", "component4", "component5", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ShortcutUsageEntry {
        public static final int $stable = 0;

        @NotNull
        private final String appLabel;
        private final long lastUsedMs;
        private final int launchCount;

        @NotNull
        private final String packageName;

        @NotNull
        private final String shortcutLabel;

        public ShortcutUsageEntry(@NotNull String packageName, @NotNull String appLabel, @NotNull String shortcutLabel, int i5, long j11) {
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(appLabel, "appLabel");
            Intrinsics.g(shortcutLabel, "shortcutLabel");
            this.packageName = packageName;
            this.appLabel = appLabel;
            this.shortcutLabel = shortcutLabel;
            this.launchCount = i5;
            this.lastUsedMs = j11;
        }

        public static /* synthetic */ ShortcutUsageEntry copy$default(ShortcutUsageEntry shortcutUsageEntry, String str, String str2, String str3, int i5, long j11, int i11, Object obj) {
            if ((i11 & 1) != 0) {
                str = shortcutUsageEntry.packageName;
            }
            if ((i11 & 2) != 0) {
                str2 = shortcutUsageEntry.appLabel;
            }
            if ((i11 & 4) != 0) {
                str3 = shortcutUsageEntry.shortcutLabel;
            }
            if ((i11 & 8) != 0) {
                i5 = shortcutUsageEntry.launchCount;
            }
            if ((i11 & 16) != 0) {
                j11 = shortcutUsageEntry.lastUsedMs;
            }
            long j12 = j11;
            return shortcutUsageEntry.copy(str, str2, str3, i5, j12);
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

        @NotNull
        /* renamed from: component3, reason: from getter */
        public final String getShortcutLabel() {
            return this.shortcutLabel;
        }

        /* renamed from: component4, reason: from getter */
        public final int getLaunchCount() {
            return this.launchCount;
        }

        /* renamed from: component5, reason: from getter */
        public final long getLastUsedMs() {
            return this.lastUsedMs;
        }

        @NotNull
        public final ShortcutUsageEntry copy(@NotNull String packageName, @NotNull String appLabel, @NotNull String shortcutLabel, int launchCount, long lastUsedMs) {
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(appLabel, "appLabel");
            Intrinsics.g(shortcutLabel, "shortcutLabel");
            return new ShortcutUsageEntry(packageName, appLabel, shortcutLabel, launchCount, lastUsedMs);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof ShortcutUsageEntry)) {
                return false;
            }
            ShortcutUsageEntry shortcutUsageEntry = (ShortcutUsageEntry) other;
            return Intrinsics.b(this.packageName, shortcutUsageEntry.packageName) && Intrinsics.b(this.appLabel, shortcutUsageEntry.appLabel) && Intrinsics.b(this.shortcutLabel, shortcutUsageEntry.shortcutLabel) && this.launchCount == shortcutUsageEntry.launchCount && this.lastUsedMs == shortcutUsageEntry.lastUsedMs;
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

        @NotNull
        public final String getShortcutLabel() {
            return this.shortcutLabel;
        }

        public int hashCode() {
            return Long.hashCode(this.lastUsedMs) + u4.a(this.launchCount, c0.e(c0.e(this.packageName.hashCode() * 31, 31, this.appLabel), 31, this.shortcutLabel), 31);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("ShortcutUsageEntry(packageName=");
            sb2.append(this.packageName);
            sb2.append(", appLabel=");
            sb2.append(this.appLabel);
            sb2.append(", shortcutLabel=");
            sb2.append(this.shortcutLabel);
            sb2.append(", launchCount=");
            sb2.append(this.launchCount);
            sb2.append(", lastUsedMs=");
            return c.n(sb2, this.lastUsedMs, ')');
        }

        public /* synthetic */ ShortcutUsageEntry(String str, String str2, String str3, int i5, long j11, int i11, DefaultConstructorMarker defaultConstructorMarker) {
            this(str, str2, str3, (i11 & 8) != 0 ? 0 : i5, (i11 & 16) != 0 ? 0L : j11);
        }
    }
}
