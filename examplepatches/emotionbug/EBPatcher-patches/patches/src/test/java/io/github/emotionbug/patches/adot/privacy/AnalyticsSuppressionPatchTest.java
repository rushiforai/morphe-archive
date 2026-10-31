package io.github.emotionbug.patches.adot.privacy;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

public class AnalyticsSuppressionPatchTest {
    private final AnalyticsSuppressionPatch patch = new AnalyticsSuppressionPatch();

    private Method original() throws Exception {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK", path != null);
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault()).getEntry(patch.dexEntry()).getDexFile();
        for (ClassDef owner : dex.getClasses()) if (owner.getType().equals(AnalyticsSuppressionPatch.OWNER))
            for (Method method : owner.getMethods()) if (id(method).equals(AnalyticsSuppressionPatch.STOPPED)) return method;
        throw new AssertionError("Original AppsFlyer stop decision not found");
    }

    private static Method withBody(Method method, MethodImplementation body) {
        return new ImmutableMethod(method.getDefiningClass(), method.getName(), method.getParameters(), method.getReturnType(),
                method.getAccessFlags(), method.getAnnotations(), method.getHiddenApiRestrictions(), body);
    }

    @Test public void unsupportedBodyAndDescriptorFailClosedWithoutPrivateFixture() {
        var body = new ImmutableMethodImplementation(1, List.of(
                new ImmutableInstruction11n(Opcode.CONST_4, 0, 0), new ImmutableInstruction11x(Opcode.RETURN, 0)), null, null);
        Method unknown = new ImmutableMethod(AnalyticsSuppressionPatch.OWNER, "AFLogger", List.of(), "Z",
                AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), Set.of(), Set.of(), body);
        assertThrows(IllegalStateException.class, () -> patch.implementation(unknown));
        Method unrelated = new ImmutableMethod("Lcom/google/firebase/messaging/FirebaseMessaging;", "AFLogger", List.of(), "Z",
                unknown.getAccessFlags(), Set.of(), Set.of(), body);
        assertThrows(IllegalStateException.class, () -> patch.implementation(unrelated));
    }

    @Test public void alteredInstructionsRegistersFlagsAndReapplicationAreRejected() throws Exception {
        Method original = original();
        MethodImplementation body = original.getImplementation();
        List<Instruction> instructions = new ArrayList<>();
        body.getInstructions().forEach(instructions::add);
        for (int index = 0; index < instructions.size(); index++) {
            List<Instruction> changed = new ArrayList<>(instructions);
            changed.set(index, new ImmutableInstruction10x(Opcode.NOP));
            Method mutated = withBody(original, new ImmutableMethodImplementation(body.getRegisterCount(), changed, null, null));
            assertThrows(IllegalStateException.class, () -> patch.implementation(mutated));
        }
        Method resized = withBody(original, new ImmutableMethodImplementation(body.getRegisterCount() + 1, instructions, body.getTryBlocks(), null));
        assertThrows(IllegalStateException.class, () -> patch.implementation(resized));
        Method changedFlags = new ImmutableMethod(original.getDefiningClass(), original.getName(), original.getParameters(), original.getReturnType(),
                original.getAccessFlags() ^ AccessFlags.FINAL.getValue(), original.getAnnotations(), original.getHiddenApiRestrictions(), body);
        assertThrows(IllegalStateException.class, () -> patch.implementation(changedFlags));
        assertThrows(IllegalStateException.class, () -> patch.implementation(withBody(original, null)));
        Method patched = withBody(original, patch.implementation(original));
        assertThrows(IllegalStateException.class, () -> patch.implementation(patched));
    }

    @Test public void startupOrStopFalseCannotResumeTrackingAndSdkControlStateIsPreserved() throws Exception {
        Method original = original();
        MethodImplementation rewritten = patch.implementation(original);
        // The original SDK stores its obfuscation counter modulo 128. Exercise every state,
        // including native throw paths, with both values startup/stop(false/true) can store.
        for (int force = 0; force < 128; force++) for (boolean storedStopFlag : new boolean[]{false, true}) {
            Result before = execute(original.getImplementation(), force, storedStopFlag);
            Result after = execute(rewritten, force, storedStopFlag);
            assertEquals("Native exceptional paths must remain unchanged", before.threw, after.threw);
            assertEquals("SDK shared control state must remain unchanged", before.counter, after.counter);
            if (!after.threw) {
                assertEquals(storedStopFlag ? 1 : 0, before.value);
                assertEquals("Stop decision must not depend on mutable SDK stop flag", 1, after.value);
            }
        }
    }

    private record Result(boolean threw, int value, int counter) {}

    /** Executes only the observed pure stop decision; any added call or external access fails. */
    private static Result execute(MethodImplementation body, int force, boolean stopped) {
        Map<Integer, Instruction> code = new HashMap<>();
        int end = 0;
        for (Instruction instruction : body.getInstructions()) {
            code.put(end, instruction);
            end += instruction.getCodeUnits();
        }
        int[] registers = new int[body.getRegisterCount()];
        int counter = -1, pc = 0;
        for (int steps = 0; steps < 30; steps++) {
            Instruction instruction = code.get(pc);
            assertNotNull("Branch must target an instruction", instruction);
            int next = pc + instruction.getCodeUnits();
            int a = ((OneRegisterInstruction) instruction).getRegisterA();
            switch (instruction.getOpcode()) {
                case SGET -> {
                    assertEquals(AnalyticsSuppressionPatch.OWNER + "->force:I", ((ReferenceInstruction) instruction).getReference().toString());
                    registers[a] = force;
                }
                case SPUT -> {
                    assertEquals(AnalyticsSuppressionPatch.OWNER + "->e:I", ((ReferenceInstruction) instruction).getReference().toString());
                    counter = registers[a];
                }
                case IGET_BOOLEAN -> {
                    FieldReference field = (FieldReference) ((ReferenceInstruction) instruction).getReference();
                    assertEquals(AnalyticsSuppressionPatch.OWNER + "->w:Z", field.toString());
                    assertEquals(body.getRegisterCount() - 1, ((TwoRegisterInstruction) instruction).getRegisterB());
                    registers[a] = stopped ? 1 : 0;
                }
                case CONST_4, CONST_16 -> registers[a] = ((NarrowLiteralInstruction) instruction).getNarrowLiteral();
                case ADD_INT_LIT8 -> registers[a] = registers[((TwoRegisterInstruction) instruction).getRegisterB()] + ((NarrowLiteralInstruction) instruction).getNarrowLiteral();
                case REM_INT_LIT8, REM_INT_LIT16 -> registers[a] = registers[((TwoRegisterInstruction) instruction).getRegisterB()] % ((NarrowLiteralInstruction) instruction).getNarrowLiteral();
                case IF_EQZ -> { if (registers[a] == 0) next = pc + ((OffsetInstruction) instruction).getCodeOffset(); }
                case RETURN -> { return new Result(false, registers[a], counter); }
                case THROW -> { assertEquals(0, registers[a]); return new Result(true, -1, counter); }
                default -> throw new AssertionError("Unexpected side effect in stop decision: " + instruction.getOpcode());
            }
            pc = next;
        }
        throw new AssertionError("Stop decision did not terminate");
    }
}
