package kotlin.reflect.jvm.internal.impl.resolve.constants;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.types.SimpleType;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class CharValue extends IntegerValueConstant<Character> {
    public CharValue(char c11) {
        super(Character.valueOf(c11));
    }

    private final String getPrintablePart(char c11) {
        return c11 == '\b' ? "\\b" : c11 == '\t' ? "\\t" : c11 == '\n' ? "\\n" : c11 == '\f' ? "\\f" : c11 == '\r' ? "\\r" : isPrintableUnicode(c11) ? String.valueOf(c11) : "?";
    }

    private final boolean isPrintableUnicode(char c11) {
        byte type = (byte) Character.getType(c11);
        return (type == 0 || type == 13 || type == 14 || type == 15 || type == 16 || type == 18 || type == 19) ? false : true;
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public String toString() {
        return String.format("\\u%04X ('%s')", Arrays.copyOf(new Object[]{Integer.valueOf(getValue().charValue()), getPrintablePart(getValue().charValue())}, 2));
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.constants.ConstantValue
    @NotNull
    public SimpleType getType(@NotNull ModuleDescriptor module) {
        Intrinsics.g(module, "module");
        SimpleType charType = module.getBuiltIns().getCharType();
        Intrinsics.f(charType, "getCharType(...)");
        return charType;
    }
}
