package kotlin.reflect.jvm.internal.impl.types.error;

import ab.e0;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import kotlin.collections.EmptyList;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.PropertyDescriptor;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import kotlin.reflect.jvm.internal.impl.types.TypeConstructor;
import kotlin.reflect.jvm.internal.impl.types.TypeProjection;
import kotlin.reflect.jvm.internal.impl.types.typeUtil.TypeUtilsKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class ErrorUtils {

    @NotNull
    private static final ErrorClassDescriptor errorClass;

    @NotNull
    private static final PropertyDescriptor errorProperty;

    @NotNull
    private static final Set<PropertyDescriptor> errorPropertyGroup;

    @NotNull
    private static final KotlinType errorPropertyType;

    @NotNull
    private static final KotlinType errorTypeForLoopInSupertypes;

    @NotNull
    public static final ErrorUtils INSTANCE = new ErrorUtils();

    @NotNull
    private static final ModuleDescriptor errorModule = ErrorModuleDescriptor.INSTANCE;

    static {
        Name nameSpecial = Name.special(String.format(ErrorEntity.ERROR_CLASS.getDebugText(), Arrays.copyOf(new Object[]{"unknown class"}, 1)));
        Intrinsics.f(nameSpecial, "special(...)");
        errorClass = new ErrorClassDescriptor(nameSpecial);
        errorTypeForLoopInSupertypes = createErrorType(ErrorTypeKind.CYCLIC_SUPERTYPES, new String[0]);
        errorPropertyType = createErrorType(ErrorTypeKind.ERROR_PROPERTY_TYPE, new String[0]);
        ErrorPropertyDescriptor errorPropertyDescriptor = new ErrorPropertyDescriptor();
        errorProperty = errorPropertyDescriptor;
        errorPropertyGroup = e0.U(errorPropertyDescriptor);
    }

    private ErrorUtils() {
    }

    @JvmStatic
    @NotNull
    public static final ErrorScope createErrorScope(@NotNull ErrorScopeKind kind, @NotNull String... formatParams) {
        Intrinsics.g(kind, "kind");
        Intrinsics.g(formatParams, "formatParams");
        return createErrorScope(kind, false, (String[]) Arrays.copyOf(formatParams, formatParams.length));
    }

    @JvmStatic
    @NotNull
    public static final ErrorType createErrorType(@NotNull ErrorTypeKind kind, @NotNull String... formatParams) {
        Intrinsics.g(kind, "kind");
        Intrinsics.g(formatParams, "formatParams");
        return INSTANCE.createErrorTypeWithArguments(kind, EmptyList.f71733a, (String[]) Arrays.copyOf(formatParams, formatParams.length));
    }

    @JvmStatic
    public static final boolean isError(@Nullable DeclarationDescriptor declarationDescriptor) {
        if (declarationDescriptor == null) {
            return false;
        }
        ErrorUtils errorUtils = INSTANCE;
        return errorUtils.isErrorClass(declarationDescriptor) || errorUtils.isErrorClass(declarationDescriptor.getContainingDeclaration()) || declarationDescriptor == errorModule;
    }

    private final boolean isErrorClass(DeclarationDescriptor declarationDescriptor) {
        return declarationDescriptor instanceof ErrorClassDescriptor;
    }

    @JvmStatic
    public static final boolean isUninferredTypeVariable(@Nullable KotlinType kotlinType) {
        if (kotlinType == null) {
            return false;
        }
        TypeConstructor constructor = kotlinType.getConstructor();
        return (constructor instanceof ErrorTypeConstructor) && ((ErrorTypeConstructor) constructor).getKind() == ErrorTypeKind.UNINFERRED_TYPE_VARIABLE;
    }

    @NotNull
    public final ErrorTypeConstructor createErrorTypeConstructor(@NotNull ErrorTypeKind kind, @NotNull String... formatParams) {
        Intrinsics.g(kind, "kind");
        Intrinsics.g(formatParams, "formatParams");
        return new ErrorTypeConstructor(kind, (String[]) Arrays.copyOf(formatParams, formatParams.length));
    }

    @NotNull
    public final ErrorType createErrorTypeWithArguments(@NotNull ErrorTypeKind kind, @NotNull List<? extends TypeProjection> arguments, @NotNull String... formatParams) {
        Intrinsics.g(kind, "kind");
        Intrinsics.g(arguments, "arguments");
        Intrinsics.g(formatParams, "formatParams");
        return createErrorTypeWithArguments(kind, arguments, createErrorTypeConstructor(kind, (String[]) Arrays.copyOf(formatParams, formatParams.length)), (String[]) Arrays.copyOf(formatParams, formatParams.length));
    }

    @NotNull
    public final ErrorClassDescriptor getErrorClass() {
        return errorClass;
    }

    @NotNull
    public final ModuleDescriptor getErrorModule() {
        return errorModule;
    }

    @NotNull
    public final Set<PropertyDescriptor> getErrorPropertyGroup() {
        return errorPropertyGroup;
    }

    @NotNull
    public final KotlinType getErrorPropertyType() {
        return errorPropertyType;
    }

    @NotNull
    public final KotlinType getErrorTypeForLoopInSupertypes() {
        return errorTypeForLoopInSupertypes;
    }

    @NotNull
    public final String unresolvedTypeAsItIs(@NotNull KotlinType type) {
        Intrinsics.g(type, "type");
        TypeUtilsKt.isUnresolvedType(type);
        TypeConstructor constructor = type.getConstructor();
        Intrinsics.e(constructor, "null cannot be cast to non-null type org.jetbrains.kotlin.types.error.ErrorTypeConstructor");
        return ((ErrorTypeConstructor) constructor).getParam(0);
    }

    @JvmStatic
    @NotNull
    public static final ErrorScope createErrorScope(@NotNull ErrorScopeKind kind, boolean z11, @NotNull String... formatParams) {
        Intrinsics.g(kind, "kind");
        Intrinsics.g(formatParams, "formatParams");
        return z11 ? new ThrowingScope(kind, (String[]) Arrays.copyOf(formatParams, formatParams.length)) : new ErrorScope(kind, (String[]) Arrays.copyOf(formatParams, formatParams.length));
    }

    @NotNull
    public final ErrorType createErrorTypeWithArguments(@NotNull ErrorTypeKind kind, @NotNull List<? extends TypeProjection> arguments, @NotNull TypeConstructor typeConstructor, @NotNull String... formatParams) {
        Intrinsics.g(kind, "kind");
        Intrinsics.g(arguments, "arguments");
        Intrinsics.g(typeConstructor, "typeConstructor");
        Intrinsics.g(formatParams, "formatParams");
        return new ErrorType(typeConstructor, createErrorScope(ErrorScopeKind.ERROR_TYPE_SCOPE, typeConstructor.toString()), kind, arguments, false, (String[]) Arrays.copyOf(formatParams, formatParams.length));
    }

    @NotNull
    public final ErrorType createErrorType(@NotNull ErrorTypeKind kind, @NotNull TypeConstructor typeConstructor, @NotNull String... formatParams) {
        Intrinsics.g(kind, "kind");
        Intrinsics.g(typeConstructor, "typeConstructor");
        Intrinsics.g(formatParams, "formatParams");
        return createErrorTypeWithArguments(kind, EmptyList.f71733a, typeConstructor, (String[]) Arrays.copyOf(formatParams, formatParams.length));
    }
}
