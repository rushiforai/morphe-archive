package com.medium.android.graphql.type;

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
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0011\b\u0086\u0081\u0002\u0018\u0000 \u00132\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0013B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012¨\u0006\u0014"}, d2 = {"Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "ACCEPTED", "CANCELLED", "CHANGES_MADE", "CHANGES_REQUESTED", "IN_REVIEW", "OPEN", "REJECTED", "TRIAGE", "UNKNOWN", "WIP", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublicationSubmissionStatus {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PublicationSubmissionStatus[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    private static final n04 type;
    private final String rawValue;
    public static final PublicationSubmissionStatus ACCEPTED = new PublicationSubmissionStatus("ACCEPTED", 0, "ACCEPTED");
    public static final PublicationSubmissionStatus CANCELLED = new PublicationSubmissionStatus("CANCELLED", 1, "CANCELLED");
    public static final PublicationSubmissionStatus CHANGES_MADE = new PublicationSubmissionStatus("CHANGES_MADE", 2, "CHANGES_MADE");
    public static final PublicationSubmissionStatus CHANGES_REQUESTED = new PublicationSubmissionStatus("CHANGES_REQUESTED", 3, "CHANGES_REQUESTED");
    public static final PublicationSubmissionStatus IN_REVIEW = new PublicationSubmissionStatus("IN_REVIEW", 4, "IN_REVIEW");
    public static final PublicationSubmissionStatus OPEN = new PublicationSubmissionStatus("OPEN", 5, "OPEN");
    public static final PublicationSubmissionStatus REJECTED = new PublicationSubmissionStatus("REJECTED", 6, "REJECTED");
    public static final PublicationSubmissionStatus TRIAGE = new PublicationSubmissionStatus("TRIAGE", 7, "TRIAGE");
    public static final PublicationSubmissionStatus UNKNOWN = new PublicationSubmissionStatus("UNKNOWN", 8, "UNKNOWN");
    public static final PublicationSubmissionStatus WIP = new PublicationSubmissionStatus("WIP", 9, "WIP");
    public static final PublicationSubmissionStatus UNKNOWN__ = new PublicationSubmissionStatus("UNKNOWN__", 10, "UNKNOWN__");

    private static final /* synthetic */ PublicationSubmissionStatus[] $values() {
        return new PublicationSubmissionStatus[]{ACCEPTED, CANCELLED, CHANGES_MADE, CHANGES_REQUESTED, IN_REVIEW, OPEN, REJECTED, TRIAGE, UNKNOWN, WIP, UNKNOWN__};
    }

    static {
        PublicationSubmissionStatus[] publicationSubmissionStatusArr$values = $values();
        $VALUES = publicationSubmissionStatusArr$values;
        $ENTRIES = new i04(publicationSubmissionStatusArr$values);
        INSTANCE = new Companion();
        d46.R("ACCEPTED", "CANCELLED", "CHANGES_MADE", "CHANGES_REQUESTED", "IN_REVIEW", "OPEN", "REJECTED", "TRIAGE", "UNKNOWN", "WIP");
        type = new n04("PublicationSubmissionStatus");
    }

    private PublicationSubmissionStatus(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PublicationSubmissionStatus valueOf(String str) {
        return (PublicationSubmissionStatus) Enum.valueOf(PublicationSubmissionStatus.class, str);
    }

    public static PublicationSubmissionStatus[] values() {
        return (PublicationSubmissionStatus[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/PublicationSubmissionStatus$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "knownValues", "()[Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/PublicationSubmissionStatus;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<PublicationSubmissionStatus> getKnownEntries() {
            return d46.R(PublicationSubmissionStatus.ACCEPTED, PublicationSubmissionStatus.CANCELLED, PublicationSubmissionStatus.CHANGES_MADE, PublicationSubmissionStatus.CHANGES_REQUESTED, PublicationSubmissionStatus.IN_REVIEW, PublicationSubmissionStatus.OPEN, PublicationSubmissionStatus.REJECTED, PublicationSubmissionStatus.TRIAGE, PublicationSubmissionStatus.UNKNOWN, PublicationSubmissionStatus.WIP);
        }

        public final n04 getType() {
            return PublicationSubmissionStatus.type;
        }

        @z73
        public final PublicationSubmissionStatus[] knownValues() {
            return (PublicationSubmissionStatus[]) getKnownEntries().toArray(new PublicationSubmissionStatus[0]);
        }

        public final PublicationSubmissionStatus safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = PublicationSubmissionStatus.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((PublicationSubmissionStatus) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            PublicationSubmissionStatus publicationSubmissionStatus = (PublicationSubmissionStatus) next;
            return publicationSubmissionStatus == null ? PublicationSubmissionStatus.UNKNOWN__ : publicationSubmissionStatus;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
