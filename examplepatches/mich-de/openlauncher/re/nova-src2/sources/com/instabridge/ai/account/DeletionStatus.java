package com.instabridge.ai.account;

import a2.c;
import aq.o;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0010\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\b\u0010\tJ\t\u0010\u0011\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u000b\u0010\u0013\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0007HÆ\u0003¢\u0006\u0002\u0010\u000fJ<\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0003\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\b\u0003\u0010\u0006\u001a\u0004\u0018\u00010\u0007HÆ\u0001¢\u0006\u0002\u0010\u0016J\u0013\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001a\u001a\u00020\u0007HÖ\u0001J\t\u0010\u001b\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\u000bR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000bR\u0015\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\n\n\u0002\u0010\u0010\u001a\u0004\b\u000e\u0010\u000f¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/account/DeletionStatus;", b.f42142b, "status", b.f42142b, "scheduledAt", "deletesAt", "gracePeriodDays", b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V", "getStatus", "()Ljava/lang/String;", "getScheduledAt", "getDeletesAt", "getGracePeriodDays", "()Ljava/lang/Integer;", "Ljava/lang/Integer;", "component1", "component2", "component3", "component4", "copy", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)Lcom/instabridge/ai/account/DeletionStatus;", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final /* data */ class DeletionStatus {
    public static final int $stable = 0;

    @Nullable
    private final String deletesAt;

    @Nullable
    private final Integer gracePeriodDays;

    @Nullable
    private final String scheduledAt;

    @NotNull
    private final String status;

    public DeletionStatus(@NotNull String status, @o(name = "deletion_requested_at") @Nullable String str, @o(name = "permanent_deletion_at") @Nullable String str2, @o(name = "grace_period_days") @Nullable Integer num) {
        Intrinsics.g(status, "status");
        this.status = status;
        this.scheduledAt = str;
        this.deletesAt = str2;
        this.gracePeriodDays = num;
    }

    public static /* synthetic */ DeletionStatus copy$default(DeletionStatus deletionStatus, String str, String str2, String str3, Integer num, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = deletionStatus.status;
        }
        if ((i5 & 2) != 0) {
            str2 = deletionStatus.scheduledAt;
        }
        if ((i5 & 4) != 0) {
            str3 = deletionStatus.deletesAt;
        }
        if ((i5 & 8) != 0) {
            num = deletionStatus.gracePeriodDays;
        }
        return deletionStatus.copy(str, str2, str3, num);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final String getStatus() {
        return this.status;
    }

    @Nullable
    /* renamed from: component2, reason: from getter */
    public final String getScheduledAt() {
        return this.scheduledAt;
    }

    @Nullable
    /* renamed from: component3, reason: from getter */
    public final String getDeletesAt() {
        return this.deletesAt;
    }

    @Nullable
    /* renamed from: component4, reason: from getter */
    public final Integer getGracePeriodDays() {
        return this.gracePeriodDays;
    }

    @NotNull
    public final DeletionStatus copy(@NotNull String status, @o(name = "deletion_requested_at") @Nullable String scheduledAt, @o(name = "permanent_deletion_at") @Nullable String deletesAt, @o(name = "grace_period_days") @Nullable Integer gracePeriodDays) {
        Intrinsics.g(status, "status");
        return new DeletionStatus(status, scheduledAt, deletesAt, gracePeriodDays);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof DeletionStatus)) {
            return false;
        }
        DeletionStatus deletionStatus = (DeletionStatus) other;
        return Intrinsics.b(this.status, deletionStatus.status) && Intrinsics.b(this.scheduledAt, deletionStatus.scheduledAt) && Intrinsics.b(this.deletesAt, deletionStatus.deletesAt) && Intrinsics.b(this.gracePeriodDays, deletionStatus.gracePeriodDays);
    }

    @Nullable
    public final String getDeletesAt() {
        return this.deletesAt;
    }

    @Nullable
    public final Integer getGracePeriodDays() {
        return this.gracePeriodDays;
    }

    @Nullable
    public final String getScheduledAt() {
        return this.scheduledAt;
    }

    @NotNull
    public final String getStatus() {
        return this.status;
    }

    public int hashCode() {
        int iHashCode = this.status.hashCode() * 31;
        String str = this.scheduledAt;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.deletesAt;
        int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
        Integer num = this.gracePeriodDays;
        return iHashCode3 + (num != null ? num.hashCode() : 0);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DeletionStatus(status=");
        sb2.append(this.status);
        sb2.append(", scheduledAt=");
        sb2.append(this.scheduledAt);
        sb2.append(", deletesAt=");
        sb2.append(this.deletesAt);
        sb2.append(", gracePeriodDays=");
        return c.o(sb2, this.gracePeriodDays, ')');
    }

    public /* synthetic */ DeletionStatus(String str, String str2, String str3, Integer num, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, (i5 & 2) != 0 ? null : str2, (i5 & 4) != 0 ? null : str3, (i5 & 8) != 0 ? null : num);
    }
}
