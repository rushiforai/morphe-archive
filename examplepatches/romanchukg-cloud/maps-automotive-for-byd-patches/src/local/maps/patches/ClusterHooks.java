// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import java.util.*;
import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.util.proxy.mutableTypes.*;
import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import com.android.tools.smali.dexlib2.builder.*;
import com.android.tools.smali.dexlib2.builder.instruction.*;
import com.android.tools.smali.dexlib2.immutable.*;
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference;

/** Pinned 26.10 insertion rules. No upstream method bodies are distributed. */
final class ClusterHooks {
 private static final String C="Llocal/maps/cluster/",NATIVE="Lcom/google/android/apps/gmm/car/embedded/auxiliarymap/EmbeddedClusterActivity;";
 private static final InstructionExtensions ASM=InstructionExtensions.INSTANCE;
 /** Api29Hooks.fingerprint of the original 26.10 Lxay;->b()Lagvt; (navigation viewport). */
 static final String NAV_VIEWPORT_PIN="f6d523c827736cf02ee0fabe434b340f47a7579e8b76a69d8ca4a277bea78ea7";
 static void branchBlock(MutableMethod method,int index,String code){ASM.addInstructionsWithLabels(method,index,code);}
 private static MutableMethod method(BytecodePatchContext c,String type,String name,String descriptor){
  MutableMethod found=null;
  for(var m:c.mutableClassDefBy(type).getMethods()){
   StringBuilder d=new StringBuilder("(");for(var p:m.getParameterTypes())d.append(p);d.append(')').append(m.getReturnType());
   if(m.getName().equals(name)&&d.toString().equals(descriptor)){if(found!=null)throw new IllegalStateException("Ambiguous "+type+name);found=m;}
  }
  if(found==null||found.getImplementation()==null)throw new IllegalStateException("Missing pinned hook "+type+name+descriptor);return found;
 }
 private static void registers(MutableMethod m,int count){if(m.getImplementation().getRegisterCount()!=count)throw new IllegalStateException("Register schema changed: "+m);}
 private static String ref(Instruction i){return i instanceof ReferenceInstruction?((ReferenceInstruction)i).getReference().toString():"";}
 private static int returns(MutableMethod m,String code){
  int n=0;var body=m.getImplementation();for(int i=body.getInstructions().size()-1;i>=0;i--)if(body.getInstructions().get(i).getOpcode()==Opcode.RETURN_VOID){ASM.addInstructions(m,i,code);n++;}return n;
 }
 private static void oneReturn(MutableMethod m,String code){if(returns(m,code)!=1)throw new IllegalStateException("Expected one normal exit: "+m);}
 /** Preserve old encoded register coordinates while parameters move up one slot.
  * Copy low to high; the highest new register retains the last object parameter.
  */
 private static MutableMethod expand(BytecodePatchContext ctx,String type,MutableMethod m){
  var old=m.getImplementation();int units=(m.getAccessFlags()&AccessFlags.STATIC.getValue())==0?1:0;
  List<String> types=new ArrayList<>();if(units==1)types.add(type);
  for(var p:m.getParameterTypes()){String s=p.toString();types.add(s);units+=s.equals("J")||s.equals("D")?2:1;}
  var body=new MutableMethodImplementation(new ImmutableMethodImplementation(old.getRegisterCount()+1,old.getInstructions(),old.getTryBlocks(),old.getDebugItems()));
  int target=old.getRegisterCount()-units,index=0;
  for(String t:types){Opcode opcode=t.equals("J")||t.equals("D")?Opcode.MOVE_WIDE_FROM16:t.startsWith("L")||t.startsWith("[")?Opcode.MOVE_OBJECT_FROM16:Opcode.MOVE_FROM16;body.addInstruction(index++,new BuilderInstruction22x(opcode,target,target+1));target+=t.equals("J")||t.equals("D")?2:1;}
  var changed=new MutableMethod(new ImmutableMethod(m.getDefiningClass(),m.getName(),m.getParameters(),m.getReturnType(),m.getAccessFlags(),m.getAnnotations(),m.getHiddenApiRestrictions(),body));
  var c=ctx.mutableClassDefBy(type);var all=c.getMethods();var direct=c.getDirectMethods();var virtual=c.getVirtualMethods();
  boolean wasDirect=direct.remove(m);virtual.remove(m);all.remove(m);all.add(changed);if(wasDirect)direct.add(changed);else virtual.add(changed);
  return changed;
 }
 /** Exit hook that needs `this` in a constructor whose p0 R8 may reuse before the exit
  * (26.10 igr.<init>: p0=v0 becomes const 3 before return-void; 54A failed ART verification).
  * One extra top register keeps `this`, copied right after the super constructor, so the hook
  * still runs after full construction (as in 26.09) and reads no register the original writes.
  */
 private static void exitWithThis(BytecodePatchContext ctx,String type,MutableMethod m,String hook){
  if(!m.getName().equals("<init>")||(m.getAccessFlags()&AccessFlags.STATIC.getValue())!=0)throw new IllegalStateException("Constructor expected: "+m);
  // The new top register equals the old register count, so no original instruction can address it.
  int top=m.getImplementation().getRegisterCount();String parent=ctx.mutableClassDefBy(type).getSuperclass();
  m=expand(ctx,type,m);var list=m.getImplementation().getInstructions();int init=-1,exits=0;
  for(int i=0;i<list.size();i++){var ins=list.get(i);
   if(ins.getOpcode()==Opcode.INVOKE_DIRECT&&ref(ins).startsWith(parent+"-><init>(")&&((FiveRegisterInstruction)ins).getRegisterC()==0){if(init>=0)throw new IllegalStateException("Ambiguous super constructor: "+m);init=i;}
   if(ins.getOpcode()==Opcode.RETURN_VOID&&init<0)throw new IllegalStateException("Exit before super constructor: "+m);
  }
  if(init<0)throw new IllegalStateException("Super constructor call missing: "+m);
  m.getImplementation().addInstruction(init+1,new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16,top,0));
  for(int i=list.size()-1;i>init;i--)if(list.get(i).getOpcode()==Opcode.RETURN_VOID){ASM.addInstructions(m,i,"invoke-static/range {v"+top+" .. v"+top+"}, "+hook);exits++;}
  if(exits!=1)throw new IllegalStateException("Expected one normal exit: "+m);
 }
 private static void adjustReturns(MutableMethod m,int owner,String hook){
  int n=0;var body=m.getImplementation();
  for(int i=body.getInstructions().size()-1;i>=0;i--){var ins=body.getInstructions().get(i);if(ins.getOpcode()!=Opcode.RETURN_OBJECT)continue;int point=((OneRegisterInstruction)ins).getRegisterA();ASM.addInstructions(m,i,"invoke-static {v"+owner+", v"+point+"}, "+C+"PointerHooks;->"+hook+"(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object v"+point+"\ncheck-cast v"+point+", Lutn;");n++;}
  if(n!=1)throw new IllegalStateException("Expected one anchor return: "+m);
 }
 static void navigationViewport(MutableMethod m){
  if(!m.getDefiningClass().equals("Lxay;")||!Api29Hooks.descriptor(m).equals("b()Lagvt;")
     ||!Api29Hooks.fingerprint(m).equals(NAV_VIEWPORT_PIN))throw new IllegalStateException("Navigation viewport original fingerprint mismatch");
  registers(m,22);int count=0;
  for(int i=m.getImplementation().getInstructions().size()-1;i>=0;i--){var ins=m.getImplementation().getInstructions().get(i);if(ins.getOpcode()!=Opcode.RETURN_OBJECT)continue;
   int point=((OneRegisterInstruction)ins).getRegisterA();if(point!=0)throw new IllegalStateException("Navigation viewport return register changed");
   // p0 is v21 in the 22-register 26.10 body (it was v22 in 26.09).
   m.getImplementation().replaceInstruction(i,new BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16,1,21));
   ASM.addInstructions(m,i+1,"invoke-static {v1, v0}, "+C+"PointerHooks;->adjustNavigationViewport(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object v0\ncheck-cast v0, Lagvt;\nreturn-object v0");count++;
  }
  if(count!=1)throw new IllegalStateException("Navigation viewport returns changed");
 }
 static void apply(BytecodePatchContext ctx){
  // These are not authorization hooks: native sii/account/token implementations are retained.
  var m=method(ctx,"Lfjq;","attachBaseContext","(Landroid/content/Context;)V");
  ASM.addInstruction(m,0,"invoke-static/range {p1 .. p1}, "+C+"PatchBootstrap;->attach(Landroid/content/Context;)V");
  m=method(ctx,"Ligr;","<init>","(Landroid/content/Context;Lgbd;Lalme;Lalme;Ljava/util/concurrent/ScheduledExecutorService;Lalme;Llfi;Laokl;)V");registers(m,9);
  exitWithThis(ctx,"Ligr;",m,C+"ClusterHost;->registerViewportCandidate(Ljava/lang/Object;)V");
  m=method(ctx,"Lwhf;","<init>","(Ljava/util/concurrent/Executor;)V");oneReturn(m,"invoke-static {p0}, "+C+"BydGuidance;->registerSource(Ljava/lang/Object;)V");
  m=method(ctx,"Liio;","<init>","(Ladpa;Lamgu;Lqhn;Lfuc;Lteu;)V");oneReturn(m,"invoke-static/range {p0 .. p0}, "+C+"ReportButtonRecovery;->register(Ljava/lang/Object;)V");
  // GnpSdk/Chime registration and device-info requests take the package name from Context.getPackageName();
  // use the sign-in identity instead, or Google rejects the car (INVALID_ARGUMENT). 7 pinned reads.
  {int sites=0;for(String[] site:new String[][]{{"Lzdd;","h","(Lyuy;Z)Lajsv;","1"},{"Lzdd;","d","(Lyuy;)Lajqf;","2"},{"Lzdd;","f","(Lyuy;Laodp;)Ljava/lang/Object;","1"},{"Lzdd;","g","(Lyuy;Laodp;)Ljava/lang/Object;","2"},{"Lyyz;","a","(Lyyq;)Lytt;","1"}}){
   m=method(ctx,site[0],site[1],site[2]);var list=m.getImplementation().getInstructions();int here=0;
   for(int i=list.size()-2;i>=0;i--){if(!ref(list.get(i)).equals("Landroid/content/Context;->getPackageName()Ljava/lang/String;"))continue;var next=list.get(i+1);
    if(next.getOpcode()!=Opcode.MOVE_RESULT_OBJECT)throw new IllegalStateException("GnpSdk package read changed: "+m);int r=((OneRegisterInstruction)next).getRegisterA();
    ASM.addInstructions(m,i+2,"invoke-static/range {v"+r+" .. v"+r+"}, "+C+"ChimeIdentity;->chimePackage(Ljava/lang/String;)Ljava/lang/String;\nmove-result-object v"+r);here++;}
   if(here!=Integer.parseInt(site[3]))throw new IllegalStateException("Expected "+site[3]+" GnpSdk package reads in "+m+", found "+here);sites+=here;}
   if(sites!=7)throw new IllegalStateException("Expected seven GnpSdk package reads");}
  // "Send to car" trips arrive as maps.app.goo.gl links; ShortLinks expands them instead of MicroG-RE Dynamic Links.
  m=method(ctx,"Lhyk;","b","(Landroid/content/Intent;Landroid/net/Uri;)Z");registers(m,27);
  branchBlock(m,0,"invoke-static/range {p1 .. p1}, "+C+"ShortLinks;->intercept(Landroid/content/Intent;)Z\nmove-result v0\nif-eqz v0, :stock\nconst/4 v0, 0x1\nreturn v0\n:stock\nnop");
  m=method(ctx,"Lmd;","onUserLeaveHint","()V");ASM.addInstruction(m,0,"invoke-static {p0}, "+C+"ClusterSettings;->leavingMaps(Landroid/app/Activity;)V");
  m=method(ctx,NATIVE,"kW","()Landroid/content/Context;");int count=0;
  for(int i=m.getImplementation().getInstructions().size()-1;i>=0;i--){var ins=m.getImplementation().getInstructions().get(i);if(ins.getOpcode()!=Opcode.RETURN_OBJECT)continue;int r=((OneRegisterInstruction)ins).getRegisterA();ASM.addInstructions(m,i,"invoke-static {v"+r+"}, "+C+"ClusterHost;->clusterContext(Landroid/content/Context;)Landroid/content/Context;\nmove-result-object v"+r);count++;}
  // 26.10 R8 merged the two exits of 26.09 into one return-object that both paths reach.
  if(count!=1)throw new IllegalStateException("Native cluster context returns changed");
  for(String name:List.of("j","k")){
   m=method(ctx,"Ligr;",name,"(Lign;Ligk;)V");registers(m,5);
   branchBlock(m,0,"invoke-static {p0, p1}, "+C+"ClusterHost;->ignoreRouteCardViewport(Ljava/lang/Object;Ljava/lang/Object;)Z\nmove-result v0\nif-eqz v0, :stock\nreturn-void\n:stock\nnop");
  }
  m=method(ctx,"Ligr;","f","()Lutn;");registers(m,1);m=expand(ctx,"Ligr;",m);adjustReturns(m,1,"adjust");
  // 26.09 dba.k: R8 moved this static camera-anchor helper into fzg.
  m=method(ctx,"Lfzg;","c","(FLigp;)Lutn;");registers(m,8);m=expand(ctx,"Lfzg;",m);adjustReturns(m,8,"adjustCamera");
  m=method(ctx,"Ligr;","r","()V");registers(m,21);count=0;
  for(int i=m.getImplementation().getInstructions().size()-1;i>=0;i--){var ins=m.getImplementation().getInstructions().get(i);if(ins.getOpcode()==Opcode.MOVE_OBJECT_FROM16&&((TwoRegisterInstruction)ins).getRegisterA()==16&&((TwoRegisterInstruction)ins).getRegisterB()==3){ASM.addInstructions(m,i,"invoke-static {v0, v3}, "+C+"PointerHooks;->adjust(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\nmove-result-object v3\ncheck-cast v3, Lutn;");count++;}}
  if(count!=1)throw new IllegalStateException("Viewport anchor dispatch changed");
  m=method(ctx,"Ljdz;","run","()V");registers(m,10);int holders=0,anchors=0;
  for(int i=m.getImplementation().getInstructions().size()-1;i>=0;i--){var ins=m.getImplementation().getInstructions().get(i);String reference=ref(ins);
   if(reference.equals("Laefr;->d:Ljava/lang/Object;")){ASM.addInstruction(m,i,"iget-object v5, p0, Laefr;->c:Ljava/lang/Object;");holders++;}
   if(reference.equals("Luop;->c:F")||reference.equals("Lutn;->c:F")){ASM.addInstructions(m,i+1,"invoke-static {v5, v3}, "+C+"ClusterHost;->applyClusterPointerY(Ljava/lang/Object;F)F\nmove-result v3");anchors++;}
  }
  if(holders!=2||anchors!=2)throw new IllegalStateException("Live anchor callbacks changed");
  // Native route-following camera bypasses fzg.c/utn. Retain its native container,
  // modifying only the cluster's vertical offset through the pure runtime helper.
  navigationViewport(method(ctx,"Lxay;","b","()Lagvt;"));
  m=method(ctx,"Lgdh;","b","(Lafnk;)Lgde;");registers(m,15);count=0;
  // afne.b is MAP_AND_NAVIGATION_STATE, the same constant as 26.09 afpa.b.
  for(int i=m.getImplementation().getInstructions().size()-1;i>=0;i--)if(ref(m.getImplementation().getInstructions().get(i)).equals("Lgde;-><init>(ZLafne;ZZLlfh;ILafmy;Lafnb;)V")){
   branchBlock(m,i,"invoke-static {}, "+C+"ClusterHost;->nativeClusterActive()Z\nmove-result v0\nif-eqz v0, :stock\nsget-object v6, Lafne;->b:Lafne;\ninvoke-static {}, "+C+"ClusterHost;->nativeNight()Z\nmove-result v7\nmove v8, v7\n:stock\nnop");count++;
  }
  if(count!=1)throw new IllegalStateException("Cluster OEM options changed");
  m=method(ctx,"Lnys;","i","(Z)V");registers(m,15);count=0;
  for(int i=m.getImplementation().getInstructions().size()-1;i>=0;i--)if(ref(m.getImplementation().getInstructions().get(i)).equals("Laccm;->p(Ljava/lang/Iterable;)Labrd;")){
   // Native empty-override and loop exits branch directly to this instruction.
   // Keep those labels on our hook; inserting before it leaves those paths unhooked.
   m.getImplementation().replaceInstruction(i,new BuilderInstruction35c(Opcode.INVOKE_STATIC,2,13,6,0,0,0,new ImmutableMethodReference(C+"ClusterHost;","configureClusterLayers",List.of("Ljava/lang/Object;","Ljava/util/Set;"),"V")));
   ASM.addInstruction(m,i+1,"invoke-static {v6}, Laccm;->p(Ljava/lang/Iterable;)Labrd;");count++;
  }
  if(count!=1)throw new IllegalStateException("Cluster renderer layers changed");
  System.out.println("Cluster hooks: bootstrap attach, viewport/card/anchor, native context/theme/layers, guidance, PiP, incident recovery");
 }
 static void location(BytecodePatchContext ctx){
  String action="com.google.android.location.internal.GoogleLocationManagerService.START";int count=0;
  for(var c:ctx.getAllClassesWithString(action)){
   if(c.getType().startsWith("Llocal/"))continue;
   for(var source:c.getMethods()){
    if(!source.getReturnType().equals("Ljava/lang/String;")||!source.getParameterTypes().isEmpty()||source.getImplementation()==null)continue;
    var instructions=new ArrayList<Instruction>();for(var i:source.getImplementation().getInstructions())instructions.add(i);
    if(instructions.size()!=2||!(instructions.get(0) instanceof ReferenceInstruction)||!ref(instructions.get(0)).equals(action)||instructions.get(1).getOpcode()!=Opcode.RETURN_OBJECT)continue;
    var m=method(ctx,c.getType(),source.getName(),"()Ljava/lang/String;");int r=((OneRegisterInstruction)instructions.get(1)).getRegisterA();
    m.getImplementation().replaceInstruction(0,new BuilderInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,new ImmutableMethodReference(C+"MicrogProvider;","locationAction",List.of(),"Ljava/lang/String;")));
    m.getImplementation().addInstruction(1,new BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT,r));count++;
   }
  }
  if(count!=2)throw new IllegalStateException("Location action getters changed: "+count);
  System.out.println("Location action: two native getters use installed provider alias selection");
 }
}
