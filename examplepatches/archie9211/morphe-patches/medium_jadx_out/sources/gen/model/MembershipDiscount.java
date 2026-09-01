package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.lv7;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0011\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013¨\u0006\u0014"}, d2 = {"Lgen/model/MembershipDiscount;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "lv7", "NO_DISCOUNT", "FIFTY_PERCENT_OFF_ONE_YEAR", "STUDENT_DISCOUNT", "TWENTY_FIVE_PERCENT_OFF_ONE_YEAR", "TEN_PERCENT_OFF_ONE_YEAR", "TWENTY_PERCENT_OFF_ONE_YEAR", "FIFTEEN_PERCENT_OFF_ONE_YEAR", "FREE_ONE_YEAR", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MembershipDiscount implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ MembershipDiscount[] $VALUES;
    public static final ProtoAdapter<MembershipDiscount> ADAPTER;
    public static final lv7 Companion;
    public static final MembershipDiscount FIFTEEN_PERCENT_OFF_ONE_YEAR;
    public static final MembershipDiscount FIFTY_PERCENT_OFF_ONE_YEAR;
    public static final MembershipDiscount FREE_ONE_YEAR;
    public static final MembershipDiscount NO_DISCOUNT;
    public static final MembershipDiscount STUDENT_DISCOUNT;
    public static final MembershipDiscount TEN_PERCENT_OFF_ONE_YEAR;
    public static final MembershipDiscount TWENTY_FIVE_PERCENT_OFF_ONE_YEAR;
    public static final MembershipDiscount TWENTY_PERCENT_OFF_ONE_YEAR;
    private final int value;

    private static final /* synthetic */ MembershipDiscount[] $values() {
        return new MembershipDiscount[]{NO_DISCOUNT, FIFTY_PERCENT_OFF_ONE_YEAR, STUDENT_DISCOUNT, TWENTY_FIVE_PERCENT_OFF_ONE_YEAR, TEN_PERCENT_OFF_ONE_YEAR, TWENTY_PERCENT_OFF_ONE_YEAR, FIFTEEN_PERCENT_OFF_ONE_YEAR, FREE_ONE_YEAR};
    }

    static {
        MembershipDiscount membershipDiscount = new MembershipDiscount("NO_DISCOUNT", 0, 0);
        NO_DISCOUNT = membershipDiscount;
        FIFTY_PERCENT_OFF_ONE_YEAR = new MembershipDiscount("FIFTY_PERCENT_OFF_ONE_YEAR", 1, 1);
        STUDENT_DISCOUNT = new MembershipDiscount("STUDENT_DISCOUNT", 2, 2);
        TWENTY_FIVE_PERCENT_OFF_ONE_YEAR = new MembershipDiscount("TWENTY_FIVE_PERCENT_OFF_ONE_YEAR", 3, 3);
        TEN_PERCENT_OFF_ONE_YEAR = new MembershipDiscount("TEN_PERCENT_OFF_ONE_YEAR", 4, 4);
        TWENTY_PERCENT_OFF_ONE_YEAR = new MembershipDiscount("TWENTY_PERCENT_OFF_ONE_YEAR", 5, 5);
        FIFTEEN_PERCENT_OFF_ONE_YEAR = new MembershipDiscount("FIFTEEN_PERCENT_OFF_ONE_YEAR", 6, 6);
        FREE_ONE_YEAR = new MembershipDiscount("FREE_ONE_YEAR", 7, 7);
        MembershipDiscount[] membershipDiscountArr$values = $values();
        $VALUES = membershipDiscountArr$values;
        $ENTRIES = new i04(membershipDiscountArr$values);
        Companion = new lv7();
        ADAPTER = new MembershipDiscount$Companion$ADAPTER$1(n1b.a.b(MembershipDiscount.class), Syntax.PROTO_2, membershipDiscount);
    }

    private MembershipDiscount(String str, int i, int i2) {
        this.value = i2;
    }

    public static final MembershipDiscount fromValue(int i) {
        Companion.getClass();
        return lv7.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static MembershipDiscount valueOf(String str) {
        return (MembershipDiscount) Enum.valueOf(MembershipDiscount.class, str);
    }

    public static MembershipDiscount[] values() {
        return (MembershipDiscount[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
