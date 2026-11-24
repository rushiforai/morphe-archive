package santodan.patches;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import software.santodan.nuvio.NuvioNative;
import java.util.*;
import java.util.function.Function;
import kotlin.Unit;

/** Exact latest-target badge scopes; ordinary strings, visibility and progress decisions remain native. */
public final class NuvioLabelCustomizationPatch {
    public static final String NAME="NuvioTV - Customize labels";
    static final String EXT="Lsoftware/santodan/extension/nuviomenu/NuvioLabelStyles;";
    static final String EDITOR="Lsoftware/santodan/extension/nuviomenu/NuvioLabelsEditor;";
    static final String TEXT=NuvioNative.REF_DATE_TEXT;
    static final class Site {
        final String ref,hash,background,begin; final int ordinal,texts,parameter;
        Site(String ref,String hash,String background,int ordinal,int texts,String begin,int parameter) {
            this.ref=ref;this.hash=hash;this.background=background;this.ordinal=ordinal;this.texts=texts;this.begin=begin;this.parameter=parameter;
        }
    }
    static final List<Site> SITES=List.of(
        new Site("Lna/w0;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;","ca5ae81eaf692cf7a17a4684e062cca518bb961374df8d71ce55bededa9cf928",NuvioNative.REF_LABEL_BACKGROUND,0,1,"beginCard",-1),
        new Site("Lna/p1;->e(La7/g;Ljava/lang/String;ZLi2/a;FFLk0/f;Lcom/nuvio/tv/domain/model/CardDepthStyle;Ljava/lang/String;Lh3/s0;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JZZFZLkotlin/jvm/functions/Function0;Lg1/n;I)V","161badd9221faeb6d886e565189c16f9f1843852e82ad79dbc47866a3bb68046",NuvioNative.REF_LABEL_BACKGROUND,1,1,"begin",13),
        new Site("Lya/n7;->c(Ljava/lang/String;Lh3/s0;JLg1/n;I)V","48aee91ad84a9fe971ea2cfb11c9cde722fec4cacb9c3e5a312c74fc698aa4b9",NuvioNative.REF_LABEL_BORDER,0,1,"beginMetadata",0),
        new Site("Lya/n7;->a(Ljava/lang/String;Ljava/lang/String;Lh3/s0;JLg1/n;I)V","d7f629ee7d25e2b12684b0b494c4035d4ac9f21006b6b31447144c7f55de11c6",NuvioNative.REF_LABEL_BORDER,0,2,"beginMetadata",0),
        new Site("Lxa/j2;->d(Ljava/lang/String;JLjava/lang/String;JLg1/n;I)V","112bc64b322f36f9ca7fdf30be39b3dafc9483e4d0fda57cd65d9624fd3c413d",NuvioNative.REF_LABEL_BORDER,0,2,"beginMetadata",0),
        new Site("Lna/c5;->b(JLg1/n;I)V","e8140fedc111c54ae76ecc1e6120f2c69b3bb89e0577d2b20a8fa4a5e21542e4",NuvioNative.REF_LABEL_BACKGROUND,0,1,"beginFileSize",-2),
        new Site("Lbb/vk;->S(ILg1/n;Ljava/lang/String;)V","f852b45e69f3b3e8a0fbeab95a3dfde36cebb1df5a74c30e85d6afe6b77e36f4",NuvioNative.REF_LABEL_BACKGROUND,0,1,"begin",2),
        new Site("Lbb/vk;->a(ILg1/n;Ljava/lang/String;)V","c1f917f4fac877f4feda76423ef5bf80596296c144969719ff4b4334e4ad8ae5",NuvioNative.REF_LABEL_BACKGROUND,0,1,"begin",2),
        new Site("Lxa/n0;->c(ILg1/n;Ljava/lang/String;)V","dea1ee498487d29fee3c13af3e706fee0c2012352deec962c3bd0061c6e83f96",NuvioNative.REF_LABEL_BACKGROUND,0,1,"beginMetadata",2),
        new Site("Lbb/xs;->i(Ljava/lang/String;ZLg1/n;I)V","92e208d5bd393560b7ff3aa85aeafa51b87587f13fed3e0eb5fafb453994dace",NuvioNative.REF_LABEL_BACKGROUND,0,1,"begin",0));
    static final List<String> HELPERS=List.of(NuvioNative.REF_LABEL_BACKGROUND,NuvioNative.REF_LABEL_BORDER,
        NuvioNative.REF_LABEL_PADDING,NuvioNative.REF_LABEL_PADDING_ALL,NuvioNative.REF_LABEL_PADDING_DEFAULT,TEXT);
    static final String INPUT="Lgb/u;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;";
    static final String INPUT_HASH="ff35b06ccb51351cc69d482ddc5e091554602a61fbae49528d258179066bd71e";
    private NuvioLabelCustomizationPatch() {}
    private static BytecodePatch patch;
    public static synchronized BytecodePatch getNuvioLabelCustomizationPatch() {
        if(patch!=null)return patch;
        patch=PatchKt.bytecodePatch(NAME,"Customize Nuvio's text badges individually, including New Season, Next Up and New Episode. Edit captions, copy Text/Label/All, and reset one label.",false,builder->{
            builder.compatibleWith(new Compatibility(NuvioNative.PACKAGE_NAME,"NuvioTV",null,ApkFileType.APK,null,null,
                List.of(new AppTarget(NuvioNative.VERSION,null,false,null,null)),FormFactor.TV,false));
            builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
            builder.execute(context->{
                if(!NuvioNative.PACKAGE_NAME.equals(context.getPackageMetadata().getPackageName())||!NuvioNative.VERSION.equals(context.getPackageMetadata().getVersionName()))throw new IllegalStateException("Label customization requires original NuvioTV 1.1.1");
                Function<String,MutableClass> classes=context::mutableClassDefBy;
                validate(classes);validateActivation(classes.apply(EXT));install(classes);activate(classes.apply(EXT));return Unit.INSTANCE;
            });return Unit.INSTANCE;
        });
        return patch;
    }
    static String owner(String ref){return ref.substring(0,ref.indexOf("->"));}
    static MutableMethod method(Function<String,MutableClass> classes,String ref){return classes.apply(owner(ref)).getMethods().stream().filter(m->m.toString().equals(ref)).reduce((a,b)->{throw new IllegalStateException("Ambiguous label method: "+ref);}).orElseThrow(()->new IllegalStateException("Missing label method: "+ref));}
    static List<Instruction> code(MutableMethod method){return NuvioAiringSeriesPatch.instructions(method);}
    static String reference(Instruction instruction){return NuvioPlaybackButtonsPatch.reference(instruction);}
    static MutableMethod undecorated(MutableMethod original){
        MutableMethod copy=new MutableMethod(original);List<Instruction> body=code(copy);
        Set<String> allowed=Set.of(
            "Lsoftware/santodan/extension/nuvioairing/NuvioAiringSeries;->prepareBadge(Ljava/lang/Object;)V",
            "Lsoftware/santodan/extension/nuvioairing/NuvioAiringSeries;->prepareTitle(Ljava/lang/String;)V",
            "Lsoftware/santodan/extension/nuvioairing/NuvioAiringSeries;->renderPreparedBadge(Ljava/lang/Object;)V",
            "Lsoftware/santodan/extension/nuvioremaining/NuvioRemainingEpisodes;->prepareBadge(Ljava/lang/Object;)V",
            "Lsoftware/santodan/extension/nuvioremaining/NuvioRemainingEpisodes;->renderPreparedBadge(Ljava/lang/Object;)V",
            "Lsoftware/santodan/extension/nuviomerged/NuvioMergedProgress;->prepareProviderBadge(Ljava/lang/Object;)V",
            "Lsoftware/santodan/extension/nuviomerged/NuvioMergedProgress;->renderProviderBadge(Ljava/lang/Object;)V");
        for(int i=body.size()-1;i>=0;i--)if(allowed.contains(reference(body.get(i)))){
            if(!(body.get(i) instanceof RegisterRangeInstruction)||((RegisterRangeInstruction)body.get(i)).getRegisterCount()!=1)throw new IllegalStateException("Changed independent card decorator");
            copy.getImplementation().removeInstruction(i);
        }
        return copy;
    }
    static void validate(Function<String,MutableClass> classes){
        for(Site site:SITES){MutableMethod m=method(classes,site.ref);
            if(!NuvioPlaybackButtonsPatch.fingerprint(undecorated(m)).equals(site.hash))throw new IllegalStateException("Label renderer changed or already patched: "+site.ref);
            span(m,site);
        }
        if(!NuvioPlaybackButtonsPatch.fingerprint(method(classes,INPUT)).equals(INPUT_HASH))throw new IllegalStateException("Native label text field changed or already patched");
        if(code(method(classes,INPUT)).stream().filter(i->reference(i).equals(NuvioNative.REF_LABEL_INPUT)).count()!=2)throw new IllegalStateException("Native input branches changed");
        for(String ref:HELPERS){MutableMethod m=method(classes,ref);if((m.getAccessFlags()&8)==0)throw new IllegalStateException("Non-static badge helper: "+ref);
            if(classes.apply(owner(ref)).getMethods().stream().anyMatch(candidate->candidate.getName().startsWith("santodanLabel")))throw new IllegalStateException("Badge helper already installed");}
        boolean field=classes.apply("Lna/w0;").getFields().stream().anyMatch(f->f.toString().equals(NuvioNative.REF_LABEL_CW_TEXT));
        if(!field)throw new IllegalStateException("Missing native status-label field");
        if(classes.apply(owner(NuvioNative.REF_LABEL_CONFIGURATION)).getFields().stream().noneMatch(f->f.toString().equals(NuvioNative.REF_LABEL_CONFIGURATION)))throw new IllegalStateException("Missing active-screen configuration local");
        for(String ref:List.of(NuvioNative.REF_LABEL_RGB_PICKER,NuvioNative.REF_LABEL_WIDTH,NuvioNative.REF_LABEL_COLUMN_WEIGHT))NuvioSettingsMenuPatch.validateDateColorApi(classes.apply(owner(ref)),ref);
        for(String ref:NuvioIntroDbPatch.UI)NuvioIntroDbPatch.require(classes.apply(owner(ref)),ref);
        NuvioIntroDbPatch.validateInputFocus(classes.apply(NuvioNative.INPUT_FOCUS_TYPE),Integer.parseInt(NuvioNative.INPUT_FOCUS_BRANCH));
    }
    static int[] span(MutableMethod method,Site site){
        List<Instruction> body=code(method);List<Integer> backgrounds=new ArrayList<>();
        for(int i=0;i<body.size();i++)if(reference(body.get(i)).equals(site.background))backgrounds.add(i);
        if(backgrounds.size()<=site.ordinal)throw new IllegalStateException("Missing label background: "+site.ref);
        int start=backgrounds.get(site.ordinal),end=-1,count=0;
        for(int i=start;i<body.size();i++)if(reference(body.get(i)).equals(TEXT)&&++count==site.texts){end=i;break;}
        if(end<0)throw new IllegalStateException("Missing label text: "+site.ref);
        return new int[]{start,end};
    }
    static void install(Function<String,MutableClass> classes){
        for(String ref:HELPERS)addWrapper(classes.apply(owner(ref)),method(classes,ref),false);
        addWrapper(classes.apply(owner(TEXT)),method(classes,TEXT),true);
        for(Site site:SITES){MutableMethod m=method(classes,site.ref);int[] span=span(m,site);List<Instruction> body=code(m);
            for(int i=span[0];i<=span[1];i++){
                String ref=reference(body.get(i));if(!HELPERS.contains(ref))continue;
                MethodReference original=(MethodReference)((ReferenceInstruction)body.get(i)).getReference();
                var replacement=new ImmutableMethodReference(original.getDefiningClass(),wrapperName(ref,ref.equals(TEXT)&&i!=span[1]),original.getParameterTypes(),original.getReturnType());
                if(body.get(i) instanceof RegisterRangeInstruction){var call=(RegisterRangeInstruction)body.get(i);m.getImplementation().replaceInstruction(i,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,call.getStartRegister(),call.getRegisterCount(),replacement));}
                else {var call=(FiveRegisterInstruction)body.get(i);m.getImplementation().replaceInstruction(i,new BuilderInstruction35c(Opcode.INVOKE_STATIC,call.getRegisterCount(),call.getRegisterC(),call.getRegisterD(),call.getRegisterE(),call.getRegisterF(),call.getRegisterG(),replacement));}
            }
            if(site.parameter==-2)m.getImplementation().addInstruction(span[0],new BuilderInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,ext(site.begin,List.of(),"V")));
            else {int register=site.parameter==-1?NuvioRemainingEpisodesPatch.parameterStart(m):NuvioAnchors.parameter(m,site.parameter);
                m.getImplementation().addInstruction(span[0],new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,register,1,ext(site.begin,List.of(site.parameter==-1?"Ljava/lang/Object;":"Ljava/lang/String;"),"V")));}
        }
        MutableMethod input=method(classes,INPUT);List<Instruction> body=code(input);
        for(int i=body.size()-1;i>=0;i--)if(reference(body.get(i)).equals(NuvioNative.REF_LABEL_INPUT)){
            var call=(RegisterRangeInstruction)body.get(i);int decoration=call.getStartRegister()+15;
            input.getImplementation().addInstruction(i,new BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,decoration,1,new ImmutableMethodReference(EDITOR,"textDecoration",List.of("Ljava/lang/Object;"),"Ljava/lang/Object;")));
            input.getImplementation().addInstruction(i+1,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,decoration));
            input.getImplementation().addInstruction(i+2,new BuilderInstruction21c(Opcode.CHECK_CAST,decoration,new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("Lkotlin/jvm/functions/Function3;")));
        }
    }
    static void validateActivation(MutableClass owner){
        MutableMethod method=owner.getMethods().stream().filter(m->m.getName().equals("available")&&m.getParameterTypes().isEmpty()).findFirst().orElseThrow();
        List<Instruction> body=code(method);
        if(body.size()!=2||body.get(0).getOpcode()!=Opcode.CONST_4||((NarrowLiteralInstruction)body.get(0)).getNarrowLiteral()!=0)throw new IllegalStateException("Label runtime already activated or changed");
    }
    static void activate(MutableClass owner){
        validateActivation(owner);
        MutableMethod method=owner.getMethods().stream().filter(m->m.getName().equals("available")&&m.getParameterTypes().isEmpty()).findFirst().orElseThrow();
        List<Instruction> body=code(method);
        if(body.size()!=2||body.get(0).getOpcode()!=Opcode.CONST_4||((NarrowLiteralInstruction)body.get(0)).getNarrowLiteral()!=0)throw new IllegalStateException("Label runtime already activated or changed");
        method.getImplementation().replaceInstruction(0,new BuilderInstruction11n(Opcode.CONST_4,((OneRegisterInstruction)body.get(0)).getRegisterA(),1));
    }
    static ImmutableMethodReference ext(String name,List<String> args,String result){return new ImmutableMethodReference(EXT,name,args,result);}
    static String wrapperName(String ref,boolean part){
        if(ref.equals(TEXT))return part?"santodanLabelTextPart":"santodanLabelText";
        if(ref.equals(NuvioNative.REF_LABEL_BACKGROUND))return "santodanLabelBackground";
        if(ref.equals(NuvioNative.REF_LABEL_BORDER))return "santodanLabelBorder";
        if(ref.equals(NuvioNative.REF_LABEL_PADDING))return "santodanLabelPadding";
        if(ref.equals(NuvioNative.REF_LABEL_PADDING_ALL))return "santodanLabelPaddingAll";
        return "santodanLabelPaddingDefault";
    }
    static void addWrapper(MutableClass owner,MutableMethod original,boolean part){
        String ref=original.toString(),name=wrapperName(ref,part);List<Instruction> ins=new ArrayList<>();List<ImmutableTryBlock> tries=new ArrayList<>();int registers;
        if(ref.equals(TEXT)){
            registers=25;
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,2,1,ext("text",List.of("Ljava/lang/String;"),"Ljava/lang/String;")));
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,4,2,ext("foreground",List.of("J"),"J")));
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE,4));
            ins.add(new ImmutableInstruction22x(Opcode.MOVE_OBJECT_FROM16,0,20));
            ins.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC,3,6,7,0,0,0,ext("fontSize",List.of("J","Ljava/lang/Object;"),"J")));
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE,6));
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,24,1,ext("defaults",List.of("I"),"I")));
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT,24));
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,21,1,ext("subscribe",List.of("Ljava/lang/Object;"),"V")));
            int start=units(ins);ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,2,23,new ImmutableMethodReference(original.getDefiningClass(),original.getName(),original.getParameterTypes(),original.getReturnType())));
            if(!part)ins.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,ext("end",List.of(),"V")));
            ins.add(new ImmutableInstruction10x(Opcode.RETURN_VOID));int handler=units(ins);
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_EXCEPTION,0));ins.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,ext("end",List.of(),"V")));ins.add(new ImmutableInstruction11x(Opcode.THROW,0));
            tries.add(new ImmutableTryBlock(start,3,List.of(new ImmutableExceptionHandler(null,handler))));
        } else if(ref.equals(NuvioNative.REF_LABEL_BACKGROUND)){
            registers=6;
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,2,1,ext("modifier",List.of("Ljava/lang/Object;"),"Ljava/lang/Object;")));
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));ins.add(new ImmutableInstruction21c(Opcode.CHECK_CAST,2,new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("Lw1/q;")));
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,3,2,ext("background",List.of("J"),"J")));ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE,3));
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,2,4,new ImmutableMethodReference(original.getDefiningClass(),original.getName(),original.getParameterTypes(),original.getReturnType())));
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,0));ins.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT,0));
        } else if(ref.equals(NuvioNative.REF_LABEL_BORDER)){
            registers=6;
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,2,1,ext("modifier",List.of("Ljava/lang/Object;"),"Ljava/lang/Object;")));
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));ins.add(new ImmutableInstruction21c(Opcode.CHECK_CAST,2,new com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference("Lw1/q;")));
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,2,4,new ImmutableMethodReference(original.getDefiningClass(),original.getName(),original.getParameterTypes(),original.getReturnType())));ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,2));
            ins.add(new ImmutableInstruction21s(Opcode.CONST_WIDE_16,0,0));ins.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC,2,0,1,0,0,0,ext("background",List.of("J"),"J")));ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE,0));
            ins.add(new ImmutableInstruction35c(Opcode.INVOKE_STATIC,4,2,0,1,5,0,new ImmutableMethodReference("Lx/m;","g",List.of("Lw1/q;","J","Ld2/y0;"),"Lw1/q;")));ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,0));ins.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT,0));
        } else {
            int words=original.getParameterTypes().size();registers=words;
            for(int r=1;r<Math.min(3,words);r++){
                ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,r,1,ext("padding",List.of("F"),"F")));ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT,r));
            }
            ins.add(new ImmutableInstruction3rc(Opcode.INVOKE_STATIC_RANGE,0,words,new ImmutableMethodReference(original.getDefiningClass(),original.getName(),original.getParameterTypes(),original.getReturnType())));
            ins.add(new ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT,0));ins.add(new ImmutableInstruction11x(Opcode.RETURN_OBJECT,0));
        }
        owner.getMethods().add(new MutableMethod(new ImmutableMethod(owner.getType(),name,original.getParameters(),original.getReturnType(),0x1009,Set.of(),Set.of(),
            new ImmutableMethodImplementation(registers,ins,tries,List.of()))));
    }
    private static int units(List<Instruction> instructions){return instructions.stream().mapToInt(Instruction::getCodeUnits).sum();}
}
