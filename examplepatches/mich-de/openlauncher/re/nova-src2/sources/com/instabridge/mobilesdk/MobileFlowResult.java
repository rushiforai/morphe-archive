package com.instabridge.mobilesdk;

import a80.m;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.EsimInstallStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bv\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/instabridge/mobilesdk/MobileFlowResult;", b.f42142b, "Completed", "Cancelled", "Failed", "Lcom/instabridge/mobilesdk/MobileFlowResult$Cancelled;", "Lcom/instabridge/mobilesdk/MobileFlowResult$Completed;", "Lcom/instabridge/mobilesdk/MobileFlowResult$Failed;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface MobileFlowResult {

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\t\u0010\b\u001a\u00020\u0003HÆ\u0003J\u0013\u0010\t\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\rHÖ\u0003J\t\u0010\u000e\u001a\u00020\u000fHÖ\u0001J\t\u0010\u0010\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/instabridge/mobilesdk/MobileFlowResult$Cancelled;", "Lcom/instabridge/mobilesdk/MobileFlowResult;", "lastStep", b.f42142b, "<init>", "(Ljava/lang/String;)V", "getLastStep", "()Ljava/lang/String;", "component1", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Cancelled implements MobileFlowResult {
        public static final int $stable = 0;

        @NotNull
        private final String lastStep;

        public Cancelled(@NotNull String lastStep) {
            Intrinsics.g(lastStep, "lastStep");
            this.lastStep = lastStep;
        }

        public static /* synthetic */ Cancelled copy$default(Cancelled cancelled, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = cancelled.lastStep;
            }
            return cancelled.copy(str);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getLastStep() {
            return this.lastStep;
        }

        @NotNull
        public final Cancelled copy(@NotNull String lastStep) {
            Intrinsics.g(lastStep, "lastStep");
            return new Cancelled(lastStep);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof Cancelled) && Intrinsics.b(this.lastStep, ((Cancelled) other).lastStep);
        }

        @NotNull
        public final String getLastStep() {
            return this.lastStep;
        }

        public int hashCode() {
            return this.lastStep.hashCode();
        }

        @NotNull
        public String toString() {
            return c0.l("Cancelled(lastStep=", this.lastStep, ")");
        }
    }

    @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J\t\u0010\f\u001a\u00020\u0003HÆ\u0003J\u000b\u0010\r\u001a\u0004\u0018\u00010\u0005HÆ\u0003J\u001f\u0010\u000e\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005HÆ\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\b\u0010\u0011\u001a\u0004\u0018\u00010\u0012HÖ\u0003J\t\u0010\u0013\u001a\u00020\u0014HÖ\u0001J\t\u0010\u0015\u001a\u00020\u0005HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\u0016"}, d2 = {"Lcom/instabridge/mobilesdk/MobileFlowResult$Completed;", "Lcom/instabridge/mobilesdk/MobileFlowResult;", "packageId", b.f42142b, EsimInstallStore.KEY_ICCID, b.f42142b, "<init>", "(JLjava/lang/String;)V", "getPackageId", "()J", "getIccid", "()Ljava/lang/String;", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Completed implements MobileFlowResult {
        public static final int $stable = 0;

        @Nullable
        private final String iccid;
        private final long packageId;

        public Completed(long j11, @Nullable String str) {
            this.packageId = j11;
            this.iccid = str;
        }

        public static /* synthetic */ Completed copy$default(Completed completed, long j11, String str, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                j11 = completed.packageId;
            }
            if ((i5 & 2) != 0) {
                str = completed.iccid;
            }
            return completed.copy(j11, str);
        }

        /* renamed from: component1, reason: from getter */
        public final long getPackageId() {
            return this.packageId;
        }

        @Nullable
        /* renamed from: component2, reason: from getter */
        public final String getIccid() {
            return this.iccid;
        }

        @NotNull
        public final Completed copy(long packageId, @Nullable String iccid) {
            return new Completed(packageId, iccid);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Completed)) {
                return false;
            }
            Completed completed = (Completed) other;
            return this.packageId == completed.packageId && Intrinsics.b(this.iccid, completed.iccid);
        }

        @Nullable
        public final String getIccid() {
            return this.iccid;
        }

        public final long getPackageId() {
            return this.packageId;
        }

        public int hashCode() {
            int iHashCode = Long.hashCode(this.packageId) * 31;
            String str = this.iccid;
            return iHashCode + (str == null ? 0 : str.hashCode());
        }

        @NotNull
        public String toString() {
            StringBuilder sbL = m.l(this.packageId, "Completed(packageId=", ", iccid=", this.iccid);
            sbL.append(")");
            return sbL.toString();
        }
    }

    @Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006J\t\u0010\n\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000b\u001a\u00020\u0003HÆ\u0003J\u001d\u0010\f\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0003HÆ\u0001J\u0013\u0010\r\u001a\u00020\u000e2\b\u0010\u000f\u001a\u0004\u0018\u00010\u0010HÖ\u0003J\t\u0010\u0011\u001a\u00020\u0012HÖ\u0001J\t\u0010\u0013\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\b¨\u0006\u0014"}, d2 = {"Lcom/instabridge/mobilesdk/MobileFlowResult$Failed;", "Lcom/instabridge/mobilesdk/MobileFlowResult;", "lastStep", b.f42142b, "reason", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "getLastStep", "()Ljava/lang/String;", "getReason", "component1", "component2", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, b.f42142b, "hashCode", b.f42142b, "toString", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Failed implements MobileFlowResult {
        public static final int $stable = 0;

        @NotNull
        private final String lastStep;

        @NotNull
        private final String reason;

        public Failed(@NotNull String lastStep, @NotNull String reason) {
            Intrinsics.g(lastStep, "lastStep");
            Intrinsics.g(reason, "reason");
            this.lastStep = lastStep;
            this.reason = reason;
        }

        public static /* synthetic */ Failed copy$default(Failed failed, String str, String str2, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = failed.lastStep;
            }
            if ((i5 & 2) != 0) {
                str2 = failed.reason;
            }
            return failed.copy(str, str2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getLastStep() {
            return this.lastStep;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getReason() {
            return this.reason;
        }

        @NotNull
        public final Failed copy(@NotNull String lastStep, @NotNull String reason) {
            Intrinsics.g(lastStep, "lastStep");
            Intrinsics.g(reason, "reason");
            return new Failed(lastStep, reason);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Failed)) {
                return false;
            }
            Failed failed = (Failed) other;
            return Intrinsics.b(this.lastStep, failed.lastStep) && Intrinsics.b(this.reason, failed.reason);
        }

        @NotNull
        public final String getLastStep() {
            return this.lastStep;
        }

        @NotNull
        public final String getReason() {
            return this.reason;
        }

        public int hashCode() {
            return this.reason.hashCode() + (this.lastStep.hashCode() * 31);
        }

        @NotNull
        public String toString() {
            return c0.n("Failed(lastStep=", this.lastStep, ", reason=", this.reason, ")");
        }
    }
}
