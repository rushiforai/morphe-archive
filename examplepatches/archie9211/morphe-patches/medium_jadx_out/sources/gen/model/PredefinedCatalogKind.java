package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.ay9;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lgen/model/PredefinedCatalogKind;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "ay9", "__NULL_PREDEFINED_KIND", "READING_LIST", "CURRENTLY_READING", "PURCHASED", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PredefinedCatalogKind implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PredefinedCatalogKind[] $VALUES;
    public static final ProtoAdapter<PredefinedCatalogKind> ADAPTER;
    public static final PredefinedCatalogKind CURRENTLY_READING;
    public static final ay9 Companion;
    public static final PredefinedCatalogKind PURCHASED;
    public static final PredefinedCatalogKind READING_LIST;
    public static final PredefinedCatalogKind __NULL_PREDEFINED_KIND;
    private final int value;

    private static final /* synthetic */ PredefinedCatalogKind[] $values() {
        return new PredefinedCatalogKind[]{__NULL_PREDEFINED_KIND, READING_LIST, CURRENTLY_READING, PURCHASED};
    }

    static {
        PredefinedCatalogKind predefinedCatalogKind = new PredefinedCatalogKind("__NULL_PREDEFINED_KIND", 0, 0);
        __NULL_PREDEFINED_KIND = predefinedCatalogKind;
        READING_LIST = new PredefinedCatalogKind("READING_LIST", 1, 1);
        CURRENTLY_READING = new PredefinedCatalogKind("CURRENTLY_READING", 2, 2);
        PURCHASED = new PredefinedCatalogKind("PURCHASED", 3, 3);
        PredefinedCatalogKind[] predefinedCatalogKindArr$values = $values();
        $VALUES = predefinedCatalogKindArr$values;
        $ENTRIES = new i04(predefinedCatalogKindArr$values);
        Companion = new ay9();
        ADAPTER = new PredefinedCatalogKind$Companion$ADAPTER$1(n1b.a.b(PredefinedCatalogKind.class), Syntax.PROTO_2, predefinedCatalogKind);
    }

    private PredefinedCatalogKind(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PredefinedCatalogKind fromValue(int i) {
        Companion.getClass();
        return ay9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PredefinedCatalogKind valueOf(String str) {
        return (PredefinedCatalogKind) Enum.valueOf(PredefinedCatalogKind.class, str);
    }

    public static PredefinedCatalogKind[] values() {
        return (PredefinedCatalogKind[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
