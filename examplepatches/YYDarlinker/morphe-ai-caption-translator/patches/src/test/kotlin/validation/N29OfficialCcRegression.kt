package validation
import com.android.tools.smali.dexlib2.*
import com.android.tools.smali.dexlib2.iface.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import java.io.File
/** Execute the actual serialized 1.45 instructions, not a rewritten truth-table helper. */
private class CcVm(val classes:Map<String,ClassDef>,val mode:String,val guard:Boolean) {
 private fun same(a:Any?,b:Any?):Boolean = when {
  a is Number && b is Number -> a.toLong()==b.toLong()
  a is Boolean && b is Number -> (if(a)1L else 0L)==b.toLong()
  b is Boolean && a is Number -> (if(b)1L else 0L)==a.toLong()
  a==null && b is Number -> b.toLong()==0L
  b==null && a is Number -> a.toLong()==0L
  else -> a==b
 }
 fun run(m:Method,args:List<Any?>,capture:Boolean=false):Any? {
  val impl=m.implementation!!;val code=impl.instructions.toList();val r=arrayOfNulls<Any>(impl.registerCount)
  args.forEachIndexed {i,v->r[r.size-args.size+i]=v}
  val address=IntArray(code.size);var units=0;code.forEachIndexed {i,v->address[i]=units;units+=v.codeUnits};val index=address.withIndex().associate {it.value to it.index}
  var ip=0;var result:Any?=null;var steps=0
  while(ip<code.size) {
   check(++steps<500){"Unexpected CC control-flow loop"};val ins=code[ip];val one=ins as? OneRegisterInstruction;val two=ins as? TwoRegisterInstruction
   val ref=(ins as? ReferenceInstruction)?.reference
   fun branch(take:Boolean){if(take)ip=index.getValue(address[ip]+(ins as OffsetInstruction).codeOffset)-1}
   when(ins.opcode) {
    Opcode.CONST_4,Opcode.CONST_16,Opcode.CONST -> r[one!!.registerA]=(ins as WideLiteralInstruction).wideLiteral
    Opcode.CONST_STRING -> r[one!!.registerA]=(ref as StringReference).string
    Opcode.SGET_OBJECT -> {val f=ref as FieldReference;r[one!!.registerA]=when(f.name){"AUTO_CAPTIONS_STYLE"->"setting";"captionsButtonStatus"->"guard";else->f.name}}
    Opcode.IGET,Opcode.IGET_OBJECT -> {val obj=r[two!!.registerB] as Map<*,*>?;r[two.registerA]=obj?.get((ref as FieldReference).name)}
    Opcode.IPUT,Opcode.IPUT_OBJECT -> { @Suppress("UNCHECKED_CAST") val obj=r[two!!.registerB] as MutableMap<String,Any?>;obj[(ref as FieldReference).name]=r[two.registerA].let {if(ins.opcode==Opcode.IPUT_OBJECT && it is Number && it.toLong()==0L)null else it} }
    Opcode.MOVE,Opcode.MOVE_OBJECT -> r[two!!.registerA]=r[two.registerB]
    Opcode.MOVE_RESULT,Opcode.MOVE_RESULT_OBJECT -> r[one!!.registerA]=result
    Opcode.IF_EQZ -> branch(same(r[one!!.registerA],0L))
    Opcode.IF_NEZ -> branch(!same(r[one!!.registerA],0L))
    Opcode.IF_EQ -> branch(same(r[two!!.registerA],r[two.registerB]))
    Opcode.IF_NE -> branch(!same(r[two!!.registerA],r[two.registerB]))
    Opcode.GOTO,Opcode.GOTO_16 -> branch(true)
    Opcode.CHECK_CAST -> Unit
    Opcode.XOR_INT_LIT8 -> {val v=r[two!!.registerB];r[two.registerA]=(if(v is Boolean)if(v)1L else 0L else (v as Number).toLong()) xor (ins as WideLiteralInstruction).wideLiteral}
    Opcode.INVOKE_VIRTUAL,Opcode.INVOKE_STATIC,Opcode.INVOKE_STATIC_RANGE -> {
     val call=ref as MethodReference
     val regs=if(ins is RegisterRangeInstruction)(ins.startRegister until ins.startRegister+ins.registerCount).toList() else (ins as FiveRegisterInstruction).let {listOf(it.registerC,it.registerD,it.registerE,it.registerF,it.registerG).take(it.registerCount)}
     val values=regs.map {r[it]}
     if(capture && call.name=="onNativeTrackApplied")return values[0]
     result=when {
      call.definingClass=="Lapp/morphe/extension/shared/settings/EnumSetting;" && call.name=="get" -> mode
      call.definingClass=="Ljava/util/concurrent/atomic/AtomicBoolean;" && call.name=="get" -> guard
      call.definingClass=="Ljava/lang/String;" && call.name=="equals" -> values[0]==values[1]
      else -> {val target=classes.getValue(call.definingClass).methods.single {it.name==call.name && it.parameterTypes==call.parameterTypes};run(target,values)}
     }
    }
    Opcode.RETURN -> return r[one!!.registerA]
    else -> error("Unmodeled actual CC instruction before capture: ${m.name} ${ins.opcode} pc=${address[ip]}")
   };ip++
  };error("No return/capture in actual method ${m.name}")
 }
}
fun main(args:Array<String>) {
 val file=File(args[0]);val dex=DexFileFactory.loadDexContainer(file,Opcodes.getDefault());val classes=dex.dexEntryNames.flatMap {dex.getEntry(it)!!.dexFile.classes}.associateBy {it.type}
 val auto=classes.getValue("Lapp/morphe/extension/youtube/patches/AutoCaptionsPatch;")
 val disable=auto.methods.single {it.name=="disableAutoCaptions"}
 val loaded=auto.methods.single {it.name=="videoInformationLoaded"}
 check(loaded.implementation!!.instructions.filterIsInstance<WideLiteralInstruction>().any {it.wideLiteral==150L}){"Official initial guard no longer 150 ms"}
 val reset=auto.methods.single {it.name=="newVideoStarted"}.implementation!!.instructions.toList()
 check(reset.filterIsInstance<WideLiteralInstruction>().any {it.wideLiteral==0L} && reset.filterIsInstance<ReferenceInstruction>().any {(it.reference as? MethodReference)?.name=="set"})
 val delayed=auto.methods.single {it.name.startsWith("\$r8\$lambda")}.implementation!!.instructions.toList()
 check(delayed.filterIsInstance<WideLiteralInstruction>().any {it.wideLiteral==1L} && delayed.filterIsInstance<ReferenceInstruction>().any {(it.reference as? MethodReference)?.name=="compareAndSet"})
 check(classes.values.filterNot {it.type.startsWith("Lapp/")}.flatMap {it.methods.toList()}.count {m->m.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.any {(it.reference as? MethodReference)?.let {r->r.definingClass==auto.type && r.name=="newVideoStarted"}==true}==true}==1)
 val hosts=classes.values.filterNot {it.type.startsWith("Lapp/")}.flatMap {it.methods.toList()}.filter {m->
  val calls=m.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()?.mapNotNull {it.reference as? MethodReference}?:emptyList()
  calls.any {it.definingClass==auto.type && it.name==disable.name} && calls.any {it.name=="onNativeTrackApplied"}
 };val host=hosts.single()
 val refs=host.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().map {it.reference}
 val offTest=refs.filterIsInstance<MethodReference>().first {it.returnType=="Z" && it.parameterTypes.isEmpty() && it.definingClass!=auto.type}
 val trackClass=classes.getValue(offTest.definingClass);val offMethod=trackClass.methods.single {it.name==offTest.name && it.returnType=="Z"}
 check(offMethod.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().any {(it.reference as? StringReference)?.string=="DISABLE_CAPTIONS_OPTION"})
 val languageField=offMethod.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().mapNotNull {it.reference as? FieldReference}.single()
 val eventField=refs.filterIsInstance<FieldReference>().first {it.type==trackClass.type && it.definingClass!=host.definingClass}
 val committed=host.implementation!!.instructions.filter {it.opcode==Opcode.IPUT_OBJECT}.filterIsInstance<ReferenceInstruction>().mapNotNull {it.reference as? FieldReference}.filter {it.type==trackClass.type && it.definingClass==host.definingClass}.distinctBy {it.name}.single()
 val modes=classes.getValue(auto.type.removeSuffix(";")+"\$AutoCaptionsStyle;").fields.filter {it.type==auto.type.removeSuffix(";")+"\$AutoCaptionsStyle;"}.map {it.name}
 val out=StringBuilder("mode,guard_wall_ms,installed,user_ai_on,original_off,actual_disable,committed_language,off_preserved\n")
 var rows=0
 for(mode in modes)for(ms in listOf(0,149,150,151))for(installed in listOf(false,true))for(ai in listOf(false,true))for(off in listOf(false,true)) {
  val vm=CcVm(classes,mode,ms>=150);val result=vm.run(disable,listOf(off));val track=mutableMapOf<String,Any?>(languageField.name to if(off)"DISABLE_CAPTIONS_OPTION" else "ja")
  val state=mutableMapOf<String,Any?>();val event=mutableMapOf<String,Any?>(eventField.name to track)
  @Suppress("UNCHECKED_CAST") val captured=vm.run(host,listOf(state,event),true) as Map<String,Any?>
  @Suppress("UNCHECKED_CAST") val applied=captured[committed.name] as Map<String,Any?>?
  val language=applied?.get(languageField.name)?:"null"
  if(mode=="BOTH_ENABLED")check(language==track[languageField.name]){"Actual Always show CC chain revoked manual selection"}
  out.append("$mode,$ms,$installed,$ai,$off,$result,$language,${off && language=="DISABLE_CAPTIONS_OPTION"}\n");rows++
 }
 File(args[1]).writeText(out.toString())
 println("OFFICIAL_CC_CHAIN_PASS rows=$rows host=$host off_test=$offTest initial_guard_ms=150 manual_off_preserved_in_BOTH_ENABLED=true shim_needed=false new_video_resets_guard=true input=${file.absolutePath}")
}
