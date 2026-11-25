import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.Reference;
import java.io.File;
import java.io.FileOutputStream; import java.io.OutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/** Every Instagram method that references the extension, with the position of each call. */
public class HookInventory {
    public static void main(String[] a) throws Exception {
        final String ext = "Lcom/feurstagram/extension/";
        try (ZipFile zf = new ZipFile(a[0])) {
            List<? extends ZipEntry> entries = new ArrayList<>(Collections.list(zf.entries()));
            entries.sort(Comparator.comparing(ZipEntry::getName));
            for (ZipEntry e : entries) {
                if (!e.getName().matches("classes\\d*\\.dex")) continue;
                File t = File.createTempFile("invx", ".dex");
                try (InputStream in = zf.getInputStream(e); OutputStream o = new FileOutputStream(t)) { in.transferTo(o); }
                List<ClassDef> classes = new ArrayList<>(DexFileFactory.loadDexFile(t, Opcodes.getDefault()).getClasses());
                t.delete();
                classes.sort(Comparator.comparing(ClassDef::getType));
                for (ClassDef c : classes) {
                    if (c.getType().startsWith(ext)) continue;
                    List<Method> methods = new ArrayList<>();
                    for (Method mm : c.getMethods()) methods.add(mm);
                    methods.sort(Comparator.comparing(Method::toString));
                    for (Method m : methods) {
                        MethodImplementation impl = m.getImplementation();
                        if (impl == null) continue;
                        List<Instruction> ins = new ArrayList<>();
                        for (Instruction i : impl.getInstructions()) ins.add(i);
                        StringBuilder sb = new StringBuilder();
                        int n = ins.size();
                        for (int i = 0; i < n; i++) {
                            Reference r = null;
                            try { r = ((ReferenceInstruction) ins.get(i)).getReference(); } catch (Throwable x) { /* not a reference */ }
                            String where = i == 0 ? "0" : i == n - 1 ? "last" : String.valueOf(i);
                            if (r instanceof MethodReference && ((MethodReference) r).getDefiningClass().startsWith(ext)) {
                                MethodReference q = (MethodReference) r;
                                String owner = q.getDefiningClass().substring(ext.length()).replace(";", "").replace('$', '.');
                                sb.append(" @").append(where).append("/").append(n).append(':').append(owner).append('.').append(q.getName());
                            } else if (r instanceof FieldReference && ((FieldReference) r).getDefiningClass().startsWith(ext)) {
                                sb.append(" @").append(where).append("/").append(n).append(":f:").append(((FieldReference) r).getName());
                            }
                        }
                        if (sb.length() == 0) continue;
                        String mods = (m.getAccessFlags() & 8) != 0 ? "static " : "";
                        System.out.println(c.getType() + "->" + m.getName() + "(" + m.getParameterTypes() + ")" + m.getReturnType()
                                + (impl.getRegisterCount() <= 16 ? "" : " [wide]") + " " + mods + sb);
                    }
                }
            }
        }
    }
}
