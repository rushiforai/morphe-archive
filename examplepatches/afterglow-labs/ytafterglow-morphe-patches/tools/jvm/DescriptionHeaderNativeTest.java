import java.io.File;
import java.nio.file.*;
import java.util.*;
import java.util.regex.*;
import app.morphe.patcher.util.smali.InlineSmaliCompiler;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;

public final class DescriptionHeaderNativeTest {
    static int checks;
    static final String ROOT="Lapp/afterglow/extension/menus/", SOURCE=ROOT+"DescriptionHeaderSource;";
    static final String LOADING="Lcom/google/android/libraries/youtube/rendering/ui/widget/loadingframe/LoadingFrameLayout;";
    static final String ROUTES="Lapp/morphe/extension/youtube/patches/utils/requests/ChannelIdRoutes;";
    static final String ROUTE="Lapp/morphe/extension/shared/requests/Route$CompiledRoute;";
    static void check(boolean ok,String label){checks++;if(!ok)throw new AssertionError(label);}
    static List<Instruction> code(Method method){List<Instruction> c=new ArrayList<>();method.getImplementation().getInstructions().forEach(c::add);return c;}
    static List<Instruction> nativeHeaderCode(Method method){return code(method).stream().filter(i->!ref(i).startsWith(ROOT)).toList();}
    static Method method(ClassDef type,String name){List<Method> out=new ArrayList<>();for(Method m:type.getMethods())if(m.getName().equals(name))out.add(m);check(out.size()==1,"unique "+type.getType()+name);return out.get(0);}
    static String ref(Instruction instruction){return instruction instanceof ReferenceInstruction r?r.getReference().toString():"";}
    static boolean has(Method m,String target){return code(m).stream().anyMatch(i->ref(i).equals(target));}
    static String block(String text,String expression){Matcher matcher=Pattern.compile(expression,Pattern.DOTALL).matcher(text);check(matcher.find(),"actual production body "+expression);return matcher.group(1);}
    static String expand(String body,String type,String owner,String root,String rootType){return body.replace("$type",type).replace("$ownerField",owner).replace("$rootField",root).replace("$rootType",rootType).replace("$SOURCE",SOURCE).replace("$ROUTES",ROUTES).replace("$ROUTE",ROUTE);}
    public static void main(String[] args)throws Exception{
        var apk=DexFileFactory.loadDexContainer(new File(args[0]),Opcodes.getDefault());
        Set<String> wanted=Set.of("Lakiz;","Lakjr;","Lakhj;","Lakhh;","Lajoz;","Lalfm;","Lastx;","Lwuv;","Lhiy;","Lhtw;",LOADING,ROOT+"LongPressCaptureTools;",ROUTES);
        Map<String,ClassDef> classes=new HashMap<>();
        for(String entry:apk.getDexEntryNames())for(ClassDef type:apk.getEntry(entry).getDexFile().getClasses())if(wanted.contains(type.getType()))classes.put(type.getType(),type);
        check(classes.size()==wanted.size(),"all exact native and pinned runtime classes present");
        for(String name:List.of("Lakiz;","Lakjr;")){
            ClassDef type=classes.get(name);check(type.getInterfaces().contains("Lakif;"),"native header interface");
            var bind=method(type,"r");check(bind.getParameterTypes().equals(List.of("Lakhj;")),"current panel owner setter signature");
            check(nativeHeaderCode(bind).size()==2&&bind.getImplementation().getRegisterCount()==2,"owner setter preserves p0 through return");
        }
        var modern=method(classes.get("Lakiz;"),"b");var modernCode=nativeHeaderCode(modern);
        check(modern.getImplementation().getRegisterCount()==1&&modernCode.size()==3,"modern p0 live only before native root read");
        check(ref(modernCode.get(0)).equals("Lakiz;->t()V")&&ref(modernCode.get(1)).equals("Lakiz;->k:Landroid/view/ViewGroup;"),"exact modern insertion boundary");
        check(has(method(classes.get("Lakiz;"),"t"),"Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;"),"native full header layout inflater");
        var legacy=method(classes.get("Lakjr;"),"c");var legacyCode=nativeHeaderCode(legacy);int at=-1;
        for(int i=0;i<legacyCode.size();i++)if(ref(legacyCode.get(i)).equals("Lakjr;->M(Lbfgy;)V"))at=i+1;
        check(at>=0&&ref(legacyCode.get(at)).equals("Lakjr;->F:Landroid/widget/LinearLayout;"),"legacy completed header insertion");
        int receiver=legacy.getImplementation().getRegisterCount()-2;
        for(int i=0;i<at;i++)if(legacyCode.get(i).getOpcode().setsRegister())check(((OneRegisterInstruction)legacyCode.get(i)).getRegisterA()!=receiver,"native legacy p0 not overwritten");
        check(has(method(classes.get("Lakhj;"),"s"),"Lakhh;->M()Ljava/lang/String;")&&has(method(classes.get("Lakhh;"),"M"),"Lajoz;->bJ(Lbfgs;)Ljava/lang/String;"),"renderer gets semantic native panel id");
        check(has(method(classes.get("Lakhj;"),"nD"),"Lakif;->r(Lakhj;)V"),"shown header gets its actual current owner");
        var inflate=method(classes.get("Lakhj;"),"aB");int store=-1;var inflateCode=code(inflate);
        for(int i=0;i<inflateCode.size();i++)if(inflateCode.get(i).getOpcode()==Opcode.IPUT_OBJECT&&ref(inflateCode.get(i)).equals("Lakhj;->d:"+LOADING))store=i;
        check(store>=0,"actual native returned panel LoadingFrameLayout has an assignment");
        check("Landroid/widget/FrameLayout;".equals(classes.get(LOADING).getSuperclass()),"native returned panel root really is a FrameLayout");
        check(has(method(classes.get("Lakhj;"),"nx"),"Lakhj;->d:"+LOADING),"native controller returns same exact d root as its panel view");
        check(inflateCode.subList(store+1,inflateCode.size()).stream().anyMatch(i->i instanceof WideLiteralInstruction literal&&literal.getWideLiteral()==0x7f0e0197L),"panel root receives named constraint_default_engagement_panel layout");
        check(has(inflate,"Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;"),"native panel layout inflated into controller root");
        int panelReceiver=inflate.getImplementation().getRegisterCount()-1;
        for(int i=0;i<=store;i++)if(inflateCode.get(i).getOpcode().setsRegister())check(((OneRegisterInstruction)inflateCode.get(i)).getRegisterA()!=panelReceiver,"panel getter insertion preserves p0");
        check(has(method(classes.get("Lakhj;"),"l"),"Lakhh;->l(Lbfgs;Lbhmm;Lautw;)V"),"content model update delegates actual model assignment");
        var rootBind=method(classes.get("Lwuv;"),"b");check(rootBind.getImplementation().getRegisterCount()==3,"exact root-binding register count");
        check(code(rootBind).stream().anyMatch(i->i.getOpcode()==Opcode.IPUT_OBJECT&&ref(i).equals("Lwuv;->A:Ljava/lang/ref/WeakReference;")&&((OneRegisterInstruction)i).getRegisterA()==0),"current native root token is v0");
        check(has(method(classes.get(ROOT+"LongPressCaptureTools;"),"afterglow_onLithoCapture"),ROOT+"LongPressCaptureTools;->onText(Ljava/lang/Object;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;"),"shared fresh and cached observer exposes unmodified context");
        var mount=method(classes.get("Lhiy;"),"w");check(mount.getParameterTypes().equals(List.of("Lhtw;","Lhfn;","Lhfs;","Lbxhu;","Ljava/lang/Object;"))&&mount.getImplementation().getRegisterCount()==13,"native binding receives exact item/model/content");
        var mountCode=code(mount);int bound=-1;
        for(int i=0;i<mountCode.size();i++)if(mountCode.get(i).getOpcode()==Opcode.IPUT_BOOLEAN&&ref(mountCode.get(i)).equals("Lhtw;->c:Z"))bound=i;
        check(bound>=0&&mountCode.get(bound+1).getOpcode()==Opcode.RETURN_VOID,"single successful native bound-item return");
        for(int i=0;i<=bound;i++)if(mountCode.get(i).getOpcode().setsRegister())check(!Set.of(8,9,12).contains(((OneRegisterInstruction)mountCode.get(i)).getRegisterA()),"actual bind preserves item/model/content arguments");
        check(has(mount,"Lhfn;->J(Lhfs;Ljava/lang/Object;Lhhw;)V"),"mount observer follows actual model bind");
        var unmount=method(classes.get("Lhiy;"),"r");check(unmount.getParameterTypes().equals(List.of("Lhtw;","Lhfn;","Ljava/lang/Object;"))&&unmount.getImplementation().getRegisterCount()==10,"native unbind exposes exact old item and model at entry");
        var updateMount=method(classes.get("Lhiy;"),"m");check(has(updateMount,"Lhiy;->r(Lhtw;Lhfn;Ljava/lang/Object;)V")&&has(updateMount,"Lhiy;->w(Lhtw;Lhfn;Lhfs;Lbxhu;Ljava/lang/Object;)V"),"same-item update uses both native lifecycle callbacks");
        boolean exactHost=false;for(Field f:classes.get("Lhtw;").getFields())if(f.getName().equals("b")&&f.getType().equals("Lhtu;")&&AccessFlags.PUBLIC.isSet(f.getAccessFlags()))exactHost=true;
        check(exactHost,"mount item exposes actual native ViewGroup host");
        check(has(method(classes.get("Lalfm;"),"M"),"Lbhah;->c:Ljava/lang/String;"),"native video id field");
        check(has(method(classes.get("Lalfm;"),"L"),"Lbhah;->d:Ljava/lang/String;"),"native full title field");
        var title=method(classes.get("Lastx;"),"setChannelInformation");
        check(title.getParameterTypes().equals(List.of("Lalfi;"))&&has(title,"Lalfi;->L()Ljava/lang/String;"),"existing current response observer");
        ClassDef routes=classes.get(ROUTES);
        check(routes.getFields().iterator().hasNext(),"pinned transport fields");
        boolean route=false,body=false,connection=false;
        for(Field field:routes.getFields())if(field.getName().equals("GET_CHANNEL_ID"))route=field.getType().equals(ROUTE)&&AccessFlags.PUBLIC.isSet(field.getAccessFlags());
        for(Method m:routes.getMethods()){
            if(m.getName().equals("createBody")&&m.getParameterTypes().equals(List.of("Ljava/lang/String;")))body=AccessFlags.PUBLIC.isSet(m.getAccessFlags())&&m.getReturnType().equals("[B");
            if(m.getName().equals("getConnection"))connection=AccessFlags.PUBLIC.isSet(m.getAccessFlags())&&m.getParameterTypes().equals(List.of(ROUTE))&&m.getReturnType().equals("Ljava/net/HttpURLConnection;");
        }
        check(route&&body&&connection,"exact public metadata transport contract");
        String source=Files.readString(Path.of(args[1]));List<ClassDef> emitted=new ArrayList<>();
        for(String[] row:new String[][]{{"Lakiz;","d","k","Landroid/view/ViewGroup;"},{"Lakjr;","m","F","Landroid/widget/LinearLayout;"}}){
            List<Method> methods=new ArrayList<>();
            for(String[] spec:new String[][]{{"afterglow_descriptionRoot","Landroid/view/View;","2"},{"afterglow_descriptionPanel","Ljava/lang/Object;","3"},{"afterglow_descriptionPanelId","Ljava/lang/String;","2"}}){
                String text=block(source,"header\\.addMethod\\(\""+spec[0]+"\", \"[^\"]+\", \\d+, \"\"\"(.*?)\"\"\"");
                var instructions=InlineSmaliCompiler.Companion.compile(expand(text,row[0],row[1],row[2],row[3]),"",Integer.parseInt(spec[2]),false);
                check(!instructions.isEmpty(),"actual native bridge parses "+spec[0]);
                methods.add(new ImmutableMethod(row[0],spec[0],List.of(),spec[1],AccessFlags.PUBLIC.getValue()|AccessFlags.FINAL.getValue(),null,null,
                        new ImmutableMethodImplementation(Integer.parseInt(spec[2]),instructions,List.of(),null)));
                if(spec[0].equals("afterglow_descriptionPanel"))check(instructions.stream().anyMatch(i->i.getOpcode()==Opcode.IF_NE)&&instructions.stream().anyMatch(i->ref(i).equals("Lakhj;->g:Lakif;")),"owner reuse checks exact header identity");
            }
            emitted.add(new ImmutableClassDef(row[0],AccessFlags.PUBLIC.getValue(),"Ljava/lang/Object;",List.of(),null,null,List.of(),methods));
        }
        String observe=block(source,"MutableMethodImplementation\\(3\\)\\)\\.toMutable\\(\\)\\.apply \\{ addInstructions\\(0, \"\"\"(.*?)\"\"\"");
        var observer=InlineSmaliCompiler.Companion.compile(expand(observe,"","","",""),"Lalfi;",3,true);
        check(observer.size()==6,"paired id/title bridge parses with distinct input register");
        List<Method> sourceMethods=new ArrayList<>();
        sourceMethods.add(new ImmutableMethod(SOURCE,"afterglow_observeDescriptionTitle",List.of(new ImmutableMethodParameter("Lalfi;",null,null)),"V",AccessFlags.PUBLIC.getValue()|AccessFlags.STATIC.getValue(),null,null,new ImmutableMethodImplementation(3,observer,List.of(),null)));
        for(String name:List.of("nativeRequestBody","nativeConnection")){
            String text=block(source,"\""+name+"\" to \"\"\"(.*?)\"\"\"");String signature=name.equals("nativeRequestBody")?"Ljava/lang/String;":"";
            var instructions=InlineSmaliCompiler.Companion.compile(expand(text,"","","",""),signature,2,true);
            check(!instructions.isEmpty(),"actual transport bridge parses "+name);
            sourceMethods.add(new ImmutableMethod(SOURCE,name,signature.isEmpty()?List.of():List.of(new ImmutableMethodParameter(signature,null,null)),name.equals("nativeRequestBody")?"[B":"Ljava/net/HttpURLConnection;",AccessFlags.PUBLIC.getValue()|AccessFlags.STATIC.getValue(),null,null,new ImmutableMethodImplementation(2,instructions,List.of(),null)));
        }
        emitted.add(new ImmutableClassDef(SOURCE,AccessFlags.PUBLIC.getValue(),"Ljava/lang/Object;",List.of(),null,null,List.of(),sourceMethods));
        String content=Files.readString(Path.of(args[1]).resolveSibling("DescriptionContentPatch.kt"));List<Method> contentMethods=new ArrayList<>();
        for(String[] spec:new String[][]{{"afterglow_descriptionRoot","Landroid/view/View;"},{"afterglow_descriptionPanel","Ljava/lang/Object;"},{"afterglow_descriptionPanelId","Ljava/lang/String;"}}){
            String bodyText=block(content,"panel\\.addMethod\\(\""+spec[0]+"\", \"[^\"]+\", 2, \"\"\"(.*?)\"\"\"");
            var instructions=InlineSmaliCompiler.Companion.compile(bodyText.replace("$LOADING",LOADING),"",2,false);
            check(!instructions.isEmpty(),"actual content owner bridge compiles "+spec[0]);
            if(spec[0].equals("afterglow_descriptionRoot"))check(instructions.stream().anyMatch(i->ref(i).equals("Lakhj;->d:"+LOADING))&&!instructions.stream().anyMatch(i->ref(i).equals("Lakhj;->Z:Landroid/widget/FrameLayout;")),"production root getter returns native panel root, never its footer sibling");
            contentMethods.add(new ImmutableMethod("Lakhj;",spec[0],List.of(),spec[1],AccessFlags.PUBLIC.getValue(),null,null,new ImmutableMethodImplementation(2,instructions,List.of(),null)));
        }
        emitted.add(new ImmutableClassDef("Lakhj;",AccessFlags.PUBLIC.getValue(),"Lakhh;",List.of(),null,null,List.of(),contentMethods));
        for(String[] spec:new String[][]{{"onNativeMounted","p2","Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;","4"},{"onNativeUnmounted","p2","Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;","3"}}){
            String call=block(content,"\"(invoke-static/range \\{ p0 \\.\\. "+spec[1]+" \\}, \\$CONTENT->"+spec[0]+"\\([^\"]+)\"");
            String signature="Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;"+(spec[0].equals("onNativeMounted")?"Ljava/lang/Object;":"");
            var instructions=InlineSmaliCompiler.Companion.compile(call.replace("$CONTENT",ROOT+"DescriptionHeaderContent;"),signature,Integer.parseInt(spec[3]),true);
            check(instructions.size()==1&&instructions.get(0).getOpcode()==Opcode.INVOKE_STATIC_RANGE,"actual callback prefix compiles "+spec[0]);
            var range=(RegisterRangeInstruction)instructions.get(0);
            check(range.getStartRegister()==0&&range.getRegisterCount()==3,"callback forwards host/item/model without altering parameters");
        }
        DexFileFactory.writeDexFile(args[2],new ImmutableDexFile(Opcodes.getDefault(),emitted));
        var restored=DexFileFactory.loadDexFile(new File(args[2]),Opcodes.getDefault());int count=0;
        for(ClassDef type:restored.getClasses())for(Method m:type.getMethods()){count++;check(m.getImplementation()!=null&&code(m).size()>0,"real DEX bridge body survives roundtrip");}
        check(count==12,"all twelve generated source bridge methods emitted");
        System.out.println("PASS "+checks+" Description native ownership/register/transport/DEX checks");
    }
}
