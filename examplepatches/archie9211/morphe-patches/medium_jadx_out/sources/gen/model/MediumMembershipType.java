package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.oq7;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lgen/model/MediumMembershipType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "oq7", "MEDIUM_MONTHLY", "MEDIUM_YEARLY", "PREMIUM_MEDIUM_MONTHLY", "PREMIUM_MEDIUM_YEARLY", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MediumMembershipType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ MediumMembershipType[] $VALUES;
    public static final ProtoAdapter<MediumMembershipType> ADAPTER;
    public static final oq7 Companion;
    public static final MediumMembershipType MEDIUM_MONTHLY;
    public static final MediumMembershipType MEDIUM_YEARLY;
    public static final MediumMembershipType PREMIUM_MEDIUM_MONTHLY;
    public static final MediumMembershipType PREMIUM_MEDIUM_YEARLY;
    private final int value;

    private static final /* synthetic */ MediumMembershipType[] $values() {
        return new MediumMembershipType[]{MEDIUM_MONTHLY, MEDIUM_YEARLY, PREMIUM_MEDIUM_MONTHLY, PREMIUM_MEDIUM_YEARLY};
    }

    static {
        MediumMembershipType mediumMembershipType = new MediumMembershipType("MEDIUM_MONTHLY", 0, 0);
        MEDIUM_MONTHLY = mediumMembershipType;
        MEDIUM_YEARLY = new MediumMembershipType("MEDIUM_YEARLY", 1, 1);
        PREMIUM_MEDIUM_MONTHLY = new MediumMembershipType("PREMIUM_MEDIUM_MONTHLY", 2, 2);
        PREMIUM_MEDIUM_YEARLY = new MediumMembershipType("PREMIUM_MEDIUM_YEARLY", 3, 3);
        MediumMembershipType[] mediumMembershipTypeArr$values = $values();
        $VALUES = mediumMembershipTypeArr$values;
        $ENTRIES = new i04(mediumMembershipTypeArr$values);
        Companion = new oq7();
        ADAPTER = new MediumMembershipType$Companion$ADAPTER$1(n1b.a.b(MediumMembershipType.class), Syntax.PROTO_2, mediumMembershipType);
    }

    private MediumMembershipType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final MediumMembershipType fromValue(int i) {
        Companion.getClass();
        return oq7.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static MediumMembershipType valueOf(String str) {
        return (MediumMembershipType) Enum.valueOf(MediumMembershipType.class, str);
    }

    public static MediumMembershipType[] values() {
        return (MediumMembershipType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
