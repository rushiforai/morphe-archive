package io.github.emotionbug.patches.adot.privacy;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation;
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import io.github.emotionbug.patches.adot.summary.SummaryBytecodeGuard;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.id;

/** Keeps AppsFlyer's existing stopped-tracking paths active without replacing its callbacks. */
public final class AnalyticsSuppressionPatch implements MethodPatch {
    public static final String ID = "adot.privacy.suppress-analytics";
    public static final String OWNER = "Lcom/appsflyer/internal/AFf1fSDK;";
    public static final String STOPPED = OWNER + "->AFLogger()Z";
    private static final String STOP_FLAG = OWNER + "->w:Z";
    private static final String ORIGINAL = "5b43f232d8be615d9a62696aaf5ef932b6e09907ebe721b6b976faefec601f24";

    @Override public String dexEntry() { return "classes.dex"; }
    @Override public Set<String> methods() { return Set.of(STOPPED); }

    @Override public MethodImplementation implementation(Method target) {
        MethodImplementation body = target.getImplementation();
        if (!STOPPED.equals(id(target)) || body == null
                || !ORIGINAL.equals(SummaryBytecodeGuard.fingerprint(target))) {
            throw new IllegalStateException("Unsupported or already patched AppsFlyer tracking state: " + id(target));
        }
        List<Instruction> instructions = new ArrayList<>();
        int replacements = 0;
        for (Instruction instruction : body.getInstructions()) {
            if (instruction.getOpcode() == Opcode.IGET_BOOLEAN
                    && instruction instanceof ReferenceInstruction reference
                    && STOP_FLAG.equals(reference.getReference().toString())) {
                // Both instructions occupy two code units. Preserve every branch, try range,
                // register and SDK obfuscation-state update; only the stop decision changes.
                instructions.add(new ImmutableInstruction21s(Opcode.CONST_16,
                        ((OneRegisterInstruction) instruction).getRegisterA(), 1));
                replacements++;
            } else {
                instructions.add(instruction);
            }
        }
        if (replacements != 1) throw new IllegalStateException("Missing unique AppsFlyer stop-state read");
        // Startup and stop(false) can still run, but cannot re-enable stop-aware event delivery.
        // Keep init, session/deep-link listeners, and SDK error completion paths unchanged.
        return new ImmutableMethodImplementation(body.getRegisterCount(), instructions, body.getTryBlocks(), body.getDebugItems());
    }
}
