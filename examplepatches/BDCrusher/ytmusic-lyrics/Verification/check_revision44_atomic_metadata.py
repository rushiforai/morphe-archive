"""Production song metadata and cover atomic writes; simulated Android storage/bitmap APIs."""
from pathlib import Path
import subprocess,os,json,hashlib,sys
h=Path(__file__).resolve().parents[1];w=h/'Verification/revision44'/('atomic-metadata'+(sys.argv[1] if len(sys.argv)>1 else ''));w.mkdir(exist_ok=False);pkg='app/morphe/extension/music/patches/downloads/'
s={
'androidx/annotation/Nullable.java':'package androidx.annotation;public @interface Nullable{}',
'android/graphics/Bitmap.java':'package android.graphics;public class Bitmap{public enum CompressFormat{JPEG}public boolean fail;public boolean compress(CompressFormat f,int q,java.io.OutputStream o){try{o.write(new byte[]{1,2,3});return !fail;}catch(java.io.IOException e){throw new IllegalStateException(e);}}}',
'android/graphics/BitmapFactory.java':'package android.graphics;public class BitmapFactory{public static class Options{public boolean inJustDecodeBounds;public int outWidth=1200,outHeight=1200,inSampleSize;}public static Bitmap decodeFile(String p,Options o){return new Bitmap();}}',
'app/morphe/extension/shared/Logger.java':'package app.morphe.extension.shared;public class Logger{public static void printDebug(java.util.function.Supplier<String>s,Throwable t){}public static void printException(java.util.function.Supplier<String>s,Throwable t){}public static void printException(java.util.function.Supplier<String>s){}}',
'app/bdcrusher/ytmusic/common/FeatureDiagnostics.java':'package app.bdcrusher.ytmusic.common;public class FeatureDiagnostics{public static String last="";public static void record(String a,String b){last=b;}}',
'android/util/AtomicFile.java':r'''package android.util;import java.io.*;public class AtomicFile{public static boolean fail;File base,tmp;public AtomicFile(File f){base=f;tmp=new File(f+".new");}public FileInputStream openRead()throws IOException{File old=new File(base+".bak");if(old.isFile())java.nio.file.Files.move(old.toPath(),base.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING);return new FileInputStream(base);}public FileOutputStream startWrite()throws IOException{if(fail)throw new IOException("fixture disk full");return new FileOutputStream(tmp);}public void finishWrite(FileOutputStream out)throws IOException{out.getFD().sync();out.close();java.nio.file.Files.move(tmp.toPath(),base.toPath(),java.nio.file.StandardCopyOption.REPLACE_EXISTING,java.nio.file.StandardCopyOption.ATOMIC_MOVE);}public void failWrite(FileOutputStream out){try{out.close();}catch(IOException ignored){}tmp.delete();}}''',
pkg+'AtomicCheck.java':r'''package app.morphe.extension.music.patches.downloads;import java.io.*;import java.nio.file.*;import java.util.*;
public class AtomicCheck{static int checks;static void check(boolean b){checks++;if(!b)throw new AssertionError("check "+checks);}public static void main(String[] args)throws Exception{
 Path root=Path.of(args[0]);String id="abcdefghijk";Path audio=root.resolve(id+".webm");Files.write(audio,new byte[128]);var bitmap=new android.graphics.Bitmap();
 OfflineTrack.save(root.toFile(),id,"Original title","Artist","Album",120,bitmap);check(OfflineTrack.load(audio.toFile()).displayTitle().equals("Original title"));byte[] metadata=Files.readAllBytes(root.resolve(id+".json")),cover=Files.readAllBytes(root.resolve(id+".jpg"));
 android.util.AtomicFile.fail=true;OfflineTrack.save(root.toFile(),id,"New title","Artist","Album",120,bitmap);check(Arrays.equals(metadata,Files.readAllBytes(root.resolve(id+".json"))));check(Arrays.equals(cover,Files.readAllBytes(root.resolve(id+".jpg"))));check(app.bdcrusher.ytmusic.common.FeatureDiagnostics.last.contains("existing files were kept"));android.util.AtomicFile.fail=false;
 bitmap.fail=true;try{OfflineStorage.writeJpeg(root.resolve(id+".jpg").toFile(),bitmap);throw new AssertionError();}catch(IOException expected){check(Arrays.equals(cover,Files.readAllBytes(root.resolve(id+".jpg"))));}check(!Files.exists(root.resolve(id+".jpg.new")));bitmap.fail=false;
 Files.move(root.resolve(id+".json"),root.resolve(id+".json.bak"));check(OfflineTrack.load(audio.toFile()).displayTitle().equals("Original title"));check(Files.exists(root.resolve(id+".json")));
 Files.write(root.resolve(id+".json.new"),new byte[]{0,1,2});check(OfflineTrack.load(audio.toFile()).displayTitle().equals("Original title"));
 OfflineTrack.save(root.toFile(),id,"Refreshed","Artist","Album",120,bitmap);check(OfflineTrack.load(audio.toFile()).displayTitle().equals("Refreshed"));check(Files.size(audio)==128);
 Files.write(root.resolve("oversized.json"),new byte[1024*1024+1]);try{OfflineStorage.readText(root.resolve("oversized.json").toFile());throw new AssertionError();}catch(IOException expected){check(true);}
 System.out.println("PASS "+checks+" actual atomic metadata/cover checks");}}
'''
}
paths=[]
for name,body in s.items():
 p=w/'src'/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body,encoding='utf-8');paths.append(p)
actual=[h/'Personal-Patches/extensions/music/src/main/java'/pkg/(n+'.java') for n in ['OfflineTrack','OfflineStorage']];classes=w/'classes';classes.mkdir();jar=next((h/'BuildCache/Gradle Cache/caches/modules-2/files-2.1/org.json/json/20231013').glob('*/*.jar'));cp=os.pathsep.join(map(str,[classes,jar]));java=Path('C:/Program Files/Microsoft/jdk-17.0.20.101-hotspot/bin');env=dict(os.environ,JAVA_TOOL_OPTIONS='-XX:-UsePerfData',TMP=str(h/'BuildCache/Temp'),TEMP=str(h/'BuildCache/Temp'))
subprocess.run([str(java/'javac.exe'),'-encoding','UTF-8','-cp',cp,'-d',str(classes),*map(str,actual+paths)],cwd=w,env=env,check=True)
r=subprocess.run([str(java/'java.exe'),'-cp',cp,'app.morphe.extension.music.patches.downloads.AtomicCheck',str(w)],cwd=w,env=env,capture_output=True,text=True,check=True)
(w/'result.json').write_text(json.dumps({'stdout':r.stdout,'sources':{str(p.relative_to(h)):hashlib.sha256(p.read_bytes()).hexdigest() for p in actual},'scope':'Production metadata/cover writer and reader with simulated Android AtomicFile and Bitmap codec; generated fixtures only, no device/actual media download.'},indent=2),encoding='utf-8');print(r.stdout)
