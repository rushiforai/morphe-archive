package kotlin.reflect.jvm.internal.impl.types;

import kotlin.reflect.jvm.internal.impl.types.model.KotlinTypeMarker;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public abstract class AbstractTypePreparator {
    @NotNull
    public abstract KotlinTypeMarker prepareType(@NotNull KotlinTypeMarker kotlinTypeMarker);
}
