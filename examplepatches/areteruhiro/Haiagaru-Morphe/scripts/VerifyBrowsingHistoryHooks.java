import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;
import java.util.zip.*;

public final class VerifyBrowsingHistoryHooks {
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);}
    public static void main(String[] args)throws Exception {
        Map<String,ClassDef> classes=new HashMap<>();
        try(var zip=new ZipFile(args[0])) {for(var e:Collections.list(zip.entries())) {
            if(!e.getName().matches("classes[0-9]*\\.dex"))continue;
            byte[] bytes;try(var in=zip.getInputStream(e)){bytes=in.readAllBytes();}
            for(var c:new DexBackedDexFile(Opcodes.getDefault(),java.nio.ByteBuffer.wrap(bytes)).getClasses())classes.put(c.getType(),c);
        }}
        String owner=args[1].equals("191")?"Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;":args[1].equals("226")?"Ljp/syoboi/a2chMate/fragment/HomeFragment;":"Lo/SafeParcelableClass;";
        int nativeHooks=0,nativeDelegates=0;
        for(var c:classes.values())for(var m:c.getMethods()) {
            if(m.getImplementation()==null)continue;
            for(var i:m.getImplementation().getInstructions()) {
                if(!(i instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference ref))continue;
                if(ref.getName().equals("haiagaruNativeHistorySort"))nativeDelegates++;
                if(ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/BrowsingHistory;")
                        && (ref.getName().equals("transform") || ref.getName().equals("applyLegacy")) && !c.getType().startsWith("Lapp/morphe/extension/")) {
                    check(c.getType().equals(owner),"Hook limited to normal home, never recent popup");nativeHooks++;
                    if(args[1].equals("242")) {
                        check(m.getName().equals("<init>"),"242 exact AdapterData constructor");
                        var call=(FiveRegisterInstruction)i;
                        int base=m.getImplementation().getRegisterCount()-7;
                        check(call.getRegisterC()==base+1 && call.getRegisterD()==base+5,"242 uses List p1 and mode p5, not layout p2");
                    }
                }
            }
        }
        check(nativeHooks==1,"Exactly one display-only native hook");
        check(args[1].equals("242") || nativeDelegates==1,"Native legacy sorting retained");
        String row=args[1].equals("191")?"Lo/onAdDisplayed$setIcon;":args[1].equals("226")?"Lo/Yy2$open;":"Lo/getAvailabilityStatus$r8lambdawJ5MHcSJed_CjC7r4OWD0UxyJsQ;";
        String access=args[1].equals("191")?"c":args[1].equals("226")?"e":"d";
        boolean found=false;for(var f:classes.get(row).getFields())if(f.getName().equals(access)&&f.getType().equals("J"))found=true;
        check(found,"Native last-access timestamp field present");
        ClassDef scoped=classes.get("Lapp/morphe/extension/chmate/ThreadScopedNg;");
        check(scoped!=null&&(scoped.getAccessFlags()&1)!=0,"ThreadScopedNg is callable from ChMate package o lambdas");
        Method scopedDelete=null;for(var method:scoped.getMethods())if(method.getName().equals("nativeThreadDeleted")
                &&method.getParameterTypes().equals(List.of("Ljava/lang/Object;","J"))&&method.getReturnType().equals("V"))scopedDelete=method;
        check(scopedDelete!=null&&(scopedDelete.getAccessFlags()&1)!=0,"thread delete bridge is public");
        if(args[1].equals("191")){
            ClassDef home=classes.get("Lo/r8lambdaTb_p0z6z2AqSZIga1YhmAVmiTPk;");
            Method swipe=null,delegate=null;
            for(var method:home.getMethods()){
                if(method.getName().equals("a")&&method.getParameterTypes().equals(List.of("I","J"))&&method.getReturnType().equals("Z"))swipe=method;
                if(method.getName().equals("haiagaruNativeHistoryDelete")&&method.getParameterTypes().equals(List.of("I","J"))&&method.getReturnType().equals("Z"))delegate=method;
            }
            check(swipe!=null&&delegate!=null,"191 HOME swipe wrapper preserves the native delete method");
            Set<String> calls=new HashSet<>();for(var instruction:swipe.getImplementation().getInstructions())if(instruction instanceof ReferenceInstruction r&&r.getReference() instanceof MethodReference m)calls.add(m.getDefiningClass()+"->"+m.getName());
            check(calls.contains("Lapp/morphe/extension/chmate/BrowsingHistory;->nativeHistoryDeleteStart")
                    &&calls.contains("Lapp/morphe/extension/chmate/BrowsingHistory;->nativeHistoryDeleteResult")
                    &&calls.contains(home.getType()+"->haiagaruNativeHistoryDelete"),"191 swipe calls begin/result hooks around native deletion");
        }
        System.out.println("PASS "+args[1]+" normal history DEX binding / popup isolation");
    }
}
