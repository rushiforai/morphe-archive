import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;

/** Compare the real patched APK against stock, accepting only the six reviewed PairIP edits. */
class BoldVoiceDexCheck {
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

    static final String CLIENT = "Lcom/pairip/licensecheck/LicenseClient;";
    static final String STATE = "Lcom/pairip/licensecheck/LicenseClient$LicenseCheckState;";
    static final Set<String> VOID = Set.of(
        "Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V",
        CLIENT + "->initializeLicenseCheck()V", CLIENT + "->startErrorDialogActivity()V",
        CLIENT + "->scheduleAppShutdown()V");

    static void checkEdit(Method old, Method output) throws Exception {
        var body = old.getImplementation();
        check(body != null, "Stock implementation missing");
        var code = new ArrayList<Instruction>();
        body.getInstructions().forEach(code::add);
        String id = DexInventory.id(old);
        if (VOID.contains(id)) {
            check(code.size() > 1, "Stock method already patched: " + id);
            body = new ImmutableMethodImplementation(1, List.of(
                new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x(
                    com.android.tools.smali.dexlib2.Opcode.RETURN_VOID)), List.of(), List.of());
        } else if (id.equals(CLIENT + "->performLocalInstallerCheck()Z")) {
            check(code.size() > 2, "Stock installer check changed");
            body = new ImmutableMethodImplementation(1, List.of(
                new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
                    com.android.tools.smali.dexlib2.Opcode.CONST_4, 0, 1),
                new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x(
                    com.android.tools.smali.dexlib2.Opcode.RETURN, 0)), List.of(), List.of());
        } else {
            int changed = 0;
            for (int i = 0; i < code.size(); i++) {
                var ins = code.get(i);
                if (ins.getOpcode() == com.android.tools.smali.dexlib2.Opcode.SGET_OBJECT &&
                    ((ReferenceInstruction) ins).getReference().toString().equals(STATE + "->CHECK_REQUIRED:" + STATE)) {
                    code.set(i, new com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c(
                        ins.getOpcode(), ((OneRegisterInstruction) ins).getRegisterA(),
                        new com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference(STATE, "FULL_CHECK_OK", STATE)));
                    changed++;
                }
            }
            check(changed == 1, "Stock initial license state changed");
            body = new ImmutableMethodImplementation(body.getRegisterCount(), code, body.getTryBlocks(), body.getDebugItems());
        }
        var expected = new ImmutableMethod(old.getDefiningClass(), old.getName(), old.getParameters(),
            old.getReturnType(), old.getAccessFlags(), old.getAnnotations(), old.getHiddenApiRestrictions(), body);
        check(describe(expected).equals(describe(output)), "Incorrect patched method: " + id);
    }

    public static void main(String[] args) throws Exception {
        var stock = classes(args[0]); var output = classes(args[1]);
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
                if (!VOID.contains(DexInventory.id(m)) &&
                    !Set.of(CLIENT + "-><clinit>()V", CLIENT + "->performLocalInstallerCheck()Z").contains(DexInventory.id(m))) {
                    check(DexInventory.describe(old, Set.of()).equals(DexInventory.describe(m, Set.of())),
                        "Unrelated method changed: " + DexInventory.id(m));
                    unchanged++; continue;
                }
                checkEdit(old, m);
                changed++;
            }
            check(count == methods.size(), "Method removed");
        }
        check(changed == 6, "Expected exactly six PairIP method edits");
        System.out.println("PASS: six PairIP edits, successful license state, VM startup/application wrapper retained; " + unchanged + " unrelated methods unchanged");
    }
}



