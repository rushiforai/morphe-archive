package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.c77;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0011\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013¨\u0006\u0014"}, d2 = {"Lgen/model/LockedPostSource;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "c77", "LOCKED_POST_SOURCE_NONE", "LOCKED_POST_SOURCE_UGC", "LOCKED_POST_SOURCE_COMMISSIONED", "LOCKED_POST_SOURCE_SYNDICATED", "LOCKED_POST_SOURCE_FEATURE_LOCK", "LOCKED_POST_SOURCE_UGC_UNENROLLED", "LOCKED_POST_SOURCE_PARTNERSHIPS", "LOCKED_POST_SOURCE_PUBLICATION_MEMBERSHIP", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LockedPostSource implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ LockedPostSource[] $VALUES;
    public static final ProtoAdapter<LockedPostSource> ADAPTER;
    public static final c77 Companion;
    public static final LockedPostSource LOCKED_POST_SOURCE_COMMISSIONED;
    public static final LockedPostSource LOCKED_POST_SOURCE_FEATURE_LOCK;
    public static final LockedPostSource LOCKED_POST_SOURCE_NONE;
    public static final LockedPostSource LOCKED_POST_SOURCE_PARTNERSHIPS;
    public static final LockedPostSource LOCKED_POST_SOURCE_PUBLICATION_MEMBERSHIP;
    public static final LockedPostSource LOCKED_POST_SOURCE_SYNDICATED;
    public static final LockedPostSource LOCKED_POST_SOURCE_UGC;
    public static final LockedPostSource LOCKED_POST_SOURCE_UGC_UNENROLLED;
    private final int value;

    private static final /* synthetic */ LockedPostSource[] $values() {
        return new LockedPostSource[]{LOCKED_POST_SOURCE_NONE, LOCKED_POST_SOURCE_UGC, LOCKED_POST_SOURCE_COMMISSIONED, LOCKED_POST_SOURCE_SYNDICATED, LOCKED_POST_SOURCE_FEATURE_LOCK, LOCKED_POST_SOURCE_UGC_UNENROLLED, LOCKED_POST_SOURCE_PARTNERSHIPS, LOCKED_POST_SOURCE_PUBLICATION_MEMBERSHIP};
    }

    static {
        LockedPostSource lockedPostSource = new LockedPostSource("LOCKED_POST_SOURCE_NONE", 0, 0);
        LOCKED_POST_SOURCE_NONE = lockedPostSource;
        LOCKED_POST_SOURCE_UGC = new LockedPostSource("LOCKED_POST_SOURCE_UGC", 1, 1);
        LOCKED_POST_SOURCE_COMMISSIONED = new LockedPostSource("LOCKED_POST_SOURCE_COMMISSIONED", 2, 2);
        LOCKED_POST_SOURCE_SYNDICATED = new LockedPostSource("LOCKED_POST_SOURCE_SYNDICATED", 3, 3);
        LOCKED_POST_SOURCE_FEATURE_LOCK = new LockedPostSource("LOCKED_POST_SOURCE_FEATURE_LOCK", 4, 5);
        LOCKED_POST_SOURCE_UGC_UNENROLLED = new LockedPostSource("LOCKED_POST_SOURCE_UGC_UNENROLLED", 5, 6);
        LOCKED_POST_SOURCE_PARTNERSHIPS = new LockedPostSource("LOCKED_POST_SOURCE_PARTNERSHIPS", 6, 7);
        LOCKED_POST_SOURCE_PUBLICATION_MEMBERSHIP = new LockedPostSource("LOCKED_POST_SOURCE_PUBLICATION_MEMBERSHIP", 7, 4);
        LockedPostSource[] lockedPostSourceArr$values = $values();
        $VALUES = lockedPostSourceArr$values;
        $ENTRIES = new i04(lockedPostSourceArr$values);
        Companion = new c77();
        ADAPTER = new LockedPostSource$Companion$ADAPTER$1(n1b.a.b(LockedPostSource.class), Syntax.PROTO_2, lockedPostSource);
    }

    private LockedPostSource(String str, int i, int i2) {
        this.value = i2;
    }

    public static final LockedPostSource fromValue(int i) {
        Companion.getClass();
        return c77.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static LockedPostSource valueOf(String str) {
        return (LockedPostSource) Enum.valueOf(LockedPostSource.class, str);
    }

    public static LockedPostSource[] values() {
        return (LockedPostSource[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
