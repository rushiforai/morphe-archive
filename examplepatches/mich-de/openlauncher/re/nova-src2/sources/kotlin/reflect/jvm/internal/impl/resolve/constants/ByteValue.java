package kotlin.reflect.jvm.internal.impl.resolve.constants;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.types.SimpleType;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class ByteValue extends IntegerValueConstant<Byte> {
    public ByteValue(byte b11) {
        super(Byte.valueOf(b11));
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public String toString() {
        return getValue().intValue() + ".toByte()";
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public SimpleType getType(@NotNull ModuleDescriptor module) {
        Intrinsics.g(module, "module");
        SimpleType byteType = module.getBuiltIns().getByteType();
        Intrinsics.f(byteType, "getByteType(...)");
        return byteType;
    }
}
