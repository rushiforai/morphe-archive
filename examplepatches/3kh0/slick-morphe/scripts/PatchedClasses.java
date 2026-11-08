import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.TreeSet;

class PatchedClasses {
  public static void main(String[] args) throws Exception {
    var names = new TreeSet<String>();
    var dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.forApi(32));
    for (var entry : dex.getDexEntryNames())
      for (var c : dex.getEntry(entry).getDexFile().getClasses()) {
        if (c.getType().startsWith("Lslick/")) continue;
        for (var m : c.getMethods())
          if (m.getImplementation() != null)
            for (var x : m.getImplementation().getInstructions())
              if (x instanceof ReferenceInstruction r
                  && r.getReference() instanceof MethodReference ref
                  && ref.getDefiningClass().startsWith("Lslick/android/"))
                names.add(c.getType().substring(1, c.getType().length() - 1).replace('/', '.'));
      }
    names.add("slick.android.Host");
    for (var name : names) System.out.println(name);
  }
}
