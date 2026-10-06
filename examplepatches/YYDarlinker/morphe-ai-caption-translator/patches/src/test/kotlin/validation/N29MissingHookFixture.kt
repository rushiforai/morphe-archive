package validation
import com.android.tools.smali.dexlib2.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.File
import java.util.zip.*
/** Deliberate missing-hook artifact: only remove the real serialized host draw method. */
fun main(args:Array<String>) {
 val src=File(args[0]);val dst=File(args[1]);check(!dst.exists()){"Never overwrite an artifact"}
 val d=DexFileFactory.loadDexContainer(src,Opcodes.getDefault());val root="Lcom/google/android/libraries/youtube/player/subtitles/ui/SubtitleWindowView;"
 val changes=mutableMapOf<String,ByteArray>();var removed=0
 for(name in d.dexEntryNames) {
  val dex=d.getEntry(name)!!.dexFile
  if(dex.classes.none {it.type==root})continue
  val modified=dex.classes.map {c->
   if(c.type!=root)c else {
    val methods=c.methods.filter {m->val drop=m.name=="draw" && m.parameterTypes.map {it.toString()}==listOf("Landroid/graphics/Canvas;");if(drop)removed++;!drop}
    ImmutableClassDef(c.type,c.accessFlags,c.superclass,c.interfaces,c.sourceFile,c.annotations,c.fields,methods)
   }
  }
  val temp=File.createTempFile("n29-missing-draw-",".dex",dst.parentFile)
  try {DexPool.writeTo(temp.absolutePath,ImmutableDexFile(dex.opcodes,modified));changes[name]=temp.readBytes()}finally{temp.delete()}
 }
 check(removed==1){"Expected one real host draw, got $removed"}
 ZipFile(src).use {input->ZipOutputStream(dst.outputStream()).use {out->
  for(entry in input.entries()) {
   val copy=ZipEntry(entry.name);copy.time=entry.time;out.putNextEntry(copy)
   out.write(changes[entry.name]?:input.getInputStream(entry).use {it.readBytes()});out.closeEntry()
  }
 }}
 println("DELIBERATE_MISSING_DRAW_SERIALIZED removed=$removed output=${dst.absolutePath}")
}
