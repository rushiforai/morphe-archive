package app.haiagaru.tests.momentum;
import android.app.*;import android.content.*;import android.os.*;import java.lang.reflect.*;import java.util.*;

/** Use native rows and the real native momentum comparator in each isolated verification APK. */
public final class SiteMomentumSortInstrumentation extends Instrumentation {
 int checks;void ok(boolean value,String message){if(!value)throw new AssertionError(message);checks++;}
 Field f(Class<?> type,String key)throws Exception{Field field=type.getDeclaredField(key);field.setAccessible(true);return field;}
 Object allocate(Class<?> type)throws Exception{Class<?> unsafe=Class.forName("sun.misc.Unsafe");return unsafe.getMethod("allocateInstance",Class.class).invoke(f(unsafe,"theUnsafe").get(null),type);}
 public void onCreate(Bundle args){super.onCreate(args);start();}
 @SuppressWarnings("unchecked")
 public void onStart(){Bundle result=new Bundle();try{
  Context app=getTargetContext();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated test package");
  ClassLoader loader=app.getClassLoader();String v=app.getPackageName();boolean old=v.endsWith("191"),mid=v.endsWith("226");
  Class<?> subject=loader.loadClass(old?"o.MaxAdViewImplExternalSyntheticLambda1":mid?"o.CertificateChainCleaner":"o.setSkipText");
  Class<?> row=loader.loadClass(old?"o.MaxAdViewImplExternalSyntheticLambda2":mid?"o.verifyHostname":"o.zzauw");
  Class<?> metadata=loader.loadClass("app.morphe.extension.chmate.SiteThreadMetadata"),sort=loader.loadClass("app.morphe.extension.chmate.SiteMomentumSort");
  Map<String,Long> cache=(Map<String,Long>)f(metadata,"CACHE").get(null);Map<String,Long> before; synchronized(cache){before=new HashMap<>(cache);}
  long now=System.currentTimeMillis()/1000;String[] keys={"hboard-momentum:90000001","hboard-momentum:90000002","hboard-momentum:90000003"};
  try{
   synchronized(cache){cache.put(keys[0],now-12850);cache.put(keys[1],now-9800);cache.remove(keys[2]);}
   ArrayList<Object> rows=new ArrayList<>();int[] counts={996,946,2000};
   for(int i=0;i<3;i++){Object s=allocate(subject),r=allocate(row);f(subject,old?"e":mid?"b":"d").setLong(s,9240000000L+90000001+i);f(subject,old?"a":mid?"e":"b").setInt(s,counts[i]);f(row,old?"a":mid?"d":"i").set(r,s);f(row,old?"d":mid?"c":"a").setInt(r,counts[i]);rows.add(r);}
   Object older=rows.get(0),newer=rows.get(1),unknown=rows.get(2);
   Class<?> comparator=loader.loadClass(old?"o.MaxAdViewImplb$RemoteActionCompatParcelizer":mid?"o.asciiToLowercase$read":"o.zzavd$RemoteActionCompatParcelizer");
   Constructor<?> ctor=comparator.getDeclaredConstructor(old||mid?new Class<?>[]{long.class}:new Class<?>[0]);ctor.setAccessible(true);
   Comparator<Object> nativeSort=(Comparator<Object>)ctor.newInstance(old||mid?new Object[]{now}:new Object[0]);
   Method apply=sort.getMethod("sort",List.class,Comparator.class);apply.invoke(null,rows,nativeSort);
   ok(rows.get(0)==newer,"946 newer responses outrank 996 older responses");ok(rows.get(1)==older,"older thread follows higher momentum");ok(rows.get(2)==unknown,"unknown creation date never impersonates high momentum");
   Collections.reverse(rows);apply.invoke(null,rows,nativeSort);ok(rows.get(0)==newer&&rows.get(2)==unknown,"input order does not change result");
   for(Object item:rows)f(row,old?"d":mid?"c":"a").setInt(item,0);
   apply.invoke(null,rows,nativeSort);ok(rows.get(0)==newer,"sort uses subject total responses, not cached/read count");
   Comparator<Object> updating=(a,b)->{synchronized(cache){cache.put(keys[0],now-1);}return nativeSort.compare(a,b);};
   apply.invoke(null,rows,updating);ok(rows.get(0)==newer,"metadata changes during comparison cannot change snapshot");
   synchronized(cache){cache.put(keys[0],now-12850);}
   Comparator<Object> reverse=nativeSort.reversed();apply.invoke(null,rows,reverse);ok(rows.get(0)==unknown&&rows.get(2)==newer,"native reverse ordering is preserved");
   synchronized(cache){cache.put(keys[0],now-100);}
   apply.invoke(null,rows,nativeSort);ok(rows.get(0)==older,"subsequent sort observes updated creation metadata");
   Method compare=sort.getMethod("compare",Object.class,Object.class);ok((Integer)compare.invoke(null,older,newer)==Integer.MIN_VALUE,"sort scope removed after completion");
   try{apply.invoke(null,rows,(Comparator<Object>)(a,b)->{throw new IllegalStateException("expected");});throw new AssertionError("exception propagation");}catch(InvocationTargetException expected){ok(expected.getCause() instanceof IllegalStateException,"native sort errors propagate");}
   ok((Integer)compare.invoke(null,older,newer)==Integer.MIN_VALUE,"sort scope removed after error");
   Method atBoard=sort.getDeclaredMethod("sort",List.class,Comparator.class,String.class);atBoard.setAccessible(true);String boardKey="hboard-momentum";
   ArrayList<Object> initial=new ArrayList<>(Arrays.asList(older,newer,unknown));synchronized(cache){for(String key:keys)cache.remove(key);}
   atBoard.invoke(null,initial,nativeSort,boardKey);ok(initial.get(0)==older,"unknown dates retain catalogue order until acquired");
   Class<?> adapterType=loader.loadClass(old?"o.m8a":mid?"o.getWriteBytesTotal":"o.zzavb");Object adapter=allocate(adapterType);Field adapterRows=f(adapterType,old?"d":mid?"e":"h");adapterRows.set(adapter,initial);
   synchronized(cache){cache.put(keys[0],now-12850);cache.put(keys[1],now-9800);}
   Method refresh=sort.getDeclaredMethod("refresh",Object.class,String.class);refresh.setAccessible(true);refresh.invoke(null,adapter,boardKey);List<?> refreshed=(List<?>)adapterRows.get(adapter);
   ok(refreshed.get(0)==newer&&refreshed.get(2)==unknown,"late date acquisition re-sorts bound native adapter");ok(initial.get(0)==older&&refreshed!=initial,"published native input list is not mutated");
   Comparator<Object> other=(a,b)->Integer.compare(System.identityHashCode(a),System.identityHashCode(b));ArrayList<Object> alternate=new ArrayList<>(refreshed);atBoard.invoke(null,alternate,other,boardKey);adapterRows.set(adapter,alternate);synchronized(cache){cache.put(keys[0],now-1);}refresh.invoke(null,adapter,boardKey);ok(adapterRows.get(adapter)==alternate,"other selected sort mode is not overwritten by date updates");
   Class<?> support=loader.loadClass("app.morphe.extension.chmate.SettingsSupport");Field url=f(support,"URL");ok("https://jbbs.shitaraba.net/computer/45040/".equals(url.get(null)),"support URL");
  }finally{synchronized(cache){for(String key:keys)if(before.containsKey(key))cache.put(key,before.get(key));else cache.remove(key);}}
  result.putString("result","PASS "+checks+" native momentum and support checks");finish(Activity.RESULT_OK,result);
 }catch(Throwable error){result.putString("error",android.util.Log.getStackTraceString(error));finish(Activity.RESULT_CANCELED,result);}}
}
