package app.haiagaru.tests.boards;

import android.app.*;import android.content.*;import android.os.*;import android.view.*;import android.view.accessibility.AccessibilityNodeInfo;import android.widget.*;
import java.io.*;import java.lang.reflect.*;import java.nio.file.*;import java.util.*;import java.util.concurrent.*;

/** Native editor cancellation and isolated confirmation continuation. Never posts publicly. */
public final class PostingIpWarningInstrumentation extends Instrumentation {
    private int checks;private Class<?> type;private Activity editor;private Object owner,binding;private File dat,backup;private boolean existed;
    private SharedPreferences prefs;private boolean had;private int prior;private final String key="ipPostWarningNetworks";
    public static final class FakeSubmit {public int sent;public void haiagaruIpConfirmed(){sent++;}}
    private void ok(boolean value,String name){if(!value)throw new AssertionError(name);checks++;}
    private Field field(Class<?> c,String n)throws Exception{Field f=c.getDeclaredField(n);f.setAccessible(true);return f;}
    private Method method(Class<?> c,String n,Class<?>...p)throws Exception{Method m=c.getDeclaredMethod(n,p);m.setAccessible(true);return m;}
    private <T>T main(Callable<T> c)throws Exception{FutureTask<T> f=new FutureTask<>(c);runOnMainSync(f);return f.get(10,TimeUnit.SECONDS);}
    private boolean intercept(Object value)throws Exception{return (Boolean)method(type,"intercept",Object.class).invoke(null,value);}
    private boolean contains(AccessibilityNodeInfo n,String text){if(n==null)return false;if(n.getText()!=null&&n.getText().toString().contains(text))return true;for(int i=0;i<n.getChildCount();i++)if(contains(n.getChild(i),text))return true;return false;}
    private boolean click(AccessibilityNodeInfo n,String text){if(n==null)return false;if(n.getText()!=null&&n.getText().toString().equals(text)){for(AccessibilityNodeInfo p=n;p!=null;p=p.getParent())if(p.isClickable())return p.performAction(AccessibilityNodeInfo.ACTION_CLICK);}for(int i=0;i<n.getChildCount();i++)if(click(n.getChild(i),text))return true;return false;}
    private void prompt()throws Exception{boolean shown=false;for(int i=0;i<40&&!shown;i++){shown=contains(getUiAutomation().getRootInActiveWindow(),"書き込み前のIP表示確認");if(!shown)Thread.sleep(150);}ok(shown,"native confirmation appears");ok(contains(getUiAutomation().getRootInActiveWindow(),"送信元IPを確認"),"explicit IP lookup action appears");}
    private void dismiss(String text)throws Exception{ok(click(getUiAutomation().getRootInActiveWindow(),text),"click "+text);Thread.sleep(300);waitForIdleSync();}
    private EditText body(View root){EditText best=root instanceof EditText?(EditText)root:null;if(root instanceof ViewGroup){ViewGroup g=(ViewGroup)root;for(int i=0;i<g.getChildCount();i++){EditText e=body(g.getChildAt(i));if(e!=null&&(best==null||e.getHeight()>best.getHeight()))best=e;}}return best;}
    private void write(String text)throws Exception{try(FileOutputStream out=new FileOutputStream(dat)){out.write(text.getBytes("MS932"));}}
    private void lookupResponses(Context app)throws Exception{
        android.net.ConnectivityManager cm=(android.net.ConnectivityManager)app.getSystemService(Context.CONNECTIVITY_SERVICE);android.net.Network network=cm.getActiveNetwork();ok(network!=null,"active network available for pinned lookup fixture");
        Class<?> lookup=app.getClassLoader().loadClass("app.morphe.extension.chmate.PostingPublicIp");Method query=method(lookup,"query",android.net.Network.class,String.class);
        for(String value:new String[]{"192.0.2.7","not an IP",new String(new char[256]).replace('\0','9'),"REDIRECT"}){
            try(java.net.ServerSocket server=new java.net.ServerSocket(0,1,java.net.InetAddress.getByName("127.0.0.2"))){
                FutureTask<String> fixture=new FutureTask<>(()->{try(java.net.Socket socket=server.accept()){socket.setSoTimeout(5000);BufferedReader input=new BufferedReader(new InputStreamReader(socket.getInputStream(),"US-ASCII"));StringBuilder request=new StringBuilder();String line;while((line=input.readLine())!=null&&!line.isEmpty())request.append(line).append('\n');byte[] bytes=value.getBytes("US-ASCII");String head=value.equals("REDIRECT")?"HTTP/1.1 302 Found\r\nLocation: https://invalid.test/\r\nContent-Length: 0\r\n\r\n":"HTTP/1.1 200 OK\r\nContent-Length: "+bytes.length+"\r\nConnection: close\r\n\r\n";socket.getOutputStream().write(head.getBytes("US-ASCII"));if(!value.equals("REDIRECT"))socket.getOutputStream().write(bytes);return request.toString();}});
                new Thread(fixture,"isolated IP echo").start();boolean accepted=false;try{Object returned=query.invoke(null,network,"http://127.0.0.2:"+server.getLocalPort()+"/ip");accepted=value.equals(returned);}catch(InvocationTargetException error){ok(error.getCause() instanceof IOException,"invalid/redirect response rejected without fallback");}
                ok(accepted==value.equals("192.0.2.7"),"strict IP response handling");String request=fixture.get(10,TimeUnit.SECONDS);ok(request.startsWith("GET /ip ")&&!request.toLowerCase(java.util.Locale.ROOT).contains("cookie:"),"read-only lookup without posting cookies or body");
            }
        }
    }
    private void settingsLinks(Context app)throws Exception{
        main(()->{editor.finish();return null;});Thread.sleep(300);
        Class<?> request=app.getClassLoader().loadClass("app.morphe.extension.chmate.SettingLinkRequest");
        String wifi="IP表示スレへの書き込み前に警告（Wi-Fi）",mobile="IP表示スレへの書き込み前に警告（モバイル回線）";
        String[] labels={wifi,mobile,wifi,mobile};boolean[] values={true,true,false,false};int[] expected={1,3,2,0};
        for(int i=0;i<labels.length;i++){
            int before=prefs.getInt(key,0);Object link=request.getConstructor(String.class,String.class,Boolean.class).newInstance(labels[i],"POSTING",values[i]);String url=(String)request.getMethod("url").invoke(link);
            ActivityMonitor monitor=addMonitor("app.morphe.extension.chmate.SettingLinkActivity",null,false);Activity activity;
            try{app.startActivity(new Intent(Intent.ACTION_VIEW,android.net.Uri.parse(url)).setClassName(app.getPackageName(),"app.morphe.extension.chmate.SettingLinkActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));activity=waitForMonitorWithTimeout(monitor,15000);}finally{removeMonitor(monitor);}
            ok(activity!=null,"IP-warning setting link opens confirmation");boolean ready=false;for(int n=0;n<40&&!ready;n++){ready=contains(getUiAutomation().getRootInActiveWindow(),"適用");if(!ready)Thread.sleep(150);}ok(ready,"real setting control supports ON/OFF link");
            ok(prefs.getInt(key,0)==before,"opening link does not change selected networks");dismiss("適用");ok(prefs.getInt(key,0)==expected[i],"confirmed link changes only intended network bit");dismiss("閉じる");
        }
    }
    @SuppressWarnings("unchecked") private void test()throws Exception{
        Context app=getTargetContext();type=app.getClassLoader().loadClass("app.morphe.extension.chmate.PostingIpWarning");
        prefs=app.getSharedPreferences("io.github.areteruhiro.chmate.haiagaru.ui-config",0);had=prefs.contains(key);prior=prefs.getInt(key,0);prefs.edit().putInt(key,3).commit();
        ActivityMonitor monitor=addMonitor("jp.syoboi.a2chMate.activity.ResEditActivity$Dialog",null,false);
        try{app.startActivity(new Intent(Intent.ACTION_SENDTO,android.net.Uri.parse("http://127.0.0.1:9/test/read.cgi/android/1234567890/")).setClassName(app.getPackageName(),"jp.syoboi.a2chMate.activity.ResEditActivity$Dialog").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));editor=waitForMonitorWithTimeout(monitor,15000);}finally{removeMonitor(monitor);}
        ok(editor!=null,"standard editor opened with isolated unreachable loopback destination");
        Map<Object,Object> bindings=(Map<Object,Object>)field(type,"bindings").get(null);
        for(int n=0;n<30&&owner==null;n++){
            main(()->{for(Map.Entry<Object,Object> entry:bindings.entrySet()){Object b=entry.getValue();java.lang.ref.WeakReference<?> a=(java.lang.ref.WeakReference<?>)field(b.getClass(),"activity").get(b);if(a.get()==editor){owner=entry.getKey();binding=b;break;}}return null;});if(owner==null)Thread.sleep(200);
        }
        ok(owner!=null,"version-pinned native posting owner registered");
        Object state=main(()->method(type,"state",binding.getClass()).invoke(null,binding));ok(state!=null,"exact reply target and selected route resolved");
        dat=(File)field(state.getClass(),"dat").get(state);existed=dat.exists();backup=new File(app.getCacheDir(),"ip-warning-test-backup-"+System.nanoTime());if(existed)Files.copy(dat.toPath(),backup.toPath());else dat.getParentFile().mkdirs();
        write("名無し (ﾜｯﾁｮｲ ab12-CD34 [192.0.2.1])<><>2026/11/08<>fixture body<>test\n");
        ok((Integer)method(type,"inspect",File.class).invoke(null,dat)==1,"production cached IPv4 header detected");
        main(()->{body(editor.getWindow().getDecorView()).setText("IP warning draft remains");return null;});
        // Invoke the patched native send entry, not just the helper. A broken hook can only reach port 9.
        main(()->{String version=app.getPackageManager().getPackageInfo(app.getPackageName(),0).versionName;Method submit=version.contains("191")?method(owner.getClass(),"b"):version.contains("226")?method(owner.getClass(),"n",owner.getClass()):method(owner.getClass(),"h");if(Modifier.isStatic(submit.getModifiers()))submit.invoke(null,owner);else submit.invoke(owner);return null;});
        prompt();dismiss("戻る");
        ok(main(()->!editor.isFinishing()&&body(editor.getWindow().getDecorView()).getText().toString().equals("IP warning draft remains")),"native cancellation retains editor and draft");
        FakeSubmit fake=new FakeSubmit();main(()->{bindings.put(fake,binding);ok(intercept(fake),"opted-in IP post pauses");ok(intercept(fake),"repeated submit remains pending");return null;});prompt();ok(fake.sent==0,"nothing submitted before confirmation");dismiss("書き込む");ok(fake.sent==1,"confirmation invokes continuation exactly once");
        main(()->{ok(intercept(fake),"each later submission requires confirmation");return null;});prompt();dismiss("戻る");ok(fake.sent==1,"cancel does not call continuation");
        write("名無し (ﾜｯﾁｮｲ ab12-CD34)<><>2026/11/08<>quoted [192.0.2.1] IP表示<>test\n");
        ok((Integer)method(type,"inspect",File.class).invoke(null,dat)==0,"quoted address in ordinary body is ignored");
        main(()->{ok(intercept(fake),"disk check defers to worker");return null;});for(int i=0;i<40&&fake.sent<2;i++)Thread.sleep(100);ok(fake.sent==2,"normal thread resumes without warning");
        write("名無し [2001:ce8:154:afc0:* [上級国民]]<><>2026/11/08<>fixture<>test\n");ok((Integer)method(type,"inspect",File.class).invoke(null,dat)==1,"reported masked IPv6 pattern detected");
        write("1<>名無し [192.0.2.1]<>sage<>2026/11/08<>fixture<>test<>ID:fixture\n");ok((Integer)method(type,"inspect",File.class).invoke(null,dat)==1,"Shitaraba numbered DAT header detected");
        dat.delete();main(()->{ok(intercept(fake),"unavailable DAT is checked");return null;});prompt();ok(contains(getUiAutomation().getRootInActiveWindow(),"確認できません"),"unknown IP state disclosed rather than assumed safe");dismiss("戻る");ok(fake.sent==2,"unknown state cancel is not submitted");
        prefs.edit().putInt(key,0).commit();ok(!main(()->intercept(fake)),"OFF leaves native submit unchanged");main(()->{bindings.remove(fake);return null;});lookupResponses(app);settingsLinks(app);
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){Bundle result=new Bundle();int status=Activity.RESULT_CANCELED;try{test();status=Activity.RESULT_OK;result.putString("result","PASS "+checks+" native IP-warning/cancel/confirmation/cache checks; public posts/IP lookups=0");}catch(Throwable e){result.putString("error",android.util.Log.getStackTraceString(e));}finally{try{if(editor!=null)runOnMainSync(editor::finish);if(dat!=null){if(existed&&backup.isFile())Files.copy(backup.toPath(),dat.toPath(),StandardCopyOption.REPLACE_EXISTING);else if(!existed)dat.delete();}if(backup!=null)backup.delete();if(prefs!=null){SharedPreferences.Editor edit=prefs.edit();if(had)edit.putInt(key,prior);else edit.remove(key);edit.commit();}}catch(Exception e){status=Activity.RESULT_CANCELED;result.putString("cleanupError",e.toString());}}finish(status,result);}
}
