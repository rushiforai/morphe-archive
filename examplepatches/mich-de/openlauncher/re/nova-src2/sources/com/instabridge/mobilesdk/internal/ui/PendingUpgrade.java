package com.instabridge.mobilesdk.internal.ui;

import a80.m;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0081\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\t\u0010\r\u001a\u00020\u0005HÆ\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0012\u001a\u00020\u0013HÖ\u0001J\t\u0010\u0014\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0015"}, d2 = {"Lcom/instabridge/mobilesdk/internal/ui/PendingUpgrade;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "packageId", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "(JLjava/lang/String;)V", "getPackageId", "()J", "getName", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class PendingUpgrade {
    public static final int $stable = 0;

    @NotNull
    private final String name;
    private final long packageId;

    public PendingUpgrade(long j11, @NotNull String name) {
        Intrinsics.g(name, "name");
        this.packageId = j11;
        this.name = name;
    }

    public static /* synthetic */ PendingUpgrade copy$default(PendingUpgrade pendingUpgrade, long j11, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = pendingUpgrade.packageId;
        }
        if ((i5 & 2) != 0) {
            str = pendingUpgrade.name;
        }
        return pendingUpgrade.copy(j11, str);
    }

    /* renamed from: component1, reason: from getter */
    public final long getPackageId() {
        return this.packageId;
    }

    @NotNull
    /* renamed from: component2, reason: from getter */
    public final String getName() {
        return this.name;
    }

    @NotNull
    public final PendingUpgrade copy(long packageId, @NotNull String name) {
        Intrinsics.g(name, "name");
        return new PendingUpgrade(packageId, name);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof PendingUpgrade)) {
            return false;
        }
        PendingUpgrade pendingUpgrade = (PendingUpgrade) other;
        return this.packageId == pendingUpgrade.packageId && Intrinsics.b(this.name, pendingUpgrade.name);
    }

    @NotNull
    public final String getName() {
        return this.name;
    }

    public final long getPackageId() {
        return this.packageId;
    }

    public int hashCode() {
        return this.name.hashCode() + (Long.hashCode(this.packageId) * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sbL = m.l(this.packageId, "PendingUpgrade(packageId=", ", name=", this.name);
        sbL.append(")");
        return sbL.toString();
    }
}
