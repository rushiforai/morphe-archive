package kotlin.reflect.jvm.internal.impl.resolve.constants;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.types.SimpleType;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class IntValue extends IntegerValueConstant<Integer> {
    public IntValue(int i5) {
        super(Integer.valueOf(i5));
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public SimpleType getType(@NotNull ModuleDescriptor module) {
        Intrinsics.g(module, "module");
        SimpleType intType = module.getBuiltIns().getIntType();
        Intrinsics.f(intType, "getIntType(...)");
        return intType;
    }
}
