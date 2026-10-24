import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.TypeReference;
import java.util.*;
import java.util.zip.*;

/** Read-only inventory of native tab factories and fragment bases. */
public final class InspectNativeTabletPager {
    public static void main(String[] args)throws Exception{
        Map<String,ClassDef> classes=new HashMap<>();
        try(ZipFile apk=new ZipFile(args[0])){
            for(ZipEntry entry:Collections.list(apk.entries()))if(entry.getName().matches("classes[0-9]*\\.dex"))
                try(java.io.InputStream input=new java.io.BufferedInputStream(apk.getInputStream(entry))){
                    for(ClassDef c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),input).getClasses())classes.put(c.getType(),c);
                }
        }
        for(ClassDef c:classes.values())for(var m:c.getMethods()){
            if(m.getImplementation()==null||!m.getReturnType().equals("Ljava/lang/Object;")||!m.getParameterTypes().equals(Arrays.asList("Landroid/view/ViewGroup;","I")))continue;
            List<String> created=new ArrayList<>();
            for(var i:m.getImplementation().getInstructions())if(i.getOpcode().name().equals("NEW_INSTANCE")&&i instanceof ReferenceInstruction r&&r.getReference() instanceof TypeReference t)created.add(t.getType());
            if(created.size()<4)continue;
            System.out.println("FACTORY "+c.getType()+"->"+m.getName()+" created="+created);
            for(String type:created){ClassDef fragment=classes.get(type);if(fragment==null)continue;System.out.println("BASE "+type+" extends="+fragment.getSuperclass());
                for(var f:fragment.getFields())if(f.getType().contains("WebView"))System.out.println("WEB_FIELD "+f);
            }
        }
    }
}
