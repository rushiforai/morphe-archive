import java.io.*;
import java.net.*;
import java.lang.reflect.InvocationTargetException;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.dex.*;
import app.morphe.patcher.util.PatchClasses;
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.reandroid.apk.ApkModule;

/** Exercise the production contract resolver against actual publisher DEX. */
public class VideolandUnavailableRegression {
 static int checks;
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS "+why);}
 static PatcherConfig config(File apk,File scratch){
  DexVerifier verifier=(DexVerifier)java.lang.reflect.Proxy.newProxyInstance(VideolandUnavailableRegression.class.getClassLoader(),new Class[]{DexVerifier.class},(p,m,a)->{throw new AssertionError("Unexpected verifier");});
  return new PatcherConfig(apk,scratch,Set.of(),BytecodeMode.NONE,verifier,scratch,null,false);
 }
 public static void main(String[] args)throws Exception{
  File bundle=new File(args[0]),apk=new File(args[1]),scratch=new File(args[2]);scratch.mkdirs();
  var loader=new URLClassLoader(new URL[]{bundle.toURI().toURL()},VideolandUnavailableRegression.class.getClassLoader());
  var production=loader.loadClass("patches.videolandatv.UnavailableContentContractsKt");
  var contracts=(Map<String,String>)production.getMethod("getUnavailableClasses").invoke(null);
  var resolve=production.getMethod("unavailableTargets",BytecodePatchContext.class);
  var digest=production.getMethod("unavailableClassDigest",ClassDef.class);
  Map<String,ClassDef> classes=new HashMap<>();var dex=DexFileFactory.loadDexContainer(apk,Opcodes.getDefault());
  for(String entry:dex.getDexEntryNames())for(ClassDef c:dex.getEntry(entry).getDexFile().getClasses())if(contracts.containsKey(c.getType())||c.getType().equals("Lf8/a;"))classes.put(c.getType(),c);
  for(var e:contracts.entrySet())check(e.getValue().equals(digest.invoke(null,new MutableClass(classes.get(e.getKey())))),"publisher ABI "+e.getKey());
  PackageMetadata metadata;
  try(ApkModule module=ApkModule.loadApkFile(apk)){var m=module.getAndroidManifest();metadata=new PackageMetadata(m.getPackageName(),m.getVersionName(),String.valueOf(m.getVersionCode()),module.getApkSignatureBlock());}
  for(String mode:List.of("original","missing","operand"))try(var context=new BytecodePatchContext(config(apk,scratch),metadata)){
   Map<String,ClassDef> current=new HashMap<>(classes);
   if(mode.equals("missing"))current.remove("Lw4/H;");
   if(mode.equals("operand")){
    ClassDef original=classes.get("Lw4/H;");List<Method> changed=new ArrayList<>();
    for(Method method:original.getMethods()){
     if(method.getName().equals("k"))method=new ImmutableMethod(method.getDefiningClass(),method.getName(),method.getParameters(),method.getReturnType(),method.getAccessFlags(),method.getAnnotations(),method.getHiddenApiRestrictions(),new ImmutableMethodImplementation(2,List.of(new ImmutableInstruction11n(Opcode.CONST_4,0,0),new ImmutableInstruction11x(Opcode.RETURN_OBJECT,0)),List.of(),List.of()));
     changed.add(method);
    }
    current.put(original.getType(),new ImmutableClassDef(original.getType(),original.getAccessFlags(),original.getSuperclass(),original.getInterfaces(),original.getSourceFile(),original.getAnnotations(),original.getFields(),changed));
   }
   context.setPatchClasses$morphe_patcher(new PatchClasses(new HashSet<>(current.values())));
   String before=(String)digest.invoke(null,context.mutableClassDefBy("Ld8/a;"));
   try{resolve.invoke(null,context);check(mode.equals("original"),"original hook set resolves");}
   catch(InvocationTargetException e){if(mode.equals("original"))throw e;check(true,mode+" ABI rejected before mutation");}
   check(before.equals(digest.invoke(null,context.mutableClassDefBy("Ld8/a;"))),"resolver leaves presentation code untouched");
  }
  Patch<?> patch=(Patch<?>)loader.loadClass("patches.videolandatv.UnavailableContentPatchKt").getMethod("getHideUnavailableContentPatch").invoke(null);
  check(patch.getDefault(),"validated availability filter is enabled by default");
  try{loader.loadClass("patches.videolandatv.SubscriptionRoutingPatchKt");throw new AssertionError("Research routing exposed in stable bundle");}
  catch(ClassNotFoundException expected){check(true,"research routing excluded from stable bundle");}
  check(patch.getDependencies().size()==1&&patch.getDependencies().iterator().next() instanceof ResourcePatch,"independent original-input dependency only");
  System.out.println("PASS: "+checks+" production availability contracts");
 }
}
