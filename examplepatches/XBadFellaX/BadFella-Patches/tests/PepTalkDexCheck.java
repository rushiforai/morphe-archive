import java.util.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference;

/** Compare every method against stock, restoring the single reviewed field operand. */
class PepTalkDexCheck {
    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    static Map<String,Object> describe(com.android.tools.smali.dexlib2.iface.Method method) throws Exception {
        var result = DexInventory.describe(method, Set.of());
        result.put("params", method.getParameterTypes().stream().map(Object::toString).toList());
        return result;
    }
    public static void main(String[] args) throws Exception {
        var stock = RemoteAtvDexCheck.classes(args[0]);
        var output = RemoteAtvDexCheck.classes(args[1]);
        check(stock.keySet().equals(output.keySet()), "Class inventory changed");
        int changed = 0, unchanged = 0;
        for (var name : stock.keySet()) {
            var before = stock.get(name); var after = output.get(name);
            check(before.getAccessFlags() == after.getAccessFlags() &&
                Objects.equals(before.getSuperclass(), after.getSuperclass()) &&
                before.getInterfaces().equals(after.getInterfaces()) &&
                before.getAnnotations().equals(after.getAnnotations()) &&
                RemoteAtvDexCheck.fields(before, false).equals(RemoteAtvDexCheck.fields(after, false)), "Class changed: " + name);
            var methods = new TreeMap<String, com.android.tools.smali.dexlib2.iface.Method>();
            for (var m : before.getMethods()) methods.put(DexInventory.id(m), m);
            int count = 0;
            for (var m : after.getMethods()) {
                count++;
                var old = methods.get(DexInventory.id(m));
                check(old != null && old.getAnnotations().equals(m.getAnnotations()), "Method metadata changed");
                if (DexInventory.id(m).equals("Lx0/c;->invoke(Ljava/lang/Object;)Ljava/lang/Object;")) {
                    var implementation = new MutableMethodImplementation(m.getImplementation());
                    int index = -1;
                    for (int i = 0; i < implementation.getInstructions().size(); i++) {
                        var instruction = implementation.getInstructions().get(i);
                        if (instruction instanceof ReferenceInstruction r && r.getReference().toString().equals(
                            "Lcom/revenuecat/purchases/PurchasesErrorCode;->PurchaseNotAllowedError:Lcom/revenuecat/purchases/PurchasesErrorCode;")) {
                            check(index == -1, "Ambiguous warning handler"); index = i;
                        }
                    }
                    check(index >= 2, "Missing background billing guard");
                    var branch = implementation.getInstructions().get(index + 1);
                    check(branch.getOpcode() == Opcode.IF_EQ && ((TwoRegisterInstruction)branch).getRegisterA() == 0 &&
                        ((TwoRegisterInstruction)branch).getRegisterB() == 2, "Wrong billing error comparison");
                    var networkBranch = implementation.getInstructions().get(index - 1);
                    check(networkBranch.getOpcode() == Opcode.IF_EQ &&
                        ((OffsetInstruction)networkBranch).getCodeOffset() == ((OffsetInstruction)branch).getCodeOffset() + 4,
                        "Billing guard does not retain the existing return target");
                    implementation.removeInstruction(index + 1); implementation.removeInstruction(index);
                    var restored = new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
                        m.getAccessFlags(), m.getAnnotations(), m.getHiddenApiRestrictions(), implementation);
                    check(describe(old).equals(describe(restored)), "Other callback cases or errors changed");
                    changed++; continue;
                }
                if (!DexInventory.id(m).equals("Lft/u0;->b()V")) {
                    check(DexInventory.describe(old, Set.of()).equals(DexInventory.describe(m, Set.of())), "Unrelated method changed: " + m);
                    unchanged++; continue;
                }
                var impl = m.getImplementation();
                var instructions = new ArrayList<Instruction>(); impl.getInstructions().forEach(instructions::add);
                var first = instructions.get(0);
                check(first.getOpcode() == Opcode.SGET_OBJECT && ((OneRegisterInstruction)first).getRegisterA() == 0 &&
                    ((ReferenceInstruction)first).getReference().toString().equals("Lft/s0;->a:Lft/s0;"), "Elite state missing");
                instructions.set(0, new ImmutableInstruction21c(Opcode.SGET_OBJECT, 0,
                    new ImmutableFieldReference("Lft/u0;", "d", "Lft/r0;")));
                var restored = new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
                    m.getAccessFlags(), m.getAnnotations(), m.getHiddenApiRestrictions(), new ImmutableMethodImplementation(
                    impl.getRegisterCount(), instructions, impl.getTryBlocks(), impl.getDebugItems()));
                check(DexInventory.describe(old, Set.of()).equals(DexInventory.describe(restored, Set.of())), "Other Elite publisher code changed");
                changed++;
            }
            check(count == methods.size(), "Method removed");
        }
        check(changed == 2, "Expected publisher and background warning edits");
        System.out.println("PASS: Elite state and scoped background warning guard; " + unchanged + " unrelated methods unchanged");
    }
}
