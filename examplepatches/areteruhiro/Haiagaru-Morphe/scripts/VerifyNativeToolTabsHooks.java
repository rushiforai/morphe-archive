import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import java.util.zip.*;

/** Native operands, control-flow targets and ordinary Web-tab construction must survive. */
public final class VerifyNativeToolTabsHooks {
    static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    static Map<String,ClassDef> load(String path)throws Exception{
        Map<String,ClassDef> out=new HashMap<>();try(ZipFile zip=new ZipFile(path)){
            for(ZipEntry entry:Collections.list(zip.entries()))if(entry.getName().matches("classes[0-9]*\\.dex"))
                try(java.io.InputStream in=new java.io.BufferedInputStream(zip.getInputStream(entry))){for(ClassDef c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())out.put(c.getType(),c);}
        }return out;
    }
    static List<Instruction> code(Method m){List<Instruction> out=new ArrayList<>();m.getImplementation().getInstructions().forEach(out::add);return out;}
    static Method method(ClassDef c,String name){for(Method m:c.getMethods())if(m.getName().equals(name)&&m.getReturnType().equals("Ljava/lang/Object;")&&m.getParameterTypes().equals(Arrays.asList("Landroid/view/ViewGroup;","I")))return m;throw new AssertionError(name);}
    static Method noArgs(ClassDef c,String name){for(Method m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().isEmpty())return m;throw new AssertionError(name);}
    static int[] offsets(List<Instruction> code){int[] out=new int[code.size()+1];for(int i=0;i<code.size();i++)out[i+1]=out[i]+code.get(i).getCodeUnits();return out;}
    public static void main(String[] args)throws Exception{
        String version=args[0];String[] cfg=version.equals("191")?new String[]{"Lo/r8lambdaBjbaKVYCk6JekZq3TlN9Kg2pYOk;","Sw_","Lo/onAppOpenAdLoaded;","Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;"}:version.equals("226")?new String[]{"Lo/Yy;","instantiateItem","Lo/setFallbackResource;","Lo/redirect;"}:new String[]{"Lo/zzfm;","a","Ljp/syoboi/a2chMate/fragment/WebViewFragment;","Lo/CustomEventAdapter;"};
        Map<String,ClassDef> original=load(args[1]),patched=load(args[2]);
        Method before=method(original.get(cfg[0]),cfg[1]),after=method(patched.get(cfg[0]),cfg[1]);
        check(before.getImplementation().getRegisterCount()==after.getImplementation().getRegisterCount(),"caller register count");
        List<Instruction> left=code(before),right=code(after);int anchor=-1;
        for(int i=0;i<left.size();i++)if(left.get(i).getOpcode().name().equals("NEW_INSTANCE")&&((TypeReference)((ReferenceInstruction)left.get(i)).getReference()).getType().equals(cfg[2]))anchor=i;
        check(anchor>=0,"original Web constructor exists");
        int[] mapping=new int[left.size()+1];int cursor=0,observers=0;
        for(int i=0;i<left.size();i++){
            if(right.get(cursor) instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref
                    &&ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/ExternalBoardAuth;")&&ref.getName().equals("observe")){
                check(ref.getParameterTypes().equals(List.of("Ljava/lang/CharSequence;"))&&right.get(cursor) instanceof RegisterRangeInstruction,"known existing authentication observer only");
                check(left.get(i-1).getOpcode().name().equals("MOVE_RESULT_OBJECT")&&((RegisterRangeInstruction)right.get(cursor)).getStartRegister()==((OneRegisterInstruction)left.get(i-1)).getRegisterA(),"observer preserves diagnostic string operand");
                cursor++;observers++;
            }
            mapping[i]=cursor++;
            if(i==anchor+1){check(right.get(cursor).getOpcode().name().equals("CHECK_CAST"),"native base cast inserted");cursor++;}
        }
        mapping[left.size()]=cursor;
        check(cursor==right.size()&&observers<=1,"only constructor bridge plus known observer added");
        Instruction bridge=right.get(mapping[anchor]);
        MethodReference bridgeRef=(MethodReference)((ReferenceInstruction)bridge).getReference();
        check(bridgeRef.getDefiningClass().equals("Lapp/morphe/extension/chmate/NativeToolTabs;")&&bridgeRef.getName().equals("createFragment"),"version bridge target");
        int pageRegister=-1;for(Instruction i:left)if(i.getOpcode().name().equals("CHECK_CAST")){pageRegister=((OneRegisterInstruction)i).getRegisterA();break;}
        check(bridge instanceof RegisterRangeInstruction&&((RegisterRangeInstruction)bridge).getStartRegister()==pageRegister&&((RegisterRangeInstruction)bridge).getRegisterCount()==1,"original page argument register");
        check(((OneRegisterInstruction)right.get(mapping[anchor+1])).getRegisterA()==((OneRegisterInstruction)left.get(anchor)).getRegisterA(),"original fragment result register");
        int[] oldOffsets=offsets(left),newOffsets=offsets(right);
        for(int i=0;i<left.size();i++){
            if(i==anchor||i==anchor+1)continue;
            int j=mapping[i];Instruction a=left.get(i),b=right.get(j);
            check(a.getOpcode()==b.getOpcode(),"native opcode "+i);
            if(a instanceof OneRegisterInstruction r)check(r.getRegisterA()==((OneRegisterInstruction)b).getRegisterA(),"register A "+i);
            if(a instanceof TwoRegisterInstruction r)check(r.getRegisterB()==((TwoRegisterInstruction)b).getRegisterB(),"register B "+i);
            if(a instanceof ThreeRegisterInstruction r)check(r.getRegisterC()==((ThreeRegisterInstruction)b).getRegisterC(),"register C "+i);
            if(a instanceof FiveRegisterInstruction r){FiveRegisterInstruction s=(FiveRegisterInstruction)b;check(r.getRegisterCount()==s.getRegisterCount()&&r.getRegisterC()==s.getRegisterC()&&r.getRegisterD()==s.getRegisterD()&&r.getRegisterE()==s.getRegisterE()&&r.getRegisterF()==s.getRegisterF()&&r.getRegisterG()==s.getRegisterG(),"call operands "+i);}
            if(a instanceof ReferenceInstruction r)check(r.getReference().toString().equals(((ReferenceInstruction)b).getReference().toString()),"native reference "+i);
            if(a instanceof WideLiteralInstruction r)check(r.getWideLiteral()==((WideLiteralInstruction)b).getWideLiteral(),"literal "+i);
            if(a instanceof OffsetInstruction r){int target=Arrays.binarySearch(oldOffsets,oldOffsets[i]+r.getCodeOffset());check(target>=0,"valid old branch");check(newOffsets[j]+((OffsetInstruction)b).getCodeOffset()==newOffsets[mapping[target]],"branch destination "+i);}
        }
        ClassDef fragment=patched.get("Lapp/morphe/extension/chmate/NativeToolFragment;");check(fragment.getSuperclass().equals(cfg[3]),"native Fragment superclass");
        boolean toolViewLifecycle=false;
        for(Method m:fragment.getMethods())if(m.getName().equals("onViewCreated")){
            List<Instruction> lifecycle=code(m);
            check(lifecycle.size()==1&&lifecycle.get(0).getOpcode().name().equals("RETURN_VOID"),"tools skip native ListView-only initialization without invoke-super resolution");
            toolViewLifecycle=true;
        }
        check(toolViewLifecycle,"tool view lifecycle override installed");
        for(Method m:fragment.getMethods())if(m.getImplementation()!=null)for(Instruction i:code(m))if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference ref)check(!ref.getDefiningClass().equals("Landroid/app/Fragment;"),"no platform Fragment method remains");
        ClassDef tools=patched.get("Lapp/morphe/extension/chmate/NativeToolTabs;");
        check(((NarrowLiteralInstruction)code(noArgs(tools,"supported")).get(0)).getNarrowLiteral()==1,"bridge available only after wiring");
        List<Instruction> stock=code(noArgs(tools,"stockFragment"));check(stock.size()==3&&((TypeReference)((ReferenceInstruction)stock.get(0)).getReference()).getType().equals(cfg[2]),"ordinary native Web constructor preserved");
        String blank=version.equals("191")?"Lo/r8lambda77QfHZwh7Dbw9oSh2DYiQTXjabs;":"Ljp/syoboi/chmate2/ui/blank/CmpBlankFragment;";
        Method oldBlank=null,newBlank=null;
        for(Method m:original.get(blank).getMethods())if(m.getName().equals("onCreateView"))oldBlank=m;
        for(Method m:patched.get(blank).getMethods())if(m.getName().equals("onCreateView"))newBlank=m;
        check(oldBlank!=null&&newBlank!=null,"native blank lifecycle exists");
        check(oldBlank.getImplementation().getRegisterCount()==newBlank.getImplementation().getRegisterCount(),"blank registers unchanged");
        List<Instruction> oldBody=code(oldBlank),newBody=code(newBlank);int next=0;
        for(Instruction oldInstruction:oldBody){
            Instruction current=newBody.get(next++);check(current.getOpcode()==oldInstruction.getOpcode(),"blank original opcode");
            if(oldInstruction instanceof OneRegisterInstruction r)check(r.getRegisterA()==((OneRegisterInstruction)current).getRegisterA(),"blank original A");
            if(oldInstruction instanceof TwoRegisterInstruction r)check(r.getRegisterB()==((TwoRegisterInstruction)current).getRegisterB(),"blank original B");
            if(oldInstruction instanceof FiveRegisterInstruction r){FiveRegisterInstruction s=(FiveRegisterInstruction)current;check(r.getRegisterCount()==s.getRegisterCount()&&r.getRegisterC()==s.getRegisterC()&&r.getRegisterD()==s.getRegisterD()&&r.getRegisterE()==s.getRegisterE()&&r.getRegisterF()==s.getRegisterF()&&r.getRegisterG()==s.getRegisterG(),"blank original call arguments");}
            if(oldInstruction instanceof RegisterRangeInstruction r){RegisterRangeInstruction s=(RegisterRangeInstruction)current;check(r.getStartRegister()==s.getStartRegister()&&r.getRegisterCount()==s.getRegisterCount(),"blank original range arguments");}
            if(oldInstruction instanceof ReferenceInstruction r)check(r.getReference().toString().equals(((ReferenceInstruction)current).getReference().toString()),"blank original reference");
            if(oldInstruction instanceof WideLiteralInstruction r)check(r.getWideLiteral()==((WideLiteralInstruction)current).getWideLiteral(),"blank original literal");
            check(!(oldInstruction instanceof OffsetInstruction),"blank native method remains branch-free");
        }
        check(next==newBody.size(),"native blank screen is not decorated or changed");
        System.out.println("PASS "+version+" native tool tab factory registers, operands, branch destinations, stock constructor and Fragment rebasing");
    }
}
