// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.util.*;
import java.security.MessageDigest;
import app.morphe.patcher.PackageMetadata;
import kotlin.Unit;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.FieldReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference;
import org.w3c.dom.*;

/** Experimental public TEST patch. No Google implementation classes are bundled.
 * Adds our cluster module and MicroG-RE provider guard; native auth remains unchanged.
 */
public final class AutomotiveMicrogPatch {
 private static final Set<String> SIGNERS=Set.of("1975b2f17177bc89a5dff31f9e64a6cae281a53dc1d1d59b1d147fe1c82afa00","d22cc500299fb22873a01a010de1c82fbe4d061119b94814dd301dab50cb7678");
 private static final String EXTENSION="extensions/aaos.mpe",OWN="Llocal/maps/";
 private static final String PROVIDER="Llocal/maps/cluster/MicrogProvider;",BOOTSTRAP="Llocal/maps/cluster/PatchBootstrap;";
 private static final String APPLICATION="Lcom/google/android/apps/gmm/car/embedded/app/EmbeddedGoogleMapsApplication;";
 private static final String CONNECTION_RESULT="Lcom/google/android/gms/common/ConnectionResult;",AVAILABILITY_CHANNEL="com.google.android.gms.availability";
 /** Port 26.10 phase B (API29, 3D, search, UI scale): re-pinned to 26.10 in revision 54. */
 static final boolean PHASE_B=true;
 private static final BytecodePatch PATCH=create();
 public static BytecodePatch getAutomotiveMicrogPatch(){return PATCH;}
 private static void isolateIdentity(Document doc){
  String old="com.google.android.apps.maps",now=old+".automotive";
  Element manifest=doc.getDocumentElement();manifest.setAttribute("package",now);
  if(manifest.hasAttribute("android:sharedUserId"))manifest.setAttribute("android:sharedUserId",now);
  NodeList nodes=doc.getElementsByTagName("*");
  Set<String> components=Set.of("application","activity","activity-alias","service","receiver","provider","instrumentation");
  for(int i=0;i<nodes.getLength();i++){
   Element e=(Element)nodes.item(i);String tag=e.getTagName();
   NamedNodeMap attrs=e.getAttributes();
   for(int j=0;j<attrs.getLength();j++){
    Attr a=(Attr)attrs.item(j);String name=a.getName(),value=a.getValue();
    if((name.equals("android:process")||name.equals("android:taskAffinity"))&&value.equals(old))a.setValue(now);
    else if(name.equals("android:authorities")&&tag.equals("provider")){
     StringJoiner joined=new StringJoiner(";");for(String v:value.split(";"))joined.add(v.equals(old)||v.startsWith(old+".")?now+v.substring(old.length()):now+"."+v);a.setValue(joined.toString());
    }else if((name.equals("android:permission")||name.equals("android:readPermission")||name.equals("android:writePermission")||((tag.equals("permission")||tag.equals("uses-permission"))&&name.equals("android:name")))&&value.startsWith(old+"."))a.setValue(now+value.substring(old.length()));
    else if(components.contains(tag)&&Set.of("android:name","android:targetActivity","android:backupAgent","android:appComponentFactory").contains(name)){
     if(value.startsWith("."))a.setValue(old+value);else if(!value.contains("."))a.setValue(old+"."+value);
    }
   }
   if(tag.equals("application"))e.setAttribute("android:label","Maps Automotive");
  }
 }
 /** Send to car: the push receiver and its permissions under MicroG-RE's names (the code side is ProtocolRoutes).
  * Only c2dm permission/action names are rewritten; the receiver component and other filters stay. */
 private static void routePush(Document doc){
  int changed=0;NodeList nodes=doc.getElementsByTagName("*");
  for(int i=0;i<nodes.getLength();i++){
   Element e=(Element)nodes.item(i);String tag=e.getTagName();
   for(String name:List.of("android:name","android:permission")){
    if(!e.hasAttribute(name))continue;
    boolean target=name.equals("android:permission")?tag.equals("receiver"):tag.equals("uses-permission")||tag.equals("action");
    String value=e.getAttribute(name);
    if(!target||!value.startsWith("com.google.android.c2dm."))continue;
    String routed=ProtocolRoutes.route(value);
    if(!routed.equals(value)){e.setAttribute(name,routed);changed++;}
   }
  }
  // uses-permission RECEIVE, receiver permission SEND and its RECEIVE action in the pinned 26.10 manifest.
  if(changed!=3)throw new IllegalStateException("Unexpected push manifest shape: "+changed);
 }
 private static void requireInput(PackageMetadata metadata){
  if(!"com.google.android.apps.maps".equals(metadata.getPackageName())||!"1068833407".equals(metadata.getVersionCode())||!"26.10.120001.E".equals(metadata.getVersionName()))throw new IllegalStateException("Exact original AAOS 26.10 input required");
  try{
   boolean match=false;
   for(var certificates:metadata.getSigningCertificates().values())for(var certificate:certificates){
    byte[] digest=MessageDigest.getInstance("SHA-256").digest(certificate.getEncoded());
    StringBuilder hex=new StringBuilder();for(byte b:digest)hex.append(String.format("%02x",b&255));
    if(SIGNERS.contains(hex.toString()))match=true;
   }
   if(!match)throw new IllegalStateException("Original Google AAOS signing certificate required; re-signed input rejected");
  }catch(IllegalStateException e){throw e;}catch(Exception e){throw new IllegalStateException("Cannot inspect original AAOS signing certificate",e);}
 }
 private static String string(Instruction ins){
  if((ins.getOpcode()==Opcode.CONST_STRING||ins.getOpcode()==Opcode.CONST_STRING_JUMBO)&&ins instanceof ReferenceInstruction&&((ReferenceInstruction)ins).getReference() instanceof StringReference)
   return ((StringReference)((ReferenceInstruction)ins).getReference()).getString();
  return null;
 }
 /** Checked on the immutable class: mutableClassDefBy makes Morphe rewrite the whole class. */
 private static boolean routed(ClassDef c){
  for(var m:c.getMethods()){
   if(m.getImplementation()==null)continue;
   for(var ins:m.getImplementation().getInstructions()){String s=string(ins);if(s!=null&&!s.equals(ProtocolRoutes.route(s)))return true;}
  }
  return false;
 }
 private static MutableMethod applicationOnCreate(BytecodePatchContext context){
  for(String type=APPLICATION;type!=null&&!type.equals("Landroid/app/Application;");){
   ClassDef c=context.classDefByOrNull(type);
   if(c==null)break;
   for(var m:c.getMethods())if(m.getName().equals("onCreate")&&m.getParameterTypes().isEmpty()&&m.getReturnType().equals("V")&&m.getImplementation()!=null)
    for(var mutable:context.mutableClassDefBy(c).getMethods())if(mutable.getName().equals("onCreate")&&mutable.getParameterTypes().isEmpty()&&mutable.getReturnType().equals("V"))return mutable;
   type=c.getSuperclass();
  }
  throw new IllegalStateException("Maps application onCreate not found above "+APPLICATION);
 }
 /** GoogleApiAvailability.showErrorNotification(Context,ConnectionResult): the only poster on the availability channel. */
 private static MutableMethod availabilityNotification(BytecodePatchContext context){
  String parameters="[Landroid/content/Context;, "+CONNECTION_RESULT+"]";MutableMethod found=null;
  for(var c:context.getAllClassesWithString(AVAILABILITY_CHANNEL)){
   if(c.getType().startsWith(OWN))continue;
   for(var m:c.getMethods()){
    if(!m.getReturnType().equals("V")||!m.getParameterTypes().toString().equals(parameters)||m.getImplementation()==null)continue;
    boolean channel=false;
    for(var ins:m.getImplementation().getInstructions())if(AVAILABILITY_CHANNEL.equals(string(ins)))channel=true;
    if(!channel)continue;
    if(found!=null)throw new IllegalStateException("Ambiguous availability notification: "+found+" and "+m);
    for(var mutable:context.mutableClassDefBy(c).getMethods())if(mutable.getName().equals(m.getName())&&mutable.getReturnType().equals("V")&&mutable.getParameterTypes().toString().equals(parameters))found=mutable;
   }
  }
  if(found==null)throw new IllegalStateException("Availability notification not found");
  return found;
 }
 /** The int read from p2 and compared with SERVICE_UPDATING (18) is ConnectionResult's error code. */
 private static FieldReference errorCode(MutableMethod m){
  var body=m.getImplementation();var list=body.getInstructions();int p2=body.getRegisterCount()-1;
  for(int i=0;i<list.size();i++){
   var ins=list.get(i);
   if(ins.getOpcode()!=Opcode.IGET||!(((ReferenceInstruction)ins).getReference() instanceof FieldReference))continue;
   var field=(FieldReference)((ReferenceInstruction)ins).getReference();
   if(!field.getDefiningClass().equals(CONNECTION_RESULT)||!field.getType().equals("I")||((TwoRegisterInstruction)ins).getRegisterB()!=p2)continue;
   int code=((TwoRegisterInstruction)ins).getRegisterA(),updating=-1;
   for(int j=i+1;j<Math.min(list.size(),i+6);j++){
    var next=list.get(j);
    if(next instanceof NarrowLiteralInstruction&&((NarrowLiteralInstruction)next).getNarrowLiteral()==18)updating=((OneRegisterInstruction)next).getRegisterA();
    if(updating>=0&&(next.getOpcode()==Opcode.IF_NE||next.getOpcode()==Opcode.IF_EQ)){
     int a=((TwoRegisterInstruction)next).getRegisterA(),b=((TwoRegisterInstruction)next).getRegisterB();
     if((a==code&&b==updating)||(a==updating&&b==code))return field;
    }
   }
   break;
  }
  throw new IllegalStateException("Cannot prove ConnectionResult error code field in "+m);
 }
 private static BytecodePatch create(){
  ResourcePatchBuilder resources=new ResourcePatchBuilder(null,null,false);
  resources.execute(context->{
   requireInput(context.getPackageMetadata());
   try{WheelResources.apply(context);}catch(Exception e){throw new IllegalStateException("Wheel key metadata resources failed",e);}
   try{VehicleIcon.apply(context);}catch(Exception e){throw new IllegalStateException("Vehicle icon resource failed",e);}
   try(var doc=context.document("AndroidManifest.xml")){
    isolateIdentity(doc);
    routePush(doc);
    Element app=(Element)doc.getElementsByTagName("application").item(0);
    Element queries=(Element)doc.getElementsByTagName("queries").item(0);
    if(queries==null){queries=doc.createElement("queries");doc.getDocumentElement().appendChild(queries);}
    Element query=doc.createElement("package");query.setAttribute("android:name","app.revanced.android.gms");queries.appendChild(query);
    // 54E: both AMap adapter package names, so AmapAdapter can see which one is installed (targetSdk 36).
    for(String name:List.of("com.google.android.apps.bard","com.google.android.googlequicksearchbox","com.byd.clusterdebug","com.autonavi.amapauto","com.byd.amapservice","com.example.amapservice")){
     boolean present=false;for(int i=0;i<queries.getChildNodes().getLength();i++)if(queries.getChildNodes().item(i) instanceof Element&&name.equals(((Element)queries.getChildNodes().item(i)).getAttribute("android:name")))present=true;
     if(!present){Element e=doc.createElement("package");e.setAttribute("android:name",name);queries.appendChild(e);}
    }
    NodeList activities=doc.getElementsByTagName("activity");boolean main=false;
    for(int i=0;i<activities.getLength();i++){Element a=(Element)activities.item(i);if(a.getAttribute("android:name").equals("com.google.android.maps.MapsActivity")){a.setAttribute("android:supportsPictureInPicture","true");a.setAttribute("android:resizeableActivity","true");main=true;}}
    if(!main)throw new IllegalStateException("Maps main Activity missing");
    Element vehicle=doc.createElement("provider");vehicle.setAttribute("android:name","local.maps.cluster.VehicleSampleProvider");
    vehicle.setAttribute("android:authorities","com.google.android.apps.maps.automotive.local.vehicle");
    vehicle.setAttribute("android:exported","true");vehicle.setAttribute("android:permission","android.permission.DUMP");
    vehicle.setAttribute("android:grantUriPermissions","false");app.appendChild(vehicle);
    VehicleManifest.apply(doc);
    WheelResources.manifest(doc);
    String[][] meta={{"app.revanced.android.gms.SPOOFED_PACKAGE_NAME","com.google.android.apps.maps"},{"app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE","38918a453d07199354f8b19af05ec6562ced5788"},{"app.revanced.MICROG_PACKAGE_NAME","app.revanced.android.gms"},{"app.revanced.android.gms.MICROG_PACKAGE_NAME","app.revanced.android.gms"}};
    for(String[] pair:meta){Element e=doc.createElement("meta-data");e.setAttribute("android:name",pair[0]);e.setAttribute("android:value",pair[1]);app.appendChild(e);}
   }catch(Exception e){throw new IllegalStateException("AAOS laboratory manifest failed",e);}
   return Unit.INSTANCE;
  });
  BytecodePatchBuilder patch=new BytecodePatchBuilder("Maps Automotive for BYD (MicroG-RE TEST)","Experimental TEST preview for original Maps Automotive 26.10.120001.E: MicroG-RE sign-in, cluster/HUD and optional read-only BYD EV data.",true);
  var knownBev=KnownBevOption.register(patch);
  patch.compatibleWith(new Compatibility("com.google.android.apps.maps","Maps Automotive 26.10 TEST",null,ApkFileType.APK_REQUIRED,(Integer)null,
   SIGNERS,
   List.of(new AppTarget("26.10.120001.E",1068833407,true,30,"Original AAOS ARM64 26.10.120001.E input"))));
  patch.dependsOn(resources.build$morphe_patcher());
  // The String overload resolves the resource through Morphe's own class loader, not this bundle's.
  patch.extendWith(()->{var stream=AutomotiveMicrogPatch.class.getClassLoader().getResourceAsStream(EXTENSION);if(stream==null)throw new IllegalStateException("Missing "+EXTENSION);return stream;});
  patch.execute(context->{
   requireInput(context.getPackageMetadata());
   // Port 26.10 phase B: API29, 3D and search run first, on the untouched original 26.10 input.
   if(PHASE_B){Api29Hooks.apply(context);Buildings3dHooks.apply(context);SearchAlignmentHooks.apply(context);}
   int routes=0,classes=0,gates=0;
   for(var source:context.getAllClassesWithStrings()){
    if(source.getType().startsWith(OWN)||!routed(source))continue;
    var c=context.mutableClassDefBy(source);classes++;
    for(var m:c.getMethods()){
     var body=m.getImplementation();
     if(body==null)continue;
     for(int i=body.getInstructions().size()-1;i>=0;i--){
      var ins=body.getInstructions().get(i);String old=string(ins);
      if(old==null)continue;
      String value=ProtocolRoutes.route(old);
      if(!old.equals(value)){body.replaceInstruction(i,new BuilderInstruction31c(Opcode.CONST_STRING_JUMBO,((OneRegisterInstruction)ins).getRegisterA(),new ImmutableStringReference(value)));routes++;}
     }
    }
   }
   // soz.l is GoogleApiAvailabilityLight.isGooglePlayServicesAvailable(Context,int): answer for MicroG-RE.
   for(var m:context.mutableClassDefBy("Lsoz;").getMethods())
    if(m.getName().equals("l")&&m.getParameterTypes().toString().equals("[Landroid/content/Context;, I]")&&m.getReturnType().equals("I")&&m.getImplementation()!=null){
     InstructionExtensions.INSTANCE.addInstructions(m,0,"invoke-static {p1}, "+PROVIDER+"->availability(Landroid/content/Context;)I\nmove-result v0\nreturn v0");gates++;
    }
   InstructionExtensions.INSTANCE.addInstruction(applicationOnCreate(context),0,"invoke-static {p0}, "+BOOTSTRAP+"->install(Landroid/app/Application;)V");
   // The guard dialog replaces Maps' Play Store prompt for provider errors; other errors still notify.
   var notification=availabilityNotification(context);
   InstructionExtensions.INSTANCE.addInstructions(notification,0,"iget v0, p2, "+errorCode(notification)+"\ninvoke-static {v0}, "+PROVIDER+"->suppressesNotification(I)Z\nmove-result v0\nif-eqz v0, :notify\nreturn-void\n:notify\nnop");
   ClusterHooks.location(context);
   ClusterHooks.apply(context);
   WheelZoomHooks.apply(context);
   if(PHASE_B)UiScaleHooks.apply(context);
   NavigationHooks.apply(context);
   VehicleEvHooks.apply(context);
   NavatarsHooks.apply(context);
   KnownBevOption.apply(context,knownBev.getValue());
   // Includes strings in the guarded availability body; fail if the upstream shape changes.
   if(routes<103||gates!=1)throw new IllegalStateException("Unexpected AAOS protocol shape: routes="+routes+", gates="+gates);
   System.out.println("AAOS lab routes="+routes+" in "+classes+" classes; provider guard="+gates+"; bootstrap=Application.onCreate; notification="+notification.getDefiningClass()+"->"+notification.getName());
   return Unit.INSTANCE;
  });
  return patch.build$morphe_patcher();
 }
}
