package app.morphe.extension.chmate;

import java.net.URI;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.nio.charset.Charset;

/** Nuko search forms use Windows-31J for both query values and HTML. */
final class NukoArchive {
    private static final java.util.concurrent.ExecutorService IO=java.util.concurrent.Executors.newSingleThreadExecutor();
    static void resolve(android.app.Activity activity,String address,java.util.function.Consumer<String> done){
        IO.execute(()->{String result=null;
            try{URI source=URI.create(address);if(!accepts(address)||!source.getPath().startsWith("/r/-/"))throw new IllegalArgumentException();
                String[] parts=source.getPath().split("/");
                java.net.HttpURLConnection c=(java.net.HttpURLConnection)new java.net.URL("https://n2ch.net/r/-/"+parts[3]+"/"+parts[4]+"/?redirect=t_2ch&guid=ON").openConnection();
                try{c.setConnectTimeout(8000);c.setReadTimeout(8000);c.setInstanceFollowRedirects(false);
                    // Nuko returns an empty 200 for Android's default Dalvik UA,
                    // whereas its browser route supplies the official-thread redirect.
                    c.setRequestProperty("User-Agent","Mozilla/5.0 Haiagaru");
                    c.setRequestProperty("Accept","text/html,application/xhtml+xml");
                    int status=c.getResponseCode();if(status<300||status>=400)throw new java.io.IOException();
                    URI target=URI.create(c.getHeaderField("Location"));String host=target.getHost();
                    if(host!=null&&(host.endsWith(".5ch.io")||host.endsWith(".5ch.net"))&&target.getUserInfo()==null&&target.getPort()==-1
                            &&target.getPath().equals("/test/read.cgi/"+parts[3]+"/"+parts[4]+"/"))
                        result="https://"+host+target.getPath();
                }finally{c.disconnect();}
            }catch(Exception ignored){}
            String resolved=result;activity.runOnUiThread(()->{if(!activity.isFinishing()&&!activity.isDestroyed()){
                if(resolved!=null)done.accept(resolved);else android.widget.Toast.makeText(activity,"元スレのURLを取得できませんでした",android.widget.Toast.LENGTH_SHORT).show();
            }});
        });
    }
    static String query(String word,int page){
        String text=word==null?"":word;
        if(!Charset.forName("Windows-31J").newEncoder().canEncode(text))
            throw new IllegalArgumentException("ぬこで検索できない文字が含まれています");
        try{return "https://n2ch.net/q/-/?q="+URLEncoder.encode(text,"Windows-31J")
                +"&kako=1&p="+Math.max(0,page-1)+"&guid=ON";}
        catch(java.io.UnsupportedEncodingException impossible){throw new AssertionError(impossible);}
    }
    static boolean accepts(String url){
        try{URI u=URI.create(url);return "https".equalsIgnoreCase(u.getScheme())&&"n2ch.net".equalsIgnoreCase(u.getHost())
                &&u.getPort()==-1&&u.getUserInfo()==null&&u.getPath().matches("/(?:q/-/|r/-/[A-Za-z0-9_]+/[0-9]{9,12}/(?:[0-9l-]*)?)");}
        catch(RuntimeException invalid){return false;}
    }
    static String keyword(String url){
        try{String q=URI.create(url).getRawQuery();if(q!=null)for(String part:q.split("&"))
            if(part.startsWith("q="))return URLDecoder.decode(part.substring(2),"Windows-31J");}
        catch(Exception ignored){}return "";
    }
    private NukoArchive(){}
}
