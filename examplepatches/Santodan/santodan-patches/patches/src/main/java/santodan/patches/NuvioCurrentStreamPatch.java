package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import java.util.*;
import kotlin.Unit;

/** Adds a visible label using the native session-selected source flag. */
public final class NuvioCurrentStreamPatch {
    static final String LABEL = "[Playing] ";
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviocurrentstream/NuvioCurrentStream;";
    static final String LABEL_METHOD = EXTENSION + "->label(Ljava/lang/String;Z)Ljava/lang/String;";
    static final String CARD = NuvioNative.REF_CURRENT_STREAM_CARD_H;

    public static BytecodePatch getNuvioCurrentStreamPatch() {
        return PatchKt.bytecodePatch("NuvioTV - Indicate current stream",
            "Labels the current stream with [Playing], with an enabled-by-default toggle in Santodan-Patches > Streams.", false, builder -> {
                builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME, "NuvioTV", null, ApkFileType.APK,
                    null, null, List.of(new AppTarget(NuvioNative.VERSION, null, false, null, null)), app.morphe.patcher.patch.FormFactor.TV, false));
                builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
                builder.extendWith(() -> NuvioStreamPreloadPatch.extension("nuvio-current-stream"));
                builder.execute(context -> {
                    if (!NuvioNative.PACKAGE_NAME.equals(context.getPackageMetadata().getPackageName()) ||
                        !NuvioNative.VERSION.equals(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Current stream indicator requires NuvioTV 1.1.0-beta.9");
                    MutableClass card = context.mutableClassDefBy(NuvioNative.CURRENT_STREAM_CARD_TYPE);
                    NuvioPlaybackButtonsPatch.validateUiMethod(new MutableClass(context.classDefBy(NuvioNative.SETTINGS_ROWS_TYPE)),
                        NuvioNative.REF_SETTINGS_ROWS_M);
                    hook(card);
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static MutableMethod validate(MutableClass owner) {
        MutableMethod method = NuvioRemainingEpisodesPatch.unique(owner, NuvioNative.CURRENT_STREAM_METHOD, 13);
        if (!method.toString().equals(CARD) || (method.getAccessFlags() & 8) == 0 ||
            method.getImplementation() == null || method.getImplementation().getRegisterCount() != 39 ||
            !method.getImplementation().getTryBlocks().isEmpty() ||
            !NuvioPlaybackButtonsPatch.fingerprint(method).equals(NuvioNative.HASH_CURRENT_STREAM_BODY))
            throw new IllegalStateException("Current stream card changed, ambiguous or already patched");
        return method;
    }

    static void hook(MutableClass owner) {
        MutableMethod method = validate(owner);
        int[] anchor = labelAnchor(method);
        var code = method.getImplementation();
        // Decorate after remember(); derive the title and effective-session registers.
        code.addInstruction(anchor[0], new BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, anchor[1], anchor[2], 0, 0, 0,
            new ImmutableMethodReference(EXTENSION, "label", List.of("Ljava/lang/String;", "Z"), "Ljava/lang/String;")));
        code.addInstruction(anchor[0] + 1, new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, anchor[1]));
    }

    static int[] labelAnchor(MutableMethod method) {
        List<Instruction> body = NuvioRemainingEpisodesPatch.instructions(method);
        int name = NuvioAnchors.reference(body,
            "Lcom/nuvio/tv/domain/model/Stream;->getDisplayNameOrNull()Ljava/lang/String;", "remembered source title");
        int description = NuvioAnchors.reference(body,
            "Lcom/nuvio/tv/domain/model/Stream;->getDisplayDescription()Ljava/lang/String;", "source description");
        int cast = NuvioAnchors.unique(body, i -> i > name && i < description && body.get(i).getOpcode() == Opcode.CHECK_CAST &&
            NuvioPlaybackButtonsPatch.reference(body.get(i)).equals("Ljava/lang/String;"), "remembered title cast");
        int gate = NuvioAnchors.unique(body, i -> i + 3 < name && body.get(i).getOpcode() == Opcode.IF_EQZ &&
            body.get(i + 1).getOpcode() == Opcode.CONST_4 && ((NarrowLiteralInstruction) body.get(i + 1)).getNarrowLiteral() == 0 &&
            body.get(i + 2).getOpcode() == Opcode.GOTO && body.get(i + 3).getOpcode() == Opcode.MOVE &&
            ((OneRegisterInstruction) body.get(i + 1)).getRegisterA() == ((OneRegisterInstruction) body.get(i + 3)).getRegisterA() &&
            NuvioAnchors.branchTarget(body, i) == i + 3 && NuvioAnchors.branchTarget(body, i + 2) == i + 4,
            "effective current-session flag");
        int title = ((OneRegisterInstruction) body.get(cast)).getRegisterA();
        int playing = ((OneRegisterInstruction) body.get(gate + 1)).getRegisterA();
        if (title > 15 || playing > 15 || title == playing) throw new IllegalStateException("Current-stream registers cannot encode invoke-static");
        return new int[]{cast + 1, title, playing};
    }
}
