import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
public class ListClasses {
  public static void main(String[] a) throws Exception {
    var c = DexFileFactory.loadDexContainer(new File(a[0]), Opcodes.getDefault());
    for (String d : c.getDexEntryNames()) for (ClassDef cd : c.getEntry(d).getDexFile().getClasses())
      if (cd.getType().contains(a[1])) System.out.println(d+" "+cd.getType());
  }
}
