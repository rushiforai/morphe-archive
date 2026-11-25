package santodan.patches;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.util.*;

/**
 * Host approximation of ART's argument check for injected extension calls. For every reference
 * argument of a call into {@code prefix}, each reaching definition must have a static type
 * assignable to a declared <em>class</em> parameter (ART accepts any reference for interfaces
 * and Object, so those are skipped). Monet 1.1.2 crashed when a Kotlin EmptyList reached an
 * ArrayList parameter; this rejects that class of mistake before a device does.
 */
final class MonetHookTypes {
    private MonetHookTypes() {}

    static void check(Method method, List<? extends ClassDef> classes, String prefix) {
        Map<String, ClassDef> byType = new HashMap<>();
        classes.forEach(c -> byType.put(c.getType(), c));
        var ins = MonetPremiumPatch.instructions(method);
        var reach = reaching(method, ins);
        int registers = method.getImplementation().getRegisterCount();
        int words = 0;
        for (CharSequence p : method.getParameterTypes()) words += p.charAt(0) == 'J' || p.charAt(0) == 'D' ? 2 : 1;
        boolean isStatic = (method.getAccessFlags() & 8) != 0;
        int firstParameter = registers - words - (isStatic ? 0 : 1);
        for (int n = 0; n < ins.size(); n++) {
            if (!(ins.get(n) instanceof ReferenceInstruction) || !(((ReferenceInstruction) ins.get(n)).getReference() instanceof MethodReference)) continue;
            var target = (MethodReference) ((ReferenceInstruction) ins.get(n)).getReference();
            if (!target.getDefiningClass().startsWith(prefix)) continue;
            List<Integer> args = arguments(ins.get(n));
            int slot = ins.get(n).getOpcode().name.startsWith("invoke-static") ? 0 : 1;
            for (CharSequence parameter : target.getParameterTypes()) {
                String declared = parameter.toString();
                int register = args.get(slot);
                slot += declared.equals("J") || declared.equals("D") ? 2 : 1;
                if (!declared.startsWith("L") || declared.equals("Ljava/lang/Object;") || isInterface(declared, byType)) continue;
                for (String actual : types(method, ins, reach, n, register, firstParameter, isStatic, new HashSet<>()))
                    if (!actual.equals("null") && !assignable(actual, declared, byType))
                        throw new AssertionError(method + " @" + n + " passes " + actual + " in v" + register
                            + " to " + target.getName() + "(" + declared + ")");
            }
        }
    }

    static List<Integer> arguments(Instruction i) {
        List<Integer> r = new ArrayList<>();
        if (i instanceof RegisterRangeInstruction) { var rr = (RegisterRangeInstruction) i; for (int n = 0; n < rr.getRegisterCount(); n++) r.add(rr.getStartRegister() + n); }
        else if (i instanceof FiveRegisterInstruction) {
            var f = (FiveRegisterInstruction) i;
            int[] all = {f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()};
            for (int n = 0; n < f.getRegisterCount(); n++) r.add(all[n]);
        }
        return r;
    }

    /** Static types of the values register {@code register} can hold on entry to instruction {@code at}. */
    static Set<String> types(Method method, List<Instruction> ins, List<Map<Integer, Set<Integer>>> reach, int at, int register,
                             int firstParameter, boolean isStatic, Set<String> visiting) {
        Set<String> result = new TreeSet<>();
        if (!visiting.add(at + ":" + register)) return result;
        for (int d : reach.get(at).getOrDefault(register, Set.of())) {
            if (d < 0) { result.add(parameterType(method, register, firstParameter, isStatic)); continue; }
            Instruction i = ins.get(d);
            Opcode op = i.getOpcode();
            Object ref = i instanceof ReferenceInstruction ? ((ReferenceInstruction) i).getReference() : null;
            if (op == Opcode.NEW_INSTANCE || op == Opcode.CHECK_CAST || op == Opcode.NEW_ARRAY) result.add(((TypeReference) ref).getType());
            else if (op == Opcode.CONST_STRING || op == Opcode.CONST_STRING_JUMBO) result.add("Ljava/lang/String;");
            else if (op == Opcode.CONST_CLASS) result.add("Ljava/lang/Class;");
            else if (op.name.startsWith("const")) result.add("null");
            else if (ref instanceof FieldReference) result.add(((FieldReference) ref).getType());
            else if (op == Opcode.MOVE_RESULT_OBJECT) {
                Object producer = ((ReferenceInstruction) ins.get(d - 1)).getReference();
                result.add(producer instanceof MethodReference ? ((MethodReference) producer).getReturnType() : ((TypeReference) producer).getType());
            }
            else if (op == Opcode.MOVE_EXCEPTION) result.add("Ljava/lang/Throwable;");
            else if (op.name.startsWith("move-object")) result.addAll(types(method, ins, reach, d, ((TwoRegisterInstruction) i).getRegisterB(), firstParameter, isStatic, visiting));
            else result.add("Ljava/lang/Object;"); // aget-object and similar: unknown, treated as unsafe for class parameters.
        }
        return result;
    }

    static String parameterType(Method method, int register, int firstParameter, boolean isStatic) {
        int slot = firstParameter;
        if (!isStatic) { if (register == slot) return method.getDefiningClass(); slot++; }
        for (CharSequence p : method.getParameterTypes()) {
            if (register == slot) return p.toString();
            slot += p.charAt(0) == 'J' || p.charAt(0) == 'D' ? 2 : 1;
        }
        return "Ljava/lang/Object;"; // Uninitialized local: unknown.
    }

    static boolean isInterface(String type, Map<String, ClassDef> byType) {
        ClassDef c = byType.get(type);
        if (c != null) return (c.getAccessFlags() & 0x200) != 0;
        Class<?> host = host(type);
        return host != null && host.isInterface();
    }

    static boolean assignable(String actual, String declared, Map<String, ClassDef> byType) {
        for (String t = actual; t != null; ) {
            if (t.equals(declared)) return true;
            ClassDef c = byType.get(t);
            if (c != null) { t = c.getSuperclass(); continue; }
            Class<?> a = host(t), d = host(declared);
            return a != null && d != null && d.isAssignableFrom(a);
        }
        return false;
    }

    static Class<?> host(String descriptor) {
        if (!descriptor.startsWith("L") || !descriptor.startsWith("Ljava/")) return null;
        try { return Class.forName(descriptor.substring(1, descriptor.length() - 1).replace('/', '.'), false, MonetHookTypes.class.getClassLoader()); }
        catch (ClassNotFoundException missing) { return null; }
    }

    static List<Map<Integer, Set<Integer>>> reaching(Method method, List<Instruction> ins) {
        int[] address = new int[ins.size()];
        Map<Integer, Integer> byAddress = new HashMap<>();
        for (int n = 0; n < ins.size(); n++) {
            if (n > 0) address[n] = address[n - 1] + ins.get(n - 1).getCodeUnits();
            byAddress.put(address[n], n);
        }
        List<Set<Integer>> succ = new ArrayList<>();
        for (int n = 0; n < ins.size(); n++) succ.add(new HashSet<>());
        for (int n = 0; n < ins.size(); n++) {
            Instruction i = ins.get(n);
            Opcode op = i.getOpcode();
            if (op.canContinue() && n + 1 < ins.size()) succ.get(n).add(n + 1);
            boolean sw = op == Opcode.PACKED_SWITCH || op == Opcode.SPARSE_SWITCH;
            if (i instanceof OffsetInstruction && !sw && op != Opcode.FILL_ARRAY_DATA) succ.get(n).add(byAddress.get(address[n] + ((OffsetInstruction) i).getCodeOffset()));
            if (sw && i instanceof OffsetInstruction)
                for (var e : ((SwitchPayload) ins.get(byAddress.get(address[n] + ((OffsetInstruction) i).getCodeOffset()))).getSwitchElements())
                    succ.get(n).add(byAddress.get(address[n] + e.getOffset()));
        }
        for (var t : method.getImplementation().getTryBlocks())
            for (int n = 0; n < ins.size(); n++)
                if (address[n] >= t.getStartCodeAddress() && address[n] < t.getStartCodeAddress() + t.getCodeUnitCount() && ins.get(n).getOpcode().canThrow())
                    for (var h : t.getExceptionHandlers()) succ.get(n).add(byAddress.get(h.getHandlerCodeAddress()));
        List<Map<Integer, Set<Integer>>> in = new ArrayList<>();
        for (int n = 0; n < ins.size(); n++) in.add(new HashMap<>());
        for (int r = 0; r < method.getImplementation().getRegisterCount(); r++) in.get(0).computeIfAbsent(r, k -> new HashSet<>()).add(-1);
        Deque<Integer> work = new ArrayDeque<>(List.of(0));
        while (!work.isEmpty()) {
            int n = work.poll();
            Map<Integer, Set<Integer>> out = new HashMap<>();
            in.get(n).forEach((r, s) -> out.put(r, new HashSet<>(s)));
            Instruction i = ins.get(n);
            if (i.getOpcode().setsRegister() && i instanceof OneRegisterInstruction) {
                int a = ((OneRegisterInstruction) i).getRegisterA();
                out.put(a, new HashSet<>(Set.of(n)));
                if (i.getOpcode().setsWideRegister()) out.put(a + 1, new HashSet<>(Set.of(n)));
            }
            for (int s : succ.get(n)) {
                boolean changed = false;
                for (var e : out.entrySet()) changed |= in.get(s).computeIfAbsent(e.getKey(), k -> new HashSet<>()).addAll(e.getValue());
                if (changed) work.add(s);
            }
        }
        return in;
    }
}
