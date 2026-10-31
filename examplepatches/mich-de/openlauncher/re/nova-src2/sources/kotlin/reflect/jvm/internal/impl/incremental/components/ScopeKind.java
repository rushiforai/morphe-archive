package kotlin.reflect.jvm.internal.impl.incremental.components;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class ScopeKind {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ScopeKind[] $VALUES;
    public static final ScopeKind PACKAGE = new ScopeKind("PACKAGE", 0);
    public static final ScopeKind CLASSIFIER = new ScopeKind("CLASSIFIER", 1);

    private static final /* synthetic */ ScopeKind[] $values() {
        return new ScopeKind[]{PACKAGE, CLASSIFIER};
    }

    static {
        ScopeKind[] scopeKindArr$values = $values();
        $VALUES = scopeKindArr$values;
        $ENTRIES = EnumEntriesKt.a(scopeKindArr$values);
    }

    private ScopeKind(String str, int i5) {
    }

    public static ScopeKind valueOf(String str) {
        return (ScopeKind) Enum.valueOf(ScopeKind.class, str);
    }

    public static ScopeKind[] values() {
        return (ScopeKind[]) $VALUES.clone();
    }
}
