package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.q69;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011¨\u0006\u0012"}, d2 = {"Lgen/model/PaymentMembershipStatus;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "q69", "UNKNOWN_STATUS", "TRIAL", "ACTIVE", "PAST_DUE", "CANCELLED", "UNPAID", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PaymentMembershipStatus implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PaymentMembershipStatus[] $VALUES;
    public static final PaymentMembershipStatus ACTIVE;
    public static final ProtoAdapter<PaymentMembershipStatus> ADAPTER;
    public static final PaymentMembershipStatus CANCELLED;
    public static final q69 Companion;
    public static final PaymentMembershipStatus PAST_DUE;
    public static final PaymentMembershipStatus TRIAL;
    public static final PaymentMembershipStatus UNKNOWN_STATUS;
    public static final PaymentMembershipStatus UNPAID;
    private final int value;

    private static final /* synthetic */ PaymentMembershipStatus[] $values() {
        return new PaymentMembershipStatus[]{UNKNOWN_STATUS, TRIAL, ACTIVE, PAST_DUE, CANCELLED, UNPAID};
    }

    static {
        PaymentMembershipStatus paymentMembershipStatus = new PaymentMembershipStatus("UNKNOWN_STATUS", 0, 0);
        UNKNOWN_STATUS = paymentMembershipStatus;
        TRIAL = new PaymentMembershipStatus("TRIAL", 1, 1);
        ACTIVE = new PaymentMembershipStatus("ACTIVE", 2, 2);
        PAST_DUE = new PaymentMembershipStatus("PAST_DUE", 3, 3);
        CANCELLED = new PaymentMembershipStatus("CANCELLED", 4, 4);
        UNPAID = new PaymentMembershipStatus("UNPAID", 5, 5);
        PaymentMembershipStatus[] paymentMembershipStatusArr$values = $values();
        $VALUES = paymentMembershipStatusArr$values;
        $ENTRIES = new i04(paymentMembershipStatusArr$values);
        Companion = new q69();
        ADAPTER = new PaymentMembershipStatus$Companion$ADAPTER$1(n1b.a.b(PaymentMembershipStatus.class), Syntax.PROTO_2, paymentMembershipStatus);
    }

    private PaymentMembershipStatus(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PaymentMembershipStatus fromValue(int i) {
        Companion.getClass();
        return q69.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PaymentMembershipStatus valueOf(String str) {
        return (PaymentMembershipStatus) Enum.valueOf(PaymentMembershipStatus.class, str);
    }

    public static PaymentMembershipStatus[] values() {
        return (PaymentMembershipStatus[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
