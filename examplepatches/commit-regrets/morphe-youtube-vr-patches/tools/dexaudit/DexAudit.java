import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * The dex reader behind scripts/audit-patched-apk.ps1. Three questions, each answered by "which
 * instruction, in which method, references that string":
 *
 * <pre>
 *   inventory  &lt;dex...&gt;              every *app-side* method that references this port's extension
 *   callers    &lt;needle&gt; &lt;dex...&gt;     every method that references anything containing &lt;needle&gt;
 *   inherited  &lt;owner#method&gt; &lt;dex...&gt;  the supertype declaration it overrides, if any
 * </pre>
 *
 * `inherited` is what keeps the reachability check honest: a lifecycle callback such as
 * `onBackPressed` has no dex caller by design, and the framework is not in the dex to call it. A hook
 * that overrides a supertype declaration is answerable to the framework, not to a caller, so the
 * audit can say so instead of listing it as suspicious.
 *
 * Output is one `owner#method|opcode|reference` line per hit, app-side only for `inventory` (the
 * extension's own internal calls are not injections). `inherited` prints one line on a match and
 * nothing otherwise.
 *
 * The classpath comes from the Gradle cache (see the script); this deliberately uses the patcher's
 * own dexlib2 so the reader and the patcher agree on what the dex says.
 */
public class DexAudit {

    private static final String EXTENSION_PACKAGE = "Lapp/ytvr/extension/";

    public static void main(String[] args) throws Exception {
        if (args.length < 2) {
            System.err.println("usage: DexAudit <inventory|callers|inherited|extmembers> "
                + "<needle|-> <dex...>");
            System.exit(2);
        }
        String mode = args[0];
        String needle = args[1];
        List<DexBackedDexFile> dexes = new ArrayList<>();
        for (int i = 2; i < args.length; i++) {
            dexes.add(DexBackedDexFile.fromInputStream(
                Opcodes.getDefault(), new BufferedInputStream(new FileInputStream(args[i]))));
        }
        switch (mode) {
            case "inventory":
                inventory(dexes);
                break;
            case "callers":
                callers(needle, dexes);
                break;
            case "inherited":
                inherited(needle, dexes);
                break;
            case "extmembers":
                extmembers(dexes);
                break;
            default:
                System.err.println("unknown mode: " + mode);
                System.exit(2);
        }
    }

    private static void inventory(List<DexBackedDexFile> dexes) {
        for (DexBackedDexFile dex : dexes) {
            for (ClassDef c : dex.getClasses()) {
                if (c.getType().startsWith(EXTENSION_PACKAGE)) {
                    continue;
                }
                for (Method m : c.getMethods()) {
                    for (Instruction ins : instructions(m)) {
                        if (!(ins instanceof ReferenceInstruction)) {
                            continue;
                        }
                        String ref = String.valueOf(((ReferenceInstruction) ins).getReference());
                        if (ref.contains(EXTENSION_PACKAGE)) {
                            System.out.println(c.getType() + "#" + m.getName() + "|"
                                + ins.getOpcode() + "|" + ref);
                        }
                    }
                }
            }
        }
    }

    /**
     * Exact member inventory of this port's extension classes: one
     * {@code Lapp/ytvr/extension/Class;->member} line per declared method (static or not, the
     * audit's callers decide relevance) and per field. This is what the audit's source-vs-dex
     * check compares against instead of a bare-name text scan -- {@code log}, {@code init},
     * {@code fetch} and friends occur in the app's own dexes, so a name-only search could pass a
     * missing extension member that happens to share its name with app code.
     */
    private static void extmembers(List<DexBackedDexFile> dexes) {
        Set<String> seen = new HashSet<>();
        for (DexBackedDexFile dex : dexes) {
            for (ClassDef c : dex.getClasses()) {
                if (!c.getType().startsWith(EXTENSION_PACKAGE)) {
                    continue;
                }
                for (Method m : c.getMethods()) {
                    String member = c.getType() + "->" + m.getName();
                    if (seen.add(member)) {
                        System.out.println(member);
                    }
                }
                for (com.android.tools.smali.dexlib2.iface.Field f : c.getFields()) {
                    String member = c.getType() + "->" + f.getName();
                    if (seen.add(member)) {
                        System.out.println(member);
                    }
                }
            }
        }
    }

    private static void callers(String needle, List<DexBackedDexFile> dexes) {
        for (DexBackedDexFile dex : dexes) {
            for (ClassDef c : dex.getClasses()) {
                for (Method m : c.getMethods()) {
                    for (Instruction ins : instructions(m)) {
                        if (ins instanceof ReferenceInstruction
                            && String.valueOf(((ReferenceInstruction) ins).getReference()).contains(needle)) {
                            System.out.println(c.getType() + "#" + m.getName() + "|"
                                + ins.getOpcode() + "|" + ((ReferenceInstruction) ins).getReference());
                        }
                    }
                }
            }
        }
    }

    /** `Lowner;#name` (the audit's site format) or `Lowner;->name` in; the overridden declaration out. */
    private static void inherited(String target, List<DexBackedDexFile> dexes) {
        int split = target.contains("#") ? target.indexOf('#') : target.indexOf("->");
        if (split < 0) {
            System.err.println("inherited needs Lowner;#name");
            System.exit(2);
        }
        String owner = target.substring(0, split);
        String name = target.substring(split + (target.charAt(split) == '#' ? 1 : 2));

        Map<String, ClassDef> byType = new HashMap<>();
        for (DexBackedDexFile dex : dexes) {
            for (ClassDef c : dex.getClasses()) {
                byType.put(c.getType(), c);
            }
        }
        ClassDef hook = byType.get(owner);
        if (hook == null) {
            return;
        }
        Set<String> descriptors = new HashSet<>();
        for (Method m : hook.getMethods()) {
            if (m.getName().equals(name)) {
                descriptors.add(descriptorOf(m));
            }
        }
        if (descriptors.isEmpty()) {
            return;
        }
        Set<String> seen = new HashSet<>();
        List<String> queue = new ArrayList<>();
        if (hook.getSuperclass() != null) {
            queue.add(hook.getSuperclass());
        }
        queue.addAll(hook.getInterfaces());
        while (!queue.isEmpty()) {
            String type = queue.remove(0);
            if (!seen.add(type) || type.startsWith("Ljava/") || type.startsWith("Landroid/")) {
                continue;
            }
            ClassDef c = byType.get(type);
            if (c == null) {
                continue;
            }
            for (Method m : c.getMethods()) {
                if (m.getName().equals(name) && descriptors.contains(descriptorOf(m))) {
                    System.out.println("inherited " + c.getType() + ";->" + name + descriptorOf(m));
                    return;
                }
            }
            if (c.getSuperclass() != null) {
                queue.add(c.getSuperclass());
            }
            queue.addAll(c.getInterfaces());
        }
    }

    private static List<Instruction> instructions(Method m) {
        List<Instruction> out = new ArrayList<>();
        if (m.getImplementation() == null) {
            return out;
        }
        for (Instruction ins : m.getImplementation().getInstructions()) {
            out.add(ins);
        }
        return out;
    }

    /** Kept for callers that want a method's parameter types without re-deriving them. */
    static String describe(Method m) {
        StringBuilder sb = new StringBuilder("(");
        for (CharSequence type : m.getParameterTypes()) {
            sb.append(type);
        }
        return sb.append(')').append(m.getReturnType()).toString();
    }

    /**
     * The method's descriptor. dexlib2 has no descriptor accessor -- `MethodReference` exposes only
     * `getDefiningClass`, `getName`, `getParameterTypes` and `getReturnType` (verified against the
     * smali/dexlib2 API docs, 2026-10-13) -- so this builds it from those.
     */
    private static String descriptorOf(Method m) {
        return describe(m);
    }
}
