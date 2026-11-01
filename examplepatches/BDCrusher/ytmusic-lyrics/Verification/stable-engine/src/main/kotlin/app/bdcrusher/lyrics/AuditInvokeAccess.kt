/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.lyrics
import java.io.File
import java.util.zip.ZipFile
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

data class InvokeAccessResult(val calls:Int,val nativeBridges:Int,val failures:List<String>)
/** Structural access/opcode audit, not an ART dataflow/type verifier. Include Google-owned bridge hosts. */
fun injectedInvokeAccess(types:Map<String,ClassDef>):InvokeAccessResult{
 fun key(m:MethodReference)=m.name+"("+m.parameterTypes.joinToString("")+")"+m.returnType
 val declarations=types.mapValues {(_,c)->c.methods.associateBy(::key)}
 fun target(ref:MethodReference,type:String=ref.definingClass,seen:MutableSet<String> = mutableSetOf()):Method?{
  if(!seen.add(type))return null
  declarations[type]?.get(key(ref))?.let {return it}
  val c=types[type]?:return null
  for(parent in listOfNotNull(c.superclass)+c.interfaces)target(ref,parent,seen)?.let {return it}
  return null
 }
 val failures=mutableListOf<String>();var calls=0;var bridges=0
 for(c in types.values)for(m in c.methods){
  val owned=c.type.startsWith("Lapp/bdcrusher/")
  if(!owned&&!m.name.startsWith("bd"))continue
  if(!owned)bridges++
  for(i in m.implementation?.instructions?:emptyList()){
   val ref=(i as? ReferenceInstruction)?.reference as? MethodReference?:continue
   val dest=target(ref)?:continue;calls++
   val op=i.opcode;val static=AccessFlags.STATIC.isSet(dest.accessFlags);val private=AccessFlags.PRIVATE.isSet(dest.accessFlags)
   val direct=op==Opcode.INVOKE_DIRECT||op==Opcode.INVOKE_DIRECT_RANGE
   val staticCall=op==Opcode.INVOKE_STATIC||op==Opcode.INVOKE_STATIC_RANGE
   val problem=when{
    static!=staticCall->"static/instance invocation mismatch"
    !static&&(private||dest.name=="<init>")&&!direct->"private/constructor requires invoke-direct"
    !static&&!private&&dest.name!="<init>"&&direct->"invoke-direct targets a non-direct instance method"
    private&&c.type!=dest.definingClass->"private target belongs to another class"
    else->null
   }
   if(problem!=null)failures+="${c.type}->${m.name}: $op $ref: $problem"
  }
 }
 return InvokeAccessResult(calls,bridges,failures)
}
fun main(args:Array<String>){
 require(args.size==2)
 val types=linkedMapOf<String,ClassDef>();ZipFile(File(args[0])).use {zip->
  for(e in zip.entries().asSequence().filter {it.name.matches(Regex("classes[0-9]*\\.dex"))})for(c in DexBackedDexFile.fromInputStream(null,zip.getInputStream(e).buffered()).classes)require(types.put(c.type,c)==null)
  val result=injectedInvokeAccess(types)
  if(args[1]=="expect-row-failure"){
   require(result.failures.any {it.contains("Ljcq;->bd_playlistRow")&&it.contains("private/constructor")}&&result.failures.any {it.contains("Ljcr;->bd_playlistRow")&&it.contains("private/constructor")}){"Old crash was not detected: ${result.failures}"}
   println("PASS: access regression rejects BOTH old native row bridges; failures=${result.failures.size}")
  }else{require(args[1]=="expect-pass");require(result.failures.isEmpty()){result.failures.joinToString("\n")};println("PASS: ${result.calls} injected calls / ${result.nativeBridges} native bridge methods")}
 }
}
