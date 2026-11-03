import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.ZipFile;

/** Validate actual injected operands and the native call which consumes their result. */
public final class VerifyEmojiThreadHooks {
    static int receiver(Instruction i){return i instanceof FiveRegisterInstruction f?f.getRegisterC():((RegisterRangeInstruction)i).getStartRegister();}
    static int argument(Instruction i){return i instanceof FiveRegisterInstruction f?f.getRegisterD():((RegisterRangeInstruction)i).getStartRegister()+1;}
    public static void main(String[] args)throws Exception{
        int emoji=0,title=0,dialogs=0;
        try(var zip=new ZipFile(args[0])){
            for(var e:Collections.list(zip.entries())){
                if(!e.getName().matches("classes[0-9]*\\.dex"))continue;
                byte[] data;try(var in=zip.getInputStream(e)){data=in.readAllBytes();}
                for(var c:new DexBackedDexFile(Opcodes.getDefault(),java.nio.ByteBuffer.wrap(data)).getClasses())for(var method:c.getMethods()){
                    if(method.getImplementation()==null)continue;
                    var code=new ArrayList<Instruction>();method.getImplementation().getInstructions().forEach(code::add);
                    for(int i=0;i<code.size();i++)if(code.get(i) instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref){
                        if(ref.getName().equals("processEmojiTextForView")){
                            var call=code.get(i);var result=code.get(i+1);var nativeCall=code.get(i+2);
                            if(!(nativeCall instanceof ReferenceInstruction nr)||!(nr.getReference() instanceof MethodReference nm)||
                                !(nm.getName().equals("setText")&&!nm.getParameterTypes().isEmpty()&&nm.getParameterTypes().get(0).equals("Ljava/lang/CharSequence;")
                                ||nm.getDefiningClass().equals("Lapp/morphe/extension/chmate/MediaViewerNavigation;")&&nm.getName().equals("setNativeCounter")))throw new AssertionError("Native text call missing "+method);
                            if(result.getOpcode()!=Opcode.MOVE_RESULT_OBJECT||((OneRegisterInstruction)result).getRegisterA()!=argument(call)||receiver(call)!=receiver(nativeCall)||argument(call)!=argument(nativeCall))throw new AssertionError("Wrong text operands "+method);
                            if(call instanceof FiveRegisterInstruction f&&f.getRegisterCount()!=2||call instanceof RegisterRangeInstruction range&&range.getRegisterCount()!=2)throw new AssertionError("Wrong argument count");
                            emoji++;
                        }
                        if(ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/ThreadTitleActions;")&&ref.getName().equals("wrap")){
                            if(!method.getName().equals("onCreateView")||!(code.get(i) instanceof RegisterRangeInstruction range)||range.getRegisterCount()!=2||range.getStartRegister()!=method.getImplementation().getRegisterCount()-4)throw new AssertionError("Title wrapper arguments");
                            if(code.get(i+1).getOpcode()!=Opcode.MOVE_RESULT_OBJECT||code.get(i+2).getOpcode()!=Opcode.RETURN_OBJECT)throw new AssertionError("Title native return not preserved");title++;
                        }
                        if(ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/ThreadTitleActions;")&&ref.getName().equals("decorateDialog")){
                            if(!method.getName().equals("onStart")||method.getImplementation().getRegisterCount()!=1||!(code.get(i) instanceof FiveRegisterInstruction f)||f.getRegisterCount()!=1||f.getRegisterC()!=0||i!=1||code.get(0).getOpcode()!=Opcode.INVOKE_SUPER||code.get(i+1).getOpcode()!=Opcode.RETURN_VOID)throw new AssertionError("Dialog lifecycle operands");dialogs++;
                        }
                    }
                }
            }
        }
        if((args.length<2||!args[1].equals("legacy"))&&emoji<20||title!=1)throw new AssertionError("Hook count emoji="+emoji+" title="+title);
        if(args.length>2&&dialogs!=Integer.parseInt(args[2]))throw new AssertionError("Dialog hook count "+dialogs);
        System.out.println("PASS emoji="+emoji+" native title="+title+" dialogs="+dialogs);
    }
}
