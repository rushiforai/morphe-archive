package io.github.emotionbug.patches.adot.recording;

import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.util.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

/** Delegates the connection screen's duplicated OEM gate to the shared capability predicate. */
public final class ConnectionEligibilityPatch implements MethodPatch {
    public static final String ID="adot.recording.connection-eligibility";
    public static final String TARGET="Lac0;->i(Lehq;Lqqa;Lf58;)Ljava/lang/Object;";
    static final int START=0xa1, END=0xcd;

    /** This recipe must only accompany the embedded recorder and shared support patch. */
    public ConnectionEligibilityPatch(boolean embeddedRecording) {
        if (!embeddedRecording) throw new IllegalArgumentException("Connection eligibility requires embedded recording");
    }
    @Override public String dexEntry() { return "classes3.dex"; }
    @Override public Set<String> methods() { return Set.of(TARGET); }

    @Override public MethodImplementation implementation(Method method) {
        MethodImplementation body=method.getImplementation();
        if (!TARGET.equals(id(method)) || body==null || body.getRegisterCount()!=31
                || method.getAccessFlags()!=(AccessFlags.PUBLIC.getValue()|AccessFlags.FINAL.getValue()))
            throw unsupported();
        var code=new TreeMap<Integer,Instruction>();
        int pc=0;
        for (Instruction instruction:body.getInstructions()) {
            code.put(pc,instruction);pc+=instruction.getCodeUnits();
        }
        // Exact operands, references and branch destinations, including acknowledgement,
        // outer installation gate, warning fallback and real phone/account continuation.
        pc=0x91;
        for (Instruction expected:originalShape()) {
            Instruction actual=code.get(pc);
            if (actual==null || !shape(actual).equals(shape(expected))) throw unsupported();
            pc+=expected.getCodeUnits();
        }
        // No other path may enter a removed instruction. Switch offsets are relative
        // to their switch instruction, not the payload. Exception entries are checked too.
        for (var entry:code.entrySet()) {
            int address=entry.getKey();Instruction instruction=entry.getValue();
            if (address>=START && address<END) continue;
            if (instruction instanceof OffsetInstruction branch) {
                int target=address+branch.getCodeOffset();
                if (interior(target)) throw unsupported();
                if (instruction.getOpcode()==Opcode.PACKED_SWITCH || instruction.getOpcode()==Opcode.SPARSE_SWITCH) {
                    if (!(code.get(target) instanceof SwitchPayload payload)) throw unsupported();
                    for (SwitchElement element:payload.getSwitchElements())
                        if (interior(address+element.getOffset())) throw unsupported();
                }
            }
        }
        for (var block:body.getTryBlocks()) {
            if (interior(block.getStartCodeAddress()) || interior(block.getStartCodeAddress()+block.getCodeUnitCount())) throw unsupported();
            for (var handler:block.getExceptionHandlers())
                if (interior(handler.getHandlerCodeAddress())) throw unsupported();
        }
        var rewritten=new ArrayList<Instruction>();
        for (var entry:code.entrySet()) {
            int address=entry.getKey();
            if (address==START) {
                rewritten.add(field("Lhya;","d","Lhya;")); // CU a1
                rewritten.add(call(Opcode.INVOKE_VIRTUAL,"Lhya;","a","Z",1)); // CU a3
                rewritten.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT,0)); // CU a6
                rewritten.add(new ImmutableInstruction21t(Opcode.IF_NEZ,0,0xd6-0xa7));
                rewritten.add(new ImmutableInstruction20t(Opcode.GOTO_16,END-0xa9));
                for (int padding=0xab;padding<END;padding++) rewritten.add(new ImmutableInstruction10x(Opcode.NOP));
            }
            if (address<START || address>=END) rewritten.add(entry.getValue());
        }
        // Identical footprint: all outside instructions, branches, catches, payloads,
        // and debug positions retain their original code-unit addresses.
        return new ImmutableMethodImplementation(body.getRegisterCount(),rewritten,body.getTryBlocks(),body.getDebugItems());
    }

    private static boolean interior(int address) { return address>START && address<END; }
    private static IllegalStateException unsupported() {
        return new IllegalStateException("Unsupported or already patched connection eligibility method: "+TARGET);
    }
    private static Instruction field(String owner,String name,String type) {
        return new ImmutableInstruction21c(Opcode.SGET_OBJECT,0,new ImmutableFieldReference(owner,name,type));
    }
    private static Instruction call(Opcode opcode,String owner,String name,String result,int count) {
        return new ImmutableInstruction35c(opcode,count,0,0,0,0,0,new ImmutableMethodReference(owner,name,List.of(),result));
    }
    private static Instruction move(boolean object) {
        return new ImmutableInstruction11x(object?Opcode.MOVE_RESULT_OBJECT:Opcode.MOVE_RESULT,0);
    }
    // Package-private fixture also permits executing exactly the guarded original DEX
    // instruction stream in unit tests, rather than modelling the desired result only.
    static List<Instruction> originalShape() {
        return List.of(
            new ImmutableInstruction22c(Opcode.IGET_BOOLEAN,0,11,new ImmutableFieldReference("Lehq;","e","Z")),
            new ImmutableInstruction21t(Opcode.IF_NEZ,0,0xd6-0x93),
            field("Lo1i;","c","Ljava/util/List;"),
            call(Opcode.INVOKE_STATIC,"Lg92;","G","Lo1i;",0),move(true),
            call(Opcode.INVOKE_VIRTUAL,"Lo1i;","b","Z",1),move(false),
            new ImmutableInstruction21t(Opcode.IF_EQZ,0,0xd6-0x9f),
            call(Opcode.INVOKE_STATIC,"Lg92;","G","Lo1i;",0),move(true),
            call(Opcode.INVOKE_VIRTUAL,"Lo1i;","b","Z",1),move(false),
            new ImmutableInstruction21t(Opcode.IF_EQZ,0,0xcd-0xa9),
            call(Opcode.INVOKE_STATIC,"Lj8j;","a","Lj8j;",0),move(true),
            call(Opcode.INVOKE_VIRTUAL,"Lj8j;","d","Z",1),move(false),
            new ImmutableInstruction21t(Opcode.IF_NEZ,0,0xd6-0xb3),
            call(Opcode.INVOKE_STATIC,"Lj8j;","a","Lj8j;",0),move(true),
            call(Opcode.INVOKE_VIRTUAL,"Lj8j;","c","Z",1),move(false),
            new ImmutableInstruction21t(Opcode.IF_EQZ,0,0xcd-0xbd),
            field("Lj8j;","f","Ljava/lang/String;"),
            call(Opcode.INVOKE_VIRTUAL,"Ljava/lang/Object;","getClass","Ljava/lang/Class;",1),
            new ImmutableInstruction21c(Opcode.CONST_STRING,1,new ImmutableStringReference("LM-Q927L")),
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC,3,0,1,8,0,0,new ImmutableMethodReference("Lkotlin/text/b;","v",List.of("Ljava/lang/String;","Ljava/lang/String;","Z"),"Z")),
            move(false),new ImmutableInstruction21t(Opcode.IF_NEZ,0,0xcd-0xca),
            new ImmutableInstruction10t(Opcode.GOTO,0xd6-0xcc),
            field("Lnm9;","a","Lnm9;"),new ImmutableInstruction21s(Opcode.CONST_16,1,14),
            new ImmutableInstruction35c(Opcode.INVOKE_STATIC,3,11,0,1,0,0,new ImmutableMethodReference("Lehq;","b",List.of("Lehq;","Lyo9;","I"),"Lehq;")),
            move(true),new ImmutableInstruction11x(Opcode.RETURN_OBJECT,0),
            new ImmutableInstruction21c(Opcode.NEW_INSTANCE,0,new ImmutableTypeReference("Lzn9;")),
            new ImmutableInstruction22c(Opcode.IGET_OBJECT,1,11,new ImmutableFieldReference("Lehq;","c","Ljava/lang/String;")));
    }
    static String shape(Instruction instruction) {
        StringBuilder key=new StringBuilder(instruction.getOpcode().name()).append(':').append(instruction.getCodeUnits());
        if (instruction instanceof OneRegisterInstruction r) key.append("/a").append(r.getRegisterA());
        if (instruction instanceof TwoRegisterInstruction r) key.append("/b").append(r.getRegisterB());
        if (instruction instanceof FiveRegisterInstruction r) key.append("/n").append(r.getRegisterCount()).append('/').append(r.getRegisterC()).append('/').append(r.getRegisterD()).append('/').append(r.getRegisterE()).append('/').append(r.getRegisterF()).append('/').append(r.getRegisterG());
        if (instruction instanceof NarrowLiteralInstruction literal) key.append("/l").append(literal.getNarrowLiteral());
        if (instruction instanceof OffsetInstruction branch) key.append("/o").append(branch.getCodeOffset());
        if (instruction instanceof ReferenceInstruction reference) key.append("/r").append(reference.getReference());
        return key.toString();
    }
}
