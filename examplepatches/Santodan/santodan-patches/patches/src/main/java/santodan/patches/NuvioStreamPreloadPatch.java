package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.*;
import java.util.*;
import kotlin.Unit;

/** Common runtime and Hilt registration, installed once for either stream-preloading patch. */
final class NuvioStreamPreloadPatch {
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviostreams/NuvioStreamPreload;";
    private static BytecodePatch shared;
    private NuvioStreamPreloadPatch() {}

    private static synchronized BytecodePatch shared() {
        if (shared == null) shared = PatchKt.bytecodePatch(null, null, false, builder -> {
            builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
            builder.extendWith(() -> extension("nuvio-stream-preload"));
            builder.execute(context -> {
                validateTarget(context.getPackageMetadata().getPackageName(), context.getPackageMetadata().getVersionName());
                hookComponent(context.mutableClassDefBy("Lp8/e;"));
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
        return shared;
    }

    @SuppressWarnings({"unchecked", "deprecation"})
    static BytecodePatch create(String name, String description, boolean details) {
        return PatchKt.bytecodePatch(name, description, false, builder -> {
            builder.compatibleWith(new Compatibility("com.nuvio.tv", "NuvioTV", null, ApkFileType.APK,
                null, null, NuvioLayout.modernTargets(), false));
            builder.dependsOn(shared());
            builder.extendWith(() -> extension(details ? "nuvio-detail-streams" : "nuvio-cw-streams"));
            builder.execute(context -> {
                validateTarget(context.getPackageMetadata().getPackageName(), context.getPackageMetadata().getVersionName());
                if (details) hookDetails(context.mutableClassDefBy(NuvioLayout.current("Lka/l9;")));
                else hookContinueWatching(context.mutableClassDefBy(NuvioLayout.current("Lba/e2;")));
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
    }

    static void validateTarget(String name, String version) {
        if (!"com.nuvio.tv".equals(name) || (!NuvioLayout.BETA4.equals(version) && !NuvioLayout.BETA5.equals(version)))
            throw NuvioRemainingEpisodesPatch.unsupported("Stream preloading requires com.nuvio.tv beta.4 or beta.5");
        NuvioLayout.use(version);
    }

    static void hookComponent(MutableClass owner) {
        hookReturn(NuvioRemainingEpisodesPatch.unique(owner, "<init>", 1), "registerComponent");
    }

    static void hookContinueWatching(MutableClass owner) {
        MutableMethod invoke = NuvioRemainingEpisodesPatch.unique(owner, "invoke", 3);
        insert(invoke, 0, "onContinueWatching");
    }

    static void hookDetails(MutableClass owner) {
        hookReturn(NuvioRemainingEpisodesPatch.unique(owner, "<init>", 28), "observeDetails");
        insert(NuvioRemainingEpisodesPatch.unique(owner, "onCleared", 0), 0, "stopDetails");
    }

    private static void hookReturn(MutableMethod target, String callback) {
        List<Instruction> instructions = NuvioRemainingEpisodesPatch.instructions(target);
        int index = -1;
        for (int i = 0; i < instructions.size(); i++) if (instructions.get(i).getOpcode() == Opcode.RETURN_VOID) {
            if (index >= 0) throw NuvioRemainingEpisodesPatch.unsupported("Ambiguous constructor return");
            index = i;
        }
        if (index < 0) throw NuvioRemainingEpisodesPatch.unsupported("Missing constructor return");
        insert(target, index, callback);
    }

    private static void insert(MutableMethod target, int index, String callback) {
        for (Instruction instruction : NuvioRemainingEpisodesPatch.instructions(target))
            if (NuvioRemainingEpisodesPatch.calls(instruction, EXTENSION, callback))
                throw NuvioRemainingEpisodesPatch.unsupported("Stream hook already installed: " + callback);
        target.getImplementation().addInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            NuvioRemainingEpisodesPatch.parameterStart(target), 1,
            new ImmutableMethodReference(EXTENSION, callback, List.of("Ljava/lang/Object;"), "V")));
    }

    private static InputStream extension(String module) {
        InputStream input = NuvioStreamPreloadPatch.class.getClassLoader().getResourceAsStream("extensions/" + module + ".mpe");
        if (input == null) throw new IllegalStateException("Missing bundled stream-preloading extension: " + module);
        return input;
    }
}
