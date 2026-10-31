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

/** Uses the shared recorder capability in settings without bypassing setup or capture checks. */
public final class SettingsEligibilityPatch implements MethodPatch {
    static final String ACTIVITY="Lcom/skt/prod/dialer/activities/setting/tservice/callrecord/CallRecordSettingActivity;";
    static final Map<String,Target> TARGETS=Map.of(
        "Ltj3;->f(Lrj3;)V",new Target(20,List.of(new Gate(0x3c,0x68,0x68,0xb9,0,2,5,true,true,false))),
        ACTIVITY+"->onCreate(Landroid/os/Bundle;)V",new Target(10,List.of(
            new Gate(0x2b4,0x2de,0x2ea,0x2de,8,9,0,false,false,true),
            new Gate(0x2f4,0x31e,0x321,0x31e,8,9,0,false,false,true))),
        ACTIVITY+"->y0(Z)V",new Target(5,List.of(new Gate(0x3d,0x68,0x68,0x96,4,0,2,true,false,false))),
        "Llx0;->x(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
            new Target(32,List.of(new Gate(0x31a,0x345,0x345,0x369,1,5,8,true,false,false))));
    record Target(int registers,List<Gate> gates) {}
    record Gate(int start,int end,int supported,int unavailable,int register,int model,int zero,
                boolean loadModel,boolean clearZero,boolean jumpToSupported) {
        boolean interior(int address) { return address>start && address<end; }
    }

    public SettingsEligibilityPatch(boolean embeddedRecording) {
        if (!embeddedRecording) throw new IllegalArgumentException("Settings eligibility requires embedded recording");
    }
    @Override public String dexEntry() { return "classes3.dex"; }
    @Override public Set<String> methods() { return TARGETS.keySet(); }

    @Override public MethodImplementation implementation(Method method) {
        Target target=TARGETS.get(id(method));
        MethodImplementation body=method.getImplementation();
        if (target==null || body==null || body.getRegisterCount()!=target.registers
                || method.getAccessFlags()!=(AccessFlags.PUBLIC.getValue()|AccessFlags.FINAL.getValue()))
            throw unsupported(method);
        var code=new TreeMap<Integer,Instruction>();
        int pc=0;
        for (Instruction instruction:body.getInstructions()) { code.put(pc,instruction);pc+=instruction.getCodeUnits(); }
        for (Gate gate:target.gates) {
            pc=gate.start;
            for (Instruction expected:originalShape(gate)) {
                Instruction actual=code.get(pc);
                if (actual==null || !ConnectionEligibilityPatch.shape(actual).equals(ConnectionEligibilityPatch.shape(expected)))
                    throw unsupported(method);
                pc+=expected.getCodeUnits();
            }
            if (pc!=gate.end || !code.containsKey(gate.supported) || !code.containsKey(gate.unavailable))
                throw unsupported(method);
            // No external branch, switch case or exception boundary may enter replaced code.
            for (var entry:code.entrySet()) {
                int address=entry.getKey();Instruction instruction=entry.getValue();
                if (address>=gate.start && address<gate.end) continue;
                if (instruction instanceof OffsetInstruction branch) {
                    int destination=address+branch.getCodeOffset();
                    if (gate.interior(destination)) throw unsupported(method);
                    if (instruction.getOpcode()==Opcode.PACKED_SWITCH || instruction.getOpcode()==Opcode.SPARSE_SWITCH) {
                        if (!(code.get(destination) instanceof SwitchPayload payload)) throw unsupported(method);
                        for (SwitchElement element:payload.getSwitchElements())
                            if (gate.interior(address+element.getOffset())) throw unsupported(method);
                    }
                }
            }
            for (var block:body.getTryBlocks()) {
                if (gate.interior(block.getStartCodeAddress()) || gate.interior(block.getStartCodeAddress()+block.getCodeUnitCount()))
                    throw unsupported(method);
                for (var handler:block.getExceptionHandlers()) if (gate.interior(handler.getHandlerCodeAddress())) throw unsupported(method);
            }
        }
        var rewritten=new ArrayList<Instruction>();
        for (var entry:code.entrySet()) {
            int address=entry.getKey();boolean replaced=false;
            for (Gate gate:target.gates) {
                if (address==gate.start) {
                    rewritten.add(new ImmutableInstruction21c(Opcode.SGET_OBJECT,gate.register,new ImmutableFieldReference("Lhya;","d","Lhya;")));
                    rewritten.add(call(Opcode.INVOKE_VIRTUAL,"Lhya;","a","Z",1,gate.register));
                    rewritten.add(move(false,gate.register));
                    rewritten.add(new ImmutableInstruction21t(Opcode.IF_NEZ,gate.register,gate.supported-(gate.start+6)));
                    rewritten.add(new ImmutableInstruction20t(Opcode.GOTO_16,gate.unavailable-(gate.start+8)));
                    for (int padding=gate.start+10;padding<gate.end;padding++) rewritten.add(new ImmutableInstruction10x(Opcode.NOP));
                }
                if (address>=gate.start && address<gate.end) replaced=true;
            }
            if (!replaced) rewritten.add(entry.getValue());
        }
        // Equal footprint preserves outside code, original permissions, callbacks and catch ranges.
        return new ImmutableMethodImplementation(body.getRegisterCount(),rewritten,body.getTryBlocks(),body.getDebugItems());
    }

    static List<Instruction> originalShape(Gate gate) {
        int r=gate.register,s=gate.start;
        var shape=new ArrayList<Instruction>(List.of(
            call(Opcode.INVOKE_STATIC,"Lg92;","G","Lo1i;",0,0),move(true,r),
            call(Opcode.INVOKE_VIRTUAL,"Lo1i;","b","Z",1,r),move(false,r),
            new ImmutableInstruction21t(Opcode.IF_EQZ,r,gate.unavailable-(s+8)),
            call(Opcode.INVOKE_STATIC,"Lj8j;","a","Lj8j;",0,0),move(true,r),
            call(Opcode.INVOKE_VIRTUAL,"Lj8j;","d","Z",1,r),move(false,r),
            new ImmutableInstruction21t(Opcode.IF_NEZ,r,gate.supported-(s+18)),
            call(Opcode.INVOKE_STATIC,"Lj8j;","a","Lj8j;",0,0),move(true,r),
            call(Opcode.INVOKE_VIRTUAL,"Lj8j;","c","Z",1,r),move(false,r),
            new ImmutableInstruction21t(Opcode.IF_EQZ,r,gate.unavailable-(s+28)),
            new ImmutableInstruction21c(Opcode.SGET_OBJECT,r,new ImmutableFieldReference("Lj8j;","f","Ljava/lang/String;")),
            call(Opcode.INVOKE_VIRTUAL,"Ljava/lang/Object;","getClass","Ljava/lang/Class;",1,r)));
        int offset=35;
        if (gate.loadModel) { shape.add(new ImmutableInstruction21c(Opcode.CONST_STRING,gate.model,new ImmutableStringReference("LM-Q927L")));offset+=2; }
        if (gate.clearZero) { shape.add(new ImmutableInstruction11n(Opcode.CONST_4,gate.zero,0));offset++; }
        shape.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC,3,r,gate.model,gate.zero,0,0,
            new ImmutableMethodReference("Lkotlin/text/b;","v",List.of("Ljava/lang/String;","Ljava/lang/String;","Z"),"Z")));
        shape.add(move(false,r));
        shape.add(new ImmutableInstruction21t(Opcode.IF_NEZ,r,gate.unavailable-(s+offset+4)));
        if (gate.jumpToSupported) shape.add(new ImmutableInstruction10t(Opcode.GOTO,gate.supported-(s+offset+6)));
        return shape;
    }
    private static Instruction call(Opcode opcode,String owner,String name,String result,int count,int register) {
        return new ImmutableInstruction35c(opcode,count,register,0,0,0,0,new ImmutableMethodReference(owner,name,List.of(),result));
    }
    private static Instruction move(boolean object,int register) {
        return new ImmutableInstruction11x(object?Opcode.MOVE_RESULT_OBJECT:Opcode.MOVE_RESULT,register);
    }
    private static IllegalStateException unsupported(Method method) {
        return new IllegalStateException("Unsupported or already patched recording settings method: "+id(method));
    }
}
