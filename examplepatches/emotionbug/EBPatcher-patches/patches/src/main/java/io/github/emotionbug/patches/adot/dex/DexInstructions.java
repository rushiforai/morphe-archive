package io.github.emotionbug.patches.adot.dex;
import java.util.List;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.builder.BuilderInstruction;
import com.android.tools.smali.dexlib2.builder.instruction.*;


public final class DexInstructions {
    public static String id(MethodReference m) {
        return m.getDefiningClass()+"->"+m.getName()+"("+String.join("", m.getParameterTypes())+")"+m.getReturnType();
    }
    public static ImmutableMethodReference method(String cls, String name, List<String> args, String ret) {
        return new ImmutableMethodReference(cls, name, args, ret);
    }
    public static ImmutableFieldReference field(String cls, String name, String type) {
        return new ImmutableFieldReference(cls, name, type);
    }
    public static BuilderInstruction invoke(Opcode op, int count, int r, MethodReference ref) {
        return new BuilderInstruction35c(op, count, r, 0, 0, 0, 0, ref);
    }
    public static BuilderInstruction string(int r, String value) {
        // Jumbo prevents overflow if the rebuilt string pool moves this string above 65535.
        return new BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, r, new ImmutableStringReference(value));
    }
}
