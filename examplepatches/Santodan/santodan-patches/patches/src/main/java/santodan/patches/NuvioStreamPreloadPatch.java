package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.*;
import java.util.*;
import kotlin.Unit;

/** Common runtime and Hilt registration, installed once for the stream-preloading patches. */
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
                validateSearch(new MutableClass(context.classDefBy(NuvioNative.STREAM_REPOSITORY_TYPE)));
                validateDetailResolver(new MutableClass(context.classDefBy(NuvioNative.DETAIL_RESOLVER_TYPE)));
                hookComponent(context.mutableClassDefBy(NuvioNative.HILT_COMPONENT_TYPE));
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
        return shared;
    }

    @SuppressWarnings({"unchecked", "deprecation"})
    static BytecodePatch create(String name, String description, boolean details) {
        return create(name, description, details ? "details" : "continue_watching");
    }

    @SuppressWarnings({"unchecked", "deprecation"})
    static BytecodePatch create(String name, String description, String mode) {
        return PatchKt.bytecodePatch(name, description, false, builder -> {
            builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                null, null, NuvioLayout.modernTargets(), app.morphe.patcher.patch.FormFactor.TV, false));
            builder.dependsOn(shared());
            builder.extendWith(() -> extension("next_episode".equals(mode) ? "nuvio-next-episode-streams"
                : "details".equals(mode) ? "nuvio-detail-streams" : "nuvio-cw-streams"));
            builder.execute(context -> {
                validateTarget(context.getPackageMetadata().getPackageName(), context.getPackageMetadata().getVersionName());
                if ("next_episode".equals(mode)) {
                    {
                        MutableClass controller = context.mutableClassDefBy(NuvioNative.PLAYER_CONTROLLER_TYPE);
                        if (controller.getFields().stream().filter(f -> f.getName().equals("T")
                            && f.getType().equals("Ljava/lang/String;")).count() != 1)
                            throw NuvioRemainingEpisodesPatch.unsupported("Beta7 native playback request type changed");
                    }
                    hookPlayer(context.mutableClassDefBy(NuvioNative.PLAYER_MODEL_TYPE));
                    hookNextEpisodePluginPause(context.mutableClassDefBy(NuvioNative.PLUGIN_SEARCH_TYPE));
                    hookNextEpisodeRoutesBeta7(context.mutableClassDefBy(NuvioNative.PLAYER_ROUTES_TYPE));

                }
                else if ("details".equals(mode)) hookDetails(context.mutableClassDefBy(NuvioNative.DETAIL_MODEL_TYPE));
                else hookContinueWatching(context.mutableClassDefBy(NuvioNative.HOME_CARD_TYPE));
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
    }

    static void validateSearch(MutableClass owner) {
        MutableMethod method = NuvioRemainingEpisodesPatch.unique(owner, "l", 5);
        if (!owner.getType().equals(NuvioNative.STREAM_REPOSITORY_TYPE) || !method.getParameterTypes().equals(List.of(
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/Integer;", "Ljava/lang/Integer;", "Z")) ||
            !method.getReturnType().equals("Lkotlinx/coroutines/flow/Flow;") || (method.getAccessFlags() & 8) != 0)
            throw NuvioRemainingEpisodesPatch.unsupported("Stream search must be ba.d5.l(String,String,Integer,Integer,boolean):Flow");
    }

    static void validateDetailResolver(MutableClass owner) {
        MutableMethod method = NuvioRemainingEpisodesPatch.unique(owner, "D", 3);
        if (!owner.getType().equals(NuvioNative.DETAIL_RESOLVER_TYPE) || !method.getParameterTypes().equals(List.of(
                "Lcom/nuvio/tv/domain/model/Meta;", "Lcom/nuvio/tv/domain/model/NextToWatch;", "Ljava/util/List;")) ||
            !method.getReturnType().equals("Lcom/nuvio/tv/domain/model/Video;") || (method.getAccessFlags() & 8) == 0)
            throw NuvioRemainingEpisodesPatch.unsupported("Detail resolver must be static ra.t0.D(Meta,NextToWatch,List):Video");
    }

    static void validateTarget(String name, String version) {
        if (!NuvioNative.PACKAGE_NAME.equals(name) || !NuvioLayout.recent(version))
            throw NuvioRemainingEpisodesPatch.unsupported("Stream preloading requires a supported com.nuvio.tv version");
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

    static void hookPlayer(MutableClass owner) {
        validatePlayerState(owner);
        if (NuvioNative.PLAYER_MODEL_TYPE.equals(owner.getType()) && owner.getFields().stream().filter(f ->
            f.getName().equals("Y") && f.getType().equals(NuvioNative.PLAYER_CONTROLLER_TYPE)).count() != 1)
            throw NuvioRemainingEpisodesPatch.unsupported("Beta7 native playback controller changed");
        hookReturn(NuvioRemainingEpisodesPatch.unique(owner, "<init>", 53), "observeNextEpisode");
        insert(NuvioRemainingEpisodesPatch.unique(owner, "onCleared", 0), 0, "stopNextEpisode");
    }

    /** A same-arity void action is not a player-state accessor (beta.8 f() changes controls). */
    static void validatePlayerState(MutableClass owner) {
        MutableMethod state = NuvioRemainingEpisodesPatch.unique(owner, NuvioNative.PLAYER_STATE_METHOD, 0);
        if (!owner.getType().equals(NuvioNative.PLAYER_MODEL_TYPE)
            || !state.getReturnType().equals("Lkotlinx/coroutines/flow/StateFlow;")
            || (state.getAccessFlags() & 8) != 0 || state.getImplementation() == null
            || !NuvioPlaybackButtonsPatch.fingerprint(state).equals(NuvioNative.HASH_PLAYER_STATE_BODY))
            throw NuvioRemainingEpisodesPatch.unsupported("Native player-state accessor changed");
    }

    /** Substitute only this search's pause flow; never unpause the singleton repository. */
    static void hookNextEpisodePluginPause(MutableClass owner) {
        MutableMethod target = NuvioRemainingEpisodesPatch.unique(owner, "invokeSuspend", 1);
        List<Instruction> instructions = NuvioRemainingEpisodesPatch.instructions(target);
        String pause = NuvioNative.STREAM_REPOSITORY_TYPE + ("->l:") + "Lkotlinx/coroutines/flow/MutableStateFlow;";
        int index = -1;
        for (int i = 0; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            if (NuvioRemainingEpisodesPatch.calls(instruction, EXTENSION, "nextEpisodePluginPause"))
                throw NuvioRemainingEpisodesPatch.unsupported("Next-episode plugin pause hook already installed");
            if (instruction.getOpcode() == Opcode.IGET_OBJECT && instruction instanceof ReferenceInstruction
                && ((ReferenceInstruction) instruction).getReference().toString().equals(pause)) {
                if (index >= 0) throw NuvioRemainingEpisodesPatch.unsupported("Ambiguous plugin pause read");
                index = i;
            }
        }
        if (index < 0) throw NuvioRemainingEpisodesPatch.unsupported("Missing plugin pause read");
        int flow = ((OneRegisterInstruction) instructions.get(index)).getRegisterA();
        target.getImplementation().addInstruction(index + 1,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                NuvioRemainingEpisodesPatch.parameterStart(target), 1,
                new ImmutableMethodReference(EXTENSION, "nextEpisodePluginPause", List.of("Ljava/lang/Object;"),
                    "Lkotlinx/coroutines/flow/Flow;")));
        target.getImplementation().addInstruction(index + 2,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, flow));
    }

    /** The manual next-episode route otherwise discards the preloaded session with forceRefresh=true. */
    static void hookNextEpisodePicker(MutableClass owner) {
        MutableMethod target = NuvioRemainingEpisodesPatch.unique(owner, "invokeSuspend", 1);
        List<Instruction> instructions = NuvioRemainingEpisodesPatch.instructions(target);
        String picker = NuvioNative.PLAYER_ROUTES_TYPE + ("->E(") + NuvioNative.PLAYER_CONTROLLER_TYPE
            + "Lcom/nuvio/tv/domain/model/Video;Z)V";
        List<Integer> calls = new ArrayList<>();
        for (int i = 0; i < instructions.size(); i++) {
            Instruction instruction = instructions.get(i);
            if (NuvioRemainingEpisodesPatch.calls(instruction, EXTENSION, "nextEpisodePickerRefresh"))
                throw NuvioRemainingEpisodesPatch.unsupported("Next-episode picker hook already installed");
            if (instruction instanceof ReferenceInstruction &&
                ((ReferenceInstruction) instruction).getReference().toString().equals(picker)) {
                if (instruction.getOpcode() != Opcode.INVOKE_STATIC || !(instruction instanceof FiveRegisterInstruction)
                    || ((FiveRegisterInstruction) instruction).getRegisterCount() != 3)
                    throw NuvioRemainingEpisodesPatch.unsupported("Next-episode picker invocation changed");
                calls.add(i);
            }
        }
        if (calls.size() != 3) throw NuvioRemainingEpisodesPatch.unsupported("Next-episode picker routes changed");
        for (int i = calls.size() - 1; i >= 0; i--) {
            int index = calls.get(i);
            int force = ((FiveRegisterInstruction) instructions.get(index)).getRegisterE();
            target.getImplementation().addInstruction(index,
                new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, force, 1,
                    new ImmutableMethodReference(EXTENSION, "nextEpisodePickerRefresh", List.of("Z"), "Z")));
            target.getImplementation().addInstruction(index + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT, force));
        }
    }

    /** Beta7: method-entry hooks cannot be skipped by branches into the caller's picker calls. */
    static void hookNextEpisodeRoutesBeta7(MutableClass owner) {
        if (!NuvioNative.PLAYER_ROUTES_TYPE.equals(owner.getType()))
            throw NuvioRemainingEpisodesPatch.unsupported("Unexpected beta7 next-episode routes");
        MutableMethod picker = NuvioRemainingEpisodesPatch.unique(owner, "E", 3);
        MutableMethod threshold = NuvioRemainingEpisodesPatch.unique(owner, "x", 1);
        if (!picker.getParameterTypes().equals(List.of(NuvioNative.PLAYER_CONTROLLER_TYPE, "Lcom/nuvio/tv/domain/model/Video;", "Z"))
            || !threshold.getParameterTypes().equals(List.of(NuvioNative.PLAYER_CONTROLLER_TYPE))
            || !picker.getReturnType().equals("V") || !threshold.getReturnType().equals("V")
            || (picker.getAccessFlags() & 8) == 0 || (threshold.getAccessFlags() & 8) == 0)
            throw NuvioRemainingEpisodesPatch.unsupported("Beta7 next-episode route signatures changed");
        List<Instruction> pickerInstructions = NuvioRemainingEpisodesPatch.instructions(picker);
        List<Instruction> thresholdInstructions = NuvioRemainingEpisodesPatch.instructions(threshold);
        for (Instruction instruction : pickerInstructions)
            if (NuvioRemainingEpisodesPatch.calls(instruction, EXTENSION, "nextEpisodePickerRefresh"))
                throw NuvioRemainingEpisodesPatch.unsupported("Next-episode picker entry hook already installed");
        for (Instruction instruction : thresholdInstructions)
            if (NuvioRemainingEpisodesPatch.calls(instruction, EXTENSION, "useNativeNextEpisodeThresholdPreload"))
                throw NuvioRemainingEpisodesPatch.unsupported("Next-episode threshold hook already installed");
        long delegates = pickerInstructions.stream().filter(i ->
            NuvioRemainingEpisodesPatch.calls(i, NuvioNative.PLAYER_ROUTES_TYPE, "q")).count();
        long triggeredReads = thresholdInstructions.stream().filter(i -> i.getOpcode() == Opcode.IGET_BOOLEAN
            && i instanceof ReferenceInstruction && ((ReferenceInstruction) i).getReference().toString()
                .equals(NuvioNative.PLAYER_CONTROLLER_TYPE + ("->r2:Z"))).count();
        if (delegates != 1 || triggeredReads != 1 || threshold.getImplementation().getRegisterCount() != (13)
            || thresholdInstructions.isEmpty() || thresholdInstructions.get(0).getOpcode() != Opcode.CONST_STRING
            || ((OneRegisterInstruction) thresholdInstructions.get(0)).getRegisterA() != 0)
            throw NuvioRemainingEpisodesPatch.unsupported("Beta7 next-episode route bodies changed");
        int force = picker.getImplementation().getRegisterCount() - 1;
        picker.getImplementation().addInstruction(0,
            new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, force, 1,
                new ImmutableMethodReference(EXTENSION, "nextEpisodePickerRefresh", List.of("Z"), "Z")));
        picker.getImplementation().addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, force));

        var implementation = threshold.getImplementation();
        var nativeEntry = implementation.newLabelForIndex(0);
        implementation.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 0,
            new ImmutableMethodReference(EXTENSION, "useNativeNextEpisodeThresholdPreload", List.of(), "Z")));
        implementation.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        implementation.addInstruction(2, new BuilderInstruction21t(Opcode.IF_NEZ, 0, nativeEntry));
        implementation.addInstruction(3, new BuilderInstruction10x(Opcode.RETURN_VOID));
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

    static InputStream extension(String module) {
        InputStream input = NuvioStreamPreloadPatch.class.getClassLoader().getResourceAsStream("extensions/" + module + ".mpe");
        if (input == null) throw new IllegalStateException("Missing bundled stream-preloading extension: " + module);
        return input;
    }
}
