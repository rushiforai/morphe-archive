package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.ug1;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lgen/model/CatalogVisibility;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "ug1", "CATALOG_VISIBILITY_PUBLIC", "CATALOG_VISIBILITY_PRIVATE", "CATALOG_VISIBILITY_LOCKED", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CatalogVisibility implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CatalogVisibility[] $VALUES;
    public static final ProtoAdapter<CatalogVisibility> ADAPTER;
    public static final CatalogVisibility CATALOG_VISIBILITY_LOCKED;
    public static final CatalogVisibility CATALOG_VISIBILITY_PRIVATE;
    public static final CatalogVisibility CATALOG_VISIBILITY_PUBLIC;
    public static final ug1 Companion;
    private final int value;

    private static final /* synthetic */ CatalogVisibility[] $values() {
        return new CatalogVisibility[]{CATALOG_VISIBILITY_PUBLIC, CATALOG_VISIBILITY_PRIVATE, CATALOG_VISIBILITY_LOCKED};
    }

    static {
        CatalogVisibility catalogVisibility = new CatalogVisibility("CATALOG_VISIBILITY_PUBLIC", 0, 0);
        CATALOG_VISIBILITY_PUBLIC = catalogVisibility;
        CATALOG_VISIBILITY_PRIVATE = new CatalogVisibility("CATALOG_VISIBILITY_PRIVATE", 1, 1);
        CATALOG_VISIBILITY_LOCKED = new CatalogVisibility("CATALOG_VISIBILITY_LOCKED", 2, 2);
        CatalogVisibility[] catalogVisibilityArr$values = $values();
        $VALUES = catalogVisibilityArr$values;
        $ENTRIES = new i04(catalogVisibilityArr$values);
        Companion = new ug1();
        ADAPTER = new CatalogVisibility$Companion$ADAPTER$1(n1b.a.b(CatalogVisibility.class), Syntax.PROTO_2, catalogVisibility);
    }

    private CatalogVisibility(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CatalogVisibility fromValue(int i) {
        Companion.getClass();
        return ug1.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CatalogVisibility valueOf(String str) {
        return (CatalogVisibility) Enum.valueOf(CatalogVisibility.class, str);
    }

    public static CatalogVisibility[] values() {
        return (CatalogVisibility[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
