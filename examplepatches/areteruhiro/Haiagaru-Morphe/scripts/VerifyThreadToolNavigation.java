import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.*;
import java.util.*;
import java.util.zip.*;

/** Fail closed if any version-specific thread-pane navigation contract changes. */
public final class VerifyThreadToolNavigation {
    static Map<String,ClassDef> classes=new HashMap<>();
    static void field(String type,String name,String expected){
        ClassDef c=classes.get(type);
        while(c!=null){for(var f:c.getFields())if(f.getName().equals(name)&&f.getType().equals(expected))return;c=classes.get(c.getSuperclass());}
        throw new AssertionError(type+"->"+name+":"+expected);
    }
    static void method(String type,String name,String result,String...args){
        for(var m:classes.get(type).getMethods())if(m.getName().equals(name)&&m.getReturnType().equals(result)&&m.getParameterTypes().equals(List.of(args)))return;
        throw new AssertionError(type+"->"+name+List.of(args)+result);
    }
    public static void main(String[] args)throws Exception{
        String version=args[0];try(ZipFile zip=new ZipFile(args[1])){for(var e:Collections.list(zip.entries()))if(e.getName().matches("classes[0-9]*\\.dex"))try(var in=new java.io.BufferedInputStream(zip.getInputStream(e))){for(var c:DexBackedDexFile.fromInputStream(Opcodes.getDefault(),in).getClasses())classes.put(c.getType(),c);}}
        String activity="Ljp/syoboi/a2chMate/activity/TabletHomeActivity;",fragment="Landroidx/fragment/app/Fragment;";
        if(version.equals("191")){
            String pane="Ljp/syoboi/a2chMate/activity/TabletHomeActivity$read;",adapter="Lo/r8lambdaBjbaKVYCk6JekZq3TlN9Kg2pYOk;";
            field(activity,"I",pane);field(pane,"d",adapter);field(pane,"e","Lo/r8lambdafMc_1ZsCh0Av7sgeaP_ONZFygM;");
            field("Lo/r8lambdafMc_1ZsCh0Av7sgeaP_ONZFygM;","a","I");field(adapter,"a","Ljava/util/ArrayList;");
            method(adapter,"a","I",fragment);method(pane,"d","Z","I");
        }else if(version.equals("226")){
            field(activity,"r","[Lo/QWA;");field("Lo/QWA;","a","Lo/GNk;");field("Lo/GNk;","d","Lo/zzbc;");
            method("Lo/GNk;","d","I",fragment);method("Lo/GNk;","c","V","I");method("Lo/zzbc;","c","Ljava/lang/Object;");
            field("Lo/Ff;","a","I");field("Lo/Ff;","b","Ljava/util/List;");
        }else if(version.equals("242")){
            field(activity,"w","[Lo/getRemoteCreator;");field("Lo/getRemoteCreator;","e","Lo/zzev;");field("Lo/zzev;","e","Lo/zzcpf;");
            method("Lo/zzev;","e","Lo/zzeq;",fragment);method("Lo/zzev;","d","I","Lo/zzeq;");method("Lo/zzev;","e","V","I");method("Lo/zzcpf;","d","Ljava/lang/Object;");
            field("Lo/zzew;","b","I");field("Lo/zzew;","a","Ljava/util/List;");
        }else throw new AssertionError(version);
        System.out.println("PASS "+version+" native thread pane, selected position, page list and native selection contract");
    }
}
