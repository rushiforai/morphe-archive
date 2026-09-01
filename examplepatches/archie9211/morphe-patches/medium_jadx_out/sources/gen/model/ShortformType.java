package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.l8c;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lgen/model/ShortformType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "l8c", "SHORTFORM_TYPE_LINK", "SHORTFORM_TYPE_NOTE", "SHORTFORM_TYPE_MEDIA", "SHORTFORM_TYPE_QUOTE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ShortformType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ ShortformType[] $VALUES;
    public static final ProtoAdapter<ShortformType> ADAPTER;
    public static final l8c Companion;
    public static final ShortformType SHORTFORM_TYPE_LINK;
    public static final ShortformType SHORTFORM_TYPE_MEDIA;
    public static final ShortformType SHORTFORM_TYPE_NOTE;
    public static final ShortformType SHORTFORM_TYPE_QUOTE;
    private final int value;

    private static final /* synthetic */ ShortformType[] $values() {
        return new ShortformType[]{SHORTFORM_TYPE_LINK, SHORTFORM_TYPE_NOTE, SHORTFORM_TYPE_MEDIA, SHORTFORM_TYPE_QUOTE};
    }

    static {
        ShortformType shortformType = new ShortformType("SHORTFORM_TYPE_LINK", 0, 0);
        SHORTFORM_TYPE_LINK = shortformType;
        SHORTFORM_TYPE_NOTE = new ShortformType("SHORTFORM_TYPE_NOTE", 1, 1);
        SHORTFORM_TYPE_MEDIA = new ShortformType("SHORTFORM_TYPE_MEDIA", 2, 2);
        SHORTFORM_TYPE_QUOTE = new ShortformType("SHORTFORM_TYPE_QUOTE", 3, 3);
        ShortformType[] shortformTypeArr$values = $values();
        $VALUES = shortformTypeArr$values;
        $ENTRIES = new i04(shortformTypeArr$values);
        Companion = new l8c();
        ADAPTER = new ShortformType$Companion$ADAPTER$1(n1b.a.b(ShortformType.class), Syntax.PROTO_2, shortformType);
    }

    private ShortformType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final ShortformType fromValue(int i) {
        Companion.getClass();
        return l8c.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static ShortformType valueOf(String str) {
        return (ShortformType) Enum.valueOf(ShortformType.class, str);
    }

    public static ShortformType[] values() {
        return (ShortformType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
