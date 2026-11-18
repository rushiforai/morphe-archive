import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;import java.util.zip.*;import java.io.*;
/** Ensures the explicitly selected ads/history patches really include their tools dependency. */
public class VerifySelection {
 public static void main(String[]args)throws Exception {
  Set<String> calls=new HashSet<>();
  try(ZipFile z=new ZipFile(args[0])){for(Enumeration<? extends ZipEntry> es=z.entries();es.hasMoreElements();){ZipEntry e=es.nextElement();if(!e.getName().matches("classes[0-9]*\\.dex"))continue;
   for(ClassDef c:DexBackedDexFile.fromInputStream(Opcodes.forApi(35),new BufferedInputStream(z.getInputStream(e))).getClasses()){
    if(c.getType().startsWith("Lapp/canada/walmart/"))continue;
    for(Method m:c.getMethods())if(m.getImplementation()!=null)for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction){Reference r=((ReferenceInstruction)i).getReference();if(r instanceof MethodReference){MethodReference mr=(MethodReference)r;if(mr.getDefiningClass().startsWith("Lapp/canada/walmart/"))calls.add(mr.getDefiningClass()+"->"+mr.getName());}}
   }
  }}
  for(String s:Arrays.asList("PatchStatus;->open","SparkyReplacement;->fab","SparkyReplacement;->suppress","PatchStatus;->history","PatchStatus;->ads","TileHooks;->history","ListEnhancements;->bindBrowse","AdCleaner;->dedicated","AdCleaner;->sponsored"))if(!calls.contains("Lapp/canada/walmart/"+s))throw new AssertionError("Missing selected/dependency hook: "+s);
  System.out.println("Independent ads/history selection includes the Sparky replacement dependency and all nine required hook targets.");
 }
}
