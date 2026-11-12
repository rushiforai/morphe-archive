import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.File;

/** The reported synchronous apply() must not return through a stale bundled extension. */
public final class VerifyReporterMetadataNoApply {
    public static void main(String[] args)throws Exception{
        for(String apk:args){
            var dex=DexFileFactory.loadDexContainer(new File(apk),Opcodes.getDefault());
            int checked=0;
            for(String entry:dex.getDexEntryNames())for(ClassDef type:dex.getEntry(entry).getDexFile().getClasses()){
                if(!type.getType().equals("Lapp/morphe/extension/chmate/EdgeReporterHistory;"))continue;
                for(Method method:type.getMethods()){
                    if(!method.getName().equals("metadataTitle")&&!method.getName().equals("title")&&!method.getName().equals("historyTitle"))continue;
                    if(method.getImplementation()==null)continue;
                    checked++;
                    for(var instruction:method.getImplementation().getInstructions())
                        if(instruction instanceof ReferenceInstruction reference&&reference.getReference() instanceof MethodReference call
                                &&call.getDefiningClass().equals("Landroid/content/SharedPreferences$Editor;")&&call.getName().equals("apply"))
                            throw new AssertionError("Synchronous metadata apply remains: "+apk+" "+method.getName());
                }
            }
            if(checked==0)throw new AssertionError("No metadata entry points found: "+apk);
            System.out.println("PASS "+apk+": "+checked+" metadata entry points without synchronous Editor.apply");
        }
    }
}
