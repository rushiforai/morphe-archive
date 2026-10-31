package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.List;
import kotlin.Unit;

/** Opt-in Android TV preview channels, separate from native Continue Watching. */
public final class NuvioLauncherChannelsPatch {
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviolauncher/NuvioLauncherChannels;";

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getNuvioLauncherChannelsPatch() {
        return PatchKt.bytecodePatch("NuvioTV - Android TV launcher channels",
            "Choose individual catalogs and tracking lists, Library, and Upcoming to publish as Android TV launcher channels.", false, builder -> {
            builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                null, null, NuvioLayout.modernTargets(), app.morphe.patcher.patch.FormFactor.TV, false));
            builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
            builder.dependsOn(NuvioLauncherResourcesKt.getNuvioLauncherArtworkResourcesPatch());
            builder.extendWith(() -> {
                var input = NuvioLauncherChannelsPatch.class.getClassLoader()
                    .getResourceAsStream("extensions/nuvio-launcher-channels.mpe");
                if (input == null) throw new IllegalStateException("Missing launcher channels extension");
                return input;
            });
            builder.execute(context -> {
                NuvioStreamPreloadPatch.validateTarget(context.getPackageMetadata().getPackageName(),
                    context.getPackageMetadata().getVersionName());
                hookContinueWatching(context.mutableClassDefBy("Ln9/k;"));
                hookReturn(NuvioRemainingEpisodesPatch.unique(context.mutableClassDefBy(NuvioNative.HILT_COMPONENT_TYPE), "<init>", 1), "registerComponent");
                MutableClass home = context.mutableClassDefBy(NuvioNative.HOME_MODEL_TYPE);
                hookReturn(NuvioRemainingEpisodesPatch.unique(home, "<init>", 27), "observeHome");
                insert(NuvioRemainingEpisodesPatch.unique(home, "onCleared", 0), 0, "stopHome");
                hookReturn(NuvioRemainingEpisodesPatch.unique(context.mutableClassDefBy(
                    NuvioNative.LIBRARY_REPOSITORY_TYPE), "<init>", 8), "observeLibrary");
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
    }

    static void hookContinueWatching(MutableClass owner) {
        MutableMethod target = NuvioRemainingEpisodesPatch.unique(owner, "a", 2);
        var instructions = NuvioRemainingEpisodesPatch.instructions(target);
        int matches = 0;
        for (int i = instructions.size() - 1; i >= 0; i--) {
            var instruction = instructions.get(i);
            if (!(instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) ||
                !(instruction instanceof com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction)) continue;
            var reference = ((com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction) instruction).getReference();
            if (!reference.toString().equals("Lcom/nuvio/tv/data/local/u0;->n:Z")) continue;
            var registers = (com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction) instruction;
            target.getImplementation().replaceInstruction(i, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                registers.getRegisterB(), 1, new ImmutableMethodReference(EXTENSION, "effectiveCachedHasAired", List.of("Ljava/lang/Object;"), "Z")));
            target.getImplementation().addInstruction(i + 1,
                new com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x(Opcode.MOVE_RESULT, registers.getRegisterA()));
            matches++;
        }
        if (matches != 1) throw new IllegalStateException("Native Continue Watching aired filter changed");
    }

    static void hookReturn(MutableMethod method, String callback) {
        var instructions = NuvioRemainingEpisodesPatch.instructions(method);
        int index = -1;
        for (int i = 0; i < instructions.size(); i++) if (instructions.get(i).getOpcode() == Opcode.RETURN_VOID) {
            if (index >= 0) throw new IllegalStateException("Ambiguous launcher constructor return");
            index = i;
        }
        if (index < 0) throw new IllegalStateException("Missing launcher constructor return");
        insert(method, index, callback);
    }

    static void insert(MutableMethod method, int index, String callback) {
        for (var instruction : NuvioRemainingEpisodesPatch.instructions(method))
            if (NuvioRemainingEpisodesPatch.calls(instruction, EXTENSION, callback))
                throw new IllegalStateException("Launcher hook already installed: " + callback);
        method.getImplementation().addInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            NuvioRemainingEpisodesPatch.parameterStart(method), 1,
            new ImmutableMethodReference(EXTENSION, callback, List.of("Ljava/lang/Object;"), "V")));
    }
}
