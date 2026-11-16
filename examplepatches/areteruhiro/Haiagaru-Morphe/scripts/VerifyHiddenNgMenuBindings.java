import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.util.*;
import java.util.zip.ZipFile;

public final class VerifyHiddenNgMenuBindings {
    public static void main(String[] args) throws Exception {
        int[] strings = {0x7f120470, 0x7f10046e, 0x7f100498};
        int[] items = {2131362442, 2131296944, 2131296922};
        for (int a = 0; a < args.length; a++) try (var zip = new ZipFile(args[a])) {
            int profile = a % 3;
            int matches = 0, hooks = 0;
            for (var entry : Collections.list(zip.entries())) {
                if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                byte[] bytes; try (var in = zip.getInputStream(entry)) { bytes = in.readAllBytes(); }
                for (var cls : new DexBackedDexFile(Opcodes.getDefault(), java.nio.ByteBuffer.wrap(bytes)).getClasses()) {
                    for (var method : cls.getMethods()) {
                        if (method.getImplementation() == null || !method.getReturnType().equals("V")
                                || !method.getParameterTypes().equals(List.of("Landroid/view/Menu;"))) continue;
                        var body = new ArrayList<Instruction>();
                        method.getImplementation().getInstructions().forEach(body::add);
                        if (body.stream().noneMatch(i -> i instanceof WideLiteralInstruction l
                                && l.getWideLiteral() == strings[profile])) continue;
                        matches++;
                        if ((method.getAccessFlags() & 8) != 0) throw new AssertionError("Static native method");
                        if (body.stream().noneMatch(i -> i instanceof WideLiteralInstruction l
                                && l.getWideLiteral() == items[profile])) throw new AssertionError("Item ID mismatch");
                        if (body.stream().filter(i -> i.getOpcode() == Opcode.RETURN_VOID).count() != 1)
                            throw new AssertionError("Unexpected exit structure");
                        for (int n = 0; n < body.size(); n++) {
                            if (!(body.get(n) instanceof ReferenceInstruction r)
                                    || !(r.getReference() instanceof MethodReference ref)
                                    || !ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/HiddenNgMenu;")
                                    || !ref.getName().equals("apply")) continue;
                            if (a >= 3) {
                                if (!(body.get(n + 1) instanceof ReferenceInstruction multi)
                                        || !multi.getReference().toString().contains("MultiResponseNg;->menu(")
                                        || body.get(n + 2).getOpcode() != Opcode.RETURN_VOID)
                                    throw new AssertionError("Both menu hooks must run at the native return");
                                var argsRange = (RegisterRangeInstruction) body.get(n + 1);
                                if (argsRange.getRegisterCount() != 2 || argsRange.getStartRegister() != method.getImplementation().getRegisterCount() - 2)
                                    throw new AssertionError("Wrong fragment and Menu argument registers");
                            } else if (body.get(n + 1).getOpcode() != Opcode.RETURN_VOID) throw new AssertionError("Hook before native updates");
                            var invoke = (RegisterRangeInstruction) body.get(n);
                            if (invoke.getRegisterCount() != 1 || invoke.getStartRegister() != method.getImplementation().getRegisterCount() - 1)
                                throw new AssertionError("Wrong Menu argument register");
                            hooks++;
                        }
                    }
                }
            }
            if (matches != 1 || (a >= 3 && hooks != 1)) throw new AssertionError("Native binding " + a + " matches=" + matches + " hooks=" + hooks);
            System.out.println("PASS " + (a >= 3 ? "patched menu exit hooks " + profile : "native menu profile " + a));
        }
    }
}
