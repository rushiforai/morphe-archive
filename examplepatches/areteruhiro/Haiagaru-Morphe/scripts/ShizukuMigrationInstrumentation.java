package app.haiagaru.tests.archive;
import android.app.*;import android.content.*;import android.os.*;import android.widget.*;import java.io.*;import java.lang.reflect.*;import java.util.*;import java.util.concurrent.*;

/** Test the optional client's real atomic copy using a synthetic read-only AIDL service. */
public final class ShizukuMigrationInstrumentation extends Instrumentation {
 private File work;private int checks;
 private void check(boolean v,String label){if(!v)throw new AssertionError(label);checks++;}
 private Method method(Class<?> c,String n,Class<?>...args)throws Exception{Method m=c.getDeclaredMethod(n,args);m.setAccessible(true);return m;}
 public void onCreate(Bundle args){super.onCreate(args);start();}
 public void onStart(){Bundle result=new Bundle();try{
  Context app=getTargetContext();Activity activity=startActivitySync(new Intent().setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.HomeActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));waitForIdleSync();
  work=new File(app.getCacheDir(),"migration-fixture-"+System.nanoTime());File source=new File(work,"source"),destination=new File(work,"destination");
  write(new File(source,"archive/thread.dat"),"new archive");write(new File(source,"dat/thread.dat"),"new dat");write(new File(destination,"archive/thread.dat"),"old archive");write(new File(destination,"dat/thread.dat"),"untouched dat");
  ClassLoader loader=activity.getClassLoader();Class<?> client=loader.loadClass("app.morphe.extension.chmate.PackageDataMigration"),api=loader.loadClass("app.morphe.extension.chmate.ILegacyDataMigrationService");
  Object service=java.lang.reflect.Proxy.newProxyInstance(loader,new Class<?>[]{api},(p,m,a)->{
   String path=a!=null&&a.length>0?(String)a[0]:"";File f=new File(source,path);
   switch(m.getName()){
    case "isDirectory":return f.isDirectory();case "listChildren":return path.equals("bad")?new String[]{"../escape"}:f.list();
    case "lastModified":return f.lastModified();case "openFile":return ParcelFileDescriptor.open(f,ParcelFileDescriptor.MODE_READ_ONLY);case "asBinder":return null;
    default:return null;
   }
  });
  Method copy=method(client,"copyRecursively",api,String.class,File.class,long[].class);long[] count={0};
  copy.invoke(null,service,"archive",destination.getCanonicalFile(),count);
  check(read(new File(destination,"archive/thread.dat")).equals("new archive"),"selected folder overwrites");check(read(new File(destination,"dat/thread.dat")).equals("untouched dat"),"unselected folder unchanged");check(read(new File(source,"archive/thread.dat")).equals("new archive"),"source unchanged");check(count[0]==1,"copy count");
  copy.invoke(null,service,"dat",destination.getCanonicalFile(),count);check(read(new File(destination,"dat/thread.dat")).equals("new dat"),"other selected folder copied");
  try{copy.invoke(null,service,"missing.dat",destination.getCanonicalFile(),count);throw new AssertionError("missing source accepted");}catch(InvocationTargetException expected){check(read(new File(destination,"archive/thread.dat")).equals("new archive"),"read failure preserves existing data");}
  try{copy.invoke(null,service,"../escape",destination.getCanonicalFile(),count);throw new AssertionError("escape accepted");}catch(InvocationTargetException expected){check(expected.getCause() instanceof SecurityException,"destination boundary enforced");}
  Object nativeService=loader.loadClass("app.morphe.extension.chmate.LegacyDataMigrationService").getConstructor().newInstance();
  try{api.getMethod("selectSourcePackage",String.class).invoke(nativeService,"../bad");throw new AssertionError("invalid package accepted");}catch(InvocationTargetException expected){check(expected.getCause() instanceof android.os.RemoteException,"source package validated");}
  FutureTask<Void> ui=new FutureTask<>(()->{LinearLayout box=new LinearLayout(activity);method(client,"addControl",Activity.class,LinearLayout.class).invoke(null,activity,box);check(box.getChildCount()>=1,"optional migration settings opens");return null;});runOnMainSync(ui);ui.get(15,TimeUnit.SECONDS);
  result.putString("result","PASS "+checks+" optional Shizuku migration checks (synthetic AIDL, no real source app)");finish(Activity.RESULT_OK,result);
 }catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));finish(Activity.RESULT_CANCELED,result);}finally{delete(work);}}
 private void write(File f,String value)throws IOException{f.getParentFile().mkdirs();try(FileOutputStream out=new FileOutputStream(f)){out.write(value.getBytes("UTF-8"));}}
 private String read(File f)throws IOException{try(InputStream in=new FileInputStream(f);ByteArrayOutputStream out=new ByteArrayOutputStream()){byte[] b=new byte[128];int n;while((n=in.read(b))!=-1)out.write(b,0,n);return out.toString("UTF-8");}}
 private void delete(File f){if(f==null)return;File[] children=f.listFiles();if(children!=null)for(File child:children)delete(child);f.delete();}
}
