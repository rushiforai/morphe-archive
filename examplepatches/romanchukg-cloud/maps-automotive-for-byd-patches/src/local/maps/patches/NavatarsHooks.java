// SPDX-License-Identifier: GPL-3.0-only
package local.maps.patches;

import app.morphe.patcher.patch.BytecodePatchContext;
import app.morphe.patcher.extensions.InstructionExtensions;
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod;

/** Maps' Navatars (custom 3D chevron in navigation) from the bundled local files only.
 * hpq.aa: server switch (akvq.O) for the NavatarDisplayer -> on.
 * mug.c: model selection deletes app_customchevron files and downloads the model again -> report done.
 * mug.e: downloads the server manifest over manifest_N.json (a missing model then wipes the folder) ->
 * load only the local manifest_N.json. uxp.j: log the FBX animation (idle/drive/turnleft/turnright).
 * Navatars.installEarly puts the bundled model and Maps' custom_chevron_* settings in place. */
final class NavatarsHooks {
 private static final String C="Llocal/maps/cluster/Navatars;";
 private static final String FUTURE="Lcom/google/common/util/concurrent/ListenableFuture;";

 static void apply(BytecodePatchContext context){
  InstructionExtensions asm=InstructionExtensions.INSTANCE;
  asm.addInstructions(method(context,"Lhpq;","aa","()Z"),0,
   "invoke-static {}, "+C+"->enabled()Z\nmove-result p0\nreturn p0");
  asm.addInstructions(method(context,"Lmug;","c","(Lmuy;Ljava/lang/String;IZ)Labbw;"),0,
   "invoke-static {p1}, "+C+"->keepLocalModel(Ljava/lang/Object;)V\n"+
   "sget-object v0, Laddf;->a:"+FUTURE+"\n"+
   "invoke-static {v0}, Labbw;->f("+FUTURE+")Labbw;\nmove-result-object v0\nreturn-object v0");
  asm.addInstructions(method(context,"Lmug;","e","(I)Labbw;"),0,
   "invoke-static {p0, p1}, "+C+"->loadLocalManifest(Ljava/lang/Object;I)V\n"+
   "sget-object v0, Laddf;->a:"+FUTURE+"\n"+
   "invoke-static {v0}, Labbw;->f("+FUTURE+")Labbw;\nmove-result-object v0\nreturn-object v0");
  asm.addInstructions(method(context,"Luxp;","j","(Ljava/lang/String;)V"),0,
   "invoke-static {p1}, "+C+"->animation(Ljava/lang/String;)V");
 }

 private static MutableMethod method(BytecodePatchContext c,String type,String name,String descriptor){
  MutableMethod found=null;
  for(var m:c.mutableClassDefBy(type).getMethods()){
   StringBuilder d=new StringBuilder("(");for(var p:m.getParameterTypes())d.append(p);d.append(')').append(m.getReturnType());
   if(m.getName().equals(name)&&d.toString().equals(descriptor)){if(found!=null)throw new IllegalStateException("Ambiguous "+type+name);found=m;}
  }
  if(found==null||found.getImplementation()==null)throw new IllegalStateException("Missing pinned hook "+type+name+descriptor);
  return found;
 }
 private NavatarsHooks(){}
}
