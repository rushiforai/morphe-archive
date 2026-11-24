package santodan.patches;

import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.ImmutableDexFile;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x;
import software.santodan.extension.nuviomenu.*;
import software.santodan.nuvio.NuvioNative;
import java.nio.file.*;
import java.io.*;
import java.util.*;
import java.util.function.Function;
import java.util.zip.ZipFile;

/** Real-original badge scopes, independently selectable decorators and native-helper round trips. */
public final class VerifyNuvioLabelCustomization {
    static void check(boolean condition,String message){if(!condition)throw new AssertionError(message);}
    static void rejected(Runnable operation){boolean failed=false;try{operation.run();}catch(IllegalStateException expected){failed=true;}check(failed,"Changed/duplicate label layout accepted");}
    static Map<String,ClassDef> originals=new HashMap<>();
    static Function<String,MutableClass> classes(Map<String,MutableClass> changed){return type->changed.computeIfAbsent(type,t->new MutableClass(Objects.requireNonNull(originals.get(t),t)));}
    public static void main(String[] args)throws Exception{
        core();
        try(var zip=new ZipFile(args[0])){for(var entry:Collections.list(zip.entries()))if(entry.getName().matches("classes\\d*\\.dex"))
            try(var input=new BufferedInputStream(zip.getInputStream(entry))){for(var owner:DexBackedDexFile.fromInputStream(null,input).getClasses())originals.put(owner.getType(),owner);}}
        for(boolean decoratedFirst:new boolean[]{false,true}){
            Map<String,MutableClass> changed=new LinkedHashMap<>();Function<String,MutableClass> classes=classes(changed);
            if(decoratedFirst)decorate(classes);
            NuvioLabelCustomizationPatch.validate(classes);
            Map<String,Integer> registers=new HashMap<>();for(var site:NuvioLabelCustomizationPatch.SITES)registers.put(site.ref,NuvioLabelCustomizationPatch.method(classes,site.ref).getImplementation().getRegisterCount());
            NuvioLabelCustomizationPatch.install(classes);
            if(!decoratedFirst)decorate(classes);
            for(var site:NuvioLabelCustomizationPatch.SITES){var method=NuvioLabelCustomizationPatch.method(classes,site.ref);var body=NuvioLabelCustomizationPatch.code(method);
                check(method.getImplementation().getRegisterCount()==registers.get(site.ref),"Existing parameter registers changed");
                check(body.stream().filter(i->NuvioLabelCustomizationPatch.reference(i).equals(NuvioLabelCustomizationPatch.EXT+"->"+site.begin+"("+(site.parameter==-2?"":site.parameter==-1?"Ljava/lang/Object;":"Ljava/lang/String;")+")V")).count()==1,"Badge scope missing/duplicated: "+site.ref);
                check(body.stream().anyMatch(i->NuvioLabelCustomizationPatch.reference(i).contains("->santodanLabelText(")),"No final badge-text scope cleanup");
            }
            rejected(()->NuvioLabelCustomizationPatch.validate(classes));
            var text=NuvioLabelCustomizationPatch.method(classes,NuvioLabelCustomizationPatch.TEXT);
            int words=text.getParameterTypes().stream().mapToInt(t->t.equals("J")||t.equals("D")?2:1).sum();check(words==23,"Native text ABI changed");
            for(var owner:changed.values())for(var method:owner.getMethods())if(method.getName().startsWith("santodanLabelText")){
                check(method.getParameterTypes().equals(text.getParameterTypes()),"Text wrapper changed the native ABI");
                check(method.getImplementation().getTryBlocks().size()==1,"Native exceptions must clear label scope");
                check(method.getImplementation().getTryBlocks().get(0).getExceptionHandlers().get(0).getExceptionType()==null,"Scope cleanup is not catch-all");
            }
            Path output=Path.of(args[1],"labels-native-"+decoratedFirst+".dex");Files.createDirectories(output.getParent());
            DexPool.writeTo(output.toString(),new ImmutableDexFile(Opcodes.getDefault(),changed.values()));
            int wrappers=0;try(var input=new BufferedInputStream(Files.newInputStream(output))){for(var owner:DexBackedDexFile.fromInputStream(null,input).getClasses())for(var method:owner.getMethods())if(method.getName().startsWith("santodanLabel"))wrappers++;}
            check(wrappers==7,"Unexpected typed native wrappers after DEX roundtrip: "+wrappers);
            System.out.println("PASS: original 1.1.1 badge scopes, native wrapper ABI and cleanup, DEX roundtrip, decorators-first="+decoratedFirst);
        }
        var first=NuvioLabelCustomizationPatch.SITES.get(0);
        Map<String,MutableClass> missing=new LinkedHashMap<>();var missingClasses=classes(missing);missingClasses.apply(NuvioLabelCustomizationPatch.owner(first.ref)).getMethods().removeIf(m->m.toString().equals(first.ref));
        rejected(()->NuvioLabelCustomizationPatch.validate(missingClasses));
        Map<String,MutableClass> altered=new LinkedHashMap<>();var alteredClasses=classes(altered);var method=NuvioLabelCustomizationPatch.method(alteredClasses,first.ref);
        method.getImplementation().replaceInstruction(0,new BuilderInstruction10x(Opcode.NOP));
        rejected(()->NuvioLabelCustomizationPatch.validate(alteredClasses));
        System.out.println("PASS: missing/changed/duplicate native layouts are rejected");
    }
    static void decorate(Function<String,MutableClass> classes){
        for(String[] value:new String[][]{
            {"Lsoftware/santodan/extension/nuvioairing/NuvioAiringSeries;","prepareBadge","renderPreparedBadge"},
            {"Lsoftware/santodan/extension/nuvioremaining/NuvioRemainingEpisodes;","prepareBadge","renderPreparedBadge"},
            {"Lsoftware/santodan/extension/nuviomerged/NuvioMergedProgress;","prepareProviderBadge","renderProviderBadge"}})
            NuvioRemainingEpisodesPatch.hookCard(classes.apply(NuvioNative.HOME_CARD_TYPE),NuvioNative.PROVIDER_BADGE_TYPE,value[0],value[1],value[2]);
        NuvioAiringSeriesPatch.hookWide(classes.apply(NuvioNative.WIDE_CARD_TYPE));
    }
    static void core() throws Exception {
        var source=new LabelCustomization.Draft("new_season",Map.of("text","S+","background_color",0x8012345600000000L,"foreground_color",0xffabcdef00000000L,"size_percent",160,"font_size_percent",80,"position",8),0L,0L,"New Season");
        for(var mode:LabelCustomization.Copy.values()){
            var destination=new LabelCustomization.Draft("new_episode",Map.of("text","Episode","background_color",0xff55667700000000L,"size_percent",90),0L,0xffffffff00000000L,"New Episode");
            destination.copyFrom(source,mode);
            check(destination.dirty&&destination.id.equals("new_episode"),"Copy changed label identity or failed to dirty the draft");
            check(destination.caption().equals(mode==LabelCustomization.Copy.LABEL?"Episode":"S+"),"Copy scope did not preserve/copy the caption correctly");
            check(destination.color(true)==(mode==LabelCustomization.Copy.TEXT?0xff55667700000000L:0x8012345600000000L),"Copy text changed label background");
            check(destination.size(true)==(mode==LabelCustomization.Copy.TEXT?90:160),"Copy did not respect background size scope");
            check(destination.size(false)==(mode==LabelCustomization.Copy.LABEL?100:80),"Copy did not respect text size scope");
            destination.reset();check(destination.values().isEmpty()&&destination.caption().equals("New Episode"),"Reset did not restore the native label");
            check(source.caption().equals("S+")&&source.color(true)==0x8012345600000000L,"Copy/reset mutated source label");
        }
        var moving=new LabelCustomization.Draft("time_left",Map.of(),0L,0L,"12 min left");
        var copied=new LabelCustomization.Draft("file_size",Map.of(),0L,0L,"1 GB");copied.copyFrom(moving,LabelCustomization.Copy.TEXT);
        check(copied.textOverride().equals("{value}")&&copied.caption().equals("1 GB"),"Copy froze a dynamic value");
        var sparse=new LabelCustomization.Draft("next_up",Map.of(),0xff12345600000000L,0xffffffff00000000L,"Next Up");
        sparse.set("font_size_percent",70);check(sparse.values().size()==1&&!sparse.has("background_color"),"Text-only editing replaced native background defaults");
        sparse.set("text","  Continue {value}  ");check(sparse.caption().equals("Continue Next Up"),"Native placeholder handling changed");
        sparse.set("text","");check(sparse.caption().equals("Next Up")&&!sparse.has("text"),"Empty text must restore native translation");
        for(Object invalid:new Object[]{40,201,75,"100"}){boolean failed=false;try{sparse.set("font_size_percent",invalid);}catch(IllegalArgumentException expected){failed=true;}check(failed,"Invalid size accepted");}
        boolean failed=false;try{sparse.set("text","broken\ncaption");}catch(IllegalArgumentException expected){failed=true;}check(failed,"Multiline caption accepted");
        var invalid=new LabelCustomization.Draft("next_up",Map.of("size_percent",999,"text",1),0L,0L,"Next Up");check(invalid.values().isEmpty(),"Malformed preferences override native values");
        String backup=PatchSettingsBackup.encode(Map.of(LabelCustomization.SCOPE,Map.of(
            "enabled",true,LabelCustomization.key("new_season","text"),"S+",LabelCustomization.key("new_season","background_color"),0x8012345600000000L)));
        var restored=PatchSettingsBackup.decode(backup).get(LabelCustomization.SCOPE);
        check(restored.get(LabelCustomization.key("new_season","text")).equals("S+")&&restored.get(LabelCustomization.key("new_season","background_color")).equals(0x8012345600000000L),"Label settings did not survive exact backup roundtrip");
        System.out.println("PASS: independent label drafts, Text/Label/All copying, per-label reset, sparse overrides and text validation");
    }
}
