package e.e.a;

import android.net.Uri;
import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.*;

/** Loopback-only playback keeps HLS relative segment/key URIs working with SAF. */
public final class CachePlayback {
    private static ServerSocket server;
    private static final String TOKEN=UUID.randomUUID().toString();
    private static final Map<String,String> roots=new ConcurrentHashMap<>();
    private static final ExecutorService workers=new ThreadPoolExecutor(0,3,30,TimeUnit.SECONDS,new SynchronousQueue<Runnable>(),r->{Thread t=new Thread(r,"nicoid-cache-reader");t.setDaemon(true);return t;});
    public static Uri parse(String value){return Uri.parse(url(value));}
    public static Uri fromFile(File f){return CacheFolders.virtual(f)?parse(f.getAbsolutePath()):Uri.fromFile(f);}
    public static void dataSource(android.media.MediaPlayer p,String value)throws IOException{p.setDataSource(url(value));}
    public static String url(String value) {
        if(value==null)return null;String path=value.startsWith("file://")?Uri.parse(value).getPath():value;
        if(path==null||!path.startsWith("/@nicoid-cache/"))return value;
        File f=new CacheFile(path);String parent=f.getParent();String id=parent.substring("/@nicoid-cache/".length()).split("/",2)[0];roots.put(id,parent);
        try {start();return "http://127.0.0.1:"+server.getLocalPort()+"/"+TOKEN+"/"+id+"/"+Uri.encode(f.getName());}
        catch(IOException e){throw new IllegalStateException("Cannot open cache player",e);}
    }
    private static synchronized void start()throws IOException {
        if(server!=null)return;server=new ServerSocket(0,8,InetAddress.getByName("127.0.0.1"));
        Thread accept=new Thread(()->{while(!server.isClosed())try{Socket s=server.accept();try{workers.execute(()->serve(s));}catch(RejectedExecutionException e){s.close();}}catch(IOException ignored){break;}},"nicoid-cache-server");accept.setDaemon(true);accept.start();
    }
    private static void serve(Socket socket) {
        try(Socket s=socket){s.setSoTimeout(15000);BufferedReader reader=new BufferedReader(new InputStreamReader(s.getInputStream(),StandardCharsets.US_ASCII));
            String first=reader.readLine();if(first==null||first.length()>4096)return;String[] req=first.split(" ");if(req.length!=3)return;boolean head=req[0].equals("HEAD");if(!head&&!req[0].equals("GET")){reply(s,405,0,0,0,"text/plain",false);return;}
            String range=null,line;int lines=0;while((line=reader.readLine())!=null&&!line.isEmpty()){if(++lines>64||line.length()>4096)return;if(line.toLowerCase(Locale.ROOT).startsWith("range:"))range=line.substring(6).trim();}
            String[] parts=req[1].split("/",-1);String name=parts.length==4?Uri.decode(parts[3].split("\\?",2)[0]):"";
            String root=parts.length==4&&parts[1].equals(TOKEN)?roots.get(parts[2]):null;
            if(root==null||name.isEmpty()||name.contains("/")||name.contains("\\")||name.equals("..")){reply(s,404,0,0,0,"text/plain",false);return;}
            File file=new CacheFile(root,name);if(!file.isFile()){reply(s,404,0,0,0,"text/plain",false);return;}
            long size=file.length(),start=0,end=size-1;int status=200;
            if(range!=null){try{if(!range.startsWith("bytes=")||range.contains(","))throw new IllegalArgumentException();String[] r=range.substring(6).split("-",-1);if(r.length!=2)throw new IllegalArgumentException();if(r[0].isEmpty()){long suffix=Long.parseLong(r[1]);if(suffix<=0)throw new IllegalArgumentException();start=Math.max(0,size-suffix);}else{start=Long.parseLong(r[0]);if(!r[1].isEmpty())end=Math.min(end,Long.parseLong(r[1]));}if(start<0||start>=size||end<start)throw new IllegalArgumentException();status=206;}catch(RuntimeException e){reply(s,416,0,0,size,"text/plain",false);return;}}
            long count=Math.max(0,end-start+1);reply(s,status,start,count,size,CacheFolders.mime(name),status==206);
            if(head)return;try(InputStream in=new CacheInputStream(file)){long skip=start;while(skip>0){long n=in.skip(skip);if(n<=0){if(in.read()==-1)throw new EOFException();n=1;}skip-=n;}byte[] b=new byte[65536];OutputStream out=s.getOutputStream();while(count>0){int n=in.read(b,0,(int)Math.min(count,b.length));if(n<0)throw new EOFException();out.write(b,0,n);count-=n;}out.flush();}
        }catch(IOException|RuntimeException e){android.util.Log.w("nicoid-cache","Cached playback request failed");}
    }
    private static void reply(Socket socket,int status,long start,long count,long size,String mime,boolean range)throws IOException {
        String reason=status==200?"OK":status==206?"Partial Content":status==416?"Range Not Satisfiable":status==405?"Method Not Allowed":"Not Found";
        String headers="HTTP/1.1 "+status+" "+reason+"\r\nContent-Type: "+mime+"\r\nContent-Length: "+count+"\r\nAccept-Ranges: bytes\r\nConnection: close\r\n";
        if(range)headers+="Content-Range: bytes "+start+"-"+(start+count-1)+"/"+size+"\r\n";
        if(status==416)headers+="Content-Range: bytes */"+size+"\r\n";
        socket.getOutputStream().write((headers+"\r\n").getBytes(StandardCharsets.US_ASCII));
    }
}
