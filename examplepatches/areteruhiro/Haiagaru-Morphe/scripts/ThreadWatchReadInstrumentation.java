package app.haiagaru.tests.watchread;

import android.app.*;
import android.content.*;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.*;
import android.service.notification.StatusBarNotification;
import java.io.*;
import java.lang.reflect.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.*;

/** Exact native bookmark fixture and real notification worker; all HTTPS is isolated in this process. */
public final class ThreadWatchReadInstrumentation extends Instrumentation {
    private static final String URL_TEXT="https://watchread.invalid/test/read.cgi/android/1790000887/";
    private Context app;private SharedPreferences prefs;private SQLiteDatabase db;private String board;
    private NotificationManager notifications;private Method poll;private int checks,requests,datRequests,serverCount=20;
    private volatile Runnable onDat;private volatile boolean datFailure;private boolean inserted;
    private void ok(boolean value,String label){checks++;if(!value)throw new AssertionError(label);}
    private Method method(Class<?> owner,String name,Class<?>...args)throws Exception{Method m=owner.getDeclaredMethod(name,args);m.setAccessible(true);return m;}
    private void read(int value)throws Exception{db.execSQL("UPDATE bookmarks SET read_count=?,res_count=100,server_res_count=100 WHERE name=? AND created=1790000887",new Object[]{value,board});}
    private void put(int count,boolean reply)throws Exception{
        notifications.cancel(URL_TEXT,0x48690031);onDat=null;datFailure=false;serverCount=20;
        prefs.edit().putString(URL_TEXT,new JSONObject().put("count",count).put("token","watchread-test")
                .put("own",new JSONArray().put(3)).put("repliesOnly",reply).put("stopAfterReply",false)
                .put("durationMinutes",60).put("expiresAt",System.currentTimeMillis()+3600000).toString()).commit();
    }
    private JSONObject stored()throws Exception{return new JSONObject(prefs.getString(URL_TEXT,"{}"));}
    private Notification note(){for(StatusBarNotification s:notifications.getActiveNotifications())if(URL_TEXT.equals(s.getTag()))return s.getNotification();return null;}
    private void tick()throws Exception{poll.invoke(null,app,new AtomicBoolean(false));Thread.sleep(300);}
    private void silent(String label)throws Exception{tick();ok(note()==null,label);ok(stored().getInt("count")==serverCount,"reading advances persistent notification baseline");}
    private void newOnly(int expected,boolean replies)throws Exception{
        String summary=(replies?"自分への返信 ":"新着 ").concat(expected+"件");
        Notification n=null;for(int i=0;i<40;i++){n=note();if(n!=null&&summary.equals(n.extras.getString("android.subText")))break;Thread.sleep(50);}
        ok(n!=null,"genuinely unread responses still notify");
        ok(summary.equals(n.extras.getString("android.subText")),"only unread responses counted");
        String body=String.valueOf(n.extras.getCharSequence("android.bigText"));
        ok(body.contains(">>19")&&!body.contains(">>18 ")&&!body.contains(">>11 "),"read response bodies excluded from preview");
    }
    private void pendingRead(boolean all,boolean subscription)throws Exception{
        put(10,false);read(10);CountDownLatch entered=new CountDownLatch(1),release=new CountDownLatch(1);
        onDat=()->{entered.countDown();try{if(!release.await(10,TimeUnit.SECONDS))throw new AssertionError("release blocked fetch");}catch(InterruptedException e){throw new RuntimeException(e);}};
        FutureTask<Void> work=new FutureTask<>(()->{tick();return null;});new Thread(work,"isolated poll race").start();
        try{ok(entered.await(10,TimeUnit.SECONDS),"DAT fetch is in flight");if(subscription){JSONObject item=stored();item.put("count",18);prefs.edit().putString(URL_TEXT,item.toString()).commit();}else read(all?20:18);}finally{release.countDown();}
        work.get(15,TimeUnit.SECONDS);onDat=null;
        if(all)ok(note()==null,"reading all during fetch prevents delayed duplicate");else newOnly(2,false);
        ok(stored().getInt("count")==20,"race persists monotonic baseline");
    }
    private final class FixtureConnection extends HttpURLConnection {
        FixtureConnection(URL u){super(u);}
        @Override public void connect(){}@Override public void disconnect(){}@Override public boolean usingProxy(){return false;}
        @Override public int getResponseCode(){return 200;}
        @Override public String getContentType(){return "text/plain; charset=UTF-8";}
        @Override public InputStream getInputStream()throws IOException{
            if(!url.getHost().equals("watchread.invalid"))throw new IOException("public network disabled by fixture");requests++;
            if(url.getPath().endsWith("subject.txt"))return new ByteArrayInputStream(("1790000887.dat<>Read fixture ("+serverCount+")\n").getBytes(StandardCharsets.UTF_8));
            datRequests++;Runnable gate=onDat;if(gate!=null)gate.run();if(datFailure)throw new IOException("controlled DAT failure");
            StringBuilder dat=new StringBuilder();for(int n=1;n<=serverCount;n++)dat.append("名無し<>sage<>2026/11/09<>").append(n==19?"&gt;&gt;3 reply ":"body ").append(n).append("<>Read fixture\n");
            return new ByteArrayInputStream(dat.toString().getBytes(StandardCharsets.UTF_8));
        }
    }
    private void test()throws Exception{
        app=getTargetContext();ok(app.getPackageName().matches(".*\\.reporter(191|226|242)"),"isolated verification package");
        ClassLoader loader=app.getClassLoader();Class<?> watch=loader.loadClass("app.morphe.extension.chmate.ThreadWatch");poll=method(watch,"check",Context.class,AtomicBoolean.class);
        prefs=app.getSharedPreferences("haiagaru_thread_watch",0);ok(prefs.getAll().isEmpty(),"no existing watch registrations touched");
        notifications=(NotificationManager)app.getSystemService(Context.NOTIFICATION_SERVICE);
        ok(notifications.areNotificationsEnabled(),"test notification permission enabled");
        String version=app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName;
        Class<?> infoType=loader.loadClass("jp.syoboi.a2chMate.client.BBSUrlInfo");Object info=infoType.getMethod(version.contains("242")?"d":"c",String.class).invoke(null,URL_TEXT);
        board=method(loader.loadClass("app.morphe.extension.chmate.RefreshTargets"),"nativeBoard",Object.class,String.class).invoke(null,info,version).toString();
        db=SQLiteDatabase.openDatabase(app.getDatabasePath("roidon.sqlite").getPath(),null,SQLiteDatabase.OPEN_READWRITE);
        try(Cursor c=db.rawQuery("SELECT COUNT(*) FROM bookmarks WHERE name=? AND created=1790000887",new String[]{board})){c.moveToFirst();ok(c.getInt(0)==0,"native fixture identity absent");}
        db.execSQL("INSERT INTO bookmarks(name,created,title,res_count,server_res_count,read_count,flag,state,access) VALUES(?,1790000887,'Read fixture',100,100,0,0,0,1790000887000)",new Object[]{board});inserted=true;
        URL.setURLStreamHandlerFactory(protocol->protocol.equals("https")?new URLStreamHandler(){@Override protected URLConnection openConnection(URL url){return new FixtureConnection(url);}}:null);
        put(-1,false);read(10);silent("first registration remains silent even with native reading history");
        put(12,false);read(20);int oldDat=datRequests;silent("notification opened, read through 20, app closed: no repeat for 13..20");ok(datRequests==oldDat,"already-read subject needs no DAT fetch");
        put(12,false);read(18);tick();newOnly(2,false);
        put(12,true);read(18);tick();newOnly(1,true);ok(!stored().optBoolean("paused"),"read reconciliation preserves monitoring options");
        pendingRead(false,false);pendingRead(true,false);pendingRead(false,true);
        put(12,false);read(18);JSONObject delivered=stored();delivered.put("delivered",new JSONArray().put(new JSONArray().put(19).put(19)));prefs.edit().putString(URL_TEXT,delivered.toString()).commit();tick();
        ok("新着 1件".equals(note().extras.getString("android.subText")),"native/Haiagaru delivered ledger still deduplicates above read watermark");
        ok(!String.valueOf(note().extras.getCharSequence("android.bigText")).contains(">>19 "),"already delivered response excluded from remaining preview");
        put(12,false);read(19);JSONObject stop=stored();stop.put("stopAfterReply",true);prefs.edit().putString(URL_TEXT,stop.toString()).commit();tick();
        ok("新着 1件".equals(note().extras.getString("android.subText"))&&!stored().optBoolean("paused"),"already-read reply does not trigger stop-after-reply for unread nonreply");
        put(10,false);read(10);tick();ok("新着 10件".equals(note().extras.getString("android.subText")),"downloaded/server counts do not mark unread responses as read");
        put(-1,false);read(0);silent("unread initial registration remains silent");
        put(12,false);read(18);datFailure=true;tick();ok("新着 2件".equals(note().extras.getString("android.subText")),"DAT failure fallback excludes read responses");
        put(12,false);read(20);serverCount=15;tick();ok(note()==null&&stored().getInt("count")==20,"stale subject cannot lower reading watermark");serverCount=21;tick();ok("新着 1件".equals(note().extras.getString("android.subText")),"response after watermark still notifies");
        notifications.cancel(URL_TEXT,0x48690031);tick();ok(note()==null,"unchanged next poll does not renotify");
        put(12,false);db.delete("bookmarks","name=? AND created=1790000887",new String[]{board});inserted=false;tick();ok("新着 8件".equals(note().extras.getString("android.subText")),"missing native bookmark keeps legacy unread notification behavior");
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){Bundle out=new Bundle();int status=Activity.RESULT_CANCELED;try{test();out.putString("result","PASS "+checks+" native read-watermark/notification/race checks; fixture requests="+requests+"; public requests/posts=0");status=Activity.RESULT_OK;}catch(Throwable error){out.putInt("checksCompleted",checks);out.putInt("fixtureRequests",requests);out.putInt("datRequests",datRequests);if(prefs!=null)out.putString("stored",prefs.getString(URL_TEXT,"{}"));if(notifications!=null){NotificationChannel channel=notifications.getNotificationChannel("haiagaru_thread_updates");out.putString("channel",String.valueOf(channel));}out.putString("error",android.util.Log.getStackTraceString(error));}finally{try{if(prefs!=null)prefs.edit().remove(URL_TEXT).commit();if(notifications!=null)notifications.cancel(URL_TEXT,0x48690031);if(db!=null){if(inserted)db.delete("bookmarks","name=? AND created=1790000887",new String[]{board});db.close();}}catch(Throwable cleanup){out.putString("cleanupError",cleanup.toString());status=Activity.RESULT_CANCELED;}}finish(status,out);}
}
