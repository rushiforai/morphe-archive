import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.Opcode;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.*;

public final class VerifyResponseShareOrderHooks {
    static void check(boolean ok,String label){if(!ok)throw new AssertionError(label);}
    static ClassDef owner(String apk,String type)throws Exception {
        try(var zip=new ZipFile(apk)){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex")) {
            byte[] data;try(var in=zip.getInputStream(e)){data=in.readAllBytes();}
            for(var cls:new DexBackedDexFile(null,ByteBuffer.wrap(data)).getClasses())if(cls.getType().equals(type))return cls;
        }}throw new AssertionError("Missing "+type);
    }
    static List<String> code(Method method) {
        List<String> result=new ArrayList<>();
        for(var i:method.getImplementation().getInstructions()) {
            String s=i.getOpcode().toString();
            if(i instanceof ReferenceInstruction r)s+=" "+r.getReference();
            if(i instanceof WideLiteralInstruction n)s+=" lit="+n.getWideLiteral();
            if(i instanceof OffsetInstruction o)s+=" offset="+o.getCodeOffset();
            if(i instanceof FiveRegisterInstruction r)s+=" regs="+List.of(r.getRegisterCount(),r.getRegisterC(),r.getRegisterD(),r.getRegisterE(),r.getRegisterF(),r.getRegisterG());
            else if(i instanceof RegisterRangeInstruction r)s+=" range="+r.getStartRegister()+":"+r.getRegisterCount();
            else if(i instanceof ThreeRegisterInstruction r)s+=" regs="+List.of(r.getRegisterA(),r.getRegisterB(),r.getRegisterC());
            else if(i instanceof TwoRegisterInstruction r)s+=" regs="+List.of(r.getRegisterA(),r.getRegisterB());
            else if(i instanceof OneRegisterInstruction r)s+=" reg="+r.getRegisterA();
            result.add(s);
        }
        return result;
    }
    static Method method(ClassDef owner,String name) {for(var m:owner.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().isEmpty())return m;throw new AssertionError("Missing "+name);}
    public static void main(String[] args)throws Exception {
        check(args.length==3,"Provide old APK, new APK and version");
        boolean legacy=args[2].equals("191"),modern=args[2].equals("242");
        String owner=legacy?"Lo/r8lambdafLXKIgI8H4VR9SponZBKnK7_9gE;":"Ljp/syoboi/a2chMate/fragment/ResMenuDialogFragment;";
        String delegate=legacy?"haiagaruBuildResponseMenu":modern?"haiagaruPosterMenu":"haiagaruNativeResponseMenu";
        ClassDef old=owner(args[0],owner),fresh=owner(args[1],owner);
        Method original=method(old,delegate),retained=method(fresh,delegate);
        check(original.getImplementation().getRegisterCount()==retained.getImplementation().getRegisterCount()&&code(original).equals(code(retained)),"native delegate instructions, branch offsets and registers unchanged");
        int hooks=0;
        for(Method m:fresh.getMethods())if(m.getImplementation()!=null) {
            List<Instruction> instructions=new ArrayList<>();m.getImplementation().getInstructions().forEach(instructions::add);
            for(int n=0;n<instructions.size();n++)if(instructions.get(n) instanceof ReferenceInstruction r
                &&r.getReference() instanceof MethodReference ref&&ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/ResponseMenuSettings;")&&ref.getName().equals("finishResponseMenu")) {
                hooks++;
                check(m.getImplementation().getRegisterCount()==method(old,m.getName()).getImplementation().getRegisterCount(),"wrapper registers unchanged");
                check(instructions.get(n+1).getOpcode()==Opcode.RETURN_OBJECT,"final order executes after all appended actions");
                check(instructions.get(n) instanceof FiveRegisterInstruction call&&call.getRegisterCount()==1
                    &&instructions.get(n+1) instanceof OneRegisterInstruction ret&&ret.getRegisterA()==call.getRegisterC(),"same original menu finalized and returned");
                check(n>0&&instructions.get(n-1) instanceof ReferenceInstruction previous&&previous.getReference() instanceof MethodReference append
                    &&Set.of("appendDialog","appendDialog242","appendForCurrentDialog").contains(append.getName()),"ordering follows native response action completion");
            }
        }
        check(hooks==1,"one unconditional response menu finalization");
        System.out.println("PASS "+args[2]+": delegate/branches/registers retained; one finalization after appended actions; original menu returned");
    }
}
