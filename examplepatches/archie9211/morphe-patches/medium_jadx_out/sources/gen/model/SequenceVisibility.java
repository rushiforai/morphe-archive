package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.rzb;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000b\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\r¨\u0006\u000e"}, d2 = {"Lgen/model/SequenceVisibility;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "rzb", "SEQUENCE_VISIBILITY_PRIVATE", "SEQUENCE_VISIBILITY_PUBLIC", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SequenceVisibility implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SequenceVisibility[] $VALUES;
    public static final ProtoAdapter<SequenceVisibility> ADAPTER;
    public static final rzb Companion;
    public static final SequenceVisibility SEQUENCE_VISIBILITY_PRIVATE;
    public static final SequenceVisibility SEQUENCE_VISIBILITY_PUBLIC;
    private final int value;

    private static final /* synthetic */ SequenceVisibility[] $values() {
        return new SequenceVisibility[]{SEQUENCE_VISIBILITY_PRIVATE, SEQUENCE_VISIBILITY_PUBLIC};
    }

    static {
        SequenceVisibility sequenceVisibility = new SequenceVisibility("SEQUENCE_VISIBILITY_PRIVATE", 0, 0);
        SEQUENCE_VISIBILITY_PRIVATE = sequenceVisibility;
        SEQUENCE_VISIBILITY_PUBLIC = new SequenceVisibility("SEQUENCE_VISIBILITY_PUBLIC", 1, 1);
        SequenceVisibility[] sequenceVisibilityArr$values = $values();
        $VALUES = sequenceVisibilityArr$values;
        $ENTRIES = new i04(sequenceVisibilityArr$values);
        Companion = new rzb();
        ADAPTER = new SequenceVisibility$Companion$ADAPTER$1(n1b.a.b(SequenceVisibility.class), Syntax.PROTO_2, sequenceVisibility);
    }

    private SequenceVisibility(String str, int i, int i2) {
        this.value = i2;
    }

    public static final SequenceVisibility fromValue(int i) {
        Companion.getClass();
        if (i == 0) {
            return SEQUENCE_VISIBILITY_PRIVATE;
        }
        if (i != 1) {
            return null;
        }
        return SEQUENCE_VISIBILITY_PUBLIC;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SequenceVisibility valueOf(String str) {
        return (SequenceVisibility) Enum.valueOf(SequenceVisibility.class, str);
    }

    public static SequenceVisibility[] values() {
        return (SequenceVisibility[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
