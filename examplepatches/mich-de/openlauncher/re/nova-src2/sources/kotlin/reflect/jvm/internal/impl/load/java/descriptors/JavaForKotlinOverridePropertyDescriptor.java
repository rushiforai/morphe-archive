package kotlin.reflect.jvm.internal.impl.load.java.descriptors;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.CallableMemberDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.PropertyDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.SimpleFunctionDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.annotations.Annotations;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class JavaForKotlinOverridePropertyDescriptor extends JavaPropertyDescriptor {

    @NotNull
    private final SimpleFunctionDescriptor getterMethod;

    @NotNull
    private final PropertyDescriptor overriddenProperty;

    @Nullable
    private final SimpleFunctionDescriptor setterMethod;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public JavaForKotlinOverridePropertyDescriptor(@NotNull ClassDescriptor ownerDescriptor, @NotNull SimpleFunctionDescriptor getterMethod, @Nullable SimpleFunctionDescriptor simpleFunctionDescriptor, @NotNull PropertyDescriptor overriddenProperty) {
        super(ownerDescriptor, Annotations.Companion.getEMPTY(), getterMethod.getModality(), getterMethod.getVisibility(), simpleFunctionDescriptor != null, overriddenProperty.getName(), getterMethod.getSource(), null, CallableMemberDescriptor.Kind.DECLARATION, false, null);
        Intrinsics.g(ownerDescriptor, "ownerDescriptor");
        Intrinsics.g(getterMethod, "getterMethod");
        Intrinsics.g(overriddenProperty, "overriddenProperty");
        this.getterMethod = getterMethod;
        this.setterMethod = simpleFunctionDescriptor;
        this.overriddenProperty = overriddenProperty;
    }
}
