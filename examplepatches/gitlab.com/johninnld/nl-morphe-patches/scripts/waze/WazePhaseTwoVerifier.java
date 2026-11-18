import java.io.File;
import java.lang.reflect.Method;
import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

public class WazePhaseTwoVerifier {
    static void require(boolean condition, String message) {
        if (!condition) throw new IllegalStateException(message);
    }
    static Map<String,ClassDef> classes(String file) throws Exception {
        MultiDexContainer<?> dex = DexFileFactory.loadDexContainer(new File(file), Opcodes.getDefault());
        Map<String,ClassDef> out = new HashMap<>();
        for (String entry : dex.getDexEntryNames()) for (ClassDef c : dex.getEntry(entry).getDexFile().getClasses())
            require(out.put(c.getType(), c) == null, "Duplicate class: " + c.getType());
        return out;
    }
    static com.android.tools.smali.dexlib2.iface.Method method(Map<String,ClassDef> classes, String owner, String signature) {
        for (var m : classes.get(owner).getMethods())
            if ((m.getName()+"("+String.join("",m.getParameterTypes())+")"+m.getReturnType()).equals(signature)) return m;
        throw new IllegalStateException("Missing " + owner + "->" + signature);
    }
    static List<Instruction> code(com.android.tools.smali.dexlib2.iface.Method m) {
        List<Instruction> list = new ArrayList<>(); m.getImplementation().getInstructions().forEach(list::add); return list;
    }
    static String ref(Instruction i) { return i instanceof ReferenceInstruction ? ((ReferenceInstruction)i).getReference().toString() : ""; }
    static int receiver(Instruction i) {
        return i instanceof FiveRegisterInstruction ? ((FiveRegisterInstruction)i).getRegisterC() : ((RegisterRangeInstruction)i).getStartRegister();
    }
    static int target(List<Instruction> list, int index) {
        int[] offsets = new int[list.size()+1];
        for (int n=0;n<list.size();n++) offsets[n+1]=offsets[n]+list.get(n).getCodeUnits();
        int offset=offsets[index]+((OffsetInstruction)list.get(index)).getCodeOffset();
        for (int n=0;n<offsets.length;n++) if(offsets[n]==offset)return n;
        throw new IllegalStateException("Branch into instruction");
    }
    static String canonical(List<Instruction> list, int at, int inserted) throws Exception {
        Instruction i=list.get(at); StringBuilder s=new StringBuilder(i.getOpcode().name().replace("CONST_STRING_JUMBO","CONST_STRING"));
        for (String name : new String[]{"getRegisterA","getRegisterB","getRegisterC","getRegisterD","getRegisterE","getRegisterF","getRegisterG","getStartRegister","getRegisterCount","getNarrowLiteral","getWideLiteral","getReference","getReference2"}) {
            try { Method m=i.getClass().getMethod(name); s.append('|').append(name).append('=').append(m.invoke(i)); }
            catch(NoSuchMethodException ignored) {}
        }
        if(i instanceof OffsetInstruction) { int t=target(list,at);s.append("|target=").append(inserted>=0 && t>inserted?t-1:t); }
        if(i instanceof SwitchPayload)for(SwitchElement e:((SwitchPayload)i).getSwitchElements())s.append("|case=").append(e.getKey()).append(':').append(e.getOffset());
        return s.toString();
    }
    static void recentsPath(List<Instruction> list, boolean enabled) {
        Object[] regs=new Object[2]; Object result=null; int fetches=0,pc=0,steps=0;
        byte[] original={7,8};
        while(steps++<30) {
            Instruction i=list.get(pc); Opcode op=i.getOpcode();
            if(op==Opcode.CONST_STRING || op==Opcode.CONST_STRING_JUMBO) {
                require(((StringReference)((ReferenceInstruction)i).getReference()).getString().equals("hideRecents"),"Wrong recents toggle");
                regs[((OneRegisterInstruction)i).getRegisterA()]="hideRecents";
            } else if(op==Opcode.INVOKE_STATIC) {
                require(ref(i).equals("Lorg/ungoogled/waze/Customization;->on(Ljava/lang/String;)Z"),"Unexpected bridge call");result=enabled?1:0;
            } else if(op==Opcode.INVOKE_VIRTUAL) {
                require(ref(i).equals("Lcom/waze/places/PlacesNativeManager;->fetchRecentsNTV()[B"),"Wrong native fetch");fetches++;result=original;
            } else if(op==Opcode.MOVE_RESULT || op==Opcode.MOVE_RESULT_OBJECT) regs[((OneRegisterInstruction)i).getRegisterA()]=result;
            else if(op==Opcode.IF_EQZ) { if(((Integer)regs[((OneRegisterInstruction)i).getRegisterA()])==0){pc=target(list,pc);continue;} }
            else if(op==Opcode.CONST_4) regs[((OneRegisterInstruction)i).getRegisterA()]=((NarrowLiteralInstruction)i).getNarrowLiteral();
            else if(op==Opcode.NEW_ARRAY) {
                require(ref(i).equals("[B"),"Wrong empty list representation");TwoRegisterInstruction r=(TwoRegisterInstruction)i;regs[r.getRegisterA()]=new byte[(Integer)regs[r.getRegisterB()]];
            } else if(op==Opcode.RETURN_OBJECT) {
                byte[] actual=(byte[])regs[((OneRegisterInstruction)i).getRegisterA()];
                require(enabled?actual.length==0 && fetches==0:actual==original && fetches==1,"Wrong recents branch behavior");return;
            } else throw new IllegalStateException("Unexpected bridge opcode: "+op);
            pc++;
        }
        throw new IllegalStateException("Bridge did not terminate");
    }
    public static void main(String[] args) throws Exception {
        Map<String,ClassDef> original=classes(args[0]), patched=classes(args[1]);
        String places="Lcom/waze/places/PlacesNativeManager;", reader="Lcom/waze/main_screen/p/a/b/a/o;";
        var nativeBefore=method(original,places,"fetchRecentsNTV()[B");var nativeAfter=method(patched,places,"fetchRecentsNTV()[B");
        require(nativeBefore.getAccessFlags()==nativeAfter.getAccessFlags() && nativeAfter.getImplementation()==null,"JNI declaration changed");
        List<Instruction> before=code(method(original,reader,"invoke()Ljava/lang/Object;")),after=code(method(patched,reader,"invoke()Ljava/lang/Object;"));
        require(before.size()==after.size(),"Merged reader instruction count changed");int replacements=0;
        for(int n=0;n<before.size();n++) {
            if(ref(before.get(n)).equals(places+"->fetchRecentsNTV()[B")) {
                require(ref(after.get(n)).equals(places+"->uaRecents()[B") && receiver(before.get(n))==receiver(after.get(n)),"Recents redirect mismatch");replacements++;
            } else require(canonical(before,n,-1).equals(canonical(after,n,-1)),"Unrelated recent-reader branch changed at "+n);
        }
        require(replacements==1,"Recents replacement count");var bridge=method(patched,places,"uaRecents()[B");
        require(bridge.getImplementation().getRegisterCount()==2,"Bridge register count");recentsPath(code(bridge),true);recentsPath(code(bridge),false);
        String display="Lcom/waze/utils/p;";
        var displayBefore=method(original,display,"a(Landroid/view/Display;)V");var displayAfter=method(patched,display,"a(Landroid/view/Display;)V");
        before=code(displayBefore);after=code(displayAfter);int site=-1;
        for(int n=0;n<before.size();n++) if(before.get(n).getOpcode()==Opcode.CONST_WIDE_HIGH16 && ((WideLiteralInstruction)before.get(n)).getWideLiteral()==0x404e000000000000L){require(site<0,"Ambiguous 60Hz constant");site=n;}
        require(site>=0 && after.size()==before.size()+1,"Display injection count");
        require(displayBefore.getImplementation().getRegisterCount()==displayAfter.getImplementation().getRegisterCount(),"Display registers changed");
        require(ref(after.get(site)).equals("Lorg/ungoogled/waze/Customization;->refreshRateCeiling()D"),"Display helper missing");
        require(after.get(site+1).getOpcode()==Opcode.MOVE_RESULT_WIDE && ((OneRegisterInstruction)after.get(site+1)).getRegisterA()==((OneRegisterInstruction)before.get(site)).getRegisterA(),"Wide result pair mismatch");
        for(int n=0;n<before.size();n++)if(n!=site)require(canonical(before,n,-1).equals(canonical(after,n<site?n:n+1,site)),"Unrelated display logic changed at "+n);
        System.out.println("PASS: single recents call isolated; JNI and other branches preserved; enabled/off bridge paths verified; display wide pair and other control flow preserved");
    }
}
