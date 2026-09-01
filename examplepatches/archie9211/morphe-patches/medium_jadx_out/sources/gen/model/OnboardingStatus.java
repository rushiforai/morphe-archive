package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.gt8;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lgen/model/OnboardingStatus;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "gt8", "NOT_ONBOARDED", "ONBOARDED", "SKIPPED", "ONBOARDED_WITH_TOPICS", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class OnboardingStatus implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ OnboardingStatus[] $VALUES;
    public static final ProtoAdapter<OnboardingStatus> ADAPTER;
    public static final gt8 Companion;
    public static final OnboardingStatus NOT_ONBOARDED;
    public static final OnboardingStatus ONBOARDED;
    public static final OnboardingStatus ONBOARDED_WITH_TOPICS;
    public static final OnboardingStatus SKIPPED;
    private final int value;

    private static final /* synthetic */ OnboardingStatus[] $values() {
        return new OnboardingStatus[]{NOT_ONBOARDED, ONBOARDED, SKIPPED, ONBOARDED_WITH_TOPICS};
    }

    static {
        OnboardingStatus onboardingStatus = new OnboardingStatus("NOT_ONBOARDED", 0, 0);
        NOT_ONBOARDED = onboardingStatus;
        ONBOARDED = new OnboardingStatus("ONBOARDED", 1, 1);
        SKIPPED = new OnboardingStatus("SKIPPED", 2, 2);
        ONBOARDED_WITH_TOPICS = new OnboardingStatus("ONBOARDED_WITH_TOPICS", 3, 3);
        OnboardingStatus[] onboardingStatusArr$values = $values();
        $VALUES = onboardingStatusArr$values;
        $ENTRIES = new i04(onboardingStatusArr$values);
        Companion = new gt8();
        ADAPTER = new OnboardingStatus$Companion$ADAPTER$1(n1b.a.b(OnboardingStatus.class), Syntax.PROTO_2, onboardingStatus);
    }

    private OnboardingStatus(String str, int i, int i2) {
        this.value = i2;
    }

    public static final OnboardingStatus fromValue(int i) {
        Companion.getClass();
        return gt8.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static OnboardingStatus valueOf(String str) {
        return (OnboardingStatus) Enum.valueOf(OnboardingStatus.class, str);
    }

    public static OnboardingStatus[] values() {
        return (OnboardingStatus[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
