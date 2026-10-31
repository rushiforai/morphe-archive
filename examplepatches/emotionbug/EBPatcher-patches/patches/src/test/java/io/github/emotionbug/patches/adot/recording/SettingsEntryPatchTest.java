package io.github.emotionbug.patches.adot.recording;

import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import java.io.File;
import java.util.*;
import org.junit.*;
import static org.junit.Assert.*;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

public class SettingsEntryPatchTest {
    private final SettingsEntryPatch patch = new SettingsEntryPatch();

    private Method original(String descriptor) throws Exception {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK", path != null);
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault()).getEntry(patch.dexEntry()).getDexFile();
        for (ClassDef owner : dex.getClasses()) for (Method method : owner.getMethods())
            if (id(method).equals(descriptor)) return method;
        throw new AssertionError("Missing actual settings composition method: " + descriptor);
    }
    private static Method withBody(Method target, MethodImplementation body) {
        return new ImmutableMethod(target.getDefiningClass(), target.getName(), target.getParameters(), target.getReturnType(),
                target.getAccessFlags(), target.getAnnotations(), target.getHiddenApiRestrictions(), body);
    }
    private static int relocated(int address) {
        return address < SettingsEntryPatch.INSERTION ? address : address + 3;
    }

    @Test public void rejectsEarlierActivityLifecycleAndMissingImplementation() {
        Method legacy = new ImmutableMethod("Lx0;", "onCreate", List.of(new ImmutableMethodParameter("Landroid/os/Bundle;", Set.of(), null)),
                "V", 17, Set.of(), Set.of(), new ImmutableMethodImplementation(4, List.of(new ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null));
        assertThrows(IllegalStateException.class, () -> patch.implementation(legacy));
        assertThrows(IllegalStateException.class, () -> patch.implementation(withBody(legacy, null)));
    }

    @Test public void rowIsInsideNativeScrollColumnAndPreservesEveryOriginalBranchTarget() throws Exception {
        Method target = original(SettingsEntryPatch.INITIALIZE);
        List<Instruction> before = new ArrayList<>(), after = new ArrayList<>();
        target.getImplementation().getInstructions().forEach(before::add);
        MethodImplementation rewritten = patch.implementation(target);
        rewritten.getInstructions().forEach(after::add);
        int address = 0, insertion = -1;
        for (int index = 0; index < before.size(); index++) {
            if (address == SettingsEntryPatch.INSERTION) insertion = index;
            address += before.get(index).getCodeUnits();
        }
        assertTrue(insertion > 0);
        FiveRegisterInstruction hook = (FiveRegisterInstruction) after.remove(insertion);
        assertEquals(SettingsEntryPatch.ENTRY + "->install(Ljava/lang/Object;)V",
                id((MethodReference) ((ReferenceInstruction) hook).getReference()));
        assertEquals(1, hook.getRegisterCount());
        assertEquals("Use the original composer, not the fragment or a view", 7, hook.getRegisterC());
        assertEquals("Lbyb;->p(Z)V", id((MethodReference) ((ReferenceInstruction) before.get(insertion - 1)).getReference()));
        assertEquals(Opcode.IGET_OBJECT, before.get(insertion).getOpcode());
        assertEquals(before.size(), after.size());
        address = 0;
        boolean loopExit = false;
        for (int index = 0; index < before.size(); index++) {
            Instruction old = before.get(index), current = after.get(index);
            String oldShape = ConnectionEligibilityPatch.shape(old), newShape = ConnectionEligibilityPatch.shape(current);
            if (old instanceof OffsetInstruction branch) {
                int destination = address + branch.getCodeOffset();
                assertEquals("Retain original control flow at " + address, relocated(destination),
                        relocated(address) + ((OffsetInstruction) current).getCodeOffset());
                if (address == 0x105) {
                    assertEquals("Loop exhaustion closes its group before reaching the new row", 0x1e4, destination);
                    loopExit = true;
                }
                oldShape = oldShape.replace("/o" + branch.getCodeOffset(), "");
                newShape = newShape.replace("/o" + ((OffsetInstruction) current).getCodeOffset(), "");
            }
            assertEquals(oldShape, newShape);
            address += old.getCodeUnits();
        }
        assertTrue(loopExit);
        assertEquals(target.getImplementation().getRegisterCount(), rewritten.getRegisterCount());
        assertEquals(target.getImplementation().getTryBlocks(), rewritten.getTryBlocks());
    }

    @Test public void exactAndroidViewBoundaryIsValidatedButNotRewritten() throws Exception {
        Method target = original(SettingsEntryPatch.ANDROID_VIEW);
        assertEquals(io.github.emotionbug.patches.adot.summary.SummaryBytecodeGuard.fingerprint(target),
                io.github.emotionbug.patches.adot.summary.SummaryBytecodeGuard.fingerprint(withBody(target, patch.implementation(target))));
    }

    @Test public void changedRendererOrBridgeAndRendererReapplicationAreRejected() throws Exception {
        for (String descriptor : patch.methods()) {
            Method target = original(descriptor);
            List<Instruction> original = new ArrayList<>();
            target.getImplementation().getInstructions().forEach(original::add);
            for (int index = 0; index < original.size(); index++) {
                List<Instruction> changed = new ArrayList<>(original);
                changed.set(index, new ImmutableInstruction10x(Opcode.NOP));
                Method incompatible = withBody(target, new ImmutableMethodImplementation(target.getImplementation().getRegisterCount(), changed, null, null));
                assertThrows(IllegalStateException.class, () -> patch.implementation(incompatible));
            }
        }
        Method target = original(SettingsEntryPatch.INITIALIZE);
        assertThrows(IllegalStateException.class, () -> patch.implementation(withBody(target, patch.implementation(target))));
    }
}
