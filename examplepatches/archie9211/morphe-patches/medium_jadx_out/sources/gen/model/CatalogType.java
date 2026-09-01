package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.kg1;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0010\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012¨\u0006\u0013"}, d2 = {"Lgen/model/CatalogType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "kg1", "CATALOG_TYPE_DEFAULT", "CATALOG_TYPE_SERIES", "CATALOG_TYPE_TOPIC", "CATALOG_TYPE_SEQUENCE", "CATALOG_TYPE_HOME_MODULE", "CATALOG_TYPE_LIST", "CATALOG_TYPE_PREDEFINED_LIST", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CatalogType[] $VALUES;
    public static final ProtoAdapter<CatalogType> ADAPTER;
    public static final CatalogType CATALOG_TYPE_DEFAULT;
    public static final CatalogType CATALOG_TYPE_HOME_MODULE;
    public static final CatalogType CATALOG_TYPE_LIST;
    public static final CatalogType CATALOG_TYPE_PREDEFINED_LIST;
    public static final CatalogType CATALOG_TYPE_SEQUENCE;
    public static final CatalogType CATALOG_TYPE_SERIES;
    public static final CatalogType CATALOG_TYPE_TOPIC;
    public static final kg1 Companion;
    private final int value;

    private static final /* synthetic */ CatalogType[] $values() {
        return new CatalogType[]{CATALOG_TYPE_DEFAULT, CATALOG_TYPE_SERIES, CATALOG_TYPE_TOPIC, CATALOG_TYPE_SEQUENCE, CATALOG_TYPE_HOME_MODULE, CATALOG_TYPE_LIST, CATALOG_TYPE_PREDEFINED_LIST};
    }

    static {
        CatalogType catalogType = new CatalogType("CATALOG_TYPE_DEFAULT", 0, 0);
        CATALOG_TYPE_DEFAULT = catalogType;
        CATALOG_TYPE_SERIES = new CatalogType("CATALOG_TYPE_SERIES", 1, 1);
        CATALOG_TYPE_TOPIC = new CatalogType("CATALOG_TYPE_TOPIC", 2, 2);
        CATALOG_TYPE_SEQUENCE = new CatalogType("CATALOG_TYPE_SEQUENCE", 3, 3);
        CATALOG_TYPE_HOME_MODULE = new CatalogType("CATALOG_TYPE_HOME_MODULE", 4, 4);
        CATALOG_TYPE_LIST = new CatalogType("CATALOG_TYPE_LIST", 5, 5);
        CATALOG_TYPE_PREDEFINED_LIST = new CatalogType("CATALOG_TYPE_PREDEFINED_LIST", 6, 6);
        CatalogType[] catalogTypeArr$values = $values();
        $VALUES = catalogTypeArr$values;
        $ENTRIES = new i04(catalogTypeArr$values);
        Companion = new kg1();
        ADAPTER = new CatalogType$Companion$ADAPTER$1(n1b.a.b(CatalogType.class), Syntax.PROTO_2, catalogType);
    }

    private CatalogType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CatalogType fromValue(int i) {
        Companion.getClass();
        return kg1.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CatalogType valueOf(String str) {
        return (CatalogType) Enum.valueOf(CatalogType.class, str);
    }

    public static CatalogType[] values() {
        return (CatalogType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
