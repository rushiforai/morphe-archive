package app.haiagaru.tests.sharedsync;

import android.app.*;import android.content.*;import android.os.*;
import java.io.*;import java.lang.reflect.*;import java.net.*;import java.util.*;import java.util.concurrent.*;
import org.json.*;

/** Read-only live download, followed by isolated sync/cache failures. No public POSTs. */
public final class SharedNgSyncInstrumentation extends Instrumentation {
    private int checks;private Class<?> shared;private Context app;private volatile String mode="success",payload;private int opened;private boolean waitsValid=true;
    private static final String BASE="app.morphe.extension.chmate.";
    private void ok(boolean condition,String message){if(!condition)throw new AssertionError(message);checks++;}
    private Field field(String name)throws Exception{Field f=shared.getDeclaredField(name);f.setAccessible(true);return f;}
    private Object call(String name,Class<?>[] types,Object...args)throws Exception{Method m=shared.getDeclaredMethod(name,types);m.setAccessible(true);try{return m.invoke(null,args);}catch(InvocationTargetException error){Throwable cause=error.getCause();if(cause instanceof Exception)throw (Exception)cause;throw error;}}
    private final class Connection extends HttpURLConnection {
        Connection(URL address){super(address);opened++;}
        public void connect(){}public void disconnect(){}public boolean usingProxy(){return false;}
        public int getResponseCode()throws IOException{
            waitsValid&=getConnectTimeout()>0&&getConnectTimeout()<=15_000&&getReadTimeout()>15_000&&getReadTimeout()<=60_000;
            if(mode.equals("timeout"))throw new SocketTimeoutException("fixture server timeout");
            return getURL().getHost().equals("script.google.com")?302:200;
        }
        public String getHeaderField(String name){return "https://script.googleusercontent.com/macros/echo?shared-ng-fixture";}
        public InputStream getInputStream(){return new ByteArrayInputStream((mode.equals("invalid")?"{invalid":payload).getBytes(java.nio.charset.StandardCharsets.UTF_8));}
        public OutputStream getOutputStream(){return new ByteArrayOutputStream();}
    }
    private byte[] bytes(File file)throws Exception{try(InputStream in=new FileInputStream(file);ByteArrayOutputStream out=new ByteArrayOutputStream()){byte[] buffer=new byte[8192];int n;while((n=in.read(buffer))!=-1)out.write(buffer,0,n);return out.toByteArray();}}
    private JSONObject rule(char id,String value)throws Exception{return new JSONObject().put("id",String.join("",Collections.nCopies(64,String.valueOf(id)))).put("board","5ch/all").put("kind","keyword").put("value",value).put("period","").put("votes",1);}
    private void live(Bundle result)throws Exception{
        String endpoint=(String)field("DEFAULT_ENDPOINT").get(null);long start=System.nanoTime();
        JSONObject response=(JSONObject)call("request",new Class<?>[]{String.class,String.class,JSONObject.class},"GET",endpoint+"?action=reviewed&reporter=1&globalIdentity=1&regex=1&matchModes=1&contributors=1",null);
        ok(response.optBoolean("ok")&&response.optBoolean("full"),"production GAS request completes with a full feed; ok="+response.optBoolean("ok")+"; full="+response.optBoolean("full")+"; error="+response.optString("error","")+"; elapsedMs="+(System.nanoTime()-start)/1_000_000L);
        List<?> decoded=(List<?>)call("decode",new Class<?>[]{JSONArray.class},response.getJSONArray("rules"));ok(!decoded.isEmpty(),"actual published conditions decode with production rules");
        result.putString("live","HTTP GET only; conditions="+decoded.size()+"; elapsedMs="+(System.nanoTime()-start)/1_000_000L);
    }
    private void isolated()throws Exception{
        ((ExecutorService)field("IO").get(null)).submit(()->{}).get(120,TimeUnit.SECONDS);
        Object lock=field("SOURCE_LOCK").get(null);Map<Field,Object> saved=new LinkedHashMap<>();
        for(String key:new String[]{"context","rules","enabled","matchPlan","status","nextSync","sourceGeneration","busy"}){Field f=field(key);saved.put(f,f.get(null));}
        File dir=new File(app.getCacheDir(),"shared-ng-sync-fixture-"+System.nanoTime());ok(dir.mkdir(),"isolated cache directory");
        SharedPreferences prefs=app.getSharedPreferences("haiagaru.sync-fixture."+System.nanoTime(),0);
        Context fixture=new ContextWrapper(app){@Override public File getFilesDir(){return dir;}@Override public SharedPreferences getSharedPreferences(String name,int access){return prefs;}};
        // This verification-only process is force-stopped after instrumentation; no production factory is changed.
        URL.setURLStreamHandlerFactory(protocol->protocol.equals("https")?new URLStreamHandler(){protected URLConnection openConnection(URL url)throws IOException{if(!url.getHost().equals("script.google.com")&&!url.getHost().equals("script.googleusercontent.com"))throw new IOException("fixture blocks public requests");return new Connection(url);}}:null);
        try{
            synchronized(lock){field("context").set(null,fixture);field("enabled").set(null,false);field("busy").set(null,false);}
            prefs.edit().putLong("cursor",7).putLong("lastSync",123).putInt("threshold",4).putString("localEditsV1","{}").commit();
            List<?> old=(List<?>)call("decode",new Class<?>[]{JSONArray.class},new JSONArray().put(rule('a',"既存条件のテスト")));field("rules").set(null,old);
            call("saveCache",new Class<?>[]{List.class,String.class},old,call("feedEndpoint",new Class<?>[]{}));
            payload=new JSONObject().put("ok",true).put("full",true).put("revision",8).put("rules",new JSONArray().put(rule('a',"既存条件のテスト")).put(rule('b',"追加条件のテスト"))).toString();
            call("sync",new Class<?>[]{boolean.class},true);
            ok(((List<?>)field("rules").get(null)).size()==2&&prefs.getLong("cursor",0)==8,"successful sync atomically installs complete conditions and cursor");
            ok(waitsValid&&opened==2,"GAS redirect uses extended bounded waits");
            File cache=((android.util.AtomicFile)call("cacheFile",new Class<?>[]{})).getBaseFile();byte[] complete=bytes(cache);long synced=prefs.getLong("lastSync",0);ok(synced>123&&complete.length>0,"success persists a complete snapshot");
            field("rules").set(null,Collections.emptyList());call("loadCache",new Class<?>[]{});ok(((List<?>)field("rules").get(null)).size()==2,"persisted snapshot reloads");
            mode="timeout";opened=0;call("sync",new Class<?>[]{boolean.class},true);
            ok(opened==2,"manual download retries a timeout exactly once");
            ok(Arrays.equals(complete,bytes(cache))&&prefs.getLong("cursor",0)==8&&prefs.getLong("lastSync",0)==synced,"timeout preserves cache, cursor and last successful synchronization");
            ok(((List<?>)field("rules").get(null)).size()==2&&!(Boolean)field("busy").get(null),"saved rules remain usable and busy clears");
            ok(field("status").get(null).toString().contains("タイムアウト")&&field("status").get(null).toString().contains("保存済み"),"timeout explains retry and retention in Japanese");
            opened=0;try{call("request",new Class<?>[]{String.class,String.class,JSONObject.class},"POST",field("DEFAULT_ENDPOINT").get(null),new JSONObject().put("test",true));throw new AssertionError("POST timeout expected");}catch(SocketTimeoutException expected){ok(opened==1,"POST timeout never resends a report");}
            mode="invalid";opened=0;call("sync",new Class<?>[]{boolean.class},true);
            ok(opened==2&&Arrays.equals(complete,bytes(cache))&&prefs.getLong("cursor",0)==8,"invalid JSON after redirect cannot replace saved rules or trigger another request");
            ok(prefs.getInt("threshold",0)==4&&prefs.getString("localEditsV1","").equals("{}"),"user thresholds and local edits preserved");
        }finally{
            waitForIdleSync();synchronized(lock){for(Map.Entry<Field,Object> entry:saved.entrySet())entry.getKey().set(null,entry.getValue());}
            prefs.edit().clear().commit();for(File file:Objects.requireNonNull(dir.listFiles()))if(!file.delete())throw new IOException("Cannot remove fixture file");if(!dir.delete())throw new IOException("Cannot remove fixture directory");
        }
    }
    @Override public void onCreate(Bundle args){super.onCreate(args);start();}
    @Override public void onStart(){Bundle result=new Bundle();int code=Activity.RESULT_CANCELED;try{
        app=getTargetContext();if(!app.getPackageName().matches(".*\\.reporter(191|226|242)"))throw new SecurityException("verification packages only");
        shared=app.getClassLoader().loadClass(BASE+"SharedNg");
        Bundle waiting=new Bundle();waiting.putString("state","waiting for visible verification HomeActivity");sendStatus(1,waiting);
        Class<?> haiagaru=app.getClassLoader().loadClass(BASE+"Haiagaru");Method activity=haiagaru.getDeclaredMethod("toolbarActivity",Object.class);activity.setAccessible(true);
        boolean visible=false;for(int n=0;n<80;n++){FutureTask<Boolean> foreground=new FutureTask<>(()->{Activity host=(Activity)activity.invoke(null,new Object[]{null});return host!=null&&host.hasWindowFocus();});runOnMainSync(foreground);if(foreground.get()){visible=true;break;}Thread.sleep(250);}ok(visible,"sync runs with foreground app as in manual settings sync");
        live(result);isolated();result.putString("result","PASS "+checks+" live receive and isolated shared NG sync checks; public POSTs=0; user cache/settings unchanged");code=Activity.RESULT_OK;
    }catch(Throwable error){StringWriter trace=new StringWriter();error.printStackTrace(new PrintWriter(trace));result.putString("error",trace.toString());}finally{finish(code,result);}}
}
