import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import java.io.BufferedInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipFile;

public final class VerifyNewArrivalCountFallbackHooks {
    public static void main(String[] arguments) throws Exception {
        Map<String, Integer> calls = new HashMap<>();
        boolean removedOption = true;
        try (ZipFile archive = new ZipFile(arguments[0])) {
            for (var entries = archive.entries(); entries.hasMoreElements();) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                try (var input = new BufferedInputStream(archive.getInputStream(entry))) {
                    DexBackedDexFile dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input);
                    for (StringReference string : dex.getStringReferences()) {
                        String value = string.getString();
                        if (value.contains("countNewArrivalResponseNumbers") || value.contains("retryZeroNewArrivals")
                                || value.contains("NewArrivalNumbers")) removedOption = false;
                    }
                    for (var owner : dex.getClasses()) for (var method : owner.getMethods()) {
                        if (method.getImplementation() == null || owner.getType().startsWith("Lapp/morphe/extension/")) continue;
                        List<Instruction> code = new ArrayList<>();
                        method.getImplementation().getInstructions().forEach(code::add);
                        for (int index = 0; index < code.size(); index++) {
                            if (!(code.get(index) instanceof ReferenceInstruction reference)
                                    || !(reference.getReference() instanceof MethodReference call)) continue;
                            if (call.getDefiningClass().equals("Lapp/morphe/extension/chmate/NewArrivalCountFallback;")) {
                                calls.merge(call.getName(), 1, Integer::sum);
                                if (call.getName().equals("count")) {
                                    if (index + 1 >= code.size()
                                            || code.get(index + 1).getOpcode().name().startsWith("MOVE_RESULT") == false)
                                        throw new AssertionError("count return value is discarded in " + owner.getType() + "->" + method.getName());
                                }
                            }
                            if (call.getDefiningClass().equals("Lapp/morphe/extension/chmate/EmptyPostDrafts;")
                                    && call.getName().equals("handle")) calls.merge("empty-draft-guard", 1, Integer::sum);
                        }
                    }
                }
            }
        }
        if (!calls.equals(Map.of("begin", 1, "after", 1, "count", 1, "empty-draft-guard", 1)))
            throw new AssertionError("Unexpected native hook counts: " + calls);
        if (!removedOption) throw new AssertionError("Retired number-count setting or implementation remains in DEX");
        System.out.println("PASS update begin/after/count and empty-draft native hooks; retired option absent");
    }
}
