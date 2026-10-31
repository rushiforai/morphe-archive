package kotlin.reflect.jvm.internal.impl.types;

import kotlin.reflect.jvm.internal.impl.types.checker.KotlinTypeRefiner;
import kotlin.reflect.jvm.internal.impl.types.model.TypeArgumentMarker;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public interface TypeProjection extends TypeArgumentMarker {
    @NotNull
    Variance getProjectionKind();

    @NotNull
    KotlinType getType();

    boolean isStarProjection();

    @NotNull
    TypeProjection refine(@NotNull KotlinTypeRefiner kotlinTypeRefiner);
}
