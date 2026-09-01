package defpackage;

import com.medium.android.graphql.type.PartnerProgramV4EnrollmentStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class al2 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[PartnerProgramV4EnrollmentStatus.values().length];
        try {
            iArr[PartnerProgramV4EnrollmentStatus.ACTIVE.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[PartnerProgramV4EnrollmentStatus.INACTIVE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[PartnerProgramV4EnrollmentStatus.PENDING_ACTION.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[PartnerProgramV4EnrollmentStatus.SUSPENDED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[PartnerProgramV4EnrollmentStatus.UNKNOWN.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[PartnerProgramV4EnrollmentStatus.UNKNOWN__.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        a = iArr;
    }
}
