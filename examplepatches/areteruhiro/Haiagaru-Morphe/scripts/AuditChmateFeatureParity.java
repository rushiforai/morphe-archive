import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.nio.ByteBuffer;
import java.util.*;
import java.util.zip.*;

/** Offline native-to-extension entry coverage; a binding index, not UI verification. */
public final class AuditChmateFeatureParity {
    public static void main(String[] args)throws Exception {
        for(String apk:args)try(ZipFile zip=new ZipFile(apk)){
            Map<String,Set<String>> features=new TreeMap<>();
            for(var item:Collections.list(zip.entries()))if(item.getName().matches("classes[0-9]*\\.dex")){
                var dex=new DexBackedDexFile(null,ByteBuffer.wrap(zip.getInputStream(item).readAllBytes()));
                for(var cls:dex.getClasses()){
                    if(cls.getType().startsWith("Lapp/morphe/extension/"))continue;
                    for(var method:cls.getMethods())if(method.getImplementation()!=null)
                        for(var instruction:method.getImplementation().getInstructions())
                            if(instruction instanceof ReferenceInstruction ref&&ref.getReference() instanceof MethodReference call&&call.getDefiningClass().startsWith("Lapp/morphe/extension/chmate/"))
                                features.computeIfAbsent(call.getDefiningClass().substring(29).replace(";",""),x->new TreeSet<>()).add(call.getName());
                }
            }
            System.out.println("APK\t"+apk);
            for(var row:features.entrySet())System.out.println(row.getKey()+"\t"+String.join(",",row.getValue()));
        }
    }
}
