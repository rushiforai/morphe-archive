package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.*;
import java.io.File;
import java.util.*;
import org.junit.Assume;
import org.junit.Test;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;
import static org.junit.Assert.*;

/** Private APK is static input only. No Android code, calls, captures, or network requests execute. */
public final class CloudMonoUploadPatchTest {
    private static String reference(Instruction instruction) {
        return instruction instanceof ReferenceInstruction r ? r.getReference().toString() : "";
    }
    private static String operands(Instruction instruction) {
        StringBuilder result = new StringBuilder(switch (instruction.getOpcode()) {
            case CONST_STRING, CONST_STRING_JUMBO -> "CONST_STRING";
            case GOTO, GOTO_16, GOTO_32 -> "GOTO";
            default -> instruction.getOpcode().toString();
        });
        if (instruction instanceof OneRegisterInstruction r) result.append("/a").append(r.getRegisterA());
        if (instruction instanceof TwoRegisterInstruction r) result.append("/b").append(r.getRegisterB());
        if (instruction instanceof ThreeRegisterInstruction r) result.append("/c").append(r.getRegisterC());
        if (instruction instanceof FiveRegisterInstruction r) result.append('/').append(r.getRegisterCount()).append('/').append(r.getRegisterC()).append('/').append(r.getRegisterD()).append('/').append(r.getRegisterE()).append('/').append(r.getRegisterF()).append('/').append(r.getRegisterG());
        if (instruction instanceof RegisterRangeInstruction r) result.append('/').append(r.getStartRegister()).append('/').append(r.getRegisterCount());
        if (instruction instanceof WideLiteralInstruction r) result.append('/').append(r.getWideLiteral());
        return result.append('/').append(reference(instruction)).toString();
    }
    private static void hook(Instruction instruction, String name) {
        assertTrue(instruction.getOpcode() == Opcode.INVOKE_STATIC || instruction.getOpcode() == Opcode.INVOKE_STATIC_RANGE);
        assertTrue(reference(instruction), reference(instruction).startsWith(CloudMonoUploadPatch.HOOK + "->" + name + "("));
    }
    private static List<String> handlers(MethodImplementation body, int pc, Map<Integer, Integer> targets) {
        List<String> result = new ArrayList<>();
        for (var block : body.getTryBlocks()) if (pc >= block.getStartCodeAddress()
                && pc < block.getStartCodeAddress() + block.getCodeUnitCount())
            for (var handler : block.getExceptionHandlers()) result.add(handler.getExceptionType() + ":" +
                    (targets == null ? handler.getHandlerCodeAddress() : targets.get(handler.getHandlerCodeAddress())));
        return result;
    }

    public static void assertBoundary(Method original, MethodImplementation rewritten) {
        if (id(original).equals(CloudMonoUploadPatch.STAGE_ONE) || id(original).equals(CloudMonoUploadPatch.UPDATE)) {
            assertStageTransitions(original, rewritten);
            return;
        }
        boolean scope = id(original).equals(CloudMonoUploadPatch.SCOPE);
        assertEquals(original.getImplementation().getRegisterCount(), rewritten.getRegisterCount());
        List<Instruction> before = new ArrayList<>(), after = new ArrayList<>();
        original.getImplementation().getInstructions().forEach(before::add); rewritten.getInstructions().forEach(after::add);
        Map<Integer, Integer> targets = new HashMap<>(), relocated = new HashMap<>();
        Map<Integer, Instruction> actual = new HashMap<>(), source = new HashMap<>();
        int oldPc = 0, newPc = 0, next = 0, selected = 0, suspended = 0;
        boolean cast = false;
        for (Instruction old : before) {
            source.put(oldPc, old);
            targets.put(oldPc, newPc);
            boolean end = scope && (oldPc == 0x79 || old.getOpcode() == Opcode.RETURN_OBJECT
                    && ((OneRegisterInstruction) old).getRegisterA() != 3);
            boolean begin = scope && oldPc == 0xd1;
            if (end || begin) {
                Instruction injected = after.get(next++); hook(injected, begin ? "begin" : "end");
                if (end) assertEquals(2, ((RegisterRangeInstruction) injected).getStartRegister());
                else {
                    assertEquals(2, ((FiveRegisterInstruction) injected).getRegisterC());
                    assertEquals(4, ((FiveRegisterInstruction) injected).getRegisterD());
                }
                newPc += injected.getCodeUnits();
            }
            Instruction current = after.get(next++);
            relocated.put(oldPc, newPc); actual.put(oldPc, current);
            boolean selector = reference(old).equals("Lgoq;->a()Lpnq;");
            if (selector) {
                assertFalse(scope); hook(current, "selected");
                int receiver = old instanceof RegisterRangeInstruction r ? r.getStartRegister() : ((FiveRegisterInstruction) old).getRegisterC();
                assertEquals(receiver, ((RegisterRangeInstruction) current).getStartRegister());
                selected++;
            } else assertEquals("Original instruction at " + oldPc, operands(old), operands(current));
            newPc += current.getCodeUnits();
            if (cast) {
                Instruction checked = after.get(next++);
                assertEquals(Opcode.CHECK_CAST, checked.getOpcode());
                assertEquals(((OneRegisterInstruction) old).getRegisterA(), ((OneRegisterInstruction) checked).getRegisterA());
                assertEquals("Lpnq;", reference(checked)); newPc += checked.getCodeUnits();
            }
            cast = selector;
            if (scope && old.getOpcode() == Opcode.RETURN_OBJECT && ((OneRegisterInstruction) old).getRegisterA() == 3) suspended++;
            oldPc += old.getCodeUnits();
        }
        targets.put(oldPc, newPc);
        int pc = 0;
        for (Instruction old : before) {
            if (old instanceof OffsetInstruction branch)
                assertEquals("Original control-flow destination " + pc, (int) targets.get(pc + branch.getCodeOffset()),
                        relocated.get(pc) + ((OffsetInstruction) actual.get(pc)).getCodeOffset());
            if (old.getOpcode() == Opcode.PACKED_SWITCH || old.getOpcode() == Opcode.SPARSE_SWITCH) {
                int payload = pc + ((OffsetInstruction) old).getCodeOffset();
                var oldCases = ((SwitchPayload) source.get(payload)).getSwitchElements();
                var newCases = ((SwitchPayload) actual.get(payload)).getSwitchElements();
                assertEquals(oldCases.size(), newCases.size());
                for (int i = 0; i < oldCases.size(); i++) {
                    assertEquals(oldCases.get(i).getKey(), newCases.get(i).getKey());
                    assertEquals((int) targets.get(pc + oldCases.get(i).getOffset()),
                            relocated.get(pc) + newCases.get(i).getOffset());
                }
            }
            if (!scope) assertEquals("Original retry/error coverage " + pc,
                    handlers(original.getImplementation(), pc, targets), handlers(rewritten, relocated.get(pc), null));
            pc += old.getCodeUnits();
        }
        if (scope) {
            assertEquals(1, suspended); assertEquals(0, selected);
            assertEquals(Opcode.MOVE_EXCEPTION, after.get(next++).getOpcode());
            hook(after.get(next++), "end"); assertEquals(Opcode.THROW, after.get(next++).getOpcode());
            assertEquals(1, rewritten.getTryBlocks().size());
            var block = rewritten.getTryBlocks().get(0);
            assertEquals((int) targets.get(0x1c), block.getStartCodeAddress());
            assertEquals(newPc, block.getStartCodeAddress() + block.getCodeUnitCount());
            assertNull(block.getExceptionHandlers().get(0).getExceptionType());
            assertEquals(newPc, block.getExceptionHandlers().get(0).getHandlerCodeAddress());
        } else {
            assertEquals(id(original).equals(CloudMonoUploadPatch.METADATA) ? 3 : 8, selected);
        }
        assertEquals(after.size(), next);
    }
    /** Execute neither HTTP nor vendor code: prove the actual native branch destinations and results. */
    private static void assertStageTransitions(Method original, MethodImplementation rewritten) {
        boolean stage = id(original).equals(CloudMonoUploadPatch.STAGE_ONE);
        assertEquals(original.getImplementation().getRegisterCount(), rewritten.getRegisterCount());
        List<Instruction> before = new ArrayList<>(), after = new ArrayList<>();
        original.getImplementation().getInstructions().forEach(before::add);
        rewritten.getInstructions().forEach(after::add);
        Map<Integer, Integer> targets = new HashMap<>(), relocated = new HashMap<>();
        Map<Integer, Instruction> actual = new HashMap<>();
        Map<Integer, Integer> injectedEdges = new HashMap<>();
        int oldPc = 0, newPc = 0, index = 0;
        for (Instruction old : before) {
            targets.put(oldPc, newPc);
            if (stage && (oldPc == 0x6c || oldPc == 0xeb)) {
                String[] calls = oldPc == 0x6c ? new String[] {"active"} : new String[] {"prepare", "unchangedServerId"};
                for (String name : calls) {
                    Instruction call = after.get(index++); hook(call, name);
                    assertEquals(1, ((RegisterRangeInstruction) call).getStartRegister());
                    newPc += call.getCodeUnits();
                    Instruction result = after.get(index++);
                    assertEquals(name.equals("unchangedServerId") ? Opcode.MOVE_RESULT_OBJECT : Opcode.MOVE_RESULT, result.getOpcode());
                    assertEquals(2, ((OneRegisterInstruction) result).getRegisterA()); newPc += result.getCodeUnits();
                    Instruction branch = after.get(index++);
                    assertEquals(name.equals("prepare") ? Opcode.IF_EQZ : Opcode.IF_NEZ, branch.getOpcode());
                    int nativeTarget = name.equals("active") ? 0x92 : name.equals("prepare") ? 0xe3 : 0x76;
                    injectedEdges.put(nativeTarget, newPc + ((OffsetInstruction) branch).getCodeOffset());
                    newPc += branch.getCodeUnits();
                }
            }
            relocated.put(oldPc, newPc);
            Instruction current = after.get(index++); actual.put(oldPc, current);
            boolean replacement = stage ? oldPc == 0x113 : oldPc == 0xc6;
            if (replacement) {
                hook(current, stage ? "routingType" : "duplicateFallbackId");
                assertEquals(stage ? 1 : 7, ((RegisterRangeInstruction) current).getStartRegister());
            } else assertEquals("Preserve native stage instruction " + oldPc, operands(old), operands(current));
            newPc += current.getCodeUnits();
            if (replacement) {
                Instruction result = after.get(index++);
                assertEquals(Opcode.MOVE_RESULT_OBJECT, result.getOpcode());
                assertEquals(stage ? 2 : 7, ((OneRegisterInstruction) result).getRegisterA());
                newPc += result.getCodeUnits();
                if (stage) {
                    Instruction cast = after.get(index++);
                    assertEquals(Opcode.CHECK_CAST, cast.getOpcode()); assertEquals("Lkmq;", reference(cast));
                    newPc += cast.getCodeUnits();
                }
            }
            oldPc += old.getCodeUnits();
        }
        targets.put(oldPc, newPc); assertEquals(after.size(), index);
        int pc = 0;
        for (Instruction old : before) {
            if (old instanceof OffsetInstruction branch)
                assertEquals("Preserve native stage destination " + pc, (int) targets.get(pc + branch.getCodeOffset()),
                        relocated.get(pc) + ((OffsetInstruction) actual.get(pc)).getCodeOffset());
            pc += old.getCodeUnits();
        }
        injectedEdges.forEach((nativeTarget, actualTarget) -> assertEquals(targets.get(nativeTarget), actualTarget));
        if (stage) {
            // Missing/unreadable source follows the existing boolean-false error branch before prepare.
            assertEquals(Opcode.IF_NEZ, actual.get(0xc8).getOpcode());
            assertEquals("Looq;", reference(actual.get(0xe3)));
            assertEquals("Ls68;->e:Ls68;", reference(actual.get(0xe5)));
            assertEquals("Looq;-><init>(Ls68;I)V", reference(actual.get(0xe7)));
            // Unchanged existing IDs still reach the native poq shortcut; changed IDs pass through
            // the old account check and select UPDATE ordinal1, not POST ordinal0.
            assertEquals("Ljava/lang/Number;->longValue()J", reference(actual.get(0x76)));
            assertEquals("Lpoq;", reference(actual.get(0x87)));
            assertEquals(Opcode.IF_EQZ, actual.get(0x119).getOpcode());
            assertEquals("Lzoq;->f(Ljmq;Lh58;)Ljava/lang/Object;", reference(actual.get(0x125)));
            assertEquals("Lzoq;->g(JLjmq;Lh58;)Ljava/lang/Object;", reference(actual.get(0x13c)));
        } else {
            // Actual successful PATCH response still returns poq. Ambiguous duplicate responses
            // with null fallback ID take ooq(null, retry=true), never the stale-ID upload branch.
            assertEquals("Lpoq;", reference(actual.get(0xb6)));
            assertEquals(Opcode.IF_EQZ, actual.get(0x105).getOpcode());
            assertEquals((int) targets.get(0x10d), relocated.get(0x105) + ((OffsetInstruction) actual.get(0x105)).getCodeOffset());
            assertEquals("Looq;", reference(actual.get(0x10d)));
            var constructor = (FiveRegisterInstruction) actual.get(0x10f);
            assertEquals(5, constructor.getRegisterD()); assertEquals(4, constructor.getRegisterE());
        }
        assertTrue(rewritten.getTryBlocks().isEmpty()); // Cancellation is not intercepted by these additions.
    }


    @Test public void onlyCloudMetadataAndUploadUseMonoAndCoroutineSuspensionKeepsLease() throws Exception {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide original private APK via EBPATCHER_TEST_APK", path != null);
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        Map<String, ClassDef> classes = new HashMap<>(); Map<String, String> entries = new HashMap<>();
        for (String entry : dex.getDexEntryNames()) for (ClassDef owner : dex.getEntry(entry).getDexFile().getClasses()) {
            classes.put(owner.getType(), owner); entries.put(owner.getType(), entry);
        }
        CloudMonoUploadPatch.validate(classes::get);
        // Reflection must track the actual coroutine interfaces, not the former M/u names.
        for (String descriptor : List.of(
                "Lkotlin/coroutines/CoroutineContext;->U(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;",
                "Lwie;->p()Ljava/util/concurrent/CancellationException;")) {
            String ownerName = descriptor.substring(0, descriptor.indexOf("->"));
            ClassDef owner = classes.get(ownerName);
            List<Method> retained = new ArrayList<>();
            owner.getMethods().forEach(method -> { if (!id(method).equals(descriptor)) retained.add(method); });
            ClassDef incompatible = new ImmutableClassDef(owner.getType(), owner.getAccessFlags(), owner.getSuperclass(),
                    owner.getInterfaces(), owner.getSourceFile(), owner.getAnnotations(), owner.getFields(), retained);
            assertThrows(IllegalStateException.class, () -> CloudMonoUploadPatch.validate(
                    type -> type.equals(ownerName) ? incompatible : classes.get(type)));
        }
        var patches = CloudMonoUploadPatch.create(); int count = 0;
        assertEquals(2, patches.size());
        Set<String> targets = new HashSet<>();
        for (var patch : patches) {
            assertFalse(patch.methods().contains("Lgoq;->a()Lpnq;"));
            assertFalse(patch.methods().contains(LocalGemmaSummaryPatch.QUOTA));
            for (String target : patch.methods()) assertTrue("Duplicate cloud hook " + target, targets.add(target));
            for (ClassDef owner : classes.values()) for (Method method : owner.getMethods()) if (patch.methods().contains(id(method))) {
                assertEquals(patch.dexEntry(), entries.get(owner.getType()));
                var body = patch.implementation(method); assertBoundary(method, body); count++;
                Method changed = new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(), method.getReturnType(),
                        method.getAccessFlags(), method.getAnnotations(), method.getHiddenApiRestrictions(), body);
                assertThrows(IllegalStateException.class, () -> patch.implementation(changed));
                for (var other : patches) if (other != patch)
                    assertThrows(IllegalStateException.class, () -> other.implementation(method));
            }
        }
        assertEquals(5, count);
    }
}
