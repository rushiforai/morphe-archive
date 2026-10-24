package e.e.a;

import java.io.*;
import java.net.*;
import java.lang.reflect.*;
import java.nio.charset.StandardCharsets;

/** Keep playback API connections scoped to the request, including failure and redirects. */
public final class PlaybackRequest217 {
    private static final int LIMIT=32*1024*1024;
    private PlaybackRequest217(){}
    private static void validate(URL url)throws IOException {
        String host=url.getHost().toLowerCase(java.util.Locale.ROOT);
        if(!"https".equals(url.getProtocol())||url.getUserInfo()!=null||
            !(host.equals("nicovideo.jp")||host.endsWith(".nicovideo.jp")))
            throw new IOException("Unsupported playback API URL");
    }
    public static String request(Object owner,String address,String body,String token)throws Exception {
        URL url=new URL(address);validate(url);String originHost=url.getHost();
        Object store=owner.getClass().getField("I").get(owner);
        String cookie=(String)Class.forName("e.e.a.v0").getMethod("a",Class.forName("org.apache.http.client.CookieStore")).invoke(null,store);
        Method capture=Class.forName("e.e.a.ModernPlayback").getDeclaredMethod("captureCookie",HttpURLConnection.class);capture.setAccessible(true);
        for(int redirects=0;;redirects++) {
            validate(url);
            HttpURLConnection c=(HttpURLConnection)url.openConnection();
            try {
                c.setConnectTimeout(8000);c.setReadTimeout(8000);c.setInstanceFollowRedirects(false);
                c.setRequestProperty("User-Agent","Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36");
                c.setRequestProperty("X-Frontend-Id","6");c.setRequestProperty("X-Frontend-Version","0");
                c.setRequestProperty("Origin","https://www.nicovideo.jp");c.setRequestProperty("Referer","https://www.nicovideo.jp/");
                if(cookie!=null&&!cookie.isEmpty())c.setRequestProperty("Cookie",cookie);
                if(body!=null) {
                    c.setRequestMethod("POST");c.setDoOutput(true);c.setRequestProperty("Accept","application/json;charset=utf-8");
                    c.setRequestProperty("Content-Type",url.getPath().contains("/v1/threads")?"application/json;charset=UTF-8":"application/json");
                    c.setRequestProperty("X-Request-With","https://www.nicovideo.jp");c.setRequestProperty("X-Client-Os-Type","others");
                    if(token!=null&&originHost.equalsIgnoreCase(url.getHost()))c.setRequestProperty("X-Access-Right-Key",token);
                    byte[] payload=body.getBytes(StandardCharsets.UTF_8);c.setFixedLengthStreamingMode(payload.length);
                    try(OutputStream out=c.getOutputStream()){out.write(payload);}
                }
                int status=c.getResponseCode();
                if(status==301||status==302||status==303||status==307||status==308) {
                    String location=c.getHeaderField("Location");
                    if(redirects>=5||location==null)throw new IOException("Playback API redirect failed");
                    URL next=new URL(url,location);validate(next);
                    if(status==303||status==301||status==302)body=null;
                    url=next;continue;
                }
                capture.invoke(null,c);
                InputStream response=status>=400?c.getErrorStream():null;
                if(response==null)response=c.getInputStream();
                try(InputStream input=response;ByteArrayOutputStream bytes=new ByteArrayOutputStream()) {
                    if(c.getContentLengthLong()>LIMIT)throw new IOException("Playback API response too large");
                    byte[] buffer=new byte[8192];
                    for(int n;(n=input.read(buffer))!=-1;){
                        if(Thread.currentThread().isInterrupted())throw new InterruptedIOException("Playback API cancelled");
                        if(bytes.size()+n>LIMIT)throw new IOException("Playback API response too large");
                        bytes.write(buffer,0,n);
                    }
                    return bytes.toString("UTF-8");
                }
            } finally {c.disconnect();}
        }
    }
}
