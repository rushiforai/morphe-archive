package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef;
import com.android.tools.smali.dexlib2.immutable.ImmutableField;
import java.io.File;
import java.util.*;
import org.junit.Assume;
import org.junit.Test;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;
import static io.github.emotionbug.patches.adot.summary.LocalGemmaSummaryPatchTest.*;
import static org.junit.Assert.*;

/** Exact APK bytecode fixture only; never executes vendor code or touches a phone. */
public final class NativeSummaryPersistencePatchTest {
    public static void assertBoundary(Method method, MethodImplementation rewritten) {
        if (id(method).equals(NativeSummaryPersistencePatch.PUBLICATION)) {
            assertPublication(method.getImplementation(), rewritten);
            return;
        }
        MethodImplementation original = method.getImplementation();
        assertEquals(original.getRegisterCount(), rewritten.getRegisterCount());
        var before = code(original); var after = code(rewritten);
        boolean insert = id(method).equals(NativeSummaryPersistencePatch.INSERT);
        Map<Integer, Integer> targets = new HashMap<>(), relocated = new HashMap<>();
        int next = 0, hooks = 0;
        for (var entry : before.entrySet()) {
            int pc = entry.getKey(); targets.put(pc, next);
            if (insert ? pc == 0x451 || pc == 0x464 : entry.getValue().getOpcode() == Opcode.RETURN_VOID) {
                Instruction hook = after.get(next);
                assertEquals(Opcode.INVOKE_STATIC, hook.getOpcode());
                MethodReference ref = (MethodReference) ((ReferenceInstruction) hook).getReference();
                assertEquals(LocalGemmaSummaryPatch.HOOK, ref.getDefiningClass());
                assertEquals(insert ? "beforeApiInsert" : id(method).equals(NativeSummaryPersistencePatch.STORAGE)
                        ? "storage" : "association", ref.getName());
                FiveRegisterInstruction args = (FiveRegisterInstruction) hook;
                assertEquals(1, args.getRegisterCount()); assertEquals(insert ? 7 : 0, args.getRegisterC());
                next += 3;
                assertEquals(Opcode.NOP, after.get(next++).getOpcode()); hooks++;
            }
            relocated.put(pc, next);
            Instruction actual = after.get(next);
            assertNotNull(actual);
            assertEquals("Original operation changed at " + pc, operands(entry.getValue()), operands(actual));
            next += actual.getCodeUnits();
        }
        targets.put(end(before), next);
        assertEquals(end(after), next); assertEquals(insert ? 2 : 1, hooks);
        for (var entry : before.entrySet()) {
            int pc = entry.getKey(), current = relocated.get(pc);
            Instruction instruction = entry.getValue();
            if (instruction instanceof OffsetInstruction branch) {
                int target = targets.get(pc + branch.getCodeOffset());
                assertEquals(target, current + ((OffsetInstruction) after.get(current)).getCodeOffset());
                if (instruction.getOpcode() == Opcode.PACKED_SWITCH || instruction.getOpcode() == Opcode.SPARSE_SWITCH) {
                    var oldCases = ((SwitchPayload) before.get(pc + branch.getCodeOffset())).getSwitchElements();
                    var newCases = ((SwitchPayload) after.get(target)).getSwitchElements();
                    assertEquals(oldCases.size(), newCases.size());
                    for (int i = 0; i < oldCases.size(); i++) {
                        assertEquals(oldCases.get(i).getKey(), newCases.get(i).getKey());
                        assertEquals((int) targets.get(pc + oldCases.get(i).getOffset()), current + newCases.get(i).getOffset());
                    }
                }
            }
            assertEquals(handlers(original, pc, targets), handlers(rewritten, current, null));
        }
    }

    private static void assertPublication(MethodImplementation original, MethodImplementation rewritten) {
        var before = code(original); var after = code(rewritten);
        assertEquals(original.getRegisterCount() + 1, rewritten.getRegisterCount());
        int next = 0;
        for (int register = 11; register <= 15; register++) {
            Instruction move = after.get(next);
            assertEquals(Opcode.MOVE_OBJECT_FROM16, move.getOpcode());
            assertEquals(register, ((TwoRegisterInstruction) move).getRegisterA());
            assertEquals(register + 1, ((TwoRegisterInstruction) move).getRegisterB());
            next += move.getCodeUnits();
        }
        Map<Integer, Integer> targets = new HashMap<>(), relocated = new HashMap<>();
        Set<Integer> terminal = Set.of(0x2c, 0x116, 0x2d4, 0x2d8);
        for (var entry : before.entrySet()) {
            int pc = entry.getKey(); targets.put(pc, next);
            if (pc == 0x1a) {
                Instruction save = after.get(next);
                assertEquals(Opcode.MOVE_OBJECT_FROM16, save.getOpcode());
                assertEquals(16, ((TwoRegisterInstruction) save).getRegisterA());
                assertEquals(7, ((TwoRegisterInstruction) save).getRegisterB());
                next += save.getCodeUnits();
            }
            if (pc == 0xa5 || terminal.contains(pc)) {
                assertPublicationHook(after.get(next), pc == 0xa5 ? "apiPublicationStart" : "apiPublicationEnd");
                next += 3;
                assertEquals(Opcode.NOP, after.get(next++).getOpcode());
            }
            relocated.put(pc, next);
            assertEquals("Original coroutine operation changed at " + pc, operands(entry.getValue()), operands(after.get(next)));
            next += after.get(next).getCodeUnits();
        }
        int handler = next;
        assertEquals(Opcode.MOVE_EXCEPTION, after.get(next).getOpcode());
        assertEquals(0, ((OneRegisterInstruction) after.get(next++)).getRegisterA());
        assertPublicationHook(after.get(next), "apiPublicationEnd"); next += 3;
        assertEquals(Opcode.THROW, after.get(next).getOpcode());
        assertEquals(0, ((OneRegisterInstruction) after.get(next++)).getRegisterA());
        assertEquals(end(after), next);
        // All original branches, including resumed states and the sentinel return, keep their targets.
        for (var entry : before.entrySet()) {
            int pc = entry.getKey(), current = relocated.get(pc);
            if (entry.getValue() instanceof OffsetInstruction branch) {
                int target = targets.get(pc + branch.getCodeOffset());
                assertEquals(target, current + ((OffsetInstruction) after.get(current)).getCodeOffset());
                if (entry.getValue().getOpcode() == Opcode.PACKED_SWITCH) {
                    var oldCases = ((SwitchPayload) before.get(pc + branch.getCodeOffset())).getSwitchElements();
                    var newCases = ((SwitchPayload) after.get(target)).getSwitchElements();
                    assertEquals(oldCases.size(), newCases.size());
                    for (int i = 0; i < oldCases.size(); i++) {
                        assertEquals(oldCases.get(i).getKey(), newCases.get(i).getKey());
                        assertEquals((int) targets.get(pc + oldCases.get(i).getOffset()), current + newCases.get(i).getOffset());
                    }
                }
            }
        }
        assertEquals(Opcode.RETURN_OBJECT, after.get(targets.get(0x2d1)).getOpcode());
        assertEquals(0, ((OneRegisterInstruction) after.get(targets.get(0x2d1))).getRegisterA());
        assertEquals(1, rewritten.getTryBlocks().size());
        var guarded = rewritten.getTryBlocks().get(0);
        assertEquals((int) targets.get(0x1a), guarded.getStartCodeAddress());
        assertEquals(targets.get(0x2da) - targets.get(0x1a), guarded.getCodeUnitCount());
        assertEquals(1, guarded.getExceptionHandlers().size());
        assertNull(guarded.getExceptionHandlers().get(0).getExceptionType());
        assertEquals(handler, guarded.getExceptionHandlers().get(0).getHandlerCodeAddress());
    }
    private static void assertPublicationHook(Instruction instruction, String name) {
        if ("apiPublicationStart".equals(name)) {
            assertEquals(Opcode.INVOKE_STATIC, instruction.getOpcode());
            FiveRegisterInstruction args = (FiveRegisterInstruction) instruction;
            assertEquals(3, args.getRegisterCount());
            assertEquals(7, args.getRegisterC()); assertEquals(11, args.getRegisterD()); assertEquals(12, args.getRegisterE());
        } else {
            assertEquals(Opcode.INVOKE_STATIC_RANGE, instruction.getOpcode());
            assertEquals(16, ((RegisterRangeInstruction) instruction).getStartRegister());
            assertEquals(1, ((RegisterRangeInstruction) instruction).getRegisterCount());
        }
        MethodReference reference = (MethodReference) ((ReferenceInstruction) instruction).getReference();
        assertEquals(LocalGemmaSummaryPatch.HOOK, reference.getDefiningClass());
        assertEquals(name, reference.getName());
    }
    @Test public void exactFixturePreservesNativeInstructionsAndRejectsSchemaDrift() throws Exception {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide original private APK with EBPATCHER_TEST_APK", path != null);
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        Map<String, ClassDef> classes = new HashMap<>(); Map<String, String> entries = new HashMap<>();
        for (String entry : dex.getDexEntryNames()) for (ClassDef type : dex.getEntry(entry).getDexFile().getClasses()) {
            classes.put(type.getType(), type); entries.put(type.getType(), entry);
        }
        NativeSummaryPersistencePatch.validate(classes::get);
        var patch = new NativeSummaryPersistencePatch(); int count = 0;
        for (ClassDef owner : classes.values()) for (Method method : owner.getMethods()) if (patch.methods().contains(id(method))) {
            assertEquals(patch.dexEntry(), entries.get(owner.getType()));
            MethodImplementation changed = patch.implementation(method); assertBoundary(method, changed); count++;
            assertThrows(IllegalStateException.class, () -> patch.implementation(copy(method, changed)));
        }
        assertEquals(patch.methods().size(), count);
        ClassDef mapping = classes.get("Lly4;"); List<Field> fields = new ArrayList<>();
        mapping.getFields().forEach(field -> { if (!field.getName().equals("d")) fields.add(field); });
        ClassDef changed = new ImmutableClassDef(mapping.getType(), mapping.getAccessFlags(), mapping.getSuperclass(),
                mapping.getInterfaces(), mapping.getSourceFile(), mapping.getAnnotations(), fields, mapping.getMethods());
        assertThrows(IllegalStateException.class, () -> NativeSummaryPersistencePatch.validate(
                type -> type.equals("Lly4;") ? changed : classes.get(type)));
        for (String descriptor : List.of("Lpv9;->b:J", "Lo58;->a:J", "Lyo4;->a:I", "Lyo4;->b:Ljava/lang/String;", "Lyo4;->d:Ljava/util/List;",
                "Lx68;->a:I", "Lx68;->b:Ljava/lang/String;", "Lx68;->c:I", "Lx68;->d:J", "Lx68;->e:J")) {
            String ownerName = descriptor.substring(0, descriptor.indexOf("->"));
            String fieldName = descriptor.substring(descriptor.indexOf("->") + 2, descriptor.indexOf(':'));
            String fieldType = descriptor.substring(descriptor.indexOf(':') + 1);
            ClassDef owner = classes.get(ownerName);
            Field original = null;
            for (Field field : owner.getFields()) if (field.getName().equals(fieldName)) original = field;
            assertNotNull(descriptor, original);
            assertEquals(descriptor, fieldType, original.getType());
            assertEquals(descriptor, 17, original.getAccessFlags());
            for (int drift = 0; drift < 4; drift++) {
                List<Field> altered = new ArrayList<>();
                for (Field field : owner.getFields()) {
                    if (!field.getName().equals(fieldName)) altered.add(field);
                    else if (drift != 0) altered.add(new ImmutableField(ownerName, fieldName,
                            drift == 1 ? "Ljava/lang/Object;" : fieldType,
                            drift == 2 ? 1 : drift == 3 ? 25 : 17,
                            field.getInitialValue(), field.getAnnotations(), field.getHiddenApiRestrictions()));
                }
                ClassDef incompatible = new ImmutableClassDef(ownerName, owner.getAccessFlags(), owner.getSuperclass(),
                        owner.getInterfaces(), owner.getSourceFile(), owner.getAnnotations(), altered, owner.getMethods());
                assertThrows(descriptor + " drift " + drift, IllegalStateException.class,
                        () -> NativeSummaryPersistencePatch.validate(type -> type.equals(ownerName) ? incompatible : classes.get(type)));
            }
        }
        assertTrue(patch.methods().stream().noneMatch(name -> name.contains("Activity;") || name.startsWith("Lj43;") || name.startsWith("Ld33;") || name.startsWith("Ls93;")));
    }
}
