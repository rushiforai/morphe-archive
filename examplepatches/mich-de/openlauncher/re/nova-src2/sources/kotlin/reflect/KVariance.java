package kotlin.reflect;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lkotlin/reflect/KVariance;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "INVARIANT", "IN", "OUT", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class KVariance {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ KVariance[] $VALUES;
    public static final KVariance INVARIANT = new KVariance("INVARIANT", 0);
    public static final KVariance IN = new KVariance("IN", 1);
    public static final KVariance OUT = new KVariance("OUT", 2);

    private static final /* synthetic */ KVariance[] $values() {
        return new KVariance[]{INVARIANT, IN, OUT};
    }

    static {
        KVariance[] kVarianceArr$values = $values();
        $VALUES = kVarianceArr$values;
        $ENTRIES = EnumEntriesKt.a(kVarianceArr$values);
    }

    private KVariance(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<KVariance> getEntries() {
        return $ENTRIES;
    }

    public static KVariance valueOf(String str) {
        return (KVariance) Enum.valueOf(KVariance.class, str);
    }

    public static KVariance[] values() {
        return (KVariance[]) $VALUES.clone();
    }
}
