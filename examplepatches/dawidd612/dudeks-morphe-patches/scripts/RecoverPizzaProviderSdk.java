import java.util.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.*;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.rewriter.*;
import com.android.tools.smali.dexlib2.writer.pool.DexPool;
public class RecoverPizzaProviderSdk extends VerifyPizzaRewardDex {
 /** Remap the matching official ProviderInstaller task to a reviewed R8 layout.
  * Args: officialSDK.dex original.apk existingSDK.dex output.dex mapping.properties
  * Keep both real installation and exception outcomes; never return synthetic success.
  */
 public static void main(String[] a)throws Exception {
  if(a.length!=5)throw new IllegalArgumentException("Expected officialSDK.dex original.apk existingSDK.dex output.dex mapping.properties");
  var config=new Properties();try(var in=java.nio.file.Files.newInputStream(java.nio.file.Path.of(a[4]))){config.load(in);}
  String task=Objects.requireNonNull(config.getProperty("task")),installer=Objects.requireNonNull(config.getProperty("installer")),repairable=Objects.requireNonNull(config.getProperty("repairable")),unavailable=Objects.requireNonNull(config.getProperty("unavailable"));
  String contextField=Objects.requireNonNull(config.getProperty("contextField")),installMethod=Objects.requireNonNull(config.getProperty("installMethod")),repairCode=Objects.requireNonNull(config.getProperty("repairCode")),unavailableCode=Objects.requireNonNull(config.getProperty("unavailableCode"));
  var upstream=classes(a[0]);var target=classes(a[1]);
  var sourceTasks=new ArrayList<ClassDef>();
  for(var cls:upstream.values())if(cls.getType().startsWith("Lcom/google/android/gms/security/")&&"Landroid/os/AsyncTask;".equals(cls.getSuperclass())) {
   boolean installed=false,failed=false;
   for(var m:cls.getMethods())if(m.getName().equals("onPostExecute")&&m.getImplementation()!=null)for(var i:code(m)) {
    var ref=call(i);if(ref!=null){installed|=ref.getName().equals("onProviderInstalled");failed|=ref.getName().equals("onProviderInstallFailed");}
   }
   if(installed&&failed)sourceTasks.add(cls);
  }
  check(sourceTasks.size()==1,"Official ProviderInstaller async task missing or ambiguous");
  var sourceTask=sourceTasks.get(0);
  var contextFields=new ArrayList<com.android.tools.smali.dexlib2.iface.Field>();
  for(var f:sourceTask.getFields())if(f.getType().equals("Landroid/content/Context;"))contextFields.add(f);
  check(contextFields.size()==1,"Official provider Context contract changed");
  String sourceContextField=contextFields.get(0).getName();
  var types=Map.of(sourceTask.getType(),task,"Lcom/google/android/gms/security/ProviderInstaller;",installer,"Lcom/google/android/gms/common/GooglePlayServicesRepairableException;",repairable,"Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;",unavailable);
  var source=method(upstream,sourceTask.getType(),"doInBackground","Ljava/lang/Object;","[Ljava/lang/Object;");
  var destination=method(target,task,"doInBackground","Ljava/lang/Object;","[Ljava/lang/Object;");
  check(ExtractPizzaSdkReceivers.callsVm(destination),"Target task is not protected");
  method(target,installer,installMethod,"V","Landroid/content/Context;");
  check(ExtractPizzaSdkReceivers.hasField(target,new ImmutableFieldReference(unavailable,unavailableCode,"I"),unavailable),"Unavailable error code differs");
  check(ExtractPizzaSdkReceivers.hasField(target,new ImmutableFieldReference(repairable,repairCode,"I"),repairable),"Repairable error code differs");
  var rewriter=new DexRewriter(new RewriterModule(){
   public Rewriter<String> getTypeRewriter(Rewriters r){return new TypeRewriter(){protected String rewriteUnwrappedType(String s){return types.getOrDefault(s,s);}};}
   public Rewriter<FieldReference> getFieldReferenceRewriter(Rewriters r){return new FieldReferenceRewriter(r){public FieldReference rewrite(FieldReference f){
    if(f.getDefiningClass().equals(sourceTask.getType())&&f.getName().equals(sourceContextField))return new ImmutableFieldReference(task,contextField,f.getType());
    if(f.getDefiningClass().equals("Lcom/google/android/gms/common/GooglePlayServicesNotAvailableException;")&&f.getName().equals("errorCode"))return new ImmutableFieldReference(unavailable,unavailableCode,"I");
    return super.rewrite(f);}};}
   public Rewriter<MethodReference> getMethodReferenceRewriter(Rewriters r){return new MethodReferenceRewriter(r){public MethodReference rewrite(MethodReference m){
    if(m.getDefiningClass().equals("Lcom/google/android/gms/security/ProviderInstaller;")&&m.getName().equals("installIfNeeded"))return new ImmutableMethodReference(installer,installMethod,m.getParameterTypes(),m.getReturnType());
    return super.rewrite(m);}};}
  });
  var body=new MutableMethodImplementation(rewriter.getMethodImplementationRewriter().rewrite(source.getImplementation()));
  var ins=body.getInstructions();int getters=0;
  for(int i=0;i<ins.size();i++)if(ins.get(i) instanceof ReferenceInstruction ri&&ri.getReference() instanceof MethodReference m&&m.getName().equals("getConnectionStatusCode")){
   check(m.getDefiningClass().equals(repairable)&&m.getReturnType().equals("I")&&ins.get(i+1).getOpcode()==Opcode.MOVE_RESULT,"Unexpected error-code getter");
   int dest=((OneRegisterInstruction)ins.get(i+1)).getRegisterA(),obj=((FiveRegisterInstruction)ins.get(i)).getRegisterC();body.removeInstruction(i+1);body.replaceInstruction(i,new BuilderInstruction22c(Opcode.IGET,dest,obj,new ImmutableFieldReference(repairable,repairCode,"I")));getters++;
  }
  check(getters==1,"SDK error-code getter missing or duplicated");
  for(var i:body.getInstructions())if(i instanceof ReferenceInstruction ri){
   if(ri.getReference() instanceof FieldReference f)check(ExtractPizzaSdkReceivers.hasField(target,f,f.getDefiningClass()),"Missing mapped field "+f);
   if(ri.getReference() instanceof MethodReference m)check(ExtractPizzaSdkReceivers.hasMethod(target,m,m.getDefiningClass(),new HashSet<>()),"Missing mapped method "+m);
  }
  var replacement=new ImmutableMethod(destination.getDefiningClass(),destination.getName(),destination.getParameters(),destination.getReturnType(),destination.getAccessFlags(),destination.getAnnotations(),destination.getHiddenApiRestrictions(),body);
  validateRegistersAndBranches(replacement);
  var defs=new ArrayList<ClassDef>();for(var existing:classes(a[2]).values())if(!existing.getType().equals(task))defs.add(existing);
  var c=target.get(task);defs.add(new ImmutableClassDef(c.getType(),c.getAccessFlags(),c.getSuperclass(),c.getInterfaces(),null,List.of(),List.of(),List.of(replacement)));
  DexPool.writeTo(a[3],new ImmutableDexFile(Opcodes.getDefault(),defs));
  System.out.println("PASS: official ProviderInstaller task remapped to the game's R8 types, real installer and both actual failure codes retained");
 }
}
