package io.github.emotionbug.patches.adot.security;

import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.function.Function;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

/** Exact method-level guards, independent of APK signing blocks and whole-file hashes. */
final class DetectionMethodPatch implements MethodPatch {
    private final String dex, target, originalDigest;
    private final Function<MethodImplementation, MethodImplementation> transform;

    DetectionMethodPatch(String dex, String target, String originalDigest,
            Function<MethodImplementation, MethodImplementation> transform) {
        this.dex=dex;
        this.target=target;
        this.originalDigest=originalDigest;
        this.transform=transform;
    }

    @Override public String dexEntry() { return dex; }
    @Override public Set<String> methods() { return Collections.singleton(target); }

    @Override public MethodImplementation implementation(Method original) {
        if (!id(original).equals(target) || original.getImplementation()==null
                || !originalDigest.equals(digest(original))) {
            throw new IllegalStateException("Unsupported or already patched detection method: "+id(original));
        }
        return transform.apply(original.getImplementation());
    }

    // Guard executable code, catches and declarations, not debug line coordinates:
    // Morphe moves interior debug addresses when another method makes the owner mutable.
    // Only this small in-memory method is serialized, never the target DEX.
    static String digest(Method method) {
        var body = method.getImplementation();
        var executable = new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(),
            method.getReturnType(), method.getAccessFlags(), method.getAnnotations(), method.getHiddenApiRestrictions(),
            new ImmutableMethodImplementation(body.getRegisterCount(), body.getInstructions(), body.getTryBlocks(), null));
        var owner=new ImmutableClassDef(method.getDefiningClass(),0,"Ljava/lang/Object;",
            null,null,null,null,Collections.singletonList(executable));
        var pool = new DexPool(Opcodes.forApi(29));
        pool.internClass(owner);
        try {
            var data = new MemoryDataStore(4096);
            pool.writeTo(data);
            var sha256 = MessageDigest.getInstance("SHA-256");
            sha256.update(data.getBuffer(), 0, data.getSize());
            byte[] digest = sha256.digest();
            char[] hex=new char[digest.length*2];
            String digits="0123456789abcdef";
            for (int i=0;i<digest.length;i++) {
                hex[2*i]=digits.charAt((digest[i]>>>4)&15);
                hex[2*i+1]=digits.charAt(digest[i]&15);
            }
            return new String(hex);
        } catch (IOException | NoSuchAlgorithmException exception) {
            throw new IllegalStateException("Cannot validate detection method: "+id(method),exception);
        }
    }

    static MethodImplementation returnZero(MethodImplementation original) {
        return new ImmutableMethodImplementation(original.getRegisterCount(),List.of(
            new ImmutableInstruction11n(Opcode.CONST_4,0,0),
            new ImmutableInstruction11x(Opcode.RETURN,0)),null,null);
    }

    static MethodImplementation normalHookMarker(MethodImplementation original) {
        return new ImmutableMethodImplementation(original.getRegisterCount(),List.of(
            new ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO,0,new ImmutableStringReference(";")),
            new ImmutableInstruction11x(Opcode.RETURN_OBJECT,0)),null,null);
    }

    static MethodImplementation debuggerState(MethodImplementation original) {
        // Keep emulator/root producers and their branch at CU8. Its CU12 target
        // now returns those bits without calling either android.os.Debug API.
        // Retain the final return at CU28 so even the padding ends in a terminator.
        return replace(original,12,16,List.of(new ImmutableInstruction11x(Opcode.RETURN,0)));
    }

    static MethodImplementation zeroFlags(MethodImplementation original, int address) {
        Instruction flags=at(original,address);
        if (flags.getOpcode()!=Opcode.IGET) throw new IllegalStateException("Expected application flags read");
        int register=((OneRegisterInstruction)flags).getRegisterA();
        return replace(original,address,2,List.of(new ImmutableInstruction21s(Opcode.CONST_16,register,0)));
    }

    static MethodImplementation developerSetting(MethodImplementation original) {
        // CU24..27 is exactly Global.getInt(...development_settings_enabled,0)
        // plus move-result v0. Do not leave a move-result after a removed invoke.
        return replace(original,24,4,List.of(new ImmutableInstruction21s(Opcode.CONST_16,0,0)));
    }

    private static Instruction at(MethodImplementation original, int address) {
        int offset=0;
        for (Instruction instruction:original.getInstructions()) {
            if (offset==address) return instruction;
            offset+=instruction.getCodeUnits();
        }
        throw new IllegalStateException("Missing detection instruction at "+address);
    }

    private static MethodImplementation replace(MethodImplementation original, int start, int width,
            List<? extends Instruction> replacement) {
        var instructions=new ArrayList<Instruction>();
        int offset=0, removed=0, size=0;
        for (Instruction instruction:replacement) size+=instruction.getCodeUnits();
        if (size>width) throw new IllegalArgumentException("Replacement exceeds detection window");
        for (Instruction instruction:original.getInstructions()) {
            int end=offset+instruction.getCodeUnits();
            if (offset==start) {
                instructions.addAll(replacement);
                for (int padding=size;padding<width;padding++) instructions.add(new ImmutableInstruction10x(Opcode.NOP));
            }
            if (offset>=start && end<=start+width) removed+=instruction.getCodeUnits();
            else if (end>start && offset<start+width) throw new IllegalStateException("Split detection instruction");
            else instructions.add(instruction);
            offset=end;
        }
        if (removed!=width) throw new IllegalStateException("Incomplete detection window");
        // Equal CU footprint preserves all branch/payload, try-handler and debug
        // offsets; there is no mutable-builder label relocation to approximate.
        return new ImmutableMethodImplementation(original.getRegisterCount(),instructions,
            original.getTryBlocks(),original.getDebugItems());
    }
}
