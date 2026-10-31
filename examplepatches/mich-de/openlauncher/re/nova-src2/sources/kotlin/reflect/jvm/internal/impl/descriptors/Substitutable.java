package kotlin.reflect.jvm.internal.impl.descriptors;

import kotlin.reflect.jvm.internal.impl.descriptors.DeclarationDescriptorNonRoot;
import kotlin.reflect.jvm.internal.impl.types.TypeSubstitutor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public interface Substitutable<T extends DeclarationDescriptorNonRoot> {
    @NotNull
    T substitute(@NotNull TypeSubstitutor typeSubstitutor);
}
