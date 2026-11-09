package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.List;
import software.santodan.nuvio.NuvioNative;

/** Keep repositories and background jobs out of the short-lived restart process. */
final class NuvioSettingsRestart {
    private NuvioSettingsRestart() {}
    static MutableMethod validate(MutableClass owner) {
        MutableMethod method = NuvioRemainingEpisodesPatch.unique(owner, "onCreate", 0);
        if (!method.toString().equals(NuvioNative.REF_APPLICATION_ONCREATE) || (method.getAccessFlags() & 8) != 0 ||
            method.getImplementation() == null || method.getImplementation().getRegisterCount() < 2 ||
            !NuvioPlaybackButtonsPatch.fingerprint(method).equals(NuvioNative.HASH_RESTART_APPLICATION))
            throw new IllegalStateException("NuvioTV restart application startup changed or is already patched");
        return method;
    }
    static void install(MutableClass owner) {
        MutableMethod method = validate(owner);
        var code = method.getImplementation();
        var original = code.newLabelForIndex(0);
        code.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            code.getRegisterCount() - 1, 1, new ImmutableMethodReference(
                "Lsoftware/santodan/extension/nuviomenu/SettingsRestartActivity;", "isRestartProcess",
                List.of("Landroid/content/Context;"), "Z")));
        code.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        code.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, original));
        code.addInstruction(3, new BuilderInstruction10x(Opcode.RETURN_VOID));
    }
}
