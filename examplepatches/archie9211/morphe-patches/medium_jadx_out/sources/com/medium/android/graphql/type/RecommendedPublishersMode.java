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
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\b\u0086\u0081\u0002\u0018\u0000 \f2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\fB\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000b¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/type/RecommendedPublishersMode;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "ALL", "PUBLICATIONS_ONLY", "USERS_ONLY", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RecommendedPublishersMode {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ RecommendedPublishersMode[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    private static final n04 type;
    private final String rawValue;
    public static final RecommendedPublishersMode ALL = new RecommendedPublishersMode("ALL", 0, "ALL");
    public static final RecommendedPublishersMode PUBLICATIONS_ONLY = new RecommendedPublishersMode("PUBLICATIONS_ONLY", 1, "PUBLICATIONS_ONLY");
    public static final RecommendedPublishersMode USERS_ONLY = new RecommendedPublishersMode("USERS_ONLY", 2, "USERS_ONLY");
    public static final RecommendedPublishersMode UNKNOWN__ = new RecommendedPublishersMode("UNKNOWN__", 3, "UNKNOWN__");

    private static final /* synthetic */ RecommendedPublishersMode[] $values() {
        return new RecommendedPublishersMode[]{ALL, PUBLICATIONS_ONLY, USERS_ONLY, UNKNOWN__};
    }

    static {
        RecommendedPublishersMode[] recommendedPublishersModeArr$values = $values();
        $VALUES = recommendedPublishersModeArr$values;
        $ENTRIES = new i04(recommendedPublishersModeArr$values);
        INSTANCE = new Companion();
        d46.R("ALL", "PUBLICATIONS_ONLY", "USERS_ONLY");
        type = new n04("RecommendedPublishersMode");
    }

    private RecommendedPublishersMode(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static RecommendedPublishersMode valueOf(String str) {
        return (RecommendedPublishersMode) Enum.valueOf(RecommendedPublishersMode.class, str);
    }

    public static RecommendedPublishersMode[] values() {
        return (RecommendedPublishersMode[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/RecommendedPublishersMode$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/RecommendedPublishersMode;", "knownValues", "()[Lcom/medium/android/graphql/type/RecommendedPublishersMode;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/RecommendedPublishersMode;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<RecommendedPublishersMode> getKnownEntries() {
            return d46.R(RecommendedPublishersMode.ALL, RecommendedPublishersMode.PUBLICATIONS_ONLY, RecommendedPublishersMode.USERS_ONLY);
        }

        public final n04 getType() {
            return RecommendedPublishersMode.type;
        }

        @z73
        public final RecommendedPublishersMode[] knownValues() {
            return (RecommendedPublishersMode[]) getKnownEntries().toArray(new RecommendedPublishersMode[0]);
        }

        public final RecommendedPublishersMode safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = RecommendedPublishersMode.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((RecommendedPublishersMode) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            RecommendedPublishersMode recommendedPublishersMode = (RecommendedPublishersMode) next;
            return recommendedPublishersMode == null ? RecommendedPublishersMode.UNKNOWN__ : recommendedPublishersMode;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
