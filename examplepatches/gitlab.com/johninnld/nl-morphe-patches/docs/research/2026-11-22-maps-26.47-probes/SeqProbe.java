import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;
/** SeqProbe APK "call1" "call2" ... prints methods containing all calls (substring of "owner->name(params)ret"). */
public class SeqProbe {
  static String ref(Reference r){ if(r instanceof MethodReference){var m=(MethodReference)r;StringBuilder b=new StringBuilder(m.getDefiningClass()+"->"+m.getName()+"(");for(var p:m.getParameterTypes())b.append(p);return b.append(")").append(m.getReturnType()).toString();} if(r instanceof FieldReference){var f=(FieldReference)r;return f.getDefiningClass()+"->"+f.getName()+":"+f.getType();} return r.toString(); }
  public static void main(String[] a) throws Exception {
    var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
    List<String> want = Arrays.asList(a).subList(1,a.length);
    for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
      for (Method m : cd.getMethods()) {
        if (m.getImplementation()==null) continue;
        List<String> refs=new ArrayList<>();
        for (Instruction ins: m.getImplementation().getInstructions())
          if (ins instanceof ReferenceInstruction) refs.add(ref(((ReferenceInstruction)ins).getReference()));
        boolean all=true;
        for (String w: want) if (refs.stream().noneMatch(r->r.contains(w))) { all=false; break; }
        if (all) { StringBuilder b=new StringBuilder(m.getName()+"("); for(var p:m.getParameterTypes())b.append(p); b.append(")").append(m.getReturnType());
          System.out.println(cd.getType()+"  "+b+"  ["+d+"]"); }
      }
    }
  }
}
