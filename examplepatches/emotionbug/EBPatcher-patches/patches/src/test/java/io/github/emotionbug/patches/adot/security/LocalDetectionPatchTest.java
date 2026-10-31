package io.github.emotionbug.patches.adot.security;

import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;
import static io.github.emotionbug.patches.adot.security.DetectionMethodPatchTest.instructions;

/** Opt-in original APK fixture; parses bytecode only, never loads vendor classes. */
public class LocalDetectionPatchTest {
    private final Map<String,Method> methods=new HashMap<>();
    private final Map<String,String> entries=new HashMap<>();
    private final Map<String,MethodImplementation> patched=new HashMap<>();

    @Before public void loadOriginal() throws Exception {
        String path=System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide a private original APK via EBPATCHER_TEST_APK",path!=null);
        var dex=DexFileFactory.loadDexContainer(new File(path),Opcodes.getDefault());
        for (String name:List.of("classes.dex","classes2.dex")) {
            for (var cls:dex.getEntry(name).getDexFile().getClasses()) {
                for (Method method:cls.getMethods()) {methods.put(id(method),method);entries.put(id(method),name);}
            }
        }
        var recipes=new ArrayList<MethodPatch>(DebuggerDetectionPatch.create());
        recipes.addAll(UsbDebuggingDetectionPatch.create());
        for (MethodPatch recipe:recipes) for (String target:recipe.methods()) {
            Method original=methods.get(target);assertNotNull(target,original);
            assertEquals(recipe.dexEntry(),entries.get(target));
            var body=recipe.implementation(original);
            assertNull("Overlapping detector recipes",patched.put(target,body));
            var changed=copy(original,body);
            assertThrows("Reapplication must reject "+target,IllegalStateException.class,()->recipe.implementation(changed));
        }
        assertEquals(13,patched.size());
    }

    private static Method copy(Method method,MethodImplementation body) {
        return new ImmutableMethod(method.getDefiningClass(),method.getName(),method.getParameters(),method.getReturnType(),
            method.getAccessFlags(),method.getAnnotations(),method.getHiddenApiRestrictions(),body);
    }

    @Test public void actualDebuggerStateRetainsRootAndEmulatorBits() {
        var body=patched.get("Lyw6;->O()I");
        for (int bits=0;bits<16;bits++) assertEquals(bits&3,DetectionMethodPatchTest.state(body,
            (bits&1)!=0,(bits&2)!=0,(bits&4)!=0,(bits&8)!=0));
        assertNoCall(body,"Landroid/os/Debug;");
    }

    @Test public void noDetectionMarkerAndLeavesHaveExactResults() {
        String hook="Lcom/appsflyer/internal/AFf1iSDK;->AFKeystoreWrapper()Ljava/lang/String;";
        var marker=instructions(patched.get(hook));
        assertEquals(";",((StringReference)((ReferenceInstruction)marker.get(0)).getReference()).getString());
        assertEquals(Opcode.RETURN_OBJECT,marker.get(3).getOpcode());
        for (String target:List.of(
            "Lcom/ahnlab/v3mobileplus/interfaces/DebuggerManager;->getDebuggerResult()I",
            "Lcom/ahnlab/v3mobileplus/interfaces/DebuggerManager;->isDebuggerConnected()Z",
            "Lcom/ahnlab/v3mobileplus/interfaces/MemoryCheckManager;->checkMemory()I",
            "Lcom/ahnlab/v3mobileplus/interfaces/Utils;->isDebugEnable(Landroid/content/Context;)Z",
            "Lcom/kakao/adfit/lt/rdZSDnsJ;->gDzHvoVp(Landroid/content/Context;)Z",
            "Lnet/nshc/ap/adbobserver/ADBCheckObserver;->execShell(Landroid/content/Context;)Z")) {
            var code=instructions(patched.get(target));assertEquals(2,code.size());
            assertEquals(Opcode.CONST_4,code.get(0).getOpcode());
            assertEquals(0,((NarrowLiteralInstruction)code.get(0)).getNarrowLiteral());
            assertEquals(Opcode.RETURN,code.get(1).getOpcode());
        }
    }

    @Test public void existingRootFindingsAreReturnedUnchanged() {
        // Follow only the original consumer's no-debugger path. Any attempt to
        // enter its JSON replacement branch fails instead of simulating success.
        String target="Lcom/ahnlab/v3mobileplus/interfaces/DebuggerManager;->checkDebugger(Ljava/lang/String;)Ljava/lang/String;";
        MethodImplementation body=methods.get(target).getImplementation();
        Map<Integer,Instruction> code=instructions(body);
        for (String rootResult:Arrays.asList("{\"detectedType\":1,\"ruleid\":42}","",null)) {
            Object[] registers=new Object[body.getRegisterCount()];
            registers[registers.length-1]=rootResult;
            int pc=0;boolean returned=false;
            for (int steps=0;steps<10;steps++) {
                Instruction instruction=code.get(pc);int next=pc+instruction.getCodeUnits();
                switch (instruction.getOpcode()) {
                    case INVOKE_DIRECT -> {
                        MethodReference call=(MethodReference)((ReferenceInstruction)instruction).getReference();
                        assertEquals("getDebuggerResult",call.getName());
                        assertEquals(0,((NarrowLiteralInstruction)instructions(patched.get(
                            "Lcom/ahnlab/v3mobileplus/interfaces/DebuggerManager;->getDebuggerResult()I")).get(0)).getNarrowLiteral());
                    }
                    case MOVE_RESULT -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=0;
                    case IF_GTZ -> {
                        if ((Integer)registers[((OneRegisterInstruction)instruction).getRegisterA()]>0)
                            next=pc+((OffsetInstruction)instruction).getCodeOffset();
                    }
                    case GOTO -> next=pc+((OffsetInstruction)instruction).getCodeOffset();
                    case RETURN_OBJECT -> {
                        assertSame(rootResult,registers[((OneRegisterInstruction)instruction).getRegisterA()]);returned=true;
                    }
                    default -> fail("Unexpected replacement of prior root finding: "+instruction.getOpcode());
                }
                if (returned) break;
                pc=next;
            }
            assertTrue(returned);
        }
    }

    @Test public void mixedMethodsKeepEveryInstructionOutsideTheDetectionWindow() {
        Map<String,int[]> windows=new LinkedHashMap<>();
        windows.put("Lyw6;->O()I",new int[]{12,29});
        windows.put("Lcom/appsflyer/internal/AFf1iSDK;->unregisterClient(Landroid/content/Context;)Lcom/appsflyer/internal/AFg1gSDK;",new int[]{24,26});
        windows.put("Lcom/microsoft/identity/common/internal/telemetry/Telemetry$Builder;->withContext(Landroid/content/Context;)V",new int[]{181,183});
        windows.put("Lu98;->j()V",new int[]{30,32});
        windows.put("Lv98;->run()V",new int[]{195,197});
        windows.put("Lsrl;->l(Landroid/content/Context;)V",new int[]{24,28});
        for (var entry:windows.entrySet()) {
            String target=entry.getKey();int start=entry.getValue()[0],end=entry.getValue()[1];
            Method original=methods.get(target);MethodImplementation body=patched.get(target);
            Map<Integer,Instruction> before=instructions(original.getImplementation()),after=instructions(body);
            // Reinsert only the original window into the patched body, then compare
            // complete method disassembly. This catches any unrelated operand,
            // setting/flag read, catch, debug, branch, or payload alteration.
            var restored=new ArrayList<Instruction>();
            for (var instruction:after.entrySet()) {
                int address=instruction.getKey();
                if (address==start) before.forEach((offset,value)->{if (offset>=start && offset<end) restored.add(value);});
                if (address<start || address>=end) restored.add(instruction.getValue());
            }
            var restoredBody=new com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation(
                body.getRegisterCount(),restored,body.getTryBlocks(),body.getDebugItems());
            assertEquals(target,DetectionMethodPatch.digest(original),DetectionMethodPatch.digest(copy(original,restoredBody)));
            if (!target.equals("Lyw6;->O()I")) {
                assertEquals(Opcode.CONST_16,after.get(start).getOpcode());
                assertEquals(0,((NarrowLiteralInstruction)after.get(start)).getNarrowLiteral());
            }
        }
    }

    private static void assertNoCall(MethodImplementation body,String owner) {
        for (Instruction instruction:body.getInstructions()) {
            if (instruction instanceof ReferenceInstruction reference && reference.getReference() instanceof MethodReference method)
                assertNotEquals(owner,method.getDefiningClass());
        }
    }
}
