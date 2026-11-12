import java.util.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x;

/** Restore only reviewed Pro-read results, then compare every method with stock. */
class RevolutionDexCheck {
    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }
    static com.android.tools.smali.dexlib2.iface.Method canonicalTries(com.android.tools.smali.dexlib2.iface.Method m) {
        var impl = m.getImplementation();
        if (impl == null) return m;
        var tries = new ArrayList<ImmutableTryBlock>();
        for (var t : impl.getTryBlocks()) {
            var next = ImmutableTryBlock.of(t);
            if (!tries.isEmpty()) {
                var last = tries.get(tries.size() - 1);
                // DexPool coalesces adjacent ranges with identical ordered handlers.
                if (last.getStartCodeAddress() + last.getCodeUnitCount() == next.getStartCodeAddress() &&
                    last.getExceptionHandlers().equals(next.getExceptionHandlers())) {
                    tries.set(tries.size() - 1, new ImmutableTryBlock(last.getStartCodeAddress(),
                        last.getCodeUnitCount() + next.getCodeUnitCount(), last.getExceptionHandlers()));
                    continue;
                }
            }
            tries.add(next);
        }
        return new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
            m.getAccessFlags(), m.getAnnotations(), m.getHiddenApiRestrictions(), new ImmutableMethodImplementation(
            impl.getRegisterCount(), impl.getInstructions(), tries, impl.getDebugItems()));
    }
    public static void main(String[] args) throws Exception {
        var stock = RemoteAtvDexCheck.classes(args[0]);
        var output = RemoteAtvDexCheck.classes(args[1]);
        check(stock.keySet().equals(output.keySet()), "Class inventory changed");
        int changed = 0, unchanged = 0;
        String search = "Lcom/example/torrentsearchrevolutionv2/presentation/activities/SearchActivity;->";
        var targets = Map.ofEntries(
            Map.entry("Lat2;->g()V", List.of(11)),
            Map.entry("Lat2;->onResume()V", List.of(27)),
            Map.entry(search + "C(Ljava/lang/String;)V", List.of(14)),
            Map.entry(search + "J()V", List.of(35)),
            Map.entry(search + "u()V", List.of(16)),
            Map.entry(search + "onResume()V", List.of(51, 96)),
            Map.entry("Ldb;->onClick(Landroid/content/DialogInterface;I)V", List.of(121)),
            Map.entry("Lj82;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;", List.of(164)),
            Map.entry("Lo12;-><init>(Lfc3;Landroid/content/Context;I)V", List.of(13)),
            Map.entry("Lo6;->d(Landroid/app/Activity;)V", List.of(8)),
            Map.entry("Lo6;->f()Z", List.of(10)),
            Map.entry("Ltp1;->run()V", List.of(159)));
        var seen = new HashSet<String>();
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
                String id = DexInventory.id(m);
                var old = methods.get(id);
                check(old != null && old.getAnnotations().equals(m.getAnnotations()) &&
                    old.getHiddenApiRestrictions().equals(m.getHiddenApiRestrictions()), "Method metadata changed: " + id);
                var restored = m;
                if (targets.containsKey(id)) {
                    check(seen.add(id), "Duplicate method");
                    var impl = m.getImplementation();
                    var ins = new ArrayList<Instruction>(); impl.getInstructions().forEach(ins::add);
                    var original = new ArrayList<Instruction>(); old.getImplementation().getInstructions().forEach(original::add);
                    for (int index : targets.get(id)) {
                        var i = ins.get(index);
                        int register = ((OneRegisterInstruction)original.get(index)).getRegisterA();
                        check(original.get(index).getOpcode() == Opcode.MOVE_RESULT &&
                            i.getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction)i).getNarrowLiteral() == 1 &&
                            ((OneRegisterInstruction)i).getRegisterA() == register, "Wrong Pro read: " + id);
                        ins.set(index, new ImmutableInstruction11x(Opcode.MOVE_RESULT, register)); changed++;
                    }
                    restored = new ImmutableMethod(m.getDefiningClass(), m.getName(), m.getParameters(), m.getReturnType(),
                        m.getAccessFlags(), m.getAnnotations(), m.getHiddenApiRestrictions(), new ImmutableMethodImplementation(
                        impl.getRegisterCount(), ins, impl.getTryBlocks(), impl.getDebugItems()));
                } else unchanged++;
                var a = DexInventory.describe(canonicalTries(old), Set.of());
                var b = DexInventory.describe(canonicalTries(restored), Set.of());
                a.put("params", old.getParameterTypes().stream().map(Object::toString).toList());
                b.put("params", restored.getParameterTypes().stream().map(Object::toString).toList());
                if (!a.equals(b)) {
                    var differences = new TreeMap<String,Object>();
                    for (var key : a.keySet()) if (!Objects.equals(a.get(key), b.get(key)))
                        differences.put(key, Arrays.asList(a.get(key), b.get(key)));
                    throw new AssertionError("Unexpected method change: " + id + " " + differences);
                }
            }
            check(count == methods.size(), "Method removed");
        }
        check(changed == 13 && seen.equals(targets.keySet()), "Pro reads missing");
        System.out.println("PASS: 13 Pro reads, original callbacks/control flow and " + unchanged + " unrelated methods retained");
    }
}
