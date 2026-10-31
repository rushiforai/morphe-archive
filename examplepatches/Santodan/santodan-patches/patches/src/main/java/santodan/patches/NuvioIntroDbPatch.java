package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import kotlin.Unit;

public final class NuvioIntroDbPatch {
    static final String EXT = "Lsoftware/santodan/extension/nuviointro/NuvioIntroDb;";
    static final String RENDER = EXT + "->renderControl(Ljava/lang/Object;Ljava/lang/Object;)V";
    static final String POSITION = NuvioNative.REF_PLAYER_POSITION_E;
    public static BytecodePatch getNuvioIntroDbPatch() {
        return PatchKt.bytecodePatch("NuvioTV - Submit segments to IntroDB",
            "Adds an optional playback button that captures segment start/end times and opens a native NuvioTV submission dialog. Enable it and enter your IntroDB API key in Settings.", false, builder -> {
            builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                null, null, List.of(new AppTarget(NuvioNative.VERSION, null, false, null, null)), app.morphe.patcher.patch.FormFactor.TV, false));
            builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
            builder.extendWith(() -> NuvioStreamPreloadPatch.extension("nuvio-introdb"));
            builder.execute(context -> {
                if (!NuvioNative.PACKAGE_NAME.equals(context.getPackageMetadata().getPackageName()) ||
                    !NuvioNative.VERSION.equals(context.getPackageMetadata().getVersionName()))
                    throw new IllegalStateException("IntroDB requires NuvioTV 1.1.0-beta.9");
                validateState(new MutableClass(context.classDefBy(NuvioNative.PLAYER_STATE_TYPE)));
                for (String signature : UI) require(new MutableClass(context.classDefBy(signature.substring(0, signature.indexOf("->")))), signature);
                fields(new MutableClass(context.classDefBy(NuvioNative.PLAYER_MAIN_ROW_TYPE)), "c:Lbb/hl;", "d:Lbb/el;", "i:Lc2/z;", "j:Lkotlin/jvm/functions/Function0;", "k:Lkotlin/jvm/functions/Function0;");
                fields(new MutableClass(context.classDefBy(NuvioNative.PLAYER_MODEL_TYPE)), "Y:Lbb/bc;");
                fields(new MutableClass(context.classDefBy(NuvioNative.PLAYER_CONTROLLER_TYPE)), "H0:Lkotlinx/coroutines/flow/StateFlow;", "U0:Lkotlinx/coroutines/Job;");
                fields(new MutableClass(context.classDefBy(NuvioNative.PLAYER_SESSION_TYPE)), "d:Z");
                fields(new MutableClass(context.classDefBy(NuvioNative.DROPDOWN_OPTION_TYPE)), "a:Ljava/lang/String;", "b:Ljava/lang/String;");
                fields(new MutableClass(context.classDefBy(NuvioNative.NATIVE_COLORS_TYPE)), "b:J", "c:J", "l:J", "x:J");
                fields(new MutableClass(context.classDefBy(NuvioNative.NATIVE_SPACING_TYPE)), "b:F", "c:F");
                fields(new MutableClass(context.classDefBy("Lio/sentry/d2;")), "b:Ljava/util/ArrayList;");
                staticFields(new MutableClass(context.classDefBy(NuvioNative.NATIVE_SPACING_LOCAL_TYPE)), "a:Ljb/m0;");
                staticFields(new MutableClass(context.classDefBy("Ly2/l1;")), "q:Lh1/c3;");
                staticFields(new MutableClass(context.classDefBy(NuvioNative.SETTINGS_BUTTON_LABELS_TYPE)), "a:Lr1/s;", "b:Lr1/s;");
                staticFields(new MutableClass(context.classDefBy(NuvioNative.COLOR_TYPE)), "b:J");
                MutableMethod position = require(new MutableClass(context.classDefBy(NuvioNative.PLAYER_POSITION_TYPE)), POSITION);
                for (String reference : List.of(NuvioNative.REF_PLAYER_POSITION_I, NuvioNative.REF_PLAYER_ENGINE_L, "Landroidx/media3/common/Player;->getCurrentPosition()J"))
                    if (NuvioAiringSeriesPatch.instructions(position).stream().noneMatch(i -> NuvioPlaybackButtonsPatch.reference(i).equals(reference)))
                        throw new IllegalStateException("Native playback position semantics changed");
                MutableMethod timer = require(new MutableClass(context.classDefBy(NuvioNative.PLAYER_TIMERS_TYPE)), NuvioNative.REF_PLAYER_TIMERS_F);
                if (NuvioAiringSeriesPatch.instructions(timer).stream().filter(i -> NuvioPlaybackButtonsPatch.reference(i).equals(NuvioNative.REF_PLAYER_CONTROLLER_T0)).count() != 2)
                    throw new IllegalStateException("Native controls timer job changed");
                validateTimer(timer);
                validateTimer(require(new MutableClass(context.classDefBy(NuvioNative.PLAYER_TIMERS_TYPE)), PAUSE_TIMER));
                MutableMethod cancelPause = require(new MutableClass(context.classDefBy(NuvioNative.PLAYER_TIMERS_TYPE)), CANCEL_PAUSE);
                if ((cancelPause.getAccessFlags() & 8) == 0 || !NuvioPlaybackButtonsPatch.fingerprint(cancelPause).equals(CANCEL_PAUSE_HASH))
                    throw new IllegalStateException("IntroDB native pause-overlay cancellation changed");
                hook(context.mutableClassDefBy(NuvioNative.PLAYER_MAIN_ROW_TYPE), context.mutableClassDefBy("Lcom/nuvio/tv/MainActivity;"));
                hookTimer(context.mutableClassDefBy(NuvioNative.PLAYER_TIMERS_TYPE));
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
    }
    static final String TIMER_HASH = "df22c44050aa01e07b296656e1317d6104b0ae403e8e97944b28060196b3f8df";
    static final String PAUSE_TIMER = NuvioNative.PLAYER_TIMERS_TYPE + "->" + NuvioNative.PAUSE_TIMER_METHOD + "(" + NuvioNative.PLAYER_CONTROLLER_TYPE + ")V";
    static final String CANCEL_PAUSE = NuvioNative.PLAYER_TIMERS_TYPE + "->" + NuvioNative.CANCEL_PAUSE_METHOD + "(" + NuvioNative.PLAYER_CONTROLLER_TYPE + ")V";
    static final String PAUSE_TIMER_HASH = "3d9ae6dac44b03f11c170898981b5c6213eb598bc95d976f4c9e09d7e078d430";
    static final String CANCEL_PAUSE_HASH = "1eaee7b7a413af021ae4f8a34814af6bba404379d1217cb99ef8a1e9ce9a4041";
    static final String HOLD_TIMER = EXT + "->holdControlsTimer(Ljava/lang/Object;)Z";
    static void validateTimer(MutableMethod method) {
        String hash = method.toString().equals(NuvioNative.REF_PLAYER_TIMERS_F) ? TIMER_HASH :
            method.toString().equals(PAUSE_TIMER) ? PAUSE_TIMER_HASH : "";
        if (hash.isEmpty() || (method.getAccessFlags() & 8) == 0 ||
            method.getImplementation() == null || !method.getImplementation().getTryBlocks().isEmpty() ||
            !NuvioPlaybackButtonsPatch.fingerprint(method).equals(hash))
            throw new IllegalStateException("IntroDB controls timer changed or already patched");
    }
    static void hookTimer(MutableClass owner) {
        var timers = List.of(require(owner, NuvioNative.REF_PLAYER_TIMERS_F), require(owner, PAUSE_TIMER));
        timers.forEach(NuvioIntroDbPatch::validateTimer);
        for (MutableMethod method : timers) hookTimerMethod(method);
    }
    private static void hookTimerMethod(MutableMethod method) {
        var code = method.getImplementation();
        var original = code.newLabelForIndex(0);
        // v0 is a local overwritten at native entry; p0 remains the controller.
        code.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
            NuvioAnchors.parameter(method, 0), 1,
            new ImmutableMethodReference(EXT, "holdControlsTimer", List.of("Ljava/lang/Object;"), "Z")));
        code.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        code.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, original));
        code.addInstruction(3, new BuilderInstruction10x(Opcode.RETURN_VOID));
    }
    static final List<String> UI = List.of(
        NuvioPlaybackButtonsPatch.BUTTON, POSITION,
        NuvioNative.REF_FOCUS_REQUESTER_INIT,
        NuvioNative.REF_COMPOSE_FACTORY_T, NuvioNative.REF_COMPOSER_D0, NuvioNative.REF_COMPOSER_P,
        NuvioNative.REF_INPUT_FIELD_INIT,
        NuvioNative.REF_INPUT_FOCUS_INIT, NuvioNative.REF_INPUT_CLICK_INIT,
        NuvioNative.REF_INPUT_SAVE_LABEL_INIT,
        NuvioNative.REF_NATIVE_F,
        NuvioNative.REF_FOCUS_MODIFIERS_I,
        NuvioNative.REF_POSTER_IMAGE_Y, NuvioNative.REF_POSTER_IMAGE_A,
        "Ly/m;->a(JF)Ly/u;", NuvioNative.REF_NATIVE_FOCUS_STYLE_A,
        "Ll0/g;->b(F)Ll0/f;", "Ly5/c;-><init>(Ly/u;Le2/y0;I)V",
        NuvioNative.REF_NATIVE_B_2, NuvioNative.REF_NATIVE_A_2,
        "Ly5/m;->e(Le2/y0;I)Ly5/q;", "Ly5/m;->d(FI)Ly5/p;",
        NuvioNative.REF_NATIVE_C,
        NuvioNative.REF_NATIVE_A,
        NuvioNative.REF_NATIVE_B,
        NuvioNative.REF_VECTOR_BUILDER_INIT, NuvioNative.REF_VECTOR_BUILDER_A, NuvioNative.REF_VECTOR_BUILDER_B,
        "Le2/a1;-><init>(J)V", "Lio/sentry/d2;-><init>(I)V", "Lio/sentry/d2;->o(FF)V", "Lio/sentry/d2;->m(FF)V", "Lio/sentry/d2;->e()V",
        NuvioNative.REF_COMPOSABLE_LAMBDA_INIT,
        NuvioNative.REF_LIBRARY_CONTENT_Z,
        NuvioNative.REF_SETTINGS_ROWS_D,
        NuvioNative.REF_SETTINGS_ROWS_E,
        NuvioNative.REF_DROPDOWN_B,
        NuvioNative.REF_SETTINGS_ROWS_M,
        NuvioNative.REF_SETTINGS_ROWS_A,
        NuvioNative.REF_SETTINGS_SECTION_B,
        NuvioNative.REF_PLAYER_TIMERS_F,
        "Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V",
        NuvioNative.REF_DROPDOWN_OPTION_INIT);
    static MutableMethod require(MutableClass owner, String signature) {
        MutableMethod method = owner.getMethods().stream().filter(m -> m.toString().equals(signature)).reduce((a,b) -> {
            throw new IllegalStateException("Ambiguous IntroDB native API: " + signature);
        }).orElseThrow(() -> new IllegalStateException("Missing IntroDB native API: " + signature));
        boolean instance = method.getName().equals("<init>") || List.of(NuvioNative.COMPOSER_TYPE, NuvioNative.NATIVE_FOCUS_STYLE_TYPE, "Lio/sentry/d2;").contains(owner.getType()) ||
            signature.equals(NuvioNative.REF_VECTOR_BUILDER_B);
        if (((method.getAccessFlags() & 8) == 0) != instance) throw new IllegalStateException("Native API static status changed: " + signature);
        return method;
    }
    static void fields(MutableClass owner, String... expected) {
        for (String signature : expected) if (owner.getFields().stream().filter(f -> f.toString().equals(owner.getType() + "->" + signature) && (f.getAccessFlags() & 8) == 0).count() != 1)
            throw new IllegalStateException("IntroDB field changed: " + signature);
    }
    static void staticFields(MutableClass owner, String... expected) {
        for (String signature : expected) if (owner.getFields().stream().filter(f -> f.toString().equals(owner.getType() + "->" + signature) && (f.getAccessFlags() & 8) != 0).count() != 1)
            throw new IllegalStateException("IntroDB native UI constant changed: " + signature);
    }
    static void validateState(MutableClass owner) {
        fields(owner, NuvioNative.STATE_SEASON_SPEC, NuvioNative.STATE_EPISODE_SPEC, NuvioNative.STATE_VIDEO_SPEC, "i:Ljava/lang/String;");
        var body = NuvioAiringSeriesPatch.instructions(NuvioRemainingEpisodesPatch.unique(owner, "toString", 0));
        String[] labels = {", currentSeason=", ", currentEpisode=", ", currentVideoId="};
        String[] names = {NuvioNative.STATE_SEASON_SPEC, NuvioNative.STATE_EPISODE_SPEC, NuvioNative.STATE_VIDEO_SPEC};
        for (int n = 0; n < labels.length; n++) {
            int hits = 0;
            for (int i = 0; i + 2 < body.size(); i++) if (NuvioPlaybackButtonsPatch.reference(body.get(i)).equals(labels[n]) &&
                NuvioPlaybackButtonsPatch.reference(body.get(i + 2)).equals(NuvioNative.REF_PLAYER_STATE_ARGS + names[n])) hits++;
            if (hits != 1) throw new IllegalStateException("IntroDB episode field semantics changed");
        }
    }
    static MutableMethod lifecycle(MutableClass activity, String name) {
        MutableMethod m = NuvioRemainingEpisodesPatch.unique(activity, name, 0);
        if (!m.getReturnType().equals("V") || (m.getAccessFlags() & 8) != 0 || m.getImplementation() == null)
            throw new IllegalStateException("Activity lifecycle changed");
        return m;
    }
    // Restore only known same-register bridges on a copy before checking the original layout.
    static MutableMethod originalMain(MutableMethod source) {
        MutableMethod copy = new MutableMethod(source);
        var code = NuvioAiringSeriesPatch.instructions(copy);
        for (int i = code.size() - 1; i >= 0; i--) {
            String ref = NuvioPlaybackButtonsPatch.reference(code.get(i));
            if (ref.equals(RENDER) || ref.equals(NuvioPlaybackButtonsPatch.EXTENSION + "->registerMore(Ljava/lang/Object;)V")) {
                if (code.get(i).getOpcode() != Opcode.INVOKE_STATIC_RANGE || !(code.get(i) instanceof RegisterRangeInstruction))
                    throw new IllegalStateException("Malformed optional player hook");
                RegisterRangeInstruction call = (RegisterRangeInstruction)code.get(i);
                if (ref.equals(RENDER) ? call.getStartRegister() != NuvioRemainingEpisodesPatch.parameterStart(source) || call.getRegisterCount() != 2 :
                    call.getRegisterCount() != 1 || i == 0 || !NuvioPlaybackButtonsPatch.reference(code.get(i - 1)).equals(NuvioPlaybackButtonsPatch.MORE_CONSTRUCTOR) ||
                    call.getStartRegister() != ((RegisterRangeInstruction)code.get(i - 1)).getStartRegister())
                    throw new IllegalStateException("Optional player hook registers changed");
                copy.getImplementation().removeInstruction(i); continue;
            }
            if (!ref.startsWith(NuvioPlaybackButtonsPatch.EXTENSION + "->")) continue;
            MethodReference old = (MethodReference)((ReferenceInstruction)code.get(i)).getReference();
            MethodReference nativeRef;
            if (old.getName().equals("more")) nativeRef = new ImmutableMethodReference(NuvioNative.ANIMATED_VISIBILITY_TYPE, "e", List.of("Z",NuvioNative.MODIFIER_TYPE,NuvioNative.ENTER_TRANSITION_TYPE,NuvioNative.EXIT_TRANSITION_TYPE,"Ljava/lang/String;",NuvioNative.COMPOSABLE_LAMBDA_TYPE,NuvioNative.COMPOSER_INTERFACE_TYPE,"I"), "V");
            else if (List.of("play","next","subtitles","audio","chapters","sources","episodes","party","finish").contains(old.getName()))
                nativeRef = new ImmutableMethodReference(NuvioNative.PLAYER_CONTROLS_TYPE, "c", List.of(NuvioNative.VECTOR_TYPE,"Lj2/a;","Ljava/lang/String;","Lkotlin/jvm/functions/Function0;",NuvioNative.FOCUS_REQUESTER_TYPE,NuvioNative.FOCUS_REQUESTER_TYPE,"Z","Lkotlin/jvm/functions/Function0;","Lkotlin/jvm/functions/Function0;","J",NuvioNative.COMPOSER_INTERFACE_TYPE,"I","I"), "V");
            else throw new IllegalStateException("Unknown playback bridge");
            List<String> erased = new ArrayList<>();
            for (CharSequence type : nativeRef.getParameterTypes()) erased.add(type.toString().startsWith("L") ? "Ljava/lang/Object;" : type.toString());
            if (!old.getParameterTypes().equals(erased) || !old.getReturnType().equals("V") || code.get(i).getOpcode() != Opcode.INVOKE_STATIC_RANGE)
                throw new IllegalStateException("Playback bridge signature changed");
            RegisterRangeInstruction range = (RegisterRangeInstruction)code.get(i);
            copy.getImplementation().replaceInstruction(i, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, range.getStartRegister(), range.getRegisterCount(), nativeRef));
        }
        return copy;
    }
    static void validate(MutableClass main, MutableClass activity) {
        MutableMethod m = NuvioPlaybackButtonsPatch.invoke(main, 2);
        if (!main.getType().equals(NuvioNative.PLAYER_MAIN_ROW_TYPE) || NuvioAiringSeriesPatch.instructions(m).stream().anyMatch(i -> NuvioPlaybackButtonsPatch.reference(i).startsWith(EXT)) ||
            !NuvioPlaybackButtonsPatch.fingerprint(originalMain(m)).equals(NuvioNative.HASH_PLAYER_MAIN_BODY))
            throw new IllegalStateException("IntroDB player control layout changed or already patched");
        for (String name : List.of("onResume", "onPause")) {
            var code = NuvioAiringSeriesPatch.instructions(lifecycle(activity, name));
            if (code.stream().anyMatch(i -> NuvioPlaybackButtonsPatch.reference(i).startsWith(EXT)) || code.stream().filter(i -> i.getOpcode() == Opcode.RETURN_VOID).count() != 1)
                throw new IllegalStateException("IntroDB lifecycle changed or already patched");
        }
    }
    static void hook(MutableClass main, MutableClass activity) {
        validate(main, activity);
        MutableMethod method = NuvioPlaybackButtonsPatch.invoke(main, 2);
        var code = NuvioAiringSeriesPatch.instructions(method);
        for (int i = code.size() - 1; i >= 0; i--) {
            String ref = NuvioPlaybackButtonsPatch.reference(code.get(i));
            if (ref.equals(NuvioPlaybackButtonsPatch.BUTTON) || ref.startsWith(NuvioPlaybackButtonsPatch.EXTENSION + "->finish(")) {
                // Customization must collect the optional control before flushing the native row.
                int insertion = ref.startsWith(NuvioPlaybackButtonsPatch.EXTENSION) ? i : i + 1;
                method.getImplementation().addInstruction(insertion, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, NuvioRemainingEpisodesPatch.parameterStart(method), 2,
                    new ImmutableMethodReference(EXT, "renderControl", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")));
                break;
            }
        }
        for (String name : List.of("onResume", "onPause")) {
            MutableMethod m = lifecycle(activity, name);
            int index = name.equals("onPause") ? 0 : m.getImplementation().getInstructions().size() - 1;
            m.getImplementation().addInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, m.getImplementation().getRegisterCount() - 1, 1,
                new ImmutableMethodReference(EXT, name.equals("onResume") ? "resume" : "pause", List.of("Landroid/app/Activity;"), "V")));
        }
    }
}
