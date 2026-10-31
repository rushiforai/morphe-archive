package kotlin.reflect.jvm.internal.impl.incremental.components;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.Nullable;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class NoLookupLocation implements LookupLocation {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ NoLookupLocation[] $VALUES;
    public static final NoLookupLocation FROM_IDE = new NoLookupLocation("FROM_IDE", 0);
    public static final NoLookupLocation FROM_BACKEND = new NoLookupLocation("FROM_BACKEND", 1);
    public static final NoLookupLocation FROM_TEST = new NoLookupLocation("FROM_TEST", 2);
    public static final NoLookupLocation FROM_BUILTINS = new NoLookupLocation("FROM_BUILTINS", 3);
    public static final NoLookupLocation WHEN_CHECK_DECLARATION_CONFLICTS = new NoLookupLocation("WHEN_CHECK_DECLARATION_CONFLICTS", 4);
    public static final NoLookupLocation WHEN_CHECK_OVERRIDES = new NoLookupLocation("WHEN_CHECK_OVERRIDES", 5);
    public static final NoLookupLocation FOR_SCRIPT = new NoLookupLocation("FOR_SCRIPT", 6);
    public static final NoLookupLocation FROM_REFLECTION = new NoLookupLocation("FROM_REFLECTION", 7);
    public static final NoLookupLocation WHEN_RESOLVE_DECLARATION = new NoLookupLocation("WHEN_RESOLVE_DECLARATION", 8);
    public static final NoLookupLocation WHEN_GET_DECLARATION_SCOPE = new NoLookupLocation("WHEN_GET_DECLARATION_SCOPE", 9);
    public static final NoLookupLocation WHEN_RESOLVING_DEFAULT_TYPE_ARGUMENTS = new NoLookupLocation("WHEN_RESOLVING_DEFAULT_TYPE_ARGUMENTS", 10);
    public static final NoLookupLocation FOR_ALREADY_TRACKED = new NoLookupLocation("FOR_ALREADY_TRACKED", 11);
    public static final NoLookupLocation WHEN_GET_ALL_DESCRIPTORS = new NoLookupLocation("WHEN_GET_ALL_DESCRIPTORS", 12);
    public static final NoLookupLocation WHEN_TYPING = new NoLookupLocation("WHEN_TYPING", 13);
    public static final NoLookupLocation WHEN_GET_SUPER_MEMBERS = new NoLookupLocation("WHEN_GET_SUPER_MEMBERS", 14);
    public static final NoLookupLocation FOR_NON_TRACKED_SCOPE = new NoLookupLocation("FOR_NON_TRACKED_SCOPE", 15);
    public static final NoLookupLocation FROM_SYNTHETIC_SCOPE = new NoLookupLocation("FROM_SYNTHETIC_SCOPE", 16);
    public static final NoLookupLocation FROM_DESERIALIZATION = new NoLookupLocation("FROM_DESERIALIZATION", 17);
    public static final NoLookupLocation FROM_JAVA_LOADER = new NoLookupLocation("FROM_JAVA_LOADER", 18);
    public static final NoLookupLocation WHEN_GET_LOCAL_VARIABLE = new NoLookupLocation("WHEN_GET_LOCAL_VARIABLE", 19);
    public static final NoLookupLocation WHEN_FIND_BY_FQNAME = new NoLookupLocation("WHEN_FIND_BY_FQNAME", 20);
    public static final NoLookupLocation WHEN_GET_COMPANION_OBJECT = new NoLookupLocation("WHEN_GET_COMPANION_OBJECT", 21);
    public static final NoLookupLocation FOR_DEFAULT_IMPORTS = new NoLookupLocation("FOR_DEFAULT_IMPORTS", 22);

    private static final /* synthetic */ NoLookupLocation[] $values() {
        return new NoLookupLocation[]{FROM_IDE, FROM_BACKEND, FROM_TEST, FROM_BUILTINS, WHEN_CHECK_DECLARATION_CONFLICTS, WHEN_CHECK_OVERRIDES, FOR_SCRIPT, FROM_REFLECTION, WHEN_RESOLVE_DECLARATION, WHEN_GET_DECLARATION_SCOPE, WHEN_RESOLVING_DEFAULT_TYPE_ARGUMENTS, FOR_ALREADY_TRACKED, WHEN_GET_ALL_DESCRIPTORS, WHEN_TYPING, WHEN_GET_SUPER_MEMBERS, FOR_NON_TRACKED_SCOPE, FROM_SYNTHETIC_SCOPE, FROM_DESERIALIZATION, FROM_JAVA_LOADER, WHEN_GET_LOCAL_VARIABLE, WHEN_FIND_BY_FQNAME, WHEN_GET_COMPANION_OBJECT, FOR_DEFAULT_IMPORTS};
    }

    static {
        NoLookupLocation[] noLookupLocationArr$values = $values();
        $VALUES = noLookupLocationArr$values;
        $ENTRIES = EnumEntriesKt.a(noLookupLocationArr$values);
    }

    private NoLookupLocation(String str, int i5) {
    }

    public static NoLookupLocation valueOf(String str) {
        return (NoLookupLocation) Enum.valueOf(NoLookupLocation.class, str);
    }

    public static NoLookupLocation[] values() {
        return (NoLookupLocation[]) $VALUES.clone();
    }

    @Override // kotlin.reflect.jvm.internal.impl.incremental.components.LookupLocation
    @Nullable
    public LocationInfo getLocation() {
        return null;
    }
}
