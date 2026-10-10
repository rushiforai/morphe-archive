import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.analysis.*;
import com.android.tools.smali.dexlib2.analysis.reflection.ReflectionClassDef;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.File;
import java.net.URLClassLoader;
import java.util.*;

/** Check inferred dialog argument types, including exception-handler paths. */
public final class VerifyDialogArguments {
    public static void main(String[] args) throws Exception {
        Map<String, ClassDef> classes = new HashMap<>();
        MultiDexContainer<? extends DexFile> dex = DexFileFactory.loadDexContainer(new File(args[0]), Opcodes.getDefault());
        for (String entry : dex.getDexEntryNames())
            for (ClassDef c : dex.getEntry(entry).getDexFile().getClasses()) classes.put(c.getType(), c);
        URLClassLoader android = new URLClassLoader(new java.net.URL[]{new File(args[1]).toURI().toURL()});
        ClassProvider framework = type -> {
            try { return new ReflectionClassDef(Class.forName(type.substring(1, type.length()-1).replace('/', '.'), false, android)); }
            catch (ClassNotFoundException e) { return null; }
        };
        ClassPath path = new ClassPath(classes::get, framework);
        int checks = 0;
        for (Method m : classes.get("Le/e/a/PlaybackSession;").getMethods()) {
            if (m.getImplementation() == null) continue;
            boolean relevant = false;
            for (Instruction i : m.getImplementation().getInstructions())
                if (i instanceof ReferenceInstruction && ((ReferenceInstruction)i).getReference() instanceof MethodReference) {
                    MethodReference r = (MethodReference)((ReferenceInstruction)i).getReference();
                    if (r.getDefiningClass().equals("Le/e/a/UiDialogs;") && r.getName().equals("style")) relevant = true;
                }
            if (!relevant) continue;
            MethodAnalyzer analyzer = new MethodAnalyzer(path, m, null, false);
            if (analyzer.getAnalysisException() != null) throw analyzer.getAnalysisException();
            for (AnalyzedInstruction a : analyzer.getAnalyzedInstructions()) {
                Instruction i = a.getInstruction();
                if (!(i instanceof ReferenceInstruction)) continue;
                Object r = ((ReferenceInstruction)i).getReference();
                if (!(r instanceof MethodReference)) continue;
                MethodReference target = (MethodReference)r;
                if (!target.getDefiningClass().equals("Le/e/a/UiDialogs;") || !target.getName().equals("style")) continue;
                int register = i instanceof RegisterRangeInstruction ? ((RegisterRangeInstruction)i).getStartRegister() : ((FiveRegisterInstruction)i).getRegisterC();
                RegisterType actual = a.getPreInstructionRegisterType(register);
                String type = actual.type == null ? null : actual.type.getType();
                boolean valid = actual.category == RegisterType.NULL;
                while (type != null) {
                    if (type.equals("Landroid/app/AlertDialog;")) { valid = true; break; }
                    type = path.getClassDef(type).getSuperclass();
                }
                if (!valid) throw new AssertionError(m.getName()+" passes "+actual+" to UiDialogs.style");
                checks++;
            }
        }
        if (checks < 2) throw new AssertionError("Missing dialog hooks");
        System.out.println("Dialog argument verification: "+checks+" calls passed");
        android.close();
    }
}
