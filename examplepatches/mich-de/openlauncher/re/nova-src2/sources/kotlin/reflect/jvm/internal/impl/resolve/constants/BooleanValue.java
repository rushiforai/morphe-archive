package kotlin.reflect.jvm.internal.impl.resolve.constants;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.types.SimpleType;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class BooleanValue extends ConstantValue<Boolean> {
    public BooleanValue(boolean z11) {
        super(Boolean.valueOf(z11));
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public SimpleType getType(@NotNull ModuleDescriptor module) {
        Intrinsics.g(module, "module");
        SimpleType booleanType = module.getBuiltIns().getBooleanType();
        Intrinsics.f(booleanType, "getBooleanType(...)");
        return booleanType;
    }
}
