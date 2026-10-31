package kotlin.reflect.jvm.internal.impl.types;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class Variance {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ Variance[] $VALUES;
    public static final Variance INVARIANT = new Variance("INVARIANT", 0, b.f42142b, true, true, 0);
    public static final Variance IN_VARIANCE = new Variance("IN_VARIANCE", 1, "in", true, false, -1);
    public static final Variance OUT_VARIANCE = new Variance("OUT_VARIANCE", 2, "out", false, true, 1);
    private final boolean allowsInPosition;
    private final boolean allowsOutPosition;

    @NotNull
    private final String label;
    private final int superpositionFactor;

    private static final /* synthetic */ Variance[] $values() {
        return new Variance[]{INVARIANT, IN_VARIANCE, OUT_VARIANCE};
    }

    static {
        Variance[] varianceArr$values = $values();
        $VALUES = varianceArr$values;
        $ENTRIES = EnumEntriesKt.a(varianceArr$values);
    }

    private Variance(String str, int i5, String str2, boolean z11, boolean z12, int i11) {
        this.label = str2;
        this.allowsInPosition = z11;
        this.allowsOutPosition = z12;
        this.superpositionFactor = i11;
    }

    public static Variance valueOf(String str) {
        return (Variance) Enum.valueOf(Variance.class, str);
    }

    public static Variance[] values() {
        return (Variance[]) $VALUES.clone();
    }

    public final boolean getAllowsOutPosition() {
        return this.allowsOutPosition;
    }

    @NotNull
    public final String getLabel() {
        return this.label;
    }

    @Override // java.lang.Enum
    @NotNull
    public String toString() {
        return this.label;
    }
}
