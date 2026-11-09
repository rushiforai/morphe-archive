package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import java.io.*;
import java.net.URI;
import java.util.zip.ZipFile;
import java.util.zip.ZipEntry;
import java.util.ArrayList;
import java.util.List;
import kotlin.Unit;

/** Shared, unnamed dependency: installed once by any NuvioTV runtime settings patch. */
public final class NuvioSettingsMenuPatch {
    private static BytecodePatch patch;
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviomenu/NuvioSettingsMenu;";
    private NuvioSettingsMenuPatch() {}

    static synchronized BytecodePatch getMenuPatch() {
        if (patch == null) patch = PatchKt.bytecodePatch(null, null, false, builder -> {
            builder.extendWith(NuvioSettingsMenuPatch::extensionStream);
            builder.execute(context -> {
                String version = context.getPackageMetadata().getVersionName();
                NuvioLayout.use(version);
                if (!NuvioNative.PACKAGE_NAME.equals(context.getPackageMetadata().getPackageName()))
                    throw NuvioAiringSeriesPatch.unsupported("Expected com.nuvio.tv");
                validateStateFactory(new MutableClass(context.classDefBy(NuvioNative.COMPOSE_FACTORY_TYPE)));
                for (String reference : DATE_COLOR_APIS)
                    validateDateColorApi(new MutableClass(context.classDefBy(reference.substring(0, reference.indexOf("->")))), reference);
                for (String reference : List.of(NuvioNative.REF_DATE_PREVIEW_CROP)) {
                    boolean present = false;
                    for (var field : context.classDefBy(referenceOwner(reference)).getFields())
                        if (field.toString().equals(reference) && ((field.getAccessFlags() & 8) != 0) == reference.equals(NuvioNative.REF_DATE_PREVIEW_CROP)) present = true;
                    if (!present) throw new IllegalStateException("Missing native cover preview field: " + reference);
                }
                hookDateColorSwatch(context.mutableClassDefBy(NuvioNative.SETTINGS_STYLE_TYPE));
                hookDateColorOpacity(context.mutableClassDefBy(NuvioNative.SETTINGS_STYLE_TYPE));
                hookDateEditorPreview(context.mutableClassDefBy(referenceOwner(NuvioNative.REF_DATE_CUSTOM_PREVIEW)));
                hookDateEditorApply(context.mutableClassDefBy(referenceOwner(NuvioNative.REF_DATE_EDITOR_SAVE_LABEL)));
                hookPreviewMovie(context.mutableClassDefBy(referenceOwner(NuvioNative.REF_DATE_PREVIEW_META_INIT)));
                NuvioAccessPatch.install(context.mutableClassDefBy(NuvioAccessPatch.TYPE),
                    type -> new MutableClass(context.classDefBy(type)));
                // Install the shared collapsible Layout section.
                hookLayoutList(context.mutableClassDefBy(NuvioNative.LAYOUT_ITEMS_TYPE));
                return Unit.INSTANCE;
            });
            return Unit.INSTANCE;
        });
        return patch;
    }

    static void validateStateFactory(MutableClass owner) {
        MutableMethod method = NuvioRemainingEpisodesPatch.unique(owner, NuvioNative.STATE_FACTORY_METHOD, 1);
        if (!owner.getType().equals(NuvioNative.COMPOSE_FACTORY_TYPE) ||
            !method.getParameterTypes().equals(List.of("Ljava/lang/Object;")) ||
            !method.getReturnType().equals(NuvioNative.COMPOSE_STATE_TYPE) || (method.getAccessFlags() & 8) == 0)
            throw NuvioAiringSeriesPatch.unsupported("Compose state factory does not match the reviewed native contract");
    }

    static final List<String> DATE_COLOR_APIS = List.of(NuvioNative.REF_DATE_CUSTOM_COLOR_DIALOG,
        NuvioNative.REF_DATE_CUSTOM_COLOR_INIT, NuvioNative.REF_DATE_CUSTOM_COLOR_GET,
        NuvioNative.REF_DATE_COLUMN_POLICY, NuvioNative.REF_DATE_SPACED_BY, NuvioNative.REF_DATE_BOX_POLICY,
        NuvioNative.REF_DATE_NODE_UPDATE, NuvioNative.REF_DATE_NODE_INIT, NuvioNative.REF_DATE_MATERIALIZE,
        NuvioNative.REF_DATE_TEXT, NuvioNative.REF_DATE_PREVIEW_IMAGE, NuvioNative.REF_DATE_PREVIEW_HEIGHT,
        NuvioNative.REF_DATE_PREVIEW_META_ID, NuvioNative.REF_DATE_PREVIEW_META_CONTENT, NuvioNative.REF_DATE_PREVIEW_META_NAME,
        NuvioNative.REF_DATE_PREVIEW_META_POSTER, NuvioNative.REF_DATE_PREVIEW_META_LANDSCAPEPOSTER, NuvioNative.REF_DATE_PREVIEW_META_BACKGROUND,
        NuvioNative.REF_SETTINGS_ROWS_D);

    static void validateDateColorApi(MutableClass owner, String reference) {
        MutableMethod method = owner.getMethods().stream().filter(candidate -> candidate.toString().equals(reference))
            .reduce((a, b) -> { throw new IllegalStateException("Ambiguous date color API: " + reference); })
            .orElseThrow(() -> new IllegalStateException("Missing date color API: " + reference));
        boolean isStatic = !reference.equals(NuvioNative.REF_DATE_CUSTOM_COLOR_INIT) && !reference.equals(NuvioNative.REF_DATE_CUSTOM_COLOR_GET)
            && !reference.startsWith("Lcom/nuvio/tv/domain/model/MetaPreview;");
        if (((method.getAccessFlags() & 8) != 0) != isStatic)
            throw new IllegalStateException("Date color API static status changed: " + reference);
    }

    static final String DATE_STYLE = "Lsoftware/santodan/extension/nuviomenu/NuvioDateLabelStyle;";

    static void hookDateColorOpacity(MutableClass owner) {
        MutableMethod target = owner.getMethods().stream().filter(method -> method.toString().equals(NuvioNative.REF_DATE_COLOR_PALETTE))
            .reduce((a, b) -> { throw new IllegalStateException("Ambiguous color palette"); })
            .orElseThrow(() -> new IllegalStateException("Missing native color palette"));
        List<Instruction> body = NuvioAiringSeriesPatch.instructions(target);
        if (body.stream().anyMatch(i -> NuvioPlaybackButtonsPatch.reference(i).startsWith(DATE_STYLE)))
            throw new IllegalStateException("Color opacity already hooked");
        int anchor = NuvioAnchors.unique(body, i -> body.get(i).getOpcode() == Opcode.CHECK_CAST &&
            NuvioPlaybackButtonsPatch.reference(body.get(i)).equals("Lg1/o1;"), "native palette opacity state");
        int register = ((OneRegisterInstruction) body.get(anchor)).getRegisterA();
        target.getImplementation().addInstruction(anchor + 1, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, register, 1,
            new ImmutableMethodReference(DATE_STYLE, "bindColorOpacity", List.of("Ljava/lang/Object;"), "V")));
    }

    static void hookPreviewMovie(MutableClass owner) {
        MutableMethod target = owner.getMethods().stream().filter(method -> method.toString().equals(NuvioNative.REF_DATE_PREVIEW_META_INIT))
            .reduce((a, b) -> { throw new IllegalStateException("Ambiguous preview metadata constructor"); })
            .orElseThrow(() -> new IllegalStateException("Missing preview metadata constructor"));
        List<Instruction> body = NuvioAiringSeriesPatch.instructions(target);
        if ((target.getAccessFlags() & 8) != 0 || body.stream().anyMatch(i -> NuvioPlaybackButtonsPatch.reference(i).startsWith(DATE_STYLE)))
            throw new IllegalStateException("Preview metadata constructor changed or already hooked");
        int end = NuvioAnchors.unique(body, i -> body.get(i).getOpcode() == Opcode.RETURN_VOID, "completed metadata construction");
        int receiver = NuvioAnchors.parameter(target, 0) - 1;
        target.getImplementation().addInstruction(end, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, receiver, 1,
            new ImmutableMethodReference(DATE_STYLE, "rememberPreviewMovie", List.of("Ljava/lang/Object;"), "V")));
    }

    static void hookDateColorSwatch(MutableClass owner) {
        MutableMethod target = owner.getMethods().stream().filter(method -> method.toString().equals(NuvioNative.REF_DATE_COLOR_SWATCH))
            .reduce((a, b) -> { throw new IllegalStateException("Ambiguous native color swatch"); })
            .orElseThrow(() -> new IllegalStateException("Missing native color swatch"));
        List<Instruction> body = NuvioAiringSeriesPatch.instructions(target);
        if ((target.getAccessFlags() & 8) == 0 || body.isEmpty() || body.get(0).getOpcode() != Opcode.MOVE_WIDE_FROM16 ||
            body.stream().anyMatch(instruction -> NuvioPlaybackButtonsPatch.reference(instruction).startsWith(DATE_STYLE)))
            throw new IllegalStateException("Native color swatch changed or already hooked");
        int label = NuvioAnchors.reference(body, NuvioNative.REF_DATE_COLOR_SWATCH_LABEL, "color swatch label");
        int packed = ((TwoRegisterInstruction) body.get(0)).getRegisterA();
        if (((TwoRegisterInstruction) body.get(0)).getRegisterB() != NuvioAnchors.parameter(target, 0) ||
            label + 1 >= body.size() || body.get(label + 1).getOpcode() != Opcode.MOVE_RESULT_OBJECT)
            throw new IllegalStateException("Native color swatch register flow changed");
        int text = ((OneRegisterInstruction) body.get(label + 1)).getRegisterA();
        int start = NuvioAnchors.parameter(target, 0), click = NuvioAnchors.parameter(target, 3);
        if (packed + 1 > 15 || text > 15 || click != start + 4 || click > 255)
            throw new IllegalStateException("Native color swatch registers cannot be encoded");
        var code = target.getImplementation();
        code.addInstruction(label + 2, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 3, packed, packed + 1, text, 0, 0,
            new ImmutableMethodReference(DATE_STYLE, "colorSwatchLabel", List.of("J", "Ljava/lang/String;"), "Ljava/lang/String;")));
        code.addInstruction(label + 3, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, text));
        code.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, start, 5,
            new ImmutableMethodReference(DATE_STYLE, "colorSwatchClick", List.of("J", "Z", "Z", "Ljava/lang/Object;"), "Ljava/lang/Object;")));
        code.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, click));
        code.addInstruction(2, new BuilderInstruction21c(Opcode.CHECK_CAST, click,
            new ImmutableTypeReference("Lkotlin/jvm/functions/Function0;")));
        guardNativeRenderer(target, start, 8, "renderLabeledSwatch",
            List.of("J", "Z", "Z", "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "I"));
    }

    private static String referenceOwner(String reference) { return reference.substring(0, reference.indexOf("->")); }

    static void hookDateEditorPreview(MutableClass owner) {
        MutableMethod target = owner.getMethods().stream().filter(method -> method.toString().equals(NuvioNative.REF_DATE_CUSTOM_PREVIEW))
            .reduce((a, b) -> { throw new IllegalStateException("Ambiguous custom color preview"); })
            .orElseThrow(() -> new IllegalStateException("Missing custom color preview"));
        if ((target.getAccessFlags() & 8) == 0 || NuvioAiringSeriesPatch.instructions(target).stream()
            .anyMatch(instruction -> NuvioPlaybackButtonsPatch.reference(instruction).startsWith(DATE_STYLE)))
            throw new IllegalStateException("Custom preview changed or already hooked");
        guardNativeRenderer(target, NuvioAnchors.parameter(target, 0), 4, "renderEditorPreview",
            List.of("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;", "I"));
    }

    private static void guardNativeRenderer(MutableMethod target, int start, int count, String name, List<String> parameters) {
        var code = target.getImplementation();
        // v0 is overwritten at native entry in both reviewed renderers. Keep p-registers intact.
        if (start < 1) throw new IllegalStateException("Native renderer has no scratch register");
        var original = code.newLabelForIndex(0);
        code.addInstruction(0, new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, start, count,
            new ImmutableMethodReference(DATE_STYLE, name, parameters, "Z")));
        code.addInstruction(1, new BuilderInstruction11x(Opcode.MOVE_RESULT, 0));
        code.addInstruction(2, new BuilderInstruction21t(Opcode.IF_EQZ, 0, original));
        code.addInstruction(3, new BuilderInstruction10x(Opcode.RETURN_VOID));
    }

    static void hookDateEditorApply(MutableClass owner) {
        MutableMethod target = owner.getMethods().stream().filter(method -> method.toString().equals(NuvioNative.REF_DATE_EDITOR_SAVE_LABEL))
            .reduce((a, b) -> { throw new IllegalStateException("Ambiguous custom editor button label"); })
            .orElseThrow(() -> new IllegalStateException("Missing custom editor button label"));
        List<Instruction> body = NuvioAiringSeriesPatch.instructions(target);
        if (body.stream().anyMatch(instruction -> NuvioPlaybackButtonsPatch.reference(instruction).startsWith(DATE_STYLE)))
            throw new IllegalStateException("Custom editor button label already hooked");
        int save = NuvioAnchors.unique(body, index -> body.get(index) instanceof NarrowLiteralInstruction &&
            ((NarrowLiteralInstruction) body.get(index)).getNarrowLiteral() == Integer.decode(NuvioNative.DATE_THEME_SAVE_ID), "Save theme string");
        if (!NuvioPlaybackButtonsPatch.reference(body.get(save + 1)).equals("La/a;->T(ILg1/n;)Ljava/lang/String;"))
            throw new IllegalStateException("Custom editor string renderer changed");
        int register = ((OneRegisterInstruction) body.get(save)).getRegisterA();
        if (register > 15) throw new IllegalStateException("Custom editor label register cannot be encoded");
        target.getImplementation().addInstruction(save + 1, new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, register, 0, 0, 0, 0,
            new ImmutableMethodReference(DATE_STYLE, "editorSaveResource", List.of("I"), "I")));
        target.getImplementation().addInstruction(save + 2, new BuilderInstruction11x(Opcode.MOVE_RESULT, register));
    }

    static void hookLayoutList(MutableClass owner) {
        MutableMethod target = NuvioAiringSeriesPatch.unique(owner, "invoke", 1);
        List<Instruction> instructions = NuvioAiringSeriesPatch.instructions(target);
        int matches = 0;
        for (int i = instructions.size() - 1; i >= 0; i--) {
            Instruction instruction = instructions.get(i);
            if (!NuvioAiringSeriesPatch.calls(instruction, NuvioNative.SETTINGS_ITEM_TYPE, "<init>")) continue;
            MethodReference constructor = (MethodReference) ((ReferenceInstruction) instruction).getReference();
            if (!constructor.getParameterTypes().contains(NuvioNative.SETTINGS_LAYOUT_TYPE)) continue;
            int anchor = -1;
            for (int j = i + 1; j < Math.min(i + 12, instructions.size()); j++) {
                if (NuvioAiringSeriesPatch.calls(instructions.get(j), NuvioNative.LAZY_LIST_SCOPE_TYPE, "q")) { anchor = j; break; }
            }
            if (anchor < 0 || !(instructions.get(anchor) instanceof FiveRegisterInstruction))
                throw NuvioAiringSeriesPatch.unsupported("Layout section list anchor changed");
            int scope = ((FiveRegisterInstruction) instructions.get(anchor)).getRegisterC();
            target.getImplementation().addInstruction(anchor,
                new BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, scope, 0, 0, 0, 0,
                    new ImmutableMethodReference(EXTENSION, "addMenu", List.of("Ljava/lang/Object;"), "V")));
            matches++;
        }
        if (matches != 1) throw NuvioAiringSeriesPatch.unsupported("Ambiguous/missing Layout section list");
    }

    static InputStream extensionStream() {
        String path = "extensions/nuvio-settings-menu.mpe";
        InputStream resource = NuvioSettingsMenuPatch.class.getClassLoader().getResourceAsStream(path);
        if (resource != null) return resource;
        try {
            URI source = NuvioSettingsMenuPatch.class.getProtectionDomain().getCodeSource().getLocation().toURI();
            try (ZipFile zip = new ZipFile(new File(source))) {
                ZipEntry entry = zip.getEntry(path);
                if (entry == null) throw new FileNotFoundException(path);
                try (InputStream input = zip.getInputStream(entry)) {
                    ByteArrayOutputStream output = new ByteArrayOutputStream();
                    byte[] buffer = new byte[8192]; int count;
                    while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
                    return new ByteArrayInputStream(output.toByteArray());
                }
            }
        } catch (Exception error) {
            throw new IllegalStateException("Cannot load bundled NuvioTV extension", error);
        }
    }
}
