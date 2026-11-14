import java.util.*;
import java.util.zip.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;

/** Checks native title/draft bindings on stock inputs and bridges/removal on patched output. */
public final class VerifyStockChmatePostingBindings {
    public static void main(String[] args) throws Exception {
        for(String path:args){
            Map<String,ClassDef> classes=new HashMap<>();
            try(var zip=new ZipFile(path)){
                for(var entry:Collections.list(zip.entries()))if(entry.getName().matches("classes[0-9]*\\.dex"))
                    try(var in=new java.io.BufferedInputStream(zip.getInputStream(entry))){
                        for(var cls:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())classes.put(cls.getType(),cls);
                    }
            }
            ClassDef editor=classes.get("Lo/p9ExternalSyntheticLambda6;");
            if(editor==null)editor=classes.get("Ljp/syoboi/a2chMate/feature/resedit/ResEditFragment;");
            if(editor==null)throw new AssertionError("No native editor");
            Method save=null,wrapper=null;
            for(var m:editor.getMethods()){
                if(m.getName().equals("haiagaruStockPostTitle"))wrapper=m;
                if(!m.getName().equals("onPause"))continue;
                for(var instruction:m.getImplementation().getInstructions())
                    if(instruction instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference ref
                        && ref.getDefiningClass().equals(editor.getType()) && ref.getReturnType().equals("V")
                        && ref.getParameterTypes().equals(List.of("Z")))
                        for(var candidate:editor.getMethods())if(candidate.toString().equals(ref.toString()))save=candidate;
            }
            if(save==null)throw new AssertionError("No native draft saving");
            List<FieldReference> fields=new ArrayList<>();boolean found=false;
            for(var instruction:save.getImplementation().getInstructions()){
                if(!(instruction instanceof ReferenceInstruction r))continue;
                if(r.getReference() instanceof FieldReference ref)fields.add(ref);
                if(r.getReference() instanceof MethodReference ref && ref.getDefiningClass().equals("Landroid/widget/EditText;") && ref.getName().equals("getText")){found=true;break;}
            }
            if(!found || fields.size()<2)throw new AssertionError("No draft title read");
            var binding=fields.get(fields.size()-2);var title=fields.get(fields.size()-1);
            if(!binding.getDefiningClass().equals(editor.getType()) || !binding.getType().equals(title.getDefiningClass()))throw new AssertionError("Title binding changed");
            String expected=switch(title.getDefiningClass()){
                case "Lo/j2a;" -> "u";
                case "Lo/noNewExchangesOnConnection;", "Lo/KjvkU;", "Lo/setButtonText;" -> "q";
                default -> null;
            };
            if(expected!=null && !title.getName().equals(expected))throw new AssertionError("Wrong title field: "+title);
            String type=title.getType();
            while(!type.equals("Landroid/widget/EditText;") && classes.containsKey(type))type=classes.get(type).getSuperclass();
            if(!type.equals("Landroid/widget/EditText;"))throw new AssertionError("Title is not an EditText");
            boolean patched=classes.containsKey("Lapp/morphe/extension/chmate/StockChmatePosting;");
            if(patched){
                if(wrapper==null)throw new AssertionError("Missing native title bridge");
                List<String> actual=new ArrayList<>();
                for(var instruction:wrapper.getImplementation().getInstructions())if(instruction instanceof ReferenceInstruction r && r.getReference() instanceof FieldReference f)actual.add(f.toString());
                if(!actual.equals(List.of(binding.toString(),title.toString())))throw new AssertionError("Generated title bridge differs from native save");
                for(String removed:List.of("EdgeCookieReceiver","EdgeCookieTransfer"))if(classes.containsKey("Lapp/morphe/extension/chmate/"+removed+";"))throw new AssertionError("Obsolete cookie receiver retained");
                for(var m:classes.get("Lapp/morphe/extension/chmate/ExternalBoardAuth;").getMethods())if(m.getName().equals("persistTransferredCookies") || m.getName().equals("importTransferredCookies"))throw new AssertionError("Obsolete import bridge retained");
                boolean guarded=false;
                for(var m:classes.get("Lapp/morphe/extension/chmate/Haiagaru;").getMethods())if(m.getName().equals("retargetSelfIntent"))
                    for(var instruction:m.getImplementation().getInstructions())if(instruction instanceof ReferenceInstruction r && r.getReference() instanceof MethodReference ref
                        && ref.getDefiningClass().equals("Lapp/morphe/extension/chmate/StockChmatePosting;") && ref.getName().equals("isHandoff"))guarded=true;
                if(!guarded)throw new AssertionError("Stock handoff would be retargeted to the renamed app");
            }
            System.out.println("PASS "+path+" title="+title+" patched="+patched);
        }
    }
}
