package io.github.emotionbug.patches.adot.recording;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.debug.ImmutableLineNumber;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;

public class RecorderStartupPatchTest {
    private final RecorderStartupPatch patch = new RecorderStartupPatch();

    private static Method target(MethodImplementation body) {
        return new ImmutableMethod(RecorderStartupPatch.OWNER, "onCreate", List.of(), "V",
                AccessFlags.PUBLIC.getValue() | AccessFlags.FINAL.getValue(), Set.of(), Set.of(), body);
    }

    private static MethodImplementation fixture(boolean secondInitialization) {
        List<Instruction> instructions = new ArrayList<>(RecorderStartupPatch.originalEntry());
        instructions.add(new ImmutableInstruction11n(Opcode.CONST_4, 2, secondInitialization ? 1 : 0));
        instructions.add(new ImmutableInstruction21t(Opcode.IF_EQZ, 2, 5));
        instructions.add(new ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0,
                method(RecorderStartupPatch.OWNER, "secondInitialization", List.of(), "V")));
        instructions.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));
        return new ImmutableMethodImplementation(28, instructions,
                List.of(new ImmutableTryBlock(4, 3,
                        List.of(new ImmutableExceptionHandler("Ljava/lang/RuntimeException;", 13)))),
                List.of(new ImmutableLineNumber(0, 1), new ImmutableLineNumber(4, 5), new ImmutableLineNumber(13, 20)));
    }

    private static TreeMap<Integer, Instruction> code(MethodImplementation body) {
        TreeMap<Integer, Instruction> result = new TreeMap<>();
        int address = 0;
        for (Instruction instruction : body.getInstructions()) {
            result.put(address, instruction);
            address += instruction.getCodeUnits();
        }
        return result;
    }

    /** Executes generated branches/registers; external bootstrap result is a process-classification input. */
    private static List<String> execute(MethodImplementation body, boolean recorderChild, boolean originalFailure) {
        Map<Integer, Instruction> instructions = code(body);
        Object app = new Object();
        Object[] registers = new Object[body.getRegisterCount()];
        registers[27] = app;
        List<String> effects = new ArrayList<>();
        Object result = null;
        int address = 0;
        for (int step = 0; step < 30; step++) {
            Instruction instruction = instructions.get(address);
            assertNotNull("Invalid instruction address " + address, instruction);
            int next = address + instruction.getCodeUnits();
            switch (instruction.getOpcode()) {
                case INVOKE_STATIC_RANGE -> {
                    RegisterRangeInstruction invoke = (RegisterRangeInstruction) instruction;
                    MethodReference call = (MethodReference) ((ReferenceInstruction) instruction).getReference();
                    assertEquals(RecorderStartupPatch.BOOTSTRAP + "->initialize(Landroid/app/Application;)Z", id(call));
                    assertEquals(1, invoke.getRegisterCount());
                    assertSame(app, registers[invoke.getStartRegister()]);
                    result = recorderChild ? 1 : 0;
                }
                case MOVE_RESULT -> registers[((OneRegisterInstruction) instruction).getRegisterA()] = result;
                case MOVE_OBJECT_FROM16 -> {
                    TwoRegisterInstruction move = (TwoRegisterInstruction) instruction;
                    registers[move.getRegisterA()] = registers[move.getRegisterB()];
                }
                case CONST_STRING -> registers[((OneRegisterInstruction) instruction).getRegisterA()] =
                        ((StringReference) ((ReferenceInstruction) instruction).getReference()).getString();
                case CONST_4 -> registers[((OneRegisterInstruction) instruction).getRegisterA()] =
                        ((NarrowLiteralInstruction) instruction).getNarrowLiteral();
                case IF_EQZ -> {
                    if (Objects.equals(0, registers[((OneRegisterInstruction) instruction).getRegisterA()]))
                        next = address + ((OffsetInstruction) instruction).getCodeOffset();
                }
                case INVOKE_VIRTUAL -> {
                    FiveRegisterInstruction invoke = (FiveRegisterInstruction) instruction;
                    assertSame(app, registers[invoke.getRegisterC()]);
                    MethodReference call = (MethodReference) ((ReferenceInstruction) instruction).getReference();
                    effects.add(call.getName());
                    if (originalFailure && call.getName().equals("j")) {
                        boolean caught = false;
                        for (TryBlock<? extends ExceptionHandler> block : body.getTryBlocks())
                            if (address >= block.getStartCodeAddress()
                                    && address < block.getStartCodeAddress() + block.getCodeUnitCount()) {
                                next = block.getExceptionHandlers().get(0).getHandlerCodeAddress();
                                caught = true;
                            }
                        assertTrue("Original exception handler must remain effective", caught);
                    }
                }
                case NOP -> { }
                case RETURN_VOID -> { return effects; }
                default -> throw new AssertionError("Unexpected opcode " + instruction.getOpcode());
            }
            address = next;
        }
        throw new AssertionError("Nonterminating startup entry");
    }

    @Test public void onlyRecorderChildSkipsOriginalInitialization() {
        for (boolean secondInitialization : new boolean[] {false, true}) {
            MethodImplementation before = fixture(secondInitialization);
            MethodImplementation after = patch.implementation(target(before));
            assertEquals(secondInitialization ? List.of("j", "secondInitialization") : List.of("j"),
                    execute(before, false, false));
            assertEquals(execute(before, false, false), execute(after, false, false));
            assertEquals(List.of(), execute(after, true, false));
            assertEquals(execute(before, false, true), execute(after, false, true));
            assertPreserved(before, after);
        }
    }

    private static String shape(Instruction instruction) {
        String result = ConnectionEligibilityPatch.shape(instruction);
        if (instruction instanceof RegisterRangeInstruction range)
            result += "/range:" + range.getStartRegister() + ":" + range.getRegisterCount();
        if (instruction instanceof ThreeRegisterInstruction three) result += "/c:" + three.getRegisterC();
        if (instruction instanceof WideLiteralInstruction literal) result += "/wide:" + literal.getWideLiteral();
        if (instruction instanceof DualReferenceInstruction reference) result += "/ref2:" + reference.getReference2();
        if (instruction instanceof SwitchPayload payload)
            for (SwitchElement element : payload.getSwitchElements()) result += "/case:" + element.getKey() + ":" + element.getOffset();
        if (instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.formats.ArrayPayload payload)
            result += "/array:" + payload.getElementWidth() + ":" + payload.getArrayElements();
        return result;
    }

    private static void assertPreserved(MethodImplementation before, MethodImplementation after) {
        int shift = RecorderStartupPatch.PREFIX_CODE_UNITS;
        assertEquals(before.getRegisterCount(), after.getRegisterCount());
        TreeMap<Integer, Instruction> oldCode = code(before), newCode = code(after);
        assertEquals(oldCode.size() + 5, newCode.size());
        for (Map.Entry<Integer, Instruction> entry : oldCode.entrySet())
            assertEquals("Original instruction at " + entry.getKey(), shape(entry.getValue()),
                    shape(newCode.get(entry.getKey() + shift)));
        assertEquals(before.getTryBlocks().size(), after.getTryBlocks().size());
        for (int i = 0; i < before.getTryBlocks().size(); i++) {
            TryBlock<? extends ExceptionHandler> oldTry = before.getTryBlocks().get(i);
            TryBlock<? extends ExceptionHandler> newTry = after.getTryBlocks().get(i);
            assertEquals(oldTry.getStartCodeAddress() + shift, newTry.getStartCodeAddress());
            assertEquals(oldTry.getCodeUnitCount(), newTry.getCodeUnitCount());
            assertEquals(oldTry.getExceptionHandlers().size(), newTry.getExceptionHandlers().size());
            for (int j = 0; j < oldTry.getExceptionHandlers().size(); j++) {
                ExceptionHandler oldHandler = oldTry.getExceptionHandlers().get(j), newHandler = newTry.getExceptionHandlers().get(j);
                assertEquals(oldHandler.getExceptionType(), newHandler.getExceptionType());
                assertEquals(oldHandler.getHandlerCodeAddress() + shift, newHandler.getHandlerCodeAddress());
            }
        }
    }


    @Test public void unsupportedAndAlreadyPatchedMethodsAreRejected() {
        MethodImplementation original = fixture(true);
        assertThrows(IllegalStateException.class, () -> patch.implementation(target(null)));
        assertThrows(IllegalStateException.class, () -> patch.implementation(target(new ImmutableMethodImplementation(
                29, original.getInstructions(), null, null))));
        List<Instruction> changed = new ArrayList<>();
        original.getInstructions().forEach(changed::add);
        changed.set(0, new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16, 1, 27));
        assertThrows(IllegalStateException.class, () -> patch.implementation(target(new ImmutableMethodImplementation(28, changed, null, null))));
        Method staticTarget = new ImmutableMethod(RecorderStartupPatch.OWNER, "onCreate", List.of(), "V",
                AccessFlags.PUBLIC.getValue() | AccessFlags.STATIC.getValue(), Set.of(), Set.of(), original);
        assertThrows(IllegalStateException.class, () -> patch.implementation(staticTarget));
        assertThrows(IllegalStateException.class, () -> patch.implementation(target(patch.implementation(target(original)))));
    }

    @Test public void privateOriginalApkPreservesEveryOriginalInstructionAndHandler() throws Exception {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK", path != null);
        var container = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        var dex = container.getEntry(patch.dexEntry());
        assertNotNull(dex);
        for (ClassDef owner : dex.getDexFile().getClasses()) if (owner.getType().equals(RecorderStartupPatch.OWNER))
            for (Method method : owner.getMethods()) if (id(method).equals(RecorderStartupPatch.TARGET)) {
                MethodImplementation rewritten = patch.implementation(method);
                assertPreserved(method.getImplementation(), rewritten);
                // Child returns through the real injected DEX before any original call executes.
                assertEquals(List.of(), execute(rewritten, true, false));
                return;
            }
        fail("Missing " + RecorderStartupPatch.TARGET);
    }
}
