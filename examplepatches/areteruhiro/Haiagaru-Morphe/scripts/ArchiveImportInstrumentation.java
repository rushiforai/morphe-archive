package app.haiagaru.tests.archive;
import android.app.*;import android.content.*;import android.net.*;import android.os.*;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;import java.util.zip.*;

public final class ArchiveImportInstrumentation extends Instrumentation {
 private int checks;private File imported,zipImported;
 private Field field(Class<?> c,String name)throws Exception{Field f=c.getDeclaredField(name);f.setAccessible(true);return f;}
 private Method method(Class<?> c,String name,Class<?>...types)throws Exception{Method m=c.getDeclaredMethod(name,types);m.setAccessible(true);return m;}
 private void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 public void onCreate(Bundle args){super.onCreate(args);start();}
 public void onStart(){Bundle result=new Bundle();try{
  Context app=getTargetContext();Activity activity=startActivitySync(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));waitForIdleSync();
  ClassLoader l=activity.getClassLoader();Class<?> tree=l.loadClass("app.morphe.extension.chmate.NativeArchiveFolderImport$Tree"),source=l.loadClass("app.morphe.extension.chmate.ArchiveFolderTransfer$Source"),engine=l.loadClass("app.morphe.extension.chmate.ArchiveFolderTransfer"),planType=l.loadClass("app.morphe.extension.chmate.ArchiveFolderTransfer$Plan");
  Constructor<?> ctor=tree.getDeclaredConstructor(Context.class,Uri.class);ctor.setAccessible(true);Object documents=ctor.newInstance(app,Uri.parse("content://app.haiagaru.tests.archivefixture226/tree/root"));
  Object plan=method(engine,"scan",source,String.class).invoke(null,documents,"root");check(field(planType,"threads").getInt(plan)==1,"SAF DAT count");check(((List<?>)field(planType,"entries").get(plan)).size()==2,"SAF DAT and IDX");
  Class<?> origins=l.loadClass("app.morphe.extension.chmate.ArchiveOrigins");File root=(File)method(origins,"archiveRoot",Context.class).invoke(null,app);String name="__archive_import_fixture_"+System.nanoTime();
  Method copy=method(engine,"restore",source,planType,File.class);imported=new File(root,name);copy.invoke(null,documents,plan,imported);
  String path=ArchiveFixtureProvider.BOARD+"/"+ArchiveFixtureProvider.TITLE+"/"+ArchiveFixtureProvider.DAT;
  check(Arrays.equals(read(new File(imported,path)),ArchiveFixtureProvider.data(path)),"SAF DAT bytes preserved");check(Arrays.equals(read(new File(imported,path.replace(".dat",".idx"))),new byte[]{1,4,0,3}),"SAF IDX bytes preserved");
  File zipFile=new File(app.getCacheDir(),"native-archive-fixture.zip");try(ZipOutputStream out=new ZipOutputStream(new FileOutputStream(zipFile))){for(String p:new String[]{path,path.replace(".dat",".idx")}){out.putNextEntry(new ZipEntry("archive/"+p));out.write(ArchiveFixtureProvider.data(p));out.closeEntry();}}
  Class<?> zip=l.loadClass("app.morphe.extension.chmate.ArchiveZipSource");Constructor<?> zc=zip.getDeclaredConstructor(File.class);zc.setAccessible(true);Object zipped=zc.newInstance(zipFile);
  try{Object zp=method(engine,"scan",source,String.class).invoke(null,zipped,"");try(FileOutputStream out=new FileOutputStream(new File(imported,path))){out.write("old".getBytes("UTF-8"));}copy.invoke(null,zipped,zp,imported);check(Arrays.equals(read(new File(imported,path)),ArchiveFixtureProvider.data(path)),"ZIP overwrites old DAT with source bytes");check(Arrays.equals(read(new File(imported,path.replace(".dat",".idx"))),new byte[]{1,4,0,3}),"ZIP IDX preserved");}finally{((Closeable)zipped).close();zipFile.delete();}
  FutureTask<Void> ui=new FutureTask<>(()->{LinearLayout box=new LinearLayout(activity);Class<?> entry=l.loadClass("app.morphe.extension.chmate.NativeArchiveFolderImport");method(entry,"addButton",LinearLayout.class,Activity.class).invoke(null,box,activity);check(box.getChildCount()==1&&((Button)box.getChildAt(0)).getText().toString().contains("ZIP"),"folder/ZIP settings entry");Constructor<?> nc=l.loadClass("o.AndroidLogHandler").getDeclaredConstructor(Context.class,File.class);nc.setAccessible(true);Object nativeList=nc.newInstance(activity,imported);check(nativeList!=null,"native archive browser accepts imported tree");return null;});runOnMainSync(ui);ui.get(15,TimeUnit.SECONDS);
  result.putString("result","PASS "+checks+" SAF/ZIP migration checks");finish(Activity.RESULT_OK,result);
 }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}finally{remove(imported);remove(zipImported);}}
 private byte[] read(File f)throws IOException{try(InputStream in=new FileInputStream(f);ByteArrayOutputStream out=new ByteArrayOutputStream()){byte[] b=new byte[8192];int n;while((n=in.read(b))!=-1)out.write(b,0,n);return out.toByteArray();}}
 private void remove(File f){if(f==null||!f.getName().startsWith("__archive_import_fixture_"))return;delete(f);}
 private void delete(File f){File[] children=f.listFiles();if(children!=null)for(File child:children)delete(child);f.delete();}
}
