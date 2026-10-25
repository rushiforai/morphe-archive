package santodan.patches;

import software.santodan.nuvio.NuvioNative;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.util.List;
import kotlin.Unit;

/** Guard the original beta.8 null-period seek without changing active playback. */
public final class NuvioPlayerStabilityPatch {
    static final String OWNER = "Landroidx/media3/exoplayer/ExoPlayerImplInternal;";
    static final String METHOD = "seekToCurrentPosition";
    static final String HASH = "f51fed0d7a4e3a69e442b555c69750c12119900c61b61413513360d16b203b69";
    static final String QUEUE = "Landroidx/media3/exoplayer/MediaPeriodQueue;";
    static final String HOLDER = "Landroidx/media3/exoplayer/MediaPeriodHolder;";

    public static BytecodePatch getNuvioPlayerStabilityPatch() {
        return PatchKt.bytecodePatch("NuvioTV - Fix startup track reselection",
            "Prevents a startup ExoPlayer crash when track reselection requests a seek before a playing media period exists.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget(NuvioNative.VERSION, null, false, null, null)), FormFactor.TV, false));
                builder.execute(context -> {
                    if (!NuvioNative.PACKAGE_NAME.equals(context.getPackageMetadata().getPackageName()) ||
                        !NuvioNative.VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Player stability requires the reviewed NuvioTV version");
                    hook(context.mutableClassDefBy(OWNER));
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static void hook(MutableClass owner) {
        MutableMethod method = NuvioRemainingEpisodesPatch.unique(owner, METHOD, 1);
        var code = method.getImplementation();
        if (!owner.getType().equals(OWNER) || !method.getParameterTypes().equals(List.of("Z")) ||
            !method.getReturnType().equals("V") || (method.getAccessFlags() & 8) != 0 || code == null ||
            !code.getTryBlocks().isEmpty() || code.getRegisterCount() != 13 ||
            !NuvioPlaybackButtonsPatch.fingerprint(method).equals(HASH))
            throw new IllegalStateException("Player seek body changed, ambiguous, or already patched");
        var instructions = NuvioRemainingEpisodesPatch.instructions(method);
        if (instructions.size() != 25 ||
            ((TwoRegisterInstruction) instructions.get(0)).getRegisterA() != 0 ||
            ((TwoRegisterInstruction) instructions.get(0)).getRegisterB() != NuvioRemainingEpisodesPatch.parameterStart(method) ||
            ((FiveRegisterInstruction) instructions.get(1)).getRegisterCount() != 1 ||
            ((FiveRegisterInstruction) instructions.get(1)).getRegisterC() != 0 ||
            instructions.get(2).getOpcode() != Opcode.MOVE_RESULT_OBJECT ||
            ((OneRegisterInstruction) instructions.get(2)).getRegisterA() != 0 ||
            !NuvioPlaybackButtonsPatch.reference(instructions.get(1)).equals(QUEUE + "->getPlayingPeriod()" + HOLDER) ||
            instructions.get(3).getOpcode() != Opcode.IGET_OBJECT ||
            !NuvioPlaybackButtonsPatch.reference(instructions.get(3)).equals(HOLDER + "->info:Landroidx/media3/exoplayer/MediaPeriodInfo;") ||
            ((TwoRegisterInstruction) instructions.get(3)).getRegisterB() != 0 ||
            instructions.get(24).getOpcode() != Opcode.RETURN_VOID)
            throw new IllegalStateException("Player null-period seek anchor changed");
        // v0 is the existing getPlayingPeriod result; branch to the original return.
        var done = code.newLabelForIndex(24);
        code.addInstruction(3, new BuilderInstruction21t(Opcode.IF_EQZ, 0, done));
    }
}
