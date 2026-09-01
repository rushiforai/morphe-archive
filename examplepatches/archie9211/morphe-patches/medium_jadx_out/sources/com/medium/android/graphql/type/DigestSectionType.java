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
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \u000f2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000fB\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u0010"}, d2 = {"Lcom/medium/android/graphql/type/DigestSectionType;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "UNKNOWN", "TOP_POSTS", "FROM_YOUR_FOLLOWING", "PROMO", "ONBOARDING_TAG", "ONBOARDING_MORE_READS", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DigestSectionType {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ DigestSectionType[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    private static final n04 type;
    private final String rawValue;
    public static final DigestSectionType UNKNOWN = new DigestSectionType("UNKNOWN", 0, "UNKNOWN");
    public static final DigestSectionType TOP_POSTS = new DigestSectionType("TOP_POSTS", 1, "TOP_POSTS");
    public static final DigestSectionType FROM_YOUR_FOLLOWING = new DigestSectionType("FROM_YOUR_FOLLOWING", 2, "FROM_YOUR_FOLLOWING");
    public static final DigestSectionType PROMO = new DigestSectionType("PROMO", 3, "PROMO");
    public static final DigestSectionType ONBOARDING_TAG = new DigestSectionType("ONBOARDING_TAG", 4, "ONBOARDING_TAG");
    public static final DigestSectionType ONBOARDING_MORE_READS = new DigestSectionType("ONBOARDING_MORE_READS", 5, "ONBOARDING_MORE_READS");
    public static final DigestSectionType UNKNOWN__ = new DigestSectionType("UNKNOWN__", 6, "UNKNOWN__");

    private static final /* synthetic */ DigestSectionType[] $values() {
        return new DigestSectionType[]{UNKNOWN, TOP_POSTS, FROM_YOUR_FOLLOWING, PROMO, ONBOARDING_TAG, ONBOARDING_MORE_READS, UNKNOWN__};
    }

    static {
        DigestSectionType[] digestSectionTypeArr$values = $values();
        $VALUES = digestSectionTypeArr$values;
        $ENTRIES = new i04(digestSectionTypeArr$values);
        INSTANCE = new Companion();
        d46.R("UNKNOWN", "TOP_POSTS", "FROM_YOUR_FOLLOWING", "PROMO", "ONBOARDING_TAG", "ONBOARDING_MORE_READS");
        type = new n04("DigestSectionType");
    }

    private DigestSectionType(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static DigestSectionType valueOf(String str) {
        return (DigestSectionType) Enum.valueOf(DigestSectionType.class, str);
    }

    public static DigestSectionType[] values() {
        return (DigestSectionType[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/DigestSectionType$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/DigestSectionType;", "knownValues", "()[Lcom/medium/android/graphql/type/DigestSectionType;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/DigestSectionType;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<DigestSectionType> getKnownEntries() {
            return d46.R(DigestSectionType.UNKNOWN, DigestSectionType.TOP_POSTS, DigestSectionType.FROM_YOUR_FOLLOWING, DigestSectionType.PROMO, DigestSectionType.ONBOARDING_TAG, DigestSectionType.ONBOARDING_MORE_READS);
        }

        public final n04 getType() {
            return DigestSectionType.type;
        }

        @z73
        public final DigestSectionType[] knownValues() {
            return (DigestSectionType[]) getKnownEntries().toArray(new DigestSectionType[0]);
        }

        public final DigestSectionType safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = DigestSectionType.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((DigestSectionType) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            DigestSectionType digestSectionType = (DigestSectionType) next;
            return digestSectionType == null ? DigestSectionType.UNKNOWN__ : digestSectionType;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
