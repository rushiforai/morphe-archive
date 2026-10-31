package kotlin.reflect.jvm.internal.impl.types.typesApproximation;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.TypeParameterDescriptor;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import kotlin.reflect.jvm.internal.impl.types.checker.KotlinTypeChecker;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
final class TypeArgument {

    @NotNull
    private final KotlinType inProjection;

    @NotNull
    private final KotlinType outProjection;

    @NotNull
    private final TypeParameterDescriptor typeParameter;

    public TypeArgument(@NotNull TypeParameterDescriptor typeParameter, @NotNull KotlinType inProjection, @NotNull KotlinType outProjection) {
        Intrinsics.g(typeParameter, "typeParameter");
        Intrinsics.g(inProjection, "inProjection");
        Intrinsics.g(outProjection, "outProjection");
        this.typeParameter = typeParameter;
        this.inProjection = inProjection;
        this.outProjection = outProjection;
    }

    @NotNull
    public final KotlinType getInProjection() {
        return this.inProjection;
    }

    @NotNull
    public final KotlinType getOutProjection() {
        return this.outProjection;
    }

    @NotNull
    public final TypeParameterDescriptor getTypeParameter() {
        return this.typeParameter;
    }

    public final boolean isConsistent() {
        return KotlinTypeChecker.DEFAULT.isSubtypeOf(this.inProjection, this.outProjection);
    }
}
