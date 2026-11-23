import java.io.BufferedInputStream;
import java.util.Collections;
import java.util.Set;
import java.util.zip.ZipFile;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;

/** Rejects late styling hooks that could pass reused integer parameter registers as objects. */
public final class RowStylingRegressionTest {
    private static final String HELPER = "Lapp/zonghome/extension/RowStyling;";
    private static final Set<String> ADAPTERS = Set.of("UsageDetailsAdapter", "UsageAdapter", "UsageSummaryAdapter",
        "BundleAdapter", "ParentBundleAdapter", "ResourcesBundleAdapter", "BundleFilterAdapter", "BundleFilterRangeAdapter", "DynamicSearchAdapter");

    public static void main(String[] args) throws Exception {
        int hooks = 0;
        try (ZipFile apk = new ZipFile(args[0])) {
            for (var entry : Collections.list(apk.entries())) {
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                var dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(),
                    new BufferedInputStream(apk.getInputStream(entry)));
                for (var type : dex.getClasses()) {
                    if (!type.getType().startsWith("Lcom/zong/customercare/view/adapter/")) continue;
                    for (var method : type.getMethods()) {
                        var implementation = method.getImplementation();
                        if (implementation == null) continue;
                        int index = 0;
                        for (var instruction : implementation.getInstructions()) {
                            if (instruction instanceof ReferenceInstruction reference &&
                                reference.getReference() instanceof MethodReference call && call.getDefiningClass().equals(HELPER)) {
                                String adapter = type.getType().substring(type.getType().lastIndexOf('/') + 1)
                                    .split("\\$", 2)[0].replace(";", "");
                                if (!ADAPTERS.contains(adapter)) throw new AssertionError("Unexpected adapter hook: " + type.getType());
                                if (index != 0) throw new AssertionError("Hook uses potentially overwritten parameters: " + method.getName());
                                if (instruction.getOpcode() != Opcode.INVOKE_STATIC_RANGE)
                                    throw new AssertionError("Unexpected hook instruction encoding");
                                int totalSlots = 1;
                                int argumentSlot = call.getName().equals("onBound") ? 1 : -1;
                                for (var parameter : method.getParameterTypes()) {
                                    if (argumentSlot < 0 && parameter.equals("Landroid/view/View;")) argumentSlot = totalSlots;
                                    totalSlots += parameter.equals("J") || parameter.equals("D") ? 2 : 1;
                                }
                                int expected = implementation.getRegisterCount() - totalSlots + argumentSlot;
                                if (argumentSlot < 1 || ((RegisterRangeInstruction)instruction).getStartRegister() != expected)
                                    throw new AssertionError("Hook does not use the original object parameter");
                                hooks++;
                            }
                            index++;
                        }
                    }
                }
            }
        }
        if (hooks < 6) throw new AssertionError("Expected row constructor and binding hooks");
        System.out.println("PASS: " + hooks + " adapter hooks use original object parameters at method entry");
    }
}
