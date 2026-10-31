package io.github.emotionbug.patcher;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import io.github.emotionbug.patches.adot.recording.EmbeddedRecorderPatch;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

public class EmbeddedRecorderIdentityTest {
    private Method method(MethodImplementation body) {
        return new ImmutableMethod("Lkho;","<clinit>",List.of(),"V",AccessFlags.STATIC.getValue()|AccessFlags.CONSTRUCTOR.getValue(),Set.of(),Set.of(),body);
    }
    private Method original() throws Exception {
        String path=System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK",path!=null);
        var dex=DexFileFactory.loadDexContainer(new File(path),Opcodes.getDefault()).getEntry(new EmbeddedRecorderPatch().dexEntry()).getDexFile();
        for (ClassDef owner:dex.getClasses()) for (Method method:owner.getMethods())
            if (id(method).equals(EmbeddedRecorderPatch.TARGET)) return method;
        throw new AssertionError("Missing original recorder identity initializer");
    }
    @Test public void initializerUsesEachInstalledSignerImmediatelyAndKeepsPackageAndAction() throws Exception {
        var patch=new EmbeddedRecorderPatch();
        var body=patch.implementation(original());
        for(String certificate:List.of("test-signer-one","test-signer-two")) {
            Object value=null,result=null,context=new Object();int certificateCalls=0;
            var fields=new HashMap<String,Object>();
            for(Instruction instruction:body.getInstructions()) switch(instruction.getOpcode()) {
                case CONST_STRING, CONST_STRING_JUMBO -> value=((StringReference)((ReferenceInstruction)instruction).getReference()).getString();
                case INVOKE_STATIC -> {
                    String target=id((MethodReference)((ReferenceInstruction)instruction).getReference());
                    if (target.equals("Lts1;->j()Lq2j;")) result=context;
                    else {
                        assertEquals("Lio/github/emotionbug/patches/runtime/RecorderIdentity;->certificate(Landroid/content/Context;)Ljava/lang/String;",target);
                        assertSame(context,value);result=certificate;certificateCalls++;
                    }
                }
                case MOVE_RESULT_OBJECT -> value=result;
                case SPUT_OBJECT -> fields.put(((ReferenceInstruction)instruction).getReference().toString(),value);
                case RETURN_VOID -> { }
                default -> throw new AssertionError("Unexpected identity instruction "+instruction.getOpcode());
            }
            assertEquals(1,certificateCalls);
            assertEquals(certificate,fields.get("Lkho;->b:Ljava/lang/String;"));
            assertEquals("com.skt.prod.dialer",fields.get("Lkho;->a:Ljava/lang/String;"));
            assertEquals("com.skt.prod.dialer.action.CONNECT",fields.get("Lkho;->c:Ljava/lang/String;"));
        }
        assertThrows(IllegalStateException.class,()->patch.implementation(method(body)));
    }
    @Test public void everyChangedOriginalInstructionFailsClosed() throws Exception {
        Method original=original();var body=original.getImplementation();
        var instructions=new ArrayList<Instruction>();body.getInstructions().forEach(instructions::add);
        for(int index=0;index<instructions.size();index++) {
            var changed=new ArrayList<>(instructions);changed.set(index,new ImmutableInstruction10x(Opcode.NOP));
            assertThrows(IllegalStateException.class,()->new EmbeddedRecorderPatch().implementation(method(
                new ImmutableMethodImplementation(body.getRegisterCount(),changed,body.getTryBlocks(),body.getDebugItems()))));
        }
    }
    @Test public void missingInitializerShapeFailsClosed() {
        var body=new ImmutableMethodImplementation(1,List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID)),null,null);
        assertThrows(IllegalStateException.class,()->new EmbeddedRecorderPatch().implementation(method(body)));
    }
}
