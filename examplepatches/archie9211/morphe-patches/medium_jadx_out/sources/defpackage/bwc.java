package defpackage;

import com.medium.android.graphql.type.PublicationSubmissionErrorReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract /* synthetic */ class bwc {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[PublicationSubmissionErrorReason.values().length];
        try {
            iArr[PublicationSubmissionErrorReason.NOT_ACCEPTING_SUBMISSIONS.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[PublicationSubmissionErrorReason.ONLY_ACCEPTS_DRAFTS.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[PublicationSubmissionErrorReason.ONLY_ACCEPTS_PUBLISHED_POSTS.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[PublicationSubmissionErrorReason.SUBMISSION_ALREADY_EXISTS.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[PublicationSubmissionErrorReason.SUBMISSION_CAP_REACHED.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[PublicationSubmissionErrorReason.SUBMISSION_REQUIREMENTS_NOT_MET.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[PublicationSubmissionErrorReason.UNKNOWN__.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        a = iArr;
    }
}
