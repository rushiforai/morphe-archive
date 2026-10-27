import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.ZipFile;

/** Verify that the invoked native entry constructs type 3, not a duplicate tool/Web page. */
public final class VerifyNativeBlankTab {
    static void check(boolean value,String message){if(!value)throw new AssertionError(message);}
    public static void main(String[] args)throws Exception{
        check(args.length>0&&args.length%2==0,"Use: 191 apk 226 apk 242 apk");
        for(int a=0;a<args.length;a+=2)try(var zip=new ZipFile(args[a+1])){
            boolean old=args[a].equals("191"),middle=args[a].equals("226");
            String pane=old?"Ljp/syoboi/a2chMate/activity/TabletHomeActivity$read;":middle?"Lo/QWA;":"Lo/getRemoteCreator;";
            String position=old?"Ljp/syoboi/a2chMate/activity/TabletHomeActivity$write;":middle?"Lo/fWG;":"Lo/zzfc;";
            String page=old?"Lo/MediationServiceImpldExternalSyntheticLambda0;":middle?"Lo/Kjv;":"Lo/zzeq;";
            String activity="Ljp/syoboi/a2chMate/activity/TabletHomeActivity;";
            Method entry=null;
            for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex")){
                for(var cls:new DexBackedDexFile(Opcodes.getDefault(),ByteBuffer.wrap(zip.getInputStream(e).readAllBytes())).getClasses())
                    if(cls.getType().equals(activity))for(var m:cls.getMethods())
                        if(m.getName().equals(old?"d":"b")&&m.getReturnType().equals("V")
                                &&m.getParameterTypes().equals(List.of(pane,position))){check(entry==null,"ambiguous blank entry");entry=m;}
            }
            check(entry!=null&&entry.getImplementation()!=null,"native blank entry missing");
            Map<Integer,Long> values=new HashMap<>();boolean createsBlank=false,links=false,adds=false;
            for(var i:entry.getImplementation().getInstructions()){
                if(i instanceof OneRegisterInstruction r&&i instanceof WideLiteralInstruction literal)values.put(r.getRegisterA(),literal.getWideLiteral());
                if(i instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference m){
                    if(m.getDefiningClass().equals(page)&&m.getName().equals("<init>")&&m.getParameterTypes().equals(List.of("I","Landroid/os/Bundle;"))){
                        var call=(FiveRegisterInstruction)i;check(Long.valueOf(3).equals(values.get(call.getRegisterD())),"new page must be native type 3");createsBlank=true;
                    }
                    if(m.getReturnType().equals("V")&&(m.getParameterTypes().equals(List.of(page,position,"Z"))
                            ||m.getParameterTypes().equals(List.of(pane,page,position,"Z"))))adds=true;
                }
                if(i.getOpcode().name().equals("IPUT_WIDE")&&i instanceof ReferenceInstruction r
                        &&r.getReference() instanceof FieldReference f&&f.getDefiningClass().equals(page))links=true;
            }
            check(createsBlank&&links&&adds,"native blank creation/history links/insertion changed");
            System.out.println("PASS "+args[a]+" native type-3 blank creation, history links and insertion");
        }
    }
}
