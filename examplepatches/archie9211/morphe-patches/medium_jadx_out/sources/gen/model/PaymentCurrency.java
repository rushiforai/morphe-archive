package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.p69;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000e\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010¨\u0006\u0011"}, d2 = {"Lgen/model/PaymentCurrency;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "p69", "UNKNOWN_CURRENCY", "USD", "CAD", "CURRENCY_NOT_APPLICABLE", "EUR", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PaymentCurrency implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PaymentCurrency[] $VALUES;
    public static final ProtoAdapter<PaymentCurrency> ADAPTER;
    public static final PaymentCurrency CAD;
    public static final PaymentCurrency CURRENCY_NOT_APPLICABLE;
    public static final p69 Companion;
    public static final PaymentCurrency EUR;
    public static final PaymentCurrency UNKNOWN_CURRENCY;
    public static final PaymentCurrency USD;
    private final int value;

    private static final /* synthetic */ PaymentCurrency[] $values() {
        return new PaymentCurrency[]{UNKNOWN_CURRENCY, USD, CAD, CURRENCY_NOT_APPLICABLE, EUR};
    }

    static {
        PaymentCurrency paymentCurrency = new PaymentCurrency("UNKNOWN_CURRENCY", 0, 0);
        UNKNOWN_CURRENCY = paymentCurrency;
        USD = new PaymentCurrency("USD", 1, 1);
        CAD = new PaymentCurrency("CAD", 2, 2);
        CURRENCY_NOT_APPLICABLE = new PaymentCurrency("CURRENCY_NOT_APPLICABLE", 3, 3);
        EUR = new PaymentCurrency("EUR", 4, 4);
        PaymentCurrency[] paymentCurrencyArr$values = $values();
        $VALUES = paymentCurrencyArr$values;
        $ENTRIES = new i04(paymentCurrencyArr$values);
        Companion = new p69();
        ADAPTER = new PaymentCurrency$Companion$ADAPTER$1(n1b.a.b(PaymentCurrency.class), Syntax.PROTO_2, paymentCurrency);
    }

    private PaymentCurrency(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PaymentCurrency fromValue(int i) {
        Companion.getClass();
        return p69.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PaymentCurrency valueOf(String str) {
        return (PaymentCurrency) Enum.valueOf(PaymentCurrency.class, str);
    }

    public static PaymentCurrency[] values() {
        return (PaymentCurrency[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
