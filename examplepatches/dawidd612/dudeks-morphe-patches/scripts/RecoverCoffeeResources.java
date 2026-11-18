/** Recover current startup wrappers and merge matching vendor SDK receiver resources. All inputs remain private. */
import java.io.*;import java.util.*;import com.android.tools.smali.dexlib2.*;import com.android.tools.smali.dexlib2.iface.*;import com.android.tools.smali.dexlib2.iface.instruction.*;import com.android.tools.smali.dexlib2.iface.reference.*;import com.android.tools.smali.dexlib2.immutable.*;
class RecoverCoffeeResources{
 public static void main(String[]a)throws Exception{
 var op=Opcodes.getDefault();var defs=new TreeMap<String,ClassDef>();
 for(var f:new File(a[0]).listFiles())if(f.getName().startsWith("native-2-dex-")&&f.getName().endsWith(".dex"))for(var c:DexFileFactory.loadDexFile(f,op).getClasses())if(c.getType().contains("$c202"))defs.put(c.getType(),c);
 System.out.println("startup "+defs.keySet());DexFileFactory.writeDexFile(a[1],new ImmutableDexFile(op,defs.values()));
 defs.clear();for(var c:DexFileFactory.loadDexFile(new File(a[2]),op).getClasses())if(!c.getType().startsWith("Lcom/ironsource/adqualitysdk/"))defs.put(c.getType(),c);
 for(var c:DexFileFactory.loadDexFile(new File(a[3]),op).getClasses())if(c.getType().startsWith("Lcom/ironsource/adqualitysdk/"))defs.put(c.getType(),c);
 DexFileFactory.writeDexFile(a[4],new ImmutableDexFile(op,defs.values()));
 var apk=DexFileFactory.loadDexContainer(new File(a[5]),op);
 for(var en:apk.getDexEntryNames())for(var c:apk.getEntry(en).getDexFile().getClasses())for(var m:c.getMethods())if(m.getImplementation()!=null)for(var i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction ri&&ri.getReference() instanceof StringReference sr&&(sr.getString().contains("games.service.START")||sr.getString().contains("games.internal.connect.service.START")||sr.getString().equals("GamesApiManager")&&m.getParameterTypes().size()==5))System.out.println("BIND "+m+" parent="+c.getSuperclass());
 }
}
