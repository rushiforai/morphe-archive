package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.*;
import java.net.URI;
import java.util.*;
import java.util.zip.*;
import kotlin.Unit;

/** Adds an opt-in merged tracking-progress snapshot to NuvioTV. */
public final class NuvioMergedProgressPatch {
    private static final String NAME = "NuvioTV - Merge tracking progress";
    private static final String EXT = "Lsoftware/santodan/extension/nuviomerged/NuvioMergedProgress;";
    private NuvioMergedProgressPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getNuvioMergedProgressPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Merges Nuvio Sync and connected tracking-provider progress, preserving the previous snapshot while providers refresh.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                    null, null, NuvioLayout.targets(), app.morphe.patcher.patch.FormFactor.TV, false));
                builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
                builder.dependsOn(NuvioStartupResourcesKt.getNuvioStartupResourcesPatch());
                builder.extendWith(NuvioMergedProgressPatch::extensionStream);
                builder.execute(context -> {
                    String version = context.getPackageMetadata().getVersionName();
                NuvioLayout.use(version);
                    NuvioLayout.modern(version);
                    MutableClass repository = context.mutableClassDefBy(NuvioNative.PROGRESS_REPOSITORY_TYPE);
                    hookRepository(repository);
                    hookLocalProgressWrites(repository);
                    {
                        NuvioRemainingEpisodesPatch.hookCard(context.mutableClassDefBy(NuvioNative.HOME_CARD_TYPE),
                            NuvioNative.PROVIDER_BADGE_TYPE, EXT, "prepareProviderBadge", "renderProviderBadge");
                        NuvioNativeSyncBanner.hook(context);
                        hookNavigation(context.mutableClassDefBy(NuvioNative.ROOT_NAVIGATION_TYPE));
                        if (NuvioLayout.BETA8.equals(version)) hookHomePipeline(context.mutableClassDefBy("Lxa/s3;"));
                        hookActivity(context.mutableClassDefBy("Lcom/nuvio/tv/MainActivity;"));
                        hookPlaybackScrobblers(context.mutableClassDefBy(NuvioNative.SCROBBLER_REGISTRY_TYPE));
                        hookInlinedCutoff(context.mutableClassDefBy(NuvioNative.HOME_CUTOFF_TYPE));
                        hookInlinedCutoff(context.mutableClassDefBy(NuvioNative.SETTINGS_CUTOFF_TYPE));
                        hookBadgeCacheHit(context.mutableClassDefBy(NuvioNative.BADGE_CACHE_TYPE));
                        hookBadgeGroupProgress(context.mutableClassDefBy(NuvioNative.HOME_PIPELINE_TYPE));
                    }
                    hookInlinedNextUpSeedPolicy(context.mutableClassDefBy(NuvioNative.HOME_PIPELINE_TYPE));
                    hookMergedProvider(context.mutableClassDefBy(NuvioNative.PROVIDER_SELECTION_TYPE));
                    hookEffectiveSource(context.mutableClassDefBy(NuvioNative.TRACKING_POLICY_TYPE));
                    hookWatchProgressEnum(context.mutableClassDefBy("Lcom/nuvio/tv/data/local/wb;"));

                    {
                        hookSettingsStore(context.mutableClassDefBy(NuvioNative.TRACKING_COORDINATOR_TYPE));
                        hookSettingsComponent(context.mutableClassDefBy(NuvioNative.HILT_COMPONENT_TYPE));
                    }
                    hookWatchProgressSelection(context.mutableClassDefBy(NuvioNative.SETTINGS_SELECTION_TYPE));
                    hookWatchProgressSummary(context.mutableClassDefBy(NuvioNative.SETTINGS_SUMMARY_TYPE), "z");
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static void hookActivity(MutableClass owner) {
        Map<String, String> hooks = Map.of("onResume", "activityResumed", "onPause", "activityPaused", "onDestroy", "activityDestroyed");
        for (var entry : hooks.entrySet()) {
            MutableMethod target = unique(owner, entry.getKey(), 0);
            if (!target.getReturnType().equals("V") || instructions(target).stream()
                    .noneMatch(i -> i.getOpcode() == Opcode.INVOKE_SUPER && calls(i,
                        entry.getKey().equals("onDestroy") ? NuvioNative.HILT_ACTIVITY_TYPE : "Landroid/app/Activity;", entry.getKey())))
                throw unsupported("MainActivity lifecycle changed: " + entry.getKey());
            if (instructions(target).stream().anyMatch(i -> calls(i, EXT, entry.getValue())))
                throw unsupported("MainActivity lifecycle already hooked");
        }
        for (var entry : hooks.entrySet()) {
            MutableMethod target = unique(owner, entry.getKey(), 0);
            target.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                parameterStart(target), 1, method(EXT, entry.getValue(), List.of("Ljava/lang/Object;"), "V")));
        }
    }

    /** beta.8 loadContinueWatching: observe the assigned pipeline Job, preserving the native body. */
    static void hookHomePipeline(MutableClass owner) {
        MutableMethod target = unique(owner, "b", 1);
        if (!owner.getType().equals("Lxa/s3;") ||
            !com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(target.getAccessFlags()) ||
            !target.getParameterTypes().equals(List.of(owner.getType())) ||
            !target.getReturnType().equals("V") || target.getImplementation().getRegisterCount() != 14 ||
            !NuvioPlaybackButtonsPatch.fingerprint(target).equals("c91895ea981a1f76696b7f0330b625787b3a08630e274a9e6bc53a2b2f6ddf81"))
            throw unsupported("Home CW pipeline loader changed or already patched");
        var ins = instructions(target);
        if (ins.size() != 30 || ins.get(28).getOpcode() != Opcode.IPUT_OBJECT ||
            !((ReferenceInstruction)ins.get(28)).getReference().toString().equals("Lxa/s3;->i1:Lkotlinx/coroutines/Job;") ||
            ((TwoRegisterInstruction)ins.get(28)).getRegisterB() != 13 || ins.get(29).getOpcode() != Opcode.RETURN_VOID)
            throw unsupported("Home CW pipeline Job assignment changed");
        target.getImplementation().addInstruction(29, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 13, 1,
            method(EXT, "homePipelineStarted", List.of("Ljava/lang/Object;"), "V")));
    }

    /** Both native progress-save routes persist locally; only the main tracker writes remotely. */
    static void hookLocalProgressWrites(MutableClass owner) {
        List<MutableMethod> targets = new ArrayList<>();
        for (MutableMethod candidate : owner.getMethods()) {
            if (!List.of("E", "s").contains(candidate.getName())) continue;
            if (!candidate.getParameterTypes().equals(List.of("I", "Lcom/nuvio/tv/domain/model/WatchProgress;",
                    "Lkotlin/coroutines/jvm/internal/ContinuationImpl;", "Z")) ||
                !candidate.getReturnType().equals("Ljava/lang/Object;") || candidate.getImplementation() == null)
                throw unsupported("Native progress save signature changed");
            List<Instruction> ins = instructions(candidate);
            if (ins.stream().anyMatch(i -> calls(i, EXT, "syncLocalProgress"))) throw unsupported("Progress writes already hooked");
            if (ins.stream().noneMatch(i -> calls(i, "Lcom/nuvio/tv/data/local/vb;", "C")) ||
                ins.stream().noneMatch(i -> calls(i, NuvioNative.WATCH_PROGRESS_WRITER_TYPE, "o"))) throw unsupported("Native progress save body changed");
            if (candidate.getImplementation().getRegisterCount() > 256) throw unsupported("Progress save register layout changed");
            targets.add(candidate);
        }
        if (targets.size() != 2) throw unsupported("Missing native progress save routes");
        for (MutableMethod target : targets) {
            int register = target.getImplementation().getRegisterCount() - 1;
            target.getImplementation().addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                register, 1, method(EXT, "syncLocalProgress", List.of("Z"), "Z")));
            target.getImplementation().addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, register));
        }
    }

    /** MainActivity's remembered NavController feeds its real back-stack entry flow. */
    static void hookNavigation(MutableClass owner) {
        MutableMethod target = unique(owner, "invoke", 3);
        List<Instruction> ins = instructions(target);
        int anchor = -1;
        int register = -1;
        for (int i = 0; i + 1 < ins.size(); i++) {
            if (ins.get(i) instanceof ReferenceInstruction &&
                ((ReferenceInstruction) ins.get(i)).getReference().toString().equals(
                    NuvioNative.REF_TRACKING_POLICY_F0)) {
                if (anchor >= 0 || ins.get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT)
                    throw unsupported("Navigation controller anchor changed or ambiguous");
                anchor = i + 2;
                register = ((OneRegisterInstruction) ins.get(i + 1)).getRegisterA();
            }
            if (calls(ins.get(i), EXT, "registerNavigation")) throw unsupported("Navigation already hooked");
        }
        if (anchor < 0) throw unsupported("MainActivity navigation controller not found");
        target.getImplementation().addInstruction(anchor, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            register, 1, method(EXT, "registerNavigation", List.of("Ljava/lang/Object;"), "V")));
    }

    /** Filter only the scrobbler list, preserving native connections and all read providers. */
    static void hookPlaybackScrobblers(MutableClass owner) {
        MutableMethod target = unique(owner, "a", 0);
        if (!target.getReturnType().equals("Ljava/util/ArrayList;"))
            throw unsupported("Connected scrobbler result changed");
        List<Instruction> ins = instructions(target);
        int anchor = -1;
        for (int i = 0; i < ins.size(); i++) {
            if (calls(ins.get(i), EXT, "playbackScrobblers")) throw unsupported("Scrobblers already hooked");
            if (ins.get(i).getOpcode() == Opcode.RETURN_OBJECT) {
                if (anchor >= 0) throw unsupported("Ambiguous connected scrobbler return");
                anchor = i;
            }
        }
        boolean hasScrobbler = ins.stream().anyMatch(i -> calls(i, NuvioNative.SCROBBLER_TYPE, "a"));
        if (anchor < 0 || !hasScrobbler) throw unsupported("Connected scrobbler layout changed");
        int register = ((OneRegisterInstruction) ins.get(anchor)).getRegisterA();
        target.getImplementation().addInstruction(anchor++, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            register, 1, method(EXT, "playbackScrobblers", List.of("Ljava/util/ArrayList;"), "Ljava/util/ArrayList;")));
        target.getImplementation().addInstruction(anchor, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, register));
    }

    static void hookSettingsStore(MutableClass owner) {
        MutableMethod constructor = unique(owner, "<init>", 10);
        List<Instruction> instructions = instructions(constructor);
        int returns = 0;
        for (int i = instructions.size() - 1; i >= 0; i--) {
            if (instructions.get(i).getOpcode() != Opcode.RETURN_VOID) continue;
            constructor.getImplementation().addInstruction(i,
                new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                    constructor.getImplementation().getRegisterCount() - 11, 1,
                    method(EXT, "registerSettingsStore", List.of("Ljava/lang/Object;"), "V")));
            returns++;
        }
        if (returns != 1) throw unsupported("Watch progress settings store constructor changed");
    }

    /** A cancelled metadata batch must not make unchanged watched IDs skip retries. */
    static void hookBadgeCacheHit(MutableClass owner) {
        MutableMethod target = unique(owner, "invokeSuspend", 1);
        List<Instruction> ins = instructions(target);
        int anchor = -1;
        for (int i = 0; i + 2 < ins.size(); i++) {
            if (ins.get(i).getOpcode() != Opcode.IGET_OBJECT || !(ins.get(i) instanceof ReferenceInstruction) || !((ReferenceInstruction) ins.get(i)).getReference()
                .toString().equals(NuvioNative.REF_HOME_MODEL_X0)) continue;
            if (anchor >= 0 || !calls(ins.get(i + 1), "Lkotlin/jvm/internal/Intrinsics;", "areEqual")
                || ins.get(i + 2).getOpcode() != Opcode.MOVE_RESULT)
                throw unsupported("Badge ID cache comparison changed");
            anchor = i + 3;
        }
        if (anchor < 0) throw unsupported("Badge ID cache comparison missing");
        int result = ((OneRegisterInstruction) ins.get(anchor - 1)).getRegisterA();
        target.getImplementation().addInstruction(anchor, new BuilderInstruction3rc(
            Opcode.INVOKE_STATIC_RANGE, result, 1, method(EXT, "allowBadgeCacheHit", List.of("Z"), "Z")));
        target.getImplementation().addInstruction(anchor + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT, result));
        int home = ((TwoRegisterInstruction) ins.get(anchor - 3)).getRegisterB();
        target.getImplementation().addInstruction(anchor - 3, new BuilderInstruction3rc(
            Opcode.INVOKE_STATIC_RANGE, home, 1,
            method(EXT, "prepareBadgeValidation", List.of("Ljava/lang/Object;"), "V")));
    }

    /** Publish each completed metadata group before the entire bulk batch finishes. */
    static void hookBadgeGroupProgress(MutableClass owner) {
        MutableMethod target = unique(owner, "i", 3);
        List<Instruction> ins = instructions(target);
        int home = -1;
        int anchor = -1;
        for (int i = 0; i < ins.size(); i++) {
            Instruction instruction = ins.get(i);
            if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference()
                .toString().equals(NuvioNative.REF_HOME_MODEL_V0)) {
                int receiver = ((TwoRegisterInstruction) instruction).getRegisterB();
                if (home >= 0 && home != receiver) throw unsupported("Badge group Home register changed");
                home = receiver;
            }
            if (calls(instruction, "Ljava/util/Iterator;", "hasNext")) {
                if (anchor >= 0 || ins.get(i + 1).getOpcode() != Opcode.MOVE_RESULT)
                    throw unsupported("Badge group loop changed");
                anchor = i + 2;
            }
        }
        if (home < 0 || anchor < 0) throw unsupported("Badge group progress anchors missing");
        target.getImplementation().addInstruction(anchor, new BuilderInstruction3rc(
            Opcode.INVOKE_STATIC_RANGE, home, 1,
            method(EXT, "publishCachedWatchedBadges", List.of("Ljava/lang/Object;"), "V")));
    }

    /** The coordinator is lazy: Layout must be able to resolve its native provider. */
    static void hookSettingsComponent(MutableClass owner) {
        MutableMethod constructor = unique(owner, "<init>", 1);
        List<Instruction> ins = instructions(constructor);
        int returns = 0;
        for (int i = ins.size() - 1; i >= 0; i--) {
            if (ins.get(i).getOpcode() != Opcode.RETURN_VOID) continue;
            constructor.getImplementation().addInstruction(i, new BuilderInstruction3rc(
                Opcode.INVOKE_STATIC_RANGE, parameterStart(constructor), 1,
                method(EXT, "registerSettingsComponent", List.of("Ljava/lang/Object;"), "V")));
            returns++;
        }
        if (returns != 1) throw unsupported("Settings component constructor changed");
    }

    /** Beta4 inlines the selected provider's cutoff into two Home coroutines. */
    private static void hookInlinedCutoff(MutableClass owner) {
        MutableMethod target = unique(owner, "invokeSuspend", 1);
        List<Instruction> ins = instructions(target);
        int hook = -1;
        int register = -1;
        for (int i = 0; i + 1 < ins.size(); i++) {
            if (!calls(ins.get(i), NuvioNative.PROVIDER_INTERFACE_TYPE, "x")) continue;
            if (hook >= 0 || ins.get(i + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT)
                throw unsupported("Inlined cutoff anchor changed: " + owner.getType());
            hook = i + 2;
            register = ((OneRegisterInstruction) ins.get(i + 1)).getRegisterA();
        }
        if (hook < 0) throw unsupported("Inlined cutoff anchor missing: " + owner.getType());
        target.getImplementation().addInstruction(hook, new BuilderInstruction3rc(
            Opcode.INVOKE_STATIC_RANGE, register, 1,
            method(EXT, "adjustContinueWatchingCutoff", List.of("Ljava/lang/Long;"), "Ljava/lang/Long;")));
        target.getImplementation().addInstruction(hook + 1,
            new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, register));
    }

    /** Replaces Nuvio's selected progress provider with our live aggregate provider. */
    private static void hookMergedProvider(MutableClass owner) {
        MutableMethod target = unique(owner, "invokeSuspend", 1);
        List<Instruction> ins = instructions(target);
        long lookups = ins.stream().filter(i -> calls(i, NuvioNative.PROVIDER_REGISTRY_TYPE, "a")).count();
        long returns = ins.stream().filter(i -> i.getOpcode() == Opcode.RETURN_OBJECT).count();
        if (lookups != 1 || returns != 2 || ins.stream().anyMatch(i -> calls(i, EXT, "mergedProvider")))
            throw unsupported("Provider mapper lookup/return layout changed or already hooked");
        int lastReturn = -1;
        for (int i = 0; i < ins.size(); i++) if (ins.get(i).getOpcode() == Opcode.RETURN_OBJECT) lastReturn = i;
        // Nuvio Sync and disconnected main trackers use the native null-provider branch.
        // Both branches must install the aggregate proxy.
        for (int i = ins.size() - 1; i >= 0; i--) {
            if (ins.get(i).getOpcode() != Opcode.RETURN_OBJECT) continue;
            if (i != lastReturn) continue;
            int result = ((OneRegisterInstruction) ins.get(i)).getRegisterA();
            var callback = new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                result, 1, method(EXT, "mergedProvider", List.of("Ljava/lang/Object;"), "Ljava/lang/Object;"));
            {
                target.getImplementation().replaceInstruction(i, callback);
                target.getImplementation().addInstruction(i + 1, new BuilderInstruction11x(Opcode.RETURN_OBJECT, result));
            }
            target.getImplementation().addInstruction(i + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
            target.getImplementation().addInstruction(i + 2, new BuilderInstruction21c(Opcode.CHECK_CAST, result,
                new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference(NuvioNative.PROVIDER_INTERFACE_TYPE)));
        }
    }

    private static void hookRepository(MutableClass owner) {
        MutableMethod ctor = unique(owner, "<init>", 14);
        int instance = parameterStart(ctor);
        List<Instruction> ins = instructions(ctor);
        for (int i = 0; i < ins.size(); i++) if (ins.get(i).getOpcode() == Opcode.RETURN_VOID) {
            ctor.getImplementation().addInstruction(i, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, instance, 1,
                method(EXT, "registerRepository", List.of("Ljava/lang/Object;"), "V")));
            return;
        }
        throw unsupported("Watch progress repository constructor changed");
    }

    /** Prevents the Trakt carrier from imposing its policy on other providers' merged seeds. */


    /** beta.7 inlines shouldUseAsNextUpSeed into the Home pipeline helper. */
    private static void hookInlinedNextUpSeedPolicy(MutableClass owner) {
        MutableMethod target = unique(owner, "C", 2);
        if (!"Z".equals(target.getReturnType())
            || !"Lcom/nuvio/tv/domain/model/WatchProgress;".contentEquals(target.getParameterTypes().get(1)))
            throw unsupported("Inlined next-up seed policy signature changed");
        int progress = target.getImplementation().getRegisterCount() - 1;
        List<Instruction> ins = instructions(target);
        int returns = 0;
        for (int i = ins.size() - 1; i >= 0; i--) {
            Instruction instruction = ins.get(i);
            if (instruction.getOpcode() != Opcode.RETURN || !(instruction instanceof OneRegisterInstruction)) continue;
            int result = ((OneRegisterInstruction) instruction).getRegisterA();
            if (progress > 15 || result > 15) throw unsupported("Inlined next-up seed policy register layout changed");
            target.getImplementation().addInstruction(i, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2,
                progress, result, 0, 0, 0,
                method(EXT, "adjustNextUpSeedDecision", List.of("Ljava/lang/Object;", "Z"), "Z")));
            target.getImplementation().addInstruction(i + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT, result));
            returns++;
        }
        if (returns == 0) throw unsupported("Inlined next-up seed policy return anchors not found");
    }

    private static void hookEffectiveSource(MutableClass owner) {
        MutableMethod target = null;
        for (MutableMethod method : owner.getMethods()) {
            if (method.getParameterTypes().size() == 2 && "Lcom/nuvio/tv/data/local/wb;".equals(method.getReturnType())) {
                if (target != null) throw unsupported("Multiple effective source methods found");
                target = method;
            }
        }
        if (target == null) throw unsupported("Effective source method not found");
        int first = target.getImplementation().getRegisterCount() - 2;
        target.getImplementation().addInstruction(0, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, first, first + 1, 0, 0, 0,
            method(EXT, "effectiveSource", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        target.getImplementation().addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, first));
        target.getImplementation().addInstruction(2, new BuilderInstruction21c(Opcode.CHECK_CAST, first,
            new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("Lcom/nuvio/tv/data/local/wb;")));
    }

    private static void hookWatchProgressEnum(MutableClass owner) {
        MutableMethod clinit = unique(owner, "<clinit>", 0);
        List<Instruction> ins = instructions(clinit);
        int valuesStore = -1;
        for (int i = 0; i < ins.size(); i++) {
            if (ins.get(i).getOpcode() == Opcode.SPUT_OBJECT && ins.get(i) instanceof ReferenceInstruction) {
                Object reference = ((ReferenceInstruction) ins.get(i)).getReference();
                if (reference instanceof FieldReference && "n".equals(((FieldReference) reference).getName())) {
                    valuesStore = i;
                    break;
                }
            }
        }
        if (valuesStore < 0) throw unsupported("Watch progress enum values anchor not found");
        int at = valuesStore;
        at = addEnumValue(owner, clinit, at, "MERGED_HIGHEST");
        addEnumValue(owner, clinit, at, "MERGED_RECENT");
    }

    private static int addEnumValue(MutableClass owner, MutableMethod clinit, int at, String name) {
        String type = "Lcom/nuvio/tv/data/local/wb;";
        clinit.getImplementation().addInstruction(at++, new BuilderInstruction21c(Opcode.NEW_INSTANCE, 1,
            new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference(type)));
        clinit.getImplementation().addInstruction(at++, new BuilderInstruction21c(Opcode.CONST_STRING, 2,
            new com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference(name)));
        // Deliberately share NUVIO_SYNC's ordinal. Nuvio's generated when-mapping arrays
        // therefore treat the synthetic choices as Nuvio Sync without needing resizing.
        clinit.getImplementation().addInstruction(at++, new BuilderInstruction11n(Opcode.CONST_4, 3, 3));
        clinit.getImplementation().addInstruction(at++, new BuilderInstruction35c(Opcode.INVOKE_DIRECT, 3, 1, 2, 3, 0, 0,
            method("Ljava/lang/Enum;", "<init>", List.of("Ljava/lang/String;", "I"), "V")));
        clinit.getImplementation().addInstruction(at++, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 0, 1, 0, 0, 0,
            method(EXT, "appendEnum", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        clinit.getImplementation().addInstruction(at++, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        clinit.getImplementation().addInstruction(at++, new BuilderInstruction21c(Opcode.CHECK_CAST, 0,
            new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("[" + type)));
        return at;
    }



    private static void hookWatchProgressSelection(MutableClass owner) {
        MutableMethod target = unique(owner, "invokeSuspend", 1);
        List<Instruction> ins = instructions(target);
        int hook = -1;
        int source = -1;
        for (int i = 0; i < ins.size(); i++) {
            if (!calls(ins.get(i), NuvioNative.TRACKING_COORDINATOR_TYPE, "f") || !(ins.get(i) instanceof FiveRegisterInstruction)) continue;
            FiveRegisterInstruction call = (FiveRegisterInstruction) ins.get(i);
            if (hook >= 0) throw unsupported("Multiple watch progress persistence anchors found");
            hook = i;
            source = call.getRegisterD();
        }
        if (hook < 0) throw unsupported("Watch progress persistence anchor not found");
        target.getImplementation().addInstruction(hook, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1,
            source, 0, 0, 0, 0,
            method(EXT, "selectSource", List.of("Ljava/lang/Object;"), "Ljava/lang/Object;")));
        target.getImplementation().addInstruction(hook + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, source));
        target.getImplementation().addInstruction(hook + 2, new BuilderInstruction21c(Opcode.CHECK_CAST, source,
            new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("Lcom/nuvio/tv/data/local/wb;")));
    }

    private static void hookWatchProgressSummary(MutableClass owner, String labelMethod) {
        MutableMethod target = unique(owner, "invoke", 3);
        List<Instruction> ins = instructions(target);
        int hook = -1;
        int source = -1;
        int label = -1;
        for (int i = 0; i + 1 < ins.size(); i++) {
            if (!calls(ins.get(i), NuvioNative.SETTINGS_STYLE_TYPE, labelMethod) || !(ins.get(i) instanceof FiveRegisterInstruction)
                || !(ins.get(i + 1) instanceof OneRegisterInstruction)) continue;
            if (hook >= 0) throw unsupported("Multiple Watch Progress summary labels found");
            hook = i + 2;
            source = ((FiveRegisterInstruction) ins.get(i)).getRegisterC();
            label = ((OneRegisterInstruction) ins.get(i + 1)).getRegisterA();
        }
        if (hook < 0) throw unsupported("Watch Progress summary label not found");
        target.getImplementation().addInstruction(hook, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2,
            source, label, 0, 0, 0,
            method(EXT, "summaryLabel", List.of("Ljava/lang/Object;", "Ljava/lang/String;"), "Ljava/lang/String;")));
        target.getImplementation().addInstruction(hook + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, label));
    }

    private static MutableMethod unique(MutableClass owner, String name, int params) {
        MutableMethod result = null;
        for (MutableMethod method : owner.getMethods()) if (name.equals(method.getName()) && method.getParameterTypes().size() == params && method.getImplementation() != null) {
            if (result != null) throw unsupported("Multiple method matches"); result = method;
        }
        if (result == null) throw unsupported(owner.getType() + "->" + name + " not found"); return result;
    }
    private static int parameterStart(MutableMethod method) {
        int words = 1; for (CharSequence type : method.getParameterTypes()) words += type.charAt(0) == 'J' || type.charAt(0) == 'D' ? 2 : 1;
        return method.getImplementation().getRegisterCount() - words;
    }
    private static List<Instruction> instructions(MutableMethod method) { List<Instruction> out = new ArrayList<>(); for (Instruction i : method.getImplementation().getInstructions()) out.add(i); return out; }
    private static boolean calls(Instruction i, String owner, String name) { if (!(i instanceof ReferenceInstruction)) return false; Object r=((ReferenceInstruction)i).getReference(); return r instanceof MethodReference && owner.equals(((MethodReference)r).getDefiningClass()) && name.equals(((MethodReference)r).getName()); }
    private static ImmutableMethodReference method(String owner,String name,List<String> params,String result){return new ImmutableMethodReference(owner,name,params,result);}
    private static IllegalStateException unsupported(String reason){return new IllegalStateException("Unsupported NuvioTV bytecode: "+reason+". Use an original supported NuvioTV APK.");}
    private static InputStream extensionStream() {
        String path="extensions/nuvio-merged-progress.mpe"; InputStream resource=NuvioMergedProgressPatch.class.getClassLoader().getResourceAsStream(path); if(resource!=null)return resource;
        try { URI source=NuvioMergedProgressPatch.class.getProtectionDomain().getCodeSource().getLocation().toURI(); try(ZipFile zip=new ZipFile(new File(source))){ZipEntry entry=zip.getEntry(path);if(entry==null)throw new FileNotFoundException(path);try(InputStream input=zip.getInputStream(entry)){return new ByteArrayInputStream(input.readAllBytes());}} } catch(Exception error){throw new IllegalStateException("Cannot load merged-progress extension",error);}
    }
}
