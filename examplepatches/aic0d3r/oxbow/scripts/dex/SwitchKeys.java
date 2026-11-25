import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload;
import com.android.tools.smali.dexlib2.iface.instruction.SwitchElement;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collections;
import java.util.Set;
import java.util.TreeSet;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Every key of every switch in one method, so a String.hashCode() can be looked up among them. */
public class SwitchKeys {
    public static void main(String[] a) throws Exception {
        Set<Integer> keys = new TreeSet<>();
        int[] payloads = {0};
        try (ZipFile zf = new ZipFile(a[0])) {
            for (ZipEntry e : Collections.list(zf.entries())) {
                if (!e.getName().matches("classes\\d*\\.dex")) continue;
                File t = File.createTempFile("swx", ".dex");
                try (InputStream in = zf.getInputStream(e); OutputStream o = new FileOutputStream(t)) { in.transferTo(o); }
                for (ClassDef c : DexFileFactory.loadDexFile(t, Opcodes.getDefault()).getClasses()) {
                    if (!c.getType().equals(a[1])) continue;
                    for (Method m : c.getMethods()) {
                        if (!m.getName().equals(a[2])) continue;
                        for (Instruction i : m.getImplementation().getInstructions()) {
                            if (!(i instanceof SwitchPayload)) continue;
                            payloads[0]++;
                            for (SwitchElement el : ((SwitchPayload) i).getSwitchElements()) keys.add(el.getKey());
                        }
                    }
                }
                t.delete();
            }
        }
        System.out.println(a[1] + "->" + a[2] + ": switch payloads=" + payloads[0] + " distinct keys=" + keys.size());
        for (int i = 3; i < a.length; i++) {
            int h = a[i].hashCode();
            System.out.println(String.format("  \"%s\".hashCode()=%d  %s", a[i], h, keys.contains(h) ? "IS a case" : "not a case"));
        }
    }
}
