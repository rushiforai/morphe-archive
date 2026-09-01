package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.bt1;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lgen/model/CollectionSectionType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "bt1", "POST_LIST", "COLLECTION_HEADER", "COLLECTION_PROMO", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionSectionType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CollectionSectionType[] $VALUES;
    public static final ProtoAdapter<CollectionSectionType> ADAPTER;
    public static final bt1 Companion;
    private final int value;
    public static final CollectionSectionType POST_LIST = new CollectionSectionType("POST_LIST", 0, 1);
    public static final CollectionSectionType COLLECTION_HEADER = new CollectionSectionType("COLLECTION_HEADER", 1, 2);
    public static final CollectionSectionType COLLECTION_PROMO = new CollectionSectionType("COLLECTION_PROMO", 2, 3);

    private static final /* synthetic */ CollectionSectionType[] $values() {
        return new CollectionSectionType[]{POST_LIST, COLLECTION_HEADER, COLLECTION_PROMO};
    }

    static {
        CollectionSectionType[] collectionSectionTypeArr$values = $values();
        $VALUES = collectionSectionTypeArr$values;
        $ENTRIES = new i04(collectionSectionTypeArr$values);
        Companion = new bt1();
        ADAPTER = new CollectionSectionType$Companion$ADAPTER$1(n1b.a.b(CollectionSectionType.class), Syntax.PROTO_2, null);
    }

    private CollectionSectionType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CollectionSectionType fromValue(int i) {
        Companion.getClass();
        return bt1.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CollectionSectionType valueOf(String str) {
        return (CollectionSectionType) Enum.valueOf(CollectionSectionType.class, str);
    }

    public static CollectionSectionType[] values() {
        return (CollectionSectionType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
