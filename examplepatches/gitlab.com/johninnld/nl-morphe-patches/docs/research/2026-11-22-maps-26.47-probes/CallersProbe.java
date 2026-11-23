import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
/** CallersProbe APK <str> : methods whose code contains a string literal <str>. */
public class CallersProbe {
  public static void main(String[] a) throws Exception {
    var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
    for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
      for (Method m : cd.getMethods()) {
        if (m.getImplementation()==null) continue;
        boolean hit=false;
        for (Instruction ins : m.getImplementation().getInstructions())
          if (ins instanceof ReferenceInstruction && ((ReferenceInstruction)ins).getReference() instanceof StringReference
              && ((StringReference)((ReferenceInstruction)ins).getReference()).getString().contains(a[1])) { hit=true; break; }
        if (hit) { StringBuilder b=new StringBuilder(m.getName()).append('(');
          for (var p : m.getParameterTypes()) b.append(p);
          b.append(')').append(m.getReturnType());
          System.out.println(cd.getType()+"  "+b+"  ["+d+"]"); }
      }
    }
  }
}
