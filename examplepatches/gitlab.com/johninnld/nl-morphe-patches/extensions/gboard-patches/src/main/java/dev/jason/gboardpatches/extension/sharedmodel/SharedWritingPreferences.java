package dev.jason.gboardpatches.extension.sharedmodel;
import android.content.Context;
import android.util.AtomicFile;
import java.io.*;
import org.json.JSONObject;
/** User-authored examples/context only. Kept outside cloud backup and never collected from app conversations. */
public final class SharedWritingPreferences {
 private SharedWritingPreferences(){}
 private static AtomicFile file(Context context){return new AtomicFile(new File(context.getNoBackupFilesDir(),"shared-writing-context.json"));}
 public static synchronized String read(Context context,String key){try(InputStream in=file(context).openRead()){ByteArrayOutputStream data=new ByteArrayOutputStream();byte[] b=new byte[1024];int n;while((n=in.read(b))!=-1){if(data.size()+n>32768)return "";data.write(b,0,n);}return new JSONObject(data.toString("UTF-8")).optString(key,"");}catch(Exception e){return "";}}
 public static String language(Context context){String value=read(context,"translation_language");return SharedLanguageCoverage.baselineCodes().contains(value)?value:"en";}
 public static synchronized void writeLanguage(Context context,String language)throws Exception{
  if(!SharedLanguageCoverage.baselineCodes().contains(language))throw new IllegalArgumentException("Unsupported language");
  writeAll(context,read(context,"style"),read(context,"reply"),read(context,"instruction"),"true".equals(read(context,"compose")),"true".equals(read(context,"grammar")),language);
 }
 public static synchronized void write(Context context,String style,String reply,String instruction,boolean compose,boolean grammar)throws Exception{writeAll(context,style,reply,instruction,compose,grammar,language(context));}
 private static void writeAll(Context context,String style,String reply,String instruction,boolean compose,boolean grammar,String language)throws Exception{
  if(style.length()>8192 || reply.length()>4096 || instruction.length()>1024)throw new IllegalArgumentException("Context too long");
  byte[] data=new JSONObject().put("style",style).put("reply",reply).put("instruction",instruction).put("compose",compose?"true":"false").put("grammar",grammar?"true":"false").put("translation_language",language).toString().getBytes("UTF-8");
  AtomicFile f=file(context);FileOutputStream out=f.startWrite();try{out.write(data);f.finishWrite(out);}catch(Exception e){f.failWrite(out);throw e;}
 }
}
