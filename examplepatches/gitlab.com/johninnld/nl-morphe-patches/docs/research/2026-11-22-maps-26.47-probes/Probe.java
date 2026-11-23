import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
public class Probe {
  public static void main(String[] a) throws Exception {
    var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
    int n=0;
    for (String d : c.getDexEntryNames()) {
      int k=0; for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) { k++; }
      System.out.println(d+" -> "+k);
    }
    for (String d : c.getDexEntryNames()) {
      for (ClassDef cd : c.getEntry(d).getDexFile().getClasses()) {
        if (cd.getType().contains("ajjl") || cd.getType().contains("bsgx")) System.out.println("HIT "+d+" "+cd.getType());
        if (n++<5) System.out.println("sample "+cd.getType());
      }
    }
  }
}
