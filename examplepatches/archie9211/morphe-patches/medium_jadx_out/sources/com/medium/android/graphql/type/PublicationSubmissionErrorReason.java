package com.medium.android.graphql.type;

import com.medium.android.donkey.main.Wv.MaAxRJinch;
import defpackage.d46;
import defpackage.g04;
import defpackage.g76;
import defpackage.gy2;
import defpackage.i04;
import defpackage.n04;
import defpackage.z73;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \u000f2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000fB\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/type/PublicationSubmissionErrorReason;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "NOT_ACCEPTING_SUBMISSIONS", "ONLY_ACCEPTS_DRAFTS", "ONLY_ACCEPTS_PUBLISHED_POSTS", "SUBMISSION_ALREADY_EXISTS", "SUBMISSION_CAP_REACHED", "SUBMISSION_REQUIREMENTS_NOT_MET", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublicationSubmissionErrorReason {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PublicationSubmissionErrorReason[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    public static final PublicationSubmissionErrorReason NOT_ACCEPTING_SUBMISSIONS = new PublicationSubmissionErrorReason("NOT_ACCEPTING_SUBMISSIONS", 0, "NOT_ACCEPTING_SUBMISSIONS");
    public static final PublicationSubmissionErrorReason ONLY_ACCEPTS_DRAFTS = new PublicationSubmissionErrorReason("ONLY_ACCEPTS_DRAFTS", 1, "ONLY_ACCEPTS_DRAFTS");
    public static final PublicationSubmissionErrorReason ONLY_ACCEPTS_PUBLISHED_POSTS = new PublicationSubmissionErrorReason("ONLY_ACCEPTS_PUBLISHED_POSTS", 2, "ONLY_ACCEPTS_PUBLISHED_POSTS");
    public static final PublicationSubmissionErrorReason SUBMISSION_ALREADY_EXISTS = new PublicationSubmissionErrorReason("SUBMISSION_ALREADY_EXISTS", 3, "SUBMISSION_ALREADY_EXISTS");
    public static final PublicationSubmissionErrorReason SUBMISSION_CAP_REACHED = new PublicationSubmissionErrorReason("SUBMISSION_CAP_REACHED", 4, "SUBMISSION_CAP_REACHED");
    public static final PublicationSubmissionErrorReason SUBMISSION_REQUIREMENTS_NOT_MET = new PublicationSubmissionErrorReason("SUBMISSION_REQUIREMENTS_NOT_MET", 5, "SUBMISSION_REQUIREMENTS_NOT_MET");
    public static final PublicationSubmissionErrorReason UNKNOWN__ = new PublicationSubmissionErrorReason("UNKNOWN__", 6, "UNKNOWN__");
    private static final n04 type;
    private final String rawValue;

    private static final /* synthetic */ PublicationSubmissionErrorReason[] $values() {
        return new PublicationSubmissionErrorReason[]{NOT_ACCEPTING_SUBMISSIONS, ONLY_ACCEPTS_DRAFTS, ONLY_ACCEPTS_PUBLISHED_POSTS, SUBMISSION_ALREADY_EXISTS, SUBMISSION_CAP_REACHED, SUBMISSION_REQUIREMENTS_NOT_MET, UNKNOWN__};
    }

    private PublicationSubmissionErrorReason(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PublicationSubmissionErrorReason valueOf(String str) {
        return (PublicationSubmissionErrorReason) Enum.valueOf(PublicationSubmissionErrorReason.class, str);
    }

    public static PublicationSubmissionErrorReason[] values() {
        return (PublicationSubmissionErrorReason[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    static {
        PublicationSubmissionErrorReason[] publicationSubmissionErrorReasonArr$values = $values();
        $VALUES = publicationSubmissionErrorReasonArr$values;
        $ENTRIES = new i04(publicationSubmissionErrorReasonArr$values);
        INSTANCE = new Companion();
        d46.R("NOT_ACCEPTING_SUBMISSIONS", "ONLY_ACCEPTS_DRAFTS", "ONLY_ACCEPTS_PUBLISHED_POSTS", MaAxRJinch.WzMsLuTaMyB, "SUBMISSION_CAP_REACHED", "SUBMISSION_REQUIREMENTS_NOT_MET");
        type = new n04("PublicationSubmissionErrorReason");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/PublicationSubmissionErrorReason$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/PublicationSubmissionErrorReason;", "knownValues", "()[Lcom/medium/android/graphql/type/PublicationSubmissionErrorReason;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/PublicationSubmissionErrorReason;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<PublicationSubmissionErrorReason> getKnownEntries() {
            return d46.R(PublicationSubmissionErrorReason.NOT_ACCEPTING_SUBMISSIONS, PublicationSubmissionErrorReason.ONLY_ACCEPTS_DRAFTS, PublicationSubmissionErrorReason.ONLY_ACCEPTS_PUBLISHED_POSTS, PublicationSubmissionErrorReason.SUBMISSION_ALREADY_EXISTS, PublicationSubmissionErrorReason.SUBMISSION_CAP_REACHED, PublicationSubmissionErrorReason.SUBMISSION_REQUIREMENTS_NOT_MET);
        }

        public final n04 getType() {
            return PublicationSubmissionErrorReason.type;
        }

        @z73
        public final PublicationSubmissionErrorReason[] knownValues() {
            return (PublicationSubmissionErrorReason[]) getKnownEntries().toArray(new PublicationSubmissionErrorReason[0]);
        }

        public final PublicationSubmissionErrorReason safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = PublicationSubmissionErrorReason.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((PublicationSubmissionErrorReason) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            PublicationSubmissionErrorReason publicationSubmissionErrorReason = (PublicationSubmissionErrorReason) next;
            return publicationSubmissionErrorReason == null ? PublicationSubmissionErrorReason.UNKNOWN__ : publicationSubmissionErrorReason;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
