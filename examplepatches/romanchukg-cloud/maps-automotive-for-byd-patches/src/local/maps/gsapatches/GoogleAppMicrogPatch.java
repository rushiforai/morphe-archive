// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsapatches;
import java.util.*;
import java.security.MessageDigest;
import app.morphe.patcher.PackageMetadata;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c;
import org.w3c.dom.*;
import kotlin.Unit;

/** Isolated lab only: Google app identity retained for the stock Gemini shell. */
public final class GoogleAppMicrogPatch {
 private static final String PKG="com.google.android.googlequicksearchbox", PROVIDER="Llocal/maps/gsa/MicrogProvider;";
 private static final Set<String> CERTS=Set.of("f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83","7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053");
 private static final BytecodePatch PATCH=create();
 public static BytecodePatch getGoogleAppMicrogLabPatch(){return PATCH;}
 private static void requireInput(PackageMetadata m){
  if(!PKG.equals(m.getPackageName())||!"301813762".equals(m.getVersionCode())||!"17.62.11.ve.arm64".equals(m.getVersionName()))throw new IllegalStateException("Exact original Google app 17.62.11 input required");
  try{boolean match=false;for(var certs:m.getSigningCertificates().values())for(var cert:certs){StringBuilder s=new StringBuilder();for(byte b:MessageDigest.getInstance("SHA-256").digest(cert.getEncoded()))s.append(String.format("%02x",b&255));match|=CERTS.contains(s.toString());}if(!match)throw new IllegalStateException("Original Google signing certificate required");}catch(RuntimeException e){throw e;}catch(Exception e){throw new IllegalStateException("Cannot inspect signing certificate",e);}
 }
 private static String str(Instruction i){return i instanceof ReferenceInstruction r&&r.getReference() instanceof StringReference s?s.getString():null;}
 private static Method original(BytecodePatchContext ctx,String type,String name,String hash){
  Method found=null;for(var m:ctx.classDefBy(type).getMethods())if(m.getName().equals(name)&&m.getParameterTypes().toString().equals("[Landroid/content/Context;, I]")&&m.getReturnType().equals("I")&&m.getImplementation()!=null){if(found!=null)throw new IllegalStateException("Ambiguous gate");found=m;}
  if(found==null||!MethodShape.hash(found).equals(hash))throw new IllegalStateException("Pinned gate fingerprint changed: "+type+name);return found;
 }
 private static MutableMethod mutable(BytecodePatchContext ctx,Method original){for(var m:ctx.mutableClassDefBy(original.getDefiningClass()).getMethods())if(m.getName().equals(original.getName())&&m.getParameterTypes().equals(original.getParameterTypes())&&m.getReturnType().equals(original.getReturnType()))return m;throw new IllegalStateException("Missing mutable method");}
 private static Method modeMethod(BytecodePatchContext ctx,String type,String name,String parameter,String hash){
  for(var m:ctx.classDefBy(type).getMethods())if(m.getName().equals(name)&&m.getParameterTypes().toString().equals("["+parameter+"]")&&m.getReturnType().equals("V")&&m.getImplementation()!=null){if(!MethodShape.hash(m).equals(hash))throw new IllegalStateException("Native mode hook fingerprint changed: "+m);return m;}
  throw new IllegalStateException("Native mode hook missing: "+type+name);
 }
 private static void observeVoiceModel(BytecodePatchContext ctx,String type,String hash){
  Method constructor=null;for(var m:ctx.classDefBy(type).getMethods())if(m.getName().equals("<init>")&&m.getImplementation()!=null){if(constructor!=null)throw new IllegalStateException("Ambiguous voice model constructor");constructor=m;}
  if(constructor==null||!MethodShape.hash(constructor).equals(hash))throw new IllegalStateException("Pinned voice model constructor changed: "+type);
  var target=mutable(ctx,constructor);int count=0;for(int i=target.getImplementation().getInstructions().size()-1;i>=0;i--)if(target.getImplementation().getInstructions().get(i).getOpcode()==Opcode.RETURN_VOID){InstructionExtensions.INSTANCE.addInstruction(target,i,"invoke-static/range {p0 .. p0}, Llocal/maps/gsa/CarVoiceStrip;->modelCreated(Ljava/lang/Object;)V");count++;}if(count!=1)throw new IllegalStateException("Unexpected voice model returns");
 }
 private static MutableMethod application(BytecodePatchContext ctx){
  for(String type="Lcom/google/android/apps/gsa/binaries/velvet/app/VelvetMultiprocessRoot_Application;";type!=null&&!type.equals("Landroid/app/Application;");){var c=ctx.classDefByOrNull(type);if(c==null)break;for(var m:c.getMethods())if(m.getName().equals("onCreate")&&m.getParameterTypes().isEmpty()&&m.getReturnType().equals("V")&&m.getImplementation()!=null)return mutable(ctx,m);type=c.getSuperclass();}throw new IllegalStateException("Application.onCreate not found");
 }
 private static BytecodePatch create(){
  ResourcePatchBuilder res=new ResourcePatchBuilder(null,null,false);
  res.execute(ctx->{requireInput(ctx.getPackageMetadata());try(var doc=ctx.document("AndroidManifest.xml")){
   Element app=(Element)doc.getElementsByTagName("application").item(0);
   NodeList permissions=doc.getElementsByTagName("uses-permission");for(int i=0;i<permissions.getLength();i++){Element e=(Element)permissions.item(i);String name=e.getAttribute("android:name");e.setAttribute("android:name",ProtocolRoutes.route(name));}
   Element queries=(Element)doc.getElementsByTagName("queries").item(0);if(queries==null){queries=doc.createElement("queries");doc.getDocumentElement().appendChild(queries);}Element q=doc.createElement("package");q.setAttribute("android:name","app.revanced.android.gms");queries.appendChild(q);Element mapsQuery=doc.createElement("package");mapsQuery.setAttribute("android:name","com.google.android.apps.maps.automotive");queries.appendChild(mapsQuery);
   Element modes=doc.createElement("provider");modes.setAttribute("android:name","local.maps.gsa.AssistantModeProvider");modes.setAttribute("android:authorities",PKG+".local.maps.assistant");modes.setAttribute("android:exported","true");modes.setAttribute("android:process",":search");modes.setAttribute("android:grantUriPermissions","false");app.appendChild(modes);
   String[][] metadata={{"app.revanced.android.gms.SPOOFED_PACKAGE_NAME",PKG},{"app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE","38918a453d07199354f8b19af05ec6562ced5788"},{"app.revanced.MICROG_PACKAGE_NAME","app.revanced.android.gms"},{"app.revanced.android.gms.MICROG_PACKAGE_NAME","app.revanced.android.gms"},{"local.maps.gsa.LAB_REVISION","GSA-LAB.20"}};
   for(String[] pair:metadata){Element e=doc.createElement("meta-data");e.setAttribute("android:name",pair[0]);e.setAttribute("android:value",pair[1]);app.appendChild(e);}
  }catch(Exception e){throw new IllegalStateException("GSA lab manifest failed",e);}
  // Android 12 revalidates the selected recognizer at boot. Its false flag makes the
  // framework discard this recognizer, then clear a user-installed voice interactor.
  // Advertise the existing public recognizer as selectable; the user still chooses
  // Google as assistant. No role assignment, system settings or permission changes.
  try(var recognizer=ctx.document("res/xml/transcription_recognizer.xml")){
   Element root=recognizer.getDocumentElement();
   if(!"recognition-service".equals(root.getTagName())||!"false".equals(root.getAttribute("android:selectableAsDefault")))throw new IllegalStateException("Pinned recognizer metadata changed");
   root.setAttribute("android:selectableAsDefault","true");
  }catch(Exception e){throw new IllegalStateException("GSA recognizer compatibility metadata failed",e);}
  return Unit.INSTANCE;});
  BytecodePatchBuilder patch=new BytecodePatchBuilder("Google app for BYD (MicroG-RE TEST)","Optional Gemini Live for pinned Google17.62.11/API32+. MicroG-RE required; music ducking is experimental.",true);
  patch.compatibleWith(new Compatibility(PKG,"Google app Gemini TEST",null,ApkFileType.APKM,(Integer)null,CERTS,List.of(new AppTarget("17.62.11.ve.arm64",301813762,true,32,"Pinned Google app ARM64 input"))));
  patch.dependsOn(res.build$morphe_patcher());
  patch.extendWith(()->{var s=GoogleAppMicrogPatch.class.getClassLoader().getResourceAsStream("extensions/gsa.mpe");if(s==null)throw new IllegalStateException("Missing extension");return s;});
  patch.execute(ctx->{requireInput(ctx.getPackageMetadata());
   Method core=original(ctx,"Ldazh;","b","f45e2396cbfd6957e7cdcf527ffdc979a8d0fa73e466a4b437695eef46a9869b");
   Method wrapper=original(ctx,"Ldayp;","l","9a5d82fa5161a47bb8a5bf167edad6835c6d61fe4fc7e1cb9868b47ce39b3653");
   List<Method> modes=new ArrayList<>();
   modes.add(modeMethod(ctx,"Lcom/google/android/apps/search/assistant/surfaces/voice/robin/main/MainActivity;","onCreate","Landroid/os/Bundle;","5511872f1ef2b574c965b6acb0855f4526466d10c02f219f80981a4229e3741d"));
   modes.add(modeMethod(ctx,"Lcom/google/android/apps/search/assistant/surfaces/voice/robin/main/MainActivity;","onNewIntent","Landroid/content/Intent;","75e548fbee081c2f3900839e41b5fce6e836f608316e47a50fe79317bd1a384a"));
   modes.add(modeMethod(ctx,"Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/floaty/activity/FloatyActivity;","onCreate","Landroid/os/Bundle;","c695545041d992c2e0a1ec6e710c98b2c88c4440c4d18c685f6c71b36a8f36e6"));
   modes.add(modeMethod(ctx,"Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/floaty/activity/FloatyActivity;","onNewIntent","Landroid/content/Intent;","11c8df380f92a33312cc3bb8cd44ebd031389dd47a3d328ce3df18f0958d2b2b"));
   String liveType="Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/floaty/ui/content/lrlive/LrFloatyLiveViewModel;";
   Method liveCtor=null;for(var m:ctx.classDefBy(liveType).getMethods())if(m.getName().equals("<init>")&&m.getImplementation()!=null){if(liveCtor!=null)throw new IllegalStateException("Ambiguous native Live constructor");liveCtor=m;}
   if(liveCtor==null||!MethodShape.hash(liveCtor).equals("ad1a5a95685136381a5d65852759e35d1421948af3bcd7580ff1858c6a4b9a8d"))throw new IllegalStateException("Pinned native Live constructor changed");
   var observed=mutable(ctx,liveCtor);int observerCount=0;for(int i=observed.getImplementation().getInstructions().size()-1;i>=0;i--)if(observed.getImplementation().getInstructions().get(i).getOpcode()==Opcode.RETURN_VOID){InstructionExtensions.INSTANCE.addInstruction(observed,i,"invoke-static/range {p0 .. p0}, Llocal/maps/gsa/CarLivePanel;->modelCreated(Ljava/lang/Object;)V");observerCount++;}if(observerCount!=1)throw new IllegalStateException("Unexpected native Live constructor returns");
   observeVoiceModel(ctx,"Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/floaty/ui/common/input/FloatyInputViewModel;","56d2093a40616ac847ba4f2f3a70efda3e8c9ed91a0de96efe3bc1ed12d0a21d");
   observeVoiceModel(ctx,"Lcom/google/android/apps/search/assistant/surfaces/voice/robin/ui/floaty/ui/content/host/FloatyPageContainerViewModel;","d41aa3e26122d742bee82cac609babd7df315010391445afe7262ca7322ed4d6");
   int routes=0,classes=0;for(var source:ctx.getAllClassesWithStrings()){
    if(source.getType().startsWith("Llocal/maps/gsa/"))continue;boolean needed=false;
    for(var m:source.getMethods())if(m.getImplementation()!=null)for(var i:m.getImplementation().getInstructions()){String s=str(i);if(s!=null&&!s.equals(ProtocolRoutes.route(s)))needed=true;}
    if(!needed)continue;classes++;
    for(var m:ctx.mutableClassDefBy(source).getMethods()){var b=m.getImplementation();if(b==null)continue;for(int i=b.getInstructions().size()-1;i>=0;i--){var ins=b.getInstructions().get(i);String s=str(ins);if(s==null||s.equals(ProtocolRoutes.route(s)))continue;if(ins.getOpcode()!=Opcode.CONST_STRING&&ins.getOpcode()!=Opcode.CONST_STRING_JUMBO)throw new IllegalStateException("Unsupported routed instruction");b.replaceInstruction(i,new BuilderInstruction31c(Opcode.CONST_STRING_JUMBO,((OneRegisterInstruction)ins).getRegisterA(),new ImmutableStringReference(ProtocolRoutes.route(s))));routes++;}}
   }
   InstructionExtensions.INSTANCE.addInstructions(mutable(ctx,core),0,"invoke-static {p0}, "+PROVIDER+"->availability(Landroid/content/Context;)I\nmove-result v0\nreturn v0");
   InstructionExtensions.INSTANCE.addInstructions(mutable(ctx,wrapper),0,"invoke-static {p1}, "+PROVIDER+"->availability(Landroid/content/Context;)I\nmove-result v0\nreturn v0");
   var app=application(ctx);InstructionExtensions.INSTANCE.addInstruction(app,0,"invoke-static/range {p0 .. p0}, "+PROVIDER+"->install(Landroid/app/Application;)V");
   for(Method mode:modes){boolean create=mode.getName().equals("onCreate");InstructionExtensions.INSTANCE.addInstruction(mutable(ctx,mode),0,create?"invoke-static/range {p0 .. p0}, Llocal/maps/gsa/AssistantModes;->created(Landroid/app/Activity;)V":"invoke-static/range {p0 .. p1}, Llocal/maps/gsa/AssistantModes;->newIntent(Landroid/app/Activity;Landroid/content/Intent;)V");}
   if(routes<100||classes<20)throw new IllegalStateException("Unexpected routing shape: "+routes+"/"+classes);
   System.out.println("GSA-LAB.20 routes="+routes+" classes="+classes+" guarded=2 bootstrap="+app.getDefiningClass()+"->onCreate");return Unit.INSTANCE;
  });return patch.build$morphe_patcher();
 }
}
