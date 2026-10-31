package kotlin.reflect.jvm.internal.impl.resolve.constants;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.types.SimpleType;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class FloatValue extends ConstantValue<Float> {
    public FloatValue(float f11) {
        super(Float.valueOf(f11));
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public String toString() {
        return getValue().floatValue() + ".toFloat()";
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public SimpleType getType(@NotNull ModuleDescriptor module) {
        Intrinsics.g(module, "module");
        SimpleType floatType = module.getBuiltIns().getFloatType();
        Intrinsics.f(floatType, "getFloatType(...)");
        return floatType;
    }
}
