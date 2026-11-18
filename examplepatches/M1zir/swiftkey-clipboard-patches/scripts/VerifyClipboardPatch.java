import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;

/**
 * Integration test against the ORIGINAL and the actual emitted APK.
 * Executes the small patched methods with a deliberately limited DEX interpreter;
 * unsupported instructions fail, rather than silently producing a result.
 * This does not substitute for Android/ART or end-to-end device testing.
 */
class VerifyClipboardPatch {
    record Clip(long time, boolean pinned, boolean autoAdded) {}
    static int assertions;
    static void check(boolean ok, String message) {
        assertions++;
        if (!ok) throw new AssertionError(message);
    }
    static Map<String, ClassDef> load(String path) throws Exception {
        var result = new HashMap<String, ClassDef>();
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        for (var name : dex.getDexEntryNames()) {
            for (var c : dex.getEntry(name).getDexFile().getClasses())
                check(result.put(c.getType(), c) == null, "Duplicate class " + c.getType());
        }
        return result;
    }
    static Method method(Map<String, ClassDef> classes, String cls, String name) {
        var candidates = new ArrayList<Method>();
        for (var m : classes.get(cls).getMethods()) if (m.getName().equals(name)) candidates.add(m);
        check(candidates.size() == 1, "Expected unique " + cls + "->" + name);
        return candidates.getFirst();
    }
    static List<Instruction> body(Method m) {
        var list = new ArrayList<Instruction>();
        m.getImplementation().getInstructions().forEach(list::add);
        return list;
    }
    static String signature(Instruction i) {
        var s = new StringBuilder(i.getOpcode().name());
        if (i instanceof OneRegisterInstruction a) s.append(":").append(a.getRegisterA());
        if (i instanceof TwoRegisterInstruction b) s.append(":").append(b.getRegisterB());
        if (i instanceof ThreeRegisterInstruction c) s.append(":").append(c.getRegisterC());
        if (i instanceof FiveRegisterInstruction f)
            s.append(":").append(f.getRegisterCount()).append(":").append(f.getRegisterC())
                .append(":").append(f.getRegisterD()).append(":").append(f.getRegisterE())
                .append(":").append(f.getRegisterF()).append(":").append(f.getRegisterG());
        if (i instanceof RegisterRangeInstruction r)
            s.append(":").append(r.getStartRegister()).append(":").append(r.getRegisterCount());
        if (i instanceof ReferenceInstruction r) s.append(":").append(r.getReference());
        if (i instanceof WideLiteralInstruction l) s.append(":").append(l.getWideLiteral());
        if (i instanceof OffsetInstruction o) s.append(":").append(o.getCodeOffset());
        return s.toString();
    }
    static List<String> signatures(Method m) { return body(m).stream().map(VerifyClipboardPatch::signature).toList(); }
    static int execute(Method method, Clip receiver, Object argument) {
        var insns = body(method);
        var r = new Object[method.getImplementation().getRegisterCount()];
        int parameterWords = method.getName().equals("b") ? 3 : 2;
        r[r.length - parameterWords] = receiver;
        r[r.length - parameterWords + 1] = argument;
        var addresses = new HashMap<Integer, Integer>();
        int address = 0;
        for (int n = 0; n < insns.size(); n++) {
            addresses.put(address, n);
            address += insns.get(n).getCodeUnits();
        }
        int pc = 0, offset = 0;
        for (int steps = 0; steps < 100; steps++) {
            var i = insns.get(pc);
            int a = i instanceof OneRegisterInstruction x ? x.getRegisterA() : -1;
            int b = i instanceof TwoRegisterInstruction x ? x.getRegisterB() : -1;
            int c = i instanceof ThreeRegisterInstruction x ? x.getRegisterC() : -1;
            boolean jump = false;
            switch (i.getOpcode()) {
                case CONST_4 -> r[a] = (int)((WideLiteralInstruction)i).getWideLiteral();
                case CONST_STRING -> r[a] = ((StringReference)((ReferenceInstruction)i).getReference()).getString();
                case CHECK_CAST -> { if (!(r[a] instanceof Clip)) throw new ClassCastException(); }
                case INVOKE_STATIC -> {
                    String ref = ((ReferenceInstruction)i).getReference().toString();
                    if (!ref.equals("Lkotlin/jvm/internal/n;->f(Ljava/lang/Object;Ljava/lang/String;)V"))
                        throw new AssertionError("Unsupported invoke " + ref);
                    Objects.requireNonNull(r[((FiveRegisterInstruction)i).getRegisterC()]);
                }
                case IGET_BOOLEAN, IGET_WIDE -> {
                    Clip clip = (Clip)r[b];
                    String field = ((FieldReference)((ReferenceInstruction)i).getReference()).getName();
                    r[a] = switch (field) {
                        case "g" -> clip.time;
                        case "h" -> clip.pinned ? 1 : 0;
                        case "d" -> clip.autoAdded ? 1 : 0;
                        default -> throw new AssertionError("Unexpected field " + field);
                    };
                }
                case IF_EQZ -> jump = ((Number)r[a]).intValue() == 0;
                case IF_NEZ -> jump = ((Number)r[a]).intValue() != 0;
                case CMP_LONG -> r[a] = Long.compare(((Number)r[b]).longValue(), ((Number)r[c]).longValue());
                case SUB_LONG_2ADDR -> r[a] = ((Number)r[a]).longValue() - ((Number)r[b]).longValue();
                case LONG_TO_INT -> r[a] = ((Number)r[b]).intValue();
                case NOP -> {}
                case RETURN -> { return ((Number)r[a]).intValue(); }
                default -> throw new AssertionError("Unsupported opcode " + i.getOpcode());
            }
            if (jump) {
                offset += ((OffsetInstruction)i).getCodeOffset();
                pc = Objects.requireNonNull(addresses.get(offset));
            } else {
                offset += i.getCodeUnits(); pc++;
            }
        }
        throw new AssertionError("Instruction limit exceeded");
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 2) throw new IllegalArgumentException("original.apk patched.apk");
        var original = load(args[0]);
        var patched = load(args[1]);
        Method oldExpiry = method(original, "Lu90/v;", "b"), expiry = method(patched, "Lu90/v;", "b");
        Method oldSort = method(original, "Lu90/v;", "compareTo"), sort = method(patched, "Lu90/v;", "compareTo");
        check(body(expiry).get(0).getOpcode() == Opcode.CONST_4 &&
            ((WideLiteralInstruction)body(expiry).get(0)).getWideLiteral() == 0 &&
            body(expiry).get(1).getOpcode() == Opcode.RETURN, "Missing false expiry return");
        check(signatures(expiry).subList(2, body(expiry).size()).equals(signatures(oldExpiry)),
            "Unexpected changes after expiry short circuit");
        for (int n = 0; n < body(oldSort).size(); n++) {
            if (n != 16 && n != 17)
                check(signature(body(sort).get(n)).equals(signature(body(oldSort).get(n))), "Sort changed at " + n);
        }
        check(body(sort).get(16).getOpcode() == Opcode.CMP_LONG &&
            body(sort).get(17).getOpcode() == Opcode.NOP, "Missing overflow fix");
        // The cleanup still handles explicitly deleted items; persistence still saves the complete list.
        for (var pair : List.of(new String[]{"Lnh0/c;", "invoke"}, new String[]{"Lu90/o;", "h"},
                new String[]{"Lu90/o;", "j"}, new String[]{"Lu90/l;", "b"}, new String[]{"Lyo0/b;", "P"},
                new String[]{"Lyo0/b;", "w"}, new String[]{"Lu90/o;", "g"})) {
            check(signatures(method(original, pair[0], pair[1])).equals(signatures(method(patched, pair[0], pair[1]))),
                "Unexpected deletion/pinning/persistence change " + Arrays.toString(pair));
        }
        int beforeBehavior = assertions;
        long[] times = {0, 3_600_001, 86_400_000, 2_592_000_000L, 31_536_000_000L, Long.MAX_VALUE, Long.MIN_VALUE};
        for (long created : times) for (long now : times)
            for (boolean pinnedFlag : List.of(false, true)) for (boolean auto : List.of(false, true))
                check(execute(expiry, new Clip(created, pinnedFlag, auto), now) == 0, "Entry expired");
        for (long first : times) for (long second : times)
            for (boolean pin1 : List.of(false, true)) for (boolean pin2 : List.of(false, true)) {
                int expected = pin1 == pin2 ? Long.compare(second, first) : pin1 ? -1 : 1;
                check(execute(sort, new Clip(first, pin1, true), new Clip(second, pin2, true)) == expected,
                    "Incorrect pinned-first chronological order");
            }
        Clip recent = new Clip(2_592_000_000L, false, true), old = new Clip(0, false, true);
        check(execute(oldSort, recent, old) > 0, "Original 30-day overflow was not reproduced");
        check(execute(sort, recent, old) < 0, "30-day overflow not corrected");
        System.out.println("PASS: " + (assertions - beforeBehavior) + " emitted-DEX behavior assertions.");
        System.out.println("PASS: exact expiry/order edits; deletion, pinning, save/load methods preserved.");
        System.out.println("Scope: local bytecode execution model, not Android/ART or physical-device validation.");
    }
}
