package kotlin.reflect.jvm.internal.impl.resolve;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.CallableMemberDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public abstract class NonReportingOverrideStrategy extends OverridingStrategy {
    public abstract void conflict(@NotNull CallableMemberDescriptor callableMemberDescriptor, @NotNull CallableMemberDescriptor callableMemberDescriptor2);

    @Override // kotlin.reflect.jvm.internal.impl.resolve.OverridingStrategy
    public void inheritanceConflict(@NotNull CallableMemberDescriptor first, @NotNull CallableMemberDescriptor second) {
        Intrinsics.g(first, "first");
        Intrinsics.g(second, "second");
        conflict(first, second);
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.OverridingStrategy
    public void overrideConflict(@NotNull CallableMemberDescriptor fromSuper, @NotNull CallableMemberDescriptor fromCurrent) {
        Intrinsics.g(fromSuper, "fromSuper");
        Intrinsics.g(fromCurrent, "fromCurrent");
        conflict(fromSuper, fromCurrent);
    }
}
