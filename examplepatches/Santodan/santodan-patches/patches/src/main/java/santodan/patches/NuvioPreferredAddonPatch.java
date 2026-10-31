package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import kotlin.Unit;

public final class NuvioPreferredAddonPatch {
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviopreferred/NuvioPreferredAddon;";
    static final String STREAM = "Lcom/nuvio/tv/domain/model/Stream;";
    static final Map<String, String> HASHES = Map.of(
        "snapshot", NuvioNative.HASH_ADDON_SNAPSHOT,
        "order", NuvioNative.HASH_ADDON_ORDER,
        "select", NuvioNative.HASH_ADDON_SELECTION,
        "gate", NuvioNative.HASH_ADDON_GATE,
        "regex", NuvioNative.HASH_ADDON_REGEX,
        "apply", NuvioNative.HASH_ADDON_APPLY,
        "load", NuvioNative.HASH_ADDON_LOAD);
    static final Map<String, String> SIGNATURES = Map.of(
        "snapshot", NuvioNative.REF_ADDON_SNAPSHOT_INIT,
        "order", NuvioNative.REF_ADDON_SELECTOR_D,
        "select", NuvioNative.REF_ADDON_SELECTOR_E + STREAM,
        "gate", NuvioNative.REF_ADDON_SELECTOR_A,
        "regex", NuvioNative.REF_ADDON_SELECTOR_C,
        "apply", NuvioNative.REF_STREAM_LOADER_A,
        "load", NuvioNative.REF_STREAM_LOADER_INVOKESUSPEND);

    public static BytecodePatch getNuvioPreferredAddonPatch() {
        return PatchKt.bytecodePatch("NuvioTV - Preferred source add-on",
            "Choose a per-profile add-on to refresh and display first, with optional automatic playback of its first playable stream.", false, builder -> {
                builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget(NuvioNative.VERSION, null, false, null, null)), app.morphe.patcher.patch.FormFactor.TV, false));
                builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
                builder.extendWith(() -> NuvioStreamPreloadPatch.extension("nuvio-preferred-addon"));
                builder.execute(context -> {
                    if (!NuvioNative.PACKAGE_NAME.equals(context.getPackageMetadata().getPackageName()) ||
                        !NuvioNative.VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Preferred add-on requires NuvioTV 1.1.0-beta.9");
                    validateContracts(type -> new MutableClass(context.classDefBy(type)));
                    MutableClass snapshot = context.mutableClassDefBy(NuvioNative.ADDON_SNAPSHOT_TYPE);
                    MutableClass selector = context.mutableClassDefBy(NuvioNative.ADDON_SELECTOR_TYPE);
                    validate(snapshot, selector);
                    MutableClass loader = context.mutableClassDefBy(NuvioNative.STREAM_LOADER_TYPE);
                    validateLoader(loader, selector);
                    hookComponent(context.mutableClassDefBy(NuvioNative.HILT_COMPONENT_TYPE));
                    hook(snapshot, selector);
                    hookLoader(loader, selector);
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }
    interface Classes { MutableClass get(String type); }
    static void field(Classes classes, String owner, String name, String type) {
        if (classes.get(owner).getFields().stream().filter(f -> f.getName().equals(name) && f.getType().equals(type)).count() != 1)
            throw new IllegalStateException("Preferred add-on field changed: " + owner + "->" + name);
    }
    static void contract(Classes classes, String owner, String name, List<String> parameters, String result, boolean isStatic) {
        var method = NuvioRemainingEpisodesPatch.unique(classes.get(owner), name, parameters.size());
        if (!method.getParameterTypes().equals(parameters) || !method.getReturnType().equals(result) || ((method.getAccessFlags() & 8) != 0) != isStatic)
            throw new IllegalStateException("Preferred add-on contract changed: " + owner + "->" + name);
    }
    static void validateContracts(Classes classes) {
        field(classes, NuvioNative.HILT_COMPONENT_TYPE, NuvioNative.PROFILE_PROVIDER_FIELD, NuvioNative.PROVIDER_TYPE);
        field(classes, NuvioNative.HILT_COMPONENT_TYPE, NuvioNative.STREAM_PROVIDER_FIELD, NuvioNative.PROVIDER_TYPE);
        field(classes, NuvioNative.PROFILE_STORE_TYPE, "f", "Lkotlinx/coroutines/flow/StateFlow;");
        field(classes, NuvioNative.STREAM_REPOSITORY_TYPE, "c", NuvioNative.STREAM_SOURCE_TYPE);
        field(classes, NuvioNative.ADDON_REPOSITORY_TYPE, "r", "Lkotlinx/coroutines/flow/StateFlow;");
        field(classes, NuvioNative.STREAM_VIEW_MODEL_TYPE, "t", "Z");
        field(classes, "Lkotlin/jvm/internal/Ref$BooleanRef;", "element", "Z");
        for (String getter : List.of("getBaseUrl", "getDisplayName"))
            contract(classes, "Lcom/nuvio/tv/domain/model/Addon;", getter, List.of(), "Ljava/lang/String;", false);
        contract(classes, "Lcom/nuvio/tv/domain/model/Addon;", "getResources", List.of(), "Ljava/util/List;", false);
        contract(classes, "Lcom/nuvio/tv/domain/model/AddonResource;", "getName", List.of(), "Ljava/lang/String;", false);
        contract(classes, "Lcom/nuvio/tv/domain/model/AddonKt;", "enabledAddons", List.of("Ljava/util/List;"), "Ljava/util/List;", true);
        contract(classes, NuvioNative.ADDON_SELECTOR_TYPE, "b", List.of(STREAM), "Z", true);
        for (String owner : List.of(STREAM, "Lcom/nuvio/tv/domain/model/AddonStreams;"))
            contract(classes, owner, "getAddonName", List.of(), "Ljava/lang/String;", false);
        contract(classes, NuvioNative.SETTINGS_PICKER_TYPE, "<init>", List.of("Ljava/lang/Object;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Lm3/m;", "I"), "V", false);
        NuvioPlaybackButtonsPatch.validateUiMethod(classes.get(NuvioNative.SETTINGS_ROWS_TYPE),
            NuvioNative.REF_SETTINGS_ROWS_M);
        NuvioPlaybackButtonsPatch.validateUiMethod(classes.get(NuvioNative.SETTINGS_ROWS_TYPE),
            NuvioNative.REF_SETTINGS_ROWS_J);
        NuvioPlaybackButtonsPatch.validateUiMethod(classes.get(NuvioNative.SETTINGS_ROWS_TYPE),
            NuvioNative.REF_SETTINGS_ROWS_A);
    }
    static Map<String, MutableMethod> methods(MutableClass snapshot, MutableClass selector) {
        return Map.of("snapshot", NuvioRemainingEpisodesPatch.unique(snapshot, "<init>", 7),
            "order", NuvioRemainingEpisodesPatch.unique(selector, "d", 3),
            "select", NuvioRemainingEpisodesPatch.unique(selector, "e", 10),
            "gate", NuvioRemainingEpisodesPatch.unique(selector, "a", 1));
    }
    static void validate(MutableClass snapshot, MutableClass selector) {
        if (!snapshot.getType().equals(NuvioNative.ADDON_SNAPSHOT_TYPE) || !selector.getType().equals(NuvioNative.ADDON_SELECTOR_TYPE)) throw new IllegalStateException("Wrong add-on classes");
        methods(snapshot, selector).forEach(NuvioPreferredAddonPatch::validateMethod);
    }
    static String tryLayout(MutableMethod method) {
        StringBuilder result = new StringBuilder();
        for (var block : method.getImplementation().getTryBlocks()) {
            result.append(block.getStartCodeAddress()).append(':').append(block.getCodeUnitCount()).append('[');
            for (var handler : block.getExceptionHandlers()) result.append(handler.getExceptionType()).append(':').append(handler.getHandlerCodeAddress()).append(',');
            result.append(']');
        }
        return result.toString();
    }
    static void validateMethod(String key, MutableMethod method) {
        String tries = key.equals("select") ? "358:13[null:372,]" : key.equals("regex") ? "31:13[null:45,]" : "";
        boolean isStatic = !key.equals("snapshot") && !key.equals("load");
        if (!method.toString().equals(SIGNATURES.get(key)) || ((method.getAccessFlags() & 8) != 0) != isStatic ||
            method.getImplementation() == null || !tryLayout(method).equals(tries) ||
            !NuvioPlaybackButtonsPatch.fingerprint(method).equals(HASHES.get(key)))
            throw new IllegalStateException("Preferred add-on " + key + " changed or already patched");
    }
    static ImmutableMethodReference ref(String name, List<String> args, String result) {
        return new ImmutableMethodReference(EXTENSION, name, args, result);
    }
    static void hookComponent(MutableClass owner) {
        MutableMethod method = NuvioRemainingEpisodesPatch.unique(owner, "<init>", 1);
        var body = NuvioRemainingEpisodesPatch.instructions(method);
        List<Integer> returns = new ArrayList<>();
        for (int i = 0; i < body.size(); i++) {
            if (NuvioRemainingEpisodesPatch.calls(body.get(i), EXTENSION, "registerComponent")) throw new IllegalStateException("Preferred add-on already registered");
            if (body.get(i).getOpcode() == Opcode.RETURN_VOID) returns.add(i);
        }
        if (returns.size() != 1 || !method.toString().equals(NuvioNative.REF_HILT_COMPONENT_INIT) || (method.getAccessFlags() & 8) != 0)
            throw new IllegalStateException("Preferred add-on Hilt constructor changed");
        method.getImplementation().addInstruction(returns.get(0), new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            NuvioRemainingEpisodesPatch.parameterStart(method), 1, ref("registerComponent", List.of("Ljava/lang/Object;"), "V")));
    }
    static void hook(MutableClass snapshot, MutableClass selector) {
        validate(snapshot, selector);
        var methods = methods(snapshot, selector);
        var init = methods.get("snapshot").getImplementation();
        int profile = NuvioAnchors.parameter(methods.get("snapshot"), 0);
        int addons = NuvioAnchors.parameter(methods.get("snapshot"), 1);
        if (addons != profile + 1) throw new IllegalStateException("Snapshot parameters are not consecutive");
        init.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, profile, 2,
            ref("prioritize", List.of("I", "Ljava/util/List;"), "Ljava/util/List;")));
        init.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, addons));
        var order = methods.get("order").getImplementation();
        var originalOrder = NuvioRemainingEpisodesPatch.instructions(methods.get("order"));
        for (int i = originalOrder.size() - 1; i >= 0; i--) if (originalOrder.get(i).getOpcode() == Opcode.RETURN_OBJECT) {
            int register = ((OneRegisterInstruction) originalOrder.get(i)).getRegisterA();
            order.replaceInstruction(i, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1,
                ref("orderGroups", List.of("Ljava/util/List;"), "Ljava/util/List;")));
            order.addInstruction(i + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, register));
            order.addInstruction(i + 2, new BuilderInstruction11x(Opcode.RETURN_OBJECT, register));
        }
        var select = methods.get("select").getImplementation();
        var original = select.newLabelForIndex(0);
        select.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            NuvioAnchors.parameter(methods.get("select"), 7), 3,
            ref("autoPlaySelectionEnabled", List.of("Ljava/lang/String;", "Z", "Z"), "Z")));
        select.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        select.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, original));
        select.addInstruction(3, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, NuvioAnchors.parameter(methods.get("select"), 0), 1,
            ref("select", List.of("Ljava/util/List;"), "Ljava/lang/Object;")));
        select.addInstruction(4, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0));
        select.addInstruction(5, new BuilderInstruction21c(Opcode.CHECK_CAST, 0,
            new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference(STREAM)));
        select.addInstruction(6, new BuilderInstruction11x(Opcode.RETURN_OBJECT, 0));
        wrapBooleanReturns(methods.get("gate"), "autoPlayGate");
    }
    static void wrapBooleanReturns(MutableMethod gateMethod, String callback) {
        var gate = gateMethod.getImplementation();
        var gateBody = NuvioRemainingEpisodesPatch.instructions(gateMethod);
        for (int i = gateBody.size() - 1; i >= 0; i--) if (gateBody.get(i).getOpcode() == Opcode.RETURN) {
            int register = ((OneRegisterInstruction) gateBody.get(i)).getRegisterA();
            gate.replaceInstruction(i, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1, ref(callback, List.of("Z"), "Z")));
            gate.addInstruction(i + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT, register));
            gate.addInstruction(i + 2, new BuilderInstruction11x(Opcode.RETURN, register));
        }
    }
    static Map<String, MutableMethod> loaderMethods(MutableClass loader, MutableClass selector) {
        return Map.of("apply", NuvioRemainingEpisodesPatch.unique(loader, "a", 10),
            "load", NuvioRemainingEpisodesPatch.unique(loader, "invokeSuspend", 1),
            "regex", NuvioRemainingEpisodesPatch.unique(selector, "c", 1));
    }
    static void validateLoader(MutableClass loader, MutableClass selector) {
        if (!loader.getType().equals(NuvioNative.STREAM_LOADER_TYPE) || !selector.getType().equals(NuvioNative.ADDON_SELECTOR_TYPE)) throw new IllegalStateException("Wrong preferred loader classes");
        loaderMethods(loader, selector).forEach(NuvioPreferredAddonPatch::validateMethod);
    }
    static void hookLoader(MutableClass loader, MutableClass selector) {
        validateLoader(loader, selector);
        var methods = loaderMethods(loader, selector);
        int[] selection = selectionAnchor(methods.get("apply"));
        int[] reuse = reuseAnchor(methods.get("load"));
        // Preserve native persisted binge choices, including unresolved results.
        var apply = methods.get("apply").getImplementation();
        int at = selection[0], result = selection[1];
        var branch = (BuilderInstruction21t) apply.getInstructions().get(at);
        var target = branch.getTarget();
        apply.replaceInstruction(at, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 5, result, selection[2], selection[3], selection[4], selection[5],
            ref("choose", List.of("Ljava/lang/Object;", "Ljava/util/List;", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/String;"), "Ljava/lang/Object;")));
        apply.addInstruction(at + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, result));
        apply.addInstruction(at + 2, new BuilderInstruction21c(Opcode.CHECK_CAST, result,
            new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference(STREAM)));
        apply.addInstruction(at + 3, new BuilderInstruction21t(Opcode.IF_EQZ, result, target));
        var load = methods.get("load").getImplementation();
        load.addInstruction(reuse[0], new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, reuse[1], 1,
            ref("allowNativeReuse", List.of("Z"), "Z")));
        load.addInstruction(reuse[0] + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT, reuse[1]));
        wrapBooleanReturns(methods.get("regex"), "autoPlayGate");
    }

    static int[] selectionAnchor(MutableMethod method) {
        var body = NuvioRemainingEpisodesPatch.instructions(method);
        int call = NuvioAnchors.reference(body, NuvioNative.STREAM_SELECTOR_DEFAULT_REF, "native source selection");
        if (!(body.get(call) instanceof RegisterRangeInstruction) || call + 2 >= body.size() ||
            body.get(call + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT || body.get(call + 2).getOpcode() != Opcode.IF_EQZ)
            throw new IllegalStateException("Native source selection result/branch changed");
        int result = ((OneRegisterInstruction) body.get(call + 1)).getRegisterA();
        if (((OneRegisterInstruction) body.get(call + 2)).getRegisterA() != result)
            throw new IllegalStateException("Native source selection branches on a different value");
        int streams = ((RegisterRangeInstruction) body.get(call)).getStartRegister();
        int model = NuvioAnchors.fieldReceiver(body, NuvioNative.RESOLVED_SESSION_FIELD_REF, call);
        int manual = NuvioAnchors.fieldReceiver(body, NuvioNative.MANUAL_SELECTION_FIELD_REF, call);
        // f's argument 7 is the persisted binge group, retained in this register
        // after the invocation; the exact method fingerprint validates its source.
        int bingeGroup = streams + 7;
        for (int register : new int[]{result, streams, model, manual, bingeGroup}) if (register > 15)
            throw new IllegalStateException("Preferred-source registers cannot encode invoke-static");
        return new int[]{call + 2, result, streams, model, manual, bingeGroup};
    }

    static int[] reuseAnchor(MutableMethod method) {
        var body = NuvioRemainingEpisodesPatch.instructions(method);
        int read = NuvioAnchors.reference(body, NuvioNative.STREAM_REUSE_FIELD_REF, "native reuse setting");
        if (body.get(read).getOpcode() != Opcode.IGET_BOOLEAN || read + 1 >= body.size() ||
            body.get(read + 1).getOpcode() != Opcode.IF_EQZ ||
            ((OneRegisterInstruction) body.get(read)).getRegisterA() != ((OneRegisterInstruction) body.get(read + 1)).getRegisterA())
            throw new IllegalStateException("Native source reuse flag/branch changed");
        return new int[]{read + 1, ((OneRegisterInstruction) body.get(read)).getRegisterA()};
    }
}
