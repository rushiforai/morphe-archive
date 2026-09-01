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
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\b\u0086\u0081\u0002\u0018\u0000 \u000b2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\f"}, d2 = {"Lcom/medium/android/graphql/type/Sort;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "ASC", "DESC", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class Sort {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ Sort[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    private static final n04 type;
    private final String rawValue;
    public static final Sort ASC = new Sort("ASC", 0, "ASC");
    public static final Sort DESC = new Sort("DESC", 1, "DESC");
    public static final Sort UNKNOWN__ = new Sort("UNKNOWN__", 2, "UNKNOWN__");

    private static final /* synthetic */ Sort[] $values() {
        return new Sort[]{ASC, DESC, UNKNOWN__};
    }

    static {
        Sort[] sortArr$values = $values();
        $VALUES = sortArr$values;
        $ENTRIES = new i04(sortArr$values);
        INSTANCE = new Companion();
        d46.R("ASC", "DESC");
        type = new n04("Sort");
    }

    private Sort(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static Sort valueOf(String str) {
        return (Sort) Enum.valueOf(Sort.class, str);
    }

    public static Sort[] values() {
        return (Sort[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/Sort$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/Sort;", "knownValues", "()[Lcom/medium/android/graphql/type/Sort;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/Sort;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<Sort> getKnownEntries() {
            return d46.R(Sort.ASC, Sort.DESC);
        }

        public final n04 getType() {
            return Sort.type;
        }

        @z73
        public final Sort[] knownValues() {
            return (Sort[]) getKnownEntries().toArray(new Sort[0]);
        }

        public final Sort safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = Sort.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((Sort) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            Sort sort = (Sort) next;
            return sort == null ? Sort.UNKNOWN__ : sort;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
