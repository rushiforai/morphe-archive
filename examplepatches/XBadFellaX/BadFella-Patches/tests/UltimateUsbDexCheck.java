import java.util.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.*;

/** Verify the two entitlement replacements and every unrelated DEX method. */
class UltimateUsbDexCheck {
    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    public static void main(String[] args) throws Exception {
        var stock = RemoteAtvDexCheck.classes(args[0]);
        var output = RemoteAtvDexCheck.classes(args[1]);
        check(stock.keySet().equals(output.keySet()), "Class inventory changed");
        var targets = Set.of("Lc81;->d()Z", "Lc81;->f(Lfm1;)Ljava/lang/Object;");
        var seen = new HashSet<String>();
        int unchanged = 0;
        for (var name : stock.keySet()) {
            var before = stock.get(name); var after = output.get(name);
            check(before.getAccessFlags() == after.getAccessFlags() &&
                Objects.equals(before.getSuperclass(), after.getSuperclass()) &&
                Objects.equals(before.getSourceFile(), after.getSourceFile()) &&
                before.getInterfaces().equals(after.getInterfaces()) &&
                before.getAnnotations().equals(after.getAnnotations()) &&
                RemoteAtvDexCheck.fields(before, false).equals(RemoteAtvDexCheck.fields(after, false)),
                "Class changed: " + name);
            var methods = new TreeMap<String, com.android.tools.smali.dexlib2.iface.Method>();
            for (var m : before.getMethods()) methods.put(DexInventory.id(m), m);
            int count = 0;
            for (var m : after.getMethods()) {
                count++;
                String id = DexInventory.id(m);
                var old = methods.get(id);
                check(old != null && old.getAccessFlags() == m.getAccessFlags() &&
                    old.getParameters().equals(m.getParameters()) && old.getAnnotations().equals(m.getAnnotations()) &&
                    old.getHiddenApiRestrictions().equals(m.getHiddenApiRestrictions()), "Method metadata changed: " + id);
                if (targets.contains(id)) {
                    check(seen.add(id), "Duplicate target");
                    var impl = m.getImplementation();
                    check(impl != null && impl.getTryBlocks().isEmpty() && !impl.getDebugItems().iterator().hasNext(),
                        "Unexpected target implementation: " + id);
                    var ins = new ArrayList<Instruction>(); impl.getInstructions().forEach(ins::add);
                    check(ins.size() == 2 && ((OneRegisterInstruction)ins.get(0)).getRegisterA() == 0 &&
                        ((OneRegisterInstruction)ins.get(1)).getRegisterA() == 0, "Wrong target registers: " + id);
                    if (m.getName().equals("d")) {
                        check(impl.getRegisterCount() == 1 && ins.get(0).getOpcode() == Opcode.CONST_4 &&
                            ((NarrowLiteralInstruction)ins.get(0)).getNarrowLiteral() == 1 &&
                            ins.get(1).getOpcode() == Opcode.RETURN, "Pro predicate not true");
                    } else {
                        check(impl.getRegisterCount() == 3 && ins.get(0).getOpcode() == Opcode.SGET_OBJECT &&
                            ((ReferenceInstruction)ins.get(0)).getReference().toString().equals("Lkotlin/Unit;->a:Lkotlin/Unit;") &&
                            ins.get(1).getOpcode() == Opcode.RETURN_OBJECT, "Validator does not return Unit");
                    }
                } else {
                    check(DexInventory.describe(RevolutionDexCheck.canonicalTries(old), Set.of()).equals(
                        DexInventory.describe(RevolutionDexCheck.canonicalTries(m), Set.of())),
                        "Unrelated method changed: " + id);
                    unchanged++;
                }
            }
            check(count == methods.size(), "Method removed: " + name);
        }
        check(seen.equals(targets), "Missing entitlement edits");
        System.out.println("PASS: two entitlement methods; " + unchanged + " unrelated methods retained");
    }
}
