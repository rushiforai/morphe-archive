import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** Lists references to classes that are not defined in the APK (android/java excluded). */
public class EmittedMissingClassRefs {
  public static void main(String[] args) throws Exception {
    File apk = new File(args[0]);
    MultiDexContainer<?> c = DexFileFactory.loadDexContainer(apk, null);
    Set<String> defined = new HashSet<>();
    for (String n : c.getDexEntryNames())
      for (ClassDef cd : c.getEntry(n).getDexFile().getClasses()) defined.add(cd.getType());
    Map<String, Integer> missing = new TreeMap<>();
    for (String n : c.getDexEntryNames()) {
      for (ClassDef cd : c.getEntry(n).getDexFile().getClasses()) {
        for (Method m : cd.getMethods()) {
          if (m.getImplementation() == null) continue;
          if (cd.getType().startsWith("Ldev/jason/")) continue;
          boolean injected = false;
          for (Instruction i : m.getImplementation().getInstructions()) {
            if (i instanceof ReferenceInstruction &&
                ((ReferenceInstruction) i).getReference().toString().contains("gboardpatches")) { injected = true; break; }
          }
          if (!injected) continue;
          for (Instruction ins : m.getImplementation().getInstructions()) {
            if (!(ins instanceof ReferenceInstruction)) continue;
            Reference r = ((ReferenceInstruction) ins).getReference();
            String t = null;
            if (r instanceof TypeReference) t = ((TypeReference) r).getType();
            else if (r instanceof MethodReference) t = ((MethodReference) r).getDefiningClass();
            else if (r instanceof FieldReference) t = ((FieldReference) r).getDefiningClass();
            if (t == null || !t.startsWith("L") || !t.endsWith(";")) continue;
            if (t.startsWith("Landroid/") || t.startsWith("Ljava/") || t.startsWith("Ljavax/")
                || t.startsWith("Lorg/") || t.startsWith("Lkotlin") || t.startsWith("Ldalvik/")) continue;
            if (defined.contains(t)) continue;
            missing.merge(t, 1, Integer::sum);
          }
        }
      }
    }
    for (Map.Entry<String, Integer> e : missing.entrySet())
      System.out.println(e.getValue() + "\t" + e.getKey());
    System.out.println("missing-class refs: " + missing.size() + " distinct");
  }
}
