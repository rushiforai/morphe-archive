import java.io.File;
import java.util.*;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;

/** Verify actual output against stock, including all methods outside the four reviewed edits. */
class MitReviewDexCheck {
    static final String OWNER = "Lcom/kaldorgroup/pugpigbolt/net/paywall/MeteredPaywallManager;->";
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
            check(before.getAccessFlags() == after.getAccessFlags(), "Access flags changed");
            if (Objects.equals(body(before), body(after))) continue;
            changed.add(entry.getKey());
            if (entry.getKey().equals(OWNER + "isLocked(Lcom/kaldorgroup/pugpigbolt/domain/Story;)Z")
                || entry.getKey().equals(OWNER + "read(Lcom/kaldorgroup/pugpigbolt/domain/Story;Landroidx/lifecycle/Lifecycle;Ljava/lang/Runnable;)V")) {
                var originalCode = code(before); var patchedCode = code(after);
                check(originalCode.size() == patchedCode.size(), "Meter code size changed");
                int count = 0;
                for (int i=0; i<originalCode.size(); i++) {
                    if (before.getName().equals("isLocked") && originalCode.get(i).getOpcode() == Opcode.CONST_4
                        && ((OneRegisterInstruction)originalCode.get(i)).getRegisterA() == 2
                        && ((NarrowLiteralInstruction)originalCode.get(i)).getNarrowLiteral() == 1) {
                        var actual = patchedCode.get(i);
                        check(actual.getOpcode() == Opcode.CONST_4 && ((OneRegisterInstruction)actual).getRegisterA() == 2
                            && ((NarrowLiteralInstruction)actual).getNarrowLiteral() == 0, "Local article gate still active");
                        patchedCode.set(i, originalCode.get(i)); count++;
                    } else if (before.getName().equals("read") && originalCode.get(i).getOpcode() == Opcode.IF_LT) {
                    var jump = patchedCode.get(i);
                    check(jump.getOpcode() == Opcode.GOTO_16 && jump.getCodeUnits() == originalCode.get(i).getCodeUnits(), "Wrong meter branch");
                    check(((OffsetInstruction)jump).getCodeOffset() == ((OffsetInstruction)originalCode.get(i)).getCodeOffset(), "Branch target changed");
                    patchedCode.set(i, originalCode.get(i)); count++;
                    }
                }
                check(count == 1, "Unexpected meter comparisons");
                var impl = after.getImplementation();
                var restored = new ImmutableMethod(after.getDefiningClass(), after.getName(), after.getParameters(), after.getReturnType(),
                    after.getAccessFlags(), after.getAnnotations(), after.getHiddenApiRestrictions(),
                    new ImmutableMethodImplementation(impl.getRegisterCount(), patchedCode, impl.getTryBlocks(), impl.getDebugItems()));
                check(Objects.equals(body(before), body(restored)), "Other meter code or synchronization changed");
            } else if (entry.getKey().equals(OWNER + "getBannerFragment(Lcom/kaldorgroup/pugpigbolt/domain/Story;)Landroidx/fragment/app/Fragment;")) {
                var instructions = code(after);
                check(instructions.size() == 2 && instructions.get(0).getOpcode() == Opcode.CONST_4
                    && ((NarrowLiteralInstruction)instructions.get(0)).getNarrowLiteral() == 0
                    && instructions.get(1).getOpcode() == Opcode.RETURN_OBJECT, "Banner not removed");
            } else if (entry.getKey().equals("Lcom/kaldorgroup/pugpigbolt/net/Auth;->userInfo()Ljava/util/Map;")) {
                var instructions = code(after);
                check(instructions.size() == code(before).size() + 3, "Unexpected userInfo changes");
                int start = instructions.size() - 4;
                check(instructions.get(start).getOpcode() == Opcode.CONST_STRING
                    && ((OneRegisterInstruction)instructions.get(start)).getRegisterA() == 1
                    && ((StringReference)((ReferenceInstruction)instructions.get(start)).getReference()).getString()
                        .equals("http://schema.pugpig.com/attribute/disable_adverts"), "Ad flag key changed");
                check(instructions.get(start+1).getOpcode() == Opcode.CONST_STRING
                    && ((OneRegisterInstruction)instructions.get(start+1)).getRegisterA() == 2
                    && ((StringReference)((ReferenceInstruction)instructions.get(start+1)).getReference()).getString().equals("true"), "Ad flag missing");
                var put = (FiveRegisterInstruction)instructions.get(start+2);
                check(instructions.get(start+2).getOpcode() == Opcode.INVOKE_INTERFACE && put.getRegisterCount() == 3
                    && put.getRegisterC() == 0 && put.getRegisterD() == 1 && put.getRegisterE() == 2
                    && ((ReferenceInstruction)instructions.get(start+2)).getReference().toString()
                        .equals("Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"), "Wrong ad flag insertion");
                instructions.subList(start, start+3).clear();
                var impl = after.getImplementation();
                var restored = new ImmutableMethod(after.getDefiningClass(), after.getName(), after.getParameters(), after.getReturnType(),
                    after.getAccessFlags(), after.getAnnotations(), after.getHiddenApiRestrictions(),
                    new ImmutableMethodImplementation(impl.getRegisterCount(), instructions, impl.getTryBlocks(), impl.getDebugItems()));
                check(Objects.equals(body(before), body(restored)), "Identity or subscription code changed");
            } else throw new AssertionError("Unrelated method changed: " + entry.getKey());
        }
        check(changed.size() == 4, "Expected four edits: " + changed);
        System.out.println("PASS: four reviewed access/ad edits; " + (stock.size()-4) + " unrelated method bodies unchanged");
    }
}
