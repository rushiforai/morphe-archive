package kotlin.reflect.jvm.internal.impl.resolve.scopes.receivers;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class ContextClassReceiver extends AbstractReceiverValue implements ImplicitContextReceiver {

    @NotNull
    private final ClassDescriptor classDescriptor;

    @Nullable
    private final Name customLabelName;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ContextClassReceiver(@NotNull ClassDescriptor classDescriptor, @NotNull KotlinType receiverType, @Nullable Name name, @Nullable ReceiverValue receiverValue) {
        super(receiverType, receiverValue);
        Intrinsics.g(classDescriptor, "classDescriptor");
        Intrinsics.g(receiverType, "receiverType");
        this.classDescriptor = classDescriptor;
        this.customLabelName = name;
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.scopes.receivers.ImplicitContextReceiver
    @Nullable
    public Name getCustomLabelName() {
        return this.customLabelName;
    }

    @NotNull
    public String toString() {
        return getType() + ": Ctx { " + this.classDescriptor + " }";
    }
}
