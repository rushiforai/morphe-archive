package kotlin.reflect.jvm.internal.impl.types.error;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class ErrorScopeKind {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ErrorScopeKind[] $VALUES;

    @NotNull
    private final String debugMessage;
    public static final ErrorScopeKind CAPTURED_TYPE_SCOPE = new ErrorScopeKind("CAPTURED_TYPE_SCOPE", 0, "No member resolution should be done on captured type, it used only during constraint system resolution");
    public static final ErrorScopeKind INTEGER_LITERAL_TYPE_SCOPE = new ErrorScopeKind("INTEGER_LITERAL_TYPE_SCOPE", 1, "Scope for integer literal type (%s)");
    public static final ErrorScopeKind ERASED_RECEIVER_TYPE_SCOPE = new ErrorScopeKind("ERASED_RECEIVER_TYPE_SCOPE", 2, "Error scope for erased receiver type");
    public static final ErrorScopeKind SCOPE_FOR_ABBREVIATION_TYPE = new ErrorScopeKind("SCOPE_FOR_ABBREVIATION_TYPE", 3, "Scope for abbreviation %s");
    public static final ErrorScopeKind STUB_TYPE_SCOPE = new ErrorScopeKind("STUB_TYPE_SCOPE", 4, "Scope for stub type %s");
    public static final ErrorScopeKind NON_CLASSIFIER_SUPER_TYPE_SCOPE = new ErrorScopeKind("NON_CLASSIFIER_SUPER_TYPE_SCOPE", 5, "A scope for common supertype which is not a normal classifier");
    public static final ErrorScopeKind ERROR_TYPE_SCOPE = new ErrorScopeKind("ERROR_TYPE_SCOPE", 6, "Scope for error type %s");
    public static final ErrorScopeKind UNSUPPORTED_TYPE_SCOPE = new ErrorScopeKind("UNSUPPORTED_TYPE_SCOPE", 7, "Scope for unsupported type %s");
    public static final ErrorScopeKind SCOPE_FOR_ERROR_CLASS = new ErrorScopeKind("SCOPE_FOR_ERROR_CLASS", 8, "Error scope for class %s with arguments: %s");
    public static final ErrorScopeKind SCOPE_FOR_ERROR_RESOLUTION_CANDIDATE = new ErrorScopeKind("SCOPE_FOR_ERROR_RESOLUTION_CANDIDATE", 9, "Error resolution candidate for call %s");

    private static final /* synthetic */ ErrorScopeKind[] $values() {
        return new ErrorScopeKind[]{CAPTURED_TYPE_SCOPE, INTEGER_LITERAL_TYPE_SCOPE, ERASED_RECEIVER_TYPE_SCOPE, SCOPE_FOR_ABBREVIATION_TYPE, STUB_TYPE_SCOPE, NON_CLASSIFIER_SUPER_TYPE_SCOPE, ERROR_TYPE_SCOPE, UNSUPPORTED_TYPE_SCOPE, SCOPE_FOR_ERROR_CLASS, SCOPE_FOR_ERROR_RESOLUTION_CANDIDATE};
    }

    static {
        ErrorScopeKind[] errorScopeKindArr$values = $values();
        $VALUES = errorScopeKindArr$values;
        $ENTRIES = EnumEntriesKt.a(errorScopeKindArr$values);
    }

    private ErrorScopeKind(String str, int i5, String str2) {
        this.debugMessage = str2;
    }

    public static ErrorScopeKind valueOf(String str) {
        return (ErrorScopeKind) Enum.valueOf(ErrorScopeKind.class, str);
    }

    public static ErrorScopeKind[] values() {
        return (ErrorScopeKind[]) $VALUES.clone();
    }

    @NotNull
    public final String getDebugMessage() {
        return this.debugMessage;
    }
}
