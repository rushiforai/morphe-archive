import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Check the owner survives the native helper's Bundle conversion. */
public final class VerifyCachedArtwork {
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args)throws Exception{
        Map<String,ClassDef> classes=new HashMap<>();
        for(ClassDef c:DexFileFactory.loadDexFile(new File(args[0]),Opcodes.forApi(35)).getClasses())classes.put(c.getType(),c);
        ClassDef feedback=classes.get("Le/e/a/FeedbackMedia;");
        check(classes.containsKey("Le/e/a/CachedMediaArtwork;"),"cached artwork helper shipped");
        boolean hooked=false,legacy=false;
        for(Method m:feedback.getMethods()){
            if(m.getName().equals("lambda$apply$1"))legacy=m.getParameterTypes().size()==3;
            if(!m.getName().equals("apply"))continue;
            check(m.getImplementation().getRegisterCount()==8,"owner register available");
            Iterator<? extends Instruction> instructions=m.getImplementation().getInstructions().iterator();
            Instruction first=instructions.next();
            check(first.getOpcode()==Opcode.MOVE_OBJECT,"owner saved before conversion");
            TwoRegisterInstruction move=(TwoRegisterInstruction)first;
            check(move.getRegisterA()==4&&move.getRegisterB()==7,"v4 preserves original p2 owner");
            for(Instruction instruction:m.getImplementation().getInstructions()){
                if(!(instruction instanceof ReferenceInstruction))continue;
                Reference ref=((ReferenceInstruction)instruction).getReference();
                if(!(ref instanceof MethodReference))continue;
                MethodReference call=(MethodReference)ref;
                if(!call.getDefiningClass().equals("Le/e/a/CachedMediaArtwork;")||!call.getName().equals("request"))continue;
                FiveRegisterInstruction invoke=(FiveRegisterInstruction)instruction;
                check(invoke.getRegisterCount()==4&&invoke.getRegisterC()==5&&invoke.getRegisterD()==7&&invoke.getRegisterE()==4&&invoke.getRegisterF()==0,"session, enriched metadata, owner and URL routed correctly");
                hooked=true;
            }
        }
        check(hooked&&legacy,"offline hook and online fallback both shipped");
        System.out.println("Cached artwork DEX: owner preservation and fallback contracts passed");
    }
}
