import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import java.io.File;
import java.util.*;

/** Verify every reflective target used by PlaybackSession against compiled target DEX. */
public final class VerifyPlaybackContracts {
    static Map<String,ClassDef> classes=new HashMap<>();static int checks;
    static void field(String cls,String name,String type,boolean stat){
        for(Field f:classes.get("L"+cls+";").getFields())if(f.getName().equals(name)){
            if(!f.getType().equals(type) || (f.getAccessFlags()&1)==0 || ((f.getAccessFlags()&8)!=0)!=stat)throw new AssertionError(cls+"."+name);
            checks++;return;
        }throw new AssertionError("Missing field "+cls+"."+name);
    }
    static void method(String cls,String name,String returns,String... parameters){
        int count=0;for(Method m:classes.get("L"+cls+";").getMethods())if(m.getName().equals(name)&&m.getReturnType().equals(returns)&&m.getParameterTypes().equals(Arrays.asList(parameters)))count++;
        if(count!=1)throw new AssertionError(cls+"."+name+" count="+count);checks++;
    }
    public static void main(String[] args)throws Exception{
        MultiDexContainer<? extends DexFile> container=DexFileFactory.loadDexContainer(new File(args[0]),Opcodes.getDefault());
        for(String entry:container.getDexEntryNames())for(ClassDef cls:container.getEntry(entry).getDexFile().getClasses())classes.put(cls.getType(),cls);
        String fragment="com/sauzask/nicoid/NicoidVideoFragment",service="com/sauzask/nicoid/NicoidPopupViewService",activity="com/sauzask/nicoid/NicoidVideoActivity",view="com/devbrackets/android/exomedia/ui/widget/VideoView";
        field(fragment,"A1","L"+activity+";",false);field(fragment,"a0","L"+view+";",false);
        field(fragment,"b0","Ljava/lang/String;",false);field(fragment,"k0","I",false);field(fragment,"g1","Le/e/a/v;",false);
        field(service,"e","L"+view+";",false);field(service,"f","Ljava/lang/String;",false);field(service,"t0","I",true);
        field(activity,"v","L"+fragment+";",false);field("e/e/a/v","d","Ljava/lang/String;",false);
        field("e/e/a/ModernControls","speed","F",true);
        method(fragment,"n","V");method(fragment,"p","V");
        method(view,"getCurrentPosition","J");method(view,"getDuration","J");method(view,"isPlaying","Z");
        method(view,"pause","V");method(view,"seekTo","V","J");method(view,"setPlaybackSpeed","Z","F");
        method(activity,"onPause","V");method(activity,"onDestroy","V");method(activity,"onBackPressed","V");method(activity,"onUserLeaveHint","V");
        method("e/e/a/ModernControls","qualityOption","Ljava/lang/String;","I");
        method("e/e/a/ModernControls","update","V","L"+fragment+";");
        method("e/e/a/DynamicTheme","isNight","Z","Landroid/content/Context;");
        System.out.println("Compiled playback contracts: "+checks+" checks passed");
    }
}
