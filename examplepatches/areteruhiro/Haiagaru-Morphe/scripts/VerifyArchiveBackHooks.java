import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.ZipFile;

/** Checks the new Activity wrapper and complete preservation of any native implementation. */
public class VerifyArchiveBackHooks {
    static ClassDef activity(String apk)throws Exception{
        try(var zip=new ZipFile(apk)){
            for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))
                for(var c:new DexBackedDexFile(null,ByteBuffer.wrap(zip.getInputStream(e).readAllBytes())).getClasses())
                    if(c.getType().equals("Ljp/syoboi/a2chMate/activity/TabletHomeActivity;"))return c;
        }throw new AssertionError("Missing Activity");
    }
    static Method find(ClassDef c,String name){for(var m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().toString().equals("[Landroid/view/KeyEvent;]"))return m;return null;}
    static List<String> code(Method m){
        List<String> out=new ArrayList<>();
        for(var i:m.getImplementation().getInstructions()){
            String s=i.getOpcode()+":"+i.getCodeUnits();
            if(i instanceof OneRegisterInstruction r)s+=":"+r.getRegisterA();
            if(i instanceof TwoRegisterInstruction r)s+=":"+r.getRegisterB();
            if(i instanceof ThreeRegisterInstruction r)s+=":"+r.getRegisterC();
            if(i instanceof FiveRegisterInstruction r)s+=":"+r.getRegisterCount()+":"+r.getRegisterC()+":"+r.getRegisterD()+":"+r.getRegisterE()+":"+r.getRegisterF()+":"+r.getRegisterG();
            if(i instanceof RegisterRangeInstruction r)s+=":"+r.getStartRegister()+":"+r.getRegisterCount();
            if(i instanceof ReferenceInstruction r)s+=":"+r.getReference();
            if(i instanceof OffsetInstruction r)s+=":"+r.getCodeOffset();
            if(i instanceof WideLiteralInstruction r)s+=":"+r.getWideLiteral();
            out.add(s);
        }return out;
    }
    public static void main(String[] args)throws Exception{
        var original=activity(args[0]);var patched=activity(args[1]);
        var wrapper=find(patched,"dispatchKeyEvent");
        if(wrapper==null||wrapper.getImplementation().getRegisterCount()!=3)throw new AssertionError("Wrapper registers");
        var lines=code(wrapper);
        if(lines.stream().noneMatch(s->s.contains("dispatchArchiveBack")))throw new AssertionError("Missing guard");
        var nativeMethod=find(original,"dispatchKeyEvent");
        if(nativeMethod!=null){
            var delegate=find(patched,"haiagaruNativeDispatchKeyEvent");
            if(delegate==null||delegate.getImplementation().getRegisterCount()!=nativeMethod.getImplementation().getRegisterCount()||!code(nativeMethod).equals(code(delegate)))throw new AssertionError("Native implementation changed");
        }else if(lines.stream().noneMatch(s->s.contains("INVOKE_SUPER")&&s.contains(original.getSuperclass()+"->dispatchKeyEvent")))throw new AssertionError("Missing native super call");
        System.out.println("PASS Activity BACK wrapper, private scratch register and native delegation: "+args[1]);
    }
}
