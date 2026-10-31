package io.branch.search.internal.shared;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.search.internal.C3380t5;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000e\b\u0086\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\b\u001a\u00020\u0002\u0012\u0006\u0010\t\u001a\u00020\u0005¢\u0006\u0004\b\u001b\u0010\u001cJ\u0010\u0010\u0003\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\u0006\u001a\u00020\u0005HÆ\u0003¢\u0006\u0004\b\u0006\u0010\u0007J$\u0010\n\u001a\u00020\u00002\b\b\u0002\u0010\b\u001a\u00020\u00022\b\b\u0002\u0010\t\u001a\u00020\u0005HÆ\u0001¢\u0006\u0004\b\n\u0010\u000bJ\u0010\u0010\r\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u0010\u001a\u00020\u000fHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0013\u001a\u00020\u00022\b\u0010\u0012\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\u0013\u0010\u0014R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0017\u0010\u0004R\u0017\u0010\t\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0018\u0010\u0019\u001a\u0004\b\u001a\u0010\u0007¨\u0006\u001d"}, d2 = {"Lio/branch/search/internal/shared/BundleUpdateCompleteStatus;", b.f42142b, b.f42142b, "component1", "()Z", b.f42142b, "component2", "()J", "success", "bundleUpdateInterval", "copy", "(ZJ)Lio/branch/search/internal/shared/BundleUpdateCompleteStatus;", b.f42142b, "toString", "()Ljava/lang/String;", b.f42142b, "hashCode", "()I", InneractiveMediationNameConsts.OTHER, "equals", "(Ljava/lang/Object;)Z", "a", "Z", "getSuccess", "b", "J", "getBundleUpdateInterval", "<init>", "(ZJ)V", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final /* data */ class BundleUpdateCompleteStatus {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    public final boolean success;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    public final long bundleUpdateInterval;

    public BundleUpdateCompleteStatus(boolean z11, long j11) {
        this.success = z11;
        this.bundleUpdateInterval = j11;
    }

    public static /* synthetic */ BundleUpdateCompleteStatus copy$default(BundleUpdateCompleteStatus bundleUpdateCompleteStatus, boolean z11, long j11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            z11 = bundleUpdateCompleteStatus.success;
        }
        if ((i5 & 2) != 0) {
            j11 = bundleUpdateCompleteStatus.bundleUpdateInterval;
        }
        return bundleUpdateCompleteStatus.copy(z11, j11);
    }

    /* renamed from: component1, reason: from getter */
    public final boolean getSuccess() {
        return this.success;
    }

    /* renamed from: component2, reason: from getter */
    public final long getBundleUpdateInterval() {
        return this.bundleUpdateInterval;
    }

    @NotNull
    public final BundleUpdateCompleteStatus copy(boolean success, long bundleUpdateInterval) {
        return new BundleUpdateCompleteStatus(success, bundleUpdateInterval);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BundleUpdateCompleteStatus)) {
            return false;
        }
        BundleUpdateCompleteStatus bundleUpdateCompleteStatus = (BundleUpdateCompleteStatus) other;
        return this.success == bundleUpdateCompleteStatus.success && this.bundleUpdateInterval == bundleUpdateCompleteStatus.bundleUpdateInterval;
    }

    public final long getBundleUpdateInterval() {
        return this.bundleUpdateInterval;
    }

    public final boolean getSuccess() {
        return this.success;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    public int hashCode() {
        boolean z11 = this.success;
        ?? r02 = z11;
        if (z11) {
            r02 = 1;
        }
        return Long.hashCode(this.bundleUpdateInterval) + (r02 * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BundleUpdateCompleteStatus(success=");
        sb2.append(this.success);
        sb2.append(", bundleUpdateInterval=");
        return C3380t5.a(sb2, this.bundleUpdateInterval, ')');
    }
}
