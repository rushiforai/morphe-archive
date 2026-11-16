import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;

/** Compare the real patched APK against stock, accepting only the reviewed gate edit. */
class ScienceNewsDexCheck {
    static final String GATE =
        "Lcom/appsfornexus/sciencenews/utils/AppPreferences;->getSubscriptionStatus(Landroid/content/Context;)Z";

    static void check(boolean ok, String message) { if (!ok) throw new AssertionError(message); }

    static Map<String,ClassDef> classes(String file) throws Exception {
        var result = new TreeMap<String,ClassDef>();
        var apk = com.android.tools.smali.dexlib2.DexFileFactory.loadDexContainer(new File(file), null);
        for (var name : apk.getDexEntryNames()) if (name.matches("classes\\d*\\.dex"))
            for (var cls : apk.getEntry(name).getDexFile().getClasses())
            check(result.put(cls.getType(), cls) == null, "Duplicate class: " + cls.getType());
        return result;
    }

    static Map<String,Object> describe(Method m) throws Exception {
        var out = DexInventory.describe(m, Set.of());
        out.put("params", m.getParameterTypes().stream().map(Object::toString).toList());
        return out;
    }

    static Map<String,List<Object>> fields(ClassDef c) {
        var result = new TreeMap<String,List<Object>>();
        for (var f : c.getFields()) result.put(f.toString(), Arrays.asList(f.getAccessFlags(),
            f.getAnnotations(), RemoteAtvDexCheck.fieldValue(f.getInitialValue())));
        return result;
    }

    /** The stock input must still be the reviewed preference read before its output is accepted. */
    static void checkStockGate(Map<String,ClassDef> stock) {
        var owner = stock.get("Lcom/appsfornexus/sciencenews/utils/AppPreferences;");
        check(owner != null, "Stock AppPreferences missing");
        Method gate = null;
        for (var m : owner.getMethods()) if (GATE.equals(DexInventory.id(m))) gate = m;
        check(gate != null && gate.getImplementation() != null, "Stock subscription gate missing");
        var code = new ArrayList<Instruction>();
        gate.getImplementation().getInstructions().forEach(code::add);
        check(code.size() == 8, "Stock subscription gate instruction count changed");
        check(code.get(0).getOpcode() == com.android.tools.smali.dexlib2.Opcode.CONST_STRING &&
            ((ReferenceInstruction) code.get(0)).getReference().toString().equals("subscriptionpref"),
            "Stock preference file changed");
        check(code.get(4).getOpcode() == com.android.tools.smali.dexlib2.Opcode.CONST_STRING &&
            ((ReferenceInstruction) code.get(4)).getReference().toString().equals("SUBSCRIPTION_STATUS"),
            "Stock subscription key changed");
        check(code.get(7).getOpcode() == com.android.tools.smali.dexlib2.Opcode.RETURN, "Stock gate does not return");
    }

    /** The patched gate must be exactly const/4 v0,1 followed by return v0. */
    static void checkGate(Method m) {
        var impl = m.getImplementation();
        check(impl != null && impl.getRegisterCount() == 3, "Patched gate frame changed");
        check(impl.getTryBlocks().isEmpty(), "Patched gate gained handlers");
        var code = new ArrayList<Instruction>();
        impl.getInstructions().forEach(code::add);
        check(code.size() == 2, "Patched gate instruction count changed");
        check(code.get(0).getOpcode() == com.android.tools.smali.dexlib2.Opcode.CONST_4, "Gate is not const/4");
        check(((OneRegisterInstruction) code.get(0)).getRegisterA() == 0, "Gate target register changed");
        check(((NarrowLiteralInstruction) code.get(0)).getNarrowLiteral() == 1, "Gate is not constant true");
        check(code.get(1).getOpcode() == com.android.tools.smali.dexlib2.Opcode.RETURN, "Gate does not return");
        check(((OneRegisterInstruction) code.get(1)).getRegisterA() == 0, "Returned register changed");
    }
    public static void main(String[] args) throws Exception {
        var stock = classes(args[0]); var output = classes(args[1]);
        checkStockGate(stock);
        check(stock.keySet().equals(output.keySet()), "Class inventory changed");
        int changed = 0, unchanged = 0;
        for (var name : stock.keySet()) {
            var before = stock.get(name); var after = output.get(name);
            check(before.getAccessFlags() == after.getAccessFlags() &&
                Objects.equals(before.getSuperclass(), after.getSuperclass()) &&
                before.getInterfaces().equals(after.getInterfaces()) &&
                before.getAnnotations().equals(after.getAnnotations()) &&
                fields(before).equals(fields(after)), "Class changed: " + name);
            var methods = new TreeMap<String, Method>();
            for (var m : before.getMethods()) methods.put(DexInventory.id(m), m);
            int count = 0;
            for (var m : after.getMethods()) {
                count++;
                var old = methods.get(DexInventory.id(m));
                check(old != null && old.getAnnotations().equals(m.getAnnotations()), "Method metadata changed");
                if (!GATE.equals(DexInventory.id(m))) {
                    check(DexInventory.describe(old, Set.of()).equals(DexInventory.describe(m, Set.of())),
                        "Unrelated method changed: " + DexInventory.id(m));
                    unchanged++; continue;
                }
                checkGate(m);
                changed++;
            }
            check(count == methods.size(), "Method removed");
        }
        check(changed == 1, "Expected exactly one subscription gate edit");
        System.out.println("PASS: single subscription gate constant true; " + unchanged + " unrelated methods unchanged");
    }
}



