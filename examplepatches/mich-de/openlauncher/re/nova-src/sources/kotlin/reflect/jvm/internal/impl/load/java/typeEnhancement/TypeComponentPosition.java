package kotlin.reflect.jvm.internal.impl.load.java.typeEnhancement;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class TypeComponentPosition {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ TypeComponentPosition[] $VALUES;
    public static final TypeComponentPosition FLEXIBLE_LOWER = new TypeComponentPosition("FLEXIBLE_LOWER", 0);
    public static final TypeComponentPosition FLEXIBLE_UPPER = new TypeComponentPosition("FLEXIBLE_UPPER", 1);
    public static final TypeComponentPosition INFLEXIBLE = new TypeComponentPosition("INFLEXIBLE", 2);

    private static final /* synthetic */ TypeComponentPosition[] $values() {
        return new TypeComponentPosition[]{FLEXIBLE_LOWER, FLEXIBLE_UPPER, INFLEXIBLE};
    }

    static {
        TypeComponentPosition[] typeComponentPositionArr$values = $values();
        $VALUES = typeComponentPositionArr$values;
        $ENTRIES = EnumEntriesKt.a(typeComponentPositionArr$values);
    }

    private TypeComponentPosition(String str, int i5) {
    }

    public static TypeComponentPosition valueOf(String str) {
        return (TypeComponentPosition) Enum.valueOf(TypeComponentPosition.class, str);
    }

    public static TypeComponentPosition[] values() {
        return (TypeComponentPosition[]) $VALUES.clone();
    }
}
