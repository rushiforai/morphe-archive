package xyz.urro.activityspoof

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val API = "Lxyz/urro/activityspoof/ApiHooks;"
private const val PI = "Landroid/app/PendingIntent;"
private const val OBJ = "Ljava/lang/Object;"
private const val INTENT = "Landroid/content/Intent;"
private const val TASK = "Lcom/google/android/gms/tasks/Task;"
private const val GMS = "Lcom/google/android/gms/"
private data class Adapter(val name:String,val signature:String,val static:Boolean=false,val owner:String=API,val result:String?=null)
private fun adapter(ref:MethodReference):Adapter? {
 if(ref.definingClass=="Landroid/app/PendingIntent;"&&ref.returnType==PI){
  val parameters=ref.parameterTypes.map{it.toString()}
  val plain=listOf("Landroid/content/Context;","I",INTENT,"I")
  val multiple=listOf("Landroid/content/Context;","I","[Landroid/content/Intent;","I")
  val name=when {
   ref.name=="getBroadcast"&&parameters==plain->"broadcast"
   ref.name=="getService"&&parameters==plain->"service"
   ref.name=="getForegroundService"&&parameters==plain->"foregroundService"
   ref.name=="getActivity"&&parameters==plain->"activity"
   ref.name=="getActivity"&&parameters==plain+"Landroid/os/Bundle;"->"activityOptions"
   ref.name=="getActivities"&&parameters==multiple->"activities"
   ref.name=="getActivities"&&parameters==multiple+"Landroid/os/Bundle;"->"activitiesOptions"
   else->null
  }
  if(name!=null)return Adapter(name,parameters.joinToString(""),true,"Lxyz/urro/activityspoof/CallbackFactories;",PI)
 }
 if(!ref.definingClass.startsWith(GMS)) return null
 val parameters=ref.parameterTypes.map{it.toString()}
 if(ref.returnType==TASK) when(ref.name){
  "requestActivityUpdates" -> if(parameters==listOf("J",PI))return Adapter("samplingRequest","${OBJ}J$PI")
  "requestActivityTransitionUpdates" -> if(parameters==listOf("Lcom/google/android/gms/location/ActivityTransitionRequest;",PI))return Adapter("transitionRequest","$OBJ$OBJ$PI")
  "removeActivityUpdates" -> if(parameters==listOf(PI))return Adapter("samplingRemove","$OBJ$PI")
  "removeActivityTransitionUpdates" -> if(parameters==listOf(PI))return Adapter("transitionRemove","$OBJ$PI")
 }
 if(ref.returnType=="Lcom/google/android/gms/common/api/PendingResult;")when(ref.name){
  "requestActivityUpdates" -> if(parameters==listOf("Lcom/google/android/gms/common/api/GoogleApiClient;","J",PI))return Adapter("legacyRequest","$OBJ${OBJ}J$PI")
  "removeActivityUpdates" -> if(parameters==listOf("Lcom/google/android/gms/common/api/GoogleApiClient;",PI))return Adapter("legacyRemove","$OBJ$OBJ$PI")
 }
 if(parameters==listOf(INTENT)){
  val family=when(ref.definingClass){
   "Lcom/google/android/gms/location/ActivityRecognitionResult;"->"sampling"
   "Lcom/google/android/gms/location/ActivityTransitionResult;"->"transition"
   else->return null
  }
  if(ref.name=="hasResult"&&ref.returnType=="Z")return Adapter(family+"Has",INTENT,true)
  if(ref.name=="extractResult"&&ref.returnType==ref.definingClass)return Adapter(family+"Result",INTENT,true)
 }
 return null
}
internal fun addEndpoint(root:Element,receiver:Boolean){
 val d=root.ownerDocument;val android="http://schemas.android.com/apk/res/android"
 fun Element.attr(key:String,value:String){setAttributeNS(android,"android:$key",value)}
 val app=d.getElementsByTagName("application").item(0) as Element
 val service=d.createElement("service");service.attr("name","xyz.urro.activityspoof.Endpoint");service.attr("exported","true")
 val filter=d.createElement("intent-filter");val action=d.createElement("action");action.attr("name",if(receiver)"xyz.urro.activityspoof.RECEIVER" else "xyz.urro.activityspoof.TRANSMITTER");filter.appendChild(action);service.appendChild(filter);app.appendChild(service)
 var queries=d.getElementsByTagName("queries").item(0) as? Element
 if(queries==null){queries=d.createElement("queries");root.appendChild(queries)}
 val intent=d.createElement("intent");val query=d.createElement("action");query.attr("name",if(receiver)"xyz.urro.activityspoof.TRANSMITTER" else "xyz.urro.activityspoof.RECEIVER");intent.appendChild(query);queries.appendChild(intent)
 if(receiver){
  val provider=d.createElement("provider");provider.attr("name","xyz.urro.activityspoof.ReceiverInit");provider.attr("exported","false");provider.attr("initOrder","2147483646");provider.attr("authorities",root.getAttribute("package")+".morphe.activityspoof.init");app.appendChild(provider)
  val recovery=d.createElement("receiver");recovery.attr("name","xyz.urro.activityspoof.RecoveryReceiver");recovery.attr("exported","false");app.appendChild(recovery)
 }
}
private val receiverResources=resourcePatch {
 execute { document("AndroidManifest.xml").use { addEndpoint(it.documentElement,true) } }
}

@Suppress("unused")
val physicalActivityReceiverPatch=bytecodePatch(
 name="Physical Activity spoof [RECEIVER]",
 description="Receives activity overrides from same-signer transmitters through standard Google Activity Recognition subscriptions. Supports sampling, transitions and legacy sampling; no app-specific hooks.",
 default=false
){
 dependsOn(receiverResources)
 extendWith("extensions/activity-spoof.mpe")
 execute {
  data class Site(val index:Int,val instruction:Instruction,val ref:MethodReference,val adapter:Adapter)
  var registrations=0;var modern=0;var results=0;var factories=0
  val targets=mutableListOf<Pair<String,String>>()
  classDefForEach { c ->
   if(!c.type.startsWith(GMS)&&!c.type.startsWith("Lxyz/urro/activityspoof/"))for(m in c.methods){
    if(m.implementation?.instructions?.any{val ref=(it as? ReferenceInstruction)?.reference as? MethodReference;ref!=null&&adapter(ref)!=null}==true) targets+=c.type to m.toString()
   }
  }
  for((type,signature) in targets){
   val method=mutableClassDefBy(type).methods.single{it.toString()==signature}
   val instructions=method.implementation!!.instructions.toList()
   val sites=instructions.withIndex().mapNotNull{(index,insn)->
    val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
    val match=adapter(ref) ?: return@mapNotNull null
    Site(index,insn,ref,match)
   }
   for(site in sites.asReversed()){
    val i=site.instruction
    val registers=when(i){
     is RegisterRangeInstruction -> "{v${i.startRegister} .. v${i.startRegister+i.registerCount-1}}"
     is FiveRegisterInstruction -> listOf(i.registerC,i.registerD,i.registerE,i.registerF,i.registerG).take(i.registerCount).joinToString(", ","{","}"){"v$it"}
     else -> error("Unsupported activity API invoke encoding")
    }
    val resultType=site.adapter.result ?: if(site.ref.returnType=="Z")"Z" else OBJ
    method.replaceInstruction(site.index,"invoke-static${if(i is RegisterRangeInstruction)"/range" else ""} $registers, ${site.adapter.owner}->${site.adapter.name}(${site.adapter.signature})$resultType")
    if(resultType==OBJ&&site.index+1<instructions.size&&instructions[site.index+1].opcode==Opcode.MOVE_RESULT_OBJECT){
     val r=(instructions[site.index+1] as OneRegisterInstruction).registerA
     method.addInstructions(site.index+2,"check-cast v$r, ${site.ref.returnType}")
    }
    if(site.adapter.name.endsWith("Request")){registrations++;if(!site.adapter.name.startsWith("legacy"))modern++}
    else if(site.adapter.name.endsWith("Result"))results++
    if(site.adapter.result==PI)factories++
   }
  }
  check(registrations>0&&results>0){"No supported Activity Recognition subscription/result API boundary found. Native/custom detectors and fully removed SDK boundaries are unsupported."}
  check(modern==0||classDefByOrNull("Lcom/google/android/gms/tasks/OnSuccessListener;")!=null){"Google Task listener API was removed or renamed by optimization"}
  println("Activity receiver: $registrations registration, $results result and $factories callback-factory call sites patched; no package-specific hooks")
 }
}

internal val transmitterResources=resourcePatch { execute { document("AndroidManifest.xml").use { addEndpoint(it.documentElement,false) } } }
