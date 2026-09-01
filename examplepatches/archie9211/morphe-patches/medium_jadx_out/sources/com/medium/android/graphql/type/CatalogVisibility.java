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
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\n\b\u0086\u0081\u0002\u0018\u0000 \f2\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\fB\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000b¨\u0006\r"}, d2 = {"Lcom/medium/android/graphql/type/CatalogVisibility;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "LOCKED", "PRIVATE", "PUBLIC", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogVisibility {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CatalogVisibility[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    public static final CatalogVisibility LOCKED = new CatalogVisibility("LOCKED", 0, "LOCKED");
    public static final CatalogVisibility PRIVATE = new CatalogVisibility("PRIVATE", 1, "PRIVATE");
    public static final CatalogVisibility PUBLIC = new CatalogVisibility("PUBLIC", 2, "PUBLIC");
    public static final CatalogVisibility UNKNOWN__ = new CatalogVisibility("UNKNOWN__", 3, "UNKNOWN__");
    private static final n04 type;
    private final String rawValue;

    private static final /* synthetic */ CatalogVisibility[] $values() {
        return new CatalogVisibility[]{LOCKED, PRIVATE, PUBLIC, UNKNOWN__};
    }

    static {
        CatalogVisibility[] catalogVisibilityArr$values = $values();
        $VALUES = catalogVisibilityArr$values;
        $ENTRIES = new i04(catalogVisibilityArr$values);
        INSTANCE = new Companion();
        d46.R("LOCKED", "PRIVATE", "PUBLIC");
        type = new n04("CatalogVisibility");
    }

    private CatalogVisibility(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CatalogVisibility valueOf(String str) {
        return (CatalogVisibility) Enum.valueOf(CatalogVisibility.class, str);
    }

    public static CatalogVisibility[] values() {
        return (CatalogVisibility[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/CatalogVisibility$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/CatalogVisibility;", "knownValues", "()[Lcom/medium/android/graphql/type/CatalogVisibility;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/CatalogVisibility;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<CatalogVisibility> getKnownEntries() {
            return d46.R(CatalogVisibility.LOCKED, CatalogVisibility.PRIVATE, CatalogVisibility.PUBLIC);
        }

        public final n04 getType() {
            return CatalogVisibility.type;
        }

        @z73
        public final CatalogVisibility[] knownValues() {
            return (CatalogVisibility[]) getKnownEntries().toArray(new CatalogVisibility[0]);
        }

        public final CatalogVisibility safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = CatalogVisibility.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((CatalogVisibility) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            CatalogVisibility catalogVisibility = (CatalogVisibility) next;
            return catalogVisibility == null ? CatalogVisibility.UNKNOWN__ : catalogVisibility;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
