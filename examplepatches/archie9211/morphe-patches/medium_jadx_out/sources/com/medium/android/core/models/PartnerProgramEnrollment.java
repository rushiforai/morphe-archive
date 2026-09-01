package com.medium.android.core.models;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001B\u0011\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u000b\u0010\b\u001a\u0004\u0018\u00010\u0003HÆ\u0003J\u0015\u0010\t\u001a\u00020\u00002\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003HÆ\u0001J\u0013\u0010\n\u001a\u00020\u000b2\b\u0010\f\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\r\u001a\u00020\u000eHÖ\u0001J\t\u0010\u000f\u001a\u00020\u0010HÖ\u0001R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\u0011"}, d2 = {"Lcom/medium/android/core/models/PartnerProgramEnrollment;", "", "status", "Lcom/medium/android/core/models/PartnerProgramV4EnrollmentStatus;", "<init>", "(Lcom/medium/android/core/models/PartnerProgramV4EnrollmentStatus;)V", "getStatus", "()Lcom/medium/android/core/models/PartnerProgramV4EnrollmentStatus;", "component1", "copy", "equals", "", "other", "hashCode", "", "toString", "", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class PartnerProgramEnrollment {
    public static final int $stable = 0;
    private final PartnerProgramV4EnrollmentStatus status;

    public PartnerProgramEnrollment(PartnerProgramV4EnrollmentStatus partnerProgramV4EnrollmentStatus) {
        this.status = partnerProgramV4EnrollmentStatus;
    }

    public static /* synthetic */ PartnerProgramEnrollment copy$default(PartnerProgramEnrollment partnerProgramEnrollment, PartnerProgramV4EnrollmentStatus partnerProgramV4EnrollmentStatus, int i, Object obj) {
        if ((i & 1) != 0) {
            partnerProgramV4EnrollmentStatus = partnerProgramEnrollment.status;
        }
        return partnerProgramEnrollment.copy(partnerProgramV4EnrollmentStatus);
    }

    /* JADX INFO: renamed from: component1, reason: from getter */
    public final PartnerProgramV4EnrollmentStatus getStatus() {
        return this.status;
    }

    public final PartnerProgramEnrollment copy(PartnerProgramV4EnrollmentStatus status) {
        return new PartnerProgramEnrollment(status);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        return (other instanceof PartnerProgramEnrollment) && this.status == ((PartnerProgramEnrollment) other).status;
    }

    public final PartnerProgramV4EnrollmentStatus getStatus() {
        return this.status;
    }

    public int hashCode() {
        PartnerProgramV4EnrollmentStatus partnerProgramV4EnrollmentStatus = this.status;
        if (partnerProgramV4EnrollmentStatus == null) {
            return 0;
        }
        return partnerProgramV4EnrollmentStatus.hashCode();
    }

    public String toString() {
        return "PartnerProgramEnrollment(status=" + this.status + ")";
    }
}
