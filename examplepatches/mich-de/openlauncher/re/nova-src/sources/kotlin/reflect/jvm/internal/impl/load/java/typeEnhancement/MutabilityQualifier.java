package kotlin.reflect.jvm.internal.impl.load.java.typeEnhancement;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class MutabilityQualifier {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ MutabilityQualifier[] $VALUES;
    public static final MutabilityQualifier READ_ONLY = new MutabilityQualifier("READ_ONLY", 0);
    public static final MutabilityQualifier MUTABLE = new MutabilityQualifier("MUTABLE", 1);

    private static final /* synthetic */ MutabilityQualifier[] $values() {
        return new MutabilityQualifier[]{READ_ONLY, MUTABLE};
    }

    static {
        MutabilityQualifier[] mutabilityQualifierArr$values = $values();
        $VALUES = mutabilityQualifierArr$values;
        $ENTRIES = EnumEntriesKt.a(mutabilityQualifierArr$values);
    }

    private MutabilityQualifier(String str, int i5) {
    }

    public static MutabilityQualifier valueOf(String str) {
        return (MutabilityQualifier) Enum.valueOf(MutabilityQualifier.class, str);
    }

    public static MutabilityQualifier[] values() {
        return (MutabilityQualifier[]) $VALUES.clone();
    }
}
