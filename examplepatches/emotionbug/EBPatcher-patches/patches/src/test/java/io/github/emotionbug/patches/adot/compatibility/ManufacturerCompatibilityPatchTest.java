package io.github.emotionbug.patches.adot.compatibility;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

public class ManufacturerCompatibilityPatchTest {
    private static Map<String,Method> originals() throws Exception {
        String path=System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK",path!=null);
        var patch=new ManufacturerCompatibilityPatch();
        var dex=DexFileFactory.loadDexContainer(new File(path),Opcodes.getDefault()).getEntry(patch.dexEntry()).getDexFile();
        var methods=new HashMap<String,Method>();
        for(ClassDef owner:dex.getClasses()) for(Method method:owner.getMethods())
            if(patch.methods().contains(id(method))) methods.put(id(method),method);
        assertEquals(patch.methods(),methods.keySet());
        return methods;
    }
    private static Method withBody(Method target,MethodImplementation body) {
        return new ImmutableMethod(target.getDefiningClass(),target.getName(),target.getParameters(),target.getReturnType(),
            target.getAccessFlags(),target.getAnnotations(),target.getHiddenApiRestrictions(),body);
    }
    @Test public void allThreeExactOriginalMethodsRejectChangedInstructionsAndReapplication() throws Exception {
        for(boolean embedded:List.of(false,true)) {
            var patch=new ManufacturerCompatibilityPatch(embedded);
            for(Method method:originals().values()) {
                var body=method.getImplementation();
                var rewritten=patch.implementation(method);
                assertThrows(IllegalStateException.class,()->patch.implementation(withBody(method,rewritten)));
                var instructions=new ArrayList<Instruction>();body.getInstructions().forEach(instructions::add);
                for(int index=0;index<instructions.size();index++) {
                    var changed=new ArrayList<>(instructions);changed.set(index,new ImmutableInstruction10x(Opcode.NOP));
                    var incompatible=new ImmutableMethodImplementation(body.getRegisterCount(),changed,body.getTryBlocks(),body.getDebugItems());
                    assertThrows(IllegalStateException.class,()->patch.implementation(withBody(method,incompatible)));
                }
            }
        }
    }
    private static Object execute(MethodImplementation body,boolean installed,boolean modern,boolean mediaGranted) {
        var code=new TreeMap<Integer,Instruction>();int pc=0;
        for(Instruction instruction:body.getInstructions()) {code.put(pc,instruction);pc+=instruction.getCodeUnits();}
        Object[] registers=new Object[body.getRegisterCount()];Object result=null;pc=0;
        for(int steps=0;steps<100;steps++) {
            Instruction instruction=code.get(pc);int next=pc+instruction.getCodeUnits();
            switch(instruction.getOpcode()) {
                case SGET_OBJECT -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=((ReferenceInstruction)instruction).getReference().toString();
                case INVOKE_STATIC,INVOKE_VIRTUAL -> {
                    String call=id((MethodReference)((ReferenceInstruction)instruction).getReference());
                    result=switch(call) {
                        case "Lg92;->G()Lo1i;" -> "installation-provider";
                        case "Lo1i;->b()Z" -> installed?1:0;
                        case "Lbel;->i()Z" -> modern?1:0;
                        case "Ld90;->c0()Z" -> mediaGranted?1:0;
                        case "Ld90;->U()[Lzci;" -> List.of("fallback");
                        default -> throw new AssertionError("Unexpected permission call "+call);
                    };
                }
                case MOVE_RESULT,MOVE_RESULT_OBJECT -> registers[((OneRegisterInstruction)instruction).getRegisterA()]=result;
                case FILLED_NEW_ARRAY -> {
                    FiveRegisterInstruction args=(FiveRegisterInstruction)instruction;
                    int[] indexes={args.getRegisterC(),args.getRegisterD(),args.getRegisterE()};
                    var values=new ArrayList<Object>();
                    for(int i=0;i<args.getRegisterCount();i++) values.add(registers[indexes[i]]);
                    result=values;
                }
                case IF_EQZ -> {if(Objects.equals(0,registers[((OneRegisterInstruction)instruction).getRegisterA()])) next=pc+((OffsetInstruction)instruction).getCodeOffset();}
                case GOTO -> next=pc+((OffsetInstruction)instruction).getCodeOffset();
                case RETURN,RETURN_OBJECT -> {return registers[((OneRegisterInstruction)instruction).getRegisterA()];}
                default -> throw new AssertionError("Unexpected permission instruction "+instruction.getOpcode());
            }
            pc=next;
        }
        throw new AssertionError("Nonterminating permission method");
    }
    private static String permission(String field) {return "Lzci;->"+field+":Lzci;";}
    @Test public void installationAndVersionSpecificPermissionsRemainReal() throws Exception {
        var originals=originals();
        for(boolean embedded:List.of(false,true)) {
            var patch=new ManufacturerCompatibilityPatch(embedded);
            var support=patch.implementation(originals.get("Lhya;->a()Z"));
            var permissions=patch.implementation(originals.get("Lhya;->f()[Lzci;"));
            for(int bits=0;bits<8;bits++) {
                boolean installed=(bits&1)!=0,modern=(bits&2)!=0,media=(bits&4)!=0;
                assertEquals(installed?1:0,execute(support,installed,modern,media));
                Object expected=!installed?List.of("fallback"):embedded?List.of(permission(modern?"X":"q")):
                    !modern?List.of(permission("q"),permission("Y"),permission("Z")):
                    media?List.of(permission("X"),permission("a0"),permission("Z")):List.of(permission("X"),permission("Z"));
                assertEquals(expected,execute(permissions,installed,modern,media));
            }
        }
    }
}
