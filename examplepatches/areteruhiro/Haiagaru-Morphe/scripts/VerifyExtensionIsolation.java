import java.nio.file.*;import java.util.*;import java.util.function.*;import java.util.zip.*;import java.io.*;import java.net.*;import java.lang.reflect.*;import com.android.tools.smali.dexlib2.dexbacked.*;
public final class VerifyExtensionIsolation {
 static void check(boolean b,String m){if(!b)throw new AssertionError(m);}
 static Object outcome(DexBackedDexFile.OptionalIndexedSection<String> s,int i,boolean optional){try{return optional?s.getOptional(i):s.get(i);}catch(Exception e){return e.getClass().getName()+":"+e.getMessage();}}
 public static void main(String[] a)throws Exception{
  try(var loader=new URLClassLoader(new URL[]{Path.of(a[0]).toUri().toURL()},VerifyExtensionIsolation.class.getClassLoader()){public URL getResource(String name){if(a.length>2&&name.matches("extensions/chmate(?:-[0-9]+)?\\.mpe"))try{return new URL("jar:"+Path.of(a[2]).toUri().toURL()+"!/"+name);}catch(Exception e){throw new IllegalStateException(e);}return super.getResource(name);}};var zip=new ZipFile(a[0])){
   int count=0;Class<?> cached=null;try{cached=loader.loadClass("app.morphe.patches.chmate.CachedExtensionDex");}catch(ClassNotFoundException old){}
   if(cached!=null)for(var e:Collections.list(zip.entries()))if(e.getName().matches("extensions/chmate(?:-[0-9]+)?\\.mpe")){
    byte[] bytes=zip.getInputStream(e).readAllBytes();var before=new DexBackedDexFile(null,java.nio.ByteBuffer.wrap(bytes));var after=(DexBackedDexFile)cached.getConstructor(byte[].class).newInstance((Object)bytes);
    for(var pair:List.of(List.of(before.getStringSection(),after.getStringSection()),List.of(before.getTypeSection(),after.getTypeSection()))){var x=pair.get(0);var y=pair.get(1);check(x.size()==y.size(),"section size");for(int i=0;i<x.size();i++){check(x.get(i).equals(y.get(i)),"value "+i);check(x.getOffset(i)==y.getOffset(i),"offset "+i);check(y.get(i)==y.get(i),"cache identity");count++;}for(int i:new int[]{-2,-1,x.size(),Integer.MAX_VALUE})for(boolean optional:new boolean[]{false,true})check(Objects.equals(outcome(x,i,optional),outcome(y,i,optional)),"invalid/optional "+i);}
   }
   var type=loader.loadClass("app.morphe.patches.chmate.ChMateExtensionIsolation");var instance=type.getDeclaredField("INSTANCE");instance.setAccessible(true);var method=type.getDeclaredMethod("openAll");method.setAccessible(true);long start=System.nanoTime();var suppliers=(List<?>)method.invoke(instance.get(null));int index=0;
   Files.createDirectories(Path.of(a[1]));for(Object supplier:suppliers){try(var input=(InputStream)((Supplier<?>)supplier).get()){byte[] bytes=input.readAllBytes();Files.write(Path.of(a[1],"shard-"+(++index)+".dex"),bytes);}}
   System.out.println("PASS cached sections "+count+" entries including invalid/optional validation; isolated "+index+" shards in "+(System.nanoTime()-start)/1e9+" seconds");
  }
 }
}
