package kotlin.reflect.jvm.internal.impl.resolve.constants;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.types.SimpleType;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class StringValue extends ConstantValue<String> {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public StringValue(@NotNull String value) {
        super(value);
        Intrinsics.g(value, "value");
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public String toString() {
        return c1.t(new StringBuilder("\""), getValue(), AbstractJsonLexerKt.STRING);
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public SimpleType getType(@NotNull ModuleDescriptor module) {
        Intrinsics.g(module, "module");
        SimpleType stringType = module.getBuiltIns().getStringType();
        Intrinsics.f(stringType, "getStringType(...)");
        return stringType;
    }
}
