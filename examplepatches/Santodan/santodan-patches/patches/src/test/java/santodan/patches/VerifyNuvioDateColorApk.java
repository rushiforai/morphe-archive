package santodan.patches;

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.Opcode;
import software.santodan.nuvio.NuvioNative;
import java.io.BufferedInputStream;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.ZipFile;

/** Audit reflected custom-color bindings in the delivered beta.13 APK. */
public final class VerifyNuvioDateColorApk {
    public static void main(String[] args) throws Exception {
        Set<String> methods = new HashSet<>(), strings = new HashSet<>(), fields = new HashSet<>(), metadataCalls = new HashSet<>(), layoutCalls = new HashSet<>();
        Set<String> swatchCalls = new HashSet<>(), previewCalls = new HashSet<>(), saveCalls = new HashSet<>();
        boolean rgbMask = false, rgbAnd = false, opacityBound = false;
        try (ZipFile zip = new ZipFile(args[0])) {
            for (var entries = zip.entries(); entries.hasMoreElements();) {
                var entry = entries.nextElement();
                if (!entry.getName().matches("classes\\d*\\.dex")) continue;
                try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                    for (var owner : DexBackedDexFile.fromInputStream(null, input).getClasses()) {
                        for (var field : owner.getFields()) fields.add(field.toString());
                        for (var method : owner.getMethods()) {
                            methods.add(method.toString());
                            if (method.toString().equals(NuvioNative.REF_DATE_COLOR_PALETTE)) {
                                Instruction previous = null;
                                for (var instruction : method.getImplementation().getInstructions()) {
                                    if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference().toString()
                                            .equals(NuvioSettingsMenuPatch.DATE_STYLE + "->bindColorOpacity(Ljava/lang/Object;)V")) {
                                        opacityBound = previous != null && previous.getOpcode() == Opcode.CHECK_CAST &&
                                            ((ReferenceInstruction) previous).getReference().toString().equals("Lg1/o1;") &&
                                            instruction instanceof RegisterRangeInstruction && ((RegisterRangeInstruction) instruction).getRegisterCount() == 1 &&
                                            ((RegisterRangeInstruction) instruction).getStartRegister() == ((OneRegisterInstruction) previous).getRegisterA();
                                    }
                                    previous = instruction;
                                }
                            }
                            if (owner.getType().equals(NuvioNative.LAYOUT_ITEMS_TYPE) && method.getImplementation()!=null)
                                for(var instruction:method.getImplementation().getInstructions())
                                    if(instruction instanceof ReferenceInstruction)layoutCalls.add(((ReferenceInstruction)instruction).getReference().toString());
                            if (method.toString().equals(NuvioNative.REF_DATE_PREVIEW_META_INIT))
                                for (var instruction : method.getImplementation().getInstructions())
                                    if (instruction instanceof ReferenceInstruction)
                                        metadataCalls.add(((ReferenceInstruction) instruction).getReference().toString());
                            if (method.toString().equals(NuvioNative.REF_DATE_COLOR_SWATCH) && method.getImplementation() != null)
                                for (var instruction : method.getImplementation().getInstructions())
                                    if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference() instanceof MethodReference)
                                        swatchCalls.add(((ReferenceInstruction) instruction).getReference().toString());
                            if (method.getImplementation() != null && (method.toString().equals(NuvioNative.REF_DATE_CUSTOM_PREVIEW) ||
                                    method.toString().equals(NuvioNative.REF_DATE_EDITOR_SAVE_LABEL)))
                                for (var instruction : method.getImplementation().getInstructions())
                                    if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference() instanceof MethodReference)
                                        (method.toString().equals(NuvioNative.REF_DATE_CUSTOM_PREVIEW) ? previewCalls : saveCalls)
                                            .add(((ReferenceInstruction) instruction).getReference().toString());
                            if (!owner.getType().equals("Lsoftware/santodan/extension/nuviomenu/NuvioDateLabelStyle;") || method.getImplementation() == null) continue;
                            for (var instruction : method.getImplementation().getInstructions()) {
                                if (instruction instanceof ReferenceInstruction && ((ReferenceInstruction) instruction).getReference() instanceof StringReference)
                                    strings.add(((StringReference) ((ReferenceInstruction) instruction).getReference()).getString());
                                if (method.getName().equals("renderCustomColorDialog")) {
                                    if (instruction instanceof NarrowLiteralInstruction && ((NarrowLiteralInstruction) instruction).getNarrowLiteral() == 0x00ffffff)
                                        rgbMask = true;
                                    if (instruction.getOpcode().name().startsWith("AND_INT")) rgbAnd = true;
                                }
                            }
                        }
                    }
                }
            }
        }
        for (String reference : NuvioSettingsMenuPatch.DATE_COLOR_APIS)
            if (!methods.contains(reference) || !strings.contains(reference))
                throw new AssertionError("Missing delivered custom-color binding: " + reference);
        if (!strings.contains("Custom")) throw new AssertionError("Missing Custom color choice");
        if (!rgbMask || !rgbAnd) throw new AssertionError("Custom editor must receive RGB without the alpha byte");
        for (String reference : Set.of(NuvioSettingsMenuPatch.DATE_STYLE + "->colorSwatchClick(JZZLjava/lang/Object;)Ljava/lang/Object;",
                NuvioSettingsMenuPatch.DATE_STYLE + "->colorSwatchLabel(JLjava/lang/String;)Ljava/lang/String;",
                NuvioSettingsMenuPatch.DATE_STYLE + "->renderLabeledSwatch(JZZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)Z"))
            if (!methods.contains(reference) || !swatchCalls.contains(reference))
                throw new AssertionError("Missing native first-swatch hook: " + reference);
        String preview = NuvioSettingsMenuPatch.DATE_STYLE + "->renderEditorPreview(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)Z";
        String save = NuvioSettingsMenuPatch.DATE_STYLE + "->editorSaveResource(I)I";
        if (!methods.contains(preview) || !previewCalls.contains(preview) || !methods.contains(save) || !saveCalls.contains(save))
            throw new AssertionError("Missing live label preview or scoped Apply button hook");
        if (!strings.containsAll(Set.of("Custom", "Light gray", "Yellow", "Cyan", "Green", "Magenta", "Coral", "Orange", "Light green", "Label preview", "15-Nov")))
            throw new AssertionError("Missing visible color captions or label preview");
        for (String reference : Set.of(NuvioNative.REF_DATE_PREVIEW_CROP))
            if (!fields.contains(reference) || !strings.contains(reference)) throw new AssertionError("Missing native artwork preference/scale binding: " + reference);
        if(layoutCalls.contains(NuvioSettingsMenuPatch.DATE_STYLE + "->bindPreviewLayout(Ljava/lang/Object;)V"))throw new AssertionError("Preview must not bind app layout settings");
        if(!strings.containsAll(Set.of("Switch to Poster", "Switch to Card", "santodan_nuvio_date_label_style:previewCard")))throw new AssertionError("Missing independent preview toggle");
        if (!metadataCalls.contains(NuvioSettingsMenuPatch.DATE_STYLE + "->rememberPreviewMovie(Ljava/lang/Object;)V"))
            throw new AssertionError("Missing native movie artwork sampling hook");
        if (!opacityBound) throw new AssertionError("Missing native picker's live opacity binding");
        System.out.println("PASS: delivered native poster/landscape cover, metadata sampling, caption, label preview and scoped Apply bindings resolve");
    }
}
