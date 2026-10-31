package kotlin.reflect.jvm.internal.impl.resolve.constants;

import java.util.List;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.types.KotlinType;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class TypedArrayValue extends ArrayValue {

    @NotNull
    private final KotlinType type;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public TypedArrayValue(@NotNull List<? extends ConstantValue<?>> value, @NotNull final KotlinType type) {
        super(value, new Function1<ModuleDescriptor, KotlinType>() { // from class: kotlin.reflect.jvm.internal.impl.resolve.constants.TypedArrayValue.1
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            @NotNull
            public final KotlinType invoke(@NotNull ModuleDescriptor it) {
                Intrinsics.g(it, "it");
                return type;
            }
        });
        Intrinsics.g(value, "value");
        Intrinsics.g(type, "type");
        this.type = type;
    }

    @NotNull
    public final KotlinType getType() {
        return this.type;
    }
}
