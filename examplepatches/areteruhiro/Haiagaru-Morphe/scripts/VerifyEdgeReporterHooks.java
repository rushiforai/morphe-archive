import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/** java -cp morphe-desktop-all.jar scripts/VerifyEdgeReporterHooks.java patched191.apk ... */
public class VerifyEdgeReporterHooks {
    public static void main(String[] args) throws Exception {
        for (String apk : args) {
            Map<String,Integer> calls = new TreeMap<>();
            Set<String> runtime = new HashSet<>();
            var dex = DexFileFactory.loadDexContainer(new File(apk), Opcodes.getDefault());
            for (String entry : dex.getDexEntryNames()) for (ClassDef cls : dex.getEntry(entry).getDexFile().getClasses()) {
                boolean extension = cls.getType().startsWith("Lapp/morphe/extension/");
                for (Method method : cls.getMethods()) {
                    if (cls.getType().equals("Lapp/morphe/extension/chmate/EdgeReporterHistory;")) runtime.add(method.getName());
                    if (extension || method.getImplementation() == null) continue;
                    for (Instruction insn : method.getImplementation().getInstructions()) {
                        if (!(insn instanceof ReferenceInstruction r) || !(r.getReference() instanceof MethodReference ref)
                                || !ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/EdgeReporterHistory;")) continue;
                        calls.merge(ref.getName(), 1, Integer::sum);
                        if (insn instanceof RegisterRangeInstruction range &&
                                range.getStartRegister() + range.getRegisterCount() > method.getImplementation().getRegisterCount())
                            throw new AssertionError("Out-of-range registers: " + method);
                    }
                }
            }
            if (calls.getOrDefault("title", 0) != 2 || calls.getOrDefault("historyTitle", 0) != 1
                    || calls.getOrDefault("pending", 0) < 2
                    || !calls.get("pending").equals(calls.get("capturePending"))
                    || calls.getOrDefault("choose", 0) + calls.getOrDefault("addLegacyButton", 0) < 1)
                throw new AssertionError(apk + ": missing hook " + calls);
            if (!runtime.containsAll(calls.keySet())) throw new AssertionError("Missing runtime method " + calls);
            System.out.println("PASS " + new File(apk).getName() + ": " + calls);
        }
    }
}
