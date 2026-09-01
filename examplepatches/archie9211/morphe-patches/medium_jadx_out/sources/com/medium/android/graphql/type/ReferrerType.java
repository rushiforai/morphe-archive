package com.medium.android.graphql.type;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
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
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0010\b\u0086\u0081\u0002\u0018\u0000 \u00122\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0012B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011¨\u0006\u0013"}, d2 = {"Lcom/medium/android/graphql/type/ReferrerType;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "ACCELERATED_MOBILE_PAGES", "DIRECT", "INSTANT_ARTICLES", "INTERNAL", "OTHER", "PLATFORM", "RSS", "SEARCH", "SITE", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ReferrerType {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ReferrerType[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    public static final ReferrerType SEARCH;
    public static final ReferrerType SITE;
    public static final ReferrerType UNKNOWN__;
    private static final n04 type;
    private final String rawValue;
    public static final ReferrerType ACCELERATED_MOBILE_PAGES = new ReferrerType("ACCELERATED_MOBILE_PAGES", 0, "ACCELERATED_MOBILE_PAGES");
    public static final ReferrerType DIRECT = new ReferrerType("DIRECT", 1, "DIRECT");
    public static final ReferrerType INSTANT_ARTICLES = new ReferrerType("INSTANT_ARTICLES", 2, "INSTANT_ARTICLES");
    public static final ReferrerType INTERNAL = new ReferrerType("INTERNAL", 3, "INTERNAL");
    public static final ReferrerType OTHER = new ReferrerType("OTHER", 4, "OTHER");
    public static final ReferrerType PLATFORM = new ReferrerType("PLATFORM", 5, "PLATFORM");
    public static final ReferrerType RSS = new ReferrerType("RSS", 6, "RSS");

    private static final /* synthetic */ ReferrerType[] $values() {
        return new ReferrerType[]{ACCELERATED_MOBILE_PAGES, DIRECT, INSTANT_ARTICLES, INTERNAL, OTHER, PLATFORM, RSS, SEARCH, SITE, UNKNOWN__};
    }

    private ReferrerType(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static ReferrerType valueOf(String str) {
        return (ReferrerType) Enum.valueOf(ReferrerType.class, str);
    }

    public static ReferrerType[] values() {
        return (ReferrerType[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    static {
        String str = AXoTRPEGKEve.DEDSii;
        SEARCH = new ReferrerType(str, 7, str);
        SITE = new ReferrerType("SITE", 8, "SITE");
        UNKNOWN__ = new ReferrerType("UNKNOWN__", 9, "UNKNOWN__");
        ReferrerType[] referrerTypeArr$values = $values();
        $VALUES = referrerTypeArr$values;
        $ENTRIES = new i04(referrerTypeArr$values);
        INSTANCE = new Companion();
        d46.R("ACCELERATED_MOBILE_PAGES", "DIRECT", "INSTANT_ARTICLES", "INTERNAL", "OTHER", "PLATFORM", "RSS", "SEARCH", "SITE");
        type = new n04("ReferrerType");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/ReferrerType$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/ReferrerType;", "knownValues", "()[Lcom/medium/android/graphql/type/ReferrerType;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/ReferrerType;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<ReferrerType> getKnownEntries() {
            return d46.R(ReferrerType.ACCELERATED_MOBILE_PAGES, ReferrerType.DIRECT, ReferrerType.INSTANT_ARTICLES, ReferrerType.INTERNAL, ReferrerType.OTHER, ReferrerType.PLATFORM, ReferrerType.RSS, ReferrerType.SEARCH, ReferrerType.SITE);
        }

        public final n04 getType() {
            return ReferrerType.type;
        }

        @z73
        public final ReferrerType[] knownValues() {
            return (ReferrerType[]) getKnownEntries().toArray(new ReferrerType[0]);
        }

        public final ReferrerType safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = ReferrerType.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((ReferrerType) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            ReferrerType referrerType = (ReferrerType) next;
            return referrerType == null ? ReferrerType.UNKNOWN__ : referrerType;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
