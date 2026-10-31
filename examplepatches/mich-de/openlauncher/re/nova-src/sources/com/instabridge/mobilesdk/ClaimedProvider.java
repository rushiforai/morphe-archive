package com.instabridge.mobilesdk;

import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0010\u001a\u00020\u0011HÖ\u0001J\t\u0010\u0012\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0013"}, d2 = {"Lcom/instabridge/mobilesdk/ClaimedProvider;", b.f42142b, "packageName", b.f42142b, "displayName", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getPackageName", "()Ljava/lang/String;", "getDisplayName", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class ClaimedProvider {
    public static final int $stable = 0;

    @NotNull
    private final String displayName;

    @NotNull
    private final String packageName;

    public ClaimedProvider(@NotNull String packageName, @NotNull String displayName) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(displayName, "displayName");
        this.packageName = packageName;
        this.displayName = displayName;
    }

    public static /* synthetic */ ClaimedProvider copy$default(ClaimedProvider claimedProvider, String str, String str2, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = claimedProvider.packageName;
        }
        if ((i5 & 2) != 0) {
            str2 = claimedProvider.displayName;
        }
        return claimedProvider.copy(str, str2);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getPackageName() {
        return this.packageName;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getDisplayName() {
        return this.displayName;
    }

    @NotNull
    public final ClaimedProvider copy(@NotNull String packageName, @NotNull String displayName) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(displayName, "displayName");
        return new ClaimedProvider(packageName, displayName);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof ClaimedProvider)) {
            return false;
        }
        ClaimedProvider claimedProvider = (ClaimedProvider) other;
        return Intrinsics.b(this.packageName, claimedProvider.packageName) && Intrinsics.b(this.displayName, claimedProvider.displayName);
    }

    @NotNull
    public final String getDisplayName() {
        return this.displayName;
    }

    @NotNull
    public final String getPackageName() {
        return this.packageName;
    }

    public int hashCode() {
        return this.displayName.hashCode() + (this.packageName.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        return c0.n("ClaimedProvider(packageName=", this.packageName, ", displayName=", this.displayName, ")");
    }
}
