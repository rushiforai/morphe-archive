package kotlin.reflect.jvm.internal.impl.descriptors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.Nullable;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class ClassKind {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ClassKind[] $VALUES;

    @Nullable
    private final String codeRepresentation;
    public static final ClassKind CLASS = new ClassKind("CLASS", 0, "class");
    public static final ClassKind INTERFACE = new ClassKind("INTERFACE", 1, "interface");
    public static final ClassKind ENUM_CLASS = new ClassKind("ENUM_CLASS", 2, "enum class");
    public static final ClassKind ENUM_ENTRY = new ClassKind("ENUM_ENTRY", 3, null);
    public static final ClassKind ANNOTATION_CLASS = new ClassKind("ANNOTATION_CLASS", 4, "annotation class");
    public static final ClassKind OBJECT = new ClassKind("OBJECT", 5, "object");

    private static final /* synthetic */ ClassKind[] $values() {
        return new ClassKind[]{CLASS, INTERFACE, ENUM_CLASS, ENUM_ENTRY, ANNOTATION_CLASS, OBJECT};
    }

    static {
        ClassKind[] classKindArr$values = $values();
        $VALUES = classKindArr$values;
        $ENTRIES = EnumEntriesKt.a(classKindArr$values);
    }

    private ClassKind(String str, int i5, String str2) {
        this.codeRepresentation = str2;
    }

    public static ClassKind valueOf(String str) {
        return (ClassKind) Enum.valueOf(ClassKind.class, str);
    }

    public static ClassKind[] values() {
        return (ClassKind[]) $VALUES.clone();
    }

    public final boolean isSingleton() {
        return this == OBJECT || this == ENUM_ENTRY;
    }
}
