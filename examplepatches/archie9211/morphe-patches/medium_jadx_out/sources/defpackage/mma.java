package defpackage;

import com.medium.android.graphql.type.PublicationSubmissionStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class mma {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[PublicationSubmissionStatus.values().length];
        try {
            iArr[PublicationSubmissionStatus.ACCEPTED.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[PublicationSubmissionStatus.CANCELLED.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[PublicationSubmissionStatus.CHANGES_MADE.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[PublicationSubmissionStatus.CHANGES_REQUESTED.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[PublicationSubmissionStatus.IN_REVIEW.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[PublicationSubmissionStatus.OPEN.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[PublicationSubmissionStatus.REJECTED.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        a = iArr;
    }
}
