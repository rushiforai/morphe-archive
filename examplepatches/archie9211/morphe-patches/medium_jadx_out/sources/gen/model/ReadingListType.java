package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.tua;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lgen/model/ReadingListType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "tua", "READING_LIST_NONE", "READING_LIST_QUEUE", "READING_LIST_ARCHIVE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ReadingListType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ReadingListType[] $VALUES;
    public static final ProtoAdapter<ReadingListType> ADAPTER;
    public static final tua Companion;
    public static final ReadingListType READING_LIST_ARCHIVE;
    public static final ReadingListType READING_LIST_NONE;
    public static final ReadingListType READING_LIST_QUEUE;
    private final int value;

    private static final /* synthetic */ ReadingListType[] $values() {
        return new ReadingListType[]{READING_LIST_NONE, READING_LIST_QUEUE, READING_LIST_ARCHIVE};
    }

    static {
        ReadingListType readingListType = new ReadingListType("READING_LIST_NONE", 0, 0);
        READING_LIST_NONE = readingListType;
        READING_LIST_QUEUE = new ReadingListType("READING_LIST_QUEUE", 1, 2);
        READING_LIST_ARCHIVE = new ReadingListType("READING_LIST_ARCHIVE", 2, 3);
        ReadingListType[] readingListTypeArr$values = $values();
        $VALUES = readingListTypeArr$values;
        $ENTRIES = new i04(readingListTypeArr$values);
        Companion = new tua();
        ADAPTER = new ReadingListType$Companion$ADAPTER$1(n1b.a.b(ReadingListType.class), Syntax.PROTO_2, readingListType);
    }

    private ReadingListType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final ReadingListType fromValue(int i) {
        Companion.getClass();
        return tua.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static ReadingListType valueOf(String str) {
        return (ReadingListType) Enum.valueOf(ReadingListType.class, str);
    }

    public static ReadingListType[] values() {
        return (ReadingListType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
