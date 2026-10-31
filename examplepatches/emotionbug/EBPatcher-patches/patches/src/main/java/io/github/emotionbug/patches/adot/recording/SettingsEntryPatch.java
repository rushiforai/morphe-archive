package io.github.emotionbug.patches.adot.recording;

import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import io.github.emotionbug.patches.adot.dex.MethodPatch;
import io.github.emotionbug.patches.adot.summary.SummaryBytecodeGuard;
import java.util.List;
import java.util.Set;
import static io.github.emotionbug.patches.adot.dex.DexInstructions.*;
import java.util.Map;
/** Adds the native extension row inside the 14.4.0 settings screen's scrolling Column. */
public final class SettingsEntryPatch implements MethodPatch {
    public static final String OWNER = "Lbmo;";
    public static final String INITIALIZE = OWNER + "->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    public static final String ANDROID_VIEW = "Lpu6;->b(Lkotlin/jvm/functions/Function1;Lvpg;Lkotlin/jvm/functions/Function1;Lbyb;II)V";
    public static final String ENTRY = "Lio/github/emotionbug/patches/runtime/ExtensionSettingsEntry;";
    static final int INSERTION = 0x1e7;
    private static final Map<String,String> ORIGINALS = Map.of(
            INITIALIZE, "1b555d512dcda79eab0b005fe3165b4860f2f14a3c2a779ec46fe3e394aed49c",
            ANDROID_VIEW, "79a0db4769ef83c9520b4f3a8ccdc7a46471870cf107aef32a68b135f628fb72");

    @Override public String dexEntry() { return "classes3.dex"; }
    @Override public Set<String> methods() { return ORIGINALS.keySet(); }

    @Override public MethodImplementation implementation(Method target) {
        MethodImplementation body = target.getImplementation();
        String descriptor = id(target), expected = ORIGINALS.get(descriptor);
        if (expected == null || body == null || !expected.equals(SummaryBytecodeGuard.fingerprint(target)))
            throw new IllegalStateException("Unsupported or already patched original settings composition: " + descriptor);
        // The runtime reflects only this exact vendor AndroidView overload; do not rewrite it.
        if (ANDROID_VIEW.equals(descriptor)) return body;
        MutableMethodImplementation rewritten = new MutableMethodImplementation(body);
        int pc = 0, index = 0;
        for (Instruction instruction : body.getInstructions()) {
            if (pc == INSERTION) break;
            pc += instruction.getCodeUnits();
            index++;
        }
        if (pc != INSERTION) throw new IllegalStateException("Missing original settings Column boundary");
        // v7 is the original composer after the native rows' loop group closes.
        // The bottom spacing and Column closure still follow the extension row.
        rewritten.addInstruction(index, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 7, 0, 0, 0, 0,
                method(ENTRY, "install", List.of("Ljava/lang/Object;"), "V")));
        return rewritten;
    }
}
