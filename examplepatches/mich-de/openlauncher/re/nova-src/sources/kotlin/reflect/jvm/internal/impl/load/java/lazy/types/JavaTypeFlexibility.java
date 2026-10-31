package kotlin.reflect.jvm.internal.impl.load.java.lazy.types;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class JavaTypeFlexibility {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ JavaTypeFlexibility[] $VALUES;
    public static final JavaTypeFlexibility INFLEXIBLE = new JavaTypeFlexibility("INFLEXIBLE", 0);
    public static final JavaTypeFlexibility FLEXIBLE_UPPER_BOUND = new JavaTypeFlexibility("FLEXIBLE_UPPER_BOUND", 1);
    public static final JavaTypeFlexibility FLEXIBLE_LOWER_BOUND = new JavaTypeFlexibility("FLEXIBLE_LOWER_BOUND", 2);

    private static final /* synthetic */ JavaTypeFlexibility[] $values() {
        return new JavaTypeFlexibility[]{INFLEXIBLE, FLEXIBLE_UPPER_BOUND, FLEXIBLE_LOWER_BOUND};
    }

    static {
        JavaTypeFlexibility[] javaTypeFlexibilityArr$values = $values();
        $VALUES = javaTypeFlexibilityArr$values;
        $ENTRIES = EnumEntriesKt.a(javaTypeFlexibilityArr$values);
    }

    private JavaTypeFlexibility(String str, int i5) {
    }

    public static JavaTypeFlexibility valueOf(String str) {
        return (JavaTypeFlexibility) Enum.valueOf(JavaTypeFlexibility.class, str);
    }

    public static JavaTypeFlexibility[] values() {
        return (JavaTypeFlexibility[]) $VALUES.clone();
    }
}
