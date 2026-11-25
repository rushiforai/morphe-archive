package nl.johninnl.wuplaycar;

import java.io.*;
import java.net.*;
import java.util.*;
import java.util.regex.*;

/** Bounded metadata reads; never download a video to discover its size. */
public final class StreamRateProbe {
    private StreamRateProbe() {}
    public static Long rate(String url,Map<String,String> headers,Double seconds,Long declaredSize) throws InterruptedException {
        if(!CarStreamPolicy.direct(url))return null;
        String path=URI.create(url).getPath().toLowerCase(Locale.ROOT);
        boolean hls=path.endsWith(".m3u8")||path.endsWith(".m3u"),dash=path.endsWith(".mpd");
        if(dash)return null;
        if(!hls&&declaredSize!=null&&declaredSize>0)return CarStreamPolicy.bitrate(declaredSize,seconds);
        if(!hls&&seconds==null)return null;
        HttpURLConnection connection=null;
        try {
            connection=open(url,headers,"HEAD",false);
            int status=connection.getResponseCode();
            if(status==405||status==501){connection.disconnect();connection=open(url,headers,"GET",true);status=connection.getResponseCode();}
            if(status<200||status>=300)return null;
            String mime=String.valueOf(connection.getContentType()).toLowerCase(Locale.ROOT);
            hls=hls||mime.contains("mpegurl");
            if(hls){connection.disconnect();connection=open(url,headers,"GET",false);if(connection.getResponseCode()!=200)return null;return manifest(connection);}
            if(mime.contains("dash")||mime.contains("html")||mime.contains("json")||mime.startsWith("text/"))return null;
            String range=connection.getHeaderField("Content-Range");Long size=null;
            if(status==206){if(range!=null&&range.matches("bytes \\d+-\\d+/\\d+"))size=Long.valueOf(range.substring(range.indexOf('/')+1));}
            else {String length=connection.getHeaderField("Content-Length");if(length!=null)size=Long.valueOf(length);}
            return CarStreamPolicy.bitrate(size,seconds);
        }catch(IOException|IllegalArgumentException e){return null;}
        finally{if(connection!=null)connection.disconnect();}
    }
    private static HttpURLConnection open(String url,Map<String,String> headers,String method,boolean range) throws IOException,InterruptedException {
        if(Thread.currentThread().isInterrupted())throw new InterruptedException();
        HttpURLConnection connection=(HttpURLConnection)new URL(url).openConnection();
        connection.setConnectTimeout(2000);connection.setReadTimeout(2000);connection.setInstanceFollowRedirects(false);connection.setRequestMethod(method);
        for(Map.Entry<String,String> header:headers.entrySet())connection.setRequestProperty(header.getKey(),header.getValue());
        if(range)connection.setRequestProperty("Range","bytes=0-0");
        return connection;
    }
    private static Long manifest(HttpURLConnection connection) throws IOException,InterruptedException {
        ByteArrayOutputStream out=new ByteArrayOutputStream();
        try(InputStream in=connection.getInputStream()){
            byte[] buffer=new byte[2048];int count;
            while((count=in.read(buffer))!=-1){if(Thread.currentThread().isInterrupted())throw new InterruptedException();if(out.size()+count>65536)return null;out.write(buffer,0,count);}
        }
        String text=out.toString("UTF-8");if(!text.startsWith("#EXTM3U"))return null;
        Matcher matcher=Pattern.compile("(?m)^#EXT-X-STREAM-INF:[^\\r\\n]*?(?<![-A-Z])BANDWIDTH=(\\d+)").matcher(text);
        Long minimum=null;
        while(matcher.find()){try{long rate=Long.parseLong(matcher.group(1));if(rate>0&&(minimum==null||rate<minimum))minimum=rate;}catch(NumberFormatException ignored){}}
        return minimum;
    }
}
