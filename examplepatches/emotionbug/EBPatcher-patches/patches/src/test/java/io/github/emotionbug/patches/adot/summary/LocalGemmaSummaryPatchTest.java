package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import java.io.File;
import java.util.*;
import org.junit.Assume;
import org.junit.Test;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;
import static org.junit.Assert.*;

/** The private APK is parsed only: no vendor code, calls, model or Android execution. */
public final class LocalGemmaSummaryPatchTest {
    static TreeMap<Integer, Instruction> code(MethodImplementation body) {
        var result = new TreeMap<Integer, Instruction>();
        int address = 0;
        for (Instruction instruction : body.getInstructions()) {
            result.put(address, instruction); address += instruction.getCodeUnits();
        }
        return result;
    }
    static int end(TreeMap<Integer, Instruction> code) {
        return code.lastKey() + code.lastEntry().getValue().getCodeUnits();
    }
    private static Map<Integer, Integer> sites(String descriptor) {
        if (descriptor.equals(LocalGemmaSummaryPatch.RECORDING)) return Map.of(0x87, 2);
        if (descriptor.equals(LocalGemmaSummaryPatch.QUOTA)) return Map.of(0x197, 1, 0x281, 8);
        if (descriptor.equals(LocalGemmaSummaryPatch.ORIGINAL)) return Map.of(0x5f, 8);
        throw new AssertionError(descriptor);
    }
    static String operands(Instruction instruction) {
        Opcode opcode = instruction.getOpcode();
        StringBuilder result = new StringBuilder(switch (opcode) {
            case GOTO, GOTO_16, GOTO_32 -> "GOTO";
            case CONST_STRING, CONST_STRING_JUMBO -> "CONST_STRING";
            default -> opcode.toString();
        });
        if (instruction instanceof OneRegisterInstruction x) result.append("/a").append(x.getRegisterA());
        if (instruction instanceof TwoRegisterInstruction x) result.append("/b").append(x.getRegisterB());
        if (instruction instanceof ThreeRegisterInstruction x) result.append("/c").append(x.getRegisterC());
        if (instruction instanceof VariableRegisterInstruction x) result.append("/n").append(x.getRegisterCount());
        if (instruction instanceof FiveRegisterInstruction x) result.append('/').append(x.getRegisterC()).append('/').append(x.getRegisterD()).append('/').append(x.getRegisterE()).append('/').append(x.getRegisterF()).append('/').append(x.getRegisterG());
        if (instruction instanceof RegisterRangeInstruction x) result.append("/s").append(x.getStartRegister());
        if (instruction instanceof WideLiteralInstruction x) result.append("/l").append(x.getWideLiteral());
        if (instruction instanceof ReferenceInstruction x) result.append("/r").append(x.getReference());
        if (instruction instanceof DualReferenceInstruction x) result.append("/r2").append(x.getReference2());
        if (instruction instanceof ArrayPayload x) result.append("/w").append(x.getElementWidth()).append('/').append(x.getArrayElements());
        return result.toString();
    }
    static List<String> handlers(MethodImplementation body, int address, Map<Integer, Integer> targets) {
        List<String> result = new ArrayList<>();
        for (var block : body.getTryBlocks()) {
            if (address < block.getStartCodeAddress() || address >= block.getStartCodeAddress() + block.getCodeUnitCount()) continue;
            for (var handler : block.getExceptionHandlers()) result.add(handler.getExceptionType() + ":" +
                    (targets == null ? handler.getHandlerCodeAddress() : targets.get(handler.getHandlerCodeAddress())));
        }
        return result;
    }

    /** Used again on actual rebuilt DEX by the integration test, not just the in-memory recipe. */
    public static void assertAdditive(Method method, MethodImplementation rewritten) {
        var original = method.getImplementation();
        assertEquals(original.getRegisterCount(), rewritten.getRegisterCount());
        var before = code(original); var after = code(rewritten);
        var sites = sites(id(method));
        Map<Integer, Integer> targets = new HashMap<>(), instructions = new HashMap<>();
        int next = 0;
        for (var entry : before.entrySet()) {
            int pc = entry.getKey(); targets.put(pc, next);
            if (sites.containsKey(pc)) {
                Instruction hook = after.get(next);
                assertEquals(Opcode.INVOKE_STATIC_RANGE, hook.getOpcode());
                var registers = (RegisterRangeInstruction) hook;
                assertEquals((int) sites.get(pc), registers.getStartRegister());
                boolean summary = id(method).equals(LocalGemmaSummaryPatch.ORIGINAL);
                assertEquals(summary ? 4 : 1, registers.getRegisterCount());
                String name = summary ? "original" : id(method).equals(LocalGemmaSummaryPatch.QUOTA) ? "quota" : "recording";
                assertEquals(LocalGemmaSummaryPatch.HOOK + "->" + name +
                        (summary ? "(Ljava/lang/Object;JLjava/lang/Object;)V" : "(Ljava/lang/Object;)V"),
                        id((MethodReference) ((ReferenceInstruction) hook).getReference()));
                next += hook.getCodeUnits();
                assertEquals(Opcode.NOP, after.get(next).getOpcode()); next++;
            }
            instructions.put(pc, next);
            Instruction actual = after.get(next);
            assertNotNull("Missing original instruction " + pc, actual);
            assertEquals("Changed original operands " + pc, operands(entry.getValue()), operands(actual));
            next += actual.getCodeUnits();
        }
        targets.put(end(before), next);
        boolean recovery = id(method).equals(LocalGemmaSummaryPatch.ORIGINAL);
        int recoveryEntry = next;
        if (recovery) {
            assertEquals(Opcode.MOVE_EXCEPTION, after.get(next).getOpcode());
            assertEquals(1, ((OneRegisterInstruction) after.get(next++)).getRegisterA());
            Instruction hook = after.get(next);
            assertEquals(LocalGemmaSummaryPatch.HOOK + "->apiFailed(Ljava/lang/Object;J)V",
                    id((MethodReference) ((ReferenceInstruction) hook).getReference()));
            FiveRegisterInstruction args = (FiveRegisterInstruction) hook;
            assertEquals(0, args.getRegisterC()); assertEquals(9, args.getRegisterD()); assertEquals(10, args.getRegisterE());
            next += 3;
            assertEquals(Opcode.THROW, after.get(next).getOpcode());
            assertEquals(1, ((OneRegisterInstruction) after.get(next++)).getRegisterA());
        }
        assertEquals("Unexpected extra instructions", end(after), next);
        for (var entry : before.entrySet()) {
            int pc = entry.getKey(), relocated = instructions.get(pc);
            Instruction instruction = entry.getValue();
            if (instruction instanceof OffsetInstruction branch) {
                int expected = targets.get(pc + branch.getCodeOffset());
                assertEquals("Changed control-flow edge " + pc, expected,
                        relocated + ((OffsetInstruction) after.get(relocated)).getCodeOffset());
                if (instruction.getOpcode() == Opcode.PACKED_SWITCH || instruction.getOpcode() == Opcode.SPARSE_SWITCH) {
                    var oldCases = ((SwitchPayload) before.get(pc + branch.getCodeOffset())).getSwitchElements();
                    var newCases = ((SwitchPayload) after.get(expected)).getSwitchElements();
                    assertEquals(oldCases.size(), newCases.size());
                    for (int i = 0; i < oldCases.size(); i++) {
                        assertEquals(oldCases.get(i).getKey(), newCases.get(i).getKey());
                        assertEquals((int) targets.get(pc + oldCases.get(i).getOffset()), relocated + newCases.get(i).getOffset());
                    }
                }
            }
            List<String> expectedHandlers = handlers(original, pc, targets);
            if (recovery && pc >= 0x18) expectedHandlers.add("null:" + recoveryEntry);
            assertEquals("Changed exception coverage " + pc, expectedHandlers, handlers(rewritten, relocated, null));
        }
        // The resumed original-summary success jumps to the event, not to its displaced field read.
        if (id(method).equals(LocalGemmaSummaryPatch.ORIGINAL)) {
            assertEquals(0x5f, 0x3a + ((OffsetInstruction) before.get(0x3a)).getCodeOffset());
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after.get(targets.get(0x5f)).getOpcode());
        }
        // Both quota hooks must remain the equality fallthrough only. Neither mismatch target invokes a hook.
        if (id(method).equals(LocalGemmaSummaryPatch.QUOTA)) for (int branch : List.of(0x195, 0x27f)) {
            assertEquals(Opcode.IF_NE, before.get(branch).getOpcode());
            int mismatch = branch + ((OffsetInstruction) before.get(branch)).getCodeOffset();
            assertFalse(sites.containsKey(mismatch));
        }
    }

    @Test public void originalFixtureMatchesAllContractsAndOnlyAddsEvents() throws Exception {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK", path != null);
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        Map<String, ClassDef> classes = new HashMap<>(); Map<String, String> entries = new HashMap<>();
        for (String entry : dex.getDexEntryNames()) for (ClassDef type : dex.getEntry(entry).getDexFile().getClasses()) {
            assertNull(classes.put(type.getType(), type)); entries.put(type.getType(), entry);
        }
        LocalGemmaSummaryPatch.validate(classes::get);
        // Runtime identity must not silently fall back to briefing IDs or URI-only matching.
        ClassDef file = classes.get("Lpnq;");
        List<Field> fields = new ArrayList<>();
        file.getFields().forEach(field -> { if (!field.getName().equals("a")) fields.add(field); });
        ClassDef missingRecordingId = new ImmutableClassDef(file.getType(), file.getAccessFlags(), file.getSuperclass(),
                file.getInterfaces(), file.getSourceFile(), file.getAnnotations(), fields, file.getMethods());
        assertThrows(IllegalStateException.class, () -> LocalGemmaSummaryPatch.validate(
                type -> type.equals("Lpnq;") ? missingRecordingId : classes.get(type)));
        // Room's SQLite delegate and suspended briefing ID both moved to d in 14409.
        for (String ownerName : List.of("Lztb;", "Lmx9;")) {
            ClassDef owner = classes.get(ownerName);
            List<Field> retained = new ArrayList<>();
            owner.getFields().forEach(field -> { if (!field.getName().equals("d")) retained.add(field); });
            ClassDef incompatible = new ImmutableClassDef(owner.getType(), owner.getAccessFlags(), owner.getSuperclass(),
                    owner.getInterfaces(), owner.getSourceFile(), owner.getAnnotations(), retained, owner.getMethods());
            assertThrows(IllegalStateException.class, () -> LocalGemmaSummaryPatch.validate(
                    type -> type.equals(ownerName) ? incompatible : classes.get(type)));
        }
        // Pin the provenance mapping too, not merely the event's coroutine body.
        ClassDef mapping = classes.get("Lufa;");
        List<Method> methods = new ArrayList<>();
        for (Method method : mapping.getMethods()) {
            if (!method.getName().equals("invokeSuspend")) { methods.add(method); continue; }
            var body = method.getImplementation();
            List<Instruction> modified = new ArrayList<>();
            body.getInstructions().forEach(modified::add);
            modified.add(0, new ImmutableInstruction10x(Opcode.NOP));
            methods.add(copy(method, new ImmutableMethodImplementation(body.getRegisterCount(), modified, body.getTryBlocks(), body.getDebugItems())));
        }
        ClassDef changedMapping = new ImmutableClassDef(mapping.getType(), mapping.getAccessFlags(), mapping.getSuperclass(),
                mapping.getInterfaces(), mapping.getSourceFile(), mapping.getAnnotations(), mapping.getFields(), methods);
        assertThrows(IllegalStateException.class, () -> LocalGemmaSummaryPatch.validate(
                type -> type.equals("Lufa;") ? changedMapping : classes.get(type)));
        var patch = new LocalGemmaSummaryPatch(); int count = 0;
        for (ClassDef owner : classes.values()) for (Method method : owner.getMethods()) if (patch.methods().contains(id(method))) {
            assertEquals(patch.dexEntry(), entries.get(owner.getType()));
            var changed = patch.implementation(method); assertAdditive(method, changed); count++;
            assertThrows(IllegalStateException.class, () -> patch.implementation(copy(method, changed)));
            var body = method.getImplementation(); List<Instruction> modified = new ArrayList<>();
            body.getInstructions().forEach(modified::add);
            modified.add(0, new ImmutableInstruction10x(Opcode.NOP));
            assertThrows(IllegalStateException.class, () -> patch.implementation(copy(method,
                    new ImmutableMethodImplementation(body.getRegisterCount(), modified, body.getTryBlocks(), body.getDebugItems()))));
        }
        assertEquals(3, count);
    }
    static Method copy(Method source, MethodImplementation body) {
        return new ImmutableMethod(source.getDefiningClass(), source.getName(), source.getParameters(), source.getReturnType(),
                source.getAccessFlags(), source.getAnnotations(), source.getHiddenApiRestrictions(), body);
    }
    private static Method sample(int flags, int registers, List<Instruction> instructions, List<ImmutableTryBlock> tries) {
        return new ImmutableMethod("Lfixture;", "event", List.of(), "V", flags, Set.of(), Set.of(),
                new ImmutableMethodImplementation(registers, instructions, tries, List.of()));
    }
    @Test public void fingerprintBindsRegistersLiteralsReferencesBranchesFlagsAndCatchCoverage() {
        List<Instruction> base = List.of(new ImmutableInstruction11n(Opcode.CONST_4, 0, 1),
                new ImmutableInstruction21c(Opcode.CONST_STRING, 1, new ImmutableStringReference("TICKET_ALL_USED")),
                new ImmutableInstruction10t(Opcode.GOTO, 1), new ImmutableInstruction10x(Opcode.RETURN_VOID));
        String hash = SummaryBytecodeGuard.fingerprint(sample(1, 2, base, List.of()));
        assertEquals(hash, SummaryBytecodeGuard.fingerprint(sample(1, 2, base, List.of())));
        assertNotEquals(hash, SummaryBytecodeGuard.fingerprint(sample(9, 2, base, List.of())));
        assertNotEquals(hash, SummaryBytecodeGuard.fingerprint(sample(1, 3, base, List.of())));
        for (Instruction first : List.of(new ImmutableInstruction11n(Opcode.CONST_4, 1, 1), new ImmutableInstruction11n(Opcode.CONST_4, 0, 2))) {
            var changed = new ArrayList<>(base); changed.set(0, first);
            assertNotEquals(hash, SummaryBytecodeGuard.fingerprint(sample(1, 2, changed, List.of())));
        }
        var changed = new ArrayList<>(base);
        changed.set(1, new ImmutableInstruction21c(Opcode.CONST_STRING, 1, new ImmutableStringReference("OTHER_ERROR")));
        assertNotEquals(hash, SummaryBytecodeGuard.fingerprint(sample(1, 2, changed, List.of())));
        changed = new ArrayList<>(base); changed.set(2, new ImmutableInstruction10t(Opcode.GOTO, -3));
        assertNotEquals(hash, SummaryBytecodeGuard.fingerprint(sample(1, 2, changed, List.of())));
        var handler = new ImmutableExceptionHandler("Ljava/lang/Throwable;", 4);
        assertNotEquals(hash, SummaryBytecodeGuard.fingerprint(sample(1, 2, base, List.of(new ImmutableTryBlock(0, 3, List.of(handler))))));
        var patch = new LocalGemmaSummaryPatch();
        assertThrows(IllegalStateException.class, () -> patch.implementation(sample(1, 2, base, List.of())));
    }
}
