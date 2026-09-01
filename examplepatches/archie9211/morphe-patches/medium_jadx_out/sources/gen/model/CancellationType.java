package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.b61;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0013\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015¨\u0006\u0016"}, d2 = {"Lgen/model/CancellationType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "b61", "UNKNOWN_CANCELLATION", "ADMIN", "USER", "PROVIDER_APPLE", "TRIAL_ENDED", "PROVIDER_GOOGLE", "PROVIDER_PAYPAL", "GIFT_ENDED", "PROVIDER_BRAINTREE", "PROVIDER_STRIPE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CancellationType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CancellationType[] $VALUES;
    public static final ProtoAdapter<CancellationType> ADAPTER;
    public static final CancellationType ADMIN;
    public static final b61 Companion;
    public static final CancellationType GIFT_ENDED;
    public static final CancellationType PROVIDER_APPLE;
    public static final CancellationType PROVIDER_BRAINTREE;
    public static final CancellationType PROVIDER_GOOGLE;
    public static final CancellationType PROVIDER_PAYPAL;
    public static final CancellationType PROVIDER_STRIPE;
    public static final CancellationType TRIAL_ENDED;
    public static final CancellationType UNKNOWN_CANCELLATION;
    public static final CancellationType USER;
    private final int value;

    private static final /* synthetic */ CancellationType[] $values() {
        return new CancellationType[]{UNKNOWN_CANCELLATION, ADMIN, USER, PROVIDER_APPLE, TRIAL_ENDED, PROVIDER_GOOGLE, PROVIDER_PAYPAL, GIFT_ENDED, PROVIDER_BRAINTREE, PROVIDER_STRIPE};
    }

    static {
        CancellationType cancellationType = new CancellationType("UNKNOWN_CANCELLATION", 0, 0);
        UNKNOWN_CANCELLATION = cancellationType;
        ADMIN = new CancellationType("ADMIN", 1, 1);
        USER = new CancellationType("USER", 2, 2);
        PROVIDER_APPLE = new CancellationType("PROVIDER_APPLE", 3, 3);
        TRIAL_ENDED = new CancellationType("TRIAL_ENDED", 4, 4);
        PROVIDER_GOOGLE = new CancellationType("PROVIDER_GOOGLE", 5, 5);
        PROVIDER_PAYPAL = new CancellationType("PROVIDER_PAYPAL", 6, 6);
        GIFT_ENDED = new CancellationType("GIFT_ENDED", 7, 7);
        PROVIDER_BRAINTREE = new CancellationType("PROVIDER_BRAINTREE", 8, 8);
        PROVIDER_STRIPE = new CancellationType("PROVIDER_STRIPE", 9, 9);
        CancellationType[] cancellationTypeArr$values = $values();
        $VALUES = cancellationTypeArr$values;
        $ENTRIES = new i04(cancellationTypeArr$values);
        Companion = new b61();
        ADAPTER = new CancellationType$Companion$ADAPTER$1(n1b.a.b(CancellationType.class), Syntax.PROTO_2, cancellationType);
    }

    private CancellationType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CancellationType fromValue(int i) {
        Companion.getClass();
        return b61.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CancellationType valueOf(String str) {
        return (CancellationType) Enum.valueOf(CancellationType.class, str);
    }

    public static CancellationType[] values() {
        return (CancellationType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
