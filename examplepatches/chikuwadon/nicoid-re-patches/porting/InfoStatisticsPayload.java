import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import java.io.*;
import java.util.*;

/** One-time, reproducible update of the supported app's existing method delta. */
public final class InfoStatisticsPayload {
    public static void main(String[] args) throws Exception {
        DexFile dex = DexFileFactory.loadDexFile(new File(args[0]), Opcodes.getDefault());
        Map<String,ClassDef> baseline = new HashMap<>();
        MultiDexContainer<? extends DexFile> apk = DexFileFactory.loadDexContainer(new File(args[2]), Opcodes.getDefault());
        for (String entry : apk.getDexEntryNames()) for (ClassDef cls : apk.getEntry(entry).getDexFile().getClasses()) baseline.put(cls.getType(), cls);
        List<ClassDef> output = new ArrayList<>();
        int bind = 0, capture = 0;
        for (ClassDef cls : dex.getClasses()) {
            List<Method> methods = new ArrayList<>();
            List<Method> sourceMethods = new ArrayList<>();
            for (Method method : cls.getMethods()) sourceMethods.add(method);
            if (cls.getType().equals("Le/e/a/d0;") && sourceMethods.stream().noneMatch(m -> m.getName().equals("b") && m.getParameterTypes().equals(Arrays.asList("Ljava/lang/String;")))) {
                for (Method m : baseline.get(cls.getType()).getMethods()) if (m.getName().equals("b") && m.getParameterTypes().equals(Arrays.asList("Ljava/lang/String;"))) sourceMethods.add(m);
            }
            for (Method method : sourceMethods) {
                MethodImplementation original = method.getImplementation();
                MutableMethodImplementation code = original == null ? null : new MutableMethodImplementation(original);
                if (code != null && cls.getType().equals("Lcom/sauzask/nicoid/NicoidVideoInfoFragment;") &&
                        method.getName().equals("b") && method.getParameterTypes().equals(Arrays.asList("Landroid/view/View;"))) {
                    int last = code.getInstructions().size() - 1;
                    if (code.getInstructions().get(last).getOpcode() != Opcode.RETURN_VOID) throw new AssertionError("Info return changed");
                    // v0 still holds the fragment; original p1 is the metadata panel root.
                    code.addInstruction(last++, new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, code.getRegisterCount()-1));
                    code.addInstruction(last, call("bindStatistics", Arrays.asList("Ljava/lang/Object;", "Landroid/view/View;"), 0, 1));
                    bind++;
                }
                if (code != null && cls.getType().equals("Le/e/a/d0;") && method.getName().equals("b") &&
                        method.getParameterTypes().equals(Arrays.asList("Ljava/lang/String;")) && method.getReturnType().equals("Landroid/os/Bundle;")) {
                    for (int i=0; i<code.getInstructions().size(); i++) {
                        Instruction ins = code.getInstructions().get(i);
                        if (!(ins instanceof ReferenceInstruction)) continue;
                        Object ref = ((ReferenceInstruction)ins).getReference();
                        if (!(ref instanceof MethodReference)) continue;
                        MethodReference r = (MethodReference) ref;
                        if (r.getDefiningClass().equals("Lorg/json/JSONObject;") && r.getName().equals("<init>") &&
                                r.getParameterTypes().equals(Arrays.asList("Ljava/lang/String;"))) {
                            code.addInstruction(i+1, call("captureStatistics", Arrays.asList("Lorg/json/JSONObject;", "Landroid/os/Bundle;"), 10, 9));
                            capture++; break;
                        }
                    }
                }
                methods.add(new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(),
                    method.getReturnType(), method.getAccessFlags(), method.getAnnotations(), method.getHiddenApiRestrictions(), code));
            }
            output.add(new ImmutableClassDef(cls.getType(), cls.getAccessFlags(), cls.getSuperclass(), cls.getInterfaces(),
                cls.getSourceFile(), cls.getAnnotations(), cls.getFields(), methods));
        }
        if (bind != 1 || capture != 1) throw new AssertionError("Unsupported metadata hooks: "+bind+"/"+capture);
        DexPool.writeTo(args[1], new ImmutableDexFile(dex.getOpcodes(), output));
        System.out.println("Metadata panel + response hooks verified");
    }
    static BuilderInstruction35c call(String name, List<String> parameters, int first, int second) {
        return new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, first, second, 0, 0, 0,
            new ImmutableMethodReference("Le/e/a/VideoInfoUi;", name, parameters, "V"));
    }
}
