package util
import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.flow.collect
import xyz.urro.transit.transitBikeModePatch
import xyz.urro.transit.transitMotionCuesPatch
import xyz.urro.transit.transitMapsApiKeyPatch
import java.io.File
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/** Offline, private fixture validation. Never installs or launches an app. */
fun main(args:Array<String>)=runBlocking {
 require(args.size==2){"source base.apk and isolated output directory required"}
 val dir=File(args[1]);check(!dir.exists()){ "Refusing to overwrite prior validation" };dir.mkdirs()
 Patcher(PatcherConfig(File(args[0]),dir)).use { p ->
  // Assembled at runtime so no key-shaped constant is compiled into the published bundle.
  val prefix=listOf("A","I","z","a").joinToString("")
  val testKey=prefix+"Sy"+"0".repeat(33)
  val keyShape=Regex(Regex.escape(prefix)+"[0-9A-Za-z_-]{35}")
  fun keysIn(bytes:ByteArray)=listOf(bytes,bytes.copyOfRange(1,bytes.size)).flatMap{b->listOf(Charsets.UTF_8,Charsets.UTF_16LE).flatMap{cs->keyShape.findAll(String(b,cs)).map{it.value}.toList()}}.toSet()
  val originalKeys=java.util.zip.ZipFile(File(args[0])).use{z->keysIn(z.getInputStream(z.getEntry("AndroidManifest.xml")).readBytes())}
  check(originalKeys.isNotEmpty()){"Fixture has no Maps key entry"}
  transitMapsApiKeyPatch.options["transitMapsApiKey"]=testKey
  p += setOf(transitBikeModePatch,transitMotionCuesPatch,transitMapsApiKeyPatch)
  p().collect { r -> check(r.exception==null){"Patch failed: ${r.exception}"};println("Applied ${r.patch.name}") }
  val result=p.get()
  for(d in result.dexFiles){File(dir,d.name).outputStream().use{out->d.stream.use{it.copyTo(out)}}}
  val expected=mapOf(
   "Lcom/thetransitapp/droid/shared/TransitApp;->onCreate" to "init",
   "Lcom/thetransitapp/droid/shared/service/ViperModuleProtocolService\$getModelFlow\$1\$callback\$1;->onResponse" to "onModel",
   "Lcom/thetransitapp/droid/shared/service/GoService;->a" to "notification",
   "Lcom/thetransitapp/droid/shared/service/GoService;->onStartCommand" to "serviceCommand",
   "Ltr5;->onDestroy" to "serviceDestroyed",
   "Ldjinni/java/src/GOLiveActivityInstruction;->getMainInstruction" to "mark",
   "Ldjinni/java/src/TripDetailsBigInstructionCard;->getMainInstruction" to "mark",
   "Lcom/thetransitapp/droid/shared/util/e;->e" to "text",
   "Lcom/thetransitapp/droid/shared/util/e;->d" to "styled",
   "Ldjinni/java/src/ProfileBottomSheet;->getComponents" to "decorate",
   "Lcom/thetransitapp/droid/shared/view_model/d;->f" to "action")
  val found=mutableSetOf<String>()
  val classes=mutableSetOf<String>()
  val definitions=mutableSetOf<String>()
  val parents=mutableMapOf<String,String?>()
  val references=mutableSetOf<String>()
  for(file in dir.listFiles()!!.filter{it.extension=="dex"}){
   val dex=DexFileFactory.loadDexFile(file,Opcodes.forApi(37))
   for(c in dex.classes){
    check(classes.add(c.type)){"Duplicate DEX class: ${c.type}"}
    parents[c.type]=c.superclass
    for(m in c.methods){
    definitions.add(c.type+"->"+m.name+"("+m.parameterTypes.joinToString("")+")"+m.returnType)
    m.implementation?.instructions?.forEach{instruction ->
     val ref=(instruction as? ReferenceInstruction)?.reference as? MethodReference
     if(ref!=null && ref.definingClass.startsWith("Lxyz/urro/transit/"))references.add(ref.definingClass+"->"+ref.name+"("+ref.parameterTypes.joinToString("")+")"+ref.returnType)
    }
    val key=c.type+"->"+m.name; val wanted=expected[key]?:continue
    check(m.implementation?.instructions?.any{
     val ref=(it as? ReferenceInstruction)?.reference as? MethodReference
     ref?.definingClass==(when(wanted){"notification"->"Lxyz/urro/transit/LiveReminders;";"serviceCommand","serviceDestroyed"->"Lxyz/urro/transit/GoActivityTransmitter;";"onModel"->"Lxyz/urro/transit/GoModelDiagnostics;";else->"Lxyz/urro/transit/TransitHooks;"}) && ref.name==wanted
    }==true){"Independent DEX read: missing hook $key -> $wanted"}
    // Regression: an injected hook must read the parameter it was written for, not a register
    // the original method already reused (the dev.1/dev.2 settings hook received its own list).
    val live=mapOf("serviceDestroyed" to listOf(0),"serviceCommand" to listOf(1),"init" to listOf(0),"onModel" to listOf(1),"notification" to listOf(0,1),"text" to listOf(0),
     "styled" to listOf(0,1),"decorate" to listOf(0),"action" to listOf(1),"mark" to emptyList<Int>())
    val impl=m.implementation!!;val insns=impl.instructions.toList()
    val words=(if(AccessFlags.STATIC.isSet(m.accessFlags))0 else 1)+m.parameterTypes.sumOf{if(it.toString()=="J"||it.toString()=="D")2 else 1}
    val firstParam=impl.registerCount-words
    insns.forEachIndexed{idx,insn->
     val ref=(insn as? ReferenceInstruction)?.reference as? MethodReference
     if(ref!=null&&ref.definingClass.startsWith("Lxyz/urro/transit/")&&ref.name==wanted){
      for(off in live.getValue(wanted)){
       val reg=firstParam+off
       for(k in 0 until idx){
        val w=insns[k] as? OneRegisterInstruction ?: continue
        val op=insns[k].opcode
        check(!(op.setsRegister()&&(w.registerA==reg||(op.setsWideRegister()&&w.registerA+1==reg)))){
         "Hook $key -> $wanted reads p$off (v$reg) after instruction $k (${op.name}) overwrote it"}
       }
      }
     }
    }
    found.add(key)
   }
   }
  }
  val androidJar=File(System.getenv("ANDROID_HOME"),"platforms/android-34/android.jar")
  check(androidJar.isFile){"SDK API definitions are required for inherited-method checks"}
  java.net.URLClassLoader(arrayOf(androidJar.toURI().toURL()),ClassLoader.getSystemClassLoader()).use { loader ->
   fun descriptor(c:Class<*>):String = when(c){
    java.lang.Void.TYPE->"V";java.lang.Boolean.TYPE->"Z";java.lang.Byte.TYPE->"B";java.lang.Character.TYPE->"C";java.lang.Short.TYPE->"S";java.lang.Integer.TYPE->"I";java.lang.Long.TYPE->"J";java.lang.Float.TYPE->"F";java.lang.Double.TYPE->"D";
    else->if(c.isArray)c.name.replace('.', '/') else "L"+c.name.replace('.', '/')+";"
   }
   fun external(type:String,signature:String):Boolean = try{
    val c=Class.forName(type.substring(1,type.length-1).replace('/','.'),false,loader)
    (c.methods.toList()+c.declaredMethods.toList()).any { method ->
     (java.lang.reflect.Modifier.isPublic(method.modifiers)||java.lang.reflect.Modifier.isProtected(method.modifiers)) &&
     method.name+"("+method.parameterTypes.joinToString(""){descriptor(it)}+")"+descriptor(method.returnType)==signature
    }
   }catch(e:ReflectiveOperationException){false}catch(e:LinkageError){false}
   check(external("Landroid/app/Activity;","finish()V"))
   check(!external("Landroid/app/Activity;","notAnAndroidMethod()V")){"External resolver accepted an invalid method"}
   val unresolved=references.filter { ref ->
    if(ref in definitions)false else {
     val signature=ref.substringAfter("->");var type:String?=parents[ref.substringBefore("->")];var resolved=false
     while(type!=null && !resolved){
      if(type+"->"+signature in definitions){resolved=true;break}
      if(type in parents)type=parents[type] else {resolved=external(type,signature);break}
     }
     !resolved
    }
   }
   check(unresolved.isEmpty()){"Undefined extension methods after DEX/SDK hierarchy resolution: $unresolved"}
  }
  for(feature in listOf("enableBike","enableActivity"))
   check(references.any{it.startsWith("Lxyz/urro/transit/TransitHooks;->$feature(")}){"Feature switch not injected: $feature"}
  val resApk=result.resources?.resourcesApk
  check(resApk!=null&&resApk.isFile){"Personal Maps API key: no rebuilt resources"}
  java.util.zip.ZipFile(resApk).use{z->
   val manifest=z.getInputStream(z.getEntry("AndroidManifest.xml")).readBytes()
   val rebuilt=keysIn(manifest)
   check(testKey in rebuilt){"Personal Maps API key not present in rebuilt manifest"}
   check(rebuilt.intersect(originalKeys).isEmpty()){"Original Maps key still present"}
  }
  File(dir,"DEX_LINK_VERIFICATION.txt").writeText("Unique classes: ${classes.size}\nResolved extension references: ${references.size}\n")
  check(found==expected.keys){"Missing patched methods: ${expected.keys-found}"}
  File(dir,"HOOK_VERIFICATION.txt").writeText(found.sorted().joinToString("\n"))
  println("PASS: compiled ${result.dexFiles.size} DEX outputs; independently verified ${found.size} hook methods; device functionality untested")
 }
}
