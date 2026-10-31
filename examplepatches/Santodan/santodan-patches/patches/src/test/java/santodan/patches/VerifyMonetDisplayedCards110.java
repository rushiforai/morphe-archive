package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import java.nio.file.*;
import java.util.*;

public final class VerifyMonetDisplayedCards110 {
    static void require(boolean value, String message) { if (!value) throw new AssertionError(message); }
    static void reject(List<? extends ClassDef> classes) {
        try { MonetDisplayedCards110.validate(classes); } catch (IllegalStateException expected) { return; }
        throw new AssertionError("Invalid 1.1.0 layout accepted");
    }
    static String ref(Instruction i) { return NuvioPlaybackButtonsPatch.reference(i); }
    static void copies(List<Instruction> ins, int call, int[] sources, Set<Integer> primitives) {
        var range = (RegisterRangeInstruction) ins.get(call);
        require(range.getStartRegister() == 42 && range.getRegisterCount() == sources.length, "Wrong adapter range");
        for (int n = 0; n < sources.length; n++) {
            var i = ins.get(call - sources.length + n);
            require(i.getOpcode() == (primitives.contains(n) ? Opcode.MOVE_FROM16 : Opcode.MOVE_OBJECT_FROM16), "Wrong argument type");
            var move = (TwoRegisterInstruction) i;
            require(move.getRegisterA() == 42+n && move.getRegisterB() == sources[n], "Wrong argument register");
        }
    }
    static void restore(MutableMethod method, Method original, String callback, int sourceIndex, int[] sources, Set<Integer> primitives) {
        var ins = MonetPremiumPatch.instructions(method);
        int call = -1;
        // Reverse from the end, including the second of two button calls first.
        for (int n = 0; n < ins.size(); n++) if (ref(ins.get(n)).contains("->" + callback + "(")) call = n;
        require(call >= 0, "Missing " + callback);
        copies(ins, call, sources, primitives);
        method.getImplementation().replaceInstruction(call, new MutableMethod(original).getImplementation().getInstructions().get(sourceIndex));
        for (int n = 0; n < sources.length; n++) method.getImplementation().removeInstruction(call-sources.length);
    }
    public static void mutation(Method original, Method patched) {
        require(original.getAccessFlags() == patched.getAccessFlags(), "Flags changed");
        require(original.getImplementation().getRegisterCount() == patched.getImplementation().getRegisterCount(), "Registers changed");
        require(original.getImplementation().getTryBlocks().isEmpty() && patched.getImplementation().getTryBlocks().isEmpty(), "Unexpected exception region");
        var before = MonetPremiumPatch.instructions(original); var after = MonetPremiumPatch.instructions(patched);
        var restored = new MutableMethod(patched);
        String s = original.toString();
        if (s.equals(MonetDisplayedCards110.PICKER)) {
            require(after.size() == before.size()+44, "Picker insertion size changed");
            require(((TwoRegisterInstruction)after.get(0)).getRegisterB() == 62 && ((TwoRegisterInstruction)after.get(1)).getRegisterB() == 63, "Wrong min/max inputs");
            require(ref(after.get(2)).equals(MonetDisplayedCards110.MODEL+"->pickerMaximum(II)I"), "No maximum adapter");
            require(((TwoRegisterInstruction)after.get(4)).getRegisterA() == 63 && ((TwoRegisterInstruction)after.get(4)).getRegisterB() == 1, "Maximum not written back");
            for (int n = 0; n < 5; n++) restored.getImplementation().removeInstruction(0);
            restore(restored, original, "footer110", 539, new int[]{0,7,6,1,8,21,62,63}, Set.of(0,6,7));
            restore(restored, original, "buttons", 441, new int[]{0,1,2,3,4,5,6,7,8,9,10,21,62,63}, Set.of(1,9,10,12,13));
            restore(restored, original, "number", 323, new int[]{1,62,63}, Set.of(0,1,2));
            restore(restored, original, "buttons", 316, new int[]{0,1,2,3,4,5,6,7,8,9,10,37,62,63}, Set.of(1,9,10,12,13));
        } else if (s.equals(MonetDisplayedCards110.CLAMP)) {
            require(after.size() == before.size() && ref(after.get(2)).equals("Ljava/lang/Math;->max(II)I"), "Cap not removed");
            var call = (FiveRegisterInstruction)after.get(2);
            require(call.getRegisterCount() == 2 && call.getRegisterC() == 2 && call.getRegisterD() == 0, "Wrong clamp operands");
            for (int value : new int[]{Integer.MIN_VALUE,0,3,4,20,30,372,Integer.MAX_VALUE})
                require(VerifyMonetDisplayedCards.evaluate(patched,value) == Math.max(4,value), "Clamp truncation/overflow");
            restored.getImplementation().replaceInstruction(2,new MutableMethod(original).getImplementation().getInstructions().get(2));
        } else if (s.equals(MonetDisplayedCards110.SCHEMA)) {
            require(after.size() == before.size()+2 && ref(after.get(2)).equals(MonetDisplayedCards110.MODEL+"->schemaMaximum(Ljava/lang/String;I)I"), "Missing schema adapter");
            var call = (FiveRegisterInstruction)after.get(2);
            require(call.getRegisterC() == 13 && call.getRegisterD() == 1 && ((OneRegisterInstruction)after.get(3)).getRegisterA() == 1, "Wrong schema operands");
            restored.getImplementation().removeInstruction(3); restored.getImplementation().removeInstruction(2);
        } else if (s.equals(MonetDisplayedCards110.APPLY)) {
            require(after.size() == before.size()+2 && ref(after.get(52)).equals(MonetDisplayedCards110.UI+"->properties(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"), "Missing focus adapter");
            var call = (FiveRegisterInstruction)after.get(52);
            require(call.getRegisterC() == 5 && call.getRegisterD() == 14 && ((OneRegisterInstruction)after.get(53)).getRegisterA() == 5, "Wrong focus operands");
            restored.getImplementation().removeInstruction(52); restored.getImplementation().removeInstruction(52);
        } else if (s.equals(MonetDisplayedCards110.TEXT)) {
            require(after.size() == before.size()+2 && ref(after.get(77)).equals(MonetDisplayedCards110.UI+"->text(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;"), "Missing native text adapter");
            var call = (FiveRegisterInstruction)after.get(77);
            require(call.getRegisterC() == 0 && call.getRegisterD() == 5 && ((OneRegisterInstruction)after.get(78)).getRegisterA() == 0, "Wrong text operands");
            restored.getImplementation().removeInstruction(78); restored.getImplementation().removeInstruction(77);
        } else {
            int index = MonetDisplayedCards110.SUMMARIES.get(s);
            require(after.size() == before.size() && ref(after.get(index)).equals(MonetDisplayedCards110.MODEL+"->summary(I)Ljava/lang/String;"), "Missing scoped summary");
            require(after.get(index).getOpcode() == before.get(index).getOpcode(), "Summary invoke encoding changed");
            int source = before.get(index) instanceof RegisterRangeInstruction ? ((RegisterRangeInstruction)before.get(index)).getStartRegister() : ((FiveRegisterInstruction)before.get(index)).getRegisterC();
            int destination = after.get(index) instanceof RegisterRangeInstruction ? ((RegisterRangeInstruction)after.get(index)).getStartRegister() : ((FiveRegisterInstruction)after.get(index)).getRegisterC();
            require(source == destination, "Summary operand changed");
            restored.getImplementation().replaceInstruction(index, new MutableMethod(original).getImplementation().getInstructions().get(index));
        }
        require(NuvioPlaybackButtonsPatch.fingerprint(restored).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(original))), "Unrelated native instructions changed");
    }
    /** Also used for the actual rebuilt APK. */
    public static void audit(List<ClassDef> original, List<ClassDef> patched, boolean premium) {
        var contracts = MonetDisplayedCards110.validate(original);
        Map<String,ClassDef> byType = new HashMap<>(); original.forEach(c->byType.put(c.getType(),c));
        Set<String> seen = new HashSet<>(), callbacks = new HashSet<>(), calls = new HashSet<>();
        int hooks = 0, additions = 0, layout = 0, entitlement = 0;
        Method premiumHook = premium ? MonetPremiumPatch.findUnique(original) : null;
        for (ClassDef c : patched) {
            require(seen.add(c.getType()), "Duplicate class " + c.getType());
            var old = byType.get(c.getType());
            if (old == null) {
                require(c.getType().startsWith("Lsoftware/santodan/extension/monetcards/"), "Unexpected extension " + c.getType());
                additions++;
                if (c.getType().equals(MonetDisplayedCards110.LAYOUT)) {
                    for (Field f : c.getFields()) if (f.getName().equals("modern")) {
                        require(((com.android.tools.smali.dexlib2.iface.value.BooleanEncodedValue)f.getInitialValue()).getValue(), "Wrong runtime binding selection"); layout++;
                    }
                }
                for (Method m : c.getMethods()) {
                    if ((m.getAccessFlags() & 9) == 9) callbacks.add(m.toString());
                    if (c.getType().equals(MonetDisplayedCards110.LAYOUT) && m.getName().equals("<clinit>"))
                        require(MonetPremiumPatch.instructions(m).size() == 1 && MonetPremiumPatch.instructions(m).get(0).getOpcode() == Opcode.RETURN_VOID, "Runtime binding reset in initializer");
                    for (Instruction i : MonetPremiumPatch.instructions(m))
                        require(!ref(i).startsWith("Landroid/widget/") && !ref(i).startsWith("Landroid/app/"), "Unexpected platform UI");
                }
                continue;
            }
            Map<String,Method> methods = new HashMap<>(); old.getMethods().forEach(m->methods.put(m.toString(),m));
            int count = 0;
            for (Method m : c.getMethods()) {
                count++; var before = methods.get(m.toString()); require(before != null, "Unexpected native method");
                if (MonetDisplayedCards110.TARGETS.contains(m.toString())) {
                    mutation(contracts.get(m.toString()),m); hooks++;
                    for (Instruction i : MonetPremiumPatch.instructions(m))
                        if (ref(i).startsWith(MonetDisplayedCards110.UI+"->") || ref(i).startsWith(MonetDisplayedCards110.MODEL+"->")) calls.add(ref(i));
                }
                else if (premium && m.equals(premiumHook)) { VerifyMonet.verifyBehavior(before,m); entitlement++; }
                else if (before.getImplementation() != null) require(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(before)).equals(NuvioPlaybackButtonsPatch.fingerprint(new MutableMethod(m))), "Unrelated method changed " + m);
            }
            require(count == methods.size(), "Native methods lost");
        }
        require(hooks == 8 && layout == 1 && additions == 9 && seen.containsAll(byType.keySet()) && entitlement == (premium ? 1 : 0), "Missing hooks/classes/runtime selection");
        require(calls.size() == 8 && callbacks.containsAll(calls), "Missing or non-public/static runtime callback signature");
        System.out.println("PASS: 1.1.0 eight native card hooks; modern runtime bindings; " + byType.size() + " original classes; " + additions + " extension classes; unrelated methods preserved; premium=" + premium);
    }
    public static void main(String[] args) throws Exception {
        var classes = VerifyMonet.read(args[0]); var contracts = MonetDisplayedCards110.validate(classes);
        // The native generic picker has a decorative O(count) preview loop. Every card
        // entry point supplies false for that preview, so Max never renders billions of dots.
        for (var site : Map.of("La/fp3;",108,"La/fy3;",109,"La/zo2;",130).entrySet()) {
            Method caller = contracts.values().stream().filter(m->m.getDefiningClass().equals(site.getKey())).findFirst().orElseThrow();
            var ins = MonetPremiumPatch.instructions(caller);
            int start = site.getValue();
            require(((NarrowLiteralInstruction)ins.get(start)).getNarrowLiteral() == 4
                && ((NarrowLiteralInstruction)ins.get(start+1)).getNarrowLiteral() == 20
                && ((NarrowLiteralInstruction)ins.get(start+2)).getNarrowLiteral() == 0, "Card picker preview/min/max changed");
        }
        var missing = new ArrayList<>(classes); missing.removeIf(c->c.getType().equals("La/uu1;")); reject(missing);
        var duplicate = new ArrayList<>(classes); duplicate.add(classes.get(0)); reject(duplicate);
        var changedContract = new ArrayList<>(classes);
        ClassDef clampOwner = classes.stream().filter(c->c.getType().equals("La/b13;")).findFirst().orElseThrow();
        var incompatible = new MutableClass(clampOwner);
        incompatible.getMethods().stream().filter(m->m.toString().equals(MonetDisplayedCards110.CLAMP)).findFirst().orElseThrow()
            .getImplementation().replaceInstruction(0,new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n(Opcode.CONST_4,0,3));
        changedContract.set(classes.indexOf(clampOwner),incompatible); reject(changedContract);
        List<MutableClass> changed = new ArrayList<>();
        for (ClassDef c : classes) {
            if (contracts.values().stream().noneMatch(m->MonetDisplayedCards110.TARGETS.contains(m.toString()) && m.getDefiningClass().equals(c.getType()))) continue;
            var copy = new MutableClass(c);
            for (var m : copy.getMethods()) if (MonetDisplayedCards110.TARGETS.contains(m.toString())) {
                MonetDisplayedCards110.apply(m); mutation(contracts.get(m.toString()),m);
                try { MonetDisplayedCards110.apply(m); throw new AssertionError("Already patched accepted"); } catch (IllegalStateException expected) {}
            }
            changed.add(copy);
        }
        var modified = new ArrayList<ClassDef>(classes); modified.removeIf(c->changed.stream().anyMatch(m->m.getType().equals(c.getType()))); modified.addAll(changed); reject(modified);
        Path output = Path.of(args[1]); Files.createDirectories(output.getParent());
        DexPool.writeTo(output.toString(),new ImmutableDexFile(com.android.tools.smali.dexlib2.Opcodes.getDefault(),changed));
        int hooks = 0;
        try (var in = new java.io.BufferedInputStream(Files.newInputStream(output))) {
            for (ClassDef c : DexBackedDexFile.fromInputStream(null,in).getClasses()) for (Method m : c.getMethods())
                if (MonetDisplayedCards110.TARGETS.contains(m.toString())) { mutation(contracts.get(m.toString()),m); hooks++; }
        }
        require(hooks == 8, "Serialized hooks missing");
        System.out.println("PASS: 1.1.0 exact native contracts; missing/duplicate/already-patched rejection; all argument copies; unlimited arithmetic; complete native restoration; DEX write/reload");
    }
}
