import java.util.*;
import java.util.zip.*;
import java.io.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
public final class FinalUiHooksCheck {
    public static void main(String[] args) throws Exception {
        Set<String> entries = new HashSet<>();
        int selections = 0;

        try (ZipFile apk = new ZipFile(args[0])) {
            for (var entry : Collections.list(apk.entries())) {
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                var dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(),new BufferedInputStream(apk.getInputStream(entry)));
                for (var type : dex.getClasses()) {
                    for (var method : type.getMethods()) {
                        var implementation = method.getImplementation();
                        if (implementation == null) continue;
                        int index = 0;
                        for (var instruction : implementation.getInstructions()) {
                            if (instruction instanceof ReferenceInstruction reference && reference.getReference() instanceof MethodReference call) {
                                boolean startup = type.getType().equals("Lcom/zong/customercare/HomeActivity;") && call.getName().equals("prepareStartup");
                                boolean indicator = type.getType().equals("Lcom/google/android/material/tabs/TabLayout;") && call.getName().equals("tabIndicatorColor");
                                boolean scrolling = type.getType().equals("Landroidx/recyclerview/widget/RecyclerView;") && call.getDefiningClass().equals("Lapp/zonghome/extension/BundleScrolling;");
                                if (scrolling) throw new AssertionError("Obsolete automatic scrolling hook: " + call);
                                if (startup || indicator) {
                                    if (index != 0 || instruction.getOpcode() != Opcode.INVOKE_STATIC_RANGE)
                                        throw new AssertionError("Unsafe late hook: " + call);
                                    int slots = 1;
                                    for (var parameter : method.getParameterTypes()) slots += parameter.equals("J") || parameter.equals("D") ? 2 : 1;
                                    var range = (RegisterRangeInstruction)instruction;
                                    if (range.getStartRegister() != implementation.getRegisterCount()-slots || range.getRegisterCount() != slots)
                                        throw new AssertionError("Unexpected hook argument registers");
                                    entries.add(call.getName());
                                }
                                if (type.getType().equals("LmergeRecords;") && call.getName().equals("refreshValidityControls")) {
                                    if (!(instruction instanceof FiveRegisterInstruction registers) || registers.getRegisterCount() != 0)
                                        throw new AssertionError("Validity callback must not read reused registers");
                                    selections++;
                                }
                            }
                            index++;
                        }
                    }
                }
            }
        }
        if (!entries.containsAll(Set.of("prepareStartup","tabIndicatorColor")) || selections == 0)
            throw new AssertionError("Missing final UI hooks");

        System.out.println("PASS: safe startup and indicator entry hooks; no automatic scrolling hooks; " + selections + " immediate validity refresh exits");
    }
}
