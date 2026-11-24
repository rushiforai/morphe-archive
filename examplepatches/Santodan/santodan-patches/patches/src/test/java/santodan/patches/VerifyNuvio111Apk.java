package santodan.patches;

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import software.santodan.nuvio.NuvioNative;
import java.io.*;
import java.util.*;
import java.util.zip.ZipFile;

/** Audit the relocated runtime's reflected 1.1.1 bindings in the delivered APK. */
public final class VerifyNuvio111Apk {
    public static void main(String[] args) throws Exception {
        Set<String> definitions = new HashSet<>();
        Map<String, List<String>> calls = new HashMap<>();
        Map<String, Set<String>> strings = new HashMap<>();
        try (var zip = new ZipFile(args[0])) {
            for (var entry : Collections.list(zip.entries())) {
                if (!entry.getName().matches("classes\\d*\\.dex")) continue;
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var owner : DexBackedDexFile.fromInputStream(null, input).getClasses()) {
                        for (var field : owner.getFields()) definitions.add(field.toString());
                        for (var method : owner.getMethods()) {
                            definitions.add(method.toString());
                            if (method.getImplementation() == null) continue;
                            for (var instruction : method.getImplementation().getInstructions()) {
                                if (!(instruction instanceof ReferenceInstruction)) continue;
                                var reference = ((ReferenceInstruction) instruction).getReference();
                                if (reference instanceof com.android.tools.smali.dexlib2.iface.reference.MethodReference)
                                    calls.computeIfAbsent(method.toString(), ignored -> new ArrayList<>()).add(reference.toString());
                                if (reference instanceof StringReference)
                                    strings.computeIfAbsent(owner.getType(), ignored -> new HashSet<>())
                                        .add(((StringReference) reference).getString());
                            }
                        }
                    }
                }
            }
        }
        require(strings, "Lsoftware/santodan/extension/nuviomerged/NuvioTrackingDialogs;", List.of(NuvioNative.LIBRARY_DIALOG_METHOD));
        require(strings, "Lsoftware/santodan/extension/nuviomenu/NuvioDateLabelStyle;",
            List.of(NuvioNative.REF_DATE_PERCENT_ROW, NuvioNative.REF_DATE_ROW_POLICY, NuvioNative.REF_DATE_SCROLL, NuvioNative.REF_DATE_SCROLL_STATE,
                "Label opacity", "Font opacity", "Editing: Label", "Editing: Text", "Label", "Text"));
        if (!definitions.contains(NuvioNative.REF_DATE_PERCENT_ROW))
            throw new AssertionError("Missing native date appearance slider binding");
        String controls = "Lsoftware/santodan/extension/nuviomenu/NuvioDateLabelStyle;->renderEditorControls(Ljava/lang/Object;Ljava/lang/Object;)V";
        List<String> editorCalls = calls.getOrDefault(NuvioNative.REF_DATE_CUSTOM_EDITOR, List.of());
        int picker = editorCalls.indexOf(NuvioNative.REF_DATE_COLOR_PICKER);
        int header = editorCalls.indexOf("Lsoftware/santodan/extension/nuviomenu/NuvioDateLabelStyle;->renderEditorTargetRow(Ljava/lang/Object;Ljava/lang/Object;)V");
        if (header < 0 || header >= picker) throw new AssertionError("Missing delivered top Text/Label button row");
        if (picker < 0 || picker + 1 >= editorCalls.size() || !editorCalls.get(picker + 1).equals(controls) ||
            editorCalls.indexOf(NuvioNative.REF_DATE_CUSTOM_PREVIEW) <= picker + 1)
            throw new AssertionError("Delivered appearance controls must follow the color picker, outside the sibling preview");
        String controller = NuvioNative.PLAYER_CONTROLLER_TYPE + "->";
        Set<String> bindings = new HashSet<>(List.of(
            NuvioNative.REF_CURRENT_STREAM_CARD_H, NuvioNative.REF_METADATA_LIBRARY_IMAGE,
            NuvioNative.REF_ICON_PARTY_D, NuvioNative.REF_ICON_ASPECT_A,
            NuvioNative.REF_ICON_CHAPTERS_C, NuvioNative.REF_ICON_EXTERNAL_A,
            controller + NuvioNative.CONTROLLER_MEDIA_TYPE_FIELD + ":Ljava/lang/String;",
            controller + NuvioNative.CONTROLLER_BINGE_GROUP_FIELD + ":Ljava/lang/String;",
            controller + NuvioNative.CONTROLLER_PRELOAD_TRIGGERED_FIELD + ":Z",
            controller + NuvioNative.CONTROLLER_SESSION_FIELD + ":Lkotlinx/coroutines/flow/StateFlow;",
            NuvioNative.REF_PLAYER_CONTROLLER_T0));
        var icons = List.of(NuvioNative.REF_ICON_MEDIA_P, NuvioNative.REF_ICON_SPEED_M,
            NuvioNative.REF_ICON_EXTERNAL_F, NuvioNative.REF_ICON_PARTY_O);
        bindings.addAll(icons);
        if (!definitions.containsAll(bindings)) {
            bindings.removeAll(definitions);
            throw new AssertionError("Missing delivered native bindings: " + bindings);
        }
        require(strings, "Lsoftware/santodan/extension/nuviobuttons/ButtonsIcons;", icons);
        require(strings, "Lsoftware/santodan/extension/nuviointro/NuvioIntroDb;",
            List.of(NuvioNative.CONTROLLER_SESSION_FIELD, NuvioNative.CONTROLS_JOB_FIELD));
        Set<String> streams = new HashSet<>();
        strings.forEach((owner, values) -> {
            if (owner.startsWith("Lsoftware/santodan/extension/nuviostreams/")) streams.addAll(values);
        });
        if (!streams.containsAll(List.of(NuvioNative.CONTROLLER_MEDIA_TYPE_FIELD, NuvioNative.CONTROLLER_BINGE_GROUP_FIELD)))
            throw new AssertionError("Delivered preload runtime retains stale controller fields");
        System.out.println("PASS: delivered 1.1.1 current-stream, icons, metadata image and controller reflection bindings");
    }
    private static void require(Map<String, Set<String>> strings, String owner, Collection<String> expected) {
        if (!strings.getOrDefault(owner, Set.of()).containsAll(expected))
            throw new AssertionError("Stale/missing delivered runtime bindings: " + owner + " expected " + expected);
    }
}
