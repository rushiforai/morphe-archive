import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Compare original auth code with emitted code, allowing only its transport package. */
public final class VerifyCalendarMicroGDex {
    static void require(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    static ClassDef find(String apk,String type)throws Exception{
        var container=DexFileFactory.loadDexContainer(new File(apk),Opcodes.getDefault());
        for(var name:container.getDexEntryNames())for(var c:container.getEntry(name).getDexFile().getClasses())
            if(c.getType().equals(type))return c;
        throw new AssertionError("Missing "+type);
    }
    static String fingerprint(Instruction i)throws Exception{
        List<String> parts=new ArrayList<>();parts.add(i.getOpcode().name());
        // Read every encoded instruction operand through public instruction interfaces.
        Set<String> seen=new HashSet<>();
        for(var method:i.getClass().getMethods()){
            String n=method.getName();
            if(!n.startsWith("get")||n.equals("getClass")||n.equals("getOpcode")||method.getParameterCount()!=0||!seen.add(n))continue;
            Object value=method.invoke(i);
            if(value instanceof Iterable<?> list){
                List<String> elements=new ArrayList<>();
                for(Object element:list){
                    if(element instanceof SwitchElement s)elements.add(s.getKey()+":"+s.getOffset());
                    else elements.add(String.valueOf(element));
                }
                value=elements;
            }
            parts.add(n+"="+value);
        }
        Collections.sort(parts);return String.join("|",parts);
    }
    static Map<String,Method> methods(ClassDef c){
        Map<String,Method> result=new TreeMap<>();
        for(var m:c.getMethods())result.put(m.getName()+m.getParameterTypes()+m.getReturnType(),m);
        return result;
    }
    public static void main(String[] args)throws Exception{
        require(args.length==2,"Usage: original.apk patched.apk");
        int changes=0;
        // Native response parser, invalidation callback and exception recovery must
        // remain identical, including all failure and consent branches.
        for(String type:List.of("Lcal/aamw;","Lcal/aamq;","Lcal/aams;","Lcal/aamt;",
                "Lcom/google/android/gms/auth/UserRecoverableAuthException;")){
            var before=methods(find(args[0],type));var after=methods(find(args[1],type));
            require(before.keySet().equals(after.keySet()),"Auth method set changed: "+type);
            for(String key:before.keySet()){
                var b=before.get(key);var a=after.get(key);
                require(b.getAccessFlags()==a.getAccessFlags(),"Method access changed");
                var bi=b.getImplementation();var ai=a.getImplementation();
                if(bi==null){require(ai==null,"New method body");continue;}
                require(bi.getRegisterCount()==ai.getRegisterCount(),"Registers changed: "+key);
                var bc=new ArrayList<Instruction>();bi.getInstructions().forEach(bc::add);
                var ac=new ArrayList<Instruction>();ai.getInstructions().forEach(ac::add);
                require(bc.size()==ac.size(),"Instruction count changed: "+key);
                for(int i=0;i<bc.size();i++){
                    String left=fingerprint(bc.get(i)),right=fingerprint(ac.get(i));
                    if(left.equals(right))continue;
                    require(type.equals("Lcal/aamw;")&&b.getName().equals("<clinit>"),"Unexpected auth edit: "+type+key);
                    require(bc.get(i) instanceof ReferenceInstruction br&&br.getReference() instanceof StringReference bs&&bs.getString().equals("com.google.android.gms"),"Original transport changed");
                    require(ac.get(i) instanceof ReferenceInstruction ar&&ar.getReference() instanceof StringReference as&&as.getString().equals("app.revanced.android.gms"),"Wrong MicroG transport");
                    require(left.replace("com.google.android.gms","app.revanced.android.gms").equals(right),"Transport operands changed");
                    changes++;
                }
                require(bi.getTryBlocks().size()==ai.getTryBlocks().size(),"Exception regions changed");
                for(int i=0;i<bi.getTryBlocks().size();i++){
                    var bt=bi.getTryBlocks().get(i);var at=ai.getTryBlocks().get(i);
                    require(bt.getStartCodeAddress()==at.getStartCodeAddress()&&bt.getCodeUnitCount()==at.getCodeUnitCount(),"Exception boundaries changed");
                    var bh=bt.getExceptionHandlers();var ah=at.getExceptionHandlers();require(bh.size()==ah.size(),"Exception handlers changed");
                    for(int j=0;j<bh.size();j++)require(Objects.equals(bh.get(j).getExceptionType(),ah.get(j).getExceptionType())&&bh.get(j).getHandlerCodeAddress()==ah.get(j).getHandlerCodeAddress(),"Exception target changed");
                }
            }
        }
        var listener=methods(find(args[1],"Lcal/agpm;")).values().stream().filter(m->m.getName().equals("onClick")).findFirst().orElseThrow();
        var code=new ArrayList<Instruction>();listener.getImplementation().getInstructions().forEach(code::add);
        require(code.size()==2&&code.get(0) instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref&&ref.getDefiningClass().equals("Lpl/dudek/extension/calendar/CalendarMicroGAccessActivity;")&&ref.getName().equals("signIn")&&code.get(1).getOpcode()==com.android.tools.smali.dexlib2.Opcode.RETURN_VOID,"Sign-in still invokes native Google account creation");
        require(code.get(0) instanceof RegisterRangeInstruction range&&range.getRegisterCount()==1&&range.getStartRegister()==listener.getImplementation().getRegisterCount()-1,"Wrong sign-in View register");
        var consent=find(args[1],"Lpl/dudek/extension/calendar/CalendarMicroGAccessActivity;");
        require(consent.getSuperclass().equals("Landroid/app/Activity;"),"Missing consent Activity");
        boolean tokenRequest=false;
        for(var method:consent.getMethods())if(method.getImplementation()!=null)for(var instruction:method.getImplementation().getInstructions())if(instruction instanceof ReferenceInstruction ri&&ri.getReference() instanceof MethodReference mr&&mr.getDefiningClass().equals("Landroid/accounts/AccountManager;")&&mr.getName().equals("getAuthToken"))tokenRequest=true;
        require(tokenRequest,"No genuine authenticator consent request");
        require(changes==1,"Expected exactly one auth transport change, got "+changes);
        System.out.println("PASS: one MicroG transport change; native token parsing, expiry, invalidation, consent/recovery and exception branches preserved");
    }
}
