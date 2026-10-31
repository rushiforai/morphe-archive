/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.lyrics;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/** Fixed public origins; no arbitrary URL, credential, cookie or host-key bridge. */
final class LyricsNetwork implements AutoCloseable {
    private static final java.util.concurrent.Semaphore TRANSPORT=new java.util.concurrent.Semaphore(4,true);
    static final class TransportBusy extends IOException {}
    static final class PayloadLimit extends IOException {PayloadLimit(){super("Lyrics response exceeds size limit");}}
    static final class HttpFailure extends IOException {
        final int status;final long retryAfterMs;
        HttpFailure(int status){this(status,null);}
        HttpFailure(int status,String retryAfter){super("HTTP "+status);this.status=status;retryAfterMs=retryAfter(retryAfter);}
    }
    static long retryAfter(String value){
        if(value==null)return 0;
        try{long seconds=Long.parseLong(value.trim());return seconds<=0?0:seconds>Long.MAX_VALUE/1000?Long.MAX_VALUE:seconds*1000;}
        catch(NumberFormatException ignored){try{return Math.max(0,java.time.ZonedDateTime.parse(value,java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME).toInstant().toEpochMilli()-System.currentTimeMillis());}catch(java.time.format.DateTimeParseException invalid){return 0;}}
    }
    static final String BROKER="https://lyrics.api.dacubeking.com/";
    private final Set<HttpURLConnection> connections=ConcurrentHashMap.newKeySet();
    private volatile boolean closed;
    static String encode(String value){try{return URLEncoder.encode(value==null?"":value,"UTF-8");}catch(java.io.UnsupportedEncodingException impossible){throw new AssertionError(impossible);}}
    HttpURLConnection open(String url,String method,String body,String contentType)throws Exception{
        URL parsed=new URL(url);
        if(!"https".equals(parsed.getProtocol())||!java.util.Arrays.asList("lyrics.api.dacubeking.com","api.betterlyrics.org","unison.betterlyrics.org","lrclib.net","translate.googleapis.com").contains(parsed.getHost()))throw new IOException("Unsupported lyrics origin");
        if(closed)throw new IOException("Lyrics request canceled");
        if(!TRANSPORT.tryAcquire())throw new TransportBusy();
        HttpURLConnection connection;try{connection=(HttpURLConnection)parsed.openConnection();}catch(Exception failure){TRANSPORT.release();throw failure;}
        connections.add(connection);
        if(closed){release(connection);throw new IOException("Lyrics request canceled");}
        try{
            connection.setConnectTimeout(8000);connection.setReadTimeout(18000);connection.setInstanceFollowRedirects(false);
            connection.setRequestProperty("User-Agent","BDCrusher-YTMusic-Lyrics/0.1 (personal Android client)");
            connection.setRequestProperty("Accept","application/json, text/event-stream");connection.setRequestMethod(method);
            if(body!=null){byte[] bytes=body.getBytes(StandardCharsets.UTF_8);connection.setDoOutput(true);connection.setRequestProperty("Content-Type",contentType);connection.setFixedLengthStreamingMode(bytes.length);try(var out=connection.getOutputStream()){out.write(bytes);}}
        }
        catch(Exception failure){release(connection);throw failure;}
        if(closed){release(connection);throw new IOException("Lyrics request canceled");}
        return connection;
    }
    String request(String url,String method,String body,String type)throws Exception{
        HttpURLConnection connection=open(url,method,body,type);
        try{
            int code=connection.getResponseCode();
            if(code!=200)throw new HttpFailure(code,connection.getHeaderField("Retry-After"));
            try(InputStream input=connection.getInputStream();ByteArrayOutputStream out=new ByteArrayOutputStream()){
                byte[] buffer=new byte[8192];int count,total=0;
                while((count=input.read(buffer))!=-1){total+=count;if(total>4*1024*1024)throw new PayloadLimit();if(closed||Thread.currentThread().isInterrupted())throw new IOException("Lyrics request canceled");out.write(buffer,0,count);}
                return new String(out.toByteArray(),StandardCharsets.UTF_8);
            }
        }finally{release(connection);}
    }
    void release(HttpURLConnection connection){if(connections.remove(connection)){connection.disconnect();TRANSPORT.release();}}
    @Override public void close(){closed=true;for(HttpURLConnection connection:new java.util.ArrayList<>(connections))release(connection);}
}
