package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.util.*;
import kotlin.Unit;

/** Collects original native button arguments, then renders the configured order in the native row. */
public final class NuvioPlaybackButtonsPatch {
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviobuttons/NuvioPlaybackButtons;";
    static final String BUTTON = NuvioNative.REF_PLAYER_CONTROLS_C;
    static final String ANIMATION = NuvioNative.REF_ANIMATED_VISIBILITY_E;
    static final String REPORT = NuvioNative.REF_PLAYER_CONTROLS_M;
    static final String MORE_CONSTRUCTOR = NuvioNative.REF_PLAYER_MORE_ROW_INIT;

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getNuvioPlaybackButtonsPatch() {
        return PatchKt.bytecodePatch("NuvioTV - Customize playback buttons",
            "Adds optional playback button visibility, ordering and placement in the main row or More actions, with saved settings and reset.", false, builder -> {
            builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                null, null, List.of(new AppTarget(NuvioNative.VERSION, null, false, null, null)), app.morphe.patcher.patch.FormFactor.TV, false));
            builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
            builder.extendWith(() -> NuvioStreamPreloadPatch.extension("nuvio-playback-buttons"));
            builder.execute(context -> {
                if (!NuvioNative.PACKAGE_NAME.equals(context.getPackageMetadata().getPackageName()) ||
                    !NuvioNative.VERSION.equals(context.getPackageMetadata().getVersionName()))
                    throw new IllegalStateException("Playback buttons require NuvioTV 1.1.0-beta.9");
                MutableClass main = context.mutableClassDefBy(NuvioNative.PLAYER_MAIN_ROW_TYPE), more = context.mutableClassDefBy(NuvioNative.PLAYER_MORE_ROW_TYPE);
                validateRuntime(new MutableClass(context.classDefBy(NuvioNative.PLAYER_CONTROLS_TYPE)),
                    new MutableClass(context.classDefBy(NuvioNative.ANIMATED_VISIBILITY_TYPE)), new MutableClass(context.classDefBy(NuvioNative.ANIMATED_SCOPE_TYPE)));
                for (String signature : UI_CONTRACTS) validateUiMethod(new MutableClass(context.classDefBy(
                    signature.substring(0, signature.indexOf("->")))), signature);
                NuvioIntroDbPatch.staticFields(new MutableClass(context.classDefBy(NuvioNative.COLOR_TYPE)), "b:J");
                NuvioIntroDbPatch.fields(new MutableClass(context.classDefBy("Lio/sentry/d2;")), "b:Ljava/util/ArrayList;");
                NuvioIntroDbPatch.fields(new MutableClass(context.classDefBy(NuvioNative.KEY_EVENT_TYPE)), "a:Landroid/view/KeyEvent;");
                NuvioIntroDbPatch.staticFields(new MutableClass(context.classDefBy(NuvioNative.COMPOSE_EMPTY_TYPE)), "a:Lh1/d;");
                for (String field : List.of(NuvioNative.REF_ICON_PARTY_D, NuvioNative.REF_ICON_EXTERNAL_A, NuvioNative.REF_ICON_ASPECT_A, NuvioNative.REF_ICON_CHAPTERS_C)) {
                    int arrow = field.indexOf("->");
                    NuvioIntroDbPatch.staticFields(new MutableClass(context.classDefBy(field.substring(0, arrow))), field.substring(arrow + 2));
                }
                validate(main, more); // Validate both owners before any mutation.
                hook(main, more);
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
    }
    static final List<String> UI_CONTRACTS = List.of(
        NuvioNative.REF_COMPOSER_R, NuvioNative.REF_COMPOSER_O0,
        NuvioNative.REF_LAZY_LIST_FACTORY_B, NuvioNative.REF_LAZY_LIST_STATE_K,
        NuvioNative.REF_LAZY_LIST_SCOPE_Q,
        NuvioNative.REF_LAZY_LIST_I,
        NuvioNative.REF_NATIVE_I,
        "Le0/o1;-><init>(FFFF)V", "Le0/i;->g(F)Le0/f;",
        NuvioNative.REF_KEY_MODIFIERS_E,
        NuvioNative.REF_FOCUS_MODIFIERS_D, NuvioNative.REF_FOCUS_INITIALIZER_G,
        NuvioNative.REF_FOCUS_EFFECT_INIT,
        NuvioNative.REF_COMPOSE_EFFECT_D,
        NuvioNative.REF_SETTINGS_ROWS_A,
        NuvioNative.REF_LIBRARY_CONTENT_Z,
        NuvioNative.REF_ICON_MEDIA_Q, NuvioNative.REF_ICON_NEXT_R, NuvioNative.REF_ICON_AUDIO_L, NuvioNative.REF_RESOURCE_HELPER_U,
        NuvioNative.REF_ICON_PARTY_Q, NuvioNative.REF_ICON_SPEED_M, NuvioNative.REF_ICON_EXTERNAL_F, NuvioNative.REF_ICON_MEDIA_P, NuvioNative.REF_ICON_PARTY_O,
        NuvioNative.REF_VECTOR_BUILDER_INIT, NuvioNative.REF_VECTOR_BUILDER_A, NuvioNative.REF_VECTOR_BUILDER_B,
        "Le2/a1;-><init>(J)V", "Lio/sentry/d2;-><init>(I)V", "Lio/sentry/d2;->o(FF)V", "Lio/sentry/d2;->m(FF)V", "Lio/sentry/d2;->e()V",
        NuvioNative.REF_SETTINGS_ROWS_D,
        NuvioNative.REF_SETTINGS_ROWS_E,
        NuvioNative.REF_SETTINGS_ROWS_J,
        NuvioNative.REF_SETTINGS_ROWS_M,
        NuvioNative.REF_SETTINGS_PICKER_INIT,
        NuvioNative.REF_COMPOSABLE_LAMBDA_INIT, NuvioNative.REF_COMPOSER_D0, NuvioNative.REF_COMPOSER_P);
    static void validateUiMethod(MutableClass owner, String signature) {
        MutableMethod expected = owner.getMethods().stream().filter(m -> m.toString().equals(signature)).findFirst()
            .orElseThrow(() -> new IllegalStateException("Native playback UI contract changed: " + signature));
        if (owner.getMethods().stream().filter(m -> m.getName().equals(expected.getName()) &&
            m.getParameterTypes().size() == expected.getParameterTypes().size()).count() != 1 ||
            (((expected.getAccessFlags() & 8) != 0) != (!expected.getName().equals("<init>") &&
                !List.of(NuvioNative.COMPOSABLE_LAMBDA_TYPE, NuvioNative.COMPOSER_TYPE, "Lio/sentry/d2;", NuvioNative.LAZY_LIST_SCOPE_TYPE, NuvioNative.LAZY_LIST_STATE_TYPE).contains(owner.getType()) &&
                !signature.equals(NuvioNative.REF_VECTOR_BUILDER_B))))
            throw new IllegalStateException("Ambiguous or incompatible native playback UI contract: " + signature);
    }
    static String reference(Instruction instruction) {
        return instruction instanceof ReferenceInstruction ? ((ReferenceInstruction) instruction).getReference().toString() : "";
    }
    static MutableMethod invoke(MutableClass owner, int count) {
        MutableMethod method = NuvioRemainingEpisodesPatch.unique(owner, "invoke", count);
        if (!method.getReturnType().equals("Ljava/lang/Object;") || (method.getAccessFlags() & 8) != 0 ||
            method.getParameterTypes().stream().anyMatch(p -> !p.equals("Ljava/lang/Object;")) || method.getImplementation() == null)
            throw new IllegalStateException("Native playback lambda signature changed");
        return method;
    }
    static void validateRuntime(MutableClass buttons, MutableClass animation, MutableClass scope) {
        for (String signature : List.of(BUTTON, REPORT, ANIMATION)) {
            MutableClass owner = signature.startsWith("Lv/") ? animation : buttons;
            if (owner.getMethods().stream().filter(m -> m.toString().equals(signature) && (m.getAccessFlags() & 8) != 0).count() != 1)
                throw new IllegalStateException("Native playback method changed: " + signature);
        }
        if (!scope.getType().equals(NuvioNative.ANIMATED_SCOPE_TYPE) || (scope.getAccessFlags() & 0x200) == 0 || !scope.getMethods().isEmpty())
            throw new IllegalStateException("Playback animation scope must be the native empty interface");
    }
    static void validate(MutableClass main, MutableClass more) {
        if (!main.getType().equals(NuvioNative.PLAYER_MAIN_ROW_TYPE) || !more.getType().equals(NuvioNative.PLAYER_MORE_ROW_TYPE)) throw new IllegalStateException("Wrong playback owners");
        List<Instruction> a = NuvioAiringSeriesPatch.instructions(invoke(main, 2));
        List<Instruction> b = NuvioAiringSeriesPatch.instructions(invoke(more, 3));
        requireCalls(a, BUTTON, 9, 14); requireCalls(a, ANIMATION, 1, 8);
        requireCalls(a, MORE_CONSTRUCTOR, 1, 14);
        requireCalls(b, BUTTON, 5, 14); requireCalls(b, REPORT, 1, 9);
        if (a.stream().anyMatch(i -> reference(i).startsWith(EXTENSION)) || b.stream().anyMatch(i -> reference(i).startsWith(EXTENSION)))
            throw new IllegalStateException("Playback buttons already patched");
        // Fixed real-input register contracts; no speculative register allocation or parameter movement.
        if (invoke(main, 2).getImplementation().getRegisterCount() != 59 ||
            invoke(more, 3).getImplementation().getRegisterCount() != 52)
            throw new IllegalStateException("Native playback register layout changed");
        // Exact latest-version bodies prove availability branches, register sources and group boundaries.
        if (!fingerprint(withoutIntroControl(invoke(main, 2))).equals(NuvioNative.HASH_PLAYER_MAIN_BODY) ||
            !fingerprint(invoke(more, 3)).equals(NuvioNative.HASH_PLAYER_MORE_BODY))
            throw new IllegalStateException("Native playback instruction layout changed");
    }
    static String fingerprint(MutableMethod method) {
        StringBuilder text = new StringBuilder();
        text.append(method.getImplementation().getRegisterCount());
        for (Instruction i : method.getImplementation().getInstructions()) {
            text.append('|').append(i.getOpcode()).append(':').append(reference(i));
            if (i instanceof RegisterRangeInstruction) text.append('r').append(((RegisterRangeInstruction)i).getStartRegister()).append(',').append(((RegisterRangeInstruction)i).getRegisterCount());
            if (i instanceof OneRegisterInstruction) text.append('a').append(((OneRegisterInstruction)i).getRegisterA());
            if (i instanceof TwoRegisterInstruction) text.append('b').append(((TwoRegisterInstruction)i).getRegisterB());
            if (i instanceof ThreeRegisterInstruction) text.append('c').append(((ThreeRegisterInstruction)i).getRegisterC());
            if (i instanceof FiveRegisterInstruction) {
                FiveRegisterInstruction f = (FiveRegisterInstruction)i;
                text.append('f').append(f.getRegisterCount()).append(',').append(f.getRegisterC()).append(',').append(f.getRegisterD())
                    .append(',').append(f.getRegisterE()).append(',').append(f.getRegisterF()).append(',').append(f.getRegisterG());
            }
            if (i instanceof WideLiteralInstruction) text.append('l').append(((WideLiteralInstruction)i).getWideLiteral());
            if (i instanceof OffsetInstruction) text.append('o').append(((OffsetInstruction)i).getCodeOffset());
            if (i instanceof SwitchPayload) for (SwitchElement e : ((SwitchPayload)i).getSwitchElements()) text.append('s').append(e.getKey()).append(',').append(e.getOffset());
        }
        try {
            byte[] digest = java.security.MessageDigest.getInstance("SHA-256").digest(text.toString().getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder();
            for (byte b : digest) result.append(String.format("%02x", b & 255));
            return result.toString();
        } catch (java.security.NoSuchAlgorithmException impossible) { throw new AssertionError(impossible); }
    }
    private static MutableMethod withoutIntroControl(MutableMethod source) {
        MutableMethod copy = new MutableMethod(source);
        var code = NuvioAiringSeriesPatch.instructions(copy);
        int count = 0;
        for (int i = code.size() - 1; i >= 0; i--) if (reference(code.get(i)).equals(NuvioIntroDbPatch.RENDER)) {
            if (++count > 1 || !(code.get(i) instanceof RegisterRangeInstruction) ||
                ((RegisterRangeInstruction)code.get(i)).getStartRegister() != NuvioRemainingEpisodesPatch.parameterStart(source) || ((RegisterRangeInstruction)code.get(i)).getRegisterCount() != 2 ||
                i == 0 || !reference(code.get(i - 1)).equals(BUTTON)) throw new IllegalStateException("Unexpected IntroDB control hook");
            for (int later = i + 1; later < code.size(); later++) if (reference(code.get(later)).equals(BUTTON))
                throw new IllegalStateException("IntroDB control must follow the final native button");
            copy.getImplementation().removeInstruction(i);
        }
        return copy;
    }
    private static void requireCalls(List<Instruction> instructions, String signature, int count, int registers) {
        List<Instruction> matches = new ArrayList<>();
        for (Instruction i : instructions) if (reference(i).equals(signature)) matches.add(i);
        if (matches.size() != count || matches.stream().anyMatch(i -> !(i instanceof RegisterRangeInstruction) ||
            ((RegisterRangeInstruction)i).getRegisterCount() != registers))
            throw new IllegalStateException("Missing/ambiguous playback contract: " + signature);
    }
    static void hook(MutableClass main, MutableClass more) {
        validate(main, more);
        // IntroDB can be applied first. Move its proven appended hook before the final
        // native button so it participates in collection in either patch order.
        MutableMethod body = invoke(main, 2);
        var code = NuvioAiringSeriesPatch.instructions(body);
        for (int i = 0; i < code.size(); i++) if (reference(code.get(i)).equals(NuvioIntroDbPatch.RENDER)) {
            body.getImplementation().removeInstruction(i);
            body.getImplementation().addInstruction(i - 1, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, NuvioRemainingEpisodesPatch.parameterStart(body), 2,
                new ImmutableMethodReference(NuvioIntroDbPatch.EXT, "renderControl", List.of("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")));
            break;
        }
        rewrite(invoke(main, 2), new String[]{"play", "next", "subtitles", "audio", "chapters", "sources", "episodes", "party", "finish"});
        rewrite(invoke(more, 3), new String[]{"speed", "aspect", "engine", "external", "info"});
    }
    private static void rewrite(MutableMethod method, String[] names) {
        List<Instruction> instructions = NuvioAiringSeriesPatch.instructions(method);
        int cursor = names.length;
        for (int index = instructions.size() - 1; index >= 0; index--) {
            Instruction instruction = instructions.get(index);
            String signature = reference(instruction), name = null;
            if (signature.equals(MORE_CONSTRUCTOR)) {
                int instance = ((RegisterRangeInstruction) instruction).getStartRegister();
                method.getImplementation().addInstruction(index + 1, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, instance, 1,
                    new ImmutableMethodReference(EXTENSION, "registerMore", List.of("Ljava/lang/Object;"), "V")));
            } else if (signature.equals(BUTTON)) name = names[--cursor];
            else if (signature.equals(ANIMATION)) name = "more";
            else if (signature.equals(REPORT)) name = "report";
            if (name == null) continue;
            MethodReference nativeMethod = (MethodReference) ((ReferenceInstruction) instruction).getReference();
            List<String> parameters = new ArrayList<>();
            for (CharSequence p : nativeMethod.getParameterTypes()) {
                String type = p.toString();
                parameters.add(type.startsWith("L") ? "Ljava/lang/Object;" : type);
            }
            RegisterRangeInstruction range = (RegisterRangeInstruction) instruction;
            method.getImplementation().replaceInstruction(index, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                range.getStartRegister(), range.getRegisterCount(), new ImmutableMethodReference(EXTENSION, name, parameters, "V")));
        }
        if (cursor != 0) throw new IllegalStateException("Unconsumed playback buttons");
    }
}
