package kotlin.reflect.jvm.internal.impl.builtins;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.Name;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class UnsignedArrayType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ UnsignedArrayType[] $VALUES;
    public static final UnsignedArrayType UBYTEARRAY;
    public static final UnsignedArrayType UINTARRAY;
    public static final UnsignedArrayType ULONGARRAY;
    public static final UnsignedArrayType USHORTARRAY;

    @NotNull
    private final ClassId classId;

    @NotNull
    private final Name typeName;

    private static final /* synthetic */ UnsignedArrayType[] $values() {
        return new UnsignedArrayType[]{UBYTEARRAY, USHORTARRAY, UINTARRAY, ULONGARRAY};
    }

    static {
        ClassId classIdFromString = ClassId.fromString("kotlin/UByteArray");
        Intrinsics.f(classIdFromString, "fromString(...)");
        UBYTEARRAY = new UnsignedArrayType("UBYTEARRAY", 0, classIdFromString);
        ClassId classIdFromString2 = ClassId.fromString("kotlin/UShortArray");
        Intrinsics.f(classIdFromString2, "fromString(...)");
        USHORTARRAY = new UnsignedArrayType("USHORTARRAY", 1, classIdFromString2);
        ClassId classIdFromString3 = ClassId.fromString("kotlin/UIntArray");
        Intrinsics.f(classIdFromString3, "fromString(...)");
        UINTARRAY = new UnsignedArrayType("UINTARRAY", 2, classIdFromString3);
        ClassId classIdFromString4 = ClassId.fromString("kotlin/ULongArray");
        Intrinsics.f(classIdFromString4, "fromString(...)");
        ULONGARRAY = new UnsignedArrayType("ULONGARRAY", 3, classIdFromString4);
        UnsignedArrayType[] unsignedArrayTypeArr$values = $values();
        $VALUES = unsignedArrayTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(unsignedArrayTypeArr$values);
    }

    private UnsignedArrayType(String str, int i5, ClassId classId) {
        this.classId = classId;
        Name shortClassName = classId.getShortClassName();
        Intrinsics.f(shortClassName, "getShortClassName(...)");
        this.typeName = shortClassName;
    }

    public static UnsignedArrayType valueOf(String str) {
        return (UnsignedArrayType) Enum.valueOf(UnsignedArrayType.class, str);
    }

    public static UnsignedArrayType[] values() {
        return (UnsignedArrayType[]) $VALUES.clone();
    }

    @NotNull
    public final Name getTypeName() {
        return this.typeName;
    }
}
