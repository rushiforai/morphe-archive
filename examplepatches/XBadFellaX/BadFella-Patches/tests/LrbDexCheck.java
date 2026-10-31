import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;

/** Verify the LRB output changed exactly the reviewed paywall gate and nothing else. */
class LrbDexCheck {
    static final String EDIT = "Lcom/kaldorgroup/pugpigbolt/net/paywall/StandardPaywallManager;->"
        + "isLocked(Lcom/kaldorgroup/pugpigbolt/domain/Story;)Z";
    static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
    static Map<String,Method> methods(String path) throws Exception {
        var result = new TreeMap<String,Method>();
        var apk = DexFileFactory.loadDexContainer(new File(path), null);
        for (var entry : apk.getDexEntryNames()) for (var cls : apk.getEntry(entry).getDexFile().getClasses())
            for (var method : cls.getMethods())
                check(result.put(DexInventory.id(method), method) == null, "Duplicate method");
        return result;
    }
    static Object body(Method method) throws Exception { return DexInventory.describe(method, Set.of()).get("body"); }
    static List<Instruction> code(Method method) {
        var result = new ArrayList<Instruction>();
        method.getImplementation().getInstructions().forEach(result::add);
        return result;
    }
    public static void main(String[] args) throws Exception {
        var stock = methods(args[0]); var output = methods(args[1]);
        check(stock.keySet().equals(output.keySet()), "Method inventory changed");
        var changed = new TreeSet<String>();
        for (var entry : stock.entrySet()) {
            var before = entry.getValue(); var after = output.get(entry.getKey());
            check(before.getAccessFlags() == after.getAccessFlags(), "Access flags changed: " + entry.getKey());
            if (Objects.equals(body(before), body(after))) continue;
            changed.add(entry.getKey());
            check(entry.getKey().equals(EDIT), "Unrelated method changed: " + entry.getKey());
            var instructions = code(after);
            check(instructions.size() == 2
                && instructions.get(0).getOpcode() == Opcode.CONST_4
                && ((OneRegisterInstruction)instructions.get(0)).getRegisterA() == 0
                && ((NarrowLiteralInstruction)instructions.get(0)).getNarrowLiteral() == 0
                && instructions.get(1).getOpcode() == Opcode.RETURN
                && ((OneRegisterInstruction)instructions.get(1)).getRegisterA() == 0, "Paywall gate not unlocked");
        }
        check(changed.equals(Set.of(EDIT)), "Expected exactly the reviewed paywall edit: " + changed);
        System.out.println("PASS: only StandardPaywallManager.isLocked unlocked; "
            + (stock.size() - 1) + " other method bodies unchanged");
    }
}
