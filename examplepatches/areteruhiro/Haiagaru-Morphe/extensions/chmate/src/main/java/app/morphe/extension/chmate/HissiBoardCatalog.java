package app.morphe.extension.chmate;

import android.content.Context;
import android.os.SystemClock;
import android.text.Html;
import java.io.*;
import java.net.*;
import java.security.MessageDigest;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

/** One bounded, shared menu request; never waits behind a poster scan or consumes its budget. */
final class HissiBoardCatalog {
    static final class Entry{final String code,label;Entry(String c,String l){code=c;label=l;}}
    interface Callback{void complete(List<Entry> boards,Exception error);}
    private static final String MENU="http://hissi.org/menu.php";
    private static final Pattern LINK=Pattern.compile("(?is)<a\\b[^>]*href\\s*=\\s*['\\\"]?(?:https?://(?:www\\.)?hissi\\.org)?/read\\.php/([a-z0-9_-]+)/[^>]*>(.*?)</a>");
    private static final ExecutorService IO=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"Haiagaru-Hissi-board-menu");t.setDaemon(true);return t;});
    private static final List<Callback> WAITERS=new ArrayList<>();
    private static List<Entry> snapshot=Collections.emptyList();private static long until;private static boolean loading;
    static synchronized List<Entry> peek(){return snapshot;}
    static void load(Context context,boolean force,Callback callback){
        List<Entry> ready=null;Context app=context.getApplicationContext();
        synchronized(HissiBoardCatalog.class){
            if(!force&&!snapshot.isEmpty()&&SystemClock.elapsedRealtime()<until)ready=snapshot;
            else{WAITERS.add(callback);if(loading)return;loading=true;}
        }
        if(ready!=null){callback.complete(ready,null);return;}
        IO.execute(()->{
            List<Entry> result=Collections.emptyList();Exception failure=null;
            try{result=read(app,force);}catch(Exception error){failure=error;}
            List<Callback> callbacks;
            synchronized(HissiBoardCatalog.class){
                if(failure==null){snapshot=Collections.unmodifiableList(new ArrayList<>(result));until=SystemClock.elapsedRealtime()+6*60*60*1000L;result=snapshot;}
                loading=false;callbacks=new ArrayList<>(WAITERS);WAITERS.clear();
            }
            for(Callback listener:callbacks)try{listener.complete(result,failure);}catch(RuntimeException ignored){}
        });
    }
    static List<Entry> parse(String html){
        LinkedHashMap<String,Entry> boards=new LinkedHashMap<>();Matcher matcher=LINK.matcher(html);
        while(matcher.find()){String code=matcher.group(1),label=Html.fromHtml(matcher.group(2)).toString().trim();if(!label.isEmpty())boards.putIfAbsent(code,new Entry(code,label));}
        return new ArrayList<>(boards.values());
    }
    private static List<Entry> read(Context context,boolean force)throws Exception{
        byte[] hash=MessageDigest.getInstance("SHA-256").digest(MENU.getBytes("UTF-8"));StringBuilder name=new StringBuilder();for(byte b:hash)name.append(String.format(Locale.US,"%02x",b));
        File file=WacchoiPageCache.file(context,name+".html");
        if(!force){byte[] saved=WacchoiPageCache.read(context,file);if(saved!=null){List<Entry> parsed=parse(HissiHtmlEncoding.decode(saved));if(!parsed.isEmpty())return parsed;}}
        HttpURLConnection connection=(HttpURLConnection)new URL(MENU).openConnection();connection.setRequestProperty("User-Agent","Mozilla/5.0 (Linux; Android) Haiagaru/1.0");connection.setConnectTimeout(8000);connection.setReadTimeout(8000);connection.setInstanceFollowRedirects(true);
        try{
            int status=connection.getResponseCode();if(status!=200)throw new IOException("Hissi応答 "+status);
            ByteArrayOutputStream out=new ByteArrayOutputStream();try(InputStream input=connection.getInputStream()){byte[] buffer=new byte[8192];int count;while((count=input.read(buffer))!=-1){if(out.size()+count>2*1024*1024)throw new IOException("板一覧のサイズ上限を超えました");out.write(buffer,0,count);}}
            byte[] bytes=out.toByteArray();List<Entry> parsed=parse(HissiHtmlEncoding.decode(bytes));if(parsed.isEmpty())throw new IOException("板一覧を読み取れませんでした");WacchoiPageCache.write(context,file,bytes);return parsed;
        }finally{connection.disconnect();}
    }
    private HissiBoardCatalog(){}
}
