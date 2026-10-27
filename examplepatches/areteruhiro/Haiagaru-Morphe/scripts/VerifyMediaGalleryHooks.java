import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.*;

public final class VerifyMediaGalleryHooks {
    static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    static ClassDef load(String path)throws Exception{
        try(var zip=new ZipFile(path)){for(var entry:Collections.list(zip.entries()))if(entry.getName().matches("classes[0-9]*\\.dex"))
            try(var in=new java.io.BufferedInputStream(zip.getInputStream(entry))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())
                if(c.getType().equals("Ljp/syoboi/a2chMate/activity/ImagesViewer2Activity;"))return c;}}
        throw new AssertionError("Native image viewer missing");
    }
    static Method find(ClassDef c,String name){for(var m:c.getMethods())if(m.getName().equals(name)&&m.getParameterTypes().equals(List.of("Landroid/view/MotionEvent;")))return m;return null;}
    static List<Instruction> code(Method m){var out=new ArrayList<Instruction>();m.getImplementation().getInstructions().forEach(out::add);return out;}
    public static void main(String[] args)throws Exception{
        ClassDef before=load(args[0]),after=load(args[1]);Method original=find(before,"dispatchTouchEvent"),wrapper=find(after,"dispatchTouchEvent"),delegate=find(after,"haiagaruNativeMediaTouch");
        check(wrapper!=null&&wrapper.getImplementation().getRegisterCount()==3,"wrapper has one local and two untouched arguments");
        var instructions=code(wrapper);check(instructions.size()==8,"bounded wrapper");
        var first=(FiveRegisterInstruction)instructions.get(0);check(first.getRegisterCount()==2&&first.getRegisterC()==1&&first.getRegisterD()==2,"navigation receives native Activity and event");
        var call=(MethodReference)((ReferenceInstruction)instructions.get(0)).getReference();check(call.getDefiningClass().equals("Lapp/morphe/extension/chmate/MediaViewerNavigation;")&&call.getName().equals("onNativeTouch"),"navigation target");
        int offset=0;for(int i=2;i<5;i++)offset+=instructions.get(i).getCodeUnits();check(((OffsetInstruction)instructions.get(2)).getCodeOffset()==offset,"disabled/unhandled branch delegates");
        var fallback=(FiveRegisterInstruction)instructions.get(5);check(fallback.getRegisterCount()==2&&fallback.getRegisterC()==1&&fallback.getRegisterD()==2,"fallback keeps arguments");
        var target=(MethodReference)((ReferenceInstruction)instructions.get(5)).getReference();
        if(original!=null){
            check(delegate!=null&&target.getName().equals("haiagaruNativeMediaTouch"),"existing native dispatch retained");
            check(original.getImplementation().getRegisterCount()==delegate.getImplementation().getRegisterCount(),"native register count retained");
            var a=code(original);var b=code(delegate);check(a.size()==b.size(),"native instruction count retained");
            for(int i=0;i<a.size();i++){
                Instruction x=a.get(i),y=b.get(i);check(x.getOpcode()==y.getOpcode(),"native opcode retained");
                if(x instanceof OneRegisterInstruction r)check(r.getRegisterA()==((OneRegisterInstruction)y).getRegisterA(),"native A operand retained");
                if(x instanceof TwoRegisterInstruction r)check(r.getRegisterB()==((TwoRegisterInstruction)y).getRegisterB(),"native B operand retained");
                if(x instanceof FiveRegisterInstruction r){var s=(FiveRegisterInstruction)y;check(r.getRegisterCount()==s.getRegisterCount()&&r.getRegisterC()==s.getRegisterC()&&r.getRegisterD()==s.getRegisterD()&&r.getRegisterE()==s.getRegisterE()&&r.getRegisterF()==s.getRegisterF()&&r.getRegisterG()==s.getRegisterG(),"native call operands retained");}
                if(x instanceof ReferenceInstruction r)check(r.getReference().toString().equals(((ReferenceInstruction)y).getReference().toString()),"native reference retained");
                if(x instanceof OffsetInstruction r)check(r.getCodeOffset()==((OffsetInstruction)y).getCodeOffset(),"native branch retained");
            }
        }else check(delegate==null&&target.getName().equals("dispatchTouchEvent")&&target.getDefiningClass().equals(before.getSuperclass()),"native superclass dispatch retained");
        System.out.println("PASS native media swipe wrapper operands/branches and original dispatch: "+args[1]);
    }
}
