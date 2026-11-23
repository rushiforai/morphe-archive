import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;
public class AvatarProbe {
  static String p(List<? extends CharSequence> ps){StringBuilder b=new StringBuilder();for(var x:ps)b.append(x);return b.toString();}
  public static void main(String[] a) throws Exception {
    var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
    for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
      for (Method m : cd.getMethods()) {
        if (m.getImplementation()==null) continue;
        List<MethodReference> calls=new ArrayList<>();
        for (Instruction ins : m.getImplementation().getInstructions())
          if (ins instanceof ReferenceInstruction && ((ReferenceInstruction)ins).getReference() instanceof MethodReference)
            calls.add((MethodReference)((ReferenceInstruction)ins).getReference());
        boolean cb=false,dc=false,xf=false,db5=false;
        for (var r: calls){
          String own=r.getDefiningClass(), nm=r.getName(), ps=p(r.getParameterTypes());
          if (own.equals("Landroid/graphics/Bitmap;")&&nm.equals("createBitmap")&&ps.equals("IILandroid/graphics/Bitmap$Config;")) cb=true;
          if (own.equals("Landroid/graphics/Canvas;")&&nm.equals("drawCircle")&&ps.equals("FFFLandroid/graphics/Paint;")) dc=true;
          if (own.equals("Landroid/graphics/Paint;")&&nm.equals("setXfermode")) xf=true;
          if (own.equals("Landroid/graphics/Canvas;")&&nm.equals("drawBitmap")&&ps.equals("Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;")) db5=true;
        }
        if (cb&&dc&&xf&&db5) System.out.println("CIRCLECROP "+cd.getType()+" -> "+m.getName()+" "+p(m.getParameterTypes()));
        if (cd.getInterfaces().contains("Lbuhf;")||cd.getInterfaces().contains("Lbunt;")) System.out.println("MONO-IFACE "+cd.getType());
      }
    }
  }
}
