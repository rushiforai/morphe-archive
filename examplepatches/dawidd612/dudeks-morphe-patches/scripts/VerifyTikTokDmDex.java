import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.ZipFile;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Verify actual emitted DEX wiring. Runtime behavior is tested by test_tiktok_dm_hook.py. */
public class VerifyTikTokDmDex {
    static final String HOOK="Lpl/dudek/extension/tiktok/KeepDmScrollPosition;";
    static void require(boolean ok,String why){if(!ok)throw new AssertionError(why);}
    static MethodReference call(Instruction i){
        return i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference m ? m:null;
    }
    public static void main(String[]args)throws Exception{
        Map<String,Integer> hooks=new HashMap<>(); int commits=0;
        try(ZipFile zip=new ZipFile(args[0])){
            var entries=zip.entries();
            while(entries.hasMoreElements()){
                var entry=entries.nextElement();if(!entry.getName().endsWith(".dex"))continue;
                var dex=new DexBackedDexFile(Opcodes.getDefault(),ByteBuffer.wrap(zip.getInputStream(entry).readAllBytes()));
                for(ClassDef c:dex.getClasses())for(Method m:c.getMethods()){
                    if(m.getImplementation()==null)continue;
                    List<Instruction> code=new ArrayList<>();m.getImplementation().getInstructions().forEach(code::add);
                    for(int k=0;k<code.size();k++){
                        MethodReference ref=call(code.get(k));
                        if(ref==null||!ref.getDefiningClass().equals(HOOK)||c.getType().startsWith("Lpl/dudek/extension/tiktok/"))continue;
                        require(!c.getType().startsWith("Landroidx/"),"Global RecyclerView interception");
                        hooks.merge(ref.getName(),1,Integer::sum);
                        if(!ref.getName().equals("shouldSkipAutoScroll"))continue;
                        commits++;
                        require(code.stream().anyMatch(i->i instanceof ReferenceInstruction r &&
                            r.getReference() instanceof StringReference s && s.getString().equals("onSubmitListComplete")),"Wrong commit method");
                        int receiver=((FiveRegisterInstruction)code.get(k)).getRegisterC();
                        int temporary=((OneRegisterInstruction)code.get(k+1)).getRegisterA();
                        require(receiver!=temporary,"Guard clobbers RecyclerView on fallthrough");
                        require(code.get(k+2).getOpcode()==Opcode.IF_NEZ,"Missing guard branch");
                        require(((OneRegisterInstruction)code.get(k+2)).getRegisterA()==temporary,"Wrong guard result register");
                        require(call(code.get(k+3)).getName().equals("stopScroll"),"Must guard stopScroll too");
                        require(((FiveRegisterInstruction)code.get(k+3)).getRegisterC()==receiver,"Wrong list receiver");
                        int scroll=k+7;
                        require(call(code.get(scroll)).getName().equals("scrollToPositionWithOffset"),"Wrong auto-scroll block");
                        int expectedOffset=0;
                        for(int p=k+2;p<=scroll;p++)expectedOffset+=code.get(p).getCodeUnits();
                        require(((OffsetInstruction)code.get(k+2)).getCodeOffset()==expectedOffset,"Skip must retain completion callbacks");
                        require(code.get(scroll+1).getOpcode()==Opcode.IGET_OBJECT &&
                            ((OneRegisterInstruction)code.get(scroll+1)).getRegisterA()==temporary,"Temporary must be overwritten at target");
                        require(code.subList(0,k).stream().anyMatch(i->{var r=call(i);return r!=null&&r.getName().equals("removeFirst");}),"Queue must be drained before guard");
                    }
                }
            }
        }
        require(commits==1,"Expected one commit-time guard");
        require(hooks.getOrDefault("attach",0)>=1,"Missing list attach");
        require(hooks.getOrDefault("detach",0)==1,"Missing list teardown");
        require(hooks.getOrDefault("requestLatest",0)==1,"Missing explicit latest-button permission");
        require(hooks.getOrDefault("navigateToMessage",0)==5,"Missing message navigation hooks");
        System.out.println("PASS: commit queue, branch/register safety, lifecycle and all navigation hooks in emitted DEX");
    }
}
