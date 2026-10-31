package kotlin.reflect.jvm.internal.impl.types;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.TypeParameterDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public class ErasureProjectionComputer {
    public static /* synthetic */ TypeProjection computeProjection$default(ErasureProjectionComputer erasureProjectionComputer, TypeParameterDescriptor typeParameterDescriptor, ErasureTypeAttributes erasureTypeAttributes, TypeParameterUpperBoundEraser typeParameterUpperBoundEraser, KotlinType kotlinType, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: computeProjection");
        }
        if ((i5 & 8) != 0) {
            kotlinType = typeParameterUpperBoundEraser.getErasedUpperBound(typeParameterDescriptor, erasureTypeAttributes);
        }
        return erasureProjectionComputer.computeProjection(typeParameterDescriptor, erasureTypeAttributes, typeParameterUpperBoundEraser, kotlinType);
    }

    @NotNull
    public TypeProjection computeProjection(@NotNull TypeParameterDescriptor parameter, @NotNull ErasureTypeAttributes typeAttr, @NotNull TypeParameterUpperBoundEraser typeParameterUpperBoundEraser, @NotNull KotlinType erasedUpperBound) {
        Intrinsics.g(parameter, "parameter");
        Intrinsics.g(typeAttr, "typeAttr");
        Intrinsics.g(typeParameterUpperBoundEraser, "typeParameterUpperBoundEraser");
        Intrinsics.g(erasedUpperBound, "erasedUpperBound");
        return new TypeProjectionImpl(Variance.OUT_VARIANCE, erasedUpperBound);
    }
}
