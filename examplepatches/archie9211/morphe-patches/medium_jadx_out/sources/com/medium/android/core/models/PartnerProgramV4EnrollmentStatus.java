package com.medium.android.core.models;

import defpackage.g04;
import defpackage.rv8;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\b\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006j\u0002\b\u0007j\u0002\b\b¨\u0006\t"}, d2 = {"Lcom/medium/android/core/models/PartnerProgramV4EnrollmentStatus;", "", "<init>", "(Ljava/lang/String;I)V", "ACTIVE", "INACTIVE", "PENDING_ACTION", "SUSPENDED", "UNKNOWN", "core_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PartnerProgramV4EnrollmentStatus {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PartnerProgramV4EnrollmentStatus[] $VALUES;
    public static final PartnerProgramV4EnrollmentStatus ACTIVE = new PartnerProgramV4EnrollmentStatus("ACTIVE", 0);
    public static final PartnerProgramV4EnrollmentStatus INACTIVE = new PartnerProgramV4EnrollmentStatus("INACTIVE", 1);
    public static final PartnerProgramV4EnrollmentStatus PENDING_ACTION = new PartnerProgramV4EnrollmentStatus("PENDING_ACTION", 2);
    public static final PartnerProgramV4EnrollmentStatus SUSPENDED = new PartnerProgramV4EnrollmentStatus("SUSPENDED", 3);
    public static final PartnerProgramV4EnrollmentStatus UNKNOWN = new PartnerProgramV4EnrollmentStatus("UNKNOWN", 4);

    private static final /* synthetic */ PartnerProgramV4EnrollmentStatus[] $values() {
        return new PartnerProgramV4EnrollmentStatus[]{ACTIVE, INACTIVE, PENDING_ACTION, SUSPENDED, UNKNOWN};
    }

    static {
        PartnerProgramV4EnrollmentStatus[] partnerProgramV4EnrollmentStatusArr$values = $values();
        $VALUES = partnerProgramV4EnrollmentStatusArr$values;
        $ENTRIES = rv8.x(partnerProgramV4EnrollmentStatusArr$values);
    }

    private PartnerProgramV4EnrollmentStatus(String str, int i) {
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PartnerProgramV4EnrollmentStatus valueOf(String str) {
        return (PartnerProgramV4EnrollmentStatus) Enum.valueOf(PartnerProgramV4EnrollmentStatus.class, str);
    }

    public static PartnerProgramV4EnrollmentStatus[] values() {
        return (PartnerProgramV4EnrollmentStatus[]) $VALUES.clone();
    }
}
