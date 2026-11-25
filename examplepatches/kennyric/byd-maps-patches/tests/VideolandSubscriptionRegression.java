import java.io.*;
import java.net.*;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.*;
import java.util.*;
import app.morphe.patcher.*;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.dex.*;
import app.morphe.patcher.util.PatchClasses;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.reandroid.apk.ApkModule;

/** Run against the actual JVM patch bundle and publisher base APK, with no network. */
public class VideolandSubscriptionRegression {
 static int checks;
 static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);checks++;System.out.println("PASS "+why);}
 interface Checked {void run()throws Exception;}
 static void reject(String why,Checked action)throws Exception{
  try{action.run();}catch(InvocationTargetException e){
   if(e.getCause() instanceof IllegalStateException || e.getCause() instanceof PatchException){check(true,why);return;}throw e;
  }throw new AssertionError("Accepted "+why);
 }
 static Method alter(Method m,int index,Instruction replacement){
  List<Instruction> code=new ArrayList<>();m.getImplementation().getInstructions().forEach(code::add);code.set(index,replacement);
  return new ImmutableMethod(m.getDefiningClass(),m.getName(),m.getParameters(),m.getReturnType(),m.getAccessFlags(),m.getAnnotations(),m.getHiddenApiRestrictions(),
    new ImmutableMethodImplementation(m.getImplementation().getRegisterCount(),code,m.getImplementation().getTryBlocks(),m.getImplementation().getDebugItems()));
 }
 static PackageMetadata trustedMetadata(PackageMetadata original,String pkg,String version,String code)throws Exception{
  PackageMetadata changed=new PackageMetadata(pkg,version,code,null);
  var certificates=PackageMetadata.class.getDeclaredField("signingCertificates$delegate");certificates.setAccessible(true);
  certificates.set(changed,new kotlin.InitializedLazyImpl<>(original.getSigningCertificates()));
  return changed;
 }
 static PatcherConfig config(File apk,File scratch){
  DexVerifier verifier=(DexVerifier)java.lang.reflect.Proxy.newProxyInstance(VideolandSubscriptionRegression.class.getClassLoader(),new Class[]{DexVerifier.class},(p,m,a)->{throw new AssertionError("Unexpected verifier");});
  return new PatcherConfig(apk,scratch,Set.of(),BytecodeMode.NONE,verifier,scratch,null,false);
 }
 public static void main(String[]args)throws Exception{
  File bundle=new File(args[0]),apk=new File(args[1]),scratch=new File(args[2]);scratch.mkdirs();
  var loader=new URLClassLoader(new URL[]{bundle.toURI().toURL()},VideolandSubscriptionRegression.class.getClassLoader());
  Class<?> production=loader.loadClass("patches.videolandatv.SubscriptionTargetsKt");
  var validate=production.getMethod("requireSubscriptionMethod",Method.class,int.class,String.class);
  var resolve=production.getMethod("subscriptionTargets",BytecodePatchContext.class);
  var digest=production.getMethod("subscriptionMethodDigest",Method.class);
  String root="Lcom/bedrockstreaming/";
  String nav=root+"component/navigation/domain/NavigationMapper;",act=root+"feature/player/domain/mediaplayer/usecase/HandleActionUseCase;",sub=root+"component/layout/domain/core/model/Target$Lock$RequireSubscriptionLock;";
  Map<String,ClassDef> classes=new HashMap<>();
  var dex=DexFileFactory.loadDexContainer(apk,Opcodes.getDefault());
  for(String entry:dex.getDexEntryNames())for(ClassDef c:dex.getEntry(entry).getDexFile().getClasses())if(Set.of(nav,act,sub).contains(c.getType()))classes.put(c.getType(),c);
  Map<String,Method> methods=new HashMap<>();
  classes.forEach((name,c)->{for(Method m:c.getMethods())if(m.getName().equals(name.equals(sub)?"b":"a"))methods.put(name,m);});
  String[] names={nav,act,sub};int[] flags={9,17,17};
  String[] hashes={"15c7c906c38a83f62f3cd49fef7155603429db7465773587863b48cf73817fa7","5f1257af67ca08054ddd83d3150441d76e61173575380936a9c20eb20f84379b","5ab6d34b79ad5460a6102b144adf7ebe65b445dfee8974f2b51df62fde1970de"};
  for(int i=0;i<names.length;i++){
   Method m=methods.get(names[i]);int f=flags[i];String h=hashes[i];
   validate.invoke(null,m,f,h);check(true,"actual original contract "+names[i]);
   reject("changed access flags",()->validate.invoke(null,m,f^8,h));
  }
  Method a=methods.get(act),b=methods.get(sub);
  Method changedSeam=alter(a,113,new ImmutableInstruction22c(Opcode.INSTANCE_OF,6,15,new ImmutableTypeReference(sub)));
  reject("same-count dispatch seam mutation",()->validate.invoke(null,changedSeam,17,hashes[1]));
  var read=(TwoRegisterInstruction)b.getImplementation().getInstructions().iterator().next();
  Method changedField=alter(b,0,new ImmutableInstruction22c(Opcode.IGET_OBJECT,read.getRegisterA(),read.getRegisterB(),new ImmutableFieldReference(sub,"O","Ljava/lang/Object;")));
  reject("accessor field type mutation",()->validate.invoke(null,changedField,17,hashes[2]));
  PackageMetadata metadata;
  try(ApkModule module=ApkModule.loadApkFile(apk)){
   var manifest=module.getAndroidManifest();metadata=new PackageMetadata(manifest.getPackageName(),manifest.getVersionName(),String.valueOf(manifest.getVersionCode()),module.getApkSignatureBlock());
  }
  var routing=loader.loadClass("patches.videolandatv.SubscriptionRoutingPatchKt").getMethod("getSubscriptionRoutingPatch").invoke(null);
  Patch<?> patch=(Patch<?>)routing;
  for(String mode:List.of("original","missing","duplicate"))try(var context=new BytecodePatchContext(config(apk,scratch),metadata)){
   Set<ClassDef> selected=new HashSet<>(classes.values());
   if(!mode.equals("original"))selected.remove(classes.get(sub));
   if(mode.equals("duplicate")){
    ClassDef original=classes.get(sub);
    ClassDef duplicate=(ClassDef)java.lang.reflect.Proxy.newProxyInstance(loader,new Class[]{ClassDef.class},(proxy,method,values)->{
     if(method.getName().equals("hashCode"))return System.identityHashCode(proxy);
     if(method.getName().equals("equals"))return proxy==values[0];
     if(Set.of("getMethods","getVirtualMethods").contains(method.getName())){
      List<Method> repeated=new ArrayList<>();
      for(Object entry:(Iterable<?>)method.invoke(original,values))repeated.add((Method)entry);repeated.add(methods.get(sub));return repeated;
     }
     return method.invoke(original,values);
    });selected.add(duplicate);
   }
   context.setPatchClasses$morphe_patcher(new PatchClasses(selected));
   if(!mode.equals("original"))reject(mode+" accessor aborts actual patch before mutation",
      ()->Patch.class.getMethod("execute",PatchContext.class).invoke(patch,context));
   else {resolve.invoke(null,context);check(true,"all original contracts resolve together");}
   Method current=null;for(Method m:context.mutableClassDefBy(nav).getMethods())if(m.getName().equals("a"))current=m;
   check(current!=null&&hashes[0].equals(digest.invoke(null,current)),"contract failure leaves context navigation untouched");
  }
  check(!patch.getDefault(),"experimental patch off by default");
  check(patch.getDependencies().size()==1 && patch.getDependencies().iterator().next() instanceof ResourcePatch,"only dependency is resource input preflight");
  var target=patch.getCompatibility().iterator().next();
  var input=loader.loadClass("patches.shared.OriginalInputKt").getMethod("validateOriginalInput",Compatibility.class,PackageMetadata.class,Integer.class);
  input.invoke(null,target,metadata,24);check(true,"publisher input metadata accepted");
  reject("wrong package",()->input.invoke(null,target,trustedMetadata(metadata,"wrong.package",metadata.getVersionName(),metadata.getVersionCode()),24));
  reject("wrong version",()->input.invoke(null,target,trustedMetadata(metadata,metadata.getPackageName(),"0",metadata.getVersionCode()),24));
  reject("wrong version code",()->input.invoke(null,target,trustedMetadata(metadata,metadata.getPackageName(),metadata.getVersionName(),"0"),24));
  reject("wrong minSDK",()->input.invoke(null,target,metadata,25));
  reject("missing signer",()->input.invoke(null,target,new PackageMetadata(metadata.getPackageName(),metadata.getVersionName(),metadata.getVersionCode(),null),24));
  if(args.length>3)try(ApkModule module=ApkModule.loadApkFile(new File(args[3]))){
   var manifest=module.getAndroidManifest();
   var signed=new PackageMetadata(manifest.getPackageName(),manifest.getVersionName(),String.valueOf(manifest.getVersionCode()),module.getApkSignatureBlock());
   reject("previously patched/re-signed input",()->input.invoke(null,target,signed,24));
  }
  System.out.println("PASS: "+checks+" production Videoland subscription contracts");
 }
}
