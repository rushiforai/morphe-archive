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
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0013\b\u0086\u0081\u0002\u0018\u0000 \u00152\b\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\u0015B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\nj\u0002\b\u000bj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014¨\u0006\u0016"}, d2 = {"Lcom/medium/android/graphql/type/LayoutType;", "", "rawValue", "", "<init>", "(Ljava/lang/String;ILjava/lang/String;)V", "getRawValue", "()Ljava/lang/String;", "CONSTRAINED_HEIGHT_PREVIEW", "CROPPED_HEIGHT_PREVIEW", "FULL_WIDTH", "FULL_WIDTH_CROPPED_COVER", "INSET_CENTER", "INSET_CENTER_SMALL", "INSET_LEFT", "INSET_RIGHT", "OUTSET_CENTER", "OUTSET_LEFT", "OUTSET_ROW", "OUTSET_ROW_CONTINUE", "UNKNOWN__", "Companion", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LayoutType {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ LayoutType[] $VALUES;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE;
    private static final n04 type;
    private final String rawValue;
    public static final LayoutType CONSTRAINED_HEIGHT_PREVIEW = new LayoutType("CONSTRAINED_HEIGHT_PREVIEW", 0, "CONSTRAINED_HEIGHT_PREVIEW");
    public static final LayoutType CROPPED_HEIGHT_PREVIEW = new LayoutType("CROPPED_HEIGHT_PREVIEW", 1, "CROPPED_HEIGHT_PREVIEW");
    public static final LayoutType FULL_WIDTH = new LayoutType("FULL_WIDTH", 2, "FULL_WIDTH");
    public static final LayoutType FULL_WIDTH_CROPPED_COVER = new LayoutType("FULL_WIDTH_CROPPED_COVER", 3, "FULL_WIDTH_CROPPED_COVER");
    public static final LayoutType INSET_CENTER = new LayoutType("INSET_CENTER", 4, "INSET_CENTER");
    public static final LayoutType INSET_CENTER_SMALL = new LayoutType("INSET_CENTER_SMALL", 5, "INSET_CENTER_SMALL");
    public static final LayoutType INSET_LEFT = new LayoutType("INSET_LEFT", 6, "INSET_LEFT");
    public static final LayoutType INSET_RIGHT = new LayoutType("INSET_RIGHT", 7, "INSET_RIGHT");
    public static final LayoutType OUTSET_CENTER = new LayoutType("OUTSET_CENTER", 8, "OUTSET_CENTER");
    public static final LayoutType OUTSET_LEFT = new LayoutType("OUTSET_LEFT", 9, "OUTSET_LEFT");
    public static final LayoutType OUTSET_ROW = new LayoutType("OUTSET_ROW", 10, "OUTSET_ROW");
    public static final LayoutType OUTSET_ROW_CONTINUE = new LayoutType("OUTSET_ROW_CONTINUE", 11, "OUTSET_ROW_CONTINUE");
    public static final LayoutType UNKNOWN__ = new LayoutType("UNKNOWN__", 12, "UNKNOWN__");

    private static final /* synthetic */ LayoutType[] $values() {
        return new LayoutType[]{CONSTRAINED_HEIGHT_PREVIEW, CROPPED_HEIGHT_PREVIEW, FULL_WIDTH, FULL_WIDTH_CROPPED_COVER, INSET_CENTER, INSET_CENTER_SMALL, INSET_LEFT, INSET_RIGHT, OUTSET_CENTER, OUTSET_LEFT, OUTSET_ROW, OUTSET_ROW_CONTINUE, UNKNOWN__};
    }

    static {
        LayoutType[] layoutTypeArr$values = $values();
        $VALUES = layoutTypeArr$values;
        $ENTRIES = new i04(layoutTypeArr$values);
        INSTANCE = new Companion();
        d46.R("CONSTRAINED_HEIGHT_PREVIEW", "CROPPED_HEIGHT_PREVIEW", "FULL_WIDTH", "FULL_WIDTH_CROPPED_COVER", "INSET_CENTER", "INSET_CENTER_SMALL", "INSET_LEFT", "INSET_RIGHT", "OUTSET_CENTER", "OUTSET_LEFT", "OUTSET_ROW", "OUTSET_ROW_CONTINUE");
        type = new n04("LayoutType");
    }

    private LayoutType(String str, int i, String str2) {
        this.rawValue = str2;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static LayoutType valueOf(String str) {
        return (LayoutType) Enum.valueOf(LayoutType.class, str);
    }

    public static LayoutType[] values() {
        return (LayoutType[]) $VALUES.clone();
    }

    public final String getRawValue() {
        return this.rawValue;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00050\u0004H\u0007¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\n\u0010\u000bR\u0017\u0010\r\u001a\u00020\f8\u0006¢\u0006\f\n\u0004\b\r\u0010\u000e\u001a\u0004\b\u000f\u0010\u0010R\u0017\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00050\u00118F¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0015"}, d2 = {"Lcom/medium/android/graphql/type/LayoutType$Companion;", "", "<init>", "()V", "", "Lcom/medium/android/graphql/type/LayoutType;", "knownValues", "()[Lcom/medium/android/graphql/type/LayoutType;", "", "rawValue", "safeValueOf", "(Ljava/lang/String;)Lcom/medium/android/graphql/type/LayoutType;", "Ln04;", "type", "Ln04;", "getType", "()Ln04;", "", "getKnownEntries", "()Ljava/util/List;", "knownEntries", "graphql"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        public final List<LayoutType> getKnownEntries() {
            return d46.R(LayoutType.CONSTRAINED_HEIGHT_PREVIEW, LayoutType.CROPPED_HEIGHT_PREVIEW, LayoutType.FULL_WIDTH, LayoutType.FULL_WIDTH_CROPPED_COVER, LayoutType.INSET_CENTER, LayoutType.INSET_CENTER_SMALL, LayoutType.INSET_LEFT, LayoutType.INSET_RIGHT, LayoutType.OUTSET_CENTER, LayoutType.OUTSET_LEFT, LayoutType.OUTSET_ROW, LayoutType.OUTSET_ROW_CONTINUE);
        }

        public final n04 getType() {
            return LayoutType.type;
        }

        @z73
        public final LayoutType[] knownValues() {
            return (LayoutType[]) getKnownEntries().toArray(new LayoutType[0]);
        }

        public final LayoutType safeValueOf(String rawValue) {
            Object next;
            rawValue.getClass();
            Iterator<E> it2 = LayoutType.getEntries().iterator();
            while (true) {
                if (!it2.hasNext()) {
                    next = null;
                    break;
                }
                next = it2.next();
                if (g76.L(((LayoutType) next).getRawValue(), rawValue)) {
                    break;
                }
            }
            LayoutType layoutType = (LayoutType) next;
            return layoutType == null ? LayoutType.UNKNOWN__ : layoutType;
        }

        public Companion(gy2 gy2Var) {
        }
    }
}
