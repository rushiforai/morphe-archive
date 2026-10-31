package io.github.emotionbug.patches.adot.ads;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import io.github.emotionbug.patches.adot.summary.SummaryBytecodeGuard;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

/** Suppresses only the application's commercial-banner mediation and its dedicated hosts. */
public final class BannerAdsPatch implements MethodPatch {
    public static final String ID = "adot.ads.remove-banners";
    public static final String OWNER = "Lkrr;";
    public static final String CONSTRUCTOR = OWNER + "-><init>(Lof2;Llf;Ljava/lang/String;Landroidx/constraintlayout/widget/ConstraintLayout;Lmrr;)V";
    public static final String REQUEST = OWNER + "->a(Ljmd;)V";
    public static final String CLEAR = OWNER + "->c()V";
    public static final String PLACEHOLDER = OWNER + "->f(Lmrr;)V";
    public static final String REPARENT = OWNER + "->l(Landroidx/constraintlayout/widget/ConstraintLayout;)V";
    private static final String CONTAINER = "Landroidx/constraintlayout/widget/ConstraintLayout;";
    private static final Map<String, String> ORIGINALS = Map.of(
            CONSTRUCTOR, "c6d244ab48ba0595c81a5686d89d8a09621e02765a83d0219e3695919c5527ba",
            REQUEST, "21ce7159a8fcf3686ffd0abdda61082808ad68355a2dabf6a7cc9c2366dfd8cd",
            CLEAR, "77281524849b478fff71b5ac041f27ee03e3055fe6298fcabf87ed144bf33554",
            PLACEHOLDER, "d4b9c5bc8b594bcc081087f58e991b074aa97d5dba407f2141cf89d8ef176087",
            REPARENT, "6c264bad2e0d415ea73a7b9eb22f5d7c0c0bfbe9182644e68b85d2e24d14f05d");

    @Override public String dexEntry() { return "classes3.dex"; }
    @Override public Set<String> methods() { return ORIGINALS.keySet(); }

    @Override public MethodImplementation implementation(Method target) {
        String descriptor = id(target);
        MethodImplementation body = target.getImplementation();
        if (body == null || !ORIGINALS.containsKey(descriptor)
                || !ORIGINALS.get(descriptor).equals(SummaryBytecodeGuard.fingerprint(target)))
            throw new IllegalStateException("Unsupported or already patched commercial banner method: " + descriptor);
        List<Instruction> instructions = new ArrayList<>();
        body.getInstructions().forEach(instructions::add);
        if (CONSTRUCTOR.equals(descriptor)) {
            // All fields and provider lifecycle objects are initialized here. The original
            // nullable-placeholder branch targets this same gap. Later code clobbers p0.
            int cut = referenceIndex(instructions, OWNER + "->f(Lmrr;)V") + 1;
            instructions.subList(cut, instructions.size()).clear();
            instructions.add(call("c", 4));
            instructions.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
            return new ImmutableMethodImplementation(body.getRegisterCount(), instructions, body.getTryBlocks(), null);
        }
        if (REPARENT.equals(descriptor)) {
            // Hide the new dedicated host after storing it, before the original overwrites p0.
            int index = referenceIndex(instructions, OWNER + "->e:" + CONTAINER);
            while (instructions.get(index).getOpcode() != Opcode.IPUT_OBJECT) index++;
            instructions.add(index + 1, call("c", 2));
            return new ImmutableMethodImplementation(body.getRegisterCount(), instructions, body.getTryBlocks(), null);
        }
        instructions.clear();
        int registers;
        if (REQUEST.equals(descriptor)) {
            registers = 4; // v0/v1 locals; p0=v2, p1=v3.
            instructions.add(call("c", 2));
            instructions.add(new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 2, field(OWNER, "h", "Lbf;")));
            instructions.add(new ImmutableInstruction21c(Opcode.SGET_OBJECT, 1, field("Lze;", "e", "Lze;")));
            // Complete the same terminal unavailable callback used by the original no-ad path.
            instructions.add(new ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 3, 3, 0, 1, 0, 0,
                    method("Lx92;", "e", List.of("Lbf;", "Lze;"), "V")));
            hide(instructions, 2); // A caller's failure/placeholder callback may change visibility.
        } else {
            registers = CLEAR.equals(descriptor) ? 3 : 4;
            if (CLEAR.equals(descriptor)) instructions.add(call("o", 2));
            hide(instructions, 2);
        }
        instructions.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        return new ImmutableMethodImplementation(registers, instructions, null, null);
    }

    private static ImmutableInstruction35c call(String name, int receiver) {
        return new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, receiver, 0, 0, 0, 0,
                method(OWNER, name, List.of(), "V"));
    }
    private static void hide(List<Instruction> instructions, int receiver) {
        instructions.add(new ImmutableInstruction21s(Opcode.CONST_16, 1, 8));
        for (String name : List.of("e", "f")) {
            instructions.add(new ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, receiver, field(OWNER, name, CONTAINER)));
            instructions.add(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0,
                    method("Landroid/view/View;", "setVisibility", List.of("I"), "V")));
        }
    }
    private static int referenceIndex(List<Instruction> instructions, String reference) {
        for (int index = 0; index < instructions.size(); index++)
            if (instructions.get(index) instanceof ReferenceInstruction ref && reference.equals(ref.getReference().toString())) return index;
        throw new IllegalStateException("Missing original banner boundary: " + reference);
    }
}
