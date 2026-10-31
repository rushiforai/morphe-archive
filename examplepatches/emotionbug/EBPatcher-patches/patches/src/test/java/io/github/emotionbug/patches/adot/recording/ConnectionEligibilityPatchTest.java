package io.github.emotionbug.patches.adot.recording;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.debug.ImmutableLineNumber;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

public class ConnectionEligibilityPatchTest {
    private final ConnectionEligibilityPatch patch=new ConnectionEligibilityPatch(true);

    private static Method method(MethodImplementation body) {
        return new ImmutableMethod("Lac0;","i",List.of(
            new ImmutableMethodParameter("Lehq;",Set.of(),null),
            new ImmutableMethodParameter("Lqqa;",Set.of(),null),
            new ImmutableMethodParameter("Lf58;",Set.of(),null)),"Ljava/lang/Object;",
            AccessFlags.PUBLIC.getValue()|AccessFlags.FINAL.getValue(),Set.of(),Set.of(),body);
    }
    private static MethodImplementation fixture() {
        var instructions=new ArrayList<Instruction>();
        for (int pc=0;pc<0x91;pc++) instructions.add(new ImmutableInstruction10x(Opcode.NOP));
        instructions.addAll(ConnectionEligibilityPatch.originalShape());
        instructions.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT,0));
        return new ImmutableMethodImplementation(31,instructions,
            List.of(new ImmutableTryBlock(0,1,List.of(new ImmutableExceptionHandler(null,0xda)))),
            List.of(new ImmutableLineNumber(0x91,146),new ImmutableLineNumber(0xa1,162),
                new ImmutableLineNumber(0xcd,206),new ImmutableLineNumber(0xd6,215)));
    }
    private static TreeMap<Integer,Instruction> code(MethodImplementation body) {
        var code=new TreeMap<Integer,Instruction>();int pc=0;
        for (Instruction instruction:body.getInstructions()) {code.put(pc,instruction);pc+=instruction.getCodeUnits();}
        return code;
    }
    private record Inputs(boolean acknowledged,boolean installed,boolean sharedSupport,
                          boolean samsung,boolean lg,String model) {}
    private record Outcome(String state,int sharedCalls) {}

    // Execute actual instruction operands/branches. Only external capability and OEM
    // APIs are supplied as inputs; stop at the real continuation, never fake account,
    // permission, network or recording success. The warning path executes its return.
    private static Outcome execute(MethodImplementation body,Inputs inputs) {
        var instructions=code(body);Object[] registers=new Object[31];
        registers[8]=0;registers[11]="state";
        Object result=null;int pc=0x91,sharedCalls=0;
        for (int steps=0;steps<100;steps++) {
            if (pc==0xd6) return new Outcome("phone-account-continuation",sharedCalls);
            Instruction instruction=instructions.get(pc);assertNotNull("Invalid PC "+pc,instruction);
            int next=pc+instruction.getCodeUnits();
            switch (instruction.getOpcode()) {
                case IGET_BOOLEAN -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=inputs.acknowledged?1:0;
                case SGET_OBJECT -> {
                    FieldReference field=(FieldReference)((ReferenceInstruction)instruction).getReference();
                    registers[((OneRegisterInstruction)instruction).getRegisterA()]=switch(field.getDefiningClass()) {
                        case "Lj8j;" -> inputs.model;
                        case "Lnm9;" -> "warning";
                        default -> field.getDefiningClass();
                    };
                }
                case INVOKE_STATIC, INVOKE_VIRTUAL -> {
                    var call=(MethodReference)((ReferenceInstruction)instruction).getReference();
                    String target=call.getDefiningClass()+"->"+call.getName();
                    result=switch(target) {
                        case "Lg92;->G" -> "installed-provider";
                        case "Lo1i;->b" -> inputs.installed?1:0;
                        case "Lj8j;->a" -> "manufacturer-provider";
                        case "Lj8j;->d" -> inputs.samsung?1:0;
                        case "Lj8j;->c" -> inputs.lg?1:0;
                        case "Ljava/lang/Object;->getClass" -> {assertNotNull(registers[0]);yield "class";}
                        case "Lkotlin/text/b;->v" -> Objects.equals(registers[0],registers[1])?1:0;
                        case "Lhya;->a" -> {
                            assertEquals(Opcode.INVOKE_VIRTUAL,instruction.getOpcode());
                            var invoke=(FiveRegisterInstruction)instruction;
                            assertEquals(1,invoke.getRegisterCount());
                            assertEquals("Lhya;",registers[invoke.getRegisterC()]);
                            sharedCalls++;yield inputs.sharedSupport?1:0;
                        }
                        case "Lehq;->b" -> {assertEquals("warning",registers[0]);assertEquals(14,registers[1]);yield "warning-state";}
                        default -> throw new AssertionError("Unexpected external call "+target);
                    };
                }
                case MOVE_RESULT, MOVE_RESULT_OBJECT -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=result;
                case CONST_STRING -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=((StringReference)((ReferenceInstruction)instruction).getReference()).getString();
                case CONST_16 -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=((NarrowLiteralInstruction)instruction).getNarrowLiteral();
                case IF_EQZ, IF_NEZ -> {
                    boolean zero=Objects.equals(0,registers[((OneRegisterInstruction)instruction).getRegisterA()]);
                    if (zero==(instruction.getOpcode()==Opcode.IF_EQZ)) next=pc+((OffsetInstruction)instruction).getCodeOffset();
                }
                case GOTO, GOTO_16 -> next=pc+((OffsetInstruction)instruction).getCodeOffset();
                case RETURN_OBJECT -> {return new Outcome((String)registers[((OneRegisterInstruction)instruction).getRegisterA()],sharedCalls);}
                case NOP -> {}
                default -> throw new AssertionError("Unexpected instruction "+instruction.getOpcode());
            }
            pc=next;
        }
        throw new AssertionError("Nonterminating eligibility gate");
    }
    private void verifyBehavior(Method original) {
        MethodImplementation before=original.getImplementation(),after=patch.implementation(original);
        // Full cross-product includes OEMs, excluded LG model, acknowledgement,
        // installation absent and independently false shared support.
        for (int bits=0;bits<64;bits++) {
            var inputs=new Inputs((bits&1)!=0,(bits&2)!=0,(bits&4)!=0,
                (bits&8)!=0,(bits&16)!=0,(bits&32)!=0?"LM-Q927L":"other");
            boolean gate=!inputs.acknowledged&&inputs.installed;
            boolean oldSupport=inputs.samsung||(inputs.lg&&!inputs.model.equals("LM-Q927L"));
            assertEquals(new Outcome(gate&&!oldSupport?"warning-state":"phone-account-continuation",0),execute(before,inputs));
            assertEquals(new Outcome(gate&&!inputs.sharedSupport?"warning-state":"phone-account-continuation",gate?1:0),execute(after,inputs));
        }
        var oldCode=code(before);var newCode=code(after);
        assertEquals(oldCode.lastKey(),newCode.lastKey());
        for (var entry:oldCode.entrySet()) if (entry.getKey()<0xa1||entry.getKey()>=0xcd)
            assertEquals("Changed outside rewrite at "+entry.getKey(),ConnectionEligibilityPatch.shape(entry.getValue()),
                ConnectionEligibilityPatch.shape(newCode.get(entry.getKey())));
        assertEquals(metadata(before),metadata(after));
        assertThrows(IllegalStateException.class,()->patch.implementation(method(after)));
    }
    @Test public void originalOemRejectionBecomesSharedCapabilityDecision() {verifyBehavior(method(fixture()));}

    private static List<String> metadata(MethodImplementation body) {
        var result=new ArrayList<String>();
        for (var block:body.getTryBlocks()) {
            result.add("try:"+block.getStartCodeAddress()+":"+block.getCodeUnitCount());
            for (var handler:block.getExceptionHandlers())
                result.add("catch:"+handler.getExceptionType()+":"+handler.getHandlerCodeAddress());
        }
        for (var debug:body.getDebugItems()) {
            String item="debug:"+debug.getDebugItemType()+":"+debug.getCodeAddress();
            if (debug instanceof com.android.tools.smali.dexlib2.iface.debug.LineNumber line) item+=":"+line.getLineNumber();
            if (debug instanceof com.android.tools.smali.dexlib2.iface.debug.LocalInfo local)
                item+=":"+local.getName()+":"+local.getType()+":"+local.getSignature();
            if (debug instanceof com.android.tools.smali.dexlib2.iface.debug.StartLocal local) item+=":"+local.getRegister();
            if (debug instanceof com.android.tools.smali.dexlib2.iface.debug.EndLocal local) item+=":"+local.getRegister();
            if (debug instanceof com.android.tools.smali.dexlib2.iface.debug.RestartLocal local) item+=":"+local.getRegister();
            if (debug instanceof com.android.tools.smali.dexlib2.iface.debug.SetSourceFile source) item+=":"+source.getSourceFile();
            result.add(item);
        }
        return result;
    }

    @Test public void missingEmbeddedRecorderAndChangedOperandsFailClosed() {
        assertThrows(IllegalArgumentException.class,()->new ConnectionEligibilityPatch(false));
        var body=fixture();var instructions=new ArrayList<Instruction>();int pc=0;
        for (Instruction instruction:body.getInstructions()) {
            instructions.add(pc==0xa9?new ImmutableInstruction21t(Opcode.IF_EQZ,1,0xcd-0xa9):instruction);
            pc+=instruction.getCodeUnits();
        }
        assertThrows(IllegalStateException.class,()->patch.implementation(method(new ImmutableMethodImplementation(31,instructions,null,null))));
    }
    @Test public void incomingBranchesAndExceptionHandlersCannotEnterRemovedGate() {
        var body=fixture();var instructions=new ArrayList<Instruction>();body.getInstructions().forEach(instructions::add);
        // A three-CU branch replaces three NOPs, retaining the guarded window address.
        instructions.subList(0,3).clear();instructions.add(0,new ImmutableInstruction30t(Opcode.GOTO_32,0xab));
        assertThrows(IllegalStateException.class,()->patch.implementation(method(new ImmutableMethodImplementation(31,instructions,null,null))));
        assertThrows(IllegalStateException.class,()->patch.implementation(method(new ImmutableMethodImplementation(31,body.getInstructions(),
            List.of(new ImmutableTryBlock(0,1,List.of(new ImmutableExceptionHandler(null,0xab)))),null))));
    }
    @Test public void privateOriginalApkExecutesSameRegressionMatrix() throws Exception {
        String path=System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK",path!=null);
        var container=DexFileFactory.loadDexContainer(new File(path),Opcodes.getDefault());
        var dex=container.getEntry("classes3.dex");assertNotNull(dex);
        for (var owner:dex.getDexFile().getClasses()) if (owner.getType().equals("Lac0;"))
            for (Method method:owner.getMethods()) if (id(method).equals(ConnectionEligibilityPatch.TARGET)) {verifyBehavior(method);return;}
        fail("Missing "+ConnectionEligibilityPatch.TARGET);
    }
}
