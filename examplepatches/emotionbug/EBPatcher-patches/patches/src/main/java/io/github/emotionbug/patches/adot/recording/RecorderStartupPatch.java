package io.github.emotionbug.patches.adot.recording;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.Label;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

/** Add an optional startup hook; only the private recorder child bypasses phone initialization. */
public final class RecorderStartupPatch implements MethodPatch {
    public static final String ID = "adot.recording.startup-permission";
    public static final String OWNER = "Lcom/skt/prod/dialer/application/ProdApplication;";
    public static final String TARGET = OWNER + "->onCreate()V";
    public static final String BOOTSTRAP = "Lio/github/emotionbug/patches/runtime/RecorderBootstrap;";
    static final int PREFIX_CODE_UNITS = 8;

    @Override public String dexEntry() { return "classes3.dex"; }
    @Override public Set<String> methods() { return Set.of(TARGET); }

    @Override public MethodImplementation implementation(Method target) {
        MethodImplementation original = target.getImplementation();
        if (!TARGET.equals(id(target)) || original == null || original.getRegisterCount() != 28
                || target.getAccessFlags() != (AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue()))
            throw unsupported();
        List<Instruction> instructions = new ArrayList<>();
        original.getInstructions().forEach(instructions::add);
        List<Instruction> entry = originalEntry();
        if (instructions.size() <= entry.size()) throw unsupported();
        for (int i = 0; i < entry.size(); i++)
            if (!ConnectionEligibilityPatch.shape(entry.get(i)).equals(ConnectionEligibilityPatch.shape(instructions.get(i))))
                throw unsupported();
        for (Instruction instruction : instructions)
            if (instruction instanceof ReferenceInstruction reference
                    && reference.getReference() instanceof MethodReference call
                    && BOOTSTRAP.equals(call.getDefiningClass())) throw unsupported();

        MutableMethodImplementation result = new MutableMethodImplementation(original);
        Label originalEntry = result.newLabelForIndex(0);
        // p0=v27. Reuse dead-at-entry v0, which the first original instruction overwrites.
        result.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 27, 1,
                method(BOOTSTRAP, "initialize", List.of("Landroid/app/Application;"), "Z")));
        result.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        result.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, originalEntry));
        result.addInstruction(3, new BuilderInstruction10x(Opcode.RETURN_VOID));
        // An even-sized prefix retains every original switch/array payload's alignment.
        result.addInstruction(4, new BuilderInstruction10x(Opcode.NOP));
        return result;
    }

    static List<Instruction> originalEntry() {
        return List.of(
                new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 0, 27),
                new ImmutableInstruction21c(Opcode.CONST_STRING, 1, new ImmutableStringReference("ProdApplication")),
                new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0,
                        method(OWNER, "j", List.of(), "V")));
    }

    private static IllegalStateException unsupported() {
        return new IllegalStateException("Unsupported or already patched application startup: " + TARGET);
    }
}
