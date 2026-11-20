package app.haiagaru.tests.notification;

import android.app.Instrumentation;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import java.lang.reflect.*;
import java.util.*;

/** Isolated native NG registrations are restored even when assertions fail. */
public class NotificationNgInstrumentation extends Instrumentation {
    static int checks;
    static void check(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
    static Object call(Class<?> type,String name,Class<?>[] params,Object...args)throws Exception{
        Method m=type.getDeclaredMethod(name,params);m.setAccessible(true);return m.invoke(null,args);
    }
    @Override public void onCreate(Bundle b){super.onCreate(b);start();}
    @Override public void onStart(){
        Bundle result=new Bundle();
        List<Runnable> cleanup=new ArrayList<>();
        try{
            Context context=getTargetContext();ClassLoader loader=context.getClassLoader();
            SharedPreferences submissions=context.getSharedPreferences("haiagaru.personal-ng-submissions",0);
            boolean hadConsent=submissions.contains("consent"),consent=submissions.getBoolean("consent",false);
            submissions.edit().putBoolean("consent",false).commit();
            cleanup.add(()->{if(hadConsent)submissions.edit().putBoolean("consent",consent).commit();else submissions.edit().remove("consent").commit();});
            String prefix="app.morphe.extension.chmate.";
            Class<?> rules=loader.loadClass(prefix+"ThreadWatchRules"),ng=loader.loadClass(prefix+"NotificationNg");
            String url="https://kizuna.5ch.io/test/read.cgi/android/1794740000/";
            Object target=call(rules,"target",new Class[]{String.class},url);
            String key="suppressNgReplyNotifications";
            Class<?> feature=loader.loadClass(prefix+"FeatureSwitches");
            SharedPreferences prefs=(SharedPreferences)call(feature,"prefs",new Class[]{Context.class},context);
            boolean existed=prefs.contains(key),previous=prefs.getBoolean(key,true);
            cleanup.add(()->{if(existed)prefs.edit().putBoolean(key,previous).commit();else prefs.edit().remove(key).commit();});
            String chainKey="suppressChainedNgReplyNotifications";boolean hadChain=prefs.contains(chainKey),previousChain=prefs.getBoolean(chainKey,false);
            cleanup.add(()->{if(hadChain)prefs.edit().putBoolean(chainKey,previousChain).commit();else prefs.edit().remove(chainKey).commit();});
            prefs.edit().putBoolean(key,true).putBoolean(chainKey,false).commit();
            check((Boolean)call(ng,"enabled",new Class[]{Context.class},context),"option ON");
            Class<?> store=loader.loadClass(prefix+"NativeNgStore");
            Constructor<?> ctor=store.getDeclaredConstructor(Context.class,String.class);ctor.setAccessible(true);
            Method item=store.getDeclaredMethod("item",String.class,short.class,long.class,String.class);item.setAccessible(true);
            Method update=store.getDeclaredMethod("update",Object.class,Object.class);update.setAccessible(true);
            for(String category:new String[]{"ID","NAME","WORD","BE","IMAGE"}){
                Object provider=ctor.newInstance(context,category);
                String pattern=category.equals("ID")?"HaiNg123":category.equals("NAME")?"Haiagaru notification fixture":category.equals("BE")?"987654321":category.equals("IMAGE")?"https://i.imgur.com/HaiNg99.png":"HAIAGARU_NOTIFICATION_TEST_TOKEN";
                Object registration=item.invoke(provider,pattern,(short)(0x10|8),System.currentTimeMillis(),null);
                update.invoke(provider,null,registration);
                cleanup.add(()->{try{update.invoke(provider,registration,null);}catch(Exception error){throw new RuntimeException(error);}});
            }
            String dat="safe<><>2026/11/15 ID:safe0001<>own<>title\n"
                    +"safe<><>2026/11/15 ID:HaiNg123<>&gt;&gt;1 blocked id<>\n"
                    +"Haiagaru notification fixture<><>2026/11/15 ID:safe0002<>&gt;&gt;1 blocked name<>\n"
                    +"safe<><>2026/11/15 ID:safe0003<>&gt;&gt;1 HAIAGARU_NOTIFICATION_TEST_TOKEN<>\n"
                    +"safe<><>2026/11/15 ID:safe0004<>&gt;&gt;1 visible reply<>\n"
                    +"safe<><>2026/11/15 ID:safe0005<>&gt;&gt;2 chained reply<>\n"
                    +"safe<><>2026/11/15 ID:safe0006 BE:987654321<>&gt;&gt;1 blocked be<>\n"
                    +"safe<><>2026/11/15 ID:safe0007<>&gt;&gt;1 https://i.imgur.com/HaiNg99.png<>\n";
            Class<?>[] signature={Context.class,target.getClass(),String.class,int.class,int.class};
            Map<?,?> filtered=(Map<?,?>)call(ng,"filter",signature,context,target,dat,1,8);
            check(filtered.size()==2&&filtered.containsKey(5)&&filtered.containsKey(6),"direct NG rules suppress matching posts; normal IDs replying to own/NG posts remain: "+filtered);
            prefs.edit().putBoolean(chainKey,true).commit();
            filtered=(Map<?,?>)call(ng,"filter",signature,context,target,dat,1,8);
            check(filtered.size()==1&&filtered.containsKey(5),"separate chain option suppresses normal-ID replies anchored to chain-NG posts: "+filtered);
            prefs.edit().putBoolean(chainKey,false).commit();
            Class<?> own=loader.loadClass(prefix+"ThreadWatchOwnPosts");
            String board=(String)call(own,"board",new Class[]{Context.class,target.getClass()},context,target);
            Class<?> snapshot=loader.loadClass(prefix+"HaiagaruSyncSnapshot");
            java.io.File root=(java.io.File)call(snapshot,"externalRoot",new Class[]{Context.class},context);
            java.io.File directory=new java.io.File(root,"dat");directory.mkdirs();
            java.io.File index=new java.io.File(directory,board+"_1794740000.idx");
            byte[] saved=index.isFile()?java.nio.file.Files.readAllBytes(index.toPath()):null;
            cleanup.add(()->{try{if(saved==null)java.nio.file.Files.deleteIfExists(index.toPath());else java.nio.file.Files.write(index.toPath(),saved);}catch(Exception error){throw new RuntimeException(error);}});
            java.nio.file.Files.write(index.toPath(),"{}\n1:1,9:8\n".getBytes("UTF-8"));
            String indexedDat=dat+"safe<><>2026/11/15 ID:safe0008<>&gt;&gt;1 manual NG<>\n"
                    +"safe<><>2026/11/15 ID:safe0009<>&gt;&gt;9 normal reply to manual NG<>\n";
            filtered=(Map<?,?>)call(ng,"filter",signature,context,target,indexedDat,1,10);
            check(filtered.size()==3&&filtered.containsKey(5)&&filtered.containsKey(6)&&filtered.containsKey(10),"manual NG excludes its numbered post but not a normal reply to it: "+filtered+" at "+index+" bytes="+index.length());
            java.io.File temporary=java.io.File.createTempFile("haiagaru-reply-ng",".dat",context.getCacheDir());
            cleanup.add(()->temporary.delete());
            java.nio.file.Files.write(temporary.toPath(),indexedDat.getBytes("MS932"));
            Class<?> nativeWatch=loader.loadClass(prefix+"ThreadWatchNative"),frame=loader.loadClass(prefix+"ThreadWatchNative$Frame");
            Class<?> watch=loader.loadClass(prefix+"ThreadWatch");SharedPreferences watchPrefs=(SharedPreferences)call(watch,"prefs",new Class[]{Context.class},context);Object savedWatch=watchPrefs.getAll().get(url);
            cleanup.add(()->{if(savedWatch instanceof String)watchPrefs.edit().putString(url,(String)savedWatch).commit();else watchPrefs.edit().remove(url).commit();});
            watchPrefs.edit().putString(url,new org.json.JSONObject().put("own",new org.json.JSONArray().put(1).put(2).put(9)).toString()).commit();
            Constructor<?> frameConstructor=frame.getDeclaredConstructor(target.getClass(),String.class,java.io.File.class,int.class);frameConstructor.setAccessible(true);
            Object delivery=frameConstructor.newInstance(target,"fixture",temporary,1);
            Set<?> replies=(Set<?>)call(nativeWatch,"replies",new Class[]{frame,Context.class},delivery,context);
            check(replies.size()==3&&replies.contains(5)&&replies.contains(6)&&replies.contains(10),"native reply delivery excludes direct NG but keeps normal-ID chain and manual-NG replies: "+replies);
            Field preview=frame.getDeclaredField("preview");preview.setAccessible(true);
            check(preview.get(delivery).toString().contains("visible reply")&&preview.get(delivery).toString().contains("chained reply")&&!preview.get(delivery).toString().contains("blocked"),"mixed native preview contains non-NG replies only");
            prefs.edit().putBoolean(key,false).commit();
            filtered=(Map<?,?>)call(ng,"filter",signature,context,target,dat,1,8);
            check(filtered.size()==7,"option OFF preserves replies");
            result.putString("result","PASS "+checks+" native notification NG checks");
            finish(-1,result);
        }catch(Throwable error){
            result.putString("result",android.util.Log.getStackTraceString(error));finish(0,result);
        }finally{
            Collections.reverse(cleanup);
            for(Runnable restore:cleanup)try{restore.run();}catch(Exception error){android.util.Log.e("HaiagaruTest","Restore failed",error);}
        }
    }
}
