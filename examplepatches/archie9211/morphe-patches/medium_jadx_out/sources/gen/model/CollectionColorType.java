package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.dr1;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0018\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001a¨\u0006\u001b"}, d2 = {"Lgen/model/CollectionColorType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "dr1", "COLOR_TYPE_NONE", "COLOR_TYPE_PRIMARY_ACCENT_TEXT", "COLOR_TYPE_SECONDARY_ACCENT_TEXT", "COLOR_TYPE_TERTIARY_ACCENT_TEXT", "COLOR_TYPE_PRIMARY_BACKGROUND", "COLOR_TYPE_SECONDARY_BACKGROUND", "COLOR_TYPE_TERTIARY_BACKGROUND", "COLOR_TYPE_QUATERNARY_BACKGROUND", "COLOR_TYPE_QUOTE_BACKGROUND", "COLOR_TYPE_PRIMARY_MAIN_TEXT", "COLOR_TYPE_SECONDARY_MAIN_TEXT", "COLOR_TYPE_TERTIARY_MAIN_TEXT", "COLOR_TYPE_QUOTE_MAIN_TEXT", "COLOR_TYPE_SUBTLE_TEXT", "COLOR_TYPE_VERY_SUBTLE_TEXT", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionColorType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CollectionColorType[] $VALUES;
    public static final ProtoAdapter<CollectionColorType> ADAPTER;
    public static final CollectionColorType COLOR_TYPE_NONE;
    public static final CollectionColorType COLOR_TYPE_PRIMARY_ACCENT_TEXT;
    public static final CollectionColorType COLOR_TYPE_PRIMARY_BACKGROUND;
    public static final CollectionColorType COLOR_TYPE_PRIMARY_MAIN_TEXT;
    public static final CollectionColorType COLOR_TYPE_QUATERNARY_BACKGROUND;
    public static final CollectionColorType COLOR_TYPE_QUOTE_BACKGROUND;
    public static final CollectionColorType COLOR_TYPE_QUOTE_MAIN_TEXT;
    public static final CollectionColorType COLOR_TYPE_SECONDARY_ACCENT_TEXT;
    public static final CollectionColorType COLOR_TYPE_SECONDARY_BACKGROUND;
    public static final CollectionColorType COLOR_TYPE_SECONDARY_MAIN_TEXT;
    public static final CollectionColorType COLOR_TYPE_SUBTLE_TEXT;
    public static final CollectionColorType COLOR_TYPE_TERTIARY_ACCENT_TEXT;
    public static final CollectionColorType COLOR_TYPE_TERTIARY_BACKGROUND;
    public static final CollectionColorType COLOR_TYPE_TERTIARY_MAIN_TEXT;
    public static final CollectionColorType COLOR_TYPE_VERY_SUBTLE_TEXT;
    public static final dr1 Companion;
    private final int value;

    private static final /* synthetic */ CollectionColorType[] $values() {
        return new CollectionColorType[]{COLOR_TYPE_NONE, COLOR_TYPE_PRIMARY_ACCENT_TEXT, COLOR_TYPE_SECONDARY_ACCENT_TEXT, COLOR_TYPE_TERTIARY_ACCENT_TEXT, COLOR_TYPE_PRIMARY_BACKGROUND, COLOR_TYPE_SECONDARY_BACKGROUND, COLOR_TYPE_TERTIARY_BACKGROUND, COLOR_TYPE_QUATERNARY_BACKGROUND, COLOR_TYPE_QUOTE_BACKGROUND, COLOR_TYPE_PRIMARY_MAIN_TEXT, COLOR_TYPE_SECONDARY_MAIN_TEXT, COLOR_TYPE_TERTIARY_MAIN_TEXT, COLOR_TYPE_QUOTE_MAIN_TEXT, COLOR_TYPE_SUBTLE_TEXT, COLOR_TYPE_VERY_SUBTLE_TEXT};
    }

    static {
        CollectionColorType collectionColorType = new CollectionColorType("COLOR_TYPE_NONE", 0, 0);
        COLOR_TYPE_NONE = collectionColorType;
        COLOR_TYPE_PRIMARY_ACCENT_TEXT = new CollectionColorType("COLOR_TYPE_PRIMARY_ACCENT_TEXT", 1, 1);
        COLOR_TYPE_SECONDARY_ACCENT_TEXT = new CollectionColorType("COLOR_TYPE_SECONDARY_ACCENT_TEXT", 2, 2);
        COLOR_TYPE_TERTIARY_ACCENT_TEXT = new CollectionColorType("COLOR_TYPE_TERTIARY_ACCENT_TEXT", 3, 3);
        COLOR_TYPE_PRIMARY_BACKGROUND = new CollectionColorType("COLOR_TYPE_PRIMARY_BACKGROUND", 4, 4);
        COLOR_TYPE_SECONDARY_BACKGROUND = new CollectionColorType("COLOR_TYPE_SECONDARY_BACKGROUND", 5, 5);
        COLOR_TYPE_TERTIARY_BACKGROUND = new CollectionColorType("COLOR_TYPE_TERTIARY_BACKGROUND", 6, 6);
        COLOR_TYPE_QUATERNARY_BACKGROUND = new CollectionColorType("COLOR_TYPE_QUATERNARY_BACKGROUND", 7, 7);
        COLOR_TYPE_QUOTE_BACKGROUND = new CollectionColorType("COLOR_TYPE_QUOTE_BACKGROUND", 8, 8);
        COLOR_TYPE_PRIMARY_MAIN_TEXT = new CollectionColorType("COLOR_TYPE_PRIMARY_MAIN_TEXT", 9, 9);
        COLOR_TYPE_SECONDARY_MAIN_TEXT = new CollectionColorType("COLOR_TYPE_SECONDARY_MAIN_TEXT", 10, 10);
        COLOR_TYPE_TERTIARY_MAIN_TEXT = new CollectionColorType("COLOR_TYPE_TERTIARY_MAIN_TEXT", 11, 11);
        COLOR_TYPE_QUOTE_MAIN_TEXT = new CollectionColorType("COLOR_TYPE_QUOTE_MAIN_TEXT", 12, 12);
        COLOR_TYPE_SUBTLE_TEXT = new CollectionColorType("COLOR_TYPE_SUBTLE_TEXT", 13, 13);
        COLOR_TYPE_VERY_SUBTLE_TEXT = new CollectionColorType("COLOR_TYPE_VERY_SUBTLE_TEXT", 14, 14);
        CollectionColorType[] collectionColorTypeArr$values = $values();
        $VALUES = collectionColorTypeArr$values;
        $ENTRIES = new i04(collectionColorTypeArr$values);
        Companion = new dr1();
        ADAPTER = new CollectionColorType$Companion$ADAPTER$1(n1b.a.b(CollectionColorType.class), Syntax.PROTO_2, collectionColorType);
    }

    private CollectionColorType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CollectionColorType fromValue(int i) {
        Companion.getClass();
        return dr1.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CollectionColorType valueOf(String str) {
        return (CollectionColorType) Enum.valueOf(CollectionColorType.class, str);
    }

    public static CollectionColorType[] values() {
        return (CollectionColorType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
