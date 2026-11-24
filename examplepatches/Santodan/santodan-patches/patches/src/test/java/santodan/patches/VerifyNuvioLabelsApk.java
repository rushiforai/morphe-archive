package santodan.patches;

import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import software.santodan.nuvio.NuvioNative;
import java.io.*;
import java.nio.file.*;
import java.util.*;
import java.util.zip.ZipFile;

/** Audits delivered activation, native scopes, typed wrappers and reflected editor bindings. */
public final class VerifyNuvioLabelsApk {
    static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
    public static void main(String[] args)throws Exception{
        for(String name:args){audit(Path.of(name));System.out.println("PASS: delivered label editor, ten scoped badges, seven typed wrappers, native input guards and activation: "+name);}
    }
    static void audit(Path file)throws Exception{
        Map<String,ClassDef> classes=new HashMap<>();Map<String,Method> methods=new HashMap<>();Set<String> definitions=new HashSet<>(),strings=new HashSet<>();
        try(var zip=new ZipFile(file.toFile())){for(var entry:Collections.list(zip.entries()))if(entry.getName().matches("classes\\d*\\.dex"))
            try(var in=new BufferedInputStream(zip.getInputStream(entry))){for(var owner:DexBackedDexFile.fromInputStream(null,in).getClasses()){
                check(classes.put(owner.getType(),owner)==null,"Duplicate delivered class");
                for(var field:owner.getFields())definitions.add(field.toString());
                for(var method:owner.getMethods()){methods.put(method.toString(),method);definitions.add(method.toString());if(method.getImplementation()!=null)for(var ins:method.getImplementation().getInstructions())
                    if(ins instanceof ReferenceInstruction && ((ReferenceInstruction)ins).getReference() instanceof StringReference && owner.getType().startsWith("Lsoftware/santodan/extension/nuviomenu/"))strings.add(((StringReference)((ReferenceInstruction)ins).getReference()).getString());}
            }}}
        String ext=NuvioLabelCustomizationPatch.EXT,editor=NuvioLabelCustomizationPatch.EDITOR;
        Method active=methods.get(ext+"->available()Z");check(active!=null,"Label runtime missing");
        Instruction first=active.getImplementation().getInstructions().iterator().next();check(first instanceof NarrowLiteralInstruction&&((NarrowLiteralInstruction)first).getNarrowLiteral()==1,"Label runtime not activated");
        int scopes=0;for(var site:NuvioLabelCustomizationPatch.SITES){Method method=methods.get(site.ref);check(method!=null,"Delivered badge renderer missing");
            List<String> calls=references(method);check(calls.stream().filter(s->s.startsWith(ext+"->"+site.begin+"(")).count()==1,"Missing/duplicate delivered badge entry");
            check(calls.stream().filter(s->s.contains("->santodanLabelText(")).count()==1,"Missing final badge cleanup");scopes++;}
        check(scopes==10,"Changed scope count");int wrappers=0;
        for(var method:methods.values())if(method.getName().startsWith("santodanLabel")){
            wrappers++;for(String ref:references(method))if(ref.startsWith("Lsoftware/santodan/extension/")||ref.contains("->g(")||ref.contains("->b("))check(definitions.contains(ref),"Unresolved typed wrapper target: "+ref);
            if(method.getName().startsWith("santodanLabelText"))check(method.getImplementation().getTryBlocks().size()==1,"Delivered native exception cleanup missing");
        }
        check(wrappers==7,"Unexpected delivered helper count");
        List<String> input=references(methods.get(NuvioLabelCustomizationPatch.INPUT));check(input.stream().filter(s->s.equals(editor+"->textDecoration(Ljava/lang/Object;)Ljava/lang/Object;")).count()==2,"Both native caption-input branches must be guarded");
        for(String ref:List.of(NuvioNative.REF_LABEL_CW_TEXT,NuvioNative.REF_LABEL_BACKGROUND,NuvioNative.REF_LABEL_BORDER,NuvioNative.REF_LABEL_INPUT,NuvioNative.REF_DROPDOWN_B,NuvioNative.REF_LABEL_RGB_PICKER,NuvioNative.REF_LABEL_WIDTH,NuvioNative.REF_LABEL_COLUMN_WEIGHT,NuvioNative.REF_SETTINGS_ROWS_M,NuvioNative.REF_LIBRARY_CONTENT_Z,NuvioNative.REF_INPUT_FOCUS_INIT,NuvioNative.REF_INPUT_BORDER_INIT,NuvioNative.REF_INPUT_FIELD_INIT))check(definitions.contains(ref),"Missing native editor binding: "+ref);
        for(String text:List.of("Copy from another label","What to copy","TEXT","LABEL","ALL","Reset label","Label text","Apply text","Use original text","Editing: Text","Editing: Label","Font opacity","Label opacity"))check(strings.contains(text),"Missing delivered editor action: "+text);
        Method mainEditor=methods.get(editor+"->renderSettings(Ljava/lang/Object;)V");
        boolean unrestricted=false;for(var ins:mainEditor.getImplementation().getInstructions())if(ins instanceof NarrowLiteralInstruction&&((NarrowLiteralInstruction)ins).getNarrowLiteral()==14224)unrestricted=true;
        check(unrestricted,"Editor still defaults to the narrow platform dialog width");
        check(strings.contains(NuvioNative.REF_LABEL_COLUMN_WEIGHT),"Missing weighted scroll viewport below the fixed selectors");
        check(strings.contains(NuvioNative.REF_LABEL_CONFIGURATION),"Editor does not size from the active screen configuration");
        check(strings.contains(NuvioNative.REF_LABEL_RGB_PICKER)&&strings.contains(NuvioNative.REF_LABEL_WIDTH),"Missing delivered scroll panel/picker bindings");
        if(classes.containsKey("Lsoftware/santodan/extension/nuviomerged/NuvioTrackingDialogs;")) {
            Set<String> trackingStrings=new HashSet<>();
            for(var method:classes.get("Lsoftware/santodan/extension/nuviomerged/NuvioTrackingDialogs;").getMethods())if(method.getName().equals("dialog"))for(var ins:method.getImplementation().getInstructions())if(ins instanceof ReferenceInstruction&&((ReferenceInstruction)ins).getReference() instanceof StringReference)trackingStrings.add(((StringReference)((ReferenceInstruction)ins).getReference()).getString());
            check(trackingStrings.contains(NuvioNative.LIBRARY_DIALOG_METHOD)&&!trackingStrings.contains("z"),"Obsolete sync dialog binding in delivered APK");
        }
        check(methods.containsKey(ext+"->applyAdded(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)[Ljava/lang/Object;"),"Missing shared added-label renderer");
        for(String[] badge:new String[][]{{"nuvioremaining/NuvioRemainingEpisodes","remaining_count"},{"nuvioairing/NuvioAiringSeries","date_label"},{"nuviofinale/NuvioFinaleDates","date_label"},{"nuviomovierelease/NuvioMovieReleaseDates","date_label"}}) {
            ClassDef owner=classes.get("Lsoftware/santodan/extension/"+badge[0]+";");if(owner==null)continue;
            Set<String> route=new HashSet<>();for(var m:owner.getMethods())if(m.getImplementation()!=null)for(var ins:m.getImplementation().getInstructions())if(ins instanceof ReferenceInstruction&&((ReferenceInstruction)ins).getReference() instanceof StringReference)route.add(((StringReference)((ReferenceInstruction)ins).getReference()).getString());
            check(route.contains("applyAdded")&&route.contains(badge[1]),"Added badge not connected to shared editor: "+badge[0]);
        }
        // Shared header and post-picker hook order must also survive packaging.
        List<String> colorEditor=references(methods.get(NuvioNative.REF_DATE_CUSTOM_EDITOR));
        int header=colorEditor.indexOf("Lsoftware/santodan/extension/nuviomenu/NuvioDateLabelStyle;->renderEditorTargetRow(Ljava/lang/Object;Ljava/lang/Object;)V");
        int picker=colorEditor.indexOf(NuvioNative.REF_DATE_COLOR_PICKER),controls=colorEditor.indexOf("Lsoftware/santodan/extension/nuviomenu/NuvioDateLabelStyle;->renderEditorControls(Ljava/lang/Object;Ljava/lang/Object;)V");
        check(header>=0&&header<picker&&controls==picker+1,"Packaged selector/slider placement changed");
    }
    static List<String> references(Method method){List<String> refs=new ArrayList<>();if(method!=null&&method.getImplementation()!=null)for(var ins:method.getImplementation().getInstructions())if(ins instanceof ReferenceInstruction&&((ReferenceInstruction)ins).getReference() instanceof MethodReference)refs.add(((ReferenceInstruction)ins).getReference().toString());return refs;}
}
