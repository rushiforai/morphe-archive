import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;
/** Prints methods of a class that end with SGET_OBJECT ...->a:<same enum>; RETURN_OBJECT after an interface call. */
public class DismissProbe {
  public static void main(String[] a) throws Exception {
    var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
    String cls=a[1];
    for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
      if(!cd.getType().equals(cls)) continue;
      for (Method m : cd.getMethods()) {
        if(!m.getName().equals(a[2])) continue;
        var impl=m.getImplementation(); if(impl==null) continue;
        StringBuilder sb=new StringBuilder("METHOD "+m.getName()+": ");
        for (Instruction ins: impl.getInstructions()) {
          String ref = ins instanceof ReferenceInstruction? ((ReferenceInstruction)ins).getReference().toString():"";
          sb.append(ins.getOpcode()).append(' ').append(ref).append(" | ");
        }
        System.out.println(sb);
      }
    }
  }
}
