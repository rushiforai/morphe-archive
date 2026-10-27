import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.*;

/** Inspect rebuilt APKs, including actual serialized branch destinations and the settings entry. */
public final class VerifyPosterIdHiddenApk {
    static void check(boolean ok,String message) { if(!ok)throw new AssertionError(message); }
    public static void main(String[] args)throws Exception {
        for(String apk:args)try(ZipFile zip=new ZipFile(apk)) {
            int hooks=0,branches=0;boolean helper=false,label=false;
            for(var entry:Collections.list(zip.entries())) {
                if(!entry.getName().matches("classes[0-9]*\\.dex"))continue;
                byte[] bytes;try(var in=zip.getInputStream(entry)){bytes=in.readAllBytes();}
                for(ClassDef cls:new DexBackedDexFile(Opcodes.getDefault(),ByteBuffer.wrap(bytes)).getClasses()) {
                    for(Method method:cls.getMethods()) {
                        if(cls.getType().equals("Lapp/morphe/extension/chmate/PosterIdChainNg;")&&method.getName().equals("applyHidden"))helper=true;
                        if(method.getImplementation()==null)continue;
                        List<Instruction> code=new ArrayList<>();method.getImplementation().getInstructions().forEach(code::add);
                        int address=0;Map<Integer,Instruction> locations=new HashMap<>();
                        for(Instruction i:code){locations.put(address,i);address+=i.getCodeUnits();}
                        for(int n=0;n<code.size();n++) {
                            Instruction i=code.get(n);
                            if(i instanceof ReferenceInstruction r&&r.getReference() instanceof StringReference s
                                &&s.getString().equals("NGWord-IDへの返信も非表示"))label=true;
                            if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref
                                &&ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/PosterIdChainNg;")&&ref.getName().equals("applyHidden")) {
                                hooks++;
                                check(i instanceof FiveRegisterInstruction call&&call.getRegisterCount()==1,"one owner argument");
                                int receiver=((FiveRegisterInstruction)i).getRegisterC();
                                check(code.get(n+1).getOpcode()==Opcode.IGET_OBJECT&&((TwoRegisterInstruction)code.get(n+1)).getRegisterB()==receiver,"native map read follows hook");
                                int offset=0;
                                for(Instruction branch:code){
                                    if(branch instanceof OffsetInstruction jump&&locations.get(offset+jump.getCodeOffset())==i)branches++;
                                    offset+=branch.getCodeUnits();
                                }
                            }
                        }
                    }
                }
            }
            check(hooks==1&&helper&&label&&branches>0,"APK contains hidden filter, helper, settings label and branch entry: "+apk);
            System.out.println("PASS "+apk+": one transparent filter, helper/settings present, "+branches+" serialized branches enter hook");
        }
    }
}
