package io.github.emotionbug.patches.adot.security;

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.AccessFlags;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.debug.ImmutableLineNumber;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import org.junit.Test;
import static org.junit.Assert.*;

public class DetectionMethodPatchTest {
    private static ImmutableInstruction35c call(String owner,String name) {
        return new ImmutableInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,
            new ImmutableMethodReference(owner,name,List.of(),"Z"));
    }

    private static MethodImplementation crashState() {
        return new ImmutableMethodImplementation(2,List.of(
            call("Lyw6;","Z"),new ImmutableInstruction11x(Opcode.MOVE_RESULT,0),
            call("Lyw6;","b0"),new ImmutableInstruction11x(Opcode.MOVE_RESULT,1),
            new ImmutableInstruction21t(Opcode.IF_EQZ,1,4),
            new ImmutableInstruction22b(Opcode.OR_INT_LIT8,0,0,2),
            call("Landroid/os/Debug;","isDebuggerConnected"),new ImmutableInstruction11x(Opcode.MOVE_RESULT,1),
            new ImmutableInstruction21t(Opcode.IF_NEZ,1,10),
            call("Landroid/os/Debug;","waitingForDebugger"),new ImmutableInstruction11x(Opcode.MOVE_RESULT,1),
            new ImmutableInstruction21t(Opcode.IF_EQZ,1,3),new ImmutableInstruction10t(Opcode.GOTO,2),
            new ImmutableInstruction11x(Opcode.RETURN,0),new ImmutableInstruction22b(Opcode.OR_INT_LIT8,0,0,4),
            new ImmutableInstruction11x(Opcode.RETURN,0)),null,null);
    }

    static Map<Integer,Instruction> instructions(MethodImplementation body) {
        Map<Integer,Instruction> result=new LinkedHashMap<>();int offset=0;
        for (Instruction instruction:body.getInstructions()) {
            result.put(offset,instruction);offset+=instruction.getCodeUnits();
        }
        return result;
    }

    static int state(MethodImplementation body,boolean emulator,boolean root,boolean attached,boolean waiting) {
        Map<Integer,Instruction> code=instructions(body);
        int[] registers=new int[body.getRegisterCount()];int pc=0,result=0;
        for (int steps=0;steps<100;steps++) {
            Instruction instruction=code.get(pc);int next=pc+instruction.getCodeUnits();
            switch (instruction.getOpcode()) {
                case INVOKE_STATIC -> {
                    String name=((MethodReference)((ReferenceInstruction)instruction).getReference()).getName();
                    result=switch (name) {
                        case "Z" -> emulator?1:0;
                        case "b0" -> root?1:0;
                        case "isDebuggerConnected" -> attached?1:0;
                        case "waitingForDebugger" -> waiting?1:0;
                        default -> throw new AssertionError(name);
                    };
                }
                case MOVE_RESULT -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=result;
                case OR_INT_LIT8 -> {
                    var op=(TwoRegisterInstruction)instruction;
                    registers[op.getRegisterA()]=registers[op.getRegisterB()]|((NarrowLiteralInstruction)instruction).getNarrowLiteral();
                }
                case IF_EQZ, IF_NEZ -> {
                    boolean zero=registers[((OneRegisterInstruction)instruction).getRegisterA()]==0;
                    if (zero==(instruction.getOpcode()==Opcode.IF_EQZ)) next=pc+((OffsetInstruction)instruction).getCodeOffset();
                }
                case GOTO -> next=pc+((OffsetInstruction)instruction).getCodeOffset();
                case RETURN -> {return registers[((OneRegisterInstruction)instruction).getRegisterA()];}
                default -> throw new AssertionError(instruction.getOpcode());
            }
            pc=next;
        }
        throw new AssertionError("Nonterminating state calculation");
    }

    @Test public void rootAndEmulatorBitsSurviveAllDebuggerStates() {
        MethodImplementation original=crashState(),patched=DetectionMethodPatch.debuggerState(original);
        for (int flags=0;flags<16;flags++) {
            boolean emulator=(flags&1)!=0,root=(flags&2)!=0,attached=(flags&4)!=0,waiting=(flags&8)!=0;
            assertEquals((flags&3)|((attached||waiting)?4:0),state(original,emulator,root,attached,waiting));
            assertEquals(flags&3,state(patched,emulator,root,attached,waiting));
        }
        for (Instruction instruction:patched.getInstructions()) {
            if (instruction instanceof ReferenceInstruction reference && reference.getReference() instanceof MethodReference method)
                assertNotEquals("Landroid/os/Debug;",method.getDefiningClass());
        }
        assertEquals(29,instructions(patched).keySet().stream().mapToInt(Integer::intValue).max().orElseThrow()+1);
    }

    @Test public void hookMarkerIsNormalSemicolonAndLeafHasNoStaleHandlers() {
        var body=new ImmutableMethodImplementation(3,List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID)),null,null);
        var marker=instructions(DetectionMethodPatch.normalHookMarker(body));
        assertEquals(";",((StringReference)((ReferenceInstruction)marker.get(0)).getReference()).getString());
        assertEquals(Opcode.RETURN_OBJECT,marker.get(3).getOpcode());
        var zero=DetectionMethodPatch.returnZero(body);
        assertEquals(0,((NarrowLiteralInstruction)instructions(zero).get(0)).getNarrowLiteral());
        assertEquals(Opcode.RETURN,instructions(zero).get(1).getOpcode());
        assertEquals(3,zero.getRegisterCount());
        assertTrue(zero.getTryBlocks().isEmpty());
        assertFalse(zero.getDebugItems().iterator().hasNext());
    }

    @Test public void localFlagReplacementLeavesOtherFlagConsumersAndOffsetsIntact() {
        var field=new ImmutableFieldReference("Landroid/content/pm/ApplicationInfo;","flags","I");
        var untouched=new ImmutableInstruction22c(Opcode.IGET,2,3,field);
        var debug=new ImmutableInstruction22c(Opcode.IGET,0,1,field);
        var mask=new ImmutableInstruction22b(Opcode.AND_INT_LIT8,0,0,2);
        var lines=List.of(new ImmutableLineNumber(0,10),new ImmutableLineNumber(2,11));
        var body=new ImmutableMethodImplementation(4,List.of(untouched,debug,mask,
            new ImmutableInstruction11x(Opcode.RETURN,0)),null,lines);
        var patched=DetectionMethodPatch.zeroFlags(body,2);
        var code=instructions(patched);
        assertEquals(untouched,code.get(0));
        assertEquals(Opcode.CONST_16,code.get(2).getOpcode());
        assertEquals(0,((NarrowLiteralInstruction)code.get(2)).getNarrowLiteral());
        assertEquals(0,((OneRegisterInstruction)code.get(2)).getRegisterA());
        assertEquals(mask,code.get(4));
        assertEquals(lines,ImmutableMethodImplementation.of(patched).getDebugItems());
    }

    @Test public void developerSettingReplacementRetainsUnrelatedInstructionsAndCatches() {
        var code=new ArrayList<Instruction>();
        for (int i=0;i<24;i++) code.add(new ImmutableInstruction10x(Opcode.NOP));
        code.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC,3,0,1,2,0,0,
            new ImmutableMethodReference("Landroid/provider/Settings$Global;","getInt",
                List.of("Landroid/content/ContentResolver;","Ljava/lang/String;","I"),"I")));
        code.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT,0));
        code.add(new ImmutableInstruction11x(Opcode.RETURN,0));
        code.add(new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION,1));
        code.add(new ImmutableInstruction11x(Opcode.RETURN,0));
        var tries=List.of(new ImmutableTryBlock(0,28,List.of(new ImmutableExceptionHandler("Ljava/lang/Exception;",29))));
        var body=new ImmutableMethodImplementation(3,code,tries,List.of(new ImmutableLineNumber(28,29)));
        var patched=DetectionMethodPatch.developerSetting(body);
        var actual=instructions(patched);
        for (int offset=0;offset<24;offset++) assertEquals(code.get(offset),actual.get(offset));
        assertEquals(Opcode.CONST_16,actual.get(24).getOpcode());
        assertEquals(0,((NarrowLiteralInstruction)actual.get(24)).getNarrowLiteral());
        assertEquals(Opcode.NOP,actual.get(26).getOpcode());
        assertEquals(Opcode.NOP,actual.get(27).getOpcode());
        assertEquals(Opcode.RETURN,actual.get(28).getOpcode());
        assertEquals(tries,patched.getTryBlocks());
        assertEquals(body.getDebugItems(),patched.getDebugItems());
    }

    @Test public void guardAcceptsUnchangedCodeAfterAnotherPatchMakesTheClassMutable() {
        var body = crashState();
        var original = new ImmutableMethod("Lyw6;", "O", null, "I",
            AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), null, null,
            new ImmutableMethodImplementation(body.getRegisterCount(), body.getInstructions(), null,
                List.of(new ImmutableLineNumber(1, 100))));
        var patch = new DetectionMethodPatch("classes2.dex", "Lyw6;->O()I", DetectionMethodPatch.digest(original),
            DetectionMethodPatch::debuggerState);
        var transformed = patch.implementation(new MutableMethod(original));
        assertEquals(3, state(transformed, true, true, true, true));
    }

    @Test public void exactGuardRejectsMutationAndReapplication() {
        var original=new ImmutableMethod("Lyw6;","O",null,"I",AccessFlags.PUBLIC.getValue()|AccessFlags.STATIC.getValue(),
            null,null,crashState());
        var patch=new DetectionMethodPatch("classes2.dex","Lyw6;->O()I",DetectionMethodPatch.digest(original),
            DetectionMethodPatch::debuggerState);
        var transformed=patch.implementation(original);
        var reapply=new ImmutableMethod("Lyw6;","O",null,"I",original.getAccessFlags(),null,null,transformed);
        assertThrows(IllegalStateException.class,()->patch.implementation(reapply));
        var changedFlags=new ImmutableMethod("Lyw6;","O",null,"I",AccessFlags.STATIC.getValue(),null,null,crashState());
        assertThrows(IllegalStateException.class,()->patch.implementation(changedFlags));
        var changedBody=new ImmutableMethod("Lyw6;","O",null,"I",original.getAccessFlags(),null,null,
            new ImmutableMethodImplementation(3,crashState().getInstructions(),null,null));
        assertThrows(IllegalStateException.class,()->patch.implementation(changedBody));
    }
}
