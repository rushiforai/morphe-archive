package kotlin.reflect.jvm.internal.impl.resolve.constants;

import java.util.List;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.builtins.KotlinBuiltIns;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public class ArrayValue extends ConstantValue<List<? extends ConstantValue<?>>> {

    @NotNull
    private final Function1<ModuleDescriptor, KotlinType> computeType;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public ArrayValue(@NotNull List<? extends ConstantValue<?>> value, @NotNull Function1<? super ModuleDescriptor, ? extends KotlinType> computeType) {
        super(value);
        Intrinsics.g(value, "value");
        Intrinsics.g(computeType, "computeType");
        this.computeType = computeType;
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public KotlinType getType(@NotNull ModuleDescriptor module) {
        Intrinsics.g(module, "module");
        KotlinType kotlinType = (KotlinType) this.computeType.invoke(module);
        if (!KotlinBuiltIns.isArray(kotlinType) && !KotlinBuiltIns.isPrimitiveArray(kotlinType)) {
            KotlinBuiltIns.isUnsignedArrayType(kotlinType);
        }
        return kotlinType;
    }
}
