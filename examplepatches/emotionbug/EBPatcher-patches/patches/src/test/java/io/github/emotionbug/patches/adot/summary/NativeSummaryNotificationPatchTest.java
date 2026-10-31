package io.github.emotionbug.patches.adot.summary;

import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import java.io.File;
import java.util.*;
import org.junit.Assume;
import org.junit.Test;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;
import static io.github.emotionbug.patches.adot.summary.LocalGemmaSummaryPatchTest.*;
import static org.junit.Assert.*;

public final class NativeSummaryNotificationPatchTest {
    /** Reused against emitted DEX: preserve coroutine branches, registers and exception coverage. */
    public static void assertBoundary(Method original, MethodImplementation result) {
        assertEquals(original.getImplementation().getRegisterCount(), result.getRegisterCount());
        var before = code(original.getImplementation()); var after = code(result);
        assertEquals(before.keySet(), after.keySet());
        assertEquals(end(before), end(after));
        for (int address : before.keySet()) {
            Instruction left = before.get(address), right = after.get(address);
            assertEquals(left.getCodeUnits(), right.getCodeUnits());
            assertEquals(handlers(original.getImplementation(), address, null), handlers(result, address, null));
            if (address == 0x3c7 || address == 0x413) {
                FiveRegisterInstruction a = (FiveRegisterInstruction) left, b = (FiveRegisterInstruction) right;
                assertEquals(4, b.getRegisterCount());
                assertEquals(a.getRegisterC(), b.getRegisterC()); assertEquals(a.getRegisterD(), b.getRegisterD());
                assertEquals(a.getRegisterE(), b.getRegisterE()); assertEquals(a.getRegisterF(), b.getRegisterF());
                assertEquals(Opcode.INVOKE_STATIC, right.getOpcode());
                assertEquals(NativeSummaryNotificationPatch.HOOK + (address == 0x3c7
                        ? "->pendingIntent(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;"
                        : "->publishNative(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Integer;Ljava/lang/Object;)Z"),
                        id((MethodReference) ((ReferenceInstruction) right).getReference()));
            } else {
                assertEquals(operands(left), operands(right));
                if (left instanceof OffsetInstruction branch) assertEquals(branch.getCodeOffset(), ((OffsetInstruction) right).getCodeOffset());
                if (left instanceof SwitchPayload payload) {
                    var expected = payload.getSwitchElements();
                    var actual = ((SwitchPayload) right).getSwitchElements();
                    assertEquals(expected.size(), actual.size());
                    for (int i = 0; i < expected.size(); i++) {
                        assertEquals(expected.get(i).getKey(), actual.get(i).getKey());
                        assertEquals(expected.get(i).getOffset(), actual.get(i).getOffset());
                    }
                }
            }
        }
    }

    @Test public void originalCallPublisherKeepsAllOtherControlFlowAndRejectsChangedRouting() throws Exception {
        String path = System.getenv("EBPATCHER_TEST_APK");
        Assume.assumeTrue("Provide private original APK via EBPATCHER_TEST_APK", path != null);
        var dex = DexFileFactory.loadDexContainer(new File(path), Opcodes.getDefault());
        Map<String, ClassDef> classes = new HashMap<>();
        for (String entry : dex.getDexEntryNames()) for (ClassDef type : dex.getEntry(entry).getDexFile().getClasses()) classes.put(type.getType(), type);
        NativeSummaryNotificationPatch.validate(classes::get);
        assertThrows(IllegalStateException.class, () -> NativeSummaryNotificationPatch.validate(type -> "Lpls;".equals(type) ? null : classes.get(type)));
        assertThrows(IllegalStateException.class, () -> NativeSummaryNotificationPatch.validate(type -> type.endsWith("/z0;") ? null : classes.get(type)));
        Method original = null;
        for (Method candidate : classes.get("Lteq;").getMethods()) if (NativeSummaryNotificationPatch.PUBLISH.equals(id(candidate))) original = candidate;
        assertNotNull(original);
        var patch = new NativeSummaryNotificationPatch();
        MethodImplementation result = patch.implementation(original);
        assertBoundary(original, result);
        Method changed = copy(original, result);
        assertThrows(IllegalStateException.class, () -> patch.implementation(changed));
    }
}
