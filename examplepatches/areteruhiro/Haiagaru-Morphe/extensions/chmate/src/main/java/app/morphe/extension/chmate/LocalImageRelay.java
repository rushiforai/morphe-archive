package app.morphe.extension.chmate;

import android.content.Context;
import android.net.Uri;
import java.io.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;

/** Serves only registered, already-local images; never forwards a network request. */
final class LocalImageRelay {
    private final Context context;
    private final ServerSocket listener;
    private final Map<String,Entry> entries=Collections.synchronizedMap(new LinkedHashMap<String,Entry>(64,.75f,true){
        protected boolean removeEldestEntry(Map.Entry<String,LocalImageRelay.Entry> e){return size()>2048;}
    });
    private final ThreadPoolExecutor workers=new ThreadPoolExecutor(2,2,0,TimeUnit.SECONDS,new ArrayBlockingQueue<>(8),r->{Thread t=new Thread(r,"Haiagaru-local-image");t.setDaemon(true);return t;});
    private final ScheduledExecutorService deadlines=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"Haiagaru-local-image-deadline");t.setDaemon(true);return t;});
    static final class Entry { final Uri uri;final String mime;final long size;
        Entry(Uri uri,String mime,long size){this.uri=uri;this.mime=mime;this.size=size;}}
    LocalImageRelay(Context context)throws IOException {
        this.context=context;listener=new ServerSocket(0,8,InetAddress.getByName("127.0.0.1"));
        HttpsTransport.siteBoardServerListening(listener.getLocalPort(),true);
        Thread accept=new Thread(()->{while(!listener.isClosed())try{
            Socket client=listener.accept();client.setSoTimeout(5000);
            ScheduledFuture<?> deadline=deadlines.schedule(()->{try{client.close();}catch(IOException ignored){}},10,TimeUnit.SECONDS);
            try{workers.execute(()->{try{serve(client);}finally{deadline.cancel(false);}});}catch(RejectedExecutionException busy){deadline.cancel(false);client.close();}
        }catch(IOException closed){break;}},"Haiagaru-local-image-listener");accept.setDaemon(true);accept.start();
    }
    String register(Uri uri,String mime,long size){
        String path="/local-image/"+UUID.randomUUID().toString().replace("-","")+".jpg";
        entries.put(path,new Entry(uri,mime,size));return "http://127.0.0.1:"+listener.getLocalPort()+path;
    }
    void clear(){entries.clear();}
    private void serve(Socket socket){
        try(Socket client=socket){
            InputStream reader=new BufferedInputStream(client.getInputStream());int[] budget={8192};
            String line=line(reader,budget);if(line.length()>1024)return;String[] parts=line.split(" ");
            if(parts.length!=3||!(parts[0].equals("GET")||parts[0].equals("HEAD")))return;
            String host=null;while(!(line=line(reader,budget)).isEmpty()){
                int colon=line.indexOf(':');if(colon<0)return;
                String name=line.substring(0,colon);if(name.equalsIgnoreCase("Host")){if(host!=null)return;host=line.substring(colon+1).trim();}
                if(name.equalsIgnoreCase("Content-Length")||name.equalsIgnoreCase("Transfer-Encoding"))return;
            }
            Entry entry=entries.get(parts[1]);OutputStream out=client.getOutputStream();
            if(!("127.0.0.1:"+listener.getLocalPort()).equals(host)||entry==null){out.write("HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\nConnection: close\r\n\r\n".getBytes("US-ASCII"));return;}
            InputStream source;
            try{source=context.getContentResolver().openInputStream(entry.uri);if(source==null)throw new FileNotFoundException();}
            catch(Exception missing){entries.remove(parts[1]);LocalImageArchive.unavailable(entry.uri);out.write("HTTP/1.1 404 Not Found\r\nContent-Length: 0\r\nConnection: close\r\n\r\n".getBytes("US-ASCII"));return;}
            try(InputStream in=source){
                out.write(("HTTP/1.1 200 OK\r\nContent-Type: "+entry.mime+"\r\nContent-Length: "+entry.size+"\r\nConnection: close\r\nX-Content-Type-Options: nosniff\r\n\r\n").getBytes("US-ASCII"));
                if(parts[0].equals("HEAD"))return;
                byte[] buffer=new byte[16384];long remaining=entry.size;
                while(remaining>0){int n=in.read(buffer,0,(int)Math.min(buffer.length,remaining));if(n<0)break;out.write(buffer,0,n);remaining-=n;}
            }
        }catch(Exception unavailable){/* A moved or revoked file is rechecked on the next index update. */}
    }
    private static String line(InputStream in,int[] budget)throws IOException{
        StringBuilder line=new StringBuilder();while(--budget[0]>=0){int c=in.read();if(c<0)throw new EOFException();
            if(c=='\r'){if(--budget[0]<0||in.read()!='\n')throw new IOException("Invalid header");return line.toString();}
            if(c<32||c>126)throw new IOException("Invalid header");line.append((char)c);
        }throw new IOException("Header too large");
    }
}
