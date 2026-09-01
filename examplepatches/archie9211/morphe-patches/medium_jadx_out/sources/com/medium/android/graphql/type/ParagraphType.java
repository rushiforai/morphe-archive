package com.medium.android.graphql.type;

import androidx.work.impl.yX.VrhD;
import com.google.android.gms.analytics.wYI.ivbZv;
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
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0017\b\u0086\u0081\u0002\u0018\u0000 \u00192\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0019B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018¨\u0006\u001a"}, d2 = {"Lcom/medium/android/graphql/type/ParagraphType;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "BQ", "COVER_TITLE", "H1", "H2", "H3", "H4", "HR", "IFRAME", "IMG", "MIXTAPE_EMBED", "OLI", "P", "PQ", "PRE", "SECTION_CAPTION", "ULI", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ParagraphType {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ParagraphType[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    public static final ParagraphType ULI;
    public static final ParagraphType UNKNOWN__;
    private static final n04 type;
    private final String rawValue;
    public static final ParagraphType BQ = new ParagraphType("BQ", 0, "BQ");
    public static final ParagraphType COVER_TITLE = new ParagraphType("COVER_TITLE", 1, "COVER_TITLE");
    public static final ParagraphType H1 = new ParagraphType("H1", 2, "H1");
    public static final ParagraphType H2 = new ParagraphType("H2", 3, "H2");
    public static final ParagraphType H3 = new ParagraphType("H3", 4, "H3");
    public static final ParagraphType H4 = new ParagraphType("H4", 5, "H4");
    public static final ParagraphType HR = new ParagraphType("HR", 6, "HR");
    public static final ParagraphType IFRAME = new ParagraphType("IFRAME", 7, "IFRAME");
    public static final ParagraphType IMG = new ParagraphType("IMG", 8, "IMG");
    public static final ParagraphType MIXTAPE_EMBED = new ParagraphType("MIXTAPE_EMBED", 9, "MIXTAPE_EMBED");
    public static final ParagraphType OLI = new ParagraphType("OLI", 10, "OLI");
    public static final ParagraphType P = new ParagraphType("P", 11, "P");
    public static final ParagraphType PQ = new ParagraphType("PQ", 12, "PQ");
    public static final ParagraphType PRE = new ParagraphType("PRE", 13, "PRE");
    public static final ParagraphType SECTION_CAPTION = new ParagraphType("SECTION_CAPTION", 14, "SECTION_CAPTION");

    private static final /* synthetic */ ParagraphType[] $values() {
        return new ParagraphType[]{BQ, COVER_TITLE, H1, H2, H3, H4, HR, IFRAME, IMG, MIXTAPE_EMBED, OLI, P, PQ, PRE, SECTION_CAPTION, ULI, UNKNOWN__};
    }

    private ParagraphType(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static ParagraphType valueOf(String str) {
        return (ParagraphType) Enum.valueOf(ParagraphType.class, str);
    }

    public static ParagraphType[] values() {
        return (ParagraphType[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    static {
        String str = ivbZv.gizlMyQeWyf;
        ULI = new ParagraphType(str, 15, str);
        UNKNOWN__ = new ParagraphType("UNKNOWN__", 16, "UNKNOWN__");
        ParagraphType[] paragraphTypeArr$values = $values();
        $VALUES = paragraphTypeArr$values;
        $ENTRIES = new i04(paragraphTypeArr$values);
        INSTANCE = new Companion();
        d46.R("BQ", "COVER_TITLE", "H1", "H2", "H3", "H4", "HR", VrhD.lqTy, "IMG", "MIXTAPE_EMBED", "OLI", "P", "PQ", "PRE", "SECTION_CAPTION", "ULI");
        type = new n04("ParagraphType");
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/ParagraphType$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/ParagraphType;", "knownValues", "()[Lcom/medium/android/graphql/type/ParagraphType;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/ParagraphType;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<ParagraphType> getKnownEntries() {
            return d46.R(ParagraphType.BQ, ParagraphType.COVER_TITLE, ParagraphType.H1, ParagraphType.H2, ParagraphType.H3, ParagraphType.H4, ParagraphType.HR, ParagraphType.IFRAME, ParagraphType.IMG, ParagraphType.MIXTAPE_EMBED, ParagraphType.OLI, ParagraphType.P, ParagraphType.PQ, ParagraphType.PRE, ParagraphType.SECTION_CAPTION, ParagraphType.ULI);
        }

        public final n04 getType() {
            return ParagraphType.type;
        }

        @z73
        public final ParagraphType[] knownValues() {
            return (ParagraphType[]) getKnownEntries().toArray(new ParagraphType[0]);
        }

        public final ParagraphType safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = ParagraphType.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((ParagraphType) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            ParagraphType paragraphType = (ParagraphType) next;
            return paragraphType == null ? ParagraphType.UNKNOWN__ : paragraphType;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
