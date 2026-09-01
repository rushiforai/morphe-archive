package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.t69;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000e\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010¨\u0006\u0011"}, d2 = {"Lgen/model/PaymentRecurrenceInterval;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "t69", "UNKNOWN_INTERVAL", "DAILY", "WEEKLY", "MONTHLY", "YEARLY", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PaymentRecurrenceInterval implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PaymentRecurrenceInterval[] $VALUES;
    public static final ProtoAdapter<PaymentRecurrenceInterval> ADAPTER;
    public static final t69 Companion;
    public static final PaymentRecurrenceInterval DAILY;
    public static final PaymentRecurrenceInterval MONTHLY;
    public static final PaymentRecurrenceInterval UNKNOWN_INTERVAL;
    public static final PaymentRecurrenceInterval WEEKLY;
    public static final PaymentRecurrenceInterval YEARLY;
    private final int value;

    private static final /* synthetic */ PaymentRecurrenceInterval[] $values() {
        return new PaymentRecurrenceInterval[]{UNKNOWN_INTERVAL, DAILY, WEEKLY, MONTHLY, YEARLY};
    }

    static {
        PaymentRecurrenceInterval paymentRecurrenceInterval = new PaymentRecurrenceInterval("UNKNOWN_INTERVAL", 0, 0);
        UNKNOWN_INTERVAL = paymentRecurrenceInterval;
        DAILY = new PaymentRecurrenceInterval("DAILY", 1, 1);
        WEEKLY = new PaymentRecurrenceInterval("WEEKLY", 2, 2);
        MONTHLY = new PaymentRecurrenceInterval("MONTHLY", 3, 3);
        YEARLY = new PaymentRecurrenceInterval("YEARLY", 4, 4);
        PaymentRecurrenceInterval[] paymentRecurrenceIntervalArr$values = $values();
        $VALUES = paymentRecurrenceIntervalArr$values;
        $ENTRIES = new i04(paymentRecurrenceIntervalArr$values);
        Companion = new t69();
        ADAPTER = new PaymentRecurrenceInterval$Companion$ADAPTER$1(n1b.a.b(PaymentRecurrenceInterval.class), Syntax.PROTO_2, paymentRecurrenceInterval);
    }

    private PaymentRecurrenceInterval(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PaymentRecurrenceInterval fromValue(int i) {
        Companion.getClass();
        return t69.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PaymentRecurrenceInterval valueOf(String str) {
        return (PaymentRecurrenceInterval) Enum.valueOf(PaymentRecurrenceInterval.class, str);
    }

    public static PaymentRecurrenceInterval[] values() {
        return (PaymentRecurrenceInterval[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
