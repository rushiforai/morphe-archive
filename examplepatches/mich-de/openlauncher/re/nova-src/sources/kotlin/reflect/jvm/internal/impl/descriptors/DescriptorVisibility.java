package kotlin.reflect.jvm.internal.impl.descriptors;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.resolve.scopes.receivers.ReceiverValue;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public abstract class DescriptorVisibility {
    @Nullable
    public final Integer compareTo(@NotNull DescriptorVisibility visibility) {
        Intrinsics.g(visibility, "visibility");
        return getDelegate().compareTo(visibility.getDelegate());
    }

    @NotNull
    public abstract Visibility getDelegate();

    @NotNull
    public abstract String getInternalDisplayName();

    public final boolean isPublicAPI() {
        return getDelegate().isPublicAPI();
    }

    public abstract boolean isVisible(@Nullable ReceiverValue receiverValue, @NotNull DeclarationDescriptorWithVisibility declarationDescriptorWithVisibility, @NotNull DeclarationDescriptor declarationDescriptor, boolean z11);

    @NotNull
    public abstract DescriptorVisibility normalize();

    @NotNull
    public final String toString() {
        return getDelegate().toString();
    }
}
